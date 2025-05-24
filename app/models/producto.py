from app import db
from datetime import datetime

class Producto(db.Model):
    __tablename__ = 'productos'
    __table_args__ = {'extend_existing': True}

    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(100), nullable=False)
    descripcion = db.Column(db.Text)
    imagen_url = db.Column(db.Text)
    precio = db.Column(db.Numeric(10,2))
    estatus = db.Column(db.Enum('existencia', 'agotado'), default='existencia')
    creado_en = db.Column(db.DateTime, default=datetime.utcnow)
