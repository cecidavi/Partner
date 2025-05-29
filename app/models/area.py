# app/models/area.py

from app import db

class Area(db.Model):
    __tablename__ = 'areas'

    id     = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(100), nullable=False)

    # Relación con Servicio
    servicios = db.relationship(
        'Servicio',
        back_populates='area',
        cascade='all, delete-orphan'
    )
