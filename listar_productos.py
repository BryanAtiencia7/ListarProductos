from flask import Flask, jsonify
import mysql.connector

app = Flask(__name__)

# Configuración de la base de datos
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'C#L#ST#ybl4nco',
    'database': 'bd_unificada'
}

@app.route('/listar_productos', methods=['GET'])
def listar_productos():
    try:
        # Conexión a la base de datos
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)

        # Consulta para obtener los primeros 5 productos
        cursor.execute("SELECT * FROM producto LIMIT 5")
        productos = cursor.fetchall()

        cursor.close()
        conn.close()

        return jsonify(productos), 200

    except mysql.connector.Error as err:
        return jsonify({'error': str(err)}), 500

# Punto de entrada
if __name__ == '__main__':
    app.run(debug=True, port=5000)
