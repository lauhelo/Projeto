-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para banco_projeto
DROP DATABASE IF EXISTS `banco_projeto`;
CREATE DATABASE IF NOT EXISTS `banco_projeto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `banco_projeto`;

-- Copiando estrutura para tabela banco_projeto.contato
DROP TABLE IF EXISTS `contato`;
CREATE TABLE IF NOT EXISTS `contato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  `Assunto` varchar(255) NOT NULL,
  `Mensagem` text NOT NULL,
  `Data_envio` datetime NOT NULL,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela banco_projeto.contato: ~2 rows (aproximadamente)
DELETE FROM `contato`;
INSERT INTO `contato` (`id`, `Nome`, `Email`, `Telefone`, `Assunto`, `Mensagem`, `Data_envio`, `Status`) VALUES
	(1, 'Laura Cleveston', 'lauhelocleves@gmail.com', '(00)000000000', 'Primeiro Teste', 'Primeiro Teste', '2025-11-18 10:27:52', ''),
	(2, 'Fernanda', 'fer@gmail.com', '(00)000000000', 'Primeiro Teste', 'Primeiro Teste', '2025-11-18 10:32:38', 'Aguardando Leitura'),
	(3, 'laura cleveston', 'pppp@hhhhhh', '9959595959', 'testetests', 'kkkkkkkkkkk', '2025-11-25 11:03:53', 'Aguardando Leitura'),
	(4, 'laura cleveston', 'lalala@gmail.com', '9959595959', 'testetests', 'lllllllll', '2025-11-25 11:10:44', 'Aguardando Leitura'),
	(5, 'pppppppppp', 'ppppppppppp', 'pp', 'pppppppppppppp', 'llllllll', '2025-11-25 13:44:48', 'Aguardando Leitura');

-- Copiando estrutura para tabela banco_projeto.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `CPF` varchar(50) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela banco_projeto.usuarios: ~8 rows (aproximadamente)
DELETE FROM `usuarios`;
INSERT INTO `usuarios` (`id`, `nome`, `email`, `endereco`, `CPF`, `telefone`, `senha`) VALUES
	(1, 'tttttt', 'ffffffff@gmail.com', 'lll', '123456', '123456', 'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI='),
	(2, 'LAURA HELOISA CLEVESTON', 'lau@gmail.com', 'lll', '123456', '123456', 'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI='),
	(3, 'LAURA HELOISA CLEVESTON', 'lau1@gmail.com', 'lll', '123456', '123456', 'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI='),
	(4, 'tttttt', 'lau2@gmail.com', 'lll', '123456', '123456', 'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI='),
	(5, 'tttttt', '123456@gmail.com', 'lll', '123456', '123456', 'GlN2rXJ9ZSE6efMQhUHPlQEpaaDTBk8Qi13W5/jBm4k='),
	(6, 'tttttt', 'ççç', 'lll', '123456', '123456', 'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI='),
	(7, 'tttttt', 'pp', 'lll', '123456', '123456', 'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI='),
	(8, 'tttttt', '1234567@gmail.com', 'lll', '123456', '123456', 'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI='),
	(9, 'tttttt', 'l@gmail.com', 'lll', '123456', '123456', 'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI='),
	(10, 'tttttt', 'f@gmail.com', 'lll', '123456', '123456', 'xOHBHEGwywZQ1hu/WWT027aVQjK1V8FXiwgIMZmmyPU='),
	(11, '	LAURA HELOISA CLEVESTON	', 'la', 'lll', '123456', '123456', 'VW19w6EVNWNQ8fmRCxrxqw4xLUs+T8eI0tpjZo820Bc='),
	(12, '	LAURA HELOISA CLEVESTON	', 'lao', 'lll', '123456', '123456', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM='),
	(13, '	LAURA HELOISA CLEVESTON	', 'laol', 'lll', '123456', '123456', '9uCh4qxBlFqap/+KiqoM68EqO8yYGpKa1c+BCgkOEa4='),
	(14, '	LAURA HELOISA CLEVESTON	', 'laolç', 'lll', '123456', '123456', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM='),
	(15, 'tttttt', 'çç', 'lll', '123456', '123456', 'VW19w6EVNWNQ8fmRCxrxqw4xLUs+T8eI0tpjZo820Bc=');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
