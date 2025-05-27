from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from .config import Config

db = SQLAlchemy()

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)

    db.init_app(app)

    # Registrar blueprints
    from app.routes.public import public_bp
    from app.routes.admin import admin_bp
    from app.routes.auth import auth_bp
    from app.routes.areas_p import areas_p_bp
    app.register_blueprint(public_bp)
    app.register_blueprint(admin_bp, url_prefix="/admin")
    app.register_blueprint(auth_bp)
    app.register_blueprint(areas_p_bp)

    return app
