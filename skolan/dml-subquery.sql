use skolan;

-- example from guide
SELECT
    *
FROM kurstillfalle
WHERE
    kursansvarig IN (
        SELECT
            akronym
        FROM larare
        WHERE
            avdelning = 'DIDD'
    );

-- example from guide
(
    SELECT akronym, avdelning FROM larare WHERE avdelning = 'DIDD'
)
UNION
(
    SELECT akronym, avdelning FROM larare WHERE avdelning = 'DIPT'
);

-- testing another way to get the same result
SELECT akronym, avdelning FROM larare WHERE avdelning IN ("DIDD", "DIPT");

-- exercise
SELECT
	akronym,
    fornamn,
    efternamn,
    alder
FROM v_larare
WHERE
	alder = ( SELECT MAX(Alder) FROM v_larare LIMIT 1);
    