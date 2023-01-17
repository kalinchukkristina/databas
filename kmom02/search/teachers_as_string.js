const mysql = require("promise-mysql");
const config = require("./config.json");

(async function() {
    const db = await mysql.createConnection(config);
    let sql;
    let res;
    let str;

    sql = `
        SELECT
            akronym,
            fornamn AND efternamn AS Namn,
            avdelning AS avd,
            lon
        FROM larare
        ORDER BY akronym;
    `;
    res = await db.query(sql);

    str  = "+-----------+---------------------+-----------+----------+\n";
    str += "| Akronym   | Namn                | Avdelning |   Lön    |\n";
    str += "|-----------|---------------------|-----------|----------|\n";
    for (const row of res) {
        str += "| ";
        str += row.akronym.padEnd(10);
        str += "| ";
        str += (row.fornamn + " " + row.efternamn).padEnd(20);
        str += "| ";
        str += row.avdelning.padEnd(10);
        str += "| ";
        str += row.lon.toString().padStart(8);
        str += " |\n";
    }
    str += "+-----------+---------------------+-----------+----------+\n";

    console.info(str);
    db.end();
})();
