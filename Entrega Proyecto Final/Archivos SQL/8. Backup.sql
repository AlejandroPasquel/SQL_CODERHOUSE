-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: empresahardware
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `centrodistribucion`
--

DROP TABLE IF EXISTS `centrodistribucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centrodistribucion` (
  `cod_fabrica` int NOT NULL AUTO_INCREMENT,
  `pais` tinytext NOT NULL,
  `ciudad` tinytext NOT NULL,
  `numero_empleados` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`cod_fabrica`),
  KEY `I_centroDistribucion_PC` (`pais`(30),`ciudad`(30))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centrodistribucion`
--

LOCK TABLES `centrodistribucion` WRITE;
/*!40000 ALTER TABLE `centrodistribucion` DISABLE KEYS */;
INSERT INTO `centrodistribucion` VALUES (1,'Estados Unidos','Austin',250),(2,'México','Guadalajara',180),(3,'Alemania','Berlín',300),(4,'Japón','Tokio',220),(5,'Brasil','São Paulo',200);
/*!40000 ALTER TABLE `centrodistribucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cedula` int NOT NULL,
  `nombre` tinytext NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `tipo` enum('Regular','Premium') DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `codigo_tienda` int DEFAULT NULL,
  PRIMARY KEY (`cedula`),
  KEY `FK_clientes_tienda` (`codigo_tienda`),
  KEY `I_clientes_CT` (`nombre`(30),`telefono`),
  CONSTRAINT `FK_clientes_tienda` FOREIGN KEY (`codigo_tienda`) REFERENCES `tienda` (`cod_tienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1012345678,'Juan Pérez','3001234567','Regular','juan.perez@ejemplo.com',1),(1023456789,'María Gómez','3002345678','Premium','maria.gomez@ejemplo.com',2),(1034567890,'Carlos Rodríguez','3103456789','Regular','carlos.rodriguez@ejemplo.com',3),(1045678901,'Ana López','3104567890','Premium','ana.lopez@ejemplo.com',4),(1056789012,'Pedro Martínez','3205678901','Regular','pedro.martinez@ejemplo.com',5),(1067890123,'Laura García','3206789012','Premium','laura.garcia@ejemplo.com',6),(1078901234,'José Fernández','3217890123','Regular','jose.fernandez@ejemplo.com',7),(1089012345,'Lucía Díaz','3218901234','Premium','lucia.diaz@ejemplo.com',8),(1090123456,'Santiago Pérez','3229012345','Regular','santiago.perez@ejemplo.com',9),(1101234567,'Isabel Hernández','3220123456','Premium','isabel.hernandez@ejemplo.com',10),(1112345678,'Miguel Ramírez','3001234567','Regular','miguel.ramirez@ejemplo.com',1),(1123456789,'Raquel Sánchez','3002345678','Premium','raquel.sanchez@ejemplo.com',2),(1134567890,'Fernando Ruiz','3103456789','Regular','fernando.ruiz@ejemplo.com',3),(1145678901,'Patricia Morales','3104567890','Premium','patricia.morales@ejemplo.com',4),(1156789012,'Antonio Gómez','3205678901','Regular','antonio.gomez@ejemplo.com',5),(1167890123,'Marta Díaz','3206789012','Premium','marta.diaz@ejemplo.com',6),(1178901234,'David Fernández','3217890123','Regular','david.fernandez@ejemplo.com',7),(1189012345,'Elena Rodríguez','3218901234','Premium','elena.rodriguez@ejemplo.com',8),(1190123456,'José Luis Martínez','3229012345','Regular','jose.luis.martinez@ejemplo.com',9),(1201234567,'Claudia López','3220123456','Premium','claudia.lopez@ejemplo.com',10),(1212345678,'Ricardo González','3001234567','Regular','ricardo.gonzalez@ejemplo.com',1),(1223456789,'Patricia García','3002345678','Premium','patricia.garcia@ejemplo.com',2),(1234567890,'Luis Torres','3103456789','Regular','luis.torres@ejemplo.com',3),(1245678901,'Carmen Pérez','3104567890','Premium','carmen.perez@ejemplo.com',4),(1256789012,'Alfredo Sánchez','3205678901','Regular','alfredo.sanchez@ejemplo.com',5),(1267890123,'Laura Fernández','3206789012','Premium','laura.fernandez@ejemplo.com',6),(1278901234,'Gabriel López','3217890123','Regular','gabriel.lopez@ejemplo.com',7),(1289012345,'Victoria Ramírez','3218901234','Premium','victoria.ramirez@ejemplo.com',8),(1290123456,'Adrián Díaz','3229012345','Regular','adrian.diaz@ejemplo.com',9),(1301234567,'Raúl Martínez','3220123456','Premium','raul.martinez@ejemplo.com',10),(1312345678,'César Gómez','3001234567','Regular','cesar.gomez@ejemplo.com',1),(1323456789,'Inés Ruiz','3002345678','Premium','ines.ruiz@ejemplo.com',2),(1334567890,'Fernando Rodríguez','3103456789','Regular','fernando.rodriguez@ejemplo.com',3),(1345678901,'Mariana López','3104567890','Premium','mariana.lopez@ejemplo.com',4),(1356789012,'David Martínez','3205678901','Regular','david.martinez@ejemplo.com',5),(1367890123,'Nora González','3206789012','Premium','nora.gonzalez@ejemplo.com',6),(1378901234,'Juan Fernández','3217890123','Regular','juan.fernandez@ejemplo.com',7),(1389012345,'Sara Hernández','3218901234','Premium','sara.hernandez@ejemplo.com',8),(1390123456,'Ricardo Pérez','3229012345','Regular','ricardo.perez@ejemplo.com',9),(1401234567,'Marta Gómez','3220123456','Premium','marta.gomez@ejemplo.com',10),(1412345678,'Alberto Sánchez','3001234567','Regular','alberto.sanchez@ejemplo.com',1),(1423456789,'Liliana Rodríguez','3002345678','Premium','liliana.rodriguez@ejemplo.com',2),(1434567890,'Óscar Ramírez','3103456789','Regular','oscar.ramirez@ejemplo.com',3),(1445678901,'Elena Ruiz','3104567890','Premium','elena.ruiz@ejemplo.com',4),(1456789012,'Daniela López','3205678901','Regular','daniela.lopez@ejemplo.com',5),(1467890123,'Eduardo Fernández','3206789012','Premium','eduardo.fernandez@ejemplo.com',6),(1478901234,'Guillermo Martínez','3217890123','Regular','guillermo.martinez@ejemplo.com',7),(1489012345,'Patricia Díaz','3218901234','Premium','patricia.diaz@ejemplo.com',8),(1490123456,'Carlos López','3229012345','Regular','carlos.lopez@ejemplo.com',9),(1501234567,'Rosa González','3220123456','Premium','rosa.gonzalez@ejemplo.com',10);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `cod_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` tinytext NOT NULL,
  `puesto` tinytext NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `cod_fabrica` int DEFAULT NULL,
  PRIMARY KEY (`cod_empleado`),
  KEY `FK_empleado_fabrica` (`cod_fabrica`),
  KEY `I_empleado_nombre_puesto` (`nombre`(50),`puesto`(50)),
  CONSTRAINT `FK_empleado_fabrica` FOREIGN KEY (`cod_fabrica`) REFERENCES `centrodistribucion` (`cod_fabrica`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Laura García','Gerente de Logística',4500.00,1),(2,'José Fernández','Operador de Almacén',2800.00,2),(3,'Lucía Díaz','Supervisor de Envíos',3200.00,3),(4,'Santiago Pérez','Analista de Inventarios',3500.00,4),(5,'Isabel Hernández','Coordinador de Distribución',4000.00,5),(6,'Ernesto Gutiérrez','Técnico de Almacén',3000.00,2);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envio`
--

DROP TABLE IF EXISTS `envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio` (
  `cod_envio` int NOT NULL AUTO_INCREMENT,
  `cod_venta` varchar(15) DEFAULT NULL,
  `fecha_envio` date NOT NULL,
  `estado` tinytext NOT NULL,
  PRIMARY KEY (`cod_envio`),
  KEY `FK_envio_venta` (`cod_venta`),
  KEY `I_envio_estado_fecha` (`estado`(20),`fecha_envio`),
  CONSTRAINT `FK_envio_venta` FOREIGN KEY (`cod_venta`) REFERENCES `venta` (`cod_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio`
--

LOCK TABLES `envio` WRITE;
/*!40000 ALTER TABLE `envio` DISABLE KEYS */;
INSERT INTO `envio` VALUES (1,'VXP9B8F4G1','2024-01-12','En tránsito'),(2,'AXD7J6W3N2','2024-01-13','Entregado'),(3,'K8Z4N1D7P6','2024-01-14','Pendiente'),(4,'W1L9E3C7U0','2024-01-15','En tránsito'),(5,'P4M2I7A1G5','2024-01-16','Entregado'),(6,'S0H8U1B3K6','2024-01-17','Pendiente'),(7,'J3D4L2P9K0','2024-01-18','En tránsito'),(8,'B7T2Y5Q9V4','2024-01-19','Entregado'),(9,'G1M5D7O9N2','2024-01-20','Pendiente'),(10,'C9V8Z1S6Q3','2024-01-21','En tránsito'),(11,'O7Y3X2F8M9','2024-01-22','Entregado'),(12,'E8J4C9I1H7','2024-01-23','Pendiente'),(13,'R2K1V9W4G8','2024-01-24','En tránsito'),(14,'D5T9P7M2Q0','2024-01-25','Entregado'),(15,'V6Z2G8X1P5','2024-01-26','Pendiente'),(16,'N1C0L3P8M2','2024-01-27','En tránsito'),(17,'F2J8Q4X7U1','2024-01-28','Entregado'),(18,'B9T3V6W2Y4','2024-01-29','Pendiente'),(19,'P4M0F7S1X8','2024-01-30','En tránsito'),(20,'Q3C9M8J2P0','2024-01-31','Entregado'),(21,'S6Y0T7J9B4','2024-02-01','En tránsito');
/*!40000 ALTER TABLE `envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_auditoria`
--

DROP TABLE IF EXISTS `log_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_auditoria` (
  `ID_LOG` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_DE_ACCION` varchar(10) DEFAULT NULL,
  `NOMBRE_TABLA` varchar(50) DEFAULT NULL,
  `USUARIO` varchar(100) DEFAULT NULL,
  `FECHA_UPD_INS_DEL` date DEFAULT NULL,
  PRIMARY KEY (`ID_LOG`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_auditoria`
--

LOCK TABLES `log_auditoria` WRITE;
/*!40000 ALTER TABLE `log_auditoria` DISABLE KEYS */;
INSERT INTO `log_auditoria` VALUES (1,'INSERT','cliente','root@localhost','2025-02-20'),(2,'INSERT','cliente','root@localhost','2025-02-20'),(3,'INSERT','cliente','root@localhost','2025-02-20'),(4,'INSERT','cliente','root@localhost','2025-02-20'),(5,'INSERT','cliente','root@localhost','2025-02-20'),(6,'INSERT','cliente','root@localhost','2025-02-20'),(7,'INSERT','cliente','root@localhost','2025-02-20'),(8,'INSERT','cliente','root@localhost','2025-02-20'),(9,'INSERT','cliente','root@localhost','2025-02-20'),(10,'INSERT','cliente','root@localhost','2025-02-20'),(11,'INSERT','cliente','root@localhost','2025-02-20'),(12,'INSERT','cliente','root@localhost','2025-02-20'),(13,'INSERT','cliente','root@localhost','2025-02-20'),(14,'INSERT','cliente','root@localhost','2025-02-20'),(15,'INSERT','cliente','root@localhost','2025-02-20'),(16,'INSERT','cliente','root@localhost','2025-02-20'),(17,'INSERT','cliente','root@localhost','2025-02-20'),(18,'INSERT','cliente','root@localhost','2025-02-20'),(19,'INSERT','cliente','root@localhost','2025-02-20'),(20,'INSERT','cliente','root@localhost','2025-02-20'),(21,'INSERT','cliente','root@localhost','2025-02-20'),(22,'INSERT','cliente','root@localhost','2025-02-20'),(23,'INSERT','cliente','root@localhost','2025-02-20'),(24,'INSERT','cliente','root@localhost','2025-02-20'),(25,'INSERT','cliente','root@localhost','2025-02-20'),(26,'INSERT','cliente','root@localhost','2025-02-20'),(27,'INSERT','cliente','root@localhost','2025-02-20'),(28,'INSERT','cliente','root@localhost','2025-02-20'),(29,'INSERT','cliente','root@localhost','2025-02-20'),(30,'INSERT','cliente','root@localhost','2025-02-20'),(31,'INSERT','cliente','root@localhost','2025-02-20'),(32,'INSERT','cliente','root@localhost','2025-02-20'),(33,'INSERT','cliente','root@localhost','2025-02-20'),(34,'INSERT','cliente','root@localhost','2025-02-20'),(35,'INSERT','cliente','root@localhost','2025-02-20'),(36,'INSERT','cliente','root@localhost','2025-02-20'),(37,'INSERT','cliente','root@localhost','2025-02-20'),(38,'INSERT','cliente','root@localhost','2025-02-20'),(39,'INSERT','cliente','root@localhost','2025-02-20'),(40,'INSERT','cliente','root@localhost','2025-02-20'),(41,'INSERT','cliente','root@localhost','2025-02-20'),(42,'INSERT','cliente','root@localhost','2025-02-20'),(43,'INSERT','cliente','root@localhost','2025-02-20'),(44,'INSERT','cliente','root@localhost','2025-02-20'),(45,'INSERT','cliente','root@localhost','2025-02-20'),(46,'INSERT','cliente','root@localhost','2025-02-20'),(47,'INSERT','cliente','root@localhost','2025-02-20'),(48,'INSERT','cliente','root@localhost','2025-02-20'),(49,'INSERT','cliente','root@localhost','2025-02-20'),(50,'INSERT','cliente','root@localhost','2025-02-20');
/*!40000 ALTER TABLE `log_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_auditoria_2`
--

DROP TABLE IF EXISTS `log_auditoria_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_auditoria_2` (
  `ID_LOG` int NOT NULL AUTO_INCREMENT,
  `CAMPONUEVO_CAMPOANTERIOR` varchar(300) DEFAULT NULL,
  `NOMBRE_DE_ACCION` varchar(10) DEFAULT NULL,
  `NOMBRE_TABLA` varchar(50) DEFAULT NULL,
  `USUARIO` varchar(100) DEFAULT NULL,
  `FECHA_UPD_INS_DEL` date DEFAULT NULL,
  PRIMARY KEY (`ID_LOG`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_auditoria_2`
--

LOCK TABLES `log_auditoria_2` WRITE;
/*!40000 ALTER TABLE `log_auditoria_2` DISABLE KEYS */;
INSERT INTO `log_auditoria_2` VALUES (1,'cod_cliente: 1012345678, nombre: Juan Pérez, telefono: 3001234567, tipo: Regular, email: juan.perez@ejemplo.com, codigo_tienda: 1','INSERT','cliente','root@localhost','2025-02-20'),(2,'cod_cliente: 1023456789, nombre: María Gómez, telefono: 3002345678, tipo: Premium, email: maria.gomez@ejemplo.com, codigo_tienda: 2','INSERT','cliente','root@localhost','2025-02-20'),(3,'cod_cliente: 1034567890, nombre: Carlos Rodríguez, telefono: 3103456789, tipo: Regular, email: carlos.rodriguez@ejemplo.com, codigo_tienda: 3','INSERT','cliente','root@localhost','2025-02-20'),(4,'cod_cliente: 1045678901, nombre: Ana López, telefono: 3104567890, tipo: Premium, email: ana.lopez@ejemplo.com, codigo_tienda: 4','INSERT','cliente','root@localhost','2025-02-20'),(5,'cod_cliente: 1056789012, nombre: Pedro Martínez, telefono: 3205678901, tipo: Regular, email: pedro.martinez@ejemplo.com, codigo_tienda: 5','INSERT','cliente','root@localhost','2025-02-20'),(6,'cod_cliente: 1067890123, nombre: Laura García, telefono: 3206789012, tipo: Premium, email: laura.garcia@ejemplo.com, codigo_tienda: 6','INSERT','cliente','root@localhost','2025-02-20'),(7,'cod_cliente: 1078901234, nombre: José Fernández, telefono: 3217890123, tipo: Regular, email: jose.fernandez@ejemplo.com, codigo_tienda: 7','INSERT','cliente','root@localhost','2025-02-20'),(8,'cod_cliente: 1089012345, nombre: Lucía Díaz, telefono: 3218901234, tipo: Premium, email: lucia.diaz@ejemplo.com, codigo_tienda: 8','INSERT','cliente','root@localhost','2025-02-20'),(9,'cod_cliente: 1090123456, nombre: Santiago Pérez, telefono: 3229012345, tipo: Regular, email: santiago.perez@ejemplo.com, codigo_tienda: 9','INSERT','cliente','root@localhost','2025-02-20'),(10,'cod_cliente: 1101234567, nombre: Isabel Hernández, telefono: 3220123456, tipo: Premium, email: isabel.hernandez@ejemplo.com, codigo_tienda: 10','INSERT','cliente','root@localhost','2025-02-20'),(11,'cod_cliente: 1112345678, nombre: Miguel Ramírez, telefono: 3001234567, tipo: Regular, email: miguel.ramirez@ejemplo.com, codigo_tienda: 1','INSERT','cliente','root@localhost','2025-02-20'),(12,'cod_cliente: 1123456789, nombre: Raquel Sánchez, telefono: 3002345678, tipo: Premium, email: raquel.sanchez@ejemplo.com, codigo_tienda: 2','INSERT','cliente','root@localhost','2025-02-20'),(13,'cod_cliente: 1134567890, nombre: Fernando Ruiz, telefono: 3103456789, tipo: Regular, email: fernando.ruiz@ejemplo.com, codigo_tienda: 3','INSERT','cliente','root@localhost','2025-02-20'),(14,'cod_cliente: 1145678901, nombre: Patricia Morales, telefono: 3104567890, tipo: Premium, email: patricia.morales@ejemplo.com, codigo_tienda: 4','INSERT','cliente','root@localhost','2025-02-20'),(15,'cod_cliente: 1156789012, nombre: Antonio Gómez, telefono: 3205678901, tipo: Regular, email: antonio.gomez@ejemplo.com, codigo_tienda: 5','INSERT','cliente','root@localhost','2025-02-20'),(16,'cod_cliente: 1167890123, nombre: Marta Díaz, telefono: 3206789012, tipo: Premium, email: marta.diaz@ejemplo.com, codigo_tienda: 6','INSERT','cliente','root@localhost','2025-02-20'),(17,'cod_cliente: 1178901234, nombre: David Fernández, telefono: 3217890123, tipo: Regular, email: david.fernandez@ejemplo.com, codigo_tienda: 7','INSERT','cliente','root@localhost','2025-02-20'),(18,'cod_cliente: 1189012345, nombre: Elena Rodríguez, telefono: 3218901234, tipo: Premium, email: elena.rodriguez@ejemplo.com, codigo_tienda: 8','INSERT','cliente','root@localhost','2025-02-20'),(19,'cod_cliente: 1190123456, nombre: José Luis Martínez, telefono: 3229012345, tipo: Regular, email: jose.luis.martinez@ejemplo.com, codigo_tienda: 9','INSERT','cliente','root@localhost','2025-02-20'),(20,'cod_cliente: 1201234567, nombre: Claudia López, telefono: 3220123456, tipo: Premium, email: claudia.lopez@ejemplo.com, codigo_tienda: 10','INSERT','cliente','root@localhost','2025-02-20'),(21,'cod_cliente: 1212345678, nombre: Ricardo González, telefono: 3001234567, tipo: Regular, email: ricardo.gonzalez@ejemplo.com, codigo_tienda: 1','INSERT','cliente','root@localhost','2025-02-20'),(22,'cod_cliente: 1223456789, nombre: Patricia García, telefono: 3002345678, tipo: Premium, email: patricia.garcia@ejemplo.com, codigo_tienda: 2','INSERT','cliente','root@localhost','2025-02-20'),(23,'cod_cliente: 1234567890, nombre: Luis Torres, telefono: 3103456789, tipo: Regular, email: luis.torres@ejemplo.com, codigo_tienda: 3','INSERT','cliente','root@localhost','2025-02-20'),(24,'cod_cliente: 1245678901, nombre: Carmen Pérez, telefono: 3104567890, tipo: Premium, email: carmen.perez@ejemplo.com, codigo_tienda: 4','INSERT','cliente','root@localhost','2025-02-20'),(25,'cod_cliente: 1256789012, nombre: Alfredo Sánchez, telefono: 3205678901, tipo: Regular, email: alfredo.sanchez@ejemplo.com, codigo_tienda: 5','INSERT','cliente','root@localhost','2025-02-20'),(26,'cod_cliente: 1267890123, nombre: Laura Fernández, telefono: 3206789012, tipo: Premium, email: laura.fernandez@ejemplo.com, codigo_tienda: 6','INSERT','cliente','root@localhost','2025-02-20'),(27,'cod_cliente: 1278901234, nombre: Gabriel López, telefono: 3217890123, tipo: Regular, email: gabriel.lopez@ejemplo.com, codigo_tienda: 7','INSERT','cliente','root@localhost','2025-02-20'),(28,'cod_cliente: 1289012345, nombre: Victoria Ramírez, telefono: 3218901234, tipo: Premium, email: victoria.ramirez@ejemplo.com, codigo_tienda: 8','INSERT','cliente','root@localhost','2025-02-20'),(29,'cod_cliente: 1290123456, nombre: Adrián Díaz, telefono: 3229012345, tipo: Regular, email: adrian.diaz@ejemplo.com, codigo_tienda: 9','INSERT','cliente','root@localhost','2025-02-20'),(30,'cod_cliente: 1301234567, nombre: Raúl Martínez, telefono: 3220123456, tipo: Premium, email: raul.martinez@ejemplo.com, codigo_tienda: 10','INSERT','cliente','root@localhost','2025-02-20'),(31,'cod_cliente: 1312345678, nombre: César Gómez, telefono: 3001234567, tipo: Regular, email: cesar.gomez@ejemplo.com, codigo_tienda: 1','INSERT','cliente','root@localhost','2025-02-20'),(32,'cod_cliente: 1323456789, nombre: Inés Ruiz, telefono: 3002345678, tipo: Premium, email: ines.ruiz@ejemplo.com, codigo_tienda: 2','INSERT','cliente','root@localhost','2025-02-20'),(33,'cod_cliente: 1334567890, nombre: Fernando Rodríguez, telefono: 3103456789, tipo: Regular, email: fernando.rodriguez@ejemplo.com, codigo_tienda: 3','INSERT','cliente','root@localhost','2025-02-20'),(34,'cod_cliente: 1345678901, nombre: Mariana López, telefono: 3104567890, tipo: Premium, email: mariana.lopez@ejemplo.com, codigo_tienda: 4','INSERT','cliente','root@localhost','2025-02-20'),(35,'cod_cliente: 1356789012, nombre: David Martínez, telefono: 3205678901, tipo: Regular, email: david.martinez@ejemplo.com, codigo_tienda: 5','INSERT','cliente','root@localhost','2025-02-20'),(36,'cod_cliente: 1367890123, nombre: Nora González, telefono: 3206789012, tipo: Premium, email: nora.gonzalez@ejemplo.com, codigo_tienda: 6','INSERT','cliente','root@localhost','2025-02-20'),(37,'cod_cliente: 1378901234, nombre: Juan Fernández, telefono: 3217890123, tipo: Regular, email: juan.fernandez@ejemplo.com, codigo_tienda: 7','INSERT','cliente','root@localhost','2025-02-20'),(38,'cod_cliente: 1389012345, nombre: Sara Hernández, telefono: 3218901234, tipo: Premium, email: sara.hernandez@ejemplo.com, codigo_tienda: 8','INSERT','cliente','root@localhost','2025-02-20'),(39,'cod_cliente: 1390123456, nombre: Ricardo Pérez, telefono: 3229012345, tipo: Regular, email: ricardo.perez@ejemplo.com, codigo_tienda: 9','INSERT','cliente','root@localhost','2025-02-20'),(40,'cod_cliente: 1401234567, nombre: Marta Gómez, telefono: 3220123456, tipo: Premium, email: marta.gomez@ejemplo.com, codigo_tienda: 10','INSERT','cliente','root@localhost','2025-02-20'),(41,'cod_cliente: 1412345678, nombre: Alberto Sánchez, telefono: 3001234567, tipo: Regular, email: alberto.sanchez@ejemplo.com, codigo_tienda: 1','INSERT','cliente','root@localhost','2025-02-20'),(42,'cod_cliente: 1423456789, nombre: Liliana Rodríguez, telefono: 3002345678, tipo: Premium, email: liliana.rodriguez@ejemplo.com, codigo_tienda: 2','INSERT','cliente','root@localhost','2025-02-20'),(43,'cod_cliente: 1434567890, nombre: Óscar Ramírez, telefono: 3103456789, tipo: Regular, email: oscar.ramirez@ejemplo.com, codigo_tienda: 3','INSERT','cliente','root@localhost','2025-02-20'),(44,'cod_cliente: 1445678901, nombre: Elena Ruiz, telefono: 3104567890, tipo: Premium, email: elena.ruiz@ejemplo.com, codigo_tienda: 4','INSERT','cliente','root@localhost','2025-02-20'),(45,'cod_cliente: 1456789012, nombre: Daniela López, telefono: 3205678901, tipo: Regular, email: daniela.lopez@ejemplo.com, codigo_tienda: 5','INSERT','cliente','root@localhost','2025-02-20'),(46,'cod_cliente: 1467890123, nombre: Eduardo Fernández, telefono: 3206789012, tipo: Premium, email: eduardo.fernandez@ejemplo.com, codigo_tienda: 6','INSERT','cliente','root@localhost','2025-02-20'),(47,'cod_cliente: 1478901234, nombre: Guillermo Martínez, telefono: 3217890123, tipo: Regular, email: guillermo.martinez@ejemplo.com, codigo_tienda: 7','INSERT','cliente','root@localhost','2025-02-20'),(48,'cod_cliente: 1489012345, nombre: Patricia Díaz, telefono: 3218901234, tipo: Premium, email: patricia.diaz@ejemplo.com, codigo_tienda: 8','INSERT','cliente','root@localhost','2025-02-20'),(49,'cod_cliente: 1490123456, nombre: Carlos López, telefono: 3229012345, tipo: Regular, email: carlos.lopez@ejemplo.com, codigo_tienda: 9','INSERT','cliente','root@localhost','2025-02-20'),(50,'cod_cliente: 1501234567, nombre: Rosa González, telefono: 3220123456, tipo: Premium, email: rosa.gonzalez@ejemplo.com, codigo_tienda: 10','INSERT','cliente','root@localhost','2025-02-20');
/*!40000 ALTER TABLE `log_auditoria_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `cod_producto` int NOT NULL,
  `nombre` tinytext NOT NULL,
  `precio_unitario` double NOT NULL,
  PRIMARY KEY (`cod_producto`),
  KEY `I_productos_nombre` (`nombre`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Tarjeta Gráfica RTX 4090',1599.99),(2,'Procesador Intel Core i9-13900K',699.99),(3,'Teclado Mecánico RGB',149.99),(4,'Monitor Gaming 240Hz',499.99),(5,'Silla Gamer Ergonométrica',299.99),(6,'Mouse Gaming Inalámbrico',99.99),(7,'SSD NVMe 2TB',179.99),(8,'Placa Base Z790',349.99),(9,'Refrigeración Líquida 360mm',249.99),(10,'Caja ATX con RGB',129.99),(11,'Fuente de Poder 850W Gold',129.99),(12,'Headset Gaming 7.1',119.99),(13,'Memoria RAM 32GB DDR5',199.99),(14,'Combo Teclado y Mouse Gaming',69.99),(15,'Base de Enfriamiento para Laptop',49.99),(16,'Disco Duro Externo 1TB',89.99);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `cod_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` tinytext NOT NULL,
  `contacto` tinytext,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_proveedor`),
  KEY `I_proveedor_nombre` (`nombre`(50))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'TechSupplier Inc.','Juan Pérez','3001234567','contacto@techsupplier.com'),(2,'Global Hardware Ltd.','María Gómez','3102345678','ventas@globalhardware.com'),(3,'ElectroParts SA','Carlos Rodríguez','3203456789','info@electroparts.com'),(4,'Componentes Express','Ana López','3304567890','soporte@componentesexpress.com'),(5,'Distribuidora PC','Pedro Martínez','3405678901','contacto@distribuidorapc.com'),(6,'MegaComponents','Andrés López','3509876543','contacto@megacomponents.com');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda`
--

DROP TABLE IF EXISTS `tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda` (
  `cod_tienda` int NOT NULL AUTO_INCREMENT,
  `ciudad` tinytext NOT NULL,
  `tipologia` enum('Fisica','Online') DEFAULT NULL,
  `tamano_mt2` decimal(10,0) DEFAULT NULL,
  `numero_fabrica` int DEFAULT NULL,
  PRIMARY KEY (`cod_tienda`),
  KEY `FK_tiendas_fabrica` (`numero_fabrica`),
  KEY `I_tiendas_CT` (`ciudad`(30),`tipologia`),
  CONSTRAINT `FK_tiendas_fabrica` FOREIGN KEY (`numero_fabrica`) REFERENCES `centrodistribucion` (`cod_fabrica`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda`
--

LOCK TABLES `tienda` WRITE;
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
INSERT INTO `tienda` VALUES (1,'Austin','Fisica',350,1),(2,'Houston','Fisica',400,1),(3,'Guadalajara','Fisica',300,2),(4,'Monterrey','Fisica',250,2),(5,'Berlín','Fisica',500,3),(6,'Múnich','Fisica',450,3),(7,'Tokio','Online',0,4),(8,'Osaka','Fisica',320,4),(9,'São Paulo','Fisica',400,5),(10,'Río de Janeiro','Fisica',370,5);
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `cod_venta` varchar(15) NOT NULL,
  `codigo_cliente` int DEFAULT NULL,
  `codigo_producto` int DEFAULT NULL,
  `cantidad` decimal(10,0) DEFAULT NULL,
  `precio_total` double NOT NULL,
  `fecha_pedido` date DEFAULT NULL,
  PRIMARY KEY (`cod_venta`),
  KEY `FK_ventas_cliente` (`codigo_cliente`),
  KEY `FK_ventas_producto` (`codigo_producto`),
  CONSTRAINT `FK_ventas_cliente` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`cedula`),
  CONSTRAINT `FK_ventas_producto` FOREIGN KEY (`codigo_producto`) REFERENCES `producto` (`cod_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES ('AXD7J6W3N2',1023456789,5,1,120000,'2024-01-11'),('B4G9W6F2N0',1345678901,13,2,86000,'2024-02-13'),('B7T2Y5Q9V4',1089012345,4,2,110000,'2024-01-17'),('B9T3V6W2Y4',1189012345,8,4,96000,'2024-01-27'),('C3P1R6X9T2',1489012345,3,3,75000,'2024-02-27'),('C9V8Z1S6Q3',1101234567,9,1,150000,'2024-01-19'),('D5T9P7M2Q0',1145678901,15,1,78000,'2024-01-23'),('D9P5V1J3T2',1334567890,11,1,67000,'2024-02-12'),('E8J4C9I1H7',1123456789,12,3,105000,'2024-01-21'),('F0R7G9P2X8',1445678901,10,2,120000,'2024-02-23'),('F2J8Q4X7U1',1178901234,5,3,68000,'2024-01-26'),('F2R9T7J6B1',1312345678,8,3,45000,'2024-02-10'),('F6B8M3Y0Q1',1067890123,7,2,48000,'2024-03-06'),('G1M5D7O9N2',1090123456,6,5,43000,'2024-01-18'),('H2P9F4K7Y1',1467890123,14,5,95000,'2024-02-25'),('H6N2J4X9B7',1278901234,5,4,98000,'2024-02-06'),('J2M5Q8K9X4',1389012345,1,2,49000,'2024-02-17'),('J3D4L2P9K0',1078901234,1,3,85000,'2024-01-16'),('K1X4W9L2V7',1223456789,1,3,120000,'2024-02-01'),('K8Z4N1D7P6',1034567890,8,3,30000,'2024-01-12'),('L0V9D7B2N1',1490123456,1,4,65000,'2024-02-28'),('L8F4Y1D3P5',1256789012,9,5,56000,'2024-02-04'),('L8J4R1P9Y5',1423456789,5,4,80000,'2024-02-21'),('M3K8P7F1Y2',1289012345,7,1,65000,'2024-02-07'),('M8Q5X2G9R0',1501234567,6,5,73000,'2024-02-29'),('N1C0L3P8M2',1167890123,3,2,50000,'2024-01-25'),('N4F1K8V9J2',1012345678,2,2,50000,'2024-03-01'),('O2M6T5J7B4',1023456789,5,4,64000,'2024-03-02'),('O2Q9J1B4T5',1290123456,2,5,54000,'2024-02-08'),('O7Y3X2F8M9',1112345678,13,4,65000,'2024-01-20'),('P4M0F7S1X8',1190123456,10,1,86000,'2024-01-28'),('P4M2I7A1G5',1056789012,2,4,95000,'2024-01-14'),('P9Y8Q1C6F0',1034567890,8,3,95000,'2024-03-03'),('Q1X9V3M2J7',1412345678,3,2,96000,'2024-02-20'),('Q3C9M8J2P0',1201234567,2,5,55000,'2024-01-29'),('R2K1V9W4G8',1134567890,11,2,92000,'2024-01-22'),('R7K6Q3P9M0',1245678901,6,2,102000,'2024-02-03'),('S0H8U1B3K6',1067890123,7,1,70000,'2024-01-15'),('S1L4G9P2V0',1390123456,6,1,75000,'2024-02-18'),('S4D8V3X9G0',1301234567,10,2,80000,'2024-02-09'),('S6Y0T7J9B4',1212345678,7,2,72000,'2024-01-30'),('T2G5J8D9C3',1234567890,4,1,92000,'2024-02-02'),('T9C2P8B7D4',1401234567,9,5,68000,'2024-02-19'),('V1G3B9W5S2',1045678901,10,1,87000,'2024-03-04'),('V2K9P6S0T5',1367890123,15,5,60000,'2024-02-15'),('V3W1D7M9T2',1434567890,8,3,110000,'2024-02-22'),('V6Z2G8X1P5',1156789012,14,4,43000,'2024-01-24'),('VXP9B8F4G1',1012345678,3,2,50000,'2024-01-10'),('W1L9E3C7U0',1045678901,10,2,80000,'2024-01-13'),('X4G7B9D2P0',1478901234,7,2,92000,'2024-02-26'),('X7Y5R2M0D8',1356789012,12,3,105000,'2024-02-14'),('Y3C2T9M0W4',1323456789,4,4,78000,'2024-02-11'),('Z1H9T3D7B0',1378901234,14,4,94000,'2024-02-16'),('Z2J4N9S0P8',1056789012,2,5,55000,'2024-03-05'),('Z9M8D5T3N0',1456789012,12,1,105000,'2024-02-24'),('Z9V7T2G3C1',1267890123,3,3,75000,'2024-02-05');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_clientes_compra`
--

DROP TABLE IF EXISTS `vw_clientes_compra`;
/*!50001 DROP VIEW IF EXISTS `vw_clientes_compra`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_clientes_compra` AS SELECT 
 1 AS `cedula`,
 1 AS `cliente`,
 1 AS `tipo`,
 1 AS `email`,
 1 AS `tienda`,
 1 AS `num_ventas`,
 1 AS `total_compras`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_empleados_salario`
--

DROP TABLE IF EXISTS `vw_empleados_salario`;
/*!50001 DROP VIEW IF EXISTS `vw_empleados_salario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_empleados_salario` AS SELECT 
 1 AS `cod_empleado`,
 1 AS `empleado`,
 1 AS `puesto`,
 1 AS `salario`,
 1 AS `ubicacion_centro`,
 1 AS `pais`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_envios_estado`
--

DROP TABLE IF EXISTS `vw_envios_estado`;
/*!50001 DROP VIEW IF EXISTS `vw_envios_estado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_envios_estado` AS SELECT 
 1 AS `cod_envio`,
 1 AS `cod_venta`,
 1 AS `fecha_pedido`,
 1 AS `fecha_envio`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_proveedores_contacto`
--

DROP TABLE IF EXISTS `vw_proveedores_contacto`;
/*!50001 DROP VIEW IF EXISTS `vw_proveedores_contacto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_proveedores_contacto` AS SELECT 
 1 AS `cod_proveedor`,
 1 AS `proveedor`,
 1 AS `contacto`,
 1 AS `telefono`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_tiendas_rendimiento`
--

DROP TABLE IF EXISTS `vw_tiendas_rendimiento`;
/*!50001 DROP VIEW IF EXISTS `vw_tiendas_rendimiento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_tiendas_rendimiento` AS SELECT 
 1 AS `cod_tienda`,
 1 AS `ciudad_tienda`,
 1 AS `tipologia`,
 1 AS `ciudad_centro`,
 1 AS `pais`,
 1 AS `total_ventas`,
 1 AS `num_ventas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ventas_detalladas`
--

DROP TABLE IF EXISTS `vw_ventas_detalladas`;
/*!50001 DROP VIEW IF EXISTS `vw_ventas_detalladas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ventas_detalladas` AS SELECT 
 1 AS `cod_venta`,
 1 AS `fecha_pedido`,
 1 AS `cliente`,
 1 AS `producto`,
 1 AS `cantidad`,
 1 AS `precio_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_clientes_compra`
--

/*!50001 DROP VIEW IF EXISTS `vw_clientes_compra`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_clientes_compra` AS select `c`.`cedula` AS `cedula`,`c`.`nombre` AS `cliente`,`c`.`tipo` AS `tipo`,`c`.`email` AS `email`,`t`.`ciudad` AS `tienda`,count(`v`.`cod_venta`) AS `num_ventas`,coalesce(sum(`v`.`precio_total`),0) AS `total_compras` from ((`cliente` `c` left join `venta` `v` on((`c`.`cedula` = `v`.`codigo_cliente`))) left join `tienda` `t` on((`c`.`codigo_tienda` = `t`.`cod_tienda`))) group by `c`.`cedula`,`c`.`nombre`,`c`.`tipo`,`c`.`email`,`t`.`ciudad` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_empleados_salario`
--

/*!50001 DROP VIEW IF EXISTS `vw_empleados_salario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_empleados_salario` AS select `e`.`cod_empleado` AS `cod_empleado`,`e`.`nombre` AS `empleado`,`e`.`puesto` AS `puesto`,`e`.`salario` AS `salario`,`cd`.`ciudad` AS `ubicacion_centro`,`cd`.`pais` AS `pais` from (`empleado` `e` join `centrodistribucion` `cd` on((`e`.`cod_fabrica` = `cd`.`cod_fabrica`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_envios_estado`
--

/*!50001 DROP VIEW IF EXISTS `vw_envios_estado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_envios_estado` AS select `e`.`cod_envio` AS `cod_envio`,`e`.`cod_venta` AS `cod_venta`,`v`.`fecha_pedido` AS `fecha_pedido`,`e`.`fecha_envio` AS `fecha_envio`,`e`.`estado` AS `estado` from (`envio` `e` join `venta` `v` on((`e`.`cod_venta` = `v`.`cod_venta`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_proveedores_contacto`
--

/*!50001 DROP VIEW IF EXISTS `vw_proveedores_contacto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_proveedores_contacto` AS select `proveedor`.`cod_proveedor` AS `cod_proveedor`,`proveedor`.`nombre` AS `proveedor`,`proveedor`.`contacto` AS `contacto`,`proveedor`.`telefono` AS `telefono`,`proveedor`.`email` AS `email` from `proveedor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_tiendas_rendimiento`
--

/*!50001 DROP VIEW IF EXISTS `vw_tiendas_rendimiento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tiendas_rendimiento` AS select `t`.`cod_tienda` AS `cod_tienda`,`t`.`ciudad` AS `ciudad_tienda`,`t`.`tipologia` AS `tipologia`,`cd`.`ciudad` AS `ciudad_centro`,`cd`.`pais` AS `pais`,coalesce(sum(`v`.`precio_total`),0) AS `total_ventas`,count(`v`.`cod_venta`) AS `num_ventas` from (((`tienda` `t` join `centrodistribucion` `cd` on((`t`.`numero_fabrica` = `cd`.`cod_fabrica`))) left join `cliente` `c` on((`c`.`codigo_tienda` = `t`.`cod_tienda`))) left join `venta` `v` on((`c`.`cedula` = `v`.`codigo_cliente`))) group by `t`.`cod_tienda`,`t`.`ciudad`,`t`.`tipologia`,`cd`.`ciudad`,`cd`.`pais` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ventas_detalladas`
--

/*!50001 DROP VIEW IF EXISTS `vw_ventas_detalladas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ventas_detalladas` AS select `v`.`cod_venta` AS `cod_venta`,`v`.`fecha_pedido` AS `fecha_pedido`,`c`.`nombre` AS `cliente`,`p`.`nombre` AS `producto`,`v`.`cantidad` AS `cantidad`,`v`.`precio_total` AS `precio_total` from ((`venta` `v` join `cliente` `c` on((`v`.`codigo_cliente` = `c`.`cedula`))) join `producto` `p` on((`v`.`codigo_producto` = `p`.`cod_producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-24 20:25:56
