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
-- Temporary table structure for view `all_data`
--

DROP TABLE IF EXISTS `all_data`;
/*!50001 DROP VIEW IF EXISTS `all_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `all_data` (
  `fisk` tinyint NOT NULL,
  `fisk_latin` tinyint NOT NULL,
  `manader` tinyint NOT NULL,
  `temp_min` tinyint NOT NULL,
  `temp_max` tinyint NOT NULL,
  `fisk_url` tinyint NOT NULL,
  `familj` tinyint NOT NULL,
  `fam_latin` tinyint NOT NULL,
  `fam_url` tinyint NOT NULL,
  `start` tinyint NOT NULL,
  `kg` tinyint NOT NULL,
  `hus` tinyint NOT NULL,
  `rum` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `familj`
--

DROP TABLE IF EXISTS `familj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `familj` (
  `id` int(11) NOT NULL,
  `namn` varchar(50) DEFAULT NULL,
  `latin` varchar(30) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familj`
--

LOCK TABLES `familj` WRITE;
/*!40000 ALTER TABLE `familj` DISABLE KEYS */;
INSERT INTO `familj` VALUES (1,'laxfiskar','Salmonidae','https://sv.wikipedia.org/wiki/Laxfiskar'),(2,'ciklider','Cichlidae','https://sv.wikipedia.org/wiki/Ciklider'),(3,'clariidae','Clariidae','https://sv.wikipedia.org/wiki/Clariidae'),(4,'störar','Acipenseridae','https://sv.wikipedia.org/wiki/St%C3%B6rar');
/*!40000 ALTER TABLE `familj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fisk`
--

DROP TABLE IF EXISTS `fisk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fisk` (
  `id` int(11) NOT NULL,
  `namn` varchar(50) DEFAULT NULL,
  `latin` varchar(50) DEFAULT NULL,
  `familj_id` int(11) DEFAULT NULL,
  `manader` int(11) DEFAULT NULL,
  `temp_min` int(11) DEFAULT NULL,
  `temp_max` int(11) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `familj_id` (`familj_id`),
  CONSTRAINT `fisk_ibfk_1` FOREIGN KEY (`familj_id`) REFERENCES `familj` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fisk`
--

LOCK TABLES `fisk` WRITE;
/*!40000 ALTER TABLE `fisk` DISABLE KEYS */;
INSERT INTO `fisk` VALUES (1,'Regnbåge','Onchorhynchus mykiss',1,12,10,20,'https://sv.wikipedia.org/wiki/Regnb%C3%A5ge_(fisk)'),(2,'Tilapia','Oreochromis sp',2,6,21,36,'https://sv.wikipedia.org/wiki/Tilapia'),(3,'Niltilapia','Oreochomis niloticus',2,6,21,36,'https://en.wikipedia.org/wiki/Nile_tilapia'),(4,'Clariasmal (afrikansk ålmal)','Clarias gariepinus',3,6,21,34,'https://sv.wikipedia.org/wiki/Afrikansk_vandrarmal'),(5,'Sibirisk stör','Acipenser baeri',4,12,1,26,'https://sv.wikipedia.org/wiki/Sibirisk_st%C3%B6r');
/*!40000 ALTER TABLE `fisk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odling`
--

DROP TABLE IF EXISTS `odling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odling` (
  `id` int(11) NOT NULL,
  `tank_id` varchar(15) DEFAULT NULL,
  `fisk_id` int(11) DEFAULT NULL,
  `temp` int(11) DEFAULT NULL,
  `kg` int(11) DEFAULT NULL,
  `start` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tank_id` (`tank_id`),
  KEY `fisk_id` (`fisk_id`),
  CONSTRAINT `odling_ibfk_1` FOREIGN KEY (`tank_id`) REFERENCES `tank` (`id`),
  CONSTRAINT `odling_ibfk_2` FOREIGN KEY (`fisk_id`) REFERENCES `fisk` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odling`
--

LOCK TABLES `odling` WRITE;
/*!40000 ALTER TABLE `odling` DISABLE KEYS */;
INSERT INTO `odling` VALUES (1,'lada101',1,24,5500,'2021-10-01'),(2,'lada102',2,23,11000,'2021-10-01'),(3,'svin201',4,20,24400,'2021-11-15'),(4,'svin202',4,24,16500,'2021-11-15'),(5,'höns303',5,18,2300,'2021-12-01');
/*!40000 ALTER TABLE `odling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tank`
--

DROP TABLE IF EXISTS `tank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tank` (
  `id` varchar(15) NOT NULL,
  `hus` varchar(20) DEFAULT NULL,
  `rum` int(11) DEFAULT NULL,
  `antal` int(11) DEFAULT NULL,
  `m3` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tank`
--

LOCK TABLES `tank` WRITE;
/*!40000 ALTER TABLE `tank` DISABLE KEYS */;
INSERT INTO `tank` VALUES ('höns303','Hönshuset',303,8,12.0),('höns304','Hönshuset',304,4,18.0),('lada101','Ladan',101,8,12.0),('lada102','Ladan',102,8,12.0),('svin201','Svinstian',201,4,18.0),('svin202','Svinstian',202,8,12.0);
/*!40000 ALTER TABLE `tank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'exam'
--
/*!50003 DROP FUNCTION IF EXISTS `check_temp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` FUNCTION `check_temp`(`temp` VARCHAR(3),
    `min` INT,
    `max` INT
) RETURNS char(15) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
	IF temp < min THEN
		RETURN "Lag temp";
	ELSEIF temp > max THEN
		RETURN "Hog temp";
	END IF;
    RETURN "";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `report` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `report`()
BEGIN
	(SELECT
	CONCAT(t.hus, "/", t.rum) AS Lokal,
	DATE_FORMAT(od.start, '%Y-%m-%d') AS Start,
	DATE_FORMAT(ADDDATE(od.start, INTERVAL f.manader MONTH), '%Y-%m-%d') AS Klar,
	od.kg,
	od.temp AS Temperatur,
	check_temp(od.temp, f.temp_min, f.temp_max) AS Varning,
	CONCAT(f.namn, " ", "(", f.latin, ")") AS Namn,
	CONCAT(fam.namn, " ", "(", fam.latin, ")") AS Familj,
	f.manader AS Manader,
	CONCAT(f.temp_min, "-", f.temp_max) AS `Optimal Temp`
	FROM tank AS t RIGHT OUTER JOIN odling AS od ON od.tank_id=t.id
	RIGHT OUTER JOIN fisk AS f ON od.fisk_id=f.id
	JOIN familj AS fam ON f.familj_id=fam.id
	)
	UNION
	(SELECT
	CONCAT(t.hus, "/", t.rum) AS Lokal,
	DATE_FORMAT(od.start, '%Y-%m-%d') AS Start,
	DATE_FORMAT(ADDDATE(od.start, INTERVAL f.manader MONTH), '%Y-%m-%d') AS Klar,
	od.kg,
	od.temp AS Temperatur,
	check_temp(od.temp, f.temp_min, f.temp_max) AS Varning,
	CONCAT(f.namn, " ", "(", f.latin, ")") AS Namn,
	CONCAT(fam.namn, " ", "(", fam.latin, ")") AS Familj,
	f.manader AS Manader,
	CONCAT(f.temp_min, "-", f.temp_max) AS `Optimal Temp`
	FROM (odling AS od RIGHT OUTER JOIN tank AS t ON od.tank_id=t.id)
	LEFT OUTER JOIN fisk AS f ON od.fisk_id=f.id
	LEFT OUTER JOIN familj AS fam ON f.familj_id=fam.id
	WHERE od.tank_id IS NULL)
	ORDER BY Klar, Lokal;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
	word VARCHAR(50)
)
BEGIN
		SELECT * FROM all_data
		WHERE fisk LIKE CONCAT('%', word, '%') OR 
		familj LIKE CONCAT('%', word, '%') OR
        hus LIKE CONCAT('%', word, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_terminal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `search_terminal`(
	word VARCHAR(50)
)
BEGIN
SELECT 
    fisk AS `Fisk`,
	fisk_latin AS `Fisk Latin`,
	manader AS `Manader`,
	temp_min AS `Min temperatur`,
	temp_max AS `Max temperatur`,
    familj AS `Familj`,
    fam_latin AS `Familj Latin`,
    start AS `Start`,
    kg AS `Vikt`,
	hus AS `Lokal`,
    rum AS `Rum`
    FROM all_data
	WHERE fisk LIKE CONCAT('%', word, '%') OR 
	familj LIKE CONCAT('%', word, '%') OR
    hus LIKE CONCAT('%', word, '%');
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
	*
    FROM all_data;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_all_term` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_all_term`()
BEGIN
SELECT 
	fisk AS `Fisk`,
	fisk_latin AS `Fisk Latin`,
	manader AS `Manader`,
	temp_min AS `Min temperatur`,
	temp_max AS `Max temperatur`,
    familj AS `Familj`,
    fam_latin AS `Familj Latin`,
    start AS `Start`,
    kg AS `Vikt`,
	hus AS `Lokal`,
    rum AS `Rum`
FROM all_data;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `all_data`
--

/*!50001 DROP TABLE IF EXISTS `all_data`*/;
/*!50001 DROP VIEW IF EXISTS `all_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`maria`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_data` AS select `f`.`namn` AS `fisk`,`f`.`latin` AS `fisk_latin`,`f`.`manader` AS `manader`,`f`.`temp_min` AS `temp_min`,`f`.`temp_max` AS `temp_max`,`f`.`url` AS `fisk_url`,`fam`.`namn` AS `familj`,`fam`.`latin` AS `fam_latin`,`fam`.`url` AS `fam_url`,date_format(`od`.`start`,'%Y-%m-%d') AS `start`,`od`.`kg` AS `kg`,`t`.`hus` AS `hus`,`t`.`rum` AS `rum` from (((`fisk` `f` join `familj` `fam` on(`fam`.`id` = `f`.`familj_id`)) left join `odling` `od` on(`od`.`fisk_id` = `f`.`id`)) left join `tank` `t` on(`t`.`id` = `od`.`tank_id`)) */;
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

-- Dump completed on 2022-03-24 13:11:23
