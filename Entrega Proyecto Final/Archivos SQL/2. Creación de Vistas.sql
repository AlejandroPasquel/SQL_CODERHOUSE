/* --------------------------------Creacion de vistas-----------------------------------------------------------------*/
USE EmpresaHardware;
DROP VIEW IF EXISTS vw_ventas_detalladas ;
DROP VIEW IF EXISTS vw_tiendas_rendimiento;
DROP VIEW IF EXISTS vw_clientes_compra;
DROP VIEW IF EXISTS vw_proveedores_contacto;
DROP VIEW IF EXISTS vw_empleados_salario;
DROP VIEW IF EXISTS vw_envios_estado;

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


CREATE OR REPLACE VIEW vw_proveedores_contacto AS
SELECT 
    cod_proveedor,
    nombre AS proveedor,
    contacto,
    telefono,
    email
FROM proveedor;

CREATE OR REPLACE VIEW vw_empleados_salario AS
SELECT 
    e.cod_empleado,
    e.nombre AS empleado,
    e.puesto,
    e.salario,
    cd.ciudad AS ubicacion_centro,
    cd.pais
FROM empleado e
JOIN centroDistribucion cd ON e.cod_fabrica = cd.cod_fabrica;

CREATE OR REPLACE VIEW vw_envios_estado AS
SELECT 
    e.cod_envio,
    e.cod_venta,
    v.fecha_pedido,
    e.fecha_envio,
    e.estado
FROM envio e
JOIN venta v ON e.cod_venta = v.cod_venta;