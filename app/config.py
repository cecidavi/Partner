import os

class Config:
    raw_url = os.environ.get(
        "DATABASE_URL",
        "mysql+pymysql://cecilio:ceci1282@localhost/parnet_db"
    )

    # Asegura compatibilidad con SQLAlchemy usando pymysql
    if raw_url.startswith("mysql://"):
        raw_url = raw_url.replace("mysql://", "mysql+pymysql://", 1)

    SQLALCHEMY_DATABASE_URI = raw_url
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = os.environ.get("SECRET_KEY", "1234")
    RECAPTCHA_PUBLIC_KEY  = os.environ.get("RECAPTCHA_PUBLIC_KEY", "6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI")
    RECAPTCHA_PRIVATE_KEY = os.environ.get("RECAPTCHA_PRIVATE_KEY", "6LeIxAcTAAAAAGG-vFI1TnRWxMZNFuojJ4WifJWe")
