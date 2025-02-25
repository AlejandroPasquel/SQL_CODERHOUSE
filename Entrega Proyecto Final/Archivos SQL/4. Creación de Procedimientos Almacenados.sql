 /*--------------------------------------PROCEDIMIENTOS ALMACENADOS-----------------------------------------------------------------------------------*/
 
 USE EmpresaHardware;
 DROP PROCEDURE IF EXISTS SP_REGISTRAR_VENTA;
 DROP PROCEDURE IF EXISTS SP_ACTUALIZAR_PRECIO_PRODUCTO;
 DROP PROCEDURE IF EXISTS SP_INFORME_PRODUCTO;
 DROP PROCEDURE IF EXISTS SP_REGISTRAR_CLIENTE;
 DROP PROCEDURE IF EXISTS SP_REGISTRAR_ENVIO;
 
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
 
 
DELIMITER //


CREATE PROCEDURE SP_REGISTRAR_ENVIO(
    IN p_cod_venta INT,
    IN p_fecha_envio DATE,
    IN p_estado TEXT(20)
)
BEGIN
    INSERT INTO envio (cod_venta, fecha_envio, estado)
    VALUES (p_cod_venta, p_fecha_envio, p_estado);
END //

DELIMITER ;
 -- CALL SP_REGISTRAR_ENVIO(123, '2024-02-20', 'En tránsito');