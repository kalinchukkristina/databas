"use strict";

const exam = require("./src/exam.js");
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
    let lineP = line.split(" ");
    let res;
    let rapport;
    let search;

    switch (lineP[0]) {
        case "quit":
        case "exit":
        case "q":
            exitProgram();
            break;
        case "menu":
            menu();
            break;
        case "visa":
            res = await exam.show();
            console.table(res);
            break;
        case "report":
            rapport = await exam.report();
            console.table(rapport);
            break;
        case "search":
            search = await exam.search(lineP[1]);
            console.table(search);
            break;
        default:
            "wrong option";
            break;
    }
    rl.prompt();
}

function menu() {
    console.log(`Available options:
    menu                                    shows menu,
    break or exit                           exit the program,
    visa                                    shows all data,
    search <str>                            searches by a word,
    report                                  shows a report
    `);
}

function exitProgram(code) {
    code = code || 0;
    console.info("Exiting with status code " + code);
    process.exit(code);
}
