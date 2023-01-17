use skolan;
DROP TABLE IF EXISTS kurstillfalle;
DROP TABLE IF EXISTS kurs;

-- ddl-larere: creates a table larare
DROP TABLE IF EXISTS larare;

CREATE TABLE larare
(
    akronym CHAR(3),
    avdelning CHAR(4),
    fornamn VARCHAR(20),
    efternamn VARCHAR(20),
    kon CHAR(1),
    lon INT,
    fodd DATE,
    kompetens INT NOT NULL DEFAULT 1,

    PRIMARY KEY (akronym)
);

-- ddl-alter: add column kompetens with default 1, implemented in create table larare

-- ddl-copy: makes a copy of table larare into table larare_pre
DROP TABLE IF EXISTS larare_pre;
CREATE TABLE larare_pre LIKE larare;

-- dml-view: creates view of a table larere
DROP VIEW IF EXISTS v_larare;
CREATE VIEW v_larare AS SELECT *, YEAR(CURRENT_DATE) - YEAR(fodd) AS Alder FROM larare ORDER BY Alder DESC;
SELECT avdelning, ROUND(AVG(Alder)) AS Snittalder FROM v_larare GROUP BY avdelning ORDER BY Snittalder DESC;

-- dml-join: creates view of joined tables(larare and larare_pre)
DROP VIEW IF EXISTS v_join_tables;
CREATE VIEW v_join_tables AS SELECT 
	l.akronym,
	l.fornamn,
    l.efternamn,
    l.lon AS "nu",
    l.kompetens "nukomp",
    p.lon AS "pre",
    p.kompetens AS "prekomp"
FROM larare AS l
    JOIN larare_pre AS p
        ON l.akronym = p.akronym
ORDER BY akronym
;

-- dml-join: creates view of report from joined tables which shows how much salaries increased in % and if the increase was above 3% or not,
-- difference between old and new saalry and difference in competence
DROP VIEW IF EXISTS v_lonerevision;
CREATE VIEW v_lonerevision AS SELECT
	*,
    nu - pre AS diff,
    ROUND((nu - pre)/pre * 100, 2) AS proc,
    IF (ROUND((nu - pre)/pre * 100) < 3, "nok", "ok") AS mini,
    nukomp - prekomp AS diffkomp
FROM v_join_tables;


CREATE TABLE kurs
(
	kod CHAR(6) NOT NULL,
    namn VARCHAR(40),
    poang FLOAT,
    niva CHAR(3),
    
    PRIMARY KEY (kod)
);

CREATE TABLE kurstillfalle
(
	id INT NOT NULL AUTO_INCREMENT,
    kurskod CHAR(6) NOT NULL,
    kursansvarig CHAR(3) NOT NULL,
    lasperiod INT NOT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (kurskod) REFERENCES kurs(kod),
    FOREIGN KEY (kursansvarig) REFERENCES larare(akronym)
);

-- create view of joined larare, kurs and kurtillfalle tables
DROP VIEW IF EXISTS v_planering;
CREATE VIEW v_planering AS SELECT *
FROM kurs AS k
    JOIN kurstillfalle AS kt
        ON k.kod = kt.kurskod
    JOIN larare AS l
        ON l.akronym = kt.kursansvarig;
