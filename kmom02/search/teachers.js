const mysql = require("promise-mysql");
const config = require("./config.json");

(async function() {
    const db = await mysql.createConnection(config);
    let sql;
    let res;
    let data;

    sql = `
        SELECT
            akronym,
            fornamn,
            efternamn,
            avdelning
        FROM larare
        ORDER BY akronym;
    `;
    res = await db.query(sql);
    data = JSON.stringify(res, null, 4);

    console.info(data);

    db.end();
})();
