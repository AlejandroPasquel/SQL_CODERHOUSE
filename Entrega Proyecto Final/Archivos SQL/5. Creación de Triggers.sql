/* --------------------------------------Creación de Triggers ---------------------------------------------------------*/
USE EmpresaHardware;
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