USE eshop;

DELETE FROM produkt2kategori;
DELETE FROM produkt2lager;
DELETE FROM produkt;
DELETE FROM kategori;
DELETE FROM lager;
DELETE FROM kunder;

LOAD DATA LOCAL INFILE 'kund.csv'
INTO TABLE kunder
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(fornamn,efternamn,adress,postnummer,ort,land,telefon)
;

LOAD DATA LOCAL INFILE 'produkt.csv'
INTO TABLE produkt
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(produktid,pris,namn,bildlank,beskrivning)
;

LOAD DATA LOCAL INFILE 'kategori.csv'
INTO TABLE kategori
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

LOAD DATA LOCAL INFILE 'produkt2kategori.csv'
INTO TABLE produkt2kategori
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(produktid,kategori)
;

LOAD DATA LOCAL INFILE 'lager.csv'
INTO TABLE lager
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(hylla)
;

LOAD DATA LOCAL INFILE 'produkt2lager.csv'
INTO TABLE produkt2lager
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(produktid,antal,hylla)
;

-- SELECT * FROM kunder;
-- SELECT * FROM produkt;
-- SELECT * FROM kategori;
-- SELECT * FROM produkt2kategori;
-- SELECT * FROM lager;
-- SELECT * FROM produkt2lager;

-- visar till vilka kategorier produkterna tillhör innan uppdateringar, produkt kaffemix1 tillhör ingen kategori från början
SELECT prkat.produktid, 
	prkat.kategori, 
    pr.namn, 
    pr.beskrivning
FROM produkt2kategori AS prkat
RIGHT OUTER JOIN produkt AS pr
ON prkat.produktid = pr.produktid;

-- updaterar kaffemix så att den tillhör två kategorier
INSERT INTO produkt2kategori(produktid, kategori) VALUES ("kaffemix1", "dbwebb"), ("kaffemix1", "kaffe");

-- uppdaterar skiva1 så att den tillhör tre kategorier
INSERT INTO produkt2kategori (produktid, kategori) VALUES ("skiva1", "dbwebb");

-- visar att kaffe1 tillhör nu tre kategorier, skiva1 tre kategorier, kaffemix1 två kategorier
SELECT prkat.produktid, 
	prkat.kategori, 
    pr.namn, 
    pr.beskrivning
FROM produkt2kategori AS prkat
RIGHT OUTER JOIN produkt AS pr
ON prkat.produktid = pr.produktid;

-- krav 7 Försäkra dig om att samtliga produkter finns på lagret, i någon omfattning, fr[n b;rjan finns det tv[ produkter p[ lager]]]
SELECT * FROM produkt2lager;

-- lägger till två andra produkter på lager
INSERT INTO produkt2lager(produktid, antal, hylla) VALUES ("skiva1", 10, "C:101"), ("kaffemix1", 15, "A:101");

-- kontrollerar att alla fyra produkter finns på lager
SELECT * FROM produkt2lager;

SELECT * FROM log_eshop;