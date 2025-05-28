# app/routes/public.py
from flask import Blueprint, render_template, request, redirect, url_for, flash
from app.models.cliente import Cliente 
from app.models.producto import Producto
from app.forms.servicio_form import ServicioForm
from app.models.solicitud_servicio import SolicitudServicio
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

@public_bp.route('/servicios', methods=['GET','POST'])
def servicios():
    form = ServicioForm()
    if form.validate_on_submit():
        req = SolicitudServicio(
            nombre_cliente = form.nombre.data,
            correo_cliente = form.correo.data,
            servicio_id    = None,              # o un mapeo si quieres FK
            detalle        = form.detalle.data
        )
        db.session.add(req)
        db.session.commit()
        flash('¡Solicitud de servicio enviada!', 'success')
        return redirect(url_for('public.servicios'))
    return render_template('servicios.html', form=form)

@public_bp.route('/producto')
def productos():
    q = request.args.get('q', '')
    if q:
        productos = Producto.query.filter(Producto.nombre.ilike(f'%{q}%')).all()
    else:
        productos = Producto.query.all()
    return render_template('producto.html', productos=productos)

@public_bp.route('/casos_exito')
def casos_exito():
    return render_template('casos_exito.html')

@public_bp.route('/contactos', methods=['GET', 'POST'])
def contactos():
    if request.method == 'POST':
        nombre  = request.form.get('nombre')
        correo  = request.form.get('correo')
        mensaje = request.form.get('mensaje')

        # guardar
        nuevo = Contacto(nombre=nombre, correo=correo, mensaje=mensaje)
        db.session.add(nuevo)
        db.session.commit()

        flash('¡Tu mensaje ha sido enviado!', 'success')
        return redirect(url_for('public.contactos'))

    return render_template('contactos.html')

@public_bp.route('/socios')
def socios():
    return render_template('socios.html')
