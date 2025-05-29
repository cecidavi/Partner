# app/routes/public.py

from flask import (
    Blueprint, render_template, request, redirect,
    url_for, flash, send_file, session
)
from io import BytesIO
from datetime import datetime, timedelta
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from app import db
from app.models.cliente import Cliente
from app.models.producto import Producto
from app.models.visita import Visita
from app.models.noticia import Noticia
from app.forms.servicio_form import ServicioForm
from app.models.solicitud_servicio import SolicitudServicio
from app.models.servicio import Servicio
from app.models.contacto import Contacto

public_bp = Blueprint('public', __name__)

# — Registrar cada nueva sesión como visita —
@public_bp.before_app_request
def track_visita():
    if not session.get('visitada'):
        ip = request.remote_addr or '0.0.0.0'
        nueva = Visita(ip_usuario=ip, fecha=datetime.utcnow())
        db.session.add(nueva)
        db.session.commit()
        session['visitada'] = True

# — Inyectar noticias y estadísticas en todas las plantillas —
@public_bp.context_processor
def inject_globals():
    # Últimas 5 noticias
    noticias = Noticia.query.order_by(Noticia.fecha.desc()).limit(5).all()

    # Total de visitas (número de registros en la tabla)
    visits_count = Visita.query.count()

    # Usuarios “activos”: IPs distintas en los últimos 5 minutos
    cutoff = datetime.utcnow() - timedelta(minutes=5)
    active_users_count = (
        db.session.query(Visita.ip_usuario)
                  .filter(Visita.fecha >= cutoff)
                  .distinct()
                  .count()
    )

    return dict(
        noticias=noticias,
        visits_count=visits_count,
        active_users_count=active_users_count
    )

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
    return render_template(
        'servicios.html',
        servicios_ofrecidos=servicios_ofrecidos,
        form=form
    )

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
        productos = Producto.query.filter(
            Producto.nombre.ilike(f'%{q}%')
        ).all()
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
