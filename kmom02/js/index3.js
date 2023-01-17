"use strict";

const fs = require("fs");
const path = "file.txt";
let data;

console.info("1) Program is starting up!");

data = getFileContentSync(path);
console.info(data);

console.info("3) End of the program!");

function getFileContentSync(filename) {
    let data;

    data = fs.readFileSync(filename, "utf-8");
    return data;
}
