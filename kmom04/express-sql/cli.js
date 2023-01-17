"use strict";

const bank = require("./src/bank.js");
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
    let balance;

    switch (lineP[0]) {
        case "quit":
        case "exit":
        case "q":
            exitProgram();
            break;
        case "menu":
        case "help":
            menu();
            break;
        case "move":
            if (lineP.length === 1) {
                await bank.moveMoneyAdamToEva(1.5);
                console.log(`1.5 peng has now been moved from Adam's account to Eva's account. 
                New balance is: `);
                balance = await bank.showBalance();
                console.table(balance);
                break;
            } else if (lineP.length === 2) {
                await bank.moveMoneyAdamToEva(parseInt(lineP[1]));
                console.log(`${lineP[1]} peng has been moved from Adam's account to Eva's account.
                New balance is: `);
                balance = await bank.showBalance();
                console.table(balance);
                break;
            } else {
                await bank.moveMoneyBetween(parseInt(lineP[1]), lineP[2], lineP[3]);
                console.log(`${lineP[1]} peng moved from ${lineP[2]}'s to ${lineP[3]}'s account.
                New balance is: `);
                balance = await bank.showBalance();
                console.table(balance);
                break;
            }
        case "balance":
            balance = await bank.showBalance();
            console.table(balance);
            break;
        default:
            "wrong option";
            break;
    }
    rl.prompt();
}

function menu() {
    console.log(`Available options:
    help                            shows menu,
    break or exit                   exit the program,
    move                            move 1.5 peng from Adam till Eva,
    balance                         show balance on accounts.
    `);
}

function exitProgram(code) {
    code = code || 0;
    console.info("Exiting with status code " + code);
    process.exit(code);
}
