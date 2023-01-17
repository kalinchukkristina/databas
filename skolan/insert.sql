USE skolan;

DELETE FROM kurstillfalle;
DELETE FROM kurs;
DELETE FROM larare;

-- insert-larare: populates table larare with the new contents
INSERT INTO larare 
	(akronym, avdelning, fornamn, efternamn, kon, lon, fodd)
VALUES
    ('hag', 'ADM', 'Hagrid', 'Rubeus', 'M', 25000, '1956-05-06'),
    ('fil', 'ADM', 'Argus', 'Filch', 'M', 25000, '1946-04-06'),
    ('hoc', 'DIDD', 'Madam', 'Hooch', 'K', 35000, '1948-04-08'),
    ('sna', 'DIPT', 'Severus', 'Snape', 'M', 40000, '1951-05-01'),
	('dum', 'ADM', 'Albus', 'Dumbledore', 'M', 80000, '1941-04-01'),
	('min', 'DIDD', 'Minerva', 'McGonagall', 'K', 40000, '1955-05-05')
;

INSERT INTO larare
    (akronym, avdelning, fornamn, efternamn, kon, fodd)
VALUES
    ('gyl', 'DIPT', 'Gyllenroy', 'Lockman', 'M', '1952-05-02'),
    ('ala', 'DIPT', 'Alastor', 'Moody', 'M', '1943-04-03')
;

-- dml-update:sets starts salary for teacher (before revision)
UPDATE larare SET lon = 30000 WHERE lon IS NULL;

-- ddl-copy: copies info about teachers into larare_pre
INSERT INTO larare_pre SELECT * FROM larare;

-- insert-csv: inserts data from exel files
LOAD DATA LOCAL INFILE 'kurs.csv'
INTO TABLE kurs
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

LOAD DATA LOCAL INFILE 'kurstillfalle.csv'
INTO TABLE kurstillfalle
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(kurskod, kursansvarig, lasperiod)
;
