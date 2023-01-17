DROP TABLE IF EXISTS odling;
DROP TABLE IF EXISTS fisk;
DROP TABLE IF EXISTS familj;
DROP TABLE IF EXISTS tank;


DROP VIEW IF EXISTS all_data;

DROP PROCEDURE IF EXISTS show_all;
DROP PROCEDURE IF EXISTS show_all_term;

-- Uppgift 2
DROP PROCEDURE IF EXISTS search_by_word;
DROP PROCEDURE IF EXISTS search_terminal;

--Uppgift 3
DROP FUNCTION IF EXISTS check_temp;
DROP PROCEDURE IF EXISTS report;


CREATE TABLE tank (
    `id` VARCHAR(15),
    `hus` VARCHAR(20),
    `rum` INT,
    `antal` INT,
    `m3` DECIMAL(3, 1),

    PRIMARY KEY (id)
);

CREATE TABLE familj (
    `id` INT,
    `namn` VARCHAR(50),
    `latin` VARCHAR(30),
    `url` NVARCHAR(1000),

    PRIMARY KEY (id)
);


CREATE TABLE fisk (
    `id` INT,
    `namn` VARCHAR(50),
    `latin` VARCHAR(50),
    `familj_id` INT,
    `manader` INT,
    `temp_min` INT,
    `temp_max` INT,
    `url` NVARCHAR(1000),

    PRIMARY KEY (id),
    FOREIGN KEY (familj_id) REFERENCES familj(id)
);

CREATE TABLE odling (
    `id` INT,
    `tank_id` VARCHAR(15),
    `fisk_id` INT,
    `temp` INT,
    `kg` INT,
    `start` DATE,

    PRIMARY KEY (id),
    FOREIGN KEY (tank_id) REFERENCES tank(id),
    FOREIGN KEY (fisk_id) REFERENCES fisk(id)
);



CREATE VIEW all_data AS 
SELECT 
	f.namn AS fisk,
	f.latin AS fisk_latin,
	f.manader,
	f.temp_min,
	f.temp_max,
    f.url AS fisk_url,
    fam.namn AS familj,
    fam.latin AS fam_latin,
    fam.url AS fam_url,
    DATE_FORMAT(od.start, '%Y-%m-%d') AS start,
    od.kg,
	t.hus,
    t.rum
FROM (fisk AS f JOIN familj AS fam ON fam.id=familj_id)
LEFT OUTER JOIN odling AS od ON od.fisk_id=f.id
LEFT OUTER JOIN tank AS t ON t.id=od.tank_id;


DELIMITER ;;


CREATE PROCEDURE show_all()
BEGIN
SELECT 
	*
    FROM all_data;
END;;


CREATE PROCEDURE show_all_term()
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
END
;;


CREATE PROCEDURE search_by_word(
	word VARCHAR(50)
)
BEGIN
		SELECT * FROM all_data
		WHERE fisk LIKE CONCAT('%', word, '%') OR 
		familj LIKE CONCAT('%', word, '%') OR
        hus LIKE CONCAT('%', word, '%');
END
;;


CREATE PROCEDURE search_terminal(
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
END
;;


CREATE FUNCTION check_temp(
    `temp` VARCHAR(3),
    `min` INT,
    `max` INT
)
RETURNS CHAR(15)
DETERMINISTIC
BEGIN
	IF temp < min THEN
		RETURN "Lag temp";
	ELSEIF temp > max THEN
		RETURN "Hog temp";
	END IF;
    RETURN "";
END
;;


CREATE PROCEDURE report()
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
END;;

DELIMITER ;
