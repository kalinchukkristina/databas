/**
 * A module for game Guess the number I'm thinking of.
 */
"use strict";

class Dice {
    constructor() {
        this.dice = null;
    }

    roll(faces=6) {
        this.dice = Math.floor(Math.random() * faces + 1);
        return this.dice;
    }

    lastRoll() {
        return this.dice;
    }

    toString() {
        return this.dice;
    }
}

module.exports = Dice;
