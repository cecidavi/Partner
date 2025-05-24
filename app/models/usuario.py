from app import db
from datetime import datetime

class Usuario(db.Model):
    __tablename__ = 'usuarios'
    __table_args__ = {'extend_existing': True}

    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(100), nullable=False)
    correo = db.Column(db.String(100), nullable=False, unique=True)
    password_hash = db.Column(db.Text, nullable=False)
    rol = db.Column(db.Enum('admin', 'publico'), nullable=False)
    creado_en = db.Column(db.DateTime, default=datetime.utcnow)
