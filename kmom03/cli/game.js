"use strict";

class Game {
    constructor() {
        this.thinking = -1;
    }

    init() {
        this.thinking = Math.round(Math.random() * 100 + 1);
    }

    check(guess) {
        return guess === this.thinking;
    }

    cheat() {
        return this.thinking;
    }

    compare(guess) {
        return guess > this.thinking
            ? "lower"
            : "higher";
    }
}

module.exports = Game;
