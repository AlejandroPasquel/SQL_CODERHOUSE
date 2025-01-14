-- CREACIÓN DE LA BASE DE DATOS
	-- Eliminamos base de datos 'EmpresaHardware' si existe
DROP DATABASE IF EXISTS EmpresaHardware;
	-- Creamos base de datos 'EmpresaHardware'
CREATE DATABASE EmpresaHardware;
	-- Designamos 'EmpresaHardware' como base de datos actual, a la que se hará referencia en el resto del código
USE EmpresaHardware;


/*----------------------------------------------------------------------------------
- CREACIÓN DE LAS TABLAS
	/* Borramos las tablas si existen.
	Esto no es totalmente necesario ya que anteriormente se eliminó y creó de nuevo la base de datos. 
    Por lo tanto, las tablas también quedaron eliminadas*/

DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS tiendas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS centroDistribucion;
DROP TABLE IF EXISTS ventas;

/*------------ Creación de tablas--------------------------------------*/


CREATE TABLE productos(
	cod_producto int ,
    nombre text(40) not null,
    precio_unitario real not null,
    primary key(cod_producto)
    );

CREATE TABLE centroDistribucion(
	cod_fabrica int auto_increment ,
    pais text (30) not null,
    ciudad text(30) not null,
    numero_empleados numeric (10),
    PRIMARY KEY(cod_fabrica)
);

CREATE TABLE tiendas(
	cod_tienda int auto_increment,
    ciudad text(40) not null,
    tipologia enum('Fisica','Online'),
    tamano_mt2 numeric(10),
    numero_fabrica int,
    constraint FK_tiendas_fabrica 
		foreign key (numero_fabrica)
        references centroDistribucion(cod_fabrica),
    PRIMARY KEY(cod_tienda)
);

CREATE TABLE clientes(
	cedula int ,
    nombre text(10) not null,
    telefono varchar(30) not null,
    tipo enum ('Regular','Premium'),
    email varchar (30),
    codigo_tienda int,
    constraint FK_clientes_tienda 
		foreign key (codigo_tienda)
        references tiendas(cod_tienda),
    PRIMARY KEY(cedula)
);

CREATE TABLE ventas (
    cod_venta VARCHAR(10),
    codigo_cliente INT,
    codigo_producto INT,
    cantidad NUMERIC(10),
    precio_total REAL NOT NULL,
    fecha_pedido DATE,
    CONSTRAINT FK_ventas_cliente 
        FOREIGN KEY (codigo_cliente)
        REFERENCES clientes(cedula),
    CONSTRAINT FK_ventas_producto
        FOREIGN KEY (codigo_producto)
        REFERENCES productos(cod_producto),
    PRIMARY KEY(cod_venta)
);



/*--------------- creacion de indices secundarios---------*/

CREATE INDEX I_productos_nombre 
	ON productos(nombre(50));
    
    
CREATE INDEX I_centroDistribucion_PC
	ON centroDistribucion(pais(30),ciudad(30));

CREATE INDEX I_tiendas_CT
	ON tiendas(ciudad(30),tipologia);
    
CREATE INDEX I_clientes_CT
	ON clientes(nombre(30),telefono);
    

/*--------------- Poblamiento de tablas 15 registros por cada una ---------*/


-- TABLA productos : 
INSERT INTO productos (cod_producto, nombre, precio_unitario)
VALUES
    (1, 'Tarjeta Gráfica RTX 4090', 1599.99),
    (2, 'Procesador Intel Core i9-13900K', 699.99),
    (3, 'Teclado Mecánico RGB', 149.99),
    (4, 'Monitor Gaming 240Hz', 499.99),
    (5, 'Silla Gamer Ergonométrica', 299.99),
    (6, 'Mouse Gaming Inalámbrico', 99.99),
    (7, 'SSD NVMe 2TB', 179.99),
    (8, 'Placa Base Z790', 349.99),
    (9, 'Refrigeración Líquida 360mm', 249.99),
    (10, 'Caja ATX con RGB', 129.99),
    (11, 'Fuente de Poder 850W Gold', 129.99),
    (12, 'Headset Gaming 7.1', 119.99),
    (13, 'Memoria RAM 32GB DDR5', 199.99),
    (14, 'Combo Teclado y Mouse Gaming', 69.99),
    (15, 'Base de Enfriamiento para Laptop', 49.99);
    
    
-- Tabla centroDistribucion:

INSERT INTO centroDistribucion (cod_fabrica, pais, ciudad, numero_empleados)
VALUES
    (1, 'Estados Unidos', 'Austin', 250),
    (2, 'México', 'Guadalajara', 180),
    (3, 'Alemania', 'Berlín', 300),
    (4, 'Japón', 'Tokio', 220),
    (5, 'Brasil', 'São Paulo', 200);
    

    
-- Tabla tiendas :

INSERT INTO tiendas (cod_tienda, ciudad, tipologia, tamano_mt2, numero_fabrica)
VALUES
    (1, 'Austin', 'física', 350, 1),
    (2, 'Houston', 'física', 400, 1),
    (3, 'Guadalajara', 'física', 300, 2),
    (4, 'Monterrey', 'física', 250, 2),
    (5, 'Berlín', 'física', 500, 3),
    (6, 'Múnich', 'física', 450, 3),
    (7, 'Tokio', 'online', 0, 4),
    (8, 'Osaka', 'física', 320, 4),
    (9, 'São Paulo', 'física', 400, 5),
    (10, 'Río de Janeiro', 'física', 370, 5);
    
    


-- tabla clientes: 

INSERT INTO clientes (cedula, nombre, telefono, tipo, email, codigo_tienda) VALUES
(1012345678, 'Juan Pérez', '3001234567', 'Regular', 'juan.perez@ejemplo.com', 1),
(1023456789, 'María Gómez', '3002345678', 'Premium', 'maria.gomez@ejemplo.com', 2),
(1034567890, 'Carlos Rodríguez', '3103456789', 'Regular', 'carlos.rodriguez@ejemplo.com', 3),
(1045678901, 'Ana López', '3104567890', 'Premium', 'ana.lopez@ejemplo.com', 4),
(1056789012, 'Pedro Martínez', '3205678901', 'Regular', 'pedro.martinez@ejemplo.com', 5),
(1067890123, 'Laura García', '3206789012', 'Premium', 'laura.garcia@ejemplo.com', 6),
(1078901234, 'José Fernández', '3217890123', 'Regular', 'jose.fernandez@ejemplo.com', 7),
(1089012345, 'Lucía Díaz', '3218901234', 'Premium', 'lucia.diaz@ejemplo.com', 8),
(1090123456, 'Santiago Pérez', '3229012345', 'Regular', 'santiago.perez@ejemplo.com', 9),
(1101234567, 'Isabel Hernández', '3220123456', 'Premium', 'isabel.hernandez@ejemplo.com', 10),
(1112345678, 'Miguel Ramírez', '3001234567', 'Regular', 'miguel.ramirez@ejemplo.com', 1),
(1123456789, 'Raquel Sánchez', '3002345678', 'Premium', 'raquel.sanchez@ejemplo.com', 2),
(1134567890, 'Fernando Ruiz', '3103456789', 'Regular', 'fernando.ruiz@ejemplo.com', 3),
(1145678901, 'Patricia Morales', '3104567890', 'Premium', 'patricia.morales@ejemplo.com', 4),
(1156789012, 'Antonio Gómez', '3205678901', 'Regular', 'antonio.gomez@ejemplo.com', 5),
(1167890123, 'Marta Díaz', '3206789012', 'Premium', 'marta.diaz@ejemplo.com', 6),
(1178901234, 'David Fernández', '3217890123', 'Regular', 'david.fernandez@ejemplo.com', 7),
(1189012345, 'Elena Rodríguez', '3218901234', 'Premium', 'elena.rodriguez@ejemplo.com', 8),
(1190123456, 'José Luis Martínez', '3229012345', 'Regular', 'jose.luis.martinez@ejemplo.com', 9),
(1201234567, 'Claudia López', '3220123456', 'Premium', 'claudia.lopez@ejemplo.com', 10),
(1212345678, 'Ricardo González', '3001234567', 'Regular', 'ricardo.gonzalez@ejemplo.com', 1),
(1223456789, 'Patricia García', '3002345678', 'Premium', 'patricia.garcia@ejemplo.com', 2),
(1234567890, 'Luis Torres', '3103456789', 'Regular', 'luis.torres@ejemplo.com', 3),
(1245678901, 'Carmen Pérez', '3104567890', 'Premium', 'carmen.perez@ejemplo.com', 4),
(1256789012, 'Alfredo Sánchez', '3205678901', 'Regular', 'alfredo.sanchez@ejemplo.com', 5),
(1267890123, 'Laura Fernández', '3206789012', 'Premium', 'laura.fernandez@ejemplo.com', 6),
(1278901234, 'Gabriel López', '3217890123', 'Regular', 'gabriel.lopez@ejemplo.com', 7),
(1289012345, 'Victoria Ramírez', '3218901234', 'Premium', 'victoria.ramirez@ejemplo.com', 8),
(1290123456, 'Adrián Díaz', '3229012345', 'Regular', 'adrian.diaz@ejemplo.com', 9),
(1301234567, 'Raúl Martínez', '3220123456', 'Premium', 'raul.martinez@ejemplo.com', 10),
(1312345678, 'César Gómez', '3001234567', 'Regular', 'cesar.gomez@ejemplo.com', 1),
(1323456789, 'Inés Ruiz', '3002345678', 'Premium', 'ines.ruiz@ejemplo.com', 2),
(1334567890, 'Fernando Rodríguez', '3103456789', 'Regular', 'fernando.rodriguez@ejemplo.com', 3),
(1345678901, 'Mariana López', '3104567890', 'Premium', 'mariana.lopez@ejemplo.com', 4),
(1356789012, 'David Martínez', '3205678901', 'Regular', 'david.martinez@ejemplo.com', 5),
(1367890123, 'Nora González', '3206789012', 'Premium', 'nora.gonzalez@ejemplo.com', 6),
(1378901234, 'Juan Fernández', '3217890123', 'Regular', 'juan.fernandez@ejemplo.com', 7),
(1389012345, 'Sara Hernández', '3218901234', 'Premium', 'sara.hernandez@ejemplo.com', 8),
(1390123456, 'Ricardo Pérez', '3229012345', 'Regular', 'ricardo.perez@ejemplo.com', 9),
(1401234567, 'Marta Gómez', '3220123456', 'Premium', 'marta.gomez@ejemplo.com', 10),
(1412345678, 'Alberto Sánchez', '3001234567', 'Regular', 'alberto.sanchez@ejemplo.com', 1),
(1423456789, 'Liliana Rodríguez', '3002345678', 'Premium', 'liliana.rodriguez@ejemplo.com', 2),
(1434567890, 'Óscar Ramírez', '3103456789', 'Regular', 'oscar.ramirez@ejemplo.com', 3),
(1445678901, 'Elena Ruiz', '3104567890', 'Premium', 'elena.ruiz@ejemplo.com', 4),
(1456789012, 'Daniela López', '3205678901', 'Regular', 'daniela.lopez@ejemplo.com', 5),
(1467890123, 'Eduardo Fernández', '3206789012', 'Premium', 'eduardo.fernandez@ejemplo.com', 6),
(1478901234, 'Guillermo Martínez', '3217890123', 'Regular', 'guillermo.martinez@ejemplo.com', 7),
(1489012345, 'Patricia Díaz', '3218901234', 'Premium', 'patricia.diaz@ejemplo.com', 8),
(1490123456, 'Carlos López', '3229012345', 'Regular', 'carlos.lopez@ejemplo.com', 9),
(1501234567, 'Rosa González', '3220123456', 'Premium', 'rosa.gonzalez@ejemplo.com', 10);


-- tabla ventas:

INSERT INTO ventas (cod_venta, codigo_cliente, codigo_producto, cantidad, precio_total, fecha_pedido) VALUES
('VXP9B8F4G1', 1012345678, 3, 2, 50000, '2024-01-10'),
('AXD7J6W3N2', 1023456789, 5, 1, 120000, '2024-01-11'),
('K8Z4N1D7P6', 1034567890, 8, 3, 30000, '2024-01-12'),
('W1L9E3C7U0', 1045678901, 10, 2, 80000, '2024-01-13'),
('P4M2I7A1G5', 1056789012, 2, 4, 95000, '2024-01-14'),
('S0H8U1B3K6', 1067890123, 7, 1, 70000, '2024-01-15'),
('J3D4L2P9K0', 1078901234, 1, 3, 85000, '2024-01-16'),
('B7T2Y5Q9V4', 1089012345, 4, 2, 110000, '2024-01-17'),
('G1M5D7O9N2', 1090123456, 6, 5, 43000, '2024-01-18'),
('C9V8Z1S6Q3', 1101234567, 9, 1, 150000, '2024-01-19'),
('O7Y3X2F8M9', 1112345678, 13, 4, 65000, '2024-01-20'),
('E8J4C9I1H7', 1123456789, 12, 3, 105000, '2024-01-21'),
('R2K1V9W4G8', 1134567890, 11, 2, 92000, '2024-01-22'),
('D5T9P7M2Q0', 1145678901, 15, 1, 78000, '2024-01-23'),
('V6Z2G8X1P5', 1156789012, 14, 4, 43000, '2024-01-24'),
('N1C0L3P8M2', 1167890123, 3, 2, 50000, '2024-01-25'),
('F2J8Q4X7U1', 1178901234, 5, 3, 68000, '2024-01-26'),
('B9T3V6W2Y4', 1189012345, 8, 4, 96000, '2024-01-27'),
('P4M0F7S1X8', 1190123456, 10, 1, 86000, '2024-01-28'),
('Q3C9M8J2P0', 1201234567, 2, 5, 55000, '2024-01-29'),
('S6Y0T7J9B4', 1212345678, 7, 2, 72000, '2024-01-30'),
('K1X4W9L2V7', 1223456789, 1, 3, 120000, '2024-02-01'),
('T2G5J8D9C3', 1234567890, 4, 1, 92000, '2024-02-02'),
('R7K6Q3P9M0', 1245678901, 6, 2, 102000, '2024-02-03'),
('L8F4Y1D3P5', 1256789012, 9, 5, 56000, '2024-02-04'),
('Z9V7T2G3C1', 1267890123, 3, 3, 75000, '2024-02-05'),
('H6N2J4X9B7', 1278901234, 5, 4, 98000, '2024-02-06'),
('M3K8P7F1Y2', 1289012345, 7, 1, 65000, '2024-02-07'),
('O2Q9J1B4T5', 1290123456, 2, 5, 54000, '2024-02-08'),
('S4D8V3X9G0', 1301234567, 10, 2, 80000, '2024-02-09'),
('F2R9T7J6B1', 1312345678, 8, 3, 45000, '2024-02-10'),
('Y3C2T9M0W4', 1323456789, 4, 4, 78000, '2024-02-11'),
('D9P5V1J3T2', 1334567890, 11, 1, 67000, '2024-02-12'),
('B4G9W6F2N0', 1345678901, 13, 2, 86000, '2024-02-13'),
('X7Y5R2M0D8', 1356789012, 12, 3, 105000, '2024-02-14'),
('V2K9P6S0T5', 1367890123, 15, 5, 60000, '2024-02-15'),
('Z1H9T3D7B0', 1378901234, 14, 4, 94000, '2024-02-16'),
('J2M5Q8K9X4', 1389012345, 1, 2, 49000, '2024-02-17'),
('S1L4G9P2V0', 1390123456, 6, 1, 75000, '2024-02-18'),
('T9C2P8B7D4', 1401234567, 9, 5, 68000, '2024-02-19'),
('Q1X9V3M2J7', 1412345678, 3, 2, 96000, '2024-02-20'),
('L8J4R1P9Y5', 1423456789, 5, 4, 80000, '2024-02-21'),
('V3W1D7M9T2', 1434567890, 8, 3, 110000, '2024-02-22'),
('F0R7G9P2X8', 1445678901, 10, 2, 120000, '2024-02-23'),
('Z9M8D5T3N0', 1456789012, 12, 1, 105000, '2024-02-24'),
('H2P9F4K7Y1', 1467890123, 14, 5, 95000, '2024-02-25'),
('X4G7B9D2P0', 1478901234, 7, 2, 92000, '2024-02-26'),
('C3P1R6X9T2', 1489012345, 3, 3, 75000, '2024-02-27'),
('L0V9D7B2N1', 1490123456, 1, 4, 65000, '2024-02-28'),
('M8Q5X2G9R0', 1501234567, 6, 5, 73000, '2024-02-29'),
('N4F1K8V9J2', 1012345678, 2, 2, 50000, '2024-03-01'),
('O2M6T5J7B4', 1023456789, 5, 4, 64000, '2024-03-02'),
('P9Y8Q1C6F0', 1034567890, 8, 3, 95000, '2024-03-03'),
('V1G3B9W5S2', 1045678901, 10, 1, 87000, '2024-03-04'),
('Z2J4N9S0P8', 1056789012, 2, 5, 55000, '2024-03-05'),
('F6B8M3Y0Q1', 1067890123, 7, 2, 48000, '2024-03-06');
    


    

