from app import db
from datetime import datetime

class Visita(db.Model):
    __tablename__ = 'visitas'
    __table_args__ = {'extend_existing': True}

    id = db.Column(db.Integer, primary_key=True)
    ip_usuario = db.Column(db.String(45))
    fecha = db.Column(db.DateTime, default=datetime.utcnow)
