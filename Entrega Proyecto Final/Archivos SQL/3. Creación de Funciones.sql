/* --------------------------------Creacion de funciones-----------------------------------------------------------------*/
USE EmpresaHardware;

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