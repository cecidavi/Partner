/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: parnet_db
-- ------------------------------------------------------
-- Server version	11.7.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `logo_url` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES
(1,'Gobierno de Saltillo','https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftransparenciasaltillo.mx%2Fwp-content%2Fuploads%2F2021%2F06%2FESCUDOSALTILLOVEDA.png&f=1&nofb=1&ipt=970d1c0c89484e4c1d4d435402e5829c9e1ebdfad4602688fd6aac89ef9507f7','https://saltillo.gob.mx/'),
(2,'Coca-Cola FEMSA','https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Flogos-world.net%2Fwp-content%2Fuploads%2F2020%2F03%2FCoca-Cola-Logo.png&f=1&nofb=1&ipt=eef3afdbeca4aa9ee1f92ab07e747260a5ee064ced384338fc4a833010b2420f','https://www.coca-cola.com/mx/es'),
(3,'Nestlé México','https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2F1000logos.net%2Fwp-content%2Fuploads%2F2017%2F03%2FNestle-Logo.png&f=1&nofb=1&ipt=fd61654e93caa7f81701462541cec28b604a26dd8bc56cb05f70942fcae741e7','https://www.nestle.com.mx/'),
(4,'UA de C','https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.uadec.mx%2Fwp-content%2Fuploads%2F2019%2F01%2FEscudoUAdeC-C.png&f=1&nofb=1&ipt=7719215fc6340006adc355eb77c177c27f96e3ccdb350c2ddcaf751bff5f715e','https://www.uadec.mx/');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactos`
--

DROP TABLE IF EXISTS `contactos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactos`
--

LOCK TABLES `contactos` WRITE;
/*!40000 ALTER TABLE `contactos` DISABLE KEYS */;
INSERT INTO `contactos` VALUES
(1,'Carlos','carlos@mail.com','Consulta sobre precios','2025-05-24 06:58:19'),
(2,'Ana','ana@mail.com','¿Tienen soporte técnico?','2025-05-24 06:58:19');
/*!40000 ALTER TABLE `contactos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias`
--

DROP TABLE IF EXISTS `noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `nota` text DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias`
--

LOCK TABLES `noticias` WRITE;
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
INSERT INTO `noticias` VALUES
(1,'Nueva Sede en Monterrey','Ampliación de cobertura nacional','2025-05-24 06:58:27'),
(2,'Certificación ISO','Nueva certificación de calidad obtenida','2025-05-24 06:58:27'),
(3,'Nueva Sede en Monterrey','Ampliación de cobertura nacional','2025-05-24 06:58:37'),
(4,'Certificación ISO','Nueva certificación de calidad obtenida','2025-05-24 06:58:37');
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen_url` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `estatus` enum('existencia','agotado') DEFAULT 'existencia',
  `creado_en` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES
(1,'Router Cisco','Alta velocidad','https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.cisco.com%2Fc%2Fdam%2Fen%2Fus%2Fsupport%2Fweb%2Fimages%2Fseries%2Frouters-7200-series-routers-alternate4.jpg&f=1&nofb=1&ipt=c9e0cb1b61f2f634eb8430c7fc7c4bae118c2ad5b7250d62f516cc34920cdd1c',1999.99,'existencia','2025-05-24 06:58:15'),
(2,'Switch TP-Link','24 puertos','https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic.tp-link.com%2Fres%2Fimages%2Fproducts%2FTL-SG1024DE_un_V2_1150_large_1_20151123105109.jpg&f=1&nofb=1&ipt=eb5738370aa1d26546b60849cfd6a83ec2924f97bf03b7d54ea7b0a7e1c4acfb',899.50,'agotado','2025-05-24 06:58:15'),
(4,'Palo alto','Firewall','https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.paloaltonetworks.com%2Fcontent%2Fdam%2Fpan%2Fen_US%2Fimages%2Fproducts%2Fpa-220.png&f=1&nofb=1&ipt=b26cee475f15f0a8d85acc0e5661ae4c197c9097deeebccc0339cfe8c391bceb',500.00,'existencia','2025-05-24 15:21:18');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_en` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES
(1,'Instalación','Instalación de equipos','2025-05-24 06:58:21'),
(2,'Mantenimiento','Servicio técnico preventivo','2025-05-24 06:58:21'),
(3,'Instalación','Instalación de equipos','2025-05-24 06:58:44'),
(4,'Mantenimiento','Servicio técnico preventivo','2025-05-24 06:58:44');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes_servicio`
--

DROP TABLE IF EXISTS `solicitudes_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitudes_servicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(100) NOT NULL,
  `correo_cliente` varchar(100) DEFAULT NULL,
  `servicio_id` int(11) DEFAULT NULL,
  `detalle` text DEFAULT NULL,
  `fecha_solicitud` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `servicio_id` (`servicio_id`),
  CONSTRAINT `solicitudes_servicio_ibfk_1` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes_servicio`
--

LOCK TABLES `solicitudes_servicio` WRITE;
/*!40000 ALTER TABLE `solicitudes_servicio` DISABLE KEYS */;
INSERT INTO `solicitudes_servicio` VALUES
(1,'Empresa X','empresa@x.com',1,'Urgente en sucursal norte','2025-05-24 06:58:24'),
(2,'Empresa Y','empresa@y.com',2,'Chequeo mensual','2025-05-24 06:58:24'),
(3,'Empresa X','empresa@x.com',1,'Urgente en sucursal norte','2025-05-24 06:58:40'),
(4,'Empresa Y','empresa@y.com',2,'Chequeo mensual','2025-05-24 06:58:40');
/*!40000 ALTER TABLE `solicitudes_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sugerencias`
--

DROP TABLE IF EXISTS `sugerencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sugerencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugerencias`
--

LOCK TABLES `sugerencias` WRITE;
/*!40000 ALTER TABLE `sugerencias` DISABLE KEYS */;
INSERT INTO `sugerencias` VALUES
(1,'Juan','Agregar más productos','2025-05-24 06:58:17'),
(2,'Luisa','Sitio muy lento','2025-05-24 06:58:17');
/*!40000 ALTER TABLE `sugerencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `password_hash` text NOT NULL,
  `rol` enum('admin','publico') NOT NULL,
  `creado_en` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES
(1,'Admin Uno','admin1@parnet.com','scrypt:32768:8:1$1AGtBSPzCe7WkTNZ$8778895e260ae82dc8fc548381060385c6a3692575d51dfbde6357297a7dca2cf3e66f2f07b82cf08830ee67e75f3ee47a00dea82ba41d762ee0a10145daf243','admin','2025-05-24 06:58:09'),
(2,'Publico Uno','user1@parnet.com','scrypt:32768:8:1$1AGtBSPzCe7WkTNZ$8778895e260ae82dc8fc548381060385c6a3692575d51dfbde6357297a7dca2cf3e66f2f07b82cf08830ee67e75f3ee47a00dea82ba41d762ee0a10145daf243','publico','2025-05-24 06:58:09');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitas`
--

DROP TABLE IF EXISTS `visitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_usuario` varchar(45) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitas`
--

LOCK TABLES `visitas` WRITE;
/*!40000 ALTER TABLE `visitas` DISABLE KEYS */;
INSERT INTO `visitas` VALUES
(1,'192.168.1.1','2025-05-24 06:58:29'),
(2,'192.168.1.2','2025-05-24 06:58:29');
/*!40000 ALTER TABLE `visitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'parnet_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-05-24  4:51:06
