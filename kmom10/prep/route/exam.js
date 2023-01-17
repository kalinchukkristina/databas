"use strict";

const express = require("express");
const router  = express.Router();
const exam = require("../src/exam.js");

const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false });

router.get("/index", (req, res) => {
    let data = {
        title: "Welcome | Exam"
    };

    res.render("exam/index", data);
});

router.get("/visa", async (req, res) => {
    let data = {
        title: "Welcome | Visa"
    };

    data.res = await exam.show();

    res.render("exam/visa", data);
});

router.get("/search", (req, res) => {
    let data = {
        title: "Welcome | Search"
    };

    res.render("exam/search", data);
});

router.post("/search/", urlencodedParser, async (req, res) => {
    let data = {
        title: "Welcome | Search result"
    };

    data.res = await exam.search(req.body.search_word);

    res.render("exam/search_result", data);
});

module.exports = router;
