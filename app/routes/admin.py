from flask import render_template, redirect, url_for, flash, Blueprint
from app.forms.register_form import RegisterForm
from app.models.usuario import Usuario
from werkzeug.security import generate_password_hash
from app.utils.auth import login_required
from app import db

admin_bp = Blueprint('admin', __name__)

@admin_bp.route('/admin/crear-usuario', methods=['GET', 'POST'])
@login_required
def crear_usuario():
    form = RegisterForm()
    if form.validate_on_submit():
        nuevo_usuario = Usuario(
            nombre=form.nombre.data,
            correo=form.correo.data,
            password_hash=generate_password_hash(form.password.data),
            rol=form.rol.data
        )
        db.session.add(nuevo_usuario)
        db.session.commit()
        flash('Usuario creado exitosamente', 'success')
        return redirect(url_for('admin.admin_home'))
    return render_template('admin/crear_usuario.html', form=form)
