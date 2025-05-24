from app import db
from datetime import datetime

class SolicitudServicio(db.Model):
    __tablename__ = 'solicitudes_servicio'
    __table_args__ = {'extend_existing': True}

    id = db.Column(db.Integer, primary_key=True)
    nombre_cliente = db.Column(db.String(100), nullable=False)
    correo_cliente = db.Column(db.String(100))
    servicio_id = db.Column(db.Integer, db.ForeignKey('servicios.id'))
    detalle = db.Column(db.Text)
    fecha_solicitud = db.Column(db.DateTime, default=datetime.utcnow)
