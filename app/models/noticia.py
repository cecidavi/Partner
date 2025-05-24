from app import db
from datetime import datetime

class Noticia(db.Model):
    __tablename__ = 'noticias'
    __table_args__ = {'extend_existing': True}

    id = db.Column(db.Integer, primary_key=True)
    titulo = db.Column(db.String(150), nullable=False)
    nota = db.Column(db.Text)
    fecha = db.Column(db.DateTime, default=datetime.utcnow)
