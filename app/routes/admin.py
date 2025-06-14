# app/routes/admin.py

from flask import (
    Blueprint, render_template, redirect, url_for, flash,
    request, send_file
)
from app.forms.register_form import RegisterForm
from app.forms.producto_form import ProductoForm
from app.models.usuario import Usuario
from sqlalchemy import func
from app.models.solicitud_servicio import SolicitudServicio
from app.models.area import Area
from app.models.servicio import Servicio
from app.models.producto import Producto
from app.models.sugerencia import Sugerencia
from werkzeug.security import generate_password_hash
from app.utils.auth import login_required
from app import db

import io
import pandas as pd
import requests
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, Image as RLImage
from reportlab.lib.pagesizes import letter
from reportlab.lib import colors

admin_bp = Blueprint('admin', __name__)

# — Panel principal —
@admin_bp.route('/')
@login_required
def admin_home():
    return render_template('admin/admin.html')


# — Usuarios —
@admin_bp.route('/crear-usuario', methods=['GET', 'POST'])
@login_required
def crear_usuario():
    form = RegisterForm()
    if form.validate_on_submit():
        nuevo = Usuario(
            nombre=form.nombre.data,
            correo=form.correo.data,
            password_hash=generate_password_hash(form.password.data),
            rol=form.rol.data
        )
        db.session.add(nuevo)
        db.session.commit()
        flash('Usuario creado exitosamente.', 'success')
        return redirect(url_for('admin.admin_home'))
    return render_template('admin/crear_usuario.html', form=form)


# — CRUD Productos —
@admin_bp.route('/productos', methods=['GET', 'POST'])
@login_required
def productos_admin():
    form = ProductoForm()
    productos = Producto.query.order_by(Producto.id.desc()).all()
    if form.validate_on_submit():
        nuevo = Producto(
            nombre=form.nombre.data,
            descripcion=form.descripcion.data,
            imagen_url=form.imagen_url.data,
            precio=form.precio.data,
            estatus=form.estatus.data
        )
        db.session.add(nuevo)
        db.session.commit()
        flash('Producto agregado exitosamente.', 'success')
        return redirect(url_for('admin.productos_admin'))
    return render_template('admin/productos_admin.html', form=form, productos=productos)


@admin_bp.route('/productos/<int:producto_id>/editar', methods=['GET', 'POST'])
@login_required
def editar_producto(producto_id):
    producto = Producto.query.get_or_404(producto_id)
    form = ProductoForm(obj=producto)
    if form.validate_on_submit():
        producto.nombre      = form.nombre.data
        producto.descripcion = form.descripcion.data
        producto.imagen_url  = form.imagen_url.data
        producto.precio      = form.precio.data
        producto.estatus     = form.estatus.data
        db.session.commit()
        flash('Producto actualizado correctamente.', 'success')
        return redirect(url_for('admin.productos_admin'))
    return render_template('admin/editar_producto.html', form=form, producto=producto)


@admin_bp.route('/productos/<int:producto_id>/eliminar', methods=['POST'])
@login_required
def eliminar_producto(producto_id):
    producto = Producto.query.get_or_404(producto_id)
    db.session.delete(producto)
    db.session.commit()
    flash('Producto eliminado.', 'info')
    return redirect(url_for('admin.productos_admin'))


# — Exportar Productos a Excel —
@admin_bp.route('/productos/export_excel')
@login_required
def export_productos_excel():
    productos = Producto.query.order_by(Producto.id.desc()).all()
    data = [{
        'ID': p.id,
        'Nombre': p.nombre,
        'Descripción': p.descripcion,
        'Precio': float(p.precio),
        'Estatus': p.estatus
    } for p in productos]
    df = pd.DataFrame(data)
    salida = io.BytesIO()
    df.to_excel(salida, index=False, engine='openpyxl')
    salida.seek(0)
    return send_file(
        salida,
        download_name='productos_listado.xlsx',
        as_attachment=True,
        mimetype='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    )


# — Exportar Productos a PDF (con miniaturas) —
@admin_bp.route('/productos/export_pdf')
@login_required
def export_productos_pdf():
    productos = Producto.query.order_by(Producto.id).all()

    # Preparamos los datos con encabezado de columnas
    data = [['Imagen', 'ID', 'Nombre', 'Descripción', 'Precio', 'Estatus']]

    for p in productos:
        # Intentamos descargar la imagen desde la URL
        img_flowable = ''
        if p.imagen_url:
            try:
                resp = requests.get(p.imagen_url, timeout=5)
                resp.raise_for_status()
                buf = io.BytesIO(resp.content)
                # Creamos el flowable, escalando a 50×50px
                img_flowable = RLImage(buf, width=50, height=50)
            except Exception:
                img_flowable = ''

        data.append([
            img_flowable,
            p.id,
            p.nombre,
            p.descripcion,
            f"${p.precio:.2f}",
            p.estatus
        ])

    # Generamos el PDF
    buffer = io.BytesIO()
    doc = SimpleDocTemplate(buffer, pagesize=letter)
    # Ajustamos anchos de columna para que quepa todo
    table = Table(data, colWidths=[60, 30, 100, 180, 60, 60], repeatRows=1)
    table.setStyle(TableStyle([
        ('BACKGROUND', (0,0), (-1,0), colors.HexColor('#1e3c72')),
        ('TEXTCOLOR',  (0,0), (-1,0), colors.white),
        ('GRID',       (0,0), (-1,-1), 0.5, colors.grey),
        ('VALIGN',     (0,0), (-1,-1), 'MIDDLE'),
        ('ALIGN',      (1,0), (-1,-1), 'CENTER'),
    ]))

    doc.build([table])
    buffer.seek(0)

    return send_file(
        buffer,
        download_name='productos_listado_con_imagenes.pdf',
        as_attachment=True,
        mimetype='application/pdf'
    )


# — Sugerencias —
@admin_bp.route('/sugerencias')
@login_required
def lista_sugerencias():
    page     = request.args.get('page', 1, type=int)
    per_page = 10
    pagination = Sugerencia.query \
        .order_by(Sugerencia.fecha.desc()) \
        .paginate(page=page, per_page=per_page, error_out=False)
    return render_template(
        'admin/lista_sugerencias.html',
        sugerencias=pagination.items,
        pagination=pagination
    )


# — Exportar Sugerencias a Excel —
@admin_bp.route('/sugerencias/export/excel')
@login_required
def exportar_sugerencias_excel():
    todas = Sugerencia.query.order_by(Sugerencia.fecha).all()
    df = pd.DataFrame([{
        'ID':     s.id,
        'Nombre': s.nombre,
        'Mensaje': s.mensaje,
        'Fecha':  s.fecha.strftime('%Y-%m-%d %H:%M')
    } for s in todas])
    salida = io.BytesIO()
    df.to_excel(salida, index=False, engine='openpyxl')
    salida.seek(0)
    return send_file(
        salida,
        download_name='sugerencias.xlsx',
        as_attachment=True,
        mimetype='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    )


# — Exportar Sugerencias a PDF —
@admin_bp.route('/sugerencias/export/pdf')
@login_required
def exportar_sugerencias_pdf():
    todas = Sugerencia.query.order_by(Sugerencia.fecha).all()
    buffer = io.BytesIO()
    doc = SimpleDocTemplate(buffer, pagesize=letter)
    data = [['ID', 'Nombre', 'Mensaje', 'Fecha']] + [
        [s.id, s.nombre, s.mensaje, s.fecha.strftime('%Y-%m-%d %H:%M')]
        for s in todas
    ]
    table = Table(data)
    doc.build([table])
    buffer.seek(0)
    return send_file(
        buffer,
        download_name='sugerencias.pdf',
        as_attachment=True,
        mimetype='application/pdf'
    )


@admin_bp.route('/dashboard')
@login_required
def dashboard():
    # Conteo de solicitudes por área
    service_stats = (
        db.session.query(Area.nombre, func.count(SolicitudServicio.id))
                  .join(Servicio, Servicio.area_id == Area.id)
                  .join(SolicitudServicio, SolicitudServicio.servicio_id == Servicio.id)
                  .group_by(Area.nombre)
                  .all()
    )
    # Conteo de productos por estatus
    product_stats = (
        db.session.query(Producto.estatus, func.count(Producto.id))
                  .group_by(Producto.estatus)
                  .all()
    )
    return render_template(
        'admin/dashboard.html',
        service_stats=service_stats,
        product_stats=product_stats
    )
