# app/models/solicitud_servicio.py

from app import db
from datetime import datetime

class SolicitudServicio(db.Model):
    __tablename__ = 'solicitudes_servicio'
    id              = db.Column(db.Integer, primary_key=True)
    nombre_cliente  = db.Column(db.String(100), nullable=False)
    correo_cliente  = db.Column(db.String(100), nullable=False)
    servicio_id     = db.Column(db.Integer, db.ForeignKey('servicios.id'), nullable=False)
    servicio        = db.relationship('Servicio', back_populates='solicitudes')
    detalle         = db.Column(db.Text, nullable=True)
    fecha_solicitud = db.Column(
        'fecha_solicitud',                 # nombre de la columna en la tabla
        db.DateTime,
        default=datetime.utcnow
    )
