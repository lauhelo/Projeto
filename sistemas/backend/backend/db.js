const mysql = require("mysql2/promise");

const pool = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "",
    database: "banco_projeto",
});

module.exports = pool;
