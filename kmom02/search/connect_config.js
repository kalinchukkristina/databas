"use strict";

const mysql = require("promise-mysql");
const config = require("./config.json");

(async function() {
    let sql;
    let res;
    const db = await mysql.createConnection(config);

    sql = "SELECT 1+1 AS Sum";
    res = await db.query(sql);

    console.info(res);

    db.end();
})();
