# app/models/servicio.py

from app import db
from datetime import datetime

class Servicio(db.Model):
    __tablename__ = 'servicios'

    id          = db.Column(db.Integer, primary_key=True)
    nombre      = db.Column(db.String(100), nullable=False)
    descripcion = db.Column(db.Text, nullable=True)
    creado_en   = db.Column(db.DateTime, default=datetime.utcnow)

    # Nueva columna FK a areas.id
    area_id     = db.Column(db.Integer, db.ForeignKey('areas.id'), nullable=False)
    area        = db.relationship('Area', back_populates='servicios')

    # Relación inversa con SolicitudServicio
    solicitudes = db.relationship(
        'SolicitudServicio',
        back_populates='servicio',
        cascade='all, delete-orphan'
    )
