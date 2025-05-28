from flask import Blueprint, render_template, send_file
from io import BytesIO
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
import pandas as pd
from models.producto import Producto

public_bp = Blueprint('public', __name__)
admin_bp = Blueprint('admin', __name__)

@public_bp.route('/producto/<int:producto_id>')
def producto_detalle(producto_id):
    prod = Producto.query.get_or_404(producto_id)
    return render_template('producto_detalle.html', producto=prod)

@public_bp.route('/producto/<int:producto_id>/export_pdf')
def export_producto_pdf(producto_id):
    prod = Producto.query.get_or_404(producto_id)
    buffer = BytesIO()
    p = canvas.Canvas(buffer, pagesize=letter)
    p.setTitle(f"Ficha_{prod.nombre}")

    # Cabecera
    p.setFont("Helvetica-Bold", 16)
    p.drawString(40, 750, f"Ficha Técnica de Producto: {prod.nombre}")

    # Detalles del producto
    p.setFont("Helvetica", 12)
    y = 720
    for line in [
        f"ID: {prod.id}",
        f"Nombre: {prod.nombre}",
        f"Descripción: {prod.descripcion}",
        f"Precio: ${prod.precio:.2f}",
        f"Estatus: {prod.estatus}"
    ]:
        p.drawString(50, y, line)
        y -= 20

    p.showPage()
    p.save()
    buffer.seek(0)

    return send_file(
        buffer,
        as_attachment=True,
        download_name=f"ficha_{prod.id}.pdf",
        mimetype='application/pdf'
    )

@admin_bp.route('/admin/productos/export_excel')
def export_productos_excel():
    productos = Producto.query.all()
    data = [{
        'ID': p.id,
        'Nombre': p.nombre,
        'Descripción': p.descripcion,
        'Precio': float(p.precio),
        'Estatus': p.estatus
    } for p in productos]

    df = pd.DataFrame(data)
    output = BytesIO()
    with pd.ExcelWriter(output, engine='openpyxl') as writer:
        df.to_excel(writer, index=False, sheet_name='Productos')
    output.seek(0)

    return send_file(
        output,
        as_attachment=True,
        download_name='productos_listado.xlsx',
        mimetype='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    )
