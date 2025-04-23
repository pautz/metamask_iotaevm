-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 23/04/2025 às 14:09
-- Versão do servidor: 10.11.10-MariaDB-log
-- Versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `u839226731_meutrator`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastro_produto`
--

CREATE TABLE `cadastro_produto` (
  `nome` text NOT NULL,
  `valor` text NOT NULL,
  `quantidade` text NOT NULL,
  `total` text NOT NULL,
  `id` int(11) NOT NULL,
  `imagem` text NOT NULL,
  `url_buy` text NOT NULL,
  `categoria` text NOT NULL,
  `idtrator` text NOT NULL,
  `eq_user` text NOT NULL,
  `leilao` varchar(250) NOT NULL,
  `nuvem` varchar(140) NOT NULL,
  `cidadetrator` varchar(140) NOT NULL,
  `estadotrator` varchar(140) NOT NULL,
  `destacar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `cadastro_produto`
--

INSERT INTO `cadastro_produto` (`nome`, `valor`, `quantidade`, `total`, `id`, `imagem`, `url_buy`, `categoria`, `idtrator`, `eq_user`, `leilao`, `nuvem`, `cidadetrator`, `estadotrator`, `destacar`) VALUES
('Locação de tratores 4x4 com guincho 33 ton e retroescavadeira para linhas de transmissão', '182000', '60', '', 86, '', 'https://api.whatsapp.com/send?phone=5555996479747', 'tratores', '04154652060', 'pofft', '', '', 'Palmeira das Missões', 'Rio Grande do Sul', 1),
('Locação para aeroporto', '182000', '6', '', 87, '', 'https://api.whatsapp.com/send?phone=5555996479747', 'tratores', '555555', 'admin', '', '', 'Palmeira das Missões', 'Rio Grande do Sul', 0),
('Disponivel para locacao', '182000', '10', '', 88, '', 'https://api.whatsapp.com/send?phone=5555996479747', 'tratores', '444444', 'admin', '', '', 'Palmeira das Missões', 'Rio Grande do Sul', 0),
('Trator disponivel para locação', '182000', '1', '', 92, '', 'https://api.whatsapp.com/send?phone=5555996479747', 'tratores', '20251996', 'pofft', '', '', 'Palmeira das Missões', 'Rio Grande do Sul', 0),
('Mouse Redragon Impact M908', '258', '1', '', 99, '', 'https://mercadolivre.com/sec/1UJ1H8N', '', '201721424', 'pautz', '', '', 'Primavera do Leste', 'Mato Grosso', 0),
('Teclado Mecânico Gamer Clanm King Cl-tk87', '204', '1', '', 100, '', 'https://mercadolivre.com/sec/27zauYU', '', '201721425', 'pautz', '', '', 'Primavera do Leste', 'Mato Grosso', 0),
('Monitor Led 19pol Tomate Hdmi', '415', '1', '', 101, '', 'https://mercadolivre.com/sec/1ijJhvG', '', '201721426', 'pautz', '', '', 'Primavera do Leste', 'Mato Grosso', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagens_produto`
--

CREATE TABLE `imagens_produto` (
  `id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `imagem` varchar(500) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `data_upload` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `imagens_produto`
--

INSERT INTO `imagens_produto` (`id`, `produto_id`, `imagem`, `descricao`, `data_upload`) VALUES
(11, 86, 'https://carlitoslocacoes.com/site3/cadastro_produto/up/tratorbutton.png', NULL, '2025-04-03 12:59:48'),
(12, 87, 'https://carlitoslocacoes.com/site3/cadastro_produto/up/locacaoaeroporto.jpg', NULL, '2025-04-08 11:05:50'),
(13, 88, 'https://carlitoslocacoes.com/site3/cadastro_produto/up/trator55.jpg', NULL, '2025-04-08 11:08:08'),
(14, 88, 'https://carlitoslocacoes.com/site3/cadastro_produto/up/trator555.jpg', NULL, '2025-04-08 11:08:08'),
(15, 88, 'https://carlitoslocacoes.com/site3/cadastro_produto/up/trator5555.jpg', NULL, '2025-04-08 11:08:08'),
(21, 92, 'https://carlitoslocacoes.com/site3/cadastro_produto/up/trator4.jpg', NULL, '2025-04-15 17:00:13'),
(22, 92, 'https://carlitoslocacoes.com/site3/cadastro_produto/up/trator444.jpg', NULL, '2025-04-15 17:00:13'),
(27, 99, '../../site3/cadastro_produto/up/mouse.png', NULL, '2025-04-22 00:05:15'),
(28, 100, '../../site3/cadastro_produto/up/teclado.png', NULL, '2025-04-22 12:40:31'),
(29, 101, '../../site3/cadastro_produto/up/monitor2.png', NULL, '2025-04-22 12:49:44');

-- --------------------------------------------------------

--
-- Estrutura para tabela `oil_levels`
--

CREATE TABLE `oil_levels` (
  `id` int(11) NOT NULL,
  `boat_id` varchar(255) DEFAULT NULL,
  `oil_level` decimal(10,2) DEFAULT NULL,
  `next_change` date DEFAULT NULL,
  `registration_date` timestamp NULL DEFAULT current_timestamp(),
  `next_change_value` decimal(10,2) DEFAULT NULL,
  `whatsapp_number` varchar(15) NOT NULL,
  `cv` varchar(255) DEFAULT NULL,
  `eq_user` text NOT NULL,
  `payment_status` enum('Pago','Não Pago') DEFAULT 'Não Pago',
  `paymentstatus` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `oil_levels`
--

INSERT INTO `oil_levels` (`id`, `boat_id`, `oil_level`, `next_change`, `registration_date`, `next_change_value`, `whatsapp_number`, `cv`, `eq_user`, `payment_status`, `paymentstatus`) VALUES
(29, '321', 500.00, '2025-02-13', '2025-03-26 12:28:38', 6000.00, '+55559964749747', '201722025', '', 'Não Pago', ''),
(30, '321', 4000.00, '2025-03-29', '2025-03-26 12:31:13', 6000.00, '+5555996479747', '201722026', '', 'Não Pago', ''),
(74, '201722087', 70.00, '2025-03-29', '2025-03-29 22:43:42', 70.00, '+55996479747', '04154652060', 'admin', 'Não Pago', 'Pago'),
(78, '201722085', 70.00, '2025-04-29', '2025-03-30 12:35:42', 70.00, '+55996129682', '04154652060', 'admin', 'Não Pago', 'Pago'),
(81, '201722202', 20000.00, '2025-05-01', '2025-04-01 15:03:59', 22000.00, '+55996479747', '201721424', 'admin', 'Não Pago', 'Pago'),
(82, '201722203', 20000.00, '2025-04-01', '2025-04-01 15:18:16', 22000.00, '+5555996129682', '201721424', 'admin', 'Não Pago', 'Pago'),
(83, '201722204', 500.00, '2025-04-12', '2025-04-01 15:37:37', 600.00, '55', '201721424', 'admin', 'Não Pago', 'Não Pago'),
(89, '201722213', 188000.00, '2025-05-01', '2025-04-01 20:40:01', 188000.00, '+55996129682', '201721424', 'pofft', 'Não Pago', 'Pago'),
(90, '201722208', 10.00, '2025-05-07', '2025-04-08 02:06:37', 10.00, '+55996479747', '04154652060', 'admin', 'Não Pago', 'Pago'),
(91, '201722219', 11.00, '2025-05-07', '2025-04-08 02:09:09', 11.00, '+5555996129682', '04154652060', 'admin', 'Não Pago', 'Pago'),
(92, '201722207', 12.00, '2025-04-07', '2025-04-08 02:13:48', 12.00, '+55996129682', '201721424', 'admin', 'Não Pago', 'Pago'),
(93, '201722221', 120.00, '2025-04-26', '2025-04-09 13:26:36', 120.00, '+55996129682', '444444', 'admin', 'Não Pago', 'Pago'),
(94, '201722224', 70.00, '2025-04-11', '2025-04-10 12:20:44', 70.00, '5555996479747', '04081996', 'admin', 'Não Pago', 'Pago'),
(95, '201722225', 122.00, '2025-04-11', '2025-04-10 12:29:38', 122.00, '5555996129682', '040819962002', 'admin', 'Não Pago', 'Pago'),
(96, '201722226', 520.00, '2025-04-10', '2025-04-10 12:33:32', 520.00, '5555996479747', '201921424', 'admin', 'Não Pago', 'Não Pago'),
(97, '201722229', 520.00, '2025-04-10', '2025-04-10 12:43:19', 520.00, '+5555996479747', '20251996', 'admin', 'Não Pago', 'Não Pago');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `id` int(11) NOT NULL,
  `resposta_id` int(11) NOT NULL,
  `status_pagamento` varchar(50) NOT NULL,
  `data_pagamento` date NOT NULL,
  `valor` decimal(18,8) NOT NULL,
  `hashTransacao` varchar(255) NOT NULL,
  `pago` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `produto_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `url_buy` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`produto_id`, `nome`, `valor`, `quantidade`, `url_buy`) VALUES
(1, '1', 1.00, 1, 'https://instagram.com/marianegartner');

-- --------------------------------------------------------

--
-- Estrutura para tabela `radioterapia_cobalto_nic`
--

CREATE TABLE `radioterapia_cobalto_nic` (
  `id` int(11) NOT NULL,
  `eletrons` int(11) NOT NULL,
  `protons` int(11) NOT NULL,
  `neutrons` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `radioterapia_cobalto_nic`
--

INSERT INTO `radioterapia_cobalto_nic` (`id`, `eletrons`, `protons`, `neutrons`) VALUES
(1, 60, 60, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `registrointerno`
--

CREATE TABLE `registrointerno` (
  `id` int(11) NOT NULL,
  `tabela_editada` varchar(255) DEFAULT NULL,
  `id_registro_editado` int(11) DEFAULT NULL,
  `coluna_editada` varchar(255) DEFAULT NULL,
  `valor_antigo` varchar(255) DEFAULT NULL,
  `valor_novo` varchar(255) DEFAULT NULL,
  `usuario_que_editou` varchar(255) DEFAULT NULL,
  `data_hora_edicao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `registrointerno`
--

INSERT INTO `registrointerno` (`id`, `tabela_editada`, `id_registro_editado`, `coluna_editada`, `valor_antigo`, `valor_novo`, `usuario_que_editou`, `data_hora_edicao`) VALUES
(1, 'oil_levels', 201722212, 'next_change_value', '128400.00', '129000.00', 'pofft', '2025-04-01 19:37:02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `registrointerno2`
--

CREATE TABLE `registrointerno2` (
  `id` int(11) NOT NULL,
  `tabela_editada` varchar(255) NOT NULL,
  `id_registro_editado` int(11) NOT NULL,
  `coluna_editada` varchar(255) NOT NULL,
  `valor_antigo` varchar(255) NOT NULL,
  `valor_novo` varchar(255) NOT NULL,
  `usuario_que_editou` varchar(255) NOT NULL,
  `data_hora_edicao` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `registrointerno2`
--

INSERT INTO `registrointerno2` (`id`, `tabela_editada`, `id_registro_editado`, `coluna_editada`, `valor_antigo`, `valor_novo`, `usuario_que_editou`, `data_hora_edicao`) VALUES
(1, 'trator_oleo', 4, 'next_change_value', '600', '601', 'Sistema', '2025-04-03 20:53:18'),
(2, 'trator_oleo', 4, 'next_change_value', '601', '602', 'Sistema', '2025-04-03 21:02:30'),
(3, 'trator_oleo', 4, 'paymentstatus', 'Pago', 'Não Pago', 'Sistema', '2025-04-04 12:37:46'),
(4, 'trator_oleo', 4, 'paymentstatus', 'Não Pago', 'Pago', 'Sistema', '2025-04-04 12:37:52');

-- --------------------------------------------------------

--
-- Estrutura para tabela `respostas`
--

CREATE TABLE `respostas` (
  `tipo` varchar(255) DEFAULT NULL,
  `modelo` text NOT NULL,
  `cv` varchar(20) NOT NULL,
  `ano` int(11) NOT NULL,
  `placa` text NOT NULL,
  `estado` text NOT NULL,
  `cidade` text NOT NULL,
  `eq_user` text NOT NULL,
  `telefone` char(20) NOT NULL,
  `id` int(11) NOT NULL,
  `fotos1` text NOT NULL,
  `link` text NOT NULL,
  `preco_total` text NOT NULL,
  `tyus` text NOT NULL,
  `linkiframe` text NOT NULL,
  `linkGIT` text NOT NULL,
  `qrcodelink` text NOT NULL,
  `novo_creditos` text NOT NULL,
  `ultimo_desconto` text NOT NULL,
  `creditos` text NOT NULL,
  `longitude` text NOT NULL,
  `latitude` text NOT NULL,
  `url_buy` text NOT NULL,
  `data` text NOT NULL,
  `locationStatus` text NOT NULL,
  `youtubelink` text NOT NULL,
  `qrcode` varchar(250) NOT NULL,
  `status_pagamento` enum('Pago','Não Pago') DEFAULT 'Não Pago',
  `data_pagamento` date NOT NULL,
  `nova_data_pagamento` date DEFAULT NULL,
  `novo_status_pagamento` varchar(50) DEFAULT NULL,
  `quantidade` text NOT NULL,
  `descricao` text DEFAULT NULL,
  `oil_level` decimal(10,2) DEFAULT NULL,
  `nome_recebedor` varchar(255) NOT NULL,
  `cidade_recebedor` varchar(255) NOT NULL,
  `caixa` text NOT NULL,
  `mercado_pago_qrcode_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `respostas`
--

INSERT INTO `respostas` (`tipo`, `modelo`, `cv`, `ano`, `placa`, `estado`, `cidade`, `eq_user`, `telefone`, `id`, `fotos1`, `link`, `preco_total`, `tyus`, `linkiframe`, `linkGIT`, `qrcodelink`, `novo_creditos`, `ultimo_desconto`, `creditos`, `longitude`, `latitude`, `url_buy`, `data`, `locationStatus`, `youtubelink`, `qrcode`, `status_pagamento`, `data_pagamento`, `nova_data_pagamento`, `novo_status_pagamento`, `quantidade`, `descricao`, `oil_level`, `nome_recebedor`, `cidade_recebedor`, `caixa`, `mercado_pago_qrcode_url`) VALUES
('1', '', '', 0, '', '', '', '', '', 201722092, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '1', '5', NULL, '', '', '', NULL),
('teste1', '', '', 0, '', '', '', '', '', 201722093, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '1', '124', NULL, '', '', '', NULL),
('tse', '', '', 0, '', '', '', '', '', 201722094, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '1', '2131', NULL, '', '', '', NULL),
('teste1', '', '', 0, '', '', '', '', '', 201722096, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '2', '124', NULL, '', '', '', NULL),
('teste1', '', '', 0, '', '', '', '', '', 201722097, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '2', '124', NULL, '', '', '', NULL),
('teste1', '', '', 0, '', '', '', '', '', 201722098, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '5', '124', NULL, '', '', '', NULL),
('37423742', '', '', 0, '', '', '', '', '', 201722109, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '1', '11', NULL, '', '', '1', NULL),
('37423742', '', '', 0, '', '', '', '', '', 201722110, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '2', '11', NULL, '', '', '1', NULL),
('37423742', '', '04154652060', 0, '', '', '', 'admin', '', 201722116, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', 'https://carlitoslocacoes.com/binanceiota.jpg', 'Não Pago', '0000-00-00', NULL, NULL, '', '5', NULL, 'Carlito Veeck Pautz Junior', 'Panambi', '', NULL),
('37423742', '', '04154652060', 0, '', '', '', 'admin', '', 201722117, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', 'https://carlitoslocacoes.com/binanceiota.jpg', 'Não Pago', '0000-00-00', NULL, NULL, '', '5', NULL, 'Carlito Veeck Pautz Junior', 'Panambi', '', NULL),
('37423742', '', '04154652060', 0, '', '', '', 'admin', '', 201722118, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', 'https://carlitoslocacoes.com/binanceiota.jpg', 'Não Pago', '0000-00-00', NULL, NULL, '', '5', NULL, 'Carlito Veeck Pautz Junior', 'Panambi', '', NULL),
('37423742', '', '04154652060', 0, '', '', '', 'admin', '', 201722119, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', 'https://carlitoslocacoes.com/binanceiota.jpg', 'Não Pago', '0000-00-00', NULL, NULL, '', '5', NULL, 'Carlito Veeck Pautz Junior', 'Panambi', '', NULL),
('37423742', '', '04154652060', 0, '', '', '', 'admin', '', 201722120, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', 'https://carlitoslocacoes.com/binanceiota.jpg', 'Não Pago', '0000-00-00', NULL, NULL, '', '5', NULL, 'Carlito Veeck Pautz Junior', 'Panambi', '', NULL),
('37423742', '', '04154652060', 0, '', '', '', 'admin', '', 201722122, '', '', '100', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '3', '5', NULL, '', '', '1', NULL),
('37413741', '', '04154652060', 0, '', '', '', 'pofft', '', 201722163, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '1', '11', NULL, '', '', '0', NULL),
('56465466', '', '12', 0, '', '', '', 'pofft', '', 201722165, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '1', '56', NULL, '', '', '0', NULL),
('56465466', '', '12', 0, '', '', '', 'pofft', '', 201722166, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '1', '56', NULL, '', '', '0', NULL),
('56465466', '', '12', 0, '', '', '', 'pofft', '', 201722167, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '1', '56', NULL, '', '', '0', NULL),
('56465466', '', '12', 0, '', '', '', 'pofft', '', 201722168, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '1', '56', NULL, 'Amendoim', '', '0', NULL),
('56465466', '', '12', 0, '', '', '', 'pofft', '', 201722169, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '1', '56', NULL, 'Amendoim', '', '0', NULL),
('56465466', '', '12', 0, '', '', '', 'pofft', '', 201722170, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '6', '56', NULL, 'Amendoim', '', '0', NULL),
('56465466', '', '12', 0, '', '', '', 'pofft', '', 201722171, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '5', '56', NULL, 'Amendoim', '', '0', NULL),
('56465466', '', '12', 0, '', '', '', 'pofft', '', 201722172, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '1', '56', NULL, 'Amendoim', '', '0', NULL),
('231323', '', '04154652060', 0, '', '', '', 'pofft', '', 201722174, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '1', '15', NULL, 'Colgate', '', '0', NULL),
('37413741', '', '04154652060', 0, '', '', '', 'pofft', '', 201722176, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '1', '11', NULL, '', '', '0', NULL),
('37413741', '', '04154652060', 0, '', '', '', 'pofft', '', 201722178, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '1', '11', NULL, '', '', '0', NULL),
('1245', '', '1', 0, '', '', '', 'pofft', '', 201722193, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '2', '0', NULL, '0', '', '0', NULL),
('37423742', '', '04154652060', 0, '', '', '', 'pofft', '', 201722197, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', 'https://carlitoslocacoes.com/binanceiota.jpg', 'Não Pago', '0000-00-00', NULL, NULL, '', '0', NULL, '0', '0', '', NULL),
('565654', '', '04154652060', 0, '', '', '', 'pofft', '', 201722199, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '0', 'Não Pago', '0000-00-00', NULL, NULL, '', '5', NULL, '0', '0', '', NULL),
(NULL, '', '201721424', 0, '', '', '', 'admin', '', 201722207, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '0', 'Não Pago', '0000-00-00', NULL, NULL, '', '0', NULL, '0', '0', '', NULL),
(NULL, '', '04154652060', 0, '', '', '', 'admin', '', 201722208, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '5555996129682', 'Não Pago', '0000-00-00', NULL, NULL, '', '0', NULL, '0', '0', '', NULL),
(NULL, '', '04154652060', 0, '', '', '', 'admin', '', 201722219, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '04154652060', 'Não Pago', '0000-00-00', NULL, NULL, '', '0', NULL, '0', '0', '', NULL),
(NULL, '', '555555', 0, '', '', '', 'admin', '', 201722220, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '5555996129682', 'Não Pago', '0000-00-00', NULL, NULL, '', '0', NULL, '0', '0', '', NULL),
(NULL, '', '444444', 0, '', '', '', 'admin', '', 201722221, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '04154652060', 'Não Pago', '0000-00-00', NULL, NULL, '', '0', NULL, 'Carlito Veeck Pautz Junior', 'Panambi', '', NULL),
(NULL, '', '201721533', 0, '', '', '', 'admin', '', 201722222, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '0', 'Não Pago', '0000-00-00', NULL, NULL, '', '0', NULL, '0', '0', '', NULL),
('24524', '', '201721533', 0, '', '', '', 'admin', '', 201722223, '', '', '', '', '', '', '', '', '2025-04-10', '-1', '', '', '', '', '', '', '0', 'Não Pago', '0000-00-00', NULL, NULL, '', '0', NULL, '0', '0', '', NULL),
(NULL, '', '04081996', 0, '', '', '', 'admin', '', 201722224, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '123', 'Não Pago', '0000-00-00', NULL, NULL, '', '0', NULL, 'Carlito Veeck Pautz Júnior', 'Panambi', '', NULL),
(NULL, '', '040819962002', 0, '', '', '', 'admin', '', 201722225, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '5555996129682', 'Não Pago', '0000-00-00', NULL, NULL, '', '0', NULL, 'Carlito Pautz', 'Panambi', '', NULL),
(NULL, '', '201921424', 0, '', '', '', 'admin', '', 201722226, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '5555996129682', 'Não Pago', '0000-00-00', NULL, NULL, '', '0', NULL, 'carlito', 'panambi', '', NULL),
(NULL, '', '201921424', 0, '', '', '', 'admin', '', 201722227, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '5555996129682', 'Não Pago', '0000-00-00', NULL, NULL, '', '0', NULL, 'carlito', 'panambi', '', NULL),
(NULL, '', '201921424', 0, '', '', '', 'admin', '', 201722228, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '5555996129682', 'Não Pago', '0000-00-00', NULL, NULL, '', '0', NULL, 'carlito', 'panambi', '', NULL),
(NULL, '', '20251996', 0, '', '', '', 'admin', '', 201722229, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '5555996129682', 'Não Pago', '0000-00-00', NULL, NULL, '', '0', NULL, 'carlito', 'panambi', '', NULL),
(NULL, '', '20251996', 0, '', '', '', 'admin', '', 201722230, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '5555996129682', 'Não Pago', '0000-00-00', NULL, NULL, '', '0', NULL, 'carlito', 'panambi', '', NULL),
(NULL, '', '20251996', 0, '', '', '', 'admin', '', 201722231, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '5555996129682', 'Não Pago', '0000-00-00', NULL, NULL, '', '0', NULL, 'carlito', 'panambi', '', NULL),
(NULL, '', '20251996', 0, '', '', '', 'pofft', '', 201722232, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '5555996129682', 'Não Pago', '0000-00-00', NULL, NULL, '', '0', NULL, 'Carlito', 'Panambi', '', NULL),
('31', '', '333', 0, '', '', '', 'pofft', '', 201722235, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 'Não Pago', '0000-00-00', NULL, NULL, '', '10', NULL, '0', '0', '', NULL),
('31', '', '333', 0, '', '', '', 'pofft', '', 201722237, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '2', '10', NULL, '0', '', '1', NULL),
('31', '', '333', 0, '', '', '', 'pofft', '', 201722238, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '3', '10', NULL, '0', '', '1', NULL),
('31', '', '333', 0, '', '', '', 'pofft', '', 201722239, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '5', '10', NULL, '0', '', '1', NULL),
(NULL, '', '201721424', 0, '', '', '', 'pautz', '', 201722240, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '5555996129682', 'Não Pago', '0000-00-00', NULL, NULL, '', '400', NULL, 'Carlito Pautz', 'Panambi', '', NULL),
(NULL, '', '201721425', 0, '', '', '', 'pautz', '', 201722241, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '5555996129682', 'Não Pago', '0000-00-00', NULL, NULL, '', '204', NULL, 'Carlito Pautz', 'Panambi', '', NULL),
(NULL, '', '201721426', 0, '', '', '', 'pautz', '', 201722242, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '55996129682', 'Não Pago', '0000-00-00', NULL, NULL, '', '415', NULL, 'Carlito Pautz', 'Primavera do Leste', '', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `respostas2`
--

CREATE TABLE `respostas2` (
  `tipo` char(140) NOT NULL,
  `modelo` text NOT NULL,
  `cv` varchar(20) NOT NULL,
  `ano` int(11) NOT NULL,
  `placa` text NOT NULL,
  `estado` text NOT NULL,
  `cidade` text NOT NULL,
  `eq_user` text NOT NULL,
  `telefone` char(20) NOT NULL,
  `id` int(11) NOT NULL,
  `fotos1` text NOT NULL,
  `link` text NOT NULL,
  `preco_total` text NOT NULL,
  `tyus` text NOT NULL,
  `linkiframe` text NOT NULL,
  `linkGIT` text NOT NULL,
  `qrcodelink` text NOT NULL,
  `novo_creditos` text NOT NULL,
  `ultimo_desconto` text NOT NULL,
  `creditos` text NOT NULL,
  `longitude` text NOT NULL,
  `latitude` text NOT NULL,
  `url_buy` text NOT NULL,
  `data` text NOT NULL,
  `locationStatus` text NOT NULL,
  `youtubelink` text NOT NULL,
  `qrcode` varchar(240) NOT NULL,
  `status_pagamento` enum('Pago','Não Pago') DEFAULT 'Não Pago',
  `data_pagamento` date NOT NULL,
  `nova_data_pagamento` date DEFAULT NULL,
  `novo_status_pagamento` varchar(50) DEFAULT NULL,
  `caixa` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `respostas2`
--

INSERT INTO `respostas2` (`tipo`, `modelo`, `cv`, `ano`, `placa`, `estado`, `cidade`, `eq_user`, `telefone`, `id`, `fotos1`, `link`, `preco_total`, `tyus`, `linkiframe`, `linkGIT`, `qrcodelink`, `novo_creditos`, `ultimo_desconto`, `creditos`, `longitude`, `latitude`, `url_buy`, `data`, `locationStatus`, `youtubelink`, `qrcode`, `status_pagamento`, `data_pagamento`, `nova_data_pagamento`, `novo_status_pagamento`, `caixa`) VALUES
('teste', '', '321', 0, '', '', '', '', '', 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, ''),
('Carlito Veeck Pautz Júnior', '', '04154652060', 0, '', '', '', '', '', 2, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, ''),
('teste', '', '04154652060', 0, '', '', '', '', '', 3, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, ''),
('Blá blá blá', '', '201721424', 0, '', '', '', '', '', 4, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, ''),
('Carlito, Primavera do Leste, MT, Brasil, +5555996479747', '', '201721421', 0, '', '', '', '', '', 5, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, ''),
('Alo', '', 'Opa', 0, '', '', '', '', '', 6, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, ''),
('Primavera do Leste, Mato grosso, Brasil.', '', 'carlito', 0, '', '', '', '', '', 7, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, ''),
('Laboratório de Software', '', '040896', 0, '', '', '', '', '', 8, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, ''),
('teste oil', '', '201721424', 0, '', '', '', '', '', 9, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, ''),
('Trator BM125', '', '3535', 0, '', '', '', '', '', 10, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, ''),
('trator', '', '3366', 0, '', '', '', '', '', 11, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, ''),
('trator', '', '3742', 0, '', '', '', '', '', 12, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `respostas3`
--

CREATE TABLE `respostas3` (
  `tipo` char(140) NOT NULL,
  `modelo` text NOT NULL,
  `cv` varchar(20) NOT NULL,
  `ano` int(11) NOT NULL,
  `placa` text NOT NULL,
  `estado` text NOT NULL,
  `cidade` text NOT NULL,
  `eq_user` text NOT NULL,
  `telefone` char(20) NOT NULL,
  `id` int(11) NOT NULL,
  `fotos1` text NOT NULL,
  `link` text NOT NULL,
  `preco_total` text NOT NULL,
  `tyus` text NOT NULL,
  `linkiframe` text NOT NULL,
  `linkGIT` text NOT NULL,
  `qrcodelink` text NOT NULL,
  `novo_creditos` text NOT NULL,
  `ultimo_desconto` text NOT NULL,
  `creditos` text NOT NULL,
  `longitude` text NOT NULL,
  `latitude` text NOT NULL,
  `url_buy` text NOT NULL,
  `data` text NOT NULL,
  `locationStatus` text NOT NULL,
  `youtubelink` text NOT NULL,
  `qrcode` text NOT NULL,
  `status_pagamento` enum('Pago','Não Pago') DEFAULT 'Não Pago',
  `data_pagamento` date NOT NULL,
  `nova_data_pagamento` date DEFAULT NULL,
  `novo_status_pagamento` varchar(50) DEFAULT NULL,
  `caixa` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `respostas3`
--

INSERT INTO `respostas3` (`tipo`, `modelo`, `cv`, `ano`, `placa`, `estado`, `cidade`, `eq_user`, `telefone`, `id`, `fotos1`, `link`, `preco_total`, `tyus`, `linkiframe`, `linkGIT`, `qrcodelink`, `novo_creditos`, `ultimo_desconto`, `creditos`, `longitude`, `latitude`, `url_buy`, `data`, `locationStatus`, `youtubelink`, `qrcode`, `status_pagamento`, `data_pagamento`, `nova_data_pagamento`, `novo_status_pagamento`, `caixa`) VALUES
('trator', '', '3742', 0, '', '', '', '', '', 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Não Pago', '0000-00-00', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `trator_oleo`
--

CREATE TABLE `trator_oleo` (
  `id` int(11) NOT NULL,
  `boat_id` varchar(255) NOT NULL,
  `cv` varchar(255) NOT NULL,
  `oil_level` varchar(255) NOT NULL,
  `next_change` varchar(255) NOT NULL,
  `next_change_value` varchar(255) NOT NULL,
  `whatsapp_number` varchar(15) NOT NULL,
  `eq_user` varchar(255) NOT NULL,
  `paymentstatus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(3, 'carlitopautz', '$2y$10$ABRy8vsyF6yYJQN4Tl7UueE.aMPSjdbOcOEm.FQuN.RSLkmtHavom'),
(6, 'CARLITO PAUTZ', '$2y$10$U71ZMhUivYobabaZ4TewX.4oKfuo6xLFO8MlF1iiEYLi7eeNzXMSG'),
(7, 'pcar', '$2y$10$8qIT1PUv/uAqZG1rQLoYU.Q5tMUnVYQWiRWUedbtuhMEGV7oVXob.'),
(8, 'elanadara', '$2y$10$zJfYnNkulsFXZuTK3eVxBe5S8oNmOr11UwE4Rfy6ZziKGUnhPBYwm'),
(9, 'carlitoslocacoes', '$2y$10$ABRy8vsyF6yYJQN4Tl7UueE.aMPSjdbOcOEm.FQuN.RSLkmtHavom'),
(10, '201721424', '$2y$10$Gpgjdx10tD28gvqSaeu9hOxF3RFlocy8e7co3aPNb2OAlXQJiEebm'),
(11, 'tibia', '$2y$10$vgLWHG5AvzKK2ltSICeAeOy9s.sc4JUfRfHdyiKWsS/yAgewRtrfy'),
(12, 'pofft', '$2y$10$9S3.qjRne9KF7QWWoW1BWOp78OjXkwz1lahEvZf.aws.DVAL.FbE.'),
(13, 'carl', '$2y$10$EJLQJ4icWzNaGYlCTDdnAeVCVlr8w09lyvMkMVshj5ags2RkJfuWW'),
(14, 'Tst', '$2y$10$OfVP.jtDW1gjPsX9pTK6XeU4vSt.3hvrMiCsWPh/B.ZJkslv0O3hO'),
(15, 'Bom', '$2y$10$EJLQJ4icWzNaGYlCTDdnAeVCVlr8w09lyvMkMVshj5ags2RkJfuWW'),
(16, 'anfyienaklea@yahoo.com', '$2y$10$VxW52b9K9Z/BdTob4OZuv.mEdWaTUT/2g/xKFAzfGQh8SVOKDFad2'),
(17, 'Selena', '$2y$10$4MMb9hImQGjGkBtnkJjSueAjjxofvnHhrSlleYq0ExBeNR1Xv343e'),
(18, 'iota', '$2y$10$HSJP47xZ2qz53bqVCP9Rlun/U0LSwZwvP6RDSUYXlSt7q2fSTGLbO'),
(19, 'logar', '$2y$10$J4TZyiBivWr4oA76aI88Pu.6aswkKYbe2Xju.I50eblpRg7P2qL4m'),
(20, 'ehirojek657@gmail.com', '$2y$10$cQaedHPXnxK8VFUF0.5Q7.8OP7XP/dLCFBBKicGuRlKp36vmGlzFS'),
(21, 'gsiguerdox81@gmail.com', '$2y$10$uReP9V1h5S8k.BAiYpuTbe/X7c0UcJIUZ5J60x2DO1oHpr3Zh4ZrG'),
(22, 'cranerovana6@gmail.com', '$2y$10$31dFRSLiSoenupd4QyHbcO4Qxc2U5WqwSzWgVfffcRZFce3l7HP/e'),
(23, 'admin', '$2y$10$rsb6AR0W49uHlLAyHQWw1.4/Ttdedv6oD22RMvCbbDIqVaHG7m8Se'),
(24, 'murphy_becky815328@yahoo.com', '$2y$10$Le89cBl2RUP7dD/0M921Qu6117lOheEWcq2PLPM6KZH80.rEEM68S'),
(25, 'txt', '$2y$10$7wnQwCgHMI6aPepJ93w.V.1n9FlGE1R/ZfdJSBlke25qRl9DqFgb2'),
(26, 'toniwisezx31@gmail.com', '$2y$10$mjPx7rNeOiNneoiuNnDnSumbCOecG33ADS05HDdrmk2TlG6Rk5m0u'),
(27, 'lewis_tracy583825@yahoo.com', '$2y$10$d76k1KKgiAmJlnxcn2nH.eQNSRK3t6eryPzhMLu.0qbmuEXnerR9i'),
(28, 'leslibbf55@gmail.com', '$2y$10$MT0vUU7yIBD.lPgsQFI1S.SE0Z.A5qjsZPWrOuVrYjZ03yuBQHZVm'),
(29, 'pautz', '$2y$10$meaeTu3JxzkNKGC0GIE9..YNZ8Fbwvz5qvjm3BtrMS1ExHzhLmz4i');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cadastro_produto`
--
ALTER TABLE `cadastro_produto`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `imagens_produto`
--
ALTER TABLE `imagens_produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices de tabela `oil_levels`
--
ALTER TABLE `oil_levels`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hashTransacao` (`hashTransacao`),
  ADD KEY `resposta_id` (`resposta_id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`produto_id`);

--
-- Índices de tabela `radioterapia_cobalto_nic`
--
ALTER TABLE `radioterapia_cobalto_nic`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `registrointerno`
--
ALTER TABLE `registrointerno`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `registrointerno2`
--
ALTER TABLE `registrointerno2`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `respostas`
--
ALTER TABLE `respostas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `respostas2`
--
ALTER TABLE `respostas2`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `respostas3`
--
ALTER TABLE `respostas3`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `trator_oleo`
--
ALTER TABLE `trator_oleo`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cadastro_produto`
--
ALTER TABLE `cadastro_produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de tabela `imagens_produto`
--
ALTER TABLE `imagens_produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de tabela `oil_levels`
--
ALTER TABLE `oil_levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `produto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `radioterapia_cobalto_nic`
--
ALTER TABLE `radioterapia_cobalto_nic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `registrointerno`
--
ALTER TABLE `registrointerno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `registrointerno2`
--
ALTER TABLE `registrointerno2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `respostas`
--
ALTER TABLE `respostas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201722243;

--
-- AUTO_INCREMENT de tabela `respostas2`
--
ALTER TABLE `respostas2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `respostas3`
--
ALTER TABLE `respostas3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `trator_oleo`
--
ALTER TABLE `trator_oleo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `imagens_produto`
--
ALTER TABLE `imagens_produto`
  ADD CONSTRAINT `imagens_produto_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `cadastro_produto` (`id`);

--
-- Restrições para tabelas `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`resposta_id`) REFERENCES `respostas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
