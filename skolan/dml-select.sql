USE skolan;
-- select statements
SELECT * FROM larare WHERE avdelning = "DIDD";
SELECT * FROM larare WHERE akronym LIKE 'h%';
SELECT * FROM larare WHERE fornamn LIKE '%o%';
SELECT * FROM larare WHERE lon BETWEEN 30000 AND 50000;
SELECT * FROM larare WHERE kompetens < 7 AND lon > 40000;
SELECT * FROM larare WHERE akronym IN ('sna', 'dum', 'min');
SELECT * FROM larare WHERE lon > 80000 OR kompetens = 2 AND avdelning = 'ADM';

SELECT * FROM larare;

-- statements to practise ORDER BY
SELECT fornamn, efternamn, lon FROM larare;
SELECT efternamn FROM larare ORDER BY efternamn;
SELECT efternamn FROM larare ORDER BY efternamn DESC;
SELECT fornamn, efternamn, lon FROM larare ORDER BY lon;
SELECT fornamn, efternamn, lon FROM larare ORDER BY lon DESC;
SELECT fornamn, efternamn, lon FROM larare ORDER BY lon DESC LIMIT 3;
