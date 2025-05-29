from flask import Blueprint, render_template, send_file
from io import BytesIO
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from reportlab.lib.utils import ImageReader
import requests
from models.producto import Producto

public_bp = Blueprint('public', __name__)

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

    # — Cabecera —
    p.setFont("Helvetica-Bold", 16)
    p.drawString(40, 750, f"Ficha Técnica de Producto: {prod.nombre}")

    # — Detalles del producto —
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

    # — Imagen desde URL (si existe) —
    if getattr(prod, 'imagen_url', None):
        try:
            # 1) Descarga la imagen
            resp = requests.get(prod.imagen_url, timeout=5)
            resp.raise_for_status()

            # 2) Crea un ImageReader a partir de los bytes
            img_reader = ImageReader(BytesIO(resp.content))

            # 3) Calcula un tamaño razonable (ajusta a tu gusto)
            max_width = 200
            iw, ih = img_reader.getSize()
            aspect = ih / float(iw)
            img_width = max_width
            img_height = max_width * aspect

            # 4) Dibuja la imagen unos píxeles por debajo de los textos
            p.drawImage(img_reader, 50, y - img_height - 10,
                        width=img_width, height=img_height)
        except Exception as e:
            # Si algo falla con la URL, lo ignoramos
            print(f"No se pudo cargar la imagen: {e}")

    p.showPage()
    p.save()
    buffer.seek(0)

    return send_file(
        buffer,
        as_attachment=True,
        download_name=f"ficha_{prod.id}.pdf",
        mimetype='application/pdf'
    )
