from app import db

class Cliente(db.Model):
    __tablename__ = 'clientes'
    __table_args__ = {'extend_existing': True}

    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(100))
    logo_url = db.Column(db.Text)
    link = db.Column(db.Text)
