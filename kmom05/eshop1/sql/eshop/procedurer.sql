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
        l.antal
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

DELIMITER ;
