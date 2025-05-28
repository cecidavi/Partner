# app/forms/servicio_form.py
from flask_wtf import FlaskForm, RecaptchaField
from wtforms import StringField, SelectField, TextAreaField, SubmitField
from wtforms.validators import DataRequired, Email, Length

class ServicioForm(FlaskForm):
    nombre = StringField('Tu nombre', validators=[DataRequired(), Length(max=100)])
    correo = StringField('Tu correo', validators=[DataRequired(), Email(), Length(max=100)])
    area = SelectField('Área', choices=[
        ('certificaciones','Certificaciones'),
        ('consultoria','Consultoría'),
        ('desarrollo','Desarrollo'),
        ('infraestructura','Infraestructura'),
        ('mantenimiento','Mantenimiento'),
        ('soporte','Soporte'),
        ('otro','Otro')
    ], validators=[DataRequired()])
    detalle = TextAreaField('Detalle de la solicitud',
        validators=[DataRequired(), Length(min=10, max=1000)])
    recaptcha = RecaptchaField()
    submit    = SubmitField('Enviar Solicitud')
    