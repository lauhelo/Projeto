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


-- Copiando estrutura do banco de dados para tarefa
DROP DATABASE IF EXISTS `tarefa`;
CREATE DATABASE IF NOT EXISTS `tarefa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `tarefa`;

-- Copiando estrutura para tabela tarefa.clientes
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedidos` int(11) DEFAULT NULL,
  `nome_cliente` varchar(100) DEFAULT NULL,
  `senha` varchar(256) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `pedidos_cliente` (`id_pedidos`) USING BTREE,
  CONSTRAINT `FK_clientes_pedidos` FOREIGN KEY (`id_pedidos`) REFERENCES `pedidos` (`id_pedidos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela tarefa.clientes: ~4 rows (aproximadamente)
DELETE FROM `clientes`;
INSERT INTO `clientes` (`id_cliente`, `id_pedidos`, `nome_cliente`, `senha`, `email`, `endereco`) VALUES
	(2, 49, 'Fernanda', '123456', NULL, 'rua 10, N°50'),
	(4, 51, 'fer', '123456', NULL, 'rua 10, N°50'),
	(5, 52, 'Pietro', '123', NULL, 'rua 10, N°50'),
	(6, 53, 'lorena', '123456', NULL, 'rua 10, N°50');

-- Copiando estrutura para tabela tarefa.pedidos
DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id_pedidos` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `valor_total` decimal(20,6) DEFAULT NULL,
  `status_pedido` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pedidos`),
  KEY `id_produto` (`id_produto`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON UPDATE CASCADE,
  CONSTRAINT `id_produto` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela tarefa.pedidos: ~4 rows (aproximadamente)
DELETE FROM `pedidos`;
INSERT INTO `pedidos` (`id_pedidos`, `id_produto`, `id_cliente`, `quantidade`, `valor_total`, `status_pedido`) VALUES
	(49, 2, 2, 2, 15.000000, 'Pago'),
	(51, 3, 4, 2, 25.000000, 'Pago'),
	(52, 4, 5, 2, 55.000000, 'pendente'),
	(53, 5, 6, 2, 35.000000, 'Pago');

-- Copiando estrutura para tabela tarefa.produtos
DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(100) DEFAULT NULL,
  `valor_produto` decimal(20,6) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela tarefa.produtos: ~6 rows (aproximadamente)
DELETE FROM `produtos`;
INSERT INTO `produtos` (`id_produto`, `nome_produto`, `valor_produto`, `categoria`) VALUES
	(2, 'Bolo de chocolate', 15.000000, 'chá'),
	(3, 'Chá gelado', 7.000000, 'Bebida'),
	(4, 'Bolo de chocolate', 15.000000, 'chá'),
	(5, 'Cupcake', 5.000000, 'Doce'),
	(6, 'Pão caseiro', 10.000000, 'chá'),
	(8, 'Bolo de Laranja', 16.000000, 'doce');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
