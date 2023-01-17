"use strict";

module.exports = {
    show: show,
    report: report,
    search: search

};

const mysql  = require("promise-mysql");
const config = require("../config/db/exam.json");
let db;

(async function() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();


async function show() {
    let sql = `CALL show_all();`;
    let res;

    res = await db.query(sql);
    return res[0];
}

async function report() {
    let sql = `CALL show_exakt();`;
    let res;

    res = await db.query(sql);
    return res[0];
}

async function search(searchWord) {
    let sql = `CALL search_by_word(?);`;
    let res;

    res = await db.query(sql, [searchWord]);
    return res[0];
}
