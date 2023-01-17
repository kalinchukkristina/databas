
USE eshop;

DROP TABLE IF EXISTS order_rad;
DROP TABLE IF EXISTS plocklista_rad;
DROP TABLE IF EXISTS plocklista;
DROP TABLE IF EXISTS kund2produkt;
DROP TABLE IF EXISTS faktura_rad;
DROP TABLE IF EXISTS faktura;
DROP TABLE IF EXISTS ordrar;
DROP TABLE IF EXISTS produkt2kategori;
DROP TABLE IF EXISTS produkt2lager;
DROP TABLE IF EXISTS lager;
DROP TABLE IF EXISTS kunder;
DROP TABLE IF EXISTS produkt;
DROP TABLE IF EXISTS kategori;
DROP TABLE IF EXISTS log_eshop;

CREATE TABLE log_eshop (
    `tid` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `handelse` VARCHAR(120),
    `produkt` VARCHAR (80)
);

CREATE TABLE kunder (
    id INT AUTO_INCREMENT,
    fornamn VARCHAR(80),
    efternamn VARCHAR(80),
    adress VARCHAR(120),
    postnummer VARCHAR(80),
    ort VARCHAR(40),
    land VARCHAR(80),
	telefon VARCHAR(80),
    
    PRIMARY KEY (id)
);

CREATE TABLE kategori (
    namn VARCHAR(80),

    PRIMARY KEY (namn)
);

CREATE TABLE  produkt (
    produktid VARCHAR(80),
    namn VARCHAR(80),
    beskrivning VARCHAR(200),
    pris INT,
    bildlank VARCHAR(120),

    PRIMARY KEY (produktid)
);

CREATE TABLE lager(
    hylla VARCHAR(80),

    PRIMARY KEY (hylla)
);

CREATE TABLE produkt2kategori (
    produktid VARCHAR(80),
    kategori VARCHAR(80),

    PRIMARY KEY (produktid, kategori),
    FOREIGN KEY (produktid) REFERENCES produkt(produktid),
    FOREIGN KEY (kategori) REFERENCES kategori(namn)
);

CREATE TABLE kund2produkt(
    kund INT,
    produktid VARCHAR(80),

    PRIMARY KEY (kund, produktid),
    FOREIGN KEY (kund) REFERENCES kunder(id),
    FOREIGN KEY (produktid) REFERENCES produkt(produktid)
);


CREATE TABLE produkt2lager(
    produktid VARCHAR(80),
    antal INT,
    hylla VARCHAR(80),

    PRIMARY KEY (produktid, hylla),
    FOREIGN KEY (produktid) REFERENCES produkt(produktid),
    FOREIGN KEY (hylla) REFERENCES lager(hylla)
);


CREATE TABLE ordrar(
    order_nummer INT AUTO_INCREMENT,
    kund INT,
    skapades DATETIME DEFAULT CURRENT_TIMESTAMP,
    skickades DATETIME DEFAULT NULL,

    PRIMARY KEY (order_nummer),
    FOREIGN KEY (kund) REFERENCES kunder(id)
);

CREATE TABLE order_rad(
    id INT,
    order_nummer INT,
    produktid VARCHAR(80),
    antal INT,
    pris DECIMAL(5, 2),

    PRIMARY KEY (id),
    FOREIGN KEY (order_nummer) REFERENCES ordrar(order_nummer),
    FOREIGN KEY (produktid) REFERENCES produkt(produktid)
);

CREATE TABLE plocklista(
    plocklista_nummer INT AUTO_INCREMENT,
    kund INT,
    skapades DATETIME DEFAULT CURRENT_TIMESTAMP,
    exekverades DATETIME DEFAULT NULL,

    PRIMARY KEY (plocklista_nummer),
    FOREIGN KEY (kund) REFERENCES kunder(id)
);

CREATE TABLE plocklista_rad(
    id INT,
    produktid VARCHAR(80),
    plocklista INT,
    antal_att_plocka INT,
    plats_pa_lager VARCHAR(80),

    PRIMARY KEY (id),
    FOREIGN KEY (produktid) REFERENCES produkt(produktid),
    FOREIGN KEY (plats_pa_lager) REFERENCES lager(hylla),
    FOREIGN KEY (plocklista) REFERENCES plocklista(plocklista_nummer)
);


CREATE TABLE faktura(
    faktura_nummer INT AUTO_INCREMENT,
    kund_id INT,
    order_nummer INT,
    totala_summan DECIMAL(6, 2),
    skapades DATETIME DEFAULT CURRENT_TIMESTAMP,
    skickades DATETIME DEFAULT NULL,

    PRIMARY KEY (faktura_nummer),
    FOREIGN KEY (order_nummer) REFERENCES ordrar(order_nummer),
    FOREIGN KEY (kund_id) REFERENCES kunder(id)
);

CREATE TABLE faktura_rad(
    id INT,
    faktura_nummmer INT,
    produkt_id VARCHAR(80),
    pris DECIMAL(5, 2),
    antal INT,
    pris_per_rad DECIMAL(6, 2),

    PRIMARY KEY (id),
    FOREIGN KEY (faktura_nummmer) REFERENCES faktura(faktura_nummer),
    FOREIGN KEY (produkt_id) REFERENCES produkt(produktid)
);
