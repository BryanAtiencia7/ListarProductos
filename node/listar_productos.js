const express = require('express');
const mysql = require('mysql2');
const app = express();

// Configuración de la base de datos
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'bd_unificada'
});

// Conectar a la base de datos
db.connect((err) => {
  if (err) {
    console.error('Error al conectar a la base de datos:', err.message);
    process.exit(1);
  }
  console.log('Conectado a la base de datos MySQL');
});

// Ruta GET para listar los primeros 5 productos
app.get('/listar_productos', (req, res) => {
  const query = 'SELECT * FROM producto LIMIT 5';

  db.query(query, (err, results) => {
    if (err) {
      console.error('Error al consultar productos:', err.message);
      return res.status(500).json({ error: err.message });
    }

    res.status(200).json(results);
  });
});

// Iniciar servidor
app.listen(5000, () => {
  console.log('Microservicio "listar_productos" escuchando en http://localhost:5000');
});
