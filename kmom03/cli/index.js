"use strict";
const Game = require("./game.js");
const game = new Game();

// Read from commandline
const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Promisify rl.question to question
const util = require("util");

rl.question[util.promisify.custom] = (arg) => {
    return new Promise((resolve) => {
        rl.question(arg, resolve);
    });
};

(function() {
    rl.on("close", exitProgram);
    rl.on("line", handleInput);

    game.init();
    console.log(
        "Lets run a game of 'Guess my number'!\n"
        + "I am guessing of a number between 1 and 100.\n"
        + "Can you find out what number I'm guessing?\n"
    );

    rl.setPrompt("Guess my number: ");
    rl.prompt();
})();

function handleInput(line) {
    let guess;

    line = line.trim();
    switch (line) {
        case "quit":
        case "exit":
            exitProgram();
            break;
        case "init":
            makeInit();
            break;
        case "cheat":
            makeCheat();
            break;
        default:
            guess = Number.parseInt(line);
            makeGuess(guess);
    }

    rl.prompt();
}

function makeGuess(guess) {
    guess = Number.parseInt(guess);

    if (game.check(guess)) {
        console.info(` Congratulations! You guessed the number I thought of.`);
        return;
    }

    console.info(` Wrong! The number is ${game.compare(guess)}.`);
}

function makeInit() {
    game.init();
    console.info(` I am know thinking of another number.`);
}

function makeCheat() {
    console.info(` I am thinking of number ${game.cheat()}`);
}

function exitProgram(code) {
    code = code || 0;

    console.info("Exiting with status code " + code);
    process.exit(code);
}
