from flask import Flask, request, jsonify
import mysql.connector

app = Flask(__name__)

# Configuración de la base de datos
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'root',
    'database': 'bd_unificada'
}

@app.route('/agregar_producto', methods=['POST'])
def agregar_producto():
    try:
        # Recibir datos JSON del cuerpo de la solicitud
        data = request.get_json()

        # Extraer campos
        nombre = data.get('nombre')
        tipo = data.get('tipo')
        talla = data.get('talla')
        color = data.get('color')
        cantidad_stock = data.get('cantidad_stock')
        precio = data.get('precio')
        id_ubicacion = data.get('id_ubicacion')

        # Validación básica
        if not all([nombre, tipo, talla, color, cantidad_stock, precio, id_ubicacion]):
            return jsonify({'error': 'Todos los campos son requeridos'}), 400

        # Conexión a la base de datos
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()

        # Consulta de inserción
        insert_query = """
            INSERT INTO producto (nombre, tipo, talla, color, cantidad_stock, precio, id_ubicacion)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        cursor.execute(insert_query, (nombre, tipo, talla, color, cantidad_stock, precio, id_ubicacion))
        conn.commit()

        # Cierre de conexión
        cursor.close()
        conn.close()

        return jsonify({'mensaje': 'Producto agregado correctamente'}), 201

    except mysql.connector.Error as err:
        return jsonify({'error': str(err)}), 500

# Punto de entrada del microservicio
if __name__ == '__main__':
    app.run(debug=True, port=5001)
