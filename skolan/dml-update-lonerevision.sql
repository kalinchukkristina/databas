USE skolan;

SELECT
    SUM(lon) AS Lonesumma,
    SUM(kompetens) AS Kompetens
FROM larare
;

SELECT 
    SUM(lon) AS Lonesumma,
    (SUM(lon) * 0.064) AS Lonepott 
FROM larare
;

-- salary revision statements
UPDATE larare SET lon = 85000, kompetens = 7 WHERE fornamn = 'Albus';
UPDATE larare SET lon = lon + 4000 WHERE fornamn = 'Minerva';
UPDATE larare SET lon = lon + 2000, kompetens = 3 WHERE fornamn = 'Argus';
UPDATE larare SET lon = lon - 3000 WHERE fornamn = 'Gyllenroy';
UPDATE larare SET lon = lon - 3000 WHERE fornamn = 'Alastor';
UPDATE larare SET lon = (lon + (lon * 0.02)) WHERE avdelning = 'DIDD';
UPDATE larare SET lon = (lon + (lon * 0.03)) WHERE kon = 'K' AND lon < 40000;
UPDATE larare SET lon = lon + 5000, kompetens = kompetens + 1 WHERE fornamn IN ('Severus', 'Minerva', 'Hagrid');
UPDATE larare SET lon = (lon + (lon * 0.022)) WHERE fornamn NOT IN ('Albus', 'Severus', 'Minerva', 'Hagrid');

-- check the new salary
SELECT SUM(lon) AS Lonesumma FROM larare;
SELECT (((SUM(lon) - 305000)/305000) * 100) AS 'Lonesumma okning %' FROM larare;
SELECT SUM(kompetens) as Kompetens FROM larare;

SELECT akronym, avdelning, fornamn, kon, lon, kompetens
FROM larare
ORDER BY lon DESC
;