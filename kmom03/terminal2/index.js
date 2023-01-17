/**
 * A main function for the program to search for quesries in database
 *
 * @author Krystyna Kalinchuk
 *
 * @returns void
 */

"use strict";

const helpers = require("./src/helpers.js");
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});


(async function() {
    rl.on("close", exitProgram);
    rl.on("line", handleInput);

    rl.setPrompt("Enter option: ");
    rl.prompt();
})();

async function handleInput(line) {
    line = line.trim();
    let lineParts = line.split(" ");
    let result;
    let returnedComp;
    let salary;
    let returned;
    let updated;

    switch (lineParts[0]) {
        case "quit":
        case "exit":
            exitProgram();
            break;
        case "menu":
        case "help":
            menu();
            break;
        case "larare":
            result = await helpers.showTeacher();
            console.table(result);
            break;
        case "kompetens":
            returnedComp = await helpers.showCompetence();
            console.table(returnedComp);
            break;
        case "lon":
            salary = await helpers.showSalary();
            console.table(salary);
            break;
        case "sok":
            returned = await helpers.searchTeacher(lineParts[1]);
            console.table(returned);
            break;
        case "nylon":
            updated = await helpers.setNewSalary(lineParts[1], lineParts[2]);
            console.log(updated);
            break;
        default:
            "wrong option";
            break;
    }
    rl.prompt();
}

function menu() {
    console.log(`Available options:
    larare                          get information about teachers,
    kompetens                       show teachers competence,
    lon                             information about teachers' salary,
    sok                             search for a teacher,
    nylon <akronym> <lon>           update teachers salary,
    help                            shows menu,
    break or exit                   exit the program.`);
}

function exitProgram(code) {
    code = code || 0;
    console.info("Exiting with status code " + code);
    process.exit(code);
}
