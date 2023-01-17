DROP PROCEDURE IF EXISTS move_money;

DELIMITER ;;

CREATE PROCEDURE move_money(
    from_account CHAR(4),
    to_account CHAR(4),
    amount NUMERIC(4, 2)
)
MAIN:BEGIN
    DECLARE current_balance NUMERIC(4, 2);

    START TRANSACTION;

    SELECT balance INTO current_balance FROM account WHERE id = from_account;
    SELECT current_balance;

    IF current_balance - amount < 0 THEN
        ROLLBACK;
        SELECT 'Amount on the account is not enough to make transaction.' AS message;
        LEAVE MAIN;
    END IF;

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
    SELECT * FROM account;
END
;;

DELIMITER ;

DROP TABLE IF EXISTS account_log;
CREATE TABLE account_log
(
    `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
    `when` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `what` VARCHAR(20),
    `account` CHAR(4),
    `balance` DECIMAL(4, 2),
    `amount` DECIMAL(4, 2)
);


DROP TRIGGER IF EXISTS log_balance_update;

CREATE TRIGGER log_balance_update
AFTER UPDATE
ON account FOR EACH ROW
    INSERT INTO account_log (`what`, `account`, `balance`, `amount`)
        VALUES ('trigger', NEW.id, NEW.balance, NEW.balance - OLD.balance);
      
      
SHOW TRIGGERS;
SHOW TRIGGERS LIKE 'account';
SHOW TRIGGERS FROM dbwebb;

CALL move_money('1111', '2222', 1.5);