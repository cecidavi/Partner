# app/routes/public.py

from flask import Blueprint, render_template, request, redirect, url_for, flash, send_file
from io import BytesIO
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from app.models.cliente import Cliente 
from app.models.producto import Producto
from app.forms.servicio_form import ServicioForm
from app.models.solicitud_servicio import SolicitudServicio
from app.models.servicio import Servicio
from app.models.contacto import Contacto  
from app import db

public_bp = Blueprint('public', __name__)

@public_bp.route('/')
def index():
    return render_template('index.html')

@public_bp.route('/quienes_somos')
def quienes_somos():
    return render_template('quienes_somos.html')

@public_bp.route('/clientes')
def clientes():
    lista_clientes = Cliente.query.all()
    return render_template('clientes.html', clientes=lista_clientes)

@public_bp.route('/servicios', methods=['GET', 'POST'])
def servicios():
    servicios_ofrecidos = Servicio.query.order_by(Servicio.nombre).all()
    form = ServicioForm()
    form.area.choices = [(s.id, s.nombre) for s in servicios_ofrecidos]
    if form.validate_on_submit():
        solicitud = SolicitudServicio(
            nombre_cliente=form.nombre.data,
            correo_cliente=form.correo.data,
            servicio_id=form.area.data,
            detalle=form.detalle.data
        )
        db.session.add(solicitud)
        db.session.commit()
        flash('¡Solicitud de servicio enviada!', 'success')
        return redirect(url_for('public.servicios'))
    return render_template('servicios.html', servicios_ofrecidos=servicios_ofrecidos, form=form)

@public_bp.route('/contactos', methods=['GET', 'POST'])
def contactos():
    if request.method == 'POST':
        nuevo = Contacto(
            nombre=request.form['nombre'],
            correo=request.form['correo'],
            mensaje=request.form['mensaje']
        )
        db.session.add(nuevo)
        db.session.commit()
        flash('¡Tu mensaje ha sido enviado!', 'success')
        return redirect(url_for('public.contactos'))
    return render_template('contactos.html')

@public_bp.route('/producto')
def productos():
    q = request.args.get('q', '')
    if q:
        productos = Producto.query.filter(Producto.nombre.ilike(f'%{q}%')).all()
    else:
        productos = Producto.query.all()
    return render_template('producto.html', productos=productos)

@public_bp.route('/producto/<int:producto_id>')
def producto_detalle(producto_id):
    prod = Producto.query.get_or_404(producto_id)
    return render_template('producto_detalle.html', producto=prod)

@public_bp.route('/producto/<int:producto_id>/export_pdf')
def export_producto_pdf(producto_id):
    prod = Producto.query.get_or_404(producto_id)
    buffer = BytesIO()
    p = canvas.Canvas(buffer, pagesize=letter)
    p.setTitle(f"Ficha_{prod.nombre}")
    p.setFont("Helvetica-Bold", 16)
    p.drawString(40, 750, f"Ficha Técnica de Producto: {prod.nombre}")
    p.setFont("Helvetica", 12)
    y = 720
    for line in [
        f"ID: {prod.id}",
        f"Nombre: {prod.nombre}",
        f"Descripción: {prod.descripcion}",
        f"Precio: ${prod.precio:.2f}",
        f"Estatus: {prod.estatus}"
    ]:
        p.drawString(50, y, line)
        y -= 20
    p.showPage()
    p.save()
    buffer.seek(0)
    return send_file(
        buffer,
        as_attachment=True,
        download_name=f"ficha_{prod.id}.pdf",
        mimetype='application/pdf'
    )

@public_bp.route('/casos_exito')
def casos_exito():
    return render_template('casos_exito.html')

@public_bp.route('/socios')
def socios():
    return render_template('socios.html')
