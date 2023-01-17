"use strict";

module.exports = {
    showBalance: showBalance,
    moveMoneyAdamToEva: moveMoneyAdamToEva,
    moveMoneyEvaToAdam: moveMoneyEvaToAdam,
    moveMoneyBetween: moveMoneyBetween
};

const mysql  = require("promise-mysql");
const config = require("../config/db/bank.json");
let db;

(async function() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();


async function showBalance() {
    return findAllInTable("account");
}

async function findAllInTable(table) {
    let sql = `SELECT * FROM ??;`;
    let res;

    res = await db.query(sql, [table]);
    return res;
}

async function moveMoneyEvaToAdam(amount) {
    return moveMoney("1111", "2222", amount);
}

async function moveMoneyAdamToEva(amount) {
    return moveMoney("2222", "1111", amount);
}

async function moveMoneyBetween(amount, fromAccount, toAccount) {
    if (fromAccount === "Adam" && toAccount === "Eva") {
        let accFrom = "1111";
        let accTo = "2222";

        return moveMoney(accTo, accFrom, amount);
    } else if (fromAccount === "Eva" && toAccount === "Adam") {
        let accFrom = "2222";
        let accTo = "1111";

        return moveMoney(accTo, accFrom, amount);
    }
}

async function moveMoney(toAccount, fromAccount, amount) {
    let sql = `START TRANSACTION;

    UPDATE account
    SET
        balance = balance + ?
    WHERE
        id = ?;
    
    UPDATE account
    SET
        balance = balance - ?
    WHERE
        id = ?;
    
    COMMIT;`;

    let res;

    res = await db.query(sql, [amount, toAccount, amount, fromAccount]);

    return res;
}
