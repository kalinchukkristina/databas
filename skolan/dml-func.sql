USE skolan;

SELECT CONCAT(fornamn, " ", efternamn, " (", avdelning, ")") AS NamnAvdelning FROM larare;
SELECT CONCAT(fornamn, " ", efternamn, " (", LOWER(avdelning), ")") AS NamnAvdelning FROM larare LIMIT 3;

SELECT CURRENT_DATE AS Dagens_datum;
SELECT fornamn, fodd, CURRENT_DATE AS Dagens_datum, CURRENT_TIME AS Klockslag FROM larare;

SELECT fornamn, fodd, YEAR(CURRENT_DATE) - YEAR(fodd) AS Alder FROM larare ORDER BY Alder DESC;
SELECT fornamn, YEAR(fodd) FROM larare WHERE YEAR(fodd) BETWEEN 1940 AND 1950;
