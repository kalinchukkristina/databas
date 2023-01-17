USE skolan;

DROP VIEW IF EXISTS v_larare;
CREATE VIEW v_larare AS SELECT *, YEAR(CURRENT_DATE) - YEAR(fodd) AS Alder FROM larare ORDER BY Alder DESC;
SELECT avdelning, ROUND(AVG(Alder)) AS Snittalder FROM v_larare GROUP BY avdelning ORDER BY Snittalder DESC;
