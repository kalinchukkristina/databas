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
        title: "Welcome | Show"
    };

    data.res = await exam.show();
    console.log(data.res);

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

    console.log(req.body.search_word);
    data.res = await exam.search(req.body.search_word);

    res.render("exam/search_result", data);
});


module.exports = router;
