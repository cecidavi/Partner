from flask_wtf import FlaskForm
from wtforms import StringField, DecimalField, SelectField, SubmitField
from wtforms.validators import DataRequired

class ProductoForm(FlaskForm):
    nombre = StringField('Nombre', validators=[DataRequired()])
    descripcion = StringField('Descripción')
    imagen_url = StringField('URL de Imagen')
    precio = DecimalField('Precio', places=2, validators=[DataRequired()])
    estatus = SelectField('Estatus', choices=[('existencia', 'En existencia'), ('agotado', 'Agotado')])
    submit = SubmitField('Agregar Producto')
