show databases;
use bank;
show tables;

DROP PROCEDURE IF EXISTS move_money;

DELIMITER ;;

CREATE PROCEDURE move_money(
    from_account CHAR(4),
    to_account CHAR(4),
    amount NUMERIC(4, 2)
)
BEGIN
     DECLARE current_balance NUMERIC(4, 2); 
     
    START TRANSACTION;
    
    SET current_balance = (SELECT balance FROM account WHERE id = from_account);
    SELECT current_balance;

	IF current_balance - amount < 0 THEN
        ROLLBACK;
        SELECT 'Amount on the account is not enough to make transaction.' AS message;
    ELSE
        UPDATE account 
            SET
                balance = balance + amount
            WHERE
                id = to_account;

        UPDATE account 
            SET
                balance = balance - amount
            WHERE
                id = from_account;

        COMMIT;
    END IF;

    SELECT * FROM account;
END
;;

DELIMITER ;

CALL move_money('1111', '2222', 1.5);

DROP PROCEDURE IF EXISTS get_money;

DELIMITER ;;

CREATE PROCEDURE get_money(
    IN account CHAR(4),
    OUT total NUMERIC(4, 2)
)
BEGIN
    SELECT balance INTO total FROM account WHERE id = account;
END
;;

DELIMITER ;

CALL get_money('1111', @sum);
SELECT @sum;

SHOW PROCEDURE STATUS LIKE '%money';
SHOW CREATE PROCEDURE move_money;