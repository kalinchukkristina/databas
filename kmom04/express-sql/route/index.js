"use strict";

const express = require("express");
const router  = express.Router();

router.get("/", (req, res) => {
    res.send("Hi igen");
});

router.get("/about", (req, res) => {
    res.send("About you!!");
});

module.exports = router;
