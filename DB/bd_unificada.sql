-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS Bd_unificada;
USE Bd_unificada;

-- Tabla: cliente
CREATE TABLE cliente (
    id_cliente INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100) UNIQUE
);

-- Tabla: empleado
CREATE TABLE empleado (
    id_empleado INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100),
    rol VARCHAR(50)
);

-- Tabla: ubicacion
CREATE TABLE ubicacion (
    id_ubicacion INT NOT NULL PRIMARY KEY,
    nombre_estante VARCHAR(50),
    pasillo VARCHAR(50)
);

-- Tabla: producto
CREATE TABLE producto (
    id_producto INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100),
    tipo VARCHAR(50),
    talla VARCHAR(20),
    color VARCHAR(30),
    cantidad_stock INT,
    precio DECIMAL(10,2),
    id_ubicacion INT,
    FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id_ubicacion)
);

-- Tabla: inventario
CREATE TABLE inventario (
    id_inventario INT NOT NULL PRIMARY KEY,
    id_producto INT UNIQUE,
    estado VARCHAR(50),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- Tabla: interaccion_cliente
CREATE TABLE interaccion_cliente (
    id_interaccion INT NOT NULL PRIMARY KEY,
    id_cliente INT,
    tipos_consulta VARCHAR(100),
    recomendacion_generada TEXT,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Tabla: interaccion_empleado
CREATE TABLE interaccion_empleado (
    id_interaccion INT NOT NULL PRIMARY KEY,
    id_empleado INT,
    id_producto INT,
    tipo_consulta VARCHAR(100),
    respuesta TEXT,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- Tabla intermedia: interaccion_cliente_producto
CREATE TABLE interaccion_cliente_producto (
    id_interaccion INT,
    id_producto INT,
    PRIMARY KEY (id_interaccion, id_producto),
    FOREIGN KEY (id_interaccion) REFERENCES interaccion_cliente(id_interaccion),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- Tabla: preferencia
CREATE TABLE preferencia (
    id_preferencia INT NOT NULL PRIMARY KEY,
    id_cliente INT,
    tipo_producto VARCHAR(50),
    color_preferido VARCHAR(30),
    rango_precio_min DECIMAL(10,2),
    rango_precio_max DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);
