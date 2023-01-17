"use strict";

function stringRange(a, b, sep = ", ") {
    let res = "";
    let i = a;

    while (i < b) {
        res += i + sep;
        i++;
    }

    res = res.substring(0, res.length - sep.length);
    return res;
}

module.exports = {
    "stringRange": stringRange
};
