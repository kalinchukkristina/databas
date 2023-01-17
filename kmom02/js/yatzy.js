/**
 * A simple test program importing a class Dice.
 *
 */
"use strict";

let Dice = require("./dice.js");

// Prepare a dice hand to hold the dices (its an array)
let hand = [];

// Add the dices to the dice hand and roll them once
for (let i=0; i<5; i++) {
    hand[i] = new Dice();
    hand[i].roll();
}

console.info("Here is the dices you have rolled.");
console.info(hand);
console.info(hand.join());
