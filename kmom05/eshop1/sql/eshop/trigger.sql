use eshop;

DROP TRIGGER IF EXISTS log_insert_prod;
DROP TRIGGER IF EXISTS log_update_prod;
DROP TRIGGER IF EXISTS log_delete_prod;


CREATE TRIGGER log_insert_prod
AFTER INSERT
ON produkt FOR EACH ROW
    INSERT INTO log_eshop (`handelse`, `produkt`)
    VALUES ('Ny produkt lades till', NEW.produktid);



CREATE TRIGGER log_update_prod
AFTER UPDATE
ON produkt FOR EACH ROW
    INSERT INTO log_eshop (`handelse`, `produkt`)
    VALUES ('Uppdaterades detaljer om produkten', NEW.produktid);

CREATE TRIGGER log_delete_prod
BEFORE DELETE
ON produkt FOR EACH ROW
    INSERT INTO log_eshop (`handelse`, `produkt`)
    VALUES ('Produkten raderades', OLD.produktid);
