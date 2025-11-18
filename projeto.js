const express = require('express')
const cors = require('cors')
const porta = 3000
const app = express()
app.use(cors())

const pool = require("./db.js")

// Consegue acessar os dados do body
app.use(express.json())

// Módulo crypto
const crypto = require('crypto')

app.listen(porta, () => {
  console.log(`Servidor rodando em: http://localhost:${porta}`)
})

// Rota
app.post("/FaleConosco", async (req, res) => {
  try {
    const { Nome, Email, Telefone, Assunto, Mensagem } = req.body

    // Validações de entrada
    if (Nome.length < 6) {
      return res.status(400).json({"resposta":"Insira um nome"})
    }
    if (Email.length < 6) {
      return res.status(400).json({"resposta":"Insira um email"})
    }
    if (Assunto.length < 6) {
      return res.status(400).json({"resposta":"Insira um assunto"})
    }
    if (Mensagem.length < 6) {
      return res.status(400).json({"resposta":"Insira uma mensagem"})
    }

    // Verificar se o e-mail já está cadastrado
    let sql = 'SELECT * FROM FaleConosco WHERE email = ?'
    let [resultado] = await pool.query(sql, [Email])
    
    if (resultado.length !== 0) {
      return res.status(409).json({"resposta":"E-mail já cadastrado"})
    }

    // Preparar dados para salvar
    const Data_envio = new Date() // Grava data/hora no servidor
    const Status = "Aguardando Leitura"

    const sqlInsert = `INSERT INTO FaleConosco (Nome, Email, Telefone, Assunto, Mensagem) VALUES (?, ?, ?, ?, ?)`

    const [resultado2] = await pool.query(sqlInsert, [
      Nome.trim(),
      Email.trim(),
      Telefone ? Telefone.trim() : null,
      Assunto.trim(),
      Mensagem.trim()
    ])

    if (resultado2.affectedRows === 1) {
      return res.status(201).json({ resposta: "Sucesso!" })
    } else {
      return res.status(500).json({ resposta: "Erro ao salvar a mensagem" })
    }

  } catch (error) {
    console.error(error)
    return res.status(500).json({ resposta: "Erro inesperado" })
  }
})
