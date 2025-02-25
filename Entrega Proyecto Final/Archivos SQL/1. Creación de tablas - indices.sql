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

DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS tienda;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS centroDistribucion;
DROP TABLE IF EXISTS venta;
DROP TABLE IF EXISTS proveedor;
DROP TABLE IF EXISTS empleado;
DROP TABLE IF EXISTS envio;

/*------------ Creación de tablas--------------------------------------*/


CREATE TABLE producto(
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

CREATE TABLE tienda(
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

CREATE TABLE cliente(
	cedula int ,
    nombre text(10) not null,
    telefono varchar(30) not null,
    tipo enum ('Regular','Premium'),
    email varchar (30),
    codigo_tienda int,
    constraint FK_clientes_tienda 
		foreign key (codigo_tienda)
        references tienda(cod_tienda),
    PRIMARY KEY(cedula)
);

CREATE TABLE venta (
    cod_venta  varchar(15) ,
    codigo_cliente INT,
    codigo_producto INT,
    cantidad NUMERIC(10),
    precio_total REAL NOT NULL,
    fecha_pedido DATE,
    CONSTRAINT FK_ventas_cliente 
        FOREIGN KEY (codigo_cliente)
        REFERENCES cliente(cedula),
    CONSTRAINT FK_ventas_producto
        FOREIGN KEY (codigo_producto)
        REFERENCES producto(cod_producto),
    PRIMARY KEY(cod_venta)
);

CREATE TABLE proveedor(
    cod_proveedor INT AUTO_INCREMENT,
    nombre TEXT(50) NOT NULL,
    contacto TEXT(50),
    telefono VARCHAR(20),
    email VARCHAR(50),
    PRIMARY KEY(cod_proveedor)
);

CREATE TABLE empleado(
    cod_empleado INT AUTO_INCREMENT,
    nombre TEXT(50) NOT NULL,
    puesto TEXT(50) NOT NULL,
    salario NUMERIC(10,2) NOT NULL,
    cod_fabrica INT,
    CONSTRAINT FK_empleado_fabrica 
        FOREIGN KEY (cod_fabrica) REFERENCES centroDistribucion(cod_fabrica),
    PRIMARY KEY(cod_empleado)
);

CREATE TABLE envio(
    cod_envio INT AUTO_INCREMENT,
    cod_venta varchar(15),
    fecha_envio DATE NOT NULL,
    estado TEXT(20) NOT NULL,
    CONSTRAINT FK_envio_venta 
        FOREIGN KEY (cod_venta) REFERENCES venta(cod_venta),
    PRIMARY KEY(cod_envio)
);


/*--------------- creacion de indices secundarios---------*/

CREATE INDEX I_productos_nombre 
	ON producto(nombre(50));
    
    
CREATE INDEX I_centroDistribucion_PC
	ON centroDistribucion(pais(30),ciudad(30));

CREATE INDEX I_tiendas_CT
	ON tienda(ciudad(30),tipologia);
    
CREATE INDEX I_clientes_CT
	ON cliente(nombre(30),telefono);
    
CREATE INDEX I_proveedor_nombre 
    ON proveedor(nombre(50));
    
CREATE INDEX I_empleado_nombre_puesto 
    ON empleado(nombre(50), puesto(50));
    
CREATE INDEX I_envio_estado_fecha 
    ON envio(estado(20), fecha_envio);
    