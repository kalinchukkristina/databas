DROP USER IF EXISTS 'user'@'localhost';


CREATE USER 'user'@'localhost'
IDENTIFIED BY 'pass'
;

GRANT ALL PRIVILEGES
ON *.* TO 'user'@'localhost'
WITH GRANT OPTION
;

DROP DATABASE IF EXISTS exam;

CREATE DATABASE exam;

USE exam;
