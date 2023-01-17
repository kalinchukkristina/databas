-- remove a database if it already exists
DROP DATABASE IF EXISTS skolan;

-- create a database
CREATE DATABASE IF NOT EXISTS skolan;

-- choose adatabase to use
USE skolan;

SHOW DATABASES LIKE "%skolan%";