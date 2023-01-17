"use strict";
const mysql  = require("promise-mysql");
const config = require("./../config.json");

let helpers = {
    showTeacher: async function() {
        const db = await mysql.createConnection(config);
        let sql;
        let res;

        sql = `
            SELECT
                akronym AS Akronym,
                CONCAT(fornamn, " ", efternamn) AS Namn,
                avdelning AS Avdelning,
                kon AS Kön,
                lon AS Lön, 
                kompetens AS Kompetens,
                DATE_FORMAT(fodd, '%Y-%m-%d') AS Född,
                alder AS Ålder
            FROM v_larare
            ORDER BY akronym;
        `;
        res = await db.query(sql);

        return res;
    },

    searchTeacher: async function(search) {
        const db = await mysql.createConnection(config);
        let sql;
        let res;
        let like = `%${search}%`;

        sql = `
        SELECT
            akronym AS Akronym,
            CONCAT(fornamn, " ", efternamn) AS Namn,
            avdelning AS Avdelning,
            kon AS Kön,
            lon AS Lön, 
            kompetens AS Kompetens,
            DATE_FORMAT(fodd, '%Y-%m-%d') AS Född,
            alder AS Ålder
        FROM v_larare
        WHERE
            akronym LIKE ?
            OR fornamn LIKE ?
            OR efternamn LIKE ?
            OR avdelning LIKE ?
            OR kompetens = ?
            OR lon = ?
            OR alder = ?
        ORDER BY akronym;
    `;

        res = await db.query(sql, [like, like, like, like, search, search, search]);
        return res;
    },

    showCompetence: async function() {
        const db = await mysql.createConnection(config);
        let sql;
        let res;

        sql = `
            SELECT
                akronym AS Akronym,
                CONCAT(fornamn, " ", efternamn) AS Namn,
                prekomp AS Innan,
                nukomp AS Efter,
                diffkomp AS Skillnad
            FROM v_lonerevision 
            ORDER BY nukomp DESC;
        `;
        res = await db.query(sql);

        return res;
    },

    showSalary: async function() {
        const db = await mysql.createConnection(config);
        let sql;
        let res;

        sql = `
            SELECT
                akronym AS Akronym,
                CONCAT(fornamn, " ", efternamn) AS Namn,
                pre AS Innan,
                nu AS Efter,
                diff AS Skillnad,
                proc AS SkillnadProcent,
                mini AS uppfyllerKrav
            FROM v_lonerevision 
            ORDER BY proc DESC;
        `;
        res = await db.query(sql);

        return res;
    },

    setNewSalary: async function(akr, ny) {
        const db = await mysql.createConnection(config);
        let sql;

        sql = `
            UPDATE larare
            SET lon = ?
            WHERE akronym = ?
        `;
        await db.query(sql, [ny, akr]);

        return `${akr}'s salary has been updated, now it is ${ny}.`;
    }
};

module.exports = helpers;
