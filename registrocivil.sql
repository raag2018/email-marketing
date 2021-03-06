-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: registrocivil
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acta_previa`
--

DROP TABLE IF EXISTS `acta_previa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acta_previa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_tipo_regiment` int NOT NULL,
  `fecha_acta` date NOT NULL,
  `fecha_matrimonio` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acta_previa`
--

LOCK TABLES `acta_previa` WRITE;
/*!40000 ALTER TABLE `acta_previa` DISABLE KEYS */;
/*!40000 ALTER TABLE `acta_previa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Alcalde Municipal'),(2,'Secretario Municipal'),(3,'Jefe del registro del Estado Familiar');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'AHUACHAPAN'),(2,'CABA??AS'),(3,'CHALATENANGO'),(4,'CUSCATLAN'),(5,'LA LIBERTAD'),(6,'LA PAZ'),(7,'LA UNION'),(8,'MORAZAN'),(9,'SAN MIGUEL'),(10,'SAN SALVADOR'),(11,'SAN VICENTE'),(12,'SANTA ANA'),(13,'SONSONATE'),(14,'USULUTAN');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_civil`
--

DROP TABLE IF EXISTS `estado_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_civil` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_civil`
--

LOCK TABLES `estado_civil` WRITE;
/*!40000 ALTER TABLE `estado_civil` DISABLE KEYS */;
INSERT INTO `estado_civil` VALUES (1,'Soltero'),(2,'Casado'),(3,'Divorciado'),(4,'Viudo'),(5,'Soltera'),(6,'Casada'),(7,'Divorciada'),(8,'Viuda');
/*!40000 ALTER TABLE `estado_civil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cargo` int NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_cargo` (`id_cargo`),
  CONSTRAINT `fk_id_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario_acta_previa`
--

DROP TABLE IF EXISTS `funcionario_acta_previa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario_acta_previa` (
  `id_funcionario` int NOT NULL,
  `id_acta_previa` int NOT NULL,
  PRIMARY KEY (`id_funcionario`,`id_acta_previa`),
  KEY `fk_id_acta_previa_funcionario` (`id_acta_previa`),
  CONSTRAINT `fk_id_acta_previa_funcionario` FOREIGN KEY (`id_acta_previa`) REFERENCES `acta_previa` (`id`),
  CONSTRAINT `fk_id_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario_acta_previa`
--

LOCK TABLES `funcionario_acta_previa` WRITE;
/*!40000 ALTER TABLE `funcionario_acta_previa` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario_acta_previa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Masculino'),(2,'Femenino');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio` (
  `id` int NOT NULL,
  `id_departamento` int NOT NULL,
  `nombre` varchar(70) NOT NULL,
  PRIMARY KEY (`id`,`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,1,'AHUACHAPAN'),(1,2,'CINQUERA'),(1,3,'AGUA CALIENTE'),(1,4,'CANDELARIA'),(1,5,'ANTIGUO CUSCATLAN'),(1,6,'CUYULTITAN'),(1,7,'ANAMOROS'),(1,8,'ARAMBALA'),(1,9,'CAROLINA'),(1,10,'AGUILARES'),(1,11,'APASTEPEQUE'),(1,12,'CANDELARIA DE LA FRONTERA'),(1,13,'ACAJUTLA'),(1,14,'ALEGRIA'),(2,1,'APANECA'),(2,2,'DOLORES'),(2,3,'ARCATAO'),(2,4,'COJUTEPEQUE'),(2,5,'CHILTUIPAN'),(2,6,'EL ROSARIO'),(2,7,'BOLIVAR'),(2,8,'CACAOPERA'),(2,9,'CHAPELTIQUE'),(2,10,'APOPA'),(2,11,'GUADALUPE'),(2,12,'CHALCHUAPA'),(2,13,'ARMENIA'),(2,14,'BERLIN'),(3,1,'ATIQUIZAYA'),(3,2,'GUACOTECTI'),(3,3,'AZACUALPA'),(3,4,'EL CARMEN'),(3,5,'CIUDAD ARCE'),(3,6,'JERUSALEM'),(3,7,'CONCEPCION DE ORIENTE'),(3,8,'CHILANGA'),(3,9,'CHINAMECA'),(3,10,'AYUTUXTEPEQUE'),(3,11,'SAN CAYETANO ISTEPEQUE'),(3,12,'COATEPEQUE'),(3,13,'CALUCO'),(3,14,'CALIFORNIA'),(4,1,'CONCEPCION DE ATACO'),(4,2,'ILOBASCO'),(4,3,'CANCASQUE'),(4,4,'EL ROSARIO'),(4,5,'COLON'),(4,6,'MERCEDES LA CEIBA'),(4,7,'CONCHAGUA'),(4,8,'CORINTO'),(4,9,'CHIRILAGUA'),(4,10,'CIUDAD DELGADO'),(4,11,'SAN ESTEBAN CATARINA'),(4,12,'EL CONGO'),(4,13,'CUISNAHUAT'),(4,14,'CONCEPCION BATRES'),(5,1,'EL REFUGIO'),(5,2,'JUTIAPA'),(5,3,'CHALATENANGO'),(5,4,'MONTE SAN JUAN'),(5,5,'COMASAGUA'),(5,6,'OLOCUILTA'),(5,7,'EL CARMEN'),(5,8,'DELICIAS DE CONCEPCION'),(5,9,'CIUDAD BARRIOS'),(5,10,'CUSCATANCINGO'),(5,11,'SAN ILDEFONSO'),(5,12,'EL PORVENIR'),(5,13,'IZALCO'),(5,14,'EL TRIUNFO'),(6,1,'GUAYMANGO'),(6,2,'SAN ISIDRO'),(6,3,'CITALA'),(6,4,'ORATORIA DE CONCEPCION'),(6,5,'HUIZUCAR'),(6,6,'PARAISO DE OSORIO'),(6,7,'EL SAUCE'),(6,8,'EL DIVISADERO'),(6,9,'COMACARAN'),(6,10,'EL PAISNAL'),(6,11,'SAN LORENZO'),(6,12,'MASAHUAT'),(6,13,'JUAYUA'),(6,14,'EREGUAYQUIN'),(7,1,'JUJUTLA'),(7,2,'SENSUNTEPEQUE'),(7,3,'COMALAPA'),(7,4,'SAN BARTOLOME PERULAPIA'),(7,5,'JAYAQUE'),(7,6,'SAN ANTONIO MASAHUAT'),(7,7,'INTIPUCA'),(7,8,'EL ROSARIO'),(7,9,'EL TRANSITO'),(7,10,'GUAZAPA'),(7,11,'SAN SEBASTIAN'),(7,12,'METAPAN'),(7,13,'NAHUILINGO'),(7,14,'ESTANZUELAS'),(8,1,'SAN FRANCISCO MENENDEZ'),(8,2,'TEJUTEPEQUE'),(8,3,'CONCEPCION QUEZALTEPEQUE'),(8,4,'SAN CRISTOBAL'),(8,5,'JICALAPA'),(8,6,'SAN EMIGDIO'),(8,7,'LA UNION'),(8,8,'GUALOCOCTI'),(8,9,'LOLOTIQUE'),(8,10,'ILOPANGO'),(8,11,'SAN VICENTE'),(8,12,'SAN ANTONIO PAJONAL'),(8,13,'NAHUIZALCO'),(8,14,'JIQUILISCO'),(9,1,'SAN LORENZO'),(9,2,'VICTORIA'),(9,3,'DULCE NOMBRE DE MARIA'),(9,4,'SAN JOSE GUAYABAL'),(9,5,'LA LIBERTAD'),(9,6,'SAN FRANCISCO CHINAMECA'),(9,7,'LISLIQUE'),(9,8,'GUATAJIAGUA'),(9,9,'MONCAGUA'),(9,10,'MEJICANOS'),(9,11,'SANTA CLARA'),(9,12,'SAN SEBATIAN SALITRILLO'),(9,13,'SALCOATITAN'),(9,14,'JUCUAPA'),(10,1,'SAN PEDRO PUXTLA'),(10,3,'EL CARRIZAL'),(10,4,'SAN PEDRO PERULAPAN'),(10,5,'SANTA TECLA'),(10,6,'SAN JUAN NONUALCO'),(10,7,'MEANGUERA DEL GOLFO'),(10,8,'JOATECA'),(10,9,'NUEVA GUADALUPE'),(10,10,'NEJAPA'),(10,11,'SANTO DOMINGO'),(10,12,'SANTA ANA'),(10,13,'SAN ANTONIO DEL MONTE'),(10,14,'JUCUARAN'),(11,1,'TACUBA'),(11,3,'EL PARAISO'),(11,4,'SAN RAFAEL CEDROS'),(11,5,'NUEVO CUSCATLAN'),(11,6,'SAN JUAN TALPA'),(11,7,'NUEVA ESPARTA'),(11,8,'JOCOATIQUE'),(11,9,'NUEVO EDEN DE SAN JUAN'),(11,10,'PANCHIMALCO'),(11,11,'TECOLUCA'),(11,12,'SANTA ROSA GUACHIPILIN'),(11,13,'SAN JULIAN'),(11,14,'MERCEDES UMA??A'),(12,1,'TURIN'),(12,3,'LA LAGUNA'),(12,4,'SAN RAMON'),(12,5,'QUEZALTEPEQUE'),(12,6,'SAN JUAN TEPEZONTES'),(12,7,'PASAQUINA'),(12,8,'JOCORO'),(12,9,'QUELEPA'),(12,10,'ROSARIO DE MORA'),(12,11,'TEPETITAN'),(12,12,'SANTIAGO DE LA FRONTERA'),(12,13,'SANTA CATARINA MASAHUAT'),(12,14,'NUEVA GRANADA'),(13,3,'LA PALMA'),(13,4,'SANTA CRUZ ANALQUITO'),(13,5,'SACACOYO'),(13,6,'SAN LUIS LA HERRADURA'),(13,7,'POLOROS'),(13,8,'LOLOTIQUILLO'),(13,9,'SAN ANTONIO DEL MOSCO'),(13,10,'SAN MARCOS'),(13,11,'VERAPAZ'),(13,12,'TEXISTEPEQUE'),(13,13,'SANTA ISABEL ISHUATAN'),(13,14,'OZATLAN'),(14,3,'LA REINA'),(14,4,'SANTA CRUZ MICHAPA'),(14,5,'SAN JOSE VILLANUEVA'),(14,6,'SAN LUIS TALPA'),(14,7,'SAN ALEJO'),(14,8,'MEANGUERA'),(14,9,'SAN GERARDO'),(14,10,'SAN MARTIN'),(14,13,'SANTO DOMINGO DE GUZMAN'),(14,14,'PUERTO EL TRIUNFO'),(15,3,'LAS FLORES'),(15,4,'SUCHITOTO'),(15,5,'SAN JUAN OPICO'),(15,6,'SAN MIGUEL TEPEZONTES'),(15,7,'SAN JOSE LAS FUENTES'),(15,8,'OSICALA'),(15,9,'SAN JORGE'),(15,10,'SAN SALVADOR'),(15,13,'SONSONATE'),(15,14,'SAN AGUSTIN'),(16,3,'LAS VUELTAS'),(16,4,'TENANCINGO'),(16,5,'SAN MATIAS'),(16,6,'SAN PEDRO MASAHUAT'),(16,7,'SANTA ROSA DE LIMA'),(16,8,'PERQUIN'),(16,9,'SAN LUIS DE LA REINA'),(16,10,'SANTIAGO TEXACUANGOS'),(16,13,'SONZACATE'),(16,14,'SAN BUENAVENTURA'),(17,3,'NOMBRE DE JESUS'),(17,5,'SAN PABLO TACACHICO'),(17,6,'SAN PEDRO NONUALCO'),(17,7,'YAYANTIQUE'),(17,8,'SAN CARLOS'),(17,9,'SAN MIGUEL'),(17,10,'SANTO TOMAS'),(17,14,'SAN DIONICIO'),(18,3,'NUEVA CONCEPCION'),(18,5,'TALNIQUE'),(18,6,'SAN RAFAEL OBRAJUELO'),(18,7,'YUCUAIQUIN'),(18,8,'SAN FERNANDO'),(18,9,'SAN RAFAEL ORIENTE'),(18,10,'SOYAPANGO'),(18,14,'SAN FRANCISCO JAVIER'),(19,3,'NUEVA TRINIDAD'),(19,5,'TAMANIQUE'),(19,6,'SANTA MARIA OSTUMA'),(19,8,'SAN FRANCISCO GOTERA'),(19,9,'SESORI'),(19,10,'TONACATEPEQUE'),(19,14,'SANTA ELENA'),(20,3,'OJOS DE AGUA'),(20,5,'TEOTEPEQUE'),(20,6,'SANTIAGO NONUALCO'),(20,8,'SAN ISIDRO'),(20,9,'ULUAZAPA'),(20,14,'SANTA MARIA'),(21,3,'POTONICO'),(21,5,'TEPECOYO'),(21,6,'TAPALHUACA'),(21,8,'SAN SIMON'),(21,14,'SANTIAGO DE MARIA'),(22,3,'SAN ANTONIO DE LA CRUZ'),(22,5,'ZARAGOZA'),(22,6,'ZACATECOLUCA'),(22,8,'SEMSEMBRA'),(22,14,'TECAPAN'),(23,3,'SAN ANTONIO LOS RANCHOS'),(23,8,'SOCIEDAD'),(23,14,'USULUTAN'),(24,3,'SAN FERNANDO'),(24,8,'TOROLA'),(25,3,'SAN FRANCISCO LEMPA'),(25,8,'YAMABAL'),(26,3,'SAN FRANCISCO MORAZAN'),(26,8,'YOLOAQUIN'),(27,3,'SAN IGNACIO'),(28,3,'SAN ISIDRO LABRADOR'),(29,3,'SAN LUIS DEL CARMEN'),(30,3,'SAN MIGUEL DE MERCEDES'),(31,3,'SAN RAFAEL'),(32,3,'SANTA RITA'),(33,3,'TEJUTLA');
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nacionalidad`
--

DROP TABLE IF EXISTS `nacionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nacionalidad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nacionalidad`
--

LOCK TABLES `nacionalidad` WRITE;
/*!40000 ALTER TABLE `nacionalidad` DISABLE KEYS */;
INSERT INTO `nacionalidad` VALUES (1,'Afganist??n'),(2,'Albania'),(3,'Alemania'),(4,'Andorra'),(5,'Angola'),(6,'AntiguayBarbuda'),(7,'ArabiaSaudita'),(8,'Argelia'),(9,'Argentina'),(10,'Armenia'),(11,'Aruba'),(12,'Australia'),(13,'Austria'),(14,'Azerbaiy??n'),(15,'Bahamas'),(16,'Banglad??s'),(17,'Barbados'),(18,'Bar??in'),(19,'B??lgica'),(20,'Belice'),(21,'Ben??n'),(22,'Bielorrusia'),(23,'Birmania'),(24,'Bolivia'),(25,'BosniayHerzegovina'),(26,'Botsuana'),(27,'Brasil'),(28,'Brun??i'),(29,'Bulgaria'),(30,'BurkinaFaso'),(31,'Burundi'),(32,'But??n'),(33,'CaboVerde'),(34,'Camboya'),(35,'Camer??n'),(36,'Canad??'),(37,'Catar'),(38,'Chad'),(39,'Chile'),(40,'China'),(41,'Chipre'),(42,'CiudaddelVaticano'),(43,'Colombia'),(44,'Comoras'),(45,'CoreadelNorte'),(46,'CoreadelSur'),(47,'CostadeMarfil'),(48,'CostaRica'),(49,'Croacia'),(50,'Cuba'),(51,'Dinamarca'),(52,'Dominica'),(53,'Ecuador'),(54,'Egipto'),(55,'ElSalvador'),(56,'Emiratos??rabesUnidos'),(57,'Eritrea'),(58,'Eslovaquia'),(59,'Eslovenia'),(60,'Espa??a'),(61,'EstadosUnidos'),(62,'Estonia'),(63,'Etiop??a'),(64,'Filipinas'),(65,'Finlandia'),(66,'Fiyi'),(67,'Francia'),(68,'Gab??n'),(69,'Gambia'),(70,'Georgia'),(71,'Gibraltar'),(72,'Ghana'),(73,'Granada'),(74,'Grecia'),(75,'Groenlandia'),(76,'Guatemala'),(77,'Guineaecuatorial'),(78,'Guinea'),(79,'Guinea-Bis??u'),(80,'Guyana'),(81,'Hait??'),(82,'Honduras'),(83,'Hungr??a'),(84,'India'),(85,'Indonesia'),(86,'Irak'),(87,'Ir??n'),(88,'Irlanda'),(89,'Islandia'),(90,'IslasCook'),(91,'IslasMarshall'),(92,'IslasSalom??n'),(93,'Israel'),(94,'Italia'),(95,'Jamaica'),(96,'Jap??n'),(97,'Jordania'),(98,'Kazajist??n'),(99,'Kenia'),(100,'Kirguist??n'),(101,'Kiribati'),(102,'Kuwait'),(103,'Laos'),(104,'Lesoto'),(105,'Letonia'),(106,'L??bano'),(107,'Liberia'),(108,'Libia'),(109,'Liechtenstein'),(110,'Lituania'),(111,'Luxemburgo'),(112,'Madagascar'),(113,'Malasia'),(114,'Malaui'),(115,'Maldivas'),(116,'Mal??'),(117,'Malta'),(118,'Marruecos'),(119,'Martinica'),(120,'Mauricio'),(121,'Mauritania'),(122,'M??xico'),(123,'Micronesia'),(124,'Moldavia'),(125,'M??naco'),(126,'Mongolia'),(127,'Montenegro'),(128,'Mozambique'),(129,'Namibia'),(130,'Nauru'),(131,'Nepal'),(132,'Nicaragua'),(133,'N??ger'),(134,'Nigeria'),(135,'Noruega'),(136,'NuevaZelanda'),(137,'Om??n'),(138,'Pa??sesBajos'),(139,'Pakist??n'),(140,'Palaos'),(141,'Palestina'),(142,'Panam??'),(143,'Pap??aNuevaGuinea'),(144,'Paraguay'),(145,'Per??'),(146,'Polonia'),(147,'Portugal'),(148,'PuertoRico'),(149,'ReinoUnido'),(150,'Rep??blicaCentroafricana'),(151,'Rep??blicaCheca'),(152,'Rep??blicadeMacedonia'),(153,'Rep??blicadelCongo'),(154,'Rep??blicaDemocr??ticadelCongo'),(155,'Rep??blicaDominicana'),(156,'Rep??blicaSudafricana'),(157,'Ruanda'),(158,'Ruman??a'),(159,'Rusia'),(160,'Samoa'),(161,'SanCrist??balyNieves'),(162,'SanMarino'),(163,'SanVicenteylasGranadinas'),(164,'SantaLuc??a'),(165,'SantoTom??yPr??ncipe'),(166,'Senegal'),(167,'Serbia'),(168,'Seychelles'),(169,'SierraLeona'),(170,'Singapur'),(171,'Siria'),(172,'Somalia'),(173,'SriLanka'),(174,'Suazilandia'),(175,'Sud??ndelSur'),(176,'Sud??n'),(177,'Suecia'),(178,'Suiza'),(179,'Surinam'),(180,'Tailandia'),(181,'Tanzania'),(182,'Tayikist??n'),(183,'TimorOriental'),(184,'Togo'),(185,'Tonga'),(186,'TrinidadyTobago'),(187,'T??nez'),(188,'Turkmenist??n'),(189,'Turqu??a'),(190,'Tuvalu'),(191,'Ucrania'),(192,'Uganda'),(193,'Uruguay'),(194,'Uzbekist??n'),(195,'Vanuatu'),(196,'Venezuela'),(197,'Vietnam'),(198,'Yemen'),(199,'Yibuti'),(200,'Zambia'),(201,'Zimbabue');
/*!40000 ALTER TABLE `nacionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_profesion` int NOT NULL,
  `id_municipio` int NOT NULL,
  `id_nacionalidad` int NOT NULL,
  `id_genero` int NOT NULL,
  `id_estado_civil` int NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `edad` int NOT NULL,
  `fecha_nac` date NOT NULL,
  `domicilio` varchar(200) DEFAULT NULL,
  `origen` varchar(200) DEFAULT NULL,
  `dui` varchar(10) NOT NULL,
  `apellido_casada` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_profesion` (`id_profesion`),
  KEY `fk_id_municipio` (`id_municipio`),
  KEY `fk_id_nacionalidad` (`id_nacionalidad`),
  KEY `fk_id_genero` (`id_genero`),
  KEY `fk_id_estado_civil` (`id_estado_civil`),
  CONSTRAINT `fk_id_estado_civil` FOREIGN KEY (`id_estado_civil`) REFERENCES `estado_civil` (`id`),
  CONSTRAINT `fk_id_genero` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`),
  CONSTRAINT `fk_id_municipio` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`),
  CONSTRAINT `fk_id_nacionalidad` FOREIGN KEY (`id_nacionalidad`) REFERENCES `nacionalidad` (`id`),
  CONSTRAINT `fk_id_profesion` FOREIGN KEY (`id_profesion`) REFERENCES `profesion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_acta_previa`
--

DROP TABLE IF EXISTS `persona_acta_previa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona_acta_previa` (
  `id_persona` int NOT NULL,
  `id_acta_previa` int NOT NULL,
  PRIMARY KEY (`id_persona`,`id_acta_previa`),
  KEY `fk_id_acta_previa_persona` (`id_acta_previa`),
  CONSTRAINT `fk_id_acta_previa_persona` FOREIGN KEY (`id_acta_previa`) REFERENCES `acta_previa` (`id`),
  CONSTRAINT `fk_id_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_acta_previa`
--

LOCK TABLES `persona_acta_previa` WRITE;
/*!40000 ALTER TABLE `persona_acta_previa` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona_acta_previa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesion`
--

DROP TABLE IF EXISTS `profesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesion`
--

LOCK TABLES `profesion` WRITE;
/*!40000 ALTER TABLE `profesion` DISABLE KEYS */;
INSERT INTO `profesion` VALUES (1,'Abogado '),(2,'Acad??mico '),(3,'Adjunto '),(4,'Administrador '),(5,'Administrativo '),(6,'Agr??nomo '),(7,'Alerg??logo Alergista '),(8,'Almacenero Almacenista '),(9,'Anatomista '),(10,'Anestesi??logo Anestesista '),(11,'Antologista '),(12,'Antrop??logo '),(13,'Arabista '),(14,'Archivero '),(15,'Arque??logo '),(16,'Arquitecto '),(17,'Asesor '),(18,'Asistente '),(19,'Astrof??sico '),(20,'Astr??logo '),(21,'Astr??nomo '),(22,'Atleta '),(23,'ATS '),(24,'Autor '),(25,'Auxiliar '),(26,'Avicultor '),(27,'Bacteri??logo '),(28,'Bedel '),(29,'Bibli??grafo '),(30,'Bibliotecario '),(31,'Biof??sico '),(32,'Bi??grafo '),(33,'Bi??logo '),(34,'Bioqu??mico '),(35,'Bot??nico '),(36,'Cancer??logo '),(37,'Cardi??logo '),(38,'Cart??grafo '),(39,'Castrador '),(40,'Catedr??tico '),(41,'Cirujano '),(42,'Cit??logo '),(43,'Climat??logo '),(44,'Codirector '),(45,'Comadr??n '),(46,'Consejero '),(47,'Conserje '),(48,'Conservador '),(49,'Coordinador '),(50,'Cosm??grafo '),(51,'Cosm??logo '),(52,'Criminalista '),(53,'Cron??logo '),(54,'Decano '),(55,'Decorador '),(56,'Defensor  '),(57,'Delegado '),(58,'Delineante '),(59,'Dem??grafo '),(60,'Dentista '),(61,'Dermat??logo '),(62,'Dibujante  '),(63,'Directivo '),(64,'Director '),(65,'Dirigente '),(66,'Doctor '),(67,'Documentalista '),(68,'Ec??logo '),(69,'Economista '),(70,'Educador '),(71,'Egipt??logo '),(72,'Endocrin??logo '),(73,'Enfermero '),(74,'En??logo '),(75,'Entom??logo '),(76,'Epidemi??logo '),(77,'Especialista '),(78,'Espele??logo '),(79,'Estadista '),(80,'Estad??stico '),(81,'Etim??logo Etimologista '),(82,'Etn??grafo '),(83,'Etn??logo '),(84,'Et??logo '),(85,'Examinador  '),(86,'Facultativo '),(87,'Farmac??utico '),(88,'Farmac??logo '),(89,'Fil??logo '),(90,'Fil??sofo '),(91,'Fiscal '),(92,'F??sico '),(93,'Fisi??logo '),(94,'Fisioterapeuta '),(95,'Fonetista '),(96,'Fon??atra '),(97,'Fon??logo '),(98,'Forense  '),(99,'Fot??grafo '),(100,'Funcionario '),(101,'Gem??logo '),(102,'Genetista '),(103,'Geobot??nica '),(104,'Geodesta '),(105,'Geof??sico '),(106,'Ge??grafo '),(107,'Ge??logo '),(108,'Geom??ntico '),(109,'Ge??metra '),(110,'Geoqu??mica '),(111,'Gerente '),(112,'Geriatra '),(113,'Geront??logo '),(114,'Gestor '),(115,'Grabador '),(116,'Graduado social '),(117,'Graf??logo '),(118,'Gram??tico '),(119,'Hemat??logo '),(120,'Hepat??logo '),(121,'Hidroge??logo '),(122,'Hidr??grafo '),(123,'Hidr??logo '),(124,'Higienista '),(125,'Hispanista '),(126,'Historiador '),(127,'Home??pata '),(128,'Inform??tico '),(129,'Ingeniero '),(130,'Ingeniero t??cnico '),(131,'Inmun??logo '),(132,'Inspector '),(133,'Interino '),(134,'Interventor '),(135,'Investigador '),(136,'Jardinero '),(137,'Jefe '),(138,'Juez '),(139,'Latinista '),(140,'Lector '),(141,'Letrado (abogado) '),(142,'Lexic??grafo '),(143,'Lexic??logo '),(144,'Licenciado '),(145,'Ling??ista '),(146,'Logopeda '),(147,'Maestro '),(148,'Matem??tico '),(149,'Matr??n '),(150,'Medico '),(151,'Meteor??logo '),(152,'Mic??logo '),(153,'Microbiol??gico '),(154,'Microcirujano '),(155,'Mim??grafo '),(156,'Mineralogista '),(157,'Monitor '),(158,'Music??logo '),(159,'Natur??pata '),(160,'Nefr??logo '),(161,'Neum??logo '),(162,'Neuroanatomista '),(163,'Neurobi??logo '),(164,'Neurocirujano '),(165,'Neuroembri??logo '),(166,'Neurofisi??logo '),(167,'Neur??logo '),(168,'Nutr??logo '),(169,'Ocean??grafo '),(170,'Odont??logo '),(171,'Oficial '),(172,'Oficinista '),(173,'Oftalm??logo '),(174,'Onc??logo '),(175,'??ptico '),(176,'Optometrista '),(177,'Ordenanza '),(178,'Orientador '),(179,'Ornit??logo '),(180,'Ortop??dico '),(181,'Ortopedista '),(182,'Oste??logo '),(183,'Oste??pata '),(184,'Otorrinolaring??logo '),(185,'Paleobi??logo '),(186,'Paleobot??nico '),(187,'Pale??grafo '),(188,'Pale??logo '),(189,'Paleont??logo '),(190,'Pat??logo '),(191,'Pedagogo '),(192,'Pediatra  '),(193,'Pedicuro  '),(194,'Periodista '),(195,'Perito  '),(196,'Ingeniero t??cnico'),(197,'Piscicultor'),(198,'Pod??logo'),(199,'Portero'),(200,'Prehistoriador'),(201,'Presidente'),(202,'Proct??logo'),(203,'Profesor'),(204,'Programador'),(205,'Prot??sico'),(206,'Proveedor'),(207,'Psicoanalista'),(208,'Psic??logo'),(209,'Psicof??sico'),(210,'Psicopedagogo'),(211,'Psicoterapeuta'),(212,'Psiquiatra'),(213,'Publicista'),(214,'Publicitario'),(215,'Puericultor'),(216,'Qu??mico'),(217,'Quiropr??ctico'),(218,'Radioastr??nomo'),(219,'Radiofonista'),(220,'Radi??logo'),(221,'Radiot??cnico'),(222,'Radiotelefonista'),(223,'Radiotelegrafista'),(224,'Radioterapeuta'),(225,'Rector'),(226,'Sanitario'),(227,'Secretario'),(228,'Sex??logo'),(229,'Sism??logo'),(230,'Soci??logo'),(231,'Subdelegado'),(232,'Subdirector'),(233,'Subsecretario'),(234,'T??cnico'),(235,'Telefonista'),(236,'Te??logo'),(237,'Terapeuta'),(238,'Tocoginec??logo'),(239,'Toc??logo'),(240,'Toxic??logo'),(241,'Traductor'),(242,'Transcriptor'),(243,'Traumat??logo'),(244,'Tutor'),(245,'Ur??logo'),(246,'Veterinario'),(247,'Vicedecano'),(248,'Vicedirector'),(249,'Vicegerente'),(250,'Vicepresidente'),(251,'Vicerrector'),(252,'Vicesecretario'),(253,'Vir??logo'),(254,'Viticultor'),(255,'Vulcan??logo'),(256,'Xil??grafo'),(257,'Zo??logo'),(258,'Zoot??cnico ');
/*!40000 ALTER TABLE `profesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_regimen`
--

DROP TABLE IF EXISTS `tipo_regimen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_regimen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_regimen`
--

LOCK TABLES `tipo_regimen` WRITE;
/*!40000 ALTER TABLE `tipo_regimen` DISABLE KEYS */;
INSERT INTO `tipo_regimen` VALUES (1,'Separaci??n de bienes'),(2,'Participaci??n en las ganancias'),(3,'Comunidad diferida');
/*!40000 ALTER TABLE `tipo_regimen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-10 13:37:52
