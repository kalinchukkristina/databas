"use strict";

let helpers = {
    searchTeacher: async function(db, search) {
        let sql;
        let res;
        let like = `%${search}%`;

        console.info(`Searching for: ${search}`);

        sql = `
            SELECT
                akronym AS Akronym,
                CONCAT(fornamn, " ", efternamn) AS Namn,
                avdelning AS Avd,
                lon AS Lön, 
                kompetens AS Komp,
                DATE_FORMAT(fodd, '%Y-%m-%d') AS Född
            FROM larare
            WHERE
                akronym LIKE ?
                OR fornamn LIKE ?
                OR efternamn LIKE ?
                OR avdelning LIKE ?
                OR kompetens = ?
                OR lon = ?
            ORDER BY akronym;
        `;
        res = await db.query(sql, [like, like, like, like, search, search]);
        return res;
    },

    searchBetween: async function(db, min, max) {
        let sql;
        let res;

        console.info(`Searching for values between: ${min} - ${max}`);

        sql = `
            SELECT
                akronym AS Akronym,
                CONCAT(fornamn, " ", efternamn) AS Namn,
                avdelning AS Avd,
                lon AS Lön, 
                kompetens AS Komp,
                DATE_FORMAT(fodd, '%Y-%m-%d') AS Född
            FROM larare
            WHERE
                lon BETWEEN ? AND ? OR kompetens BETWEEN ? AND ?
            ORDER BY akronym;
        `;
        res = await db.query(sql, [min, max, min, max]);
        return res;
    },

    showTeachers: async function(db) {
        let sql;
        let res;

        sql = `
            SELECT
                akronym AS Akronym,
                CONCAT(fornamn, " ", efternamn) AS Namn,
                avdelning AS Avd,
                lon AS Lön, 
                kompetens AS Komp,
                DATE_FORMAT(fodd, '%Y-%m-%d') AS Född
            FROM larare
            ORDER BY akronym;
        `;
        res = await db.query(sql);
        return res;
    }
};

module.exports = helpers;
