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

# Sugerencias (ya lo tenías)
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

# Ahora añade las rutas para cada área:
@areas_p_bp.route('/certificaciones')
def certificaciones():
    return render_template('areas_p/certificaciones.html')

@areas_p_bp.route('/telecomunicaciones')
def telecomunicaciones():
    return render_template('areas_p/telecomunicaciones.html')

@areas_p_bp.route('/redes-electricas')
def redes_electricas():
    return render_template('areas_p/redes_electricas.html')

@areas_p_bp.route('/circuito-cerrado-tv')
def circuito_cerrado_tv():
    return render_template('areas_p/circuito_cerrado_tv.html')

@areas_p_bp.route('/corriente-regulada')
def corriente_regulada():
    return render_template('areas_p/corriente_regulada.html')

@areas_p_bp.route('/data-centers')
def data_centers():
    return render_template('areas_p/data_centers.html')

@areas_p_bp.route('/fibra-optica')
def fibra_optica():
    return render_template('areas_p/fibra_optica.html')

@areas_p_bp.route('/cables-estructurados')
def cables_estructurados():
    return render_template('areas_p/cables_estructurados.html')

@areas_p_bp.route('/polizas')
def polizas():
    return render_template('areas_p/polizas.html')
