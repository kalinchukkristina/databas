DROP TABLE IF EXISTS order_rad;
DROP TABLE IF EXISTS plocklista_rad;
DROP TABLE IF EXISTS plocklista;
DROP TABLE IF EXISTS lager;
DROP TABLE IF EXISTS kund2produkt;
DROP TABLE IF EXISTS faktura_rad;
DROP TABLE IF EXISTS faktura;
DROP TABLE IF EXISTS produkt;
DROP TABLE IF EXISTS ordrar;
DROP TABLE IF EXISTS kunder;

CREATE TABLE kunder (
    id INT AUTO_INCREMENT,
    namn VARCHAR(80),
    adress VARCHAR(120),
    telefon INT,
    email VARCHAR(40),

    PRIMARY KEY (id)
);

CREATE TABLE  produkt (
    produkt_kod INT AUTO_INCREMENT,
    produkt_namn VARCHAR(80),
    beskrivning VARCHAR(200),
    pris_per_styck DECIMAL(5, 2),
    produktkategori VARCHAR(120),

    PRIMARY KEY (produkt_kod)
);

CREATE TABLE kund2produkt(
    kund INT,
    produkt_kod INT,

    PRIMARY KEY (kund, produkt_kod),
    FOREIGN KEY (kund) REFERENCES kunder(id),
    FOREIGN KEY (produkt_kod) REFERENCES produkt(produkt_kod)
);

CREATE TABLE lager(
    lager_hylla VARCHAR(80),
    produkt_kod INT,
    antal_i_lager INT,
    produktkategori VARCHAR(120),

    PRIMARY KEY (lager_hylla),
    FOREIGN KEY (produkt_kod) REFERENCES produkt(produkt_kod)
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
    produkt_kod INT,
    antal INT,
    pris_per_styck DECIMAL(5, 2),


    PRIMARY KEY (id),
    FOREIGN KEY (order_nummer) REFERENCES ordrar(order_nummer),
    FOREIGN KEY (produkt_kod) REFERENCES produkt(produkt_kod)
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
    produkt_kod INT,
    plocklista INT,
    antal_att_plocka INT,
    plats_pa_lager VARCHAR(80),

    PRIMARY KEY (id),
    FOREIGN KEY (produkt_kod) REFERENCES produkt(produkt_kod),
    FOREIGN KEY (plats_pa_lager) REFERENCES lager(lager_hylla),
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
    produkt_id INT,
    pris_per_styck DECIMAL(5, 2),
    antal INT,
    pris_per_rad DECIMAL(6, 2),

    PRIMARY KEY (id),
    FOREIGN KEY (faktura_nummmer) REFERENCES faktura(faktura_nummer),
    FOREIGN KEY (produkt_id) REFERENCES produkt(produkt_kod)
);
