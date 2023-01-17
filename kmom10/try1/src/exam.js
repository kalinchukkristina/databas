"use strict";

module.exports = {
    show: show,
    visaTerminal: visaTerminal,
    report: report,
    search: search,
    searchTerminal: searchTerminal

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

async function visaTerminal() {
    let sql = `CALL show_all_term();`;
    let res;

    res = await db.query(sql);
    return res[0];
}

async function report() {
    let sql = `CALL report();`;
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

async function searchTerminal(searchWord) {
    let sql = `CALL search_terminal(?);`;
    let res;

    res = await db.query(sql, [searchWord]);
    return res[0];
}
