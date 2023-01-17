/**
 * A main function for the program to search for quesries in database
 *
 * @author Krystyna Kalinchuk
 *
 * @returns void
 */

"use strict";

const mysql  = require("promise-mysql");
const config = require("./config.json");
const helpers = require("./helpers.js");

const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const util = require("util");

rl.question[util.promisify.custom] = (arg) => {
    return new Promise((resolve) => {
        rl.question(arg, resolve);
    });
};
const question = util.promisify(rl.question);

(async function() {
    const db = await mysql.createConnection(config);
    let str;
    let min;
    let max;

    min = await question("Enter minimum value? ");
    max = await question("Enter maximum value? ");
    str = await helpers.searchBetween(db, min, max);
    console.table(str);

    rl.close();
    db.end();
})();
