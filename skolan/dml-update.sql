USE skolan;

--
-- Update a column value
--
UPDATE larare SET lon = 30000 WHERE lon IS NULL;

SELECT akronym, avdelning, fornamn, kon, lon, kompetens
FROM larare
ORDER BY lon DESC;

