const express = require('express');
const cors = require('cors');
const crypto = require('crypto');
const pool = require('./db');

const app = express();
app.use(cors());
app.use(express.json());


app.post('/cadastro', async (req, res) => {
    try {
        const { nome, email, senha, endereco, cpf, telefone } = req.body;

        if (!nome || !email || !senha || !endereco || !cpf || !telefone) {
            return res.status(400).json({ erro: 'Preencha todos os campos.' });
        }

        const [existe] = await pool.query('SELECT * FROM usuarios WHERE email = ?', [email]);

        if (existe.length > 0) {
            return res.status(409).json({ erro: 'E-mail já cadastrado!' });
        }

        const hash = crypto.createHash('sha256').update(senha).digest('base64');

        const sql = `
            INSERT INTO usuarios (nome, email, senha, endereco, cpf, telefone)
            VALUES (?, ?, ?, ?, ?, ?)
        `;

        const [resultado] = await pool.query(sql, [nome, email, hash, endereco, cpf, telefone]);

        if (resultado.affectedRows === 1) {
            return res.status(201).json({ mensagem: 'Cadastro realizado com sucesso!' });
        } else {
            return res.status(500).json({ erro: 'Erro ao salvar os dados.' });
        }
    } catch (error) {
        console.error(error);
        return res.status(500).json({ erro: 'Erro no servidor.' });
    }
});


app.post('/login', async (req, res) => {
    try {
        const { email, senha } = req.body;

        if (!email || !senha) {
            return res.status(400).json({ erro: 'Preencha todos os campos.' });
        }

        const [usuario] = await pool.query('SELECT * FROM usuarios WHERE email = ?', [email]);

        if (usuario.length === 0) {
            return res.status(400).json({ erro: 'E-mail ou senha incorretos.' });
        }

        const hashSenha = crypto.createHash('sha256').update(senha).digest('base64');

        if (hashSenha !== usuario[0].senha) {
            return res.status(400).json({ erro: 'E-mail ou senha incorretos.' });
        }

        return res.json({ mensagem: 'Login realizado com sucesso!' });

    } catch (error) {
        console.error(error);
        return res.status(500).json({ erro: 'Erro no servidor.' });
    }
});


app.post("/FaleConosco", async (req, res) => {
    try {
        const { Nome, Email, Telefone, Assunto, Mensagem } = req.body;

        if (Nome.length < 3) return res.status(400).json({ resposta: "Insira um nome válido." });
        if (Email.length < 6) return res.status(400).json({ resposta: "Insira um e-mail válido." });
        if (Assunto.length < 3) return res.status(400).json({ resposta: "Insira um assunto." });
        if (Mensagem.length < 6) return res.status(400).json({ resposta: "Insira uma mensagem." });

        const [existe] = await pool.query("SELECT * FROM contato WHERE email = ?", [Email]);

        if (existe.length > 0) {
            return res.status(409).json({ resposta: "E-mail já cadastrado" });
        }

        const Data_envio = new Date();
        const Status = "Aguardando Leitura";

        const sqlInsert = `
            INSERT INTO contato (Nome, Email, Telefone, Assunto, Mensagem, Data_envio, Status)
            VALUES (?, ?, ?, ?, ?, ?, ?)
        `;

        const [resultado2] = await pool.query(sqlInsert, [
            Nome.trim(),
            Email.trim(),
            Telefone ? Telefone.trim() : null,
            Assunto.trim(),
            Mensagem.trim(),
            Data_envio,
            Status
        ]);

        if (resultado2.affectedRows === 1) {
            return res.status(201).json({ resposta: "Sucesso!" });
        }

        return res.status(500).json({ resposta: "Erro ao salvar a mensagem" });

    } catch (error) {
        console.error(error);
        return res.status(500).json({ resposta: "Erro inesperado" });
    }
});

// START SERVER
app.listen(3000, () => console.log("Servidor rodando em http://localhost:3000"));