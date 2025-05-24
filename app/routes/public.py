from flask import Blueprint, render_template
from app.models.cliente import Cliente 
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
    return render_template('clientes.html', clientes=lista_clientes)  # <-- aquí estaba el error


@public_bp.route('/servicios')
def servicios():
    return render_template('servicios.html')

@public_bp.route('/producto')
def productos():
    return render_template('producto.html')

@public_bp.route('/casos_exito')
def casos_exito():
    return render_template('casos_exito.html')

@public_bp.route('/contactos')
def contactos():
    return render_template('contactos.html')

@public_bp.route('/socios')
def socios():
    return render_template('socios.html')


