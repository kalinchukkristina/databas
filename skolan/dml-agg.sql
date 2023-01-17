USE skolan;

SELECT MAX(lon) FROM larare;
SELECT MIN(lon) FROM larare;

SELECT avdelning, COUNT(akronym) AS Antal_medarbetare FROM larare GROUP BY avdelning;
SELECT avdelning, SUM(lon) AS Total_lon FROM larare GROUP BY avdelning ORDER BY Total_lon DESC;
SELECT avdelning, AVG(lon) AS Medel_lon FROM larare GROUP BY avdelning;
SELECT kon, AVG(lon) FROM larare WHERE kon = 'K';
SELECT kon, AVG(lon) FROM larare WHERE kon = 'M';

SELECT avdelning, AVG(kompetens) FROM larare GROUP BY avdelning LIMIT 1;

SELECT avdelning, kompetens, ROUND(AVG(lon)) AS Snittlon, COUNT(akronym) AS Antal FROM larare GROUP BY avdelning, kompetens ORDER BY avdelning, Snittlon;


-- HAVING Delen
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare GROUP BY avdelning HAVING Antal >= 3 ORDER BY Snittlon DESC;

SELECT avdelning,
	ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare GROUP BY avdelning ORDER BY avdelning, Snittlon DESC;

SELECT avdelning,
	kompetens,
	ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare GROUP BY avdelning, kompetens ORDER BY avdelning, kompetens DESC;

SELECT avdelning,
	kompetens,
	ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare WHERE kompetens <= 3 GROUP BY avdelning, kompetens ORDER BY avdelning, kompetens DESC;

SELECT avdelning,
	kompetens,
	ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal 
FROM larare
GROUP BY avdelning, kompetens 
HAVING Snittlon BETWEEN 30000 AND 45000 
ORDER BY Snittlon DESC;