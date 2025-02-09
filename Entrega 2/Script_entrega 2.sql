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

DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS tienda;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS centroDistribucion;
DROP TABLE IF EXISTS venta;

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
    cod_venta  VARCHAR(10) ,
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



/*--------------- creacion de indices secundarios---------*/

CREATE INDEX I_productos_nombre 
	ON producto(nombre(50));
    
    
CREATE INDEX I_centroDistribucion_PC
	ON centroDistribucion(pais(30),ciudad(30));

CREATE INDEX I_tiendas_CT
	ON tienda(ciudad(30),tipologia);
    
CREATE INDEX I_clientes_CT
	ON cliente(nombre(30),telefono);
    

/* --------------------------------Creacion de vistas-----------------------------------------------------------------*/

DROP VIEW IF EXISTS vw_ventas_detalladas ;
DROP VIEW IF EXISTS vw_tiendas_rendimiento;
DROP VIEW IF EXISTS vw_clientes_compra;

CREATE OR REPLACE VIEW vw_ventas_detalladas as
SELECT 
	v.cod_venta,
    v.fecha_pedido,
    c.nombre AS cliente,
    p.nombre AS producto,
    v.cantidad,
    v.precio_total
FROM venta v
JOIN cliente c ON v.codigo_cliente=c.cedula
JOIN producto p ON v.codigo_producto =p.cod_producto;

CREATE OR REPLACE VIEW vw_tiendas_rendimiento AS 
SELECT 
	t.cod_tienda,
    t.ciudad AS ciudad_tienda,
    t.tipologia,
    cd.ciudad AS ciudad_centro,
    cd.pais,
    COALESCE(sum(v.precio_total),0) AS total_ventas,
	count(v.cod_venta) AS num_ventas
FROM tienda t 
JOIN centroDistribucion cd ON t.numero_fabrica=cd.cod_fabrica
LEFT JOIN cliente c ON c.codigo_tienda = t.cod_tienda
LEFT JOIN venta v ON c.cedula = v.codigo_cliente
GROUP BY t.cod_tienda,t.ciudad ,t.tipologia,cd.ciudad, cd.pais;


CREATE OR REPLACE VIEW vw_clientes_compra AS
SELECT 
    c.cedula,
    c.nombre AS cliente,
    c.tipo,
    c.email,
    t.ciudad AS tienda,
    COUNT(v.cod_venta) AS num_ventas,
    COALESCE(SUM(v.precio_total), 0) AS total_compras
FROM cliente c
LEFT JOIN venta v ON c.cedula = v.codigo_cliente
LEFT JOIN tienda t ON c.codigo_tienda = t.cod_tienda
GROUP BY c.cedula, c.nombre, c.tipo, c.email, t.ciudad;


/* --------------------------------Creacion de funciones-----------------------------------------------------------------*/

DROP FUNCTION IF EXISTS FN_TOTAL_COMPRAS_CLIENTE;
DROP FUNCTION IF EXISTS FN_CANTIDAD_VENDIDA_PRODUCTO;
DROP FUNCTION IF EXISTS FN_VENTA_MAYOR;
DROP FUNCTION IF EXISTS FN_NUMERO_CLIENTES_POR_TIENDA;

DELIMITER //
CREATE FUNCTION FN_TOTAL_COMPRAS_CLIENTE(p_cedula INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT COALESCE(SUM(precio_total), 0) 
      INTO total 
      FROM venta 
     WHERE codigo_cliente = p_cedula;
    RETURN total;
END;
//

-- select FN_TOTAL_COMPRAS_CLIENTE(1089012345);



CREATE FUNCTION FN_CANTIDAD_VENDIDA_PRODUCTO(p_cod_producto INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    set total = (SELECT COALESCE(SUM(cantidad), 0) 
      FROM venta 
     WHERE codigo_producto = p_cod_producto);
    RETURN total;
END;
//

-- SELECT FN_CANTIDAD_VENDIDA_PRODUCTO(10);

CREATE FUNCTION FN_VENTA_MAYOR()
	RETURNS real
    DETERMINISTIC
    BEGIN 
    DECLARE MAX_VENTA real;
	SET MAX_VENTA= (SELECT COALESCE(MAX(precio_total),0) from venta);
	RETURN MAX_VENTA;
    END; 
    //


-- SELECT FN_VENTA_MAYOR();



CREATE FUNCTION FN_NUMERO_CLIENTES_POR_TIENDA (p_cod_tienda int)
	returns int
    DETERMINISTIC 
    BEGIN 
 DECLARE num_clientes INT;
    SELECT COUNT(*) 
      INTO num_clientes 
      FROM cliente 
     WHERE codigo_tienda = p_cod_tienda;
    RETURN num_clientes;

    END;
    //
    
DELIMITER ;    

 -- select FN_NUMERO_CLIENTES_POR_TIENDA(3);



 /*--------------------------------------PROCEDIMIENTOS ALMACENADOS-----------------------------------------------------------------------------------*/
 
 
 DROP PROCEDURE IF EXISTS SP_REGISTRAR_VENTA;
 DROP PROCEDURE IF EXISTS SP_ACTUALIZAR_PRECIO_PRODUCTO;
 DROP PROCEDURE IF EXISTS SP_INFORME_PRODUCTO;
 DROP PROCEDURE IF EXISTS SP_REGISTRAR_CLIENTE;
 
 DELIMITER //
CREATE PROCEDURE SP_REGISTRAR_VENTA(
	IN p_cod_venta VARCHAR(10),
    IN p_cod_cliente INT,
    IN p_cod_producto INT,
    IN p_cantidad INT,
    IN p_fecha DATE
)
BEGIN
    DECLARE p_unitario DECIMAL(10,2);
    DECLARE p_total DECIMAL(10,2);
    
    SELECT precio_unitario INTO p_unitario
      FROM producto
     WHERE cod_producto = p_cod_producto;

    SET p_total = p_unitario * p_cantidad;
    
    INSERT INTO venta(cod_venta,codigo_cliente, codigo_producto, cantidad, precio_total, fecha_pedido)
    VALUES(p_cod_venta,p_cod_cliente, p_cod_producto, p_cantidad, p_total, p_fecha);
END//
DELIMITER ;


-- Call SP_REGISTRAR_VENTA('AGOJFE5554',1245678901,6,10,'2025-02-06');

 DELIMITER //
 
 CREATE PROCEDURE SP_ACTUALIZAR_PRECIO_PRODUCTO (
	IN p_cod_producto int ,
    IN p_nuevo_precio real)

BEGIN 
	UPDATE producto set precio_unitario=p_nuevo_precio
		where cod_producto=p_cod_producto;
END //

DELIMITER ;

-- CALL SP_ACTUALIZAR_PRECIO_PRODUCTO(10,132.10);

DELIMITER //
CREATE PROCEDURE SP_INFORME_PRODUCTO(
    IN p_cod_producto INT,
    OUT out_total_cantidad INT,
    OUT out_total_ganancia DECIMAL(10,2),
    OUT out_precio_promedio DECIMAL(10,2)
)
BEGIN
    DECLARE tmp_total_cantidad INT DEFAULT 0;
    DECLARE tmp_total_ganancia DECIMAL(10,2) DEFAULT 0;
    
    SELECT 
       COALESCE(SUM(cantidad), 0),
       COALESCE(SUM(precio_total), 0)
      INTO tmp_total_cantidad, tmp_total_ganancia 
      FROM venta
     WHERE codigo_producto = p_cod_producto;
    
    SET out_total_cantidad =  tmp_total_cantidad;
    SET out_total_ganancia = tmp_total_ganancia;
    
    IF tmp_total_cantidad > 0 THEN
        SET out_precio_promedio = tmp_total_ganancia / tmp_total_cantidad;
    ELSE
        SET out_precio_promedio = 0;
    END IF;
END//
DELIMITER ;

-- CALL SP_INFORME_PRODUCTO(6, @total_Cantidad, @total_ganancia, @precio_promedio);
-- SELECT @total_Cantidad AS CantidadTotal, @total_ganancia AS IngresoTotal, @precio_promedio AS PrecioPromedio;

DELIMITER //
CREATE PROCEDURE SP_REGISTRAR_CLIENTE(
	IN p_cedula INT,
    IN p_nombre TEXT,
    IN p_telefono VARCHAR(20),
    IN p_tipo VARCHAR(20),  
    IN p_email VARCHAR(100),
    IN p_cod_tienda INT
)
BEGIN

    INSERT INTO cliente(cedula,nombre, telefono, tipo, email, codigo_tienda)
    VALUES(p_cedula,p_nombre, p_telefono, p_tipo, p_email, p_cod_tienda);
END//
DELIMITER ;

 -- CALL SP_REGISTRAR_CLIENTE(1061770686,'Alejandro Patino',3137466485,'Premium','jhinnercos@hotmail.com',3);
 
 
 
 
 /* --------------------------------------Creación de Triggers ---------------------------------------------------------*/
 
drop table if  exists LOG_AUDITORIA;
CREATE TABLE IF NOT EXISTS LOG_AUDITORIA 
(
ID_LOG INT AUTO_INCREMENT ,
NOMBRE_DE_ACCION VARCHAR(10) ,
NOMBRE_TABLA VARCHAR(50) ,
USUARIO VARCHAR(100) ,
FECHA_UPD_INS_DEL DATE , 
PRIMARY KEY (ID_LOG)
)
;

drop table if  exists LOG_AUDITORIA_2;
CREATE TABLE IF NOT EXISTS LOG_AUDITORIA_2 
(
ID_LOG INT AUTO_INCREMENT ,
CAMPONUEVO_CAMPOANTERIOR VARCHAR(300), 
NOMBRE_DE_ACCION VARCHAR(10) ,
NOMBRE_TABLA VARCHAR(50) ,
USUARIO VARCHAR(100) ,
FECHA_UPD_INS_DEL DATE    ,
PRIMARY KEY (ID_LOG)
)
;

DROP TRIGGER IF EXISTS TRG_LOG_cliente ;
DELIMITER //
CREATE TRIGGER TRG_LOG_cliente AFTER INSERT ON EmpresaHardware.cliente
FOR EACH ROW 
BEGIN
INSERT INTO LOG_AUDITORIA (NOMBRE_DE_ACCION , NOMBRE_TABLA , USUARIO,FECHA_UPD_INS_DEL)
VALUES ( 'INSERT' , 'cliente' ,CURRENT_USER() , NOW());

END//
DELIMITER ;

-- INSERT INTO EmpresaHardware.cliente (cedula, nombre, telefono, tipo, email, codigo_tienda)
-- VALUES (1061770786, 'Alejandro Pasquel', '3137466486', 'Premium', 'jhinnercos@hotmail.com', 2);

DROP TRIGGER IF EXISTS TRG_LOG_PROVINCIA_2 ;

DELIMITER //
CREATE TRIGGER TRG_LOG_PROVINCIA_2 
AFTER INSERT ON EmpresaHardware.cliente
FOR EACH ROW 
BEGIN
    INSERT INTO LOG_AUDITORIA_2 
      (CAMPONUEVO_CAMPOANTERIOR, NOMBRE_DE_ACCION, NOMBRE_TABLA, USUARIO, FECHA_UPD_INS_DEL)
    VALUES 
      (
        CONCAT(
          'cod_cliente: ', NEW.cedula, ', ',
          'nombre: ', NEW.nombre, ', ',
          'telefono: ', NEW.telefono, ', ',
          'tipo: ', NEW.tipo, ', ',
          'email: ', NEW.email, ', ',
          'codigo_tienda: ', NEW.codigo_tienda
        ),
        'INSERT',
        'cliente',
        CURRENT_USER(),
        NOW()
      );
END//
DELIMITER ;

-- SELECT * FROM  LOG_AUDITORIA_2;

--  SELECT * FROM LOG_AUDITORIA