"use strict";

module.exports = {
    showCategory: showCategory,
    showProductWithCatAmount: showProductWithCatAmount,
    showProductAll: showProductAll,
    addProduct: addProduct,
    showOneProduct: showOneProduct,
    updateProduct: updateProduct,
    deleteProduct: deleteProduct,
    showLog: showLog,
    showHyllor: showHyllor,
    showInv: showInv,
    showWithFilter: showWithFilter,
    invAdd: invAdd,
    invDel: invDel,
    showCustomers: showCustomers,
    showOrders: showOrders,
    createOrder: createOrder,
    showCurrentOrder: showCurrentOrder,
    showOrderByCustomer: showOrderByCustomer,
    addOrderRad: addOrderRad,
    placeOrder: placeOrder,
    showStatus: showStatus,
    orderFiltered: orderFiltered,
    createPicklist: createPicklist,
    showPicklist: showPicklist,
    shipOrder: shipOrder
};

const mysql  = require("promise-mysql");
const config = require("../config/db/eshop.json");
let db;

(async function() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();


async function showCategory() {
    let sql = `CALL show_cat();`;

    let res;

    res = await db.query(sql);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}

async function showProductWithCatAmount() {
    let sql = `CALL show_prod();`;
    let res;

    res = await db.query(sql);
    console.log(res[0]);
    return res[0];
}

async function showProductAll() {
    let sql = `CALL show_prod_all();`;
    let res;

    res = await db.query(sql);
    console.log(res[0]);
    return res[0];
}

async function addProduct(data) {
    let sql = `CALL add_prod(?, ?, ?, ?, ?);`;
    let res;

    res = await db.query(sql, [data.p_id, data.p_namn,
        data.p_beskrivning, data.p_pris, data.p_bild]);

    return res[0];
}

async function showOneProduct(id) {
    let sql = `CALL show_one_prod(?);`;
    let res;

    res = await db.query(sql, [id]);
    console.log(res[0]);
    return res[0];
}

async function updateProduct(data) {
    let sql = `CALL update_prod(?, ?, ?, ?, ?);`;
    let res;

    res = await db.query(sql, [data.p_id, data.p_namn,
        data.p_beskrivning, data.p_pris, data.p_bild]);
    console.log(res[0]);
}

async function deleteProduct(data) {
    let sql = `CALL delete_prod(?);`;

    await db.query(sql, [data.p_id]);
}

// terminalklient

async function showLog(num) {
    let sql = `CALL show_log(?);`;
    let res;

    res = await db.query(sql, [num]);
    return res[0];
}

async function showHyllor() {
    let sql = `CALL show_hyllor();`;
    let res;

    res = await db.query(sql);
    return res[0];
}

async function showWithFilter(word) {
    let sql = `CALL show_prod_filter(?);`;
    let res;

    res = await db.query(sql, [word]);
    return res[0];
}

async function showInv() {
    let sql = `CALL show_inv();`;
    let res;

    res = await db.query(sql);
    return res[0];
}

async function invAdd(id, hylla, antal) {
    let sql = `CALL add_inv(?, ?, ?);`;
    let res;

    res = await db.query(sql, [id, hylla, antal]);
    return res[0];
}

async function invDel(id, hylla, antal) {
    let sql = `CALL del_inv(?, ?, ?);`;
    let res;

    res = await db.query(sql, [id, hylla, antal]);
    return res[0];
}

async function showCustomers() {
    let sql = `CALL show_customer();`;
    let res;

    res = await db.query(sql);
    return res[0];
}

async function showOrders() {
    let sql = `CALL show_all_orders();`;
    let res;

    res = await db.query(sql);
    return res[0];
}

async function createOrder(kund) {
    let sql = `CALL create_order(?);`;
    let res;

    res = await db.query(sql, [kund]);
    return res[0];
}

async function showCurrentOrder(id) {
    let sql = `CALL show_current_order(?);`;
    let res;

    res = await db.query(sql, [id]);
    return res[0];
}

async function showOrderByCustomer(kundID) {
    let sql = `CALL show_order_by_customer(?);`;
    let res;

    res = await db.query(sql, [kundID]);
    return res[0];
}

async function addOrderRad(data) {
    let sql = `CALL add_rad(?, ?, ?, ?);`;
    let res;

    if (data.antal) {
        res = await db.query(sql, [data.orderID, data.chosenProd, data.antal, data.price]);
        console.log(res[0]);
    }
}

async function placeOrder(data) {
    let sql = `CALL place_order(?);`;

    await db.query(sql, [data.placed]);
}

async function showStatus(data) {
    let sql = `CALL show_status(?);`;
    let res;

    res = await db.query(sql, [data]);
    return res[0];
}

async function orderFiltered(filterWord) {
    let sql = `CALL show_order_filtered(?);`;
    let res;

    res = await db.query(sql, [filterWord]);
    return res[0];
}


async function createPicklist(order) {
    let sql = `CALL get_order_rows(?);`;
    let res;

    res = await db.query(sql, [order]);

    for (const row of res[0]) {
        let product = row.produktid;
        let antal = row.antal;
        let sql2 = `CALL make_picklist(?, ?, ?);`;

        await db.query(sql2, [order, product, antal]);
    }
}

async function showPicklist(order) {
    let sql = `CALL show_picklist(?);`;
    let res;

    res = await db.query(sql, [order]);
    return res[0];
}

async function shipOrder(order) {
    let sql = `CALL ship_order(?);`;

    await db.query(sql, [order]);

    let sql2 = `CALL show_order_filtered(?);`;
    let res;

    res = await db.query(sql2, [order]);
    return res[0];
}
