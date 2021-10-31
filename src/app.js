const dotenv = require('dotenv').config()
const express = require('express')
const cors = require('cors')
const session = require('express-session')
const passport = require('passport')
const cookieParser = require('cookie-parser')
const router = require('./routes/index.js')
const path = require('path')

const app = express()

app.use(cors())
app.use(express.json())
app.use(cookieParser())

app.use(session({secret: process.env.SESSION_SECRET}))
app.use(passport.initialize())
app.use(passport.session())

app.set("views", __dirname + '/../' + "/templates");
app.set("view engine", "ejs");
app.set("view options", { compileDebug: false, self: true, cache: true });
app.use(express.static(path.join(__dirname, "public")));

app.use('/', router)

module.exports = app