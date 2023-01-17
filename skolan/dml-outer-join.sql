use skolan;
-- from guiden, example on left join
SELECT DISTINCT
    l.akronym AS Akronym,
    CONCAT(l.fornamn, " ", l.efternamn) AS Namn,
    l.avdelning AS Avdelning,
    kt.kurskod AS Kurskod
FROM larare AS l
    LEFT OUTER JOIN kurstillfalle AS kt
        ON l.akronym = kt.kursansvarig
;

-- from guiden example on right join
SELECT DISTINCT
    l.akronym AS Akronym,
    CONCAT(l.fornamn, " ", l.efternamn) AS Namn,
    l.avdelning AS Avdelning,
    kt.kurskod AS Kurskod
FROM larare AS l
    RIGHT OUTER JOIN kurstillfalle AS kt
        ON l.akronym = kt.kursansvarig
;

-- exercise to show courses that are not active
SELECT DISTINCT
	k.kod AS Kurskod,
    k.namn AS Kursnamn,
    kt.lasperiod AS Lasperiod
FROM kurs AS k
    LEFT OUTER JOIN kurstillfalle AS kt
        ON k.kod = kt.kurskod
WHERE Lasperiod IS NULL
;
