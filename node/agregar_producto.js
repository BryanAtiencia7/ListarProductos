const express = require('express');
const mysql = require('mysql2');
const app = express();

// Middleware para leer JSON
app.use(express.json());

// Configuración de la base de datos
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'bd_unificada'
});

// Conexión a la base de datos
db.connect((err) => {
  if (err) {
    console.error('Error al conectar a la base de datos:', err.message);
    process.exit(1);
  }
  console.log('Conectado a la base de datos MySQL');
});

// Ruta POST para agregar producto
app.post('/agregar_producto', (req, res) => {
  const {
    nombre,
    tipo,
    talla,
    color,
    cantidad_stock,
    precio,
    id_ubicacion
  } = req.body;

  // Validación básica
  if (!nombre || !tipo || !talla || !color || !cantidad_stock || !precio || !id_ubicacion) {
    return res.status(400).json({ error: 'Todos los campos son requeridos' });
  }

  const insertQuery = `
    INSERT INTO producto (nombre, tipo, talla, color, cantidad_stock, precio, id_ubicacion)
    VALUES (?, ?, ?, ?, ?, ?, ?)
  `;

  const values = [nombre, tipo, talla, color, cantidad_stock, precio, id_ubicacion];

  db.query(insertQuery, values, (err, results) => {
    if (err) {
      console.error('Error al insertar producto:', err.message);
      return res.status(500).json({ error: err.message });
    }
    res.status(201).json({ mensaje: 'Producto agregado correctamente' });
  });
});

// Iniciar servidor
app.listen(5001, () => {
  console.log('Microservicio "agregar_producto" escuchando en http://localhost:5001');
});
