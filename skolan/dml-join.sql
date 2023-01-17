USE skolan;

DROP VIEW IF EXISTS v_join_tables;
CREATE VIEW v_join_tables AS SELECT 
	l.akronym,
	l.fornamn,
    l.efternamn,
    l.lon AS "nu",
    l.kompetens "nukomp",
    p.lon AS "pre",
    p.kompetens AS "prekomp"
FROM larare AS l
    JOIN larare_pre AS p
        ON l.akronym = p.akronym
ORDER BY akronym
;


DROP VIEW IF EXISTS v_lonerevision;
CREATE VIEW v_lonerevision AS SELECT
	*,
    nu - pre AS diff,
    ROUND((nu - pre)/pre * 100, 2) AS proc,
    IF (ROUND((nu - pre)/pre * 100) < 3, "nok", "ok") AS mini,
    nukomp - prekomp AS diffkomp
FROM v_join_tables;

SELECT akronym, fornamn, efternamn, pre, nu, diff, proc, mini FROM v_lonerevision ORDER BY proc DESC;
SELECT akronym, fornamn, efternamn, prekomp, nukomp, diffkomp FROM v_lonerevision ORDER BY nukomp DESC, diffkomp DESC;