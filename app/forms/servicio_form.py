# app/forms/servicio_form.py
from flask_wtf import FlaskForm
from flask_wtf.recaptcha import RecaptchaField
from wtforms import StringField, SelectField, TextAreaField, SubmitField
from wtforms.validators import DataRequired, Email, Length

class ServicioForm(FlaskForm):
    nombre = StringField(
        'Tu nombre',
        validators=[DataRequired(), Length(max=100)]
    )
    correo = StringField(
        'Tu correo',
        validators=[DataRequired(), Email(), Length(max=100)]
    )
    # Lista de áreas cargada dinámicamente en la ruta
    area = SelectField(
        'Área',
        coerce=int,
        choices=[],
        validators=[DataRequired()]
    )
    # Lista de servicios cargada según el área seleccionada
    servicio = SelectField(
        'Servicio',
        coerce=int,
        choices=[],
        validators=[DataRequired()]
    )
    detalle = TextAreaField(
        'Detalle de la solicitud',
        validators=[DataRequired(), Length(min=10, max=1000)]
    )
    recaptcha = RecaptchaField()
    submit = SubmitField('Enviar Solicitud')
