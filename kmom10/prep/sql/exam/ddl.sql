USE exam;

DROP TABLE IF EXISTS kund2vaccin;
DROP TABLE IF EXISTS vaccin2sjukdom;
DROP TABLE IF EXISTS vaccin;
DROP TABLE IF EXISTS sjukdom;
DROP TABLE IF EXISTS kund;

DROP PROCEDURE IF EXISTS show_all;
DROP VIEW IF EXISTS vaccin_sjukdom;
DROP PROCEDURE IF EXISTS search_by_word;
DROP PROCEDURE IF EXISTS show_exakt;


CREATE TABLE kund (
    `id` INT,
    `fornamn` VARCHAR(20),
    `efternamn` VARCHAR(20),
    `ort` VARCHAR(20),
    `medlem` DATE,

    PRIMARY KEY (id)
);


CREATE TABLE sjukdom (
    `id` INT,
    `namn` VARCHAR(50),
    `beskrivning` VARCHAR(100),

    PRIMARY KEY (id)
);

CREATE TABLE vaccin (
    `id` VARCHAR(2),
    `namn` VARCHAR(30),
    `typ` VARCHAR(20),

    PRIMARY KEY (id)
);

CREATE TABLE vaccin2sjukdom (
    `id` INT,
    `vaccin_id` VARCHAR(2),
    `sjukdom_id` INT,
    `sannolikhet` INT,

    PRIMARY KEY (id),
    FOREIGN KEY (vaccin_id) REFERENCES vaccin(id),
    FOREIGN KEY (sjukdom_id) REFERENCES sjukdom(id)
);


CREATE TABLE kund2vaccin (
    `id` INT,
    `kund_id` INT,
    `vaccin_id` VARCHAR(2),
    `datum` DATE,

    PRIMARY KEY (id),
    FOREIGN KEY (kund_id) REFERENCES kund(id),
    FOREIGN KEY (vaccin_id) REFERENCES vaccin(id)
);



CREATE VIEW vaccin_sjukdom AS
SELECT 
	v.namn AS vaccin,
    v.typ,
    sj.namn AS sjukdom,
    sj.beskrivning,
    v2s.sannolikhet
    FROM (vaccin2sjukdom AS v2s JOIN vaccin AS v ON v.id=v2s.vaccin_id)
	RIGHT OUTER JOIN sjukdom AS sj ON sj.id=v2s.sjukdom_id;




DELIMITER ;;


CREATE PROCEDURE show_all()
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

END;;

CREATE PROCEDURE search_by_word(
	word VARCHAR(30)
)
BEGIN

	SELECT * FROM vaccin_sjukdom
    WHERE vaccin LIKE CONCAT('%', word, '%') OR 
        typ LIKE CONCAT('%', word, '%') OR
        sjukdom LIKE CONCAT('%', word, '%') OR
        beskrivning LIKE CONCAT('%', word, '%');

END;;

CREATE PROCEDURE show_exakt()
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

END;;


DELIMITER ;