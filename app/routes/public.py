# app/routes/public.py

from flask import (
    Blueprint, render_template, request,
    redirect, url_for, flash, send_file,
    session
)
from io import BytesIO
from app import db 
from datetime import datetime, timedelta
from uuid import uuid4
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from app.models.cliente import Cliente
from app.models.producto import Producto
from app.models.noticia import Noticia
from app.forms.servicio_form import ServicioForm
from app.models.solicitud_servicio import SolicitudServicio
from app.models.servicio import Servicio
from app.models.contacto import Contacto
from app.models.area import Area

public_bp = Blueprint('public', __name__)

# — Contadores en memoria —
_visits = 0
_active_sessions = {}  # uid -> last_seen datetime

@public_bp.before_app_request
def track_visit_and_session():
    global _visits, _active_sessions
    # Solo contamos rutas de este blueprint
    if request.blueprint != 'public':
        return

    now = datetime.utcnow()

    # 1) Contador de visita
    _visits += 1

    # 2) Asegura un UID único por sesión
    if 'uid' not in session:
        session['uid'] = str(uuid4())
    uid = session['uid']

    # 3) Marca esta sesión como activa
    _active_sessions[uid] = now

    # 4) Limpia sesiones inactivas (>5 min)
    cutoff = now - timedelta(minutes=5)
    for u, last in list(_active_sessions.items()):
        if last < cutoff:
            del _active_sessions[u]

@public_bp.context_processor
def inject_globals():
    noticias = Noticia.query.order_by(Noticia.fecha.desc()).limit(5).all()
    return dict(
        noticias=noticias,
        visits_count=_visits,
        active_users_count=len(_active_sessions)
    )

@public_bp.route('/')
def index():
    return render_template('index.html')

@public_bp.route('/quienes_somos')
def quienes_somos():
    return render_template('quienes_somos.html')

@public_bp.route('/clientes')
def clientes():
    return render_template(
        'clientes.html',
        clientes=Cliente.query.all()
    )

@public_bp.route('/servicios', methods=['GET', 'POST'])
def servicios():
    form = ServicioForm()

    # 1) Cargo todas las áreas desde la BD
    areas = Area.query.order_by(Area.nombre).all()
    form.area.choices = [(a.id, a.nombre) for a in areas]

    # 2) Si es GET y hay áreas, precargo la primera para que no esté vacío:
    if request.method == 'GET' and areas:
        form.area.data = areas[0].id

    # 3) Según el área seleccionada (ya disponible en form.area.data), busco los servicios
    servicios_ofrecidos = Servicio.query \
        .filter_by(area_id=form.area.data) \
        .order_by(Servicio.nombre) \
        .all()

    # 4) Relleno las choices del segundo SelectField
    form.servicio.choices = [(s.id, s.nombre) for s in servicios_ofrecidos]

    # 5) Procesamiento POST: al enviar el formulario guardo la solicitud
    if form.validate_on_submit():
        nueva = SolicitudServicio(
            nombre_cliente=form.nombre.data,
            correo_cliente=form.correo.data,
            servicio_id=form.servicio.data,
            detalle=form.detalle.data
        )
        db.session.add(nueva)
        db.session.commit()
        flash('¡Solicitud de servicio enviada!', 'success')
        return redirect(url_for('public.servicios'))

    # Finalmente, renderizo con ambos listados correctos
    return render_template(
        'servicios.html',
        form=form,
        servicios_ofrecidos=servicios_ofrecidos
    )
@public_bp.route('/contactos', methods=['GET', 'POST'])
def contactos():
    if request.method == 'POST':
        db.session.add(Contacto(
            nombre=request.form['nombre'],
            correo=request.form['correo'],
            mensaje=request.form['mensaje']
        ))
        db.session.commit()
        flash('¡Tu mensaje ha sido enviado!', 'success')
        return redirect(url_for('public.contactos'))
    return render_template('contactos.html')

@public_bp.route('/producto')
def productos():
    q = request.args.get('q', '')
    productos = (Producto.query
                    .filter(Producto.nombre.ilike(f'%{q}%'))
                    .all() if q else
                Producto.query.all())
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
