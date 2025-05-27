from flask_wtf import FlaskForm, RecaptchaField
from wtforms import StringField, TextAreaField, SubmitField
from wtforms.validators import DataRequired, Length

class SugerenciaForm(FlaskForm):
    nombre = StringField(
        'Nombre',
        validators=[DataRequired(message="El nombre es obligatorio"),
                    Length(max=100)]
    )
    mensaje = TextAreaField(
        'Mensaje',
        validators=[DataRequired(message="El mensaje no puede ir vacío"),
                    Length(max=500)]
    )
    recaptcha = RecaptchaField()
    submit = SubmitField('Enviar Sugerencia')
