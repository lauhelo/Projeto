// Arquivo de conexão com o banco de dados
const mysql = require('mysql2/promise')

// Pool de conexão
const pool = mysql.createPool({
    host: "localhost",        // Endereço do servidor MySQL
    user: "root",             // Usuário do MySQL
    password: "",             // Senha do MySQL (coloque se tiver)
    port: 3306,               // Porta padrão do MySQL
    database: "projeto",  // Nome do banco de dados (troque para o seu)
    waitForConnections: true, // Aguarda se não tiver conexão disponível
    connectionLimit: 10,      // Número máximo de conexões simultâneas
    queueLimit: 0             // Requisições ilimitadas na fila
})

module.exports = pool
