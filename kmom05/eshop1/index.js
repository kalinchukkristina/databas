"use strict";

const express = require("express");
const port = 1337;
const app = express();
const middleware = require("./middleware/index.js");
const routeShop = require("./route/eshop.js");



app.use(middleware.logIncomingToConsole);
app.use("/eshop", routeShop);
app.use(express.urlencoded({extended: true}));
app.listen(port, logStartUpDetailsToConsole);

app.use((req, res, next) => {
    next();
});

app.use(express.static("public"));
app.set("view engine", "ejs");

function logStartUpDetailsToConsole() {
    let routes = [];

    app._router.stack.forEach((middleware) => {
        if (middleware.route) {
            // Routes registered directly on the app
            routes.push(middleware.route);
        } else if (middleware.name === "router") {
            // Routes added as router middleware
            middleware.handle.stack.forEach((handler) => {
                let route;

                route = handler.route;
                route && routes.push(route);
            });
        }
    });

    console.info(`Server is listening on port ${port}.`);
    console.info("Available routes are:");
    console.info(routes);
}
