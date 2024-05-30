
-- Copiando estrutura do banco de dados para basewk
CREATE DATABASE IF NOT EXISTS `basewk` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `basewk`;

-- Copiando estrutura para tabela basewk.clientes
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `id_emp` int(8) DEFAULT 0,
  `nome` varchar(80) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `dtinc` datetime DEFAULT current_timestamp(),
  `dtalt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `idx_idemp` (`id_emp`),
  CONSTRAINT `FK_cliente_empresa` FOREIGN KEY (`id_emp`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela basewk.clientes: ~42 rows (aproximadamente)
DELETE FROM `clientes`;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id`, `id_emp`, `nome`, `cidade`, `uf`, `dtinc`, `dtalt`) VALUES
	(1, 1, 'VIA URBANA', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(2, 1, 'VIAÇÃO FORTALEZA', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(3, 1, 'PEDRAMAR', 'PEDRA BRANCA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(4, 1, 'SANTA MARIA', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(5, 1, 'AVINE I', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(6, 1, 'JOÃO  ( EUDES )', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(7, 1, 'LGA TRANSPORTES', 'CAUCAIA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(8, 1, 'FRETCAR RODOVIÁRIO', 'ACARAPE', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(10, 1, 'LDB', 'ITAITINGA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(11, 1, 'TECBRITA', 'CAUCAIA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(13, 1, 'C F - LOGÍSTICA DE VEÍCULOS', 'GOIÂNIA', 'GO', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(14, 1, 'NOVO CONSTRUÇÃO ', 'CASCAVEL', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(15, 1, 'LAREDO FOOD SÉRVICE', 'AQUIRAZ', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(27, 1, 'VEGA JACARECANGA', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(45, 1, 'MARAPONGA', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(59, 1, 'DRAGAO DO MAR', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(82, 1, 'RODE TRANSPORTES', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(83, 1, 'ARAGÃO AUTOS', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(84, 1, 'MUNDIAL LOGÍSTICA ', 'SAO GONCALO DO AMARANTE', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(85, 1, 'EXPRESSO GUANABARA', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(86, 1, 'POSTO MARAPONGA', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(87, 1, 'MARQUISE SERVIÇOS', 'EUSEBIO', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(88, 1, 'M S TURISMO', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(89, 1, 'SUPERFRANGOLANDIA', 'MARACANAU', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(91, 1, 'T R F TRANSPORTES', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(92, 1, 'J A DISTRIBUIDORA', 'EUSEBIO', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(93, 1, 'PONTO X', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(94, 1, 'DUPLO M', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(134, 1, 'ELOI DIESEL', 'CAICO', 'RN', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(191, 1, 'A Z T RENT A CAR E TRANSPORTES', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(253, 1, 'A. G. TRANSPORTES', 'MARACANAU', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(270, 1, 'RCR LOCACAO', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(276, 1, 'A G TRANSPORTES', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(299, 1, 'MALA AUTO DIESEL', 'IGUATUR', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(303, 1, 'ALIANCA TRUCK CENTER', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(317, 1, 'WP TURISMO', 'MARANGUAPE', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(318, 1, 'QUIXERAMOBIM PREF GABINETE DO PREFEITO', 'QUIXERAMOBIM', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(319, 1, 'SOLLOG', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(320, 1, 'ENGELT', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(321, 1, 'BRAZC PRODUTOS E SERVICOS', 'FORTALEZA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(322, 1, 'JARDIM DO EDEN', 'PACATUBA', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23'),
	(323, 1, 'NORMATEL HOME CENTER', 'JUAZEIRO DO NORTE', 'CE', '2024-05-28 22:42:23', '2024-05-28 22:42:23');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Copiando estrutura para tabela basewk.empresas
DROP TABLE IF EXISTS `empresas`;
CREATE TABLE IF NOT EXISTS `empresas` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(14) DEFAULT NULL,
  `razaosocial` varchar(100) DEFAULT NULL,
  `ie` varchar(25) DEFAULT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `bairro` varchar(60) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dtinc` datetime DEFAULT current_timestamp(),
  `dtalt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `idx_cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela basewk.empresas: ~1 rows (aproximadamente)
DELETE FROM `empresas`;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` (`id`, `cnpj`, `razaosocial`, `ie`, `logradouro`, `bairro`, `cep`, `telefone`, `cidade`, `uf`, `email`, `dtinc`, `dtalt`) VALUES
	(1, '54868691000179', 'H A M DE ANDRADE LIMA LTDA', '', 'NULL AVENIDA ALAMEDA DAS IMBURANAS 11', 'PRESIDENTE COSTA E SILVA', '59625340', '84-81075487', 'MOSSORÓ', 'RN', 'hacson25@gmail.com', '2024-05-28 20:45:58', '2024-05-29 20:38:37');
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;

-- Copiando estrutura para tabela basewk.itempedido
DROP TABLE IF EXISTS `itempedido`;
CREATE TABLE IF NOT EXISTS `itempedido` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `id_emp` int(8) DEFAULT 0,
  `id_pedido` int(8) DEFAULT 0,
  `cod_prod` varchar(20) DEFAULT NULL,
  `qtdevnd` double(12,4) DEFAULT 0.0000,
  `prunit` double(12,4) DEFAULT 0.0000,
  `totalvenda` double(12,4) DEFAULT 0.0000,
  `dtinc` datetime DEFAULT current_timestamp(),
  `dtalt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `idx_idemp` (`id_emp`),
  KEY `idx_idped` (`id_pedido`),
  KEY `idx_cod` (`cod_prod`),
  CONSTRAINT `FK_itemped_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`),
  CONSTRAINT `FK_itpedido_empresa` FOREIGN KEY (`id_emp`) REFERENCES `empresas` (`id`),
  CONSTRAINT `FK_prod_itemped` FOREIGN KEY (`cod_prod`) REFERENCES `produto` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela basewk.itempedido: ~0 rows (aproximadamente)
DELETE FROM `itempedido`;
/*!40000 ALTER TABLE `itempedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `itempedido` ENABLE KEYS */;

-- Copiando estrutura para tabela basewk.pedido
DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `id_emp` int(8) DEFAULT 0,
  `idclient` int(8) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `totalvenda` double(12,4) DEFAULT 0.0000,
  `diavenda` datetime DEFAULT NULL,
  `dtinc` datetime DEFAULT current_timestamp(),
  `dtalt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `idx_idemp` (`id_emp`),
  KEY `idx_cli` (`idclient`),
  CONSTRAINT `FK_cliente_pedido` FOREIGN KEY (`idclient`) REFERENCES `clientes` (`id`),
  CONSTRAINT `FK_pedido_empresa` FOREIGN KEY (`id_emp`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela basewk.pedido: ~1 rows (aproximadamente)
DELETE FROM `pedido`;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Copiando estrutura para tabela basewk.produto
DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `id_emp` int(8) DEFAULT 0,
  `codigo` varchar(20) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `valorvenda` double(12,4) DEFAULT 0.0000,
  `estoque` double(12,4) DEFAULT 0.0000,
  `dtinc` datetime DEFAULT current_timestamp(),
  `dtalt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `idx_idemp` (`id_emp`),
  KEY `idx_cod` (`codigo`),
  CONSTRAINT `FK_produto_empresa` FOREIGN KEY (`id_emp`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela basewk.produto: ~36 rows (aproximadamente)
DELETE FROM `produto`;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`id`, `id_emp`, `codigo`, `descricao`, `valorvenda`, `estoque`, `dtinc`, `dtalt`) VALUES
	(6, 1, '00000000000004', 'PORÇOES PEQUENA DE CHURRASCO', 14.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(7, 1, '00000000000006', 'PORÇÃO PEQUENA DE CEREAIS', 5.0000, 100.0000, '2024-05-28 22:47:03', '2024-05-29 20:38:53'),
	(8, 1, '00000000000015', 'WHISKY BLACK LABEL ', 12.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(9, 1, '00000000000021', 'CERV BRAHMA 1 LITRAO ', 7.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(10, 1, '00000000000024', 'CERV SCHIN  1 LITRAO ', 6.5000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(11, 1, '00000000000028', 'CERV DEVASSA 600 ML', 7.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(12, 1, '00000000000030', 'CERV   ITAIPAVA 600 ML ', 5.5000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(13, 1, '00000000000034', 'CERV ORIGINAL 600 ML ', 8.5000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(14, 1, '00000000000043', 'AGUA MINERAL COM GAS 500 ML', 3.5000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(15, 1, '00000000000047', 'JARRA DEV SUCO G', 16.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(16, 1, '00000000000100', 'MODA DA CASA P', 22.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(17, 1, '00000000000129', 'ROMEU E JULIETA G', 29.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(18, 1, '00000000000130', 'CHOCOLATE P', 20.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(19, 1, '00000000000134', 'CAIPIRA M', 26.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(20, 1, '00000000000137', 'ATUM M', 22.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(21, 1, '00000000000138', 'ATUM G', 28.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(22, 1, '00000000000157', 'BAIANA M', 24.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(23, 1, '00000000000170', 'NODESTINA P', 24.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(24, 1, '00000000000180', 'PICOLE FRUTILY ', 3.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(25, 1, '00000000000197', 'CONFEITO DE CAFÉ', 0.1000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(26, 1, '00000000000005', 'PORÇÃO   DE CHURRASCO', 22.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(27, 1, '00000000000007', 'PORÇÃO DE CEREAIS ', 10.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(28, 1, '00000000000022', 'CERV ANTARTICA PILSER 600 ML', 5.5000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(29, 1, '00000000000032', 'CERV ITAIPAVA  LATA ', 3.5000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(30, 1, '00000000000050', 'VINHO GALIOTO 1 LITRO ', 35.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(31, 1, '00000000000183', 'RED BULL ', 12.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(32, 1, '00000000000184', 'ENEGERTICO TNT ', 10.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(33, 1, '00000000000018', 'CERV SKOL 1 LITROS', 8.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(34, 1, '00000000000040', 'REFRIG LATA  E KS', 3.5000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(35, 1, '00000000000087', 'CAMARÃO PRESTO M', 33.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(36, 1, '00000000000008', 'CACHAÇA PITU/51/YPIOCA  DOSE', 2.5000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(37, 1, '00000000000020', 'CERV BRAHMA 600 ML', 5.5000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(38, 1, '00000000000080', 'PIZZAS DE CAMARÃO M', 32.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(39, 1, '00000000000167', 'NORDESTINA  P ', 24.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(40, 1, '00000000000017', 'CERV SKOL 600 ML', 6.0000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03'),
	(41, 1, '00000000000187', 'REFEIÇÃO ', 37.9000, 0.0000, '2024-05-28 22:47:03', '2024-05-28 22:47:03');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela basewk.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `id_emp` int(8) DEFAULT 0,
  `nome` varchar(20) DEFAULT NULL,
  `login` varchar(10) DEFAULT NULL,
  `senha` varchar(32) DEFAULT NULL,
  `dtinc` datetime DEFAULT current_timestamp(),
  `dtalt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `idx_idemp` (`id_emp`),
  CONSTRAINT `FK_usuario_empresa` FOREIGN KEY (`id_emp`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela basewk.usuario: ~1 rows (aproximadamente)
DELETE FROM `usuario`;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `id_emp`, `nome`, `login`, `senha`) VALUES
	(1, 1, 'SENSEI', 'SENSEI', '1234');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;


