
USE EmpresaHardware;

/* --------------------------------------Creación de Transacciones ---------------------------------------------------------*/
 
/* Transacción 1: Registrar un nuevo proveedor y un nuevo producto suministrado por este proveedor */
SET autocommit = 0;
START TRANSACTION;

INSERT INTO proveedor (cod_proveedor, nombre, contacto, telefono, email)
VALUES (6, 'MegaComponents', 'Andrés López', '3509876543', 'contacto@megacomponents.com');

INSERT INTO producto (cod_producto, nombre, precio_unitario)
VALUES (16, 'Disco Duro Externo 1TB', 89.99);

COMMIT;

/* Transacción 2: Registrar un nuevo empleado y asociarlo a un centro de distribución */
SET autocommit = 0;
START TRANSACTION;

INSERT INTO empleado (cod_empleado, nombre, puesto, salario, cod_fabrica)
VALUES (6, 'Ernesto Gutiérrez', 'Técnico de Almacén', 3000.00, 2);

INSERT INTO envio (cod_envio, cod_venta, fecha_envio, estado)
VALUES (21, 'S6Y0T7J9B4', '2024-02-01', 'En tránsito');

COMMIT;


