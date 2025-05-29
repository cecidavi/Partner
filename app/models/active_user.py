from app import db
from datetime import datetime

class ActiveUser(db.Model):
    __tablename__ = 'active_users'
    session_id = db.Column(db.String(36), primary_key=True)
    last_seen  = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
