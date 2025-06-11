-- Clientes
INSERT INTO cliente (id_cliente, nombre, correo) 
VALUES 
(1, 'Juan Pérez', 'juanperez@gmail.com'),
(2, 'María López', 'marialopez@gmail.com'),
(3, 'Carlos García', 'carlosgarcia@gmail.com');

-- Empleados
INSERT INTO empleado (id_empleado, nombre, rol) 
VALUES 
(1, 'Luis Sánchez', 'Vendedor'),
(2, 'Ana Martínez', 'Supervisor'),
(3, 'Pedro Fernández', 'Asistente');

-- Ubicacion
INSERT INTO ubicacion (id_ubicacion, nombre_estante, pasillo) 
VALUES 
(1, 'Estante A', 'Pasillo 1'),
(2, 'Estante B', 'Pasillo 2'),
(3, 'Estante C', 'Pasillo 3');

-- Producto
INSERT INTO producto (id_producto, nombre, tipo, talla, color, cantidad_stock, precio, id_ubicacion) 
VALUES 
(1, 'Camiseta Roja', 'Ropa', 'L', 'Rojo', 100, 19.99, 1),
(2, 'Pantalón Azul', 'Ropa', 'M', 'Azul', 50, 29.99, 2),
(3, 'Zapatillas Negras', 'Calzado', '42', 'Negro', 30, 49.99, 3);

-- Inventario
INSERT INTO inventario (id_inventario, id_producto, estado) 
VALUES 
(1, 1, 'Disponible'),
(2, 2, 'Disponible'),
(3, 3, 'Agotado');

-- Interaccion Cliente
INSERT INTO interaccion_cliente (id_interaccion, id_cliente, tipos_consulta, recomendacion_generada) 
VALUES 
(1, 1, 'Consulta sobre camisetas', 'Se recomendó el modelo de camiseta en color rojo'),
(2, 2, 'Consulta sobre pantalones', 'Se recomendó el modelo de pantalón azul'),
(3, 3, 'Consulta sobre zapatillas', 'Se recomendó zapatillas negras de talla 42');

-- Interaccion Empleado
INSERT INTO interaccion_empleado (id_interaccion, id_empleado, id_producto, tipo_consulta, respuesta) 
VALUES 
(1, 1, 1, 'Consulta sobre stock', 'El stock de camisetas rojas es adecuado'),
(2, 2, 2, 'Consulta sobre tallas', 'El pantalón azul está disponible en talla M'),
(3, 3, 3, 'Consulta sobre disponibilidad', 'Las zapatillas negras están agotadas actualmente');

-- Cliente producto
INSERT INTO interaccion_cliente_producto (id_interaccion, id_producto) 
VALUES 
(1, 1),  -- Interacción 1 con producto 1 (Camiseta Roja)
(2, 2),  -- Interacción 2 con producto 2 (Pantalón Azul)
(3, 3);  -- Interacción 3 con producto 3 (Zapatillas Negras)

-- Preferencias
INSERT INTO preferencia (id_preferencia, id_cliente, tipo_producto, color_preferido, rango_precio_min, rango_precio_max) 
VALUES 
(1, 1, 'Ropa', 'Rojo', 10.00, 30.00),
(2, 2, 'Ropa', 'Azul', 20.00, 40.00),
(3, 3, 'Calzado', 'Negro', 30.00, 60.00);

Select * from producto;
