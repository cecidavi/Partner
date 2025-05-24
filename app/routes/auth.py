from flask import Blueprint, render_template, redirect, url_for, flash, session, request
from werkzeug.security import check_password_hash
from app.forms.login import LoginForm
from app.models.usuario import Usuario

auth_bp = Blueprint('auth', __name__)

@auth_bp.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        user = Usuario.query.filter_by(correo=form.correo.data).first()
        if user and check_password_hash(user.password_hash, form.password.data):
            session['usuario_id'] = user.id
            session['usuario_rol'] = user.rol
            flash('Inicio de sesión exitoso', 'success')
            return redirect(url_for('admin.admin_home'))
        flash('Correo o contraseña incorrectos', 'danger')
    return render_template('login.html', form=form)

@auth_bp.route('/logout')
def logout():
    session.clear()
    flash('Sesión cerrada', 'info')
    return redirect(url_for('auth.login'))
