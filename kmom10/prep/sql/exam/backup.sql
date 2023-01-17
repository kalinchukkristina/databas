-- MariaDB dump 10.19  Distrib 10.6.5-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: exam
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
-- Table structure for table `kund`
--

DROP TABLE IF EXISTS `kund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kund` (
  `id` int(11) NOT NULL,
  `fornamn` varchar(20) DEFAULT NULL,
  `efternamn` varchar(20) DEFAULT NULL,
  `ort` varchar(20) DEFAULT NULL,
  `medlem` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kund`
--

LOCK TABLES `kund` WRITE;
/*!40000 ALTER TABLE `kund` DISABLE KEYS */;
INSERT INTO `kund` VALUES (1,'Vladimir','Putin','Moskva','1999-12-31'),(2,'Boris','Johnson','London','2019-07-24'),(3,'Cyril','Ramaphosa','Johannisburg','2018-02-15'),(4,'Joe','Biden','Washington','2021-01-20'),(5,'Xi','Jinping','Peking','2013-03-14');
/*!40000 ALTER TABLE `kund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kund2vaccin`
--

DROP TABLE IF EXISTS `kund2vaccin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kund2vaccin` (
  `id` int(11) NOT NULL,
  `kund_id` int(11) DEFAULT NULL,
  `vaccin_id` varchar(2) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kund_id` (`kund_id`),
  KEY `vaccin_id` (`vaccin_id`),
  CONSTRAINT `kund2vaccin_ibfk_1` FOREIGN KEY (`kund_id`) REFERENCES `kund` (`id`),
  CONSTRAINT `kund2vaccin_ibfk_2` FOREIGN KEY (`vaccin_id`) REFERENCES `vaccin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kund2vaccin`
--

LOCK TABLES `kund2vaccin` WRITE;
/*!40000 ALTER TABLE `kund2vaccin` DISABLE KEYS */;
INSERT INTO `kund2vaccin` VALUES (1,1,'mt','2001-06-07'),(2,1,'ss','2008-08-12'),(3,1,'as','2021-05-28'),(4,2,'mt','2002-06-08'),(5,3,'as','2021-02-23'),(6,4,'ss','2008-08-14'),(7,4,'ss','2021-05-01');
/*!40000 ALTER TABLE `kund2vaccin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sjukdom`
--

DROP TABLE IF EXISTS `sjukdom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sjukdom` (
  `id` int(11) NOT NULL,
  `namn` varchar(50) DEFAULT NULL,
  `beskrivning` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sjukdom`
--

LOCK TABLES `sjukdom` WRITE;
/*!40000 ALTER TABLE `sjukdom` DISABLE KEYS */;
INSERT INTO `sjukdom` VALUES (1,'Agorafobi','Torgskräck'),(2,'Atopiska vinterfötter','Vanligast hos barn mellan 4 och 12 års ålder'),(3,'Anemi','Järnbrist'),(4,'Anafylaxi','Allergisk chock'),(5,'Ankyloserande spondylit','Ont i ryggen'),(6,'Alopecia areata','Håravfall');
/*!40000 ALTER TABLE `sjukdom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccin`
--

DROP TABLE IF EXISTS `vaccin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vaccin` (
  `id` varchar(2) NOT NULL,
  `namn` varchar(30) DEFAULT NULL,
  `typ` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccin`
--

LOCK TABLES `vaccin` WRITE;
/*!40000 ALTER TABLE `vaccin` DISABLE KEYS */;
INSERT INTO `vaccin` VALUES ('as','Allverkande svamp','Svamp'),('mt','Den magiska tabletten','Tablett'),('rr','Rysk roulette','Slumpen'),('ss','Stor spruta','Spruta');
/*!40000 ALTER TABLE `vaccin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccin2sjukdom`
--

DROP TABLE IF EXISTS `vaccin2sjukdom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vaccin2sjukdom` (
  `id` int(11) NOT NULL,
  `vaccin_id` varchar(2) DEFAULT NULL,
  `sjukdom_id` int(11) DEFAULT NULL,
  `sannolikhet` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vaccin_id` (`vaccin_id`),
  KEY `sjukdom_id` (`sjukdom_id`),
  CONSTRAINT `vaccin2sjukdom_ibfk_1` FOREIGN KEY (`vaccin_id`) REFERENCES `vaccin` (`id`),
  CONSTRAINT `vaccin2sjukdom_ibfk_2` FOREIGN KEY (`sjukdom_id`) REFERENCES `sjukdom` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccin2sjukdom`
--

LOCK TABLES `vaccin2sjukdom` WRITE;
/*!40000 ALTER TABLE `vaccin2sjukdom` DISABLE KEYS */;
INSERT INTO `vaccin2sjukdom` VALUES (1,'mt',1,7),(2,'ss',1,11),(3,'mt',3,2),(4,'as',3,9),(5,'mt',4,13),(6,'rr',4,50),(7,'rr',5,50);
/*!40000 ALTER TABLE `vaccin2sjukdom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vaccin_sjukdom`
--

DROP TABLE IF EXISTS `vaccin_sjukdom`;
/*!50001 DROP VIEW IF EXISTS `vaccin_sjukdom`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vaccin_sjukdom` (
  `vaccin` tinyint NOT NULL,
  `typ` tinyint NOT NULL,
  `sjukdom` tinyint NOT NULL,
  `beskrivning` tinyint NOT NULL,
  `sannolikhet` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'exam'
--
/*!50003 DROP PROCEDURE IF EXISTS `search_by_word` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `search_by_word`(
	word VARCHAR(30)
)
BEGIN

	SELECT * FROM vaccin_sjukdom
    WHERE vaccin LIKE CONCAT('%', word, '%') OR 
        typ LIKE CONCAT('%', word, '%') OR
        sjukdom LIKE CONCAT('%', word, '%') OR
        beskrivning LIKE CONCAT('%', word, '%');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_all`()
BEGIN

SELECT 
    CONCAT(k.fornamn, " ", k.efternamn) AS Namn,
    v.namn AS Vaccin,
    v.typ AS Typ,
    DATE_FORMAT(k2v.datum, '%Y-%m-%d') AS Datum
FROM (kund2vaccin AS k2v 
RIGHT OUTER JOIN kund AS k ON k.id = k2v.kund_id)
LEFT OUTER JOIN vaccin AS v ON k2v.vaccin_id = v.id
ORDER BY Datum DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_exakt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_exakt`()
BEGIN

SELECT 
    CONCAT(k.fornamn, " ", k.efternamn, " (", k.ort, ")") AS Kund,
    CONCAT(v.namn, " (", v.typ, ")") AS Vaccin,
    DATE_FORMAT(k2v.datum, '%y-%m-%d') AS Datum,
    GROUP_CONCAT(sj.namn SEPARATOR ", ") AS Sjukdom
FROM kund2vaccin AS k2v 
RIGHT OUTER JOIN kund AS k ON k.id = k2v.kund_id
LEFT OUTER JOIN vaccin AS v ON k2v.vaccin_id = v.id
LEFT OUTER JOIN vaccin2sjukdom AS v2sj ON v2sj.vaccin_id = v.id
LEFT OUTER JOIN sjukdom AS sj ON v2sj.sjukdom_id = sj.id
GROUP BY Datum
ORDER BY k.ort DESC, v.typ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vaccin_sjukdom`
--

/*!50001 DROP TABLE IF EXISTS `vaccin_sjukdom`*/;
/*!50001 DROP VIEW IF EXISTS `vaccin_sjukdom`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`maria`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vaccin_sjukdom` AS select `v`.`namn` AS `vaccin`,`v`.`typ` AS `typ`,`sj`.`namn` AS `sjukdom`,`sj`.`beskrivning` AS `beskrivning`,`v2s`.`sannolikhet` AS `sannolikhet` from (`sjukdom` `sj` left join (`vaccin2sjukdom` `v2s` join `vaccin` `v` on(`v`.`id` = `v2s`.`vaccin_id`)) on(`sj`.`id` = `v2s`.`sjukdom_id`)) */;
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

-- Dump completed on 2022-03-23 22:28:05
