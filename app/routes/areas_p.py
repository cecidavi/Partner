# app/routes/areas_p.py
from flask import Blueprint, render_template, redirect, url_for, flash
from app.models.sugerencia import Sugerencia
from app.forms.sugerencia_form import SugerenciaForm
from app import db

areas_p_bp = Blueprint(
    'areas_p',
    __name__,
    url_prefix='/areas'
)

@areas_p_bp.route('/sugerencias', methods=['GET', 'POST'])
def sugerencias():
    form = SugerenciaForm()
    if form.validate_on_submit():
        nueva = Sugerencia(
            nombre=form.nombre.data,
            mensaje=form.mensaje.data
        )
        db.session.add(nueva)
        db.session.commit()
        flash('¡Gracias por tu sugerencia!', 'success')
        return redirect(url_for('areas_p.sugerencias'))
    return render_template('areas_p/sugerencias.html', form=form)
