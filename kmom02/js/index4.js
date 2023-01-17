"use strict";

const fs = require("fs");
const util = require("util");
const readFile = util.promisify(fs.readFile);

async function main() {
    const path = "file.txt";
    let data;

    console.info("1) Program is starting up!");

    data = await getFileContentPromise(path);
    console.info(data);

    console.info("3) End of the program!");
}
main();

async function getFileContentPromise(filename) {
    let data;

    data = await readFile(filename, "utf-8");
    return data;
}
