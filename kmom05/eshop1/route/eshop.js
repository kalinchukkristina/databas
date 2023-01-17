"use strict";

const express = require("express");
const router  = express.Router();
const eshop = require("../src/eshop.js");

const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false });

router.get("/index", (req, res) => {
    let data = {
        title: "Welcome | The online shop"
    };

    res.render("eshop/index", data);
});

router.get("/about", async (req, res) => {
    let data = {
        title: "Eshop | About"
    };

    res.render("eshop/about", data);
});

router.get("/category", async (req, res) => {
    let data = {
        title: "Eshop | Category"
    };

    data.res = await eshop.showCategory();

    res.render("eshop/category", data);
});

router.get("/product", async (req, res) => {
    let data = {
        title: "Eshop | Products"
    };

    data.res = await eshop.showProductWithCatAmount();

    res.render("eshop/product", data);
});

router.get("/create", async (req, res) => {
    let data = {
        title: "Eshop | Create products"
    };

    res.render("eshop/create", data);
});

router.post("/create", urlencodedParser, async (req, res) => {
    console.log(req.body);
    await eshop.addProduct(req.body);

    res.redirect("product");
});

router.get("/update/:id", async (req, res) => {
    let data = {
        title: "Eshop | Update product"
    };

    data.res = await eshop.showOneProduct(req.params.id);
    console.log(data.res);

    res.render("eshop/update", data);
});

router.post("/update", urlencodedParser, async (req, res) => {
    await eshop.updateProduct(req.body);

    res.redirect("/eshop/product");
});

router.get("/delete/:id", async (req, res) => {
    let data = {
        title: "Eshop | Delete product"
    };

    data.res = await eshop.showOneProduct(req.params.id);

    res.render("eshop/delete", data);
});

router.post("/delete", urlencodedParser, async (req, res) => {
    await eshop.deleteProduct(req.body);

    res.redirect("/eshop/product");
});

module.exports = router;
