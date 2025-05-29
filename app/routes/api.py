# app/routes/api.py
from flask import Blueprint, jsonify
from app.models.producto import Producto

api_bp = Blueprint('api', __name__, url_prefix='/api')

@api_bp.route('/productos', methods=['GET'])
def get_productos():
    productos = Producto.query.all()
    return jsonify([{
        'id': p.id,
        'nombre': p.nombre,
        'precio': float(p.precio),
        'estatus': p.estatus
    } for p in productos])
