/**
 * A main function for the program to print about table 'skolan'
 *
 * @author Krystyna Kalinchuk
 *
 * @returns void
 */

const mysql = require("promise-mysql");
const config = require("./config.json");
const helpers = require("./helpers.js");

(async function() {
    const db = await mysql.createConnection(config);
    let result;

    result =  await helpers.showTeachers(db);
    console.table(result);

    db.end();
})();
