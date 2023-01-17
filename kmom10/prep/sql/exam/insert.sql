USE exam;



DELETE FROM kund2vaccin;
DELETE FROM vaccin2sjukdom;
DELETE FROM vaccin;
DELETE FROM sjukdom;
DELETE FROM kund;

LOAD DATA LOCAL INFILE 'kund.csv'
INTO TABLE kund
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

LOAD DATA LOCAL INFILE 'sjukdom.csv'
INTO TABLE sjukdom
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;


LOAD DATA LOCAL INFILE 'vaccin.csv'
INTO TABLE vaccin
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;


LOAD DATA LOCAL INFILE 'kund2vaccin.csv'
INTO TABLE kund2vaccin
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

LOAD DATA LOCAL INFILE 'vaccin2sjukdom.csv'
INTO TABLE vaccin2sjukdom
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

select * from kund2vaccin;
select * from vaccin2sjukdom;
select * from vaccin;
select * from sjukdom;
select * from kund;
