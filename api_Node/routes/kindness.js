"use strict";
exports.__esModule = true;
exports.kindnessrouter = void 0;
var express = require("express");
var userscontroller_1 = require("../controllers/userscontroller");
var app = express();
exports.kindnessrouter = app;
app.get("/globalRank", function (req, res) {
    userscontroller_1.UserController.getInstance().globalRanking()
        .then(function (value) {
        res.json(value[0]);
    })["catch"](function (err) {
        console.log(err);
        res.json(err);
    });
});
app.get("/post", function (req, res) {
    var time = req.query["time"].toString();
    console.log(time);
    var email = req.query["email"].toString();
    userscontroller_1.UserController.getInstance().newPost(time, email)
        .then(function (value) {
        res.json(value[0]);
    })["catch"](function (err) {
        console.log(err);
        res.json(err);
    });
});
app.get("/habit", function (req, res) {
    var longitude = Number(req.query["lon"]);
    var latitude = Number(req.query["lat"]);
    var email = req.query["email"].toString();
    var title = req.query["title"].toString();
    var fecha = req.query["fecha"].toString();
    userscontroller_1.UserController.getInstance().newhabit(longitude, latitude, email, title, fecha)
        .then(function (value) {
        res.json(value[0]);
    })["catch"](function (err) {
        console.log(err);
        res.json(err);
    });
});
