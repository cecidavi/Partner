/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: parnet_db
-- ------------------------------------------------------
-- Server version	10.11.11-MariaDB-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `active_users`
--

DROP TABLE IF EXISTS `active_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_users` (
  `session_id` varchar(36) NOT NULL,
  `last_seen` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_users`
--

LOCK TABLES `active_users` WRITE;
/*!40000 ALTER TABLE `active_users` DISABLE KEYS */;
INSERT INTO `active_users` VALUES
('fcf570b7-8b9b-4b20-8421-37c6610167a2','2025-05-29 09:13:51');
/*!40000 ALTER TABLE `active_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES
(1,'General');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactos`
--

LOCK TABLES `contactos` WRITE;
/*!40000 ALTER TABLE `contactos` DISABLE KEYS */;
INSERT INTO `contactos` VALUES
(1,'Carlos','carlos@mail.com','Consulta sobre precios','2025-05-24 12:58:19'),
(2,'Ana','ana@mail.com','¿Tienen soporte técnico?','2025-05-24 12:58:19'),
(3,'salazar','salazar@exaple.com','no le sabes','2025-05-28 06:03:43'),
(4,'mknj','mk@example.com','rfgvbhnioknjbvgjjbhk','2025-05-29 02:14:24'),
(5,'npeen','asd@example.com','knvpskfnwoŕv','2025-05-29 17:34:36'),
(6,'aaaaaaaaaaaa','asd@example.com','aaaaaaaaaaaaaaaaaaaaaaaaaaa','2025-05-30 02:24:26');
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
(1,'Nueva Sede en Monterrey','Ampliación de cobertura nacional','2025-05-24 12:58:27'),
(2,'cisco vende el 40% de su comañia a oalo alto','cisco vendido ','2025-05-24 12:58:27'),
(3,'no se no se no se','no se no se no se','2025-05-24 12:58:37'),
(4,'aprovecha promociones de verano','20 % de descuento a nuestros nuevos clientes valido desde ............','2025-05-24 12:58:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES
(1,'Router Cisco','Alta velocidad','https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.cisco.com%2Fc%2Fdam%2Fen%2Fus%2Fsupport%2Fweb%2Fimages%2Fseries%2Frouters-7200-series-routers-alternate4.jpg&f=1&nofb=1&ipt=c9e0cb1b61f2f634eb8430c7fc7c4bae118c2ad5b7250d62f516cc34920cdd1c',1999.99,'existencia','2025-05-24 12:58:15'),
(2,'Switch TP-Link','24 puertos','https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic.tp-link.com%2Fres%2Fimages%2Fproducts%2FTL-SG1024DE_un_V2_1150_large_1_20151123105109.jpg&f=1&nofb=1&ipt=eb5738370aa1d26546b60849cfd6a83ec2924f97bf03b7d54ea7b0a7e1c4acfb',899.50,'agotado','2025-05-24 12:58:15'),
(4,'Palo alto','Firewall','https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.paloaltonetworks.com%2Fcontent%2Fdam%2Fpan%2Fen_US%2Fimages%2Fproducts%2Fpa-220.png&f=1&nofb=1&ipt=b26cee475f15f0a8d85acc0e5661ae4c197c9097deeebccc0339cfe8c391bceb',500.00,'existencia','2025-05-24 21:21:18'),
(5,'bobina cat 3e','30 mts cable utp cat 5e para exterior doble foroo','https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.MyomVzzpwQxW_6-zhtCgeQHaHa%26pid%3DApi&f=1&ipt=0407a7eabd278bf9c84c2b4aea7ca56c566d09e58b11e222de061b7f67b5558d&ipo=images',3500.00,'existencia','2025-05-28 03:17:26'),
(6,'mesh','3 mesh para repeticion de wifi-huawei','https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftotally-technology.com%2Fwp-content%2Fuploads%2F2022%2F07%2FPoint-dacces-huawei-wiFi-mesh.jpg&f=1&nofb=1&ipt=7ab8604dffc6426dcb055ee22e08da513b2a15d942fa397345e17a89b084dc9e',2500.00,'existencia','2025-05-29 02:23:39'),
(7,'ups','ups de 30 w','https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.jee8z9wkTi1tDv7eebwyFwHaEr%26pid%3DApi&f=1&ipt=1f88407eaae24abd6d158b8de54864b45d22f09adc26f8689f9ab756bf506089&ipo=images',60.00,'existencia','2025-05-30 02:25:45');
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
  `area_id` int(11) NOT NULL,
  `creado_en` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_servicios_area` (`area_id`),
  CONSTRAINT `fk_servicios_area` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES
(1,'Instalación','Instalación de equipos',1,'2025-05-24 12:58:21'),
(2,'Cableado estructurado','Servicio técnico preventivo',1,'2025-05-24 12:58:21'),
(3,'Ip publica','Instalación de equipos',1,'2025-05-24 12:58:44'),
(4,'Mantenimiento','Servicio técnico preventivo',1,'2025-05-24 12:58:44'),
(5,'Instalación de Fibra Óptica','Instalamos tu enlace de fibra',1,'2025-05-29 11:20:12'),
(6,'Soporte Básico','Atención de incidencias menores',1,'2025-05-29 11:20:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes_servicio`
--

LOCK TABLES `solicitudes_servicio` WRITE;
/*!40000 ALTER TABLE `solicitudes_servicio` DISABLE KEYS */;
INSERT INTO `solicitudes_servicio` VALUES
(1,'Empresa X','empresa@x.com',1,'Urgente en sucursal norte','2025-05-24 12:58:24'),
(2,'Empresa Y','empresa@y.com',2,'Chequeo mensual','2025-05-24 12:58:24'),
(3,'Empresa X','empresa@x.com',1,'Urgente en sucursal norte','2025-05-24 12:58:40'),
(4,'Empresa Y','empresa@y.com',2,'Chequeo mensual','2025-05-24 12:58:40'),
(5,'mariana asd','mariana@asd.ecom',2,'necesito 3 bobinas de utp','2025-05-28 15:06:29'),
(6,'cliente 3','cliente3@example.com',4,'servicio a rack','2025-05-28 23:51:35'),
(7,'qwert','qwer@example.com',1,'yuiolokmjnhjk','2025-05-29 02:13:45'),
(8,'inoubivgjhbknmk','exa@example.com',3,'hhhhhhhhbvajniphwbenjfkwmopijcvnwboj vlkñwmov','2025-05-29 17:39:34'),
(9,'yvgubhijnklm','v@example.com',5,'gggggggggggggggggggggggggggggggggggggg','2025-05-30 02:23:18');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugerencias`
--

LOCK TABLES `sugerencias` WRITE;
/*!40000 ALTER TABLE `sugerencias` DISABLE KEYS */;
INSERT INTO `sugerencias` VALUES
(1,'Juan','Agregar más productos','2025-05-24 12:58:17'),
(2,'Luisa','Sitio muy lento','2025-05-24 12:58:17'),
(3,'salazar','hola','2025-05-28 06:04:45'),
(4,'mnoubhij',' lknbhvg fhgjhkbnlk','2025-05-29 02:14:51'),
(5,'pkjpihuivughbni',',p+ńiobvyucyfvbhjnmñ','2025-05-29 17:34:44'),
(6,'aaaaaaaaaaaaa','eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee','2025-05-30 02:24:46');
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
(1,'Admin Uno','admin1@parnet.com','scrypt:32768:8:1$1AGtBSPzCe7WkTNZ$8778895e260ae82dc8fc548381060385c6a3692575d51dfbde6357297a7dca2cf3e66f2f07b82cf08830ee67e75f3ee47a00dea82ba41d762ee0a10145daf243','admin','2025-05-24 12:58:09'),
(2,'Publico Uno','user1@parnet.com','scrypt:32768:8:1$1AGtBSPzCe7WkTNZ$8778895e260ae82dc8fc548381060385c6a3692575d51dfbde6357297a7dca2cf3e66f2f07b82cf08830ee67e75f3ee47a00dea82ba41d762ee0a10145daf243','publico','2025-05-24 12:58:09');
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
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitas`
--

LOCK TABLES `visitas` WRITE;
/*!40000 ALTER TABLE `visitas` DISABLE KEYS */;
INSERT INTO `visitas` VALUES
(1,'192.168.1.1','2025-05-24 12:58:29'),
(2,'192.168.1.2','2025-05-24 12:58:29'),
(3,'127.0.0.1','2025-05-29 14:17:10'),
(4,'127.0.0.1','2025-05-29 14:52:50'),
(5,'127.0.0.1','2025-05-29 14:52:51'),
(6,'127.0.0.1','2025-05-29 14:52:51'),
(7,'127.0.0.1','2025-05-29 14:52:51'),
(8,'127.0.0.1','2025-05-29 14:52:51'),
(9,'127.0.0.1','2025-05-29 14:52:51'),
(10,'127.0.0.1','2025-05-29 14:52:53'),
(11,'127.0.0.1','2025-05-29 14:52:53'),
(12,'127.0.0.1','2025-05-29 14:52:53'),
(13,'127.0.0.1','2025-05-29 14:52:53'),
(14,'127.0.0.1','2025-05-29 14:52:53'),
(15,'127.0.0.1','2025-05-29 14:52:55'),
(16,'127.0.0.1','2025-05-29 14:52:55'),
(17,'127.0.0.1','2025-05-29 14:52:55'),
(18,'127.0.0.1','2025-05-29 14:52:55'),
(19,'127.0.0.1','2025-05-29 14:52:55'),
(20,'127.0.0.1','2025-05-29 14:52:55'),
(21,'127.0.0.1','2025-05-29 14:52:56'),
(22,'127.0.0.1','2025-05-29 14:52:56'),
(23,'127.0.0.1','2025-05-29 14:52:56'),
(24,'127.0.0.1','2025-05-29 14:52:56'),
(25,'127.0.0.1','2025-05-29 14:52:56'),
(26,'127.0.0.1','2025-05-29 14:52:56'),
(27,'127.0.0.1','2025-05-29 14:52:56'),
(28,'127.0.0.1','2025-05-29 14:52:57'),
(29,'127.0.0.1','2025-05-29 14:52:57'),
(30,'127.0.0.1','2025-05-29 14:52:57'),
(31,'127.0.0.1','2025-05-29 14:52:57'),
(32,'127.0.0.1','2025-05-29 14:52:57'),
(33,'127.0.0.1','2025-05-29 14:52:57'),
(34,'127.0.0.1','2025-05-29 14:52:57'),
(35,'127.0.0.1','2025-05-29 14:52:58'),
(36,'127.0.0.1','2025-05-29 14:52:58'),
(37,'127.0.0.1','2025-05-29 14:52:58'),
(38,'127.0.0.1','2025-05-29 14:52:58'),
(39,'127.0.0.1','2025-05-29 14:52:58'),
(40,'127.0.0.1','2025-05-29 14:52:58'),
(41,'127.0.0.1','2025-05-29 14:52:58'),
(42,'127.0.0.1','2025-05-29 14:52:58'),
(43,'127.0.0.1','2025-05-29 14:52:59'),
(44,'127.0.0.1','2025-05-29 14:52:59'),
(45,'127.0.0.1','2025-05-29 14:52:59'),
(46,'127.0.0.1','2025-05-29 14:52:59'),
(47,'127.0.0.1','2025-05-29 14:52:59'),
(48,'127.0.0.1','2025-05-29 14:52:59'),
(49,'127.0.0.1','2025-05-29 14:52:59'),
(50,'127.0.0.1','2025-05-29 14:53:08'),
(51,'127.0.0.1','2025-05-29 14:53:08'),
(52,'127.0.0.1','2025-05-29 14:53:08'),
(53,'127.0.0.1','2025-05-29 14:53:08'),
(54,'127.0.0.1','2025-05-29 14:53:08'),
(55,'127.0.0.1','2025-05-29 14:53:28'),
(56,'127.0.0.1','2025-05-29 14:53:28'),
(57,'127.0.0.1','2025-05-29 14:53:29'),
(58,'127.0.0.1','2025-05-29 14:53:29'),
(59,'127.0.0.1','2025-05-29 14:53:29'),
(60,'127.0.0.1','2025-05-29 14:56:55'),
(61,'127.0.0.1','2025-05-29 14:56:55'),
(62,'127.0.0.1','2025-05-29 14:56:55'),
(63,'127.0.0.1','2025-05-29 14:56:55'),
(64,'127.0.0.1','2025-05-29 14:56:55'),
(65,'127.0.0.1','2025-05-29 14:57:24'),
(66,'127.0.0.1','2025-05-29 14:57:24'),
(67,'127.0.0.1','2025-05-29 14:57:24'),
(68,'127.0.0.1','2025-05-29 14:57:24'),
(69,'127.0.0.1','2025-05-29 14:57:24'),
(70,'127.0.0.1','2025-05-29 15:01:28'),
(71,'127.0.0.1','2025-05-29 15:01:29'),
(72,'127.0.0.1','2025-05-29 15:01:30'),
(73,'127.0.0.1','2025-05-29 15:01:30'),
(74,'127.0.0.1','2025-05-29 15:01:31'),
(75,'127.0.0.1','2025-05-29 15:01:31'),
(76,'127.0.0.1','2025-05-29 15:01:32'),
(77,'127.0.0.1','2025-05-29 15:01:32'),
(78,'127.0.0.1','2025-05-29 15:01:33'),
(79,'127.0.0.1','2025-05-29 15:01:33'),
(80,'127.0.0.1','2025-05-29 15:01:34'),
(81,'127.0.0.1','2025-05-29 15:01:35'),
(82,'127.0.0.1','2025-05-29 15:01:36'),
(83,'127.0.0.1','2025-05-29 15:01:59'),
(84,'127.0.0.1','2025-05-29 15:02:01'),
(85,'127.0.0.1','2025-05-29 15:02:38'),
(86,'127.0.0.1','2025-05-29 15:02:53'),
(87,'127.0.0.1','2025-05-29 15:04:19'),
(88,'127.0.0.1','2025-05-29 15:04:31'),
(89,'127.0.0.1','2025-05-29 15:04:42'),
(90,'127.0.0.1','2025-05-29 15:05:38'),
(91,'127.0.0.1','2025-05-29 15:05:52'),
(92,'127.0.0.1','2025-05-29 15:10:59'),
(93,'127.0.0.1','2025-05-29 15:10:59'),
(94,'127.0.0.1','2025-05-29 15:10:59'),
(95,'127.0.0.1','2025-05-29 15:10:59'),
(96,'127.0.0.1','2025-05-29 15:10:59'),
(97,'127.0.0.1','2025-05-29 15:11:01'),
(98,'127.0.0.1','2025-05-29 15:11:01'),
(99,'127.0.0.1','2025-05-29 15:11:01'),
(100,'127.0.0.1','2025-05-29 15:11:01'),
(101,'127.0.0.1','2025-05-29 15:11:01'),
(102,'127.0.0.1','2025-05-29 15:11:02'),
(103,'127.0.0.1','2025-05-29 15:11:02'),
(104,'127.0.0.1','2025-05-29 15:11:02'),
(105,'127.0.0.1','2025-05-29 15:11:02'),
(106,'127.0.0.1','2025-05-29 15:11:02'),
(107,'127.0.0.1','2025-05-29 15:11:05'),
(108,'127.0.0.1','2025-05-29 15:11:05'),
(109,'127.0.0.1','2025-05-29 15:11:05'),
(110,'127.0.0.1','2025-05-29 15:11:05'),
(111,'127.0.0.1','2025-05-29 15:11:05'),
(112,'127.0.0.1','2025-05-29 15:11:06'),
(113,'127.0.0.1','2025-05-29 15:11:06'),
(114,'127.0.0.1','2025-05-29 15:11:06'),
(115,'127.0.0.1','2025-05-29 15:11:06'),
(116,'127.0.0.1','2025-05-29 15:11:06'),
(117,'127.0.0.1','2025-05-29 15:11:07'),
(118,'127.0.0.1','2025-05-29 15:11:07'),
(119,'127.0.0.1','2025-05-29 15:11:07'),
(120,'127.0.0.1','2025-05-29 15:11:07'),
(121,'127.0.0.1','2025-05-29 15:11:07'),
(122,'127.0.0.1','2025-05-29 15:11:07'),
(123,'127.0.0.1','2025-05-29 15:11:07'),
(124,'127.0.0.1','2025-05-29 15:11:07'),
(125,'127.0.0.1','2025-05-29 15:11:07'),
(126,'127.0.0.1','2025-05-29 15:11:07'),
(127,'127.0.0.1','2025-05-29 15:11:08'),
(128,'127.0.0.1','2025-05-29 15:11:08'),
(129,'127.0.0.1','2025-05-29 15:11:08'),
(130,'127.0.0.1','2025-05-29 15:11:08'),
(131,'127.0.0.1','2025-05-29 15:11:08'),
(132,'127.0.0.1','2025-05-29 15:11:08'),
(133,'127.0.0.1','2025-05-29 15:11:08'),
(134,'127.0.0.1','2025-05-29 15:11:09'),
(135,'127.0.0.1','2025-05-29 15:11:09'),
(136,'127.0.0.1','2025-05-29 15:11:09'),
(137,'127.0.0.1','2025-05-29 15:11:09'),
(138,'127.0.0.1','2025-05-29 15:11:09'),
(139,'127.0.0.1','2025-05-29 15:11:09'),
(140,'127.0.0.1','2025-05-29 15:11:09'),
(141,'127.0.0.1','2025-05-29 15:11:09'),
(142,'127.0.0.1','2025-05-29 15:11:09'),
(143,'127.0.0.1','2025-05-29 15:11:10'),
(144,'127.0.0.1','2025-05-29 15:11:10'),
(145,'127.0.0.1','2025-05-29 15:11:10'),
(146,'127.0.0.1','2025-05-29 15:11:10'),
(147,'127.0.0.1','2025-05-29 15:11:10'),
(148,'127.0.0.1','2025-05-29 15:11:10'),
(149,'127.0.0.1','2025-05-29 15:11:10'),
(150,'127.0.0.1','2025-05-29 15:11:10'),
(151,'127.0.0.1','2025-05-29 15:11:10'),
(152,'127.0.0.1','2025-05-29 15:11:10'),
(153,'127.0.0.1','2025-05-29 15:11:10'),
(154,'127.0.0.1','2025-05-29 15:11:11'),
(155,'127.0.0.1','2025-05-29 15:11:11'),
(156,'127.0.0.1','2025-05-29 15:11:11'),
(157,'127.0.0.1','2025-05-29 15:11:11'),
(158,'127.0.0.1','2025-05-29 15:11:11'),
(159,'127.0.0.1','2025-05-29 15:11:11'),
(160,'127.0.0.1','2025-05-29 15:11:11'),
(161,'127.0.0.1','2025-05-29 15:11:11'),
(162,'127.0.0.1','2025-05-29 15:11:11'),
(163,'127.0.0.1','2025-05-29 15:11:11'),
(164,'127.0.0.1','2025-05-29 15:11:16'),
(165,'127.0.0.1','2025-05-29 15:11:16'),
(166,'127.0.0.1','2025-05-29 15:11:16'),
(167,'127.0.0.1','2025-05-29 15:11:16'),
(168,'127.0.0.1','2025-05-29 15:11:16'),
(169,'127.0.0.1','2025-05-29 15:11:18'),
(170,'127.0.0.1','2025-05-29 15:11:18'),
(171,'127.0.0.1','2025-05-29 15:11:18'),
(172,'127.0.0.1','2025-05-29 15:11:18'),
(173,'127.0.0.1','2025-05-29 15:11:18'),
(174,'127.0.0.1','2025-05-29 15:13:12'),
(175,'127.0.0.1','2025-05-29 15:13:12'),
(176,'127.0.0.1','2025-05-29 15:13:12'),
(177,'127.0.0.1','2025-05-29 15:13:12'),
(178,'127.0.0.1','2025-05-29 15:13:12'),
(179,'127.0.0.1','2025-05-29 15:13:13'),
(180,'127.0.0.1','2025-05-29 15:13:29'),
(181,'127.0.0.1','2025-05-29 15:13:29'),
(182,'127.0.0.1','2025-05-29 15:13:29'),
(183,'127.0.0.1','2025-05-29 15:13:29'),
(184,'127.0.0.1','2025-05-29 15:13:29'),
(185,'127.0.0.1','2025-05-29 15:13:51'),
(186,'127.0.0.1','2025-05-29 15:13:51'),
(187,'127.0.0.1','2025-05-29 15:13:51'),
(188,'127.0.0.1','2025-05-29 15:13:51'),
(189,'127.0.0.1','2025-05-29 15:13:51'),
(190,'127.0.0.1','2025-05-29 15:13:51'),
(191,'127.0.0.1','2025-05-29 15:19:29'),
(192,'127.0.0.1','2025-05-29 15:19:33'),
(193,'127.0.0.1','2025-05-29 15:19:35'),
(194,'127.0.0.1','2025-05-29 15:19:35'),
(195,'127.0.0.1','2025-05-29 15:19:36'),
(196,'127.0.0.1','2025-05-29 15:19:37'),
(197,'127.0.0.1','2025-05-29 15:19:37'),
(198,'127.0.0.1','2025-05-29 15:19:38'),
(199,'127.0.0.1','2025-05-29 15:19:38'),
(200,'127.0.0.1','2025-05-29 15:19:39'),
(201,'127.0.0.1','2025-05-29 15:19:40'),
(202,'127.0.0.1','2025-05-29 15:19:40'),
(203,'127.0.0.1','2025-05-29 15:19:57'),
(204,'127.0.0.1','2025-05-29 15:20:17'),
(205,'127.0.0.1','2025-05-29 15:21:47'),
(206,'127.0.0.1','2025-05-29 15:21:50'),
(207,'127.0.0.1','2025-05-29 15:21:55'),
(208,'127.0.0.1','2025-05-29 15:21:55'),
(209,'127.0.0.1','2025-05-29 15:21:56'),
(210,'127.0.0.1','2025-05-29 15:21:57'),
(211,'127.0.0.1','2025-05-29 15:22:17'),
(212,'127.0.0.1','2025-05-29 15:22:23'),
(213,'127.0.0.1','2025-05-29 15:57:59'),
(214,'127.0.0.1','2025-05-29 16:02:50');
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
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-29 15:15:29
