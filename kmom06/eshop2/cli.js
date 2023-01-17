"use strict";

const eshop = require("./src/eshop.js");
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
    let logTable;
    let product;
    let hyllor;
    let inventory;
    let add;
    let remove;
    let picklista;
    let shipped;

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
        case "about":
            console.log("Jag(krka21 Krystyna Kalinchuk) har jobbat själv i grupp 19.");
            break;
        case "log":
            logTable = await eshop.showLog(parseInt(lineP[1]));
            console.table(logTable);
            break;
        case "product":
            product = await eshop.showProductAll();
            console.table(product);
            break;
        case "shelf":
            hyllor = await eshop.showHyllor();
            console.log(`There are following shelves in the storage:`);
            console.table(hyllor);
            break;
        case "inv":
            if (lineP.length === 1) {
                inventory = await eshop.showInv();
                console.table(inventory);
            } else if (lineP.length === 2) {
                inventory = await eshop.showWithFilter(lineP[1]);
                console.table(inventory);
            }
            break;
        case "invadd":
            add = await eshop.invAdd(lineP[1], lineP[2], parseInt(lineP[3]));
            console.table(add);
            break;
        case "invdel":
            remove = await eshop.invDel(lineP[1], lineP[2], parseInt(lineP[3]));
            console.table(remove);
            break;
        case "order":
            if (lineP.length === 1) {
                inventory = await eshop.showOrders();
                console.table(inventory);
            } else if (lineP.length === 2) {
                inventory = await eshop.orderFiltered(lineP[1]);
                console.table(inventory);
            }
            break;
        case "picklist":
            await eshop.createPicklist(lineP[1]);
            picklista = await eshop.showPicklist(lineP[1]);
            console.table(picklista);
            break;
        case "ship":
            shipped = await eshop.shipOrder(lineP[1]);
            console.log("The order has been shipped");
            console.table(shipped);
            break;
        default:
            "wrong option";
            break;
    }
    rl.prompt();
}

function menu() {
    console.log(`Available options:
    help                                    shows menu,
    break or exit                           exit the program,
    about                                   show info about the developer,
    log <number>                            show a specific number of rows in the log table,
    product                                 show products,
    shelf                                   show storage,
    inv                                     show products in the stotages and where they are
    invadd <productid> <shelf> <number>     add product to the storage
    invdel <productid> <shelf> <number>     remove products from the storage
    order <search>                          show all orders, or filter order by id or customer
    picklist <orderid>                      generate a picklist for the order,
    ship <orderid>                          ship the order
    `);
}

function exitProgram(code) {
    code = code || 0;
    console.info("Exiting with status code " + code);
    process.exit(code);
}
