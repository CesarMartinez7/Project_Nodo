const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(cors()); // Para permitir peticiones desde el frontend

// Conexión a la base de datos
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'oyasumipunpun',
  database: 'nodomobiliario'
});

connection.connect(err => {
  if (err) throw err;
  console.log('Conectado a la base de datos');
});

// Ruta para obtener datos
app.get('/datos', (req, res) => {
  const sql = 'SELECT * FROM tabla';
  connection.query(sql, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

// Iniciar el servidor
app.listen(3000, () => {
  console.log('Servidor corriendo en http://localhost:3000');
});
