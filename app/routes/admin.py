from flask import render_template, redirect, url_for, flash, Blueprint, request
from app.forms.register_form import RegisterForm
from app.forms.producto_form import ProductoForm
from app.models.usuario import Usuario
from app.models.producto import Producto
from werkzeug.security import generate_password_hash
from app.utils.auth import login_required
from app import db

admin_bp = Blueprint('admin', __name__)

# Ruta para el panel de administración
@admin_bp.route('/admin')
@login_required
def admin_home():
    return render_template('admin/admin.html')

# Ruta para crear usuario
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

# Ruta para gestión de productos (CRUD completo)
@admin_bp.route('/admin/productos', methods=['GET', 'POST'])
@login_required
def productos_admin():
    form = ProductoForm()
    productos = Producto.query.order_by(Producto.id.desc()).all()

    if form.validate_on_submit():
        nuevo = Producto(
            nombre=form.nombre.data,
            descripcion=form.descripcion.data,
            imagen_url=form.imagen_url.data,
            precio=form.precio.data,
            estatus=form.estatus.data
        )
        db.session.add(nuevo)
        db.session.commit()
        flash('Producto agregado exitosamente.', 'success')
        return redirect(url_for('admin.productos_admin'))

    return render_template('admin/productos_admin.html', form=form, productos=productos)

# Ruta para editar producto
@admin_bp.route('/admin/productos/<int:producto_id>/editar', methods=['GET', 'POST'])
@login_required
def editar_producto(producto_id):
    producto = Producto.query.get_or_404(producto_id)
    form = ProductoForm(obj=producto)

    if form.validate_on_submit():
        producto.nombre = form.nombre.data
        producto.descripcion = form.descripcion.data
        producto.imagen_url = form.imagen_url.data
        producto.precio = form.precio.data
        producto.estatus = form.estatus.data
        db.session.commit()
        flash('Producto actualizado correctamente.', 'success')
        return redirect(url_for('admin.productos_admin'))

    return render_template('admin/editar_producto.html', form=form, producto=producto)

# Ruta para eliminar producto
@admin_bp.route('/admin/productos/<int:producto_id>/eliminar', methods=['POST'])
@login_required
def eliminar_producto(producto_id):
    producto = Producto.query.get_or_404(producto_id)
    db.session.delete(producto)
    db.session.commit()
    flash('Producto eliminado.', 'info')
    return redirect(url_for('admin.productos_admin'))
