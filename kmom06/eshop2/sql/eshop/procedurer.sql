USE eshop;

DROP PROCEDURE IF EXISTS show_cat;
DROP PROCEDURE IF EXISTS show_prod;
DROP PROCEDURE IF EXISTS show_prod_all;
DROP PROCEDURE IF EXISTS add_prod;
DROP PROCEDURE IF EXISTS show_one_prod;
DROP PROCEDURE IF EXISTS update_prod;
DROP PROCEDURE IF EXISTS delete_prod;
DROP PROCEDURE IF EXISTS show_log;
DROP PROCEDURE IF EXISTS show_hyllor;
DROP PROCEDURE IF EXISTS show_inv;
DROP PROCEDURE IF EXISTS show_prod_filter;
DROP PROCEDURE IF EXISTS add_inv;
DROP PROCEDURE IF EXISTS del_inv;
DROP PROCEDURE IF EXISTS show_customer;
DROP FUNCTION IF EXISTS order_status;
DROP PROCEDURE IF EXISTS show_all_orders;
DROP PROCEDURE IF EXISTS create_order;
DROP PROCEDURE IF EXISTS show_current_order;
DROP PROCEDURE IF EXISTS show_order_by_customer;
DROP PROCEDURE IF EXISTS add_rad;
DROP PROCEDURE IF EXISTS place_order;
DROP PROCEDURE IF EXISTS show_order_filtered;
DROP PROCEDURE IF EXISTS get_order_rows;
DROP PROCEDURE IF EXISTS make_picklist;
DROP PROCEDURE IF EXISTS show_picklist;
DROP PROCEDURE IF EXISTS ship_order;

--webb klient
DELIMITER ;;

-- lagrade procedur att visa kategorier
CREATE PROCEDURE show_cat (
)
BEGIN
SELECT * FROM kategori;
END
;;


-- shows products krav7 webb
CREATE PROCEDURE show_prod (
)
BEGIN
    SELECT 
        p.produktid, 
        p.namn, 
        p.beskrivning, 
        p.pris,
        GROUP_CONCAT(kat.kategori) AS "kategori",
        l.antal
    FROM produkt AS p
    LEFT OUTER JOIN produkt2kategori AS kat
    ON p.produktid=kat.produktid
    LEFT OUTER JOIN produkt2lager AS l
    ON p.produktid=l.produktid
    GROUP BY p.produktid
    ;
END
;;


-- add one product krav8 webb
CREATE PROCEDURE add_prod (
	p_id VARCHAR(80),
    p_name VARCHAR(80),
    p_beskrivning VARCHAR(200),
    p_pris INT,
    p_bild VARCHAR(120)
)
BEGIN
    INSERT INTO produkt VALUES(p_id, p_name, p_beskrivning, p_pris, p_bild);
END
;;


CREATE PROCEDURE show_one_prod (
	id VARCHAR(80)
)
BEGIN
SELECT * FROM produkt WHERE produktid=id;
END
;;

--update one product krav8 webb
CREATE PROCEDURE update_prod (
	p_id VARCHAR(80),
    p_name VARCHAR(80),
    p_beskrivning VARCHAR(200),
    p_pris DECIMAL(5, 2),
    p_bild VARCHAR(120)
)
BEGIN
	UPDATE produkt SET namn=p_name, beskrivning=p_beskrivning, pris=p_pris, bildlank=p_bild 
	WHERE produktid=p_id;
END
;;

-- deletes product krav8 webb
CREATE PROCEDURE delete_prod (
	p_id VARCHAR(80)
)
BEGIN
    DELETE FROM produkt2lager WHERE produktid=p_id;
	DELETE FROM produkt2kategori WHERE produktid=p_id;
    DELETE FROM produkt WHERE produktid=p_id;
END
;;

-- TERMINALKLIENT
-- get rows from the log table krav 5
CREATE PROCEDURE show_log (
	num INT
)
BEGIN
SELECT * FROM log_eshop ORDER BY tid DESC LIMIT num;
END
;;

--show products krav 6 kommand product
CREATE PROCEDURE show_prod_all (
)
BEGIN
SELECT * FROM produkt;
END
;;


--show shelves krav 7
CREATE PROCEDURE show_hyllor (
)
BEGIN
SELECT * FROM lager;
END
;;

--krav 8 show inventory
CREATE PROCEDURE show_inv (
)
BEGIN
    SELECT 
        p.produktid,
        p.namn,
        l.hylla,
        l.antal,
        p.pris
    FROM produkt AS p
    LEFT OUTER JOIN produkt2lager AS l
    ON p.produktid=l.produktid
    GROUP BY p.produktid
    ;
END
;;

-- shows with filter krav 9
CREATE PROCEDURE show_prod_filter (
	filter_word VARCHAR(80)
)
BEGIN
	SELECT 
        p.produktid, 
        p.namn, 
        l.hylla,
        l.antal
    FROM produkt AS p 
    JOIN produkt2lager AS l
    ON p.produktid=l.produktid
    WHERE p.produktid LIKE CONCAT('%', filter_word, '%') OR p.namn LIKE CONCAT('%', filter_word, '%') OR l.hylla LIKE CONCAT('%', filter_word, '%')
    ORDER BY p.produktid;
END
;;


-- updates amount of product in the warehouse krav 10
CREATE PROCEDURE add_inv (
	l_prod_id VARCHAR(80),
    l_hylla VARCHAR(80),
    l_antal INT
)
BEGIN
	DECLARE current_antal INT;
    DECLARE current_hylla VARCHAR(80);
	DECLARE current_id VARCHAR(80);
    DECLARE new_antal INT;
    
    IF l_prod_id NOT IN (SELECT produktid FROM produkt2lager) THEN
		INSERT INTO produkt2lager(produktid, antal, hylla) VALUES (l_prod_id, l_antal, l_hylla);
	ELSE
		SET current_id = (SELECT produktid from produkt2lager WHERE produktid=l_prod_id);
		SET current_antal = (SELECT antal from produkt2lager WHERE produktid=l_prod_id);
		SET current_hylla = (SELECT hylla from produkt2lager WHERE produktid=l_prod_id);
        
        IF current_antal IS NULL THEN
			SET current_antal=0;
		END IF;
        
        SET new_antal = current_antal + l_antal;
        IF current_hylla=l_hylla THEN 
			UPDATE produkt2lager SET antal = new_antal WHERE produktid=l_prod_id;
		ELSE 
			UPDATE produkt2lager SET antal = new_antal, hylla=l_hylla WHERE produktid=l_prod_id;
		END IF;
	END IF;
    SELECT * FROM produkt2lager;
END
;;


--delete amount of produvts from inventory krav11
CREATE PROCEDURE del_inv (
	l_prod_id VARCHAR(80),
    l_hylla VARCHAR(80),
    l_antal INT
)
BEGIN
	DECLARE current_antal INT;
	DECLARE current_id VARCHAR(80);
    DECLARE new_antal INT;
    
    SET current_antal = (SELECT antal from produkt2lager WHERE produktid=l_prod_id);
    SET current_id = (SELECT produktid from produkt2lager WHERE produktid=l_prod_id);

    IF current_antal IS NULL THEN
		SET current_antal=0;
	END IF;
    SET new_antal = current_antal - l_antal;
    
	UPDATE produkt2lager SET antal = new_antal WHERE produktid=l_prod_id AND hylla=l_hylla;
    SELECT * FROM produkt2lager;
END
;;

CREATE PROCEDURE show_customer (
)
BEGIN
	SELECT id,
    CONCAT(fornamn, " ", efternamn) AS namn,
    adress,
    telefon
    FROM kunder;
END
;;

CREATE FUNCTION order_status(
	a_skapades TIMESTAMP,
    a_uppdaterades TIMESTAMP,
    a_bestalld TIMESTAMP,
    a_skickad TIMESTAMP,
    a_raderades TIMESTAMP
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    IF a_raderades IS NOT NULL THEN 
		RETURN "Deleted";
	ELSEIF a_skickad IS NOT NULL THEN 
		RETURN "Sent";
	ELSEIF a_bestalld IS NOT NULL THEN 
		RETURN "Ordered";
	ELSEIF a_uppdaterades IS NOT NULL THEN 
		RETURN "Updated";
	END IF;
    RETURN "Created";
END
;;

CREATE PROCEDURE show_all_orders (
)
BEGIN
    SELECT
	order_nummer,
	kund, 
    rader, 
    DATE_FORMAT(skapades, '%Y-%m-%d') as added,
    order_status(skapades, uppdaterades, bestalld, skickad, raderades) AS "status"
FROM ordrar;
END
;;

CREATE PROCEDURE create_order (
	a_kund INT
)
BEGIN
	INSERT INTO ordrar (kund, rader, antal_prod) VALUES (a_kund, 0, 0);
END
;;

CREATE PROCEDURE show_current_order (
	o_id INT
)
BEGIN
    SELECT 
    orr.id,
    orr.order_nummer,
    prod.namn,
    orr.antal,
    orr.pris 
    FROM order_rad AS orr
    JOIN produkt AS prod
    ON orr.produktid = prod.produktid
    WHERE order_nummer = o_id;
    SELECT order_status(skapades, uppdaterades, bestalld, skickad, raderades) AS "status" FROM ordrar WHERE order_nummer = o_id;
END
;;

CREATE PROCEDURE show_order_by_customer (
	o_kund INT
)
BEGIN
    SELECT
	order_nummer,
	kund, 
    rader, 
    DATE_FORMAT(skapades, '%Y-%m-%d') as added,
    order_status(skapades, uppdaterades, bestalld, skickad, raderades) AS "status" FROM ordrar WHERE kund = o_kund;
END
;;

CREATE PROCEDURE add_rad (
	order_id INT,
    chosen_prod VARCHAR(20),
    chosen_antal INT,
    prod_price INT
)
BEGIN
	DECLARE current_antal INT;
    DECLARE new_antal INT;
    DECLARE num_of_rows INT;
    DECLARE new_rows INT;
    DECLARE total_antal_row_before INT;
    DECLARE total_antal_row_after INT;
    SET total_antal_row_before = (SELECT antal_prod from ordrar WHERE order_nummer=order_id);
    SET total_antal_row_after = total_antal_row_before + chosen_antal;
    SET num_of_rows = (SELECT rader from ordrar WHERE order_nummer=order_id);
    SET new_rows = num_of_rows + 1;
    SET current_antal = (SELECT antal from produkt2lager WHERE produktid=chosen_prod);
    SET new_antal = current_antal - chosen_antal;
    INSERT INTO order_rad (order_nummer, produktid, antal, pris) VALUES (order_id, chosen_prod, chosen_antal, chosen_antal*prod_price);
    UPDATE produkt2lager SET antal=new_antal WHERE produktid=chosen_prod;
    UPDATE ordrar SET uppdaterades = NOW(), rader=new_rows, antal_prod=total_antal_row_after WHERE order_nummer=order_id;
END
;;

CREATE PROCEDURE place_order (
	o_id INT
)
BEGIN
    UPDATE ordrar SET bestalld = NOW() WHERE order_nummer=o_id;
END
;;

CREATE PROCEDURE show_status (
	o_id INT
)
BEGIN
    SELECT
    order_status(skapades, uppdaterades, bestalld, skickad, raderades) AS "status" FROM ordrar WHERE order_nummer=o_id;
END
;;

CREATE PROCEDURE show_order_filtered (
	filter_word INT
)
BEGIN
    SELECT
	order_nummer,
	kund, 
    rader, 
    DATE_FORMAT(skapades, '%Y-%m-%d') as added,
    order_status(skapades, uppdaterades, bestalld, skickad, raderades) AS "status"
	FROM ordrar WHERE order_nummer=filter_word OR kund=filter_word;
END
;;

CREATE PROCEDURE get_order_rows (
	o_id INT
)
BEGIN
	select * from order_rad WHERE order_nummer=o_id;   
END
;;

CREATE PROCEDURE make_picklist (
	or_id INT,
    prod VARCHAR(80),
    ant INT
)
BEGIN
    DECLARE plats VARCHAR(80);
    SET plats = (SELECT hylla from produkt2lager WHERE produktid=prod);
	IF NOT EXISTS (SELECT produktid from plocklista_rad WHERE produktid=prod) THEN
		INSERT INTO plocklista_rad (produktid, order_id, antal_att_plocka, plats_pa_lager) VALUES (prod, or_id, ant, plats);
	END IF;
END
;;

CREATE PROCEDURE show_picklist (
	o_id INT
)
BEGIN
	SELECT 
    produktid, 
    order_id, 
    antal_att_plocka, 
    plats_pa_lager 
    FROM plocklista_rad WHERE order_id=o_id;
END
;;

CREATE PROCEDURE ship_order (
	o_id INT
)
BEGIN
	UPDATE ordrar SET skickad = NOW() WHERE order_nummer=o_id;  
END
;;

DELIMITER ;
