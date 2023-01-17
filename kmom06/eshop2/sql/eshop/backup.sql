-- MariaDB dump 10.19  Distrib 10.6.5-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: eshop
-- ------------------------------------------------------
-- Server version	10.6.5-MariaDB

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
-- Table structure for table `faktura`
--

DROP TABLE IF EXISTS `faktura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faktura` (
  `faktura_nummer` int(11) NOT NULL AUTO_INCREMENT,
  `kund_id` int(11) DEFAULT NULL,
  `order_nummer` int(11) DEFAULT NULL,
  `totala_summan` decimal(6,2) DEFAULT NULL,
  `skapades` datetime DEFAULT current_timestamp(),
  `skickades` datetime DEFAULT NULL,
  PRIMARY KEY (`faktura_nummer`),
  KEY `order_nummer` (`order_nummer`),
  KEY `kund_id` (`kund_id`),
  CONSTRAINT `faktura_ibfk_1` FOREIGN KEY (`order_nummer`) REFERENCES `ordrar` (`order_nummer`),
  CONSTRAINT `faktura_ibfk_2` FOREIGN KEY (`kund_id`) REFERENCES `kunder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faktura`
--

LOCK TABLES `faktura` WRITE;
/*!40000 ALTER TABLE `faktura` DISABLE KEYS */;
/*!40000 ALTER TABLE `faktura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faktura_rad`
--

DROP TABLE IF EXISTS `faktura_rad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faktura_rad` (
  `id` int(11) NOT NULL,
  `faktura_nummmer` int(11) DEFAULT NULL,
  `produkt_id` varchar(80) DEFAULT NULL,
  `pris` decimal(5,2) DEFAULT NULL,
  `antal` int(11) DEFAULT NULL,
  `pris_per_rad` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faktura_nummmer` (`faktura_nummmer`),
  KEY `produkt_id` (`produkt_id`),
  CONSTRAINT `faktura_rad_ibfk_1` FOREIGN KEY (`faktura_nummmer`) REFERENCES `faktura` (`faktura_nummer`),
  CONSTRAINT `faktura_rad_ibfk_2` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`produktid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faktura_rad`
--

LOCK TABLES `faktura_rad` WRITE;
/*!40000 ALTER TABLE `faktura_rad` DISABLE KEYS */;
/*!40000 ALTER TABLE `faktura_rad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `namn` varchar(80) NOT NULL,
  PRIMARY KEY (`namn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES ('bth'),('dbwebb'),('kaffe'),('mugg'),('porslin'),('skiva'),('spellista'),('te');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kund2produkt`
--

DROP TABLE IF EXISTS `kund2produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kund2produkt` (
  `kund` int(11) NOT NULL,
  `produktid` varchar(80) NOT NULL,
  PRIMARY KEY (`kund`,`produktid`),
  KEY `produktid` (`produktid`),
  CONSTRAINT `kund2produkt_ibfk_1` FOREIGN KEY (`kund`) REFERENCES `kunder` (`id`),
  CONSTRAINT `kund2produkt_ibfk_2` FOREIGN KEY (`produktid`) REFERENCES `produkt` (`produktid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kund2produkt`
--

LOCK TABLES `kund2produkt` WRITE;
/*!40000 ALTER TABLE `kund2produkt` DISABLE KEYS */;
/*!40000 ALTER TABLE `kund2produkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kunder`
--

DROP TABLE IF EXISTS `kunder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kunder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fornamn` varchar(80) DEFAULT NULL,
  `efternamn` varchar(80) DEFAULT NULL,
  `adress` varchar(120) DEFAULT NULL,
  `postnummer` varchar(80) DEFAULT NULL,
  `ort` varchar(40) DEFAULT NULL,
  `land` varchar(80) DEFAULT NULL,
  `telefon` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunder`
--

LOCK TABLES `kunder` WRITE;
/*!40000 ALTER TABLE `kunder` DISABLE KEYS */;
INSERT INTO `kunder` VALUES (1,'Mikael','Roos','Centrumgatan 1','564 00','Bankeryd','Sverige','070 42 42 42'),(2,'John','Doe','Skogen 1','555 55','Landet','Sverige','070 555 555'),(3,'Jane','Doe','Skogen 1','555 55','Landet','Sverige','070 556 556'),(4,'Mumintrollet','Mumin','Blå hus 1','111 11','Mumindalen','Finland','070 111 111');
/*!40000 ALTER TABLE `kunder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lager`
--

DROP TABLE IF EXISTS `lager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lager` (
  `hylla` varchar(80) NOT NULL,
  PRIMARY KEY (`hylla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lager`
--

LOCK TABLES `lager` WRITE;
/*!40000 ALTER TABLE `lager` DISABLE KEYS */;
INSERT INTO `lager` VALUES ('A:101'),('B:101'),('C:101');
/*!40000 ALTER TABLE `lager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_eshop`
--

DROP TABLE IF EXISTS `log_eshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_eshop` (
  `tid` timestamp NOT NULL DEFAULT current_timestamp(),
  `handelse` varchar(120) DEFAULT NULL,
  `produkt` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_eshop`
--

LOCK TABLES `log_eshop` WRITE;
/*!40000 ALTER TABLE `log_eshop` DISABLE KEYS */;
INSERT INTO `log_eshop` VALUES ('2022-03-08 21:06:49','Ny produkt lades till','kaffe1'),('2022-03-08 21:06:49','Ny produkt lades till','te1'),('2022-03-08 21:06:49','Ny produkt lades till','kaffemix1'),('2022-03-08 21:06:49','Ny produkt lades till','skiva1');
/*!40000 ALTER TABLE `log_eshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_rad`
--

DROP TABLE IF EXISTS `order_rad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_rad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_nummer` int(11) DEFAULT NULL,
  `produktid` varchar(80) DEFAULT NULL,
  `antal` int(11) DEFAULT NULL,
  `pris` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_nummer` (`order_nummer`),
  KEY `produktid` (`produktid`),
  CONSTRAINT `order_rad_ibfk_1` FOREIGN KEY (`order_nummer`) REFERENCES `ordrar` (`order_nummer`),
  CONSTRAINT `order_rad_ibfk_2` FOREIGN KEY (`produktid`) REFERENCES `produkt` (`produktid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_rad`
--

LOCK TABLES `order_rad` WRITE;
/*!40000 ALTER TABLE `order_rad` DISABLE KEYS */;
INSERT INTO `order_rad` VALUES (1,1,'kaffe1',2,138.00),(2,1,'te1',1,79.00),(3,2,'kaffemix1',5,245.00),(4,3,'kaffe1',2,138.00),(5,3,'te1',2,158.00),(6,4,'te1',1,79.00),(7,5,'te1',2,158.00);
/*!40000 ALTER TABLE `order_rad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordrar`
--

DROP TABLE IF EXISTS `ordrar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordrar` (
  `order_nummer` int(11) NOT NULL AUTO_INCREMENT,
  `kund` int(11) DEFAULT NULL,
  `rader` int(11) DEFAULT NULL,
  `antal_prod` int(11) DEFAULT NULL,
  `skapades` timestamp NOT NULL DEFAULT current_timestamp(),
  `uppdaterades` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `bestalld` timestamp NULL DEFAULT NULL,
  `skickad` timestamp NULL DEFAULT NULL,
  `raderades` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_nummer`),
  KEY `kund` (`kund`),
  KEY `order_rad_idx` (`rader`),
  CONSTRAINT `ordrar_ibfk_1` FOREIGN KEY (`kund`) REFERENCES `kunder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordrar`
--

LOCK TABLES `ordrar` WRITE;
/*!40000 ALTER TABLE `ordrar` DISABLE KEYS */;
INSERT INTO `ordrar` VALUES (1,1,2,3,'2022-03-08 21:10:20','2022-03-08 21:10:38','2022-03-08 21:10:38',NULL,NULL),(2,4,1,5,'2022-03-08 21:11:12','2022-03-08 21:11:22',NULL,NULL,NULL),(3,3,2,4,'2022-03-08 21:11:29','2022-03-08 21:12:03','2022-03-08 21:11:41','2022-03-08 21:12:03',NULL),(4,1,1,1,'2022-03-08 21:39:02','2022-03-08 21:42:12','2022-03-08 21:42:12',NULL,NULL),(5,3,1,2,'2022-03-08 21:42:16','2022-03-08 21:43:24',NULL,NULL,NULL),(6,3,0,0,'2022-03-08 21:43:30',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ordrar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plocklista`
--

DROP TABLE IF EXISTS `plocklista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plocklista` (
  `plocklista_nummer` int(11) NOT NULL AUTO_INCREMENT,
  `kund` int(11) DEFAULT NULL,
  `skapades` datetime DEFAULT current_timestamp(),
  `exekverades` datetime DEFAULT NULL,
  PRIMARY KEY (`plocklista_nummer`),
  KEY `kund` (`kund`),
  CONSTRAINT `plocklista_ibfk_1` FOREIGN KEY (`kund`) REFERENCES `kunder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plocklista`
--

LOCK TABLES `plocklista` WRITE;
/*!40000 ALTER TABLE `plocklista` DISABLE KEYS */;
/*!40000 ALTER TABLE `plocklista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plocklista_rad`
--

DROP TABLE IF EXISTS `plocklista_rad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plocklista_rad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produktid` varchar(80) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `antal_att_plocka` int(11) DEFAULT NULL,
  `plats_pa_lager` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produktid` (`produktid`),
  KEY `plocklista_order_rad_idx` (`order_id`),
  CONSTRAINT `plocklista_rad_ibfk_1` FOREIGN KEY (`produktid`) REFERENCES `produkt` (`produktid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plocklista_rad`
--

LOCK TABLES `plocklista_rad` WRITE;
/*!40000 ALTER TABLE `plocklista_rad` DISABLE KEYS */;
INSERT INTO `plocklista_rad` VALUES (1,'kaffe1',1,2,'A:101'),(2,'te1',1,1,'B:101'),(3,'kaffemix1',2,5,'A:101');
/*!40000 ALTER TABLE `plocklista_rad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt`
--

DROP TABLE IF EXISTS `produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produkt` (
  `produktid` varchar(80) NOT NULL,
  `namn` varchar(80) DEFAULT NULL,
  `beskrivning` varchar(200) DEFAULT NULL,
  `pris` int(11) DEFAULT NULL,
  `bildlank` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`produktid`),
  KEY `prod_name_idx` (`namn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt`
--

LOCK TABLES `produkt` WRITE;
/*!40000 ALTER TABLE `produkt` DISABLE KEYS */;
INSERT INTO `produkt` VALUES ('kaffe1','Kaffemugg med dbwebb-tryck','En vacker snövit keramisk kaffemugg med högupplöst flerfärgstryck från dbwebb.',69,'/img/eshop/kaffekopp.png'),('kaffemix1','Kaffeblandning med dbwebb-krydda','En egenbryggd kaffeblandning för aktiva studiedagara, utan paus, spetsad med dbwebb-krydda.',49,'/img/eshop/kaffe.png'),('skiva1','Skiva där BTHs lärarkår sjunger sånger','BTHs samlade lärarkår sjunger studiemotiverande sångar, inkluderar länk till online spellista.',199,'/img/eshop/bth-skiva.png'),('te1','Temugg med dbwebb-tryck','En ståtlig matt helsvart temugg, extra stor, med grön dbwebb-logo, för sköna stunder framför datorn.',79,'/img/eshop/temugg.png');
/*!40000 ALTER TABLE `produkt` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`maria`@`localhost`*/ /*!50003 TRIGGER log_insert_prod
AFTER INSERT
ON produkt FOR EACH ROW
    INSERT INTO log_eshop (`handelse`, `produkt`)
    VALUES ('Ny produkt lades till', NEW.produktid) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`maria`@`localhost`*/ /*!50003 TRIGGER log_update_prod
AFTER UPDATE
ON produkt FOR EACH ROW
    INSERT INTO log_eshop (`handelse`, `produkt`)
    VALUES ('Uppdaterades detaljer om produkten', NEW.produktid) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`maria`@`localhost`*/ /*!50003 TRIGGER log_delete_prod
BEFORE DELETE
ON produkt FOR EACH ROW
    INSERT INTO log_eshop (`handelse`, `produkt`)
    VALUES ('Produkten raderades', OLD.produktid) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `produkt2kategori`
--

DROP TABLE IF EXISTS `produkt2kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produkt2kategori` (
  `produktid` varchar(80) NOT NULL,
  `kategori` varchar(80) NOT NULL,
  PRIMARY KEY (`produktid`,`kategori`),
  KEY `kategori` (`kategori`),
  CONSTRAINT `produkt2kategori_ibfk_1` FOREIGN KEY (`produktid`) REFERENCES `produkt` (`produktid`),
  CONSTRAINT `produkt2kategori_ibfk_2` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`namn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt2kategori`
--

LOCK TABLES `produkt2kategori` WRITE;
/*!40000 ALTER TABLE `produkt2kategori` DISABLE KEYS */;
INSERT INTO `produkt2kategori` VALUES ('kaffe1','dbwebb'),('kaffe1','mugg'),('kaffe1','porslin'),('kaffemix1','dbwebb'),('kaffemix1','kaffe'),('skiva1','dbwebb'),('skiva1','skiva'),('te1','dbwebb');
/*!40000 ALTER TABLE `produkt2kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt2lager`
--

DROP TABLE IF EXISTS `produkt2lager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produkt2lager` (
  `produktid` varchar(80) NOT NULL,
  `antal` int(11) DEFAULT NULL,
  `hylla` varchar(80) NOT NULL,
  PRIMARY KEY (`produktid`,`hylla`),
  KEY `hylla` (`hylla`),
  CONSTRAINT `produkt2lager_ibfk_1` FOREIGN KEY (`produktid`) REFERENCES `produkt` (`produktid`),
  CONSTRAINT `produkt2lager_ibfk_2` FOREIGN KEY (`hylla`) REFERENCES `lager` (`hylla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt2lager`
--

LOCK TABLES `produkt2lager` WRITE;
/*!40000 ALTER TABLE `produkt2lager` DISABLE KEYS */;
INSERT INTO `produkt2lager` VALUES ('kaffe1',3,'A:101'),('kaffemix1',10,'A:101'),('skiva1',10,'C:101'),('te1',6,'B:101');
/*!40000 ALTER TABLE `produkt2lager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'eshop'
--
/*!50003 DROP FUNCTION IF EXISTS `order_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` FUNCTION `order_status`(a_skapades TIMESTAMP,
    a_uppdaterades TIMESTAMP,
    a_bestalld TIMESTAMP,
    a_skickad TIMESTAMP,
    a_raderades TIMESTAMP
) RETURNS varchar(20) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
    IF a_raderades IS NOT NULL THEN 
		RETURN "Deleted";
	ELSEIF a_skickad IS NOT NULL THEN 
		RETURN "Sent";
	ELSEIF a_bestalld IS NOT NULL THEN 
		RETURN "Ordered";
	ELSEIF a_uppdaterades IS NOT NULL THEN 
		RETURN "Updated";
	END IF;
    RETURN "Created";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_inv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `add_inv`(
	l_prod_id VARCHAR(80),
    l_hylla VARCHAR(80),
    l_antal INT
)
BEGIN
	DECLARE current_antal INT;
    DECLARE current_hylla VARCHAR(80);
	DECLARE current_id VARCHAR(80);
    DECLARE new_antal INT;
    
    IF l_prod_id NOT IN (SELECT produktid FROM produkt2lager) THEN
		INSERT INTO produkt2lager(produktid, antal, hylla) VALUES (l_prod_id, l_antal, l_hylla);
	ELSE
		SET current_id = (SELECT produktid from produkt2lager WHERE produktid=l_prod_id);
		SET current_antal = (SELECT antal from produkt2lager WHERE produktid=l_prod_id);
		SET current_hylla = (SELECT hylla from produkt2lager WHERE produktid=l_prod_id);
        
        IF current_antal IS NULL THEN
			SET current_antal=0;
		END IF;
        
        SET new_antal = current_antal + l_antal;
        IF current_hylla=l_hylla THEN 
			UPDATE produkt2lager SET antal = new_antal WHERE produktid=l_prod_id;
		ELSE 
			UPDATE produkt2lager SET antal = new_antal, hylla=l_hylla WHERE produktid=l_prod_id;
		END IF;
	END IF;
    SELECT * FROM produkt2lager;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_prod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `add_prod`(
	p_id VARCHAR(80),
    p_name VARCHAR(80),
    p_beskrivning VARCHAR(200),
    p_pris INT,
    p_bild VARCHAR(120)
)
BEGIN
    INSERT INTO produkt VALUES(p_id, p_name, p_beskrivning, p_pris, p_bild);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_rad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `add_rad`(
	order_id INT,
    chosen_prod VARCHAR(20),
    chosen_antal INT,
    prod_price INT
)
BEGIN
	DECLARE current_antal INT;
    DECLARE new_antal INT;
    DECLARE num_of_rows INT;
    DECLARE new_rows INT;
    DECLARE total_antal_row_before INT;
    DECLARE total_antal_row_after INT;
    SET total_antal_row_before = (SELECT antal_prod from ordrar WHERE order_nummer=order_id);
    SET total_antal_row_after = total_antal_row_before + chosen_antal;
    SET num_of_rows = (SELECT rader from ordrar WHERE order_nummer=order_id);
    SET new_rows = num_of_rows + 1;
    SET current_antal = (SELECT antal from produkt2lager WHERE produktid=chosen_prod);
    SET new_antal = current_antal - chosen_antal;
    INSERT INTO order_rad (order_nummer, produktid, antal, pris) VALUES (order_id, chosen_prod, chosen_antal, chosen_antal*prod_price);
    UPDATE produkt2lager SET antal=new_antal WHERE produktid=chosen_prod;
    UPDATE ordrar SET uppdaterades = NOW(), rader=new_rows, antal_prod=total_antal_row_after WHERE order_nummer=order_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `create_order`(
	a_kund INT
)
BEGIN
	INSERT INTO ordrar (kund, rader, antal_prod) VALUES (a_kund, 0, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_prod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `delete_prod`(
	p_id VARCHAR(80)
)
BEGIN
    DELETE FROM produkt2lager WHERE produktid=p_id;
	DELETE FROM produkt2kategori WHERE produktid=p_id;
    DELETE FROM produkt WHERE produktid=p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `del_inv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `del_inv`(
	l_prod_id VARCHAR(80),
    l_hylla VARCHAR(80),
    l_antal INT
)
BEGIN
	DECLARE current_antal INT;
	DECLARE current_id VARCHAR(80);
    DECLARE new_antal INT;
    
    SET current_antal = (SELECT antal from produkt2lager WHERE produktid=l_prod_id);
    SET current_id = (SELECT produktid from produkt2lager WHERE produktid=l_prod_id);

    IF current_antal IS NULL THEN
		SET current_antal=0;
	END IF;
    SET new_antal = current_antal - l_antal;
    
	UPDATE produkt2lager SET antal = new_antal WHERE produktid=l_prod_id AND hylla=l_hylla;
    SELECT * FROM produkt2lager;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_order_rows` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `get_order_rows`(
	o_id INT
)
BEGIN
	select * from order_rad WHERE order_nummer=o_id;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `make_picklist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `make_picklist`(
	or_id INT,
    prod VARCHAR(80),
    ant INT
)
BEGIN
    DECLARE plats VARCHAR(80);
    SET plats = (SELECT hylla from produkt2lager WHERE produktid=prod);
	IF NOT EXISTS (SELECT produktid from plocklista_rad WHERE produktid=prod) THEN
		INSERT INTO plocklista_rad (produktid, order_id, antal_att_plocka, plats_pa_lager) VALUES (prod, or_id, ant, plats);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `place_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `place_order`(
	o_id INT
)
BEGIN
    UPDATE ordrar SET bestalld = NOW() WHERE order_nummer=o_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ship_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `ship_order`(
	o_id INT
)
BEGIN
	UPDATE ordrar SET skickad = NOW() WHERE order_nummer=o_id;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_all_orders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_all_orders`(
)
BEGIN
    SELECT
	order_nummer,
	kund, 
    rader, 
    DATE_FORMAT(skapades, '%Y-%m-%d') as added,
    order_status(skapades, uppdaterades, bestalld, skickad, raderades) AS "status"
FROM ordrar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_cat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_cat`(
)
BEGIN
SELECT * FROM kategori;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_current_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_current_order`(
	o_id INT
)
BEGIN
    SELECT 
    orr.id,
    orr.order_nummer,
    prod.namn,
    orr.antal,
    orr.pris 
    FROM order_rad AS orr
    JOIN produkt AS prod
    ON orr.produktid = prod.produktid
    WHERE order_nummer = o_id;
    SELECT order_status(skapades, uppdaterades, bestalld, skickad, raderades) AS "status" FROM ordrar WHERE order_nummer = o_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_customer`(
)
BEGIN
	SELECT id,
    CONCAT(fornamn, " ", efternamn) AS namn,
    adress,
    telefon
    FROM kunder;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_hyllor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_hyllor`(
)
BEGIN
SELECT * FROM lager;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_inv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_inv`(
)
BEGIN
    SELECT 
        p.produktid,
        p.namn,
        l.hylla,
        l.antal,
        p.pris
    FROM produkt AS p
    LEFT OUTER JOIN produkt2lager AS l
    ON p.produktid=l.produktid
    GROUP BY p.produktid
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_log`(
	num INT
)
BEGIN
SELECT * FROM log_eshop ORDER BY tid DESC LIMIT num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_one_prod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_one_prod`(
	id VARCHAR(80)
)
BEGIN
SELECT * FROM produkt WHERE produktid=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_order_by_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_order_by_customer`(
	o_kund INT
)
BEGIN
    SELECT
	order_nummer,
	kund, 
    rader, 
    DATE_FORMAT(skapades, '%Y-%m-%d') as added,
    order_status(skapades, uppdaterades, bestalld, skickad, raderades) AS "status" FROM ordrar WHERE kund = o_kund;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_order_filtered` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_order_filtered`(
	filter_word INT
)
BEGIN
    SELECT
	order_nummer,
	kund, 
    rader, 
    DATE_FORMAT(skapades, '%Y-%m-%d') as added,
    order_status(skapades, uppdaterades, bestalld, skickad, raderades) AS "status"
	FROM ordrar WHERE order_nummer=filter_word OR kund=filter_word;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_picklist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_picklist`(
	o_id INT
)
BEGIN
	SELECT 
    produktid, 
    order_id, 
    antal_att_plocka, 
    plats_pa_lager 
    FROM plocklista_rad WHERE order_id=o_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_prod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_prod`(
)
BEGIN
    SELECT 
        p.produktid, 
        p.namn, 
        p.beskrivning, 
        p.pris,
        GROUP_CONCAT(kat.kategori) AS "kategori",
        l.antal
    FROM produkt AS p
    LEFT OUTER JOIN produkt2kategori AS kat
    ON p.produktid=kat.produktid
    LEFT OUTER JOIN produkt2lager AS l
    ON p.produktid=l.produktid
    GROUP BY p.produktid
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_prod_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_prod_all`(
)
BEGIN
SELECT * FROM produkt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_prod_filter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_prod_filter`(
	filter_word VARCHAR(80)
)
BEGIN
	SELECT 
        p.produktid, 
        p.namn, 
        l.hylla,
        l.antal
    FROM produkt AS p 
    JOIN produkt2lager AS l
    ON p.produktid=l.produktid
    WHERE p.produktid LIKE CONCAT('%', filter_word, '%') OR p.namn LIKE CONCAT('%', filter_word, '%') OR l.hylla LIKE CONCAT('%', filter_word, '%')
    ORDER BY p.produktid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_status`(
	o_id INT
)
BEGIN
    SELECT
    order_status(skapades, uppdaterades, bestalld, skickad, raderades) AS "status" FROM ordrar WHERE order_nummer=o_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_prod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `update_prod`(
	p_id VARCHAR(80),
    p_name VARCHAR(80),
    p_beskrivning VARCHAR(200),
    p_pris DECIMAL(5, 2),
    p_bild VARCHAR(120)
)
BEGIN
	UPDATE produkt SET namn=p_name, beskrivning=p_beskrivning, pris=p_pris, bildlank=p_bild 
	WHERE produktid=p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-17 14:14:06
