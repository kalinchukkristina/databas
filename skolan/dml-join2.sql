USE skolan;

SELECT *
FROM kurs AS k
    JOIN kurstillfalle AS kt
        ON k.kod = kt.kurskod;
        
SELECT *
FROM kurs AS k
    JOIN kurstillfalle AS kt
        ON k.kod = kt.kurskod
    JOIN larare AS l
        ON l.akronym = kt.kursansvarig;
        
-- create view
DROP VIEW IF EXISTS v_planering;
CREATE VIEW v_planering AS SELECT *
FROM kurs AS k
    JOIN kurstillfalle AS kt
        ON k.kod = kt.kurskod
    JOIN larare AS l
        ON l.akronym = kt.kursansvarig;
        
SELECT * FROM v_planering;
        
-- reports for joined tables
SELECT akronym AS Akronym, CONCAT(fornamn, " ", efternamn) AS Namn, COUNT(kursansvarig) AS Tillfallen FROM v_planering GROUP BY akronym ORDER BY Tillfallen DESC;

SELECT namn AS Kursnamn, CONCAT(fornamn, " ", efternamn, " (", LOWER(avdelning), ")") AS Larare, YEAR(CURRENT_DATE) - YEAR(fodd) AS Alder FROM v_planering ORDER BY Alder DESC LIMIT 6;


