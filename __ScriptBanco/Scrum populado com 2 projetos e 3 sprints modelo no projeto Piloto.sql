-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 19-Jun-2015 às 21:50
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `scrum`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `__migrationhistory`
--

CREATE TABLE IF NOT EXISTS `__migrationhistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8 NOT NULL,
  `ContextKey` varchar(300) CHARACTER SET utf8 NOT NULL,
  `Model` longblob NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoria`
--

CREATE TABLE IF NOT EXISTS `estoria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` longtext NOT NULL,
  `descricao` longtext NOT NULL,
  `pontosEstimados` int(11) NOT NULL,
  `dataInicio` datetime DEFAULT NULL,
  `dataConclusao` datetime DEFAULT NULL,
  `dataCriacao` datetime NOT NULL,
  `dataExclusao` datetime DEFAULT NULL,
  `foiExcluido` tinyint(1) NOT NULL,
  `idSprint` bigint(20) NOT NULL,
  `idStatus` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idSprint` (`idSprint`),
  KEY `idStatus` (`idStatus`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Extraindo dados da tabela `estoria`
--

INSERT INTO `estoria` (`id`, `titulo`, `descricao`, `pontosEstimados`, `dataInicio`, `dataConclusao`, `dataCriacao`, `dataExclusao`, `foiExcluido`, `idSprint`, `idStatus`) VALUES
(1, 'Aposentadoria', 'aposentadoria', 110, '2015-05-07 00:00:00', '2015-05-27 00:00:00', '2015-05-25 10:31:37', NULL, 0, 2, 1),
(2, 'SA: Substituição de cargos', 'SA: Substituição de cargos', 84, '2015-05-07 00:00:00', NULL, '2015-05-25 18:28:39', NULL, 0, 2, 1),
(3, 'SA: 23123 - Afastamento', 'SA: 23123 - Afastamento', 161, '2015-05-07 00:00:00', '2015-05-27 00:00:00', '2015-05-25 18:41:07', NULL, 0, 2, 1),
(4, 'SA: 23122 - Movimentações', 'SA: 23122 - Movimentações\r\n', 82, '2015-05-07 00:00:00', '2015-05-27 00:00:00', '2015-05-25 18:56:10', NULL, 0, 2, 1),
(5, 'Infraestrutura', 'Infraestrutura\r\n', 16, '2015-05-07 00:00:00', NULL, '2015-05-25 19:07:27', NULL, 0, 2, 1),
(6, 'Aposentadoria', 'aposentadoria', 110, '2015-05-07 00:00:00', '2015-05-27 00:00:00', '2015-05-25 10:31:37', NULL, 0, 3, 1),
(7, 'SA: Substituição de cargos', 'SA: Substituição de cargos', 84, '2015-05-07 00:00:00', NULL, '2015-05-25 18:28:39', NULL, 0, 3, 1),
(8, 'SA: 23123 - Afastamento', 'SA: 23123 - Afastamento', 161, '2015-05-07 00:00:00', '2015-05-27 00:00:00', '2015-05-25 18:41:07', NULL, 0, 3, 1),
(9, 'SA: 23122 - Movimentações', 'SA: 23122 - Movimentações\r\n', 82, '2015-05-07 00:00:00', '2015-05-27 00:00:00', '2015-05-25 18:56:10', NULL, 0, 3, 1),
(10, 'Infraestrutura', 'Infraestrutura\r\n', 16, '2015-05-07 00:00:00', NULL, '2015-05-25 19:07:27', NULL, 0, 3, 1),
(11, 'Aposentadoria', 'aposentadoria', 110, '2015-05-07 00:00:00', '2015-05-27 00:00:00', '2015-05-25 10:31:37', NULL, 0, 4, 1),
(12, 'SA: Substituição de cargos', 'SA: Substituição de cargos', 84, '2015-05-07 00:00:00', NULL, '2015-05-25 18:28:39', NULL, 0, 4, 1),
(13, 'SA: 23123 - Afastamento', 'SA: 23123 - Afastamento', 161, '2015-05-07 00:00:00', '2015-05-27 00:00:00', '2015-05-25 18:41:07', NULL, 0, 4, 1),
(14, 'SA: 23122 - Movimentações', 'SA: 23122 - Movimentações\r\n', 82, '2015-05-07 00:00:00', '2015-05-27 00:00:00', '2015-05-25 18:56:10', NULL, 0, 4, 1),
(15, 'Infraestrutura', 'Infraestrutura\r\n', 16, '2015-05-07 00:00:00', NULL, '2015-05-25 19:07:27', NULL, 0, 4, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `membrotime`
--

CREATE TABLE IF NOT EXISTS `membrotime` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dataCriacao` datetime NOT NULL,
  `dataExclusao` datetime DEFAULT NULL,
  `foiExcluido` tinyint(1) NOT NULL,
  `idPapel` bigint(20) NOT NULL,
  `idTime` bigint(20) NOT NULL,
  `nome` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idPapel` (`idPapel`),
  KEY `idTime` (`idTime`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `membrotime`
--

INSERT INTO `membrotime` (`id`, `dataCriacao`, `dataExclusao`, `foiExcluido`, `idPapel`, `idTime`, `nome`) VALUES
(1, '2015-05-25 10:35:25', NULL, 0, 3, 1, 'Daniel'),
(2, '2015-05-25 10:46:56', NULL, 0, 1, 1, 'Joao');

-- --------------------------------------------------------

--
-- Estrutura da tabela `papel`
--

CREATE TABLE IF NOT EXISTS `papel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` longtext NOT NULL,
  `descricao` longtext NOT NULL,
  `dataCriacao` datetime NOT NULL,
  `dataExclusao` datetime DEFAULT NULL,
  `foiExcluido` tinyint(1) NOT NULL,
  `idUsuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idUsuario` (`idUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `papel`
--

INSERT INTO `papel` (`id`, `titulo`, `descricao`, `dataCriacao`, `dataExclusao`, `foiExcluido`, `idUsuario`) VALUES
(1, 'Analista de Teste', 'Analista de Teste', '2015-05-25 10:33:32', NULL, 0, NULL),
(2, 'Analista de Requisitos', 'Analista de Requisitos', '2015-05-25 10:33:44', NULL, 0, NULL),
(3, 'Desenvolvedor', 'Desenvolvedor', '2015-05-25 10:33:57', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

CREATE TABLE IF NOT EXISTS `projeto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` longtext NOT NULL,
  `descricao` longtext NOT NULL,
  `dataCriacao` datetime NOT NULL,
  `dataExclusao` datetime DEFAULT NULL,
  `foiExcluido` tinyint(1) NOT NULL,
  `idUsuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idUsuario` (`idUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `projeto`
--

INSERT INTO `projeto` (`id`, `titulo`, `descricao`, `dataCriacao`, `dataExclusao`, `foiExcluido`, `idUsuario`) VALUES
(1, 'Piloto', 'descrição', '2015-05-22 10:05:47', NULL, 0, 1),
(2, 'Modelo 1', 'Projeto Modelo', '2015-06-19 08:46:04', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sprint`
--

CREATE TABLE IF NOT EXISTS `sprint` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` longtext NOT NULL,
  `descricao` longtext NOT NULL,
  `diasUteis` int(11) NOT NULL,
  `diasCerimonias` int(11) DEFAULT NULL,
  `horasTrabDia` time NOT NULL,
  `foco` int(11) NOT NULL,
  `dataInicio` datetime DEFAULT NULL,
  `dataConclusao` datetime DEFAULT NULL,
  `dataCriacao` datetime NOT NULL,
  `dataExclusao` datetime DEFAULT NULL,
  `foiExcluido` tinyint(1) NOT NULL,
  `idProjeto` bigint(20) NOT NULL,
  `idStatus` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idProjeto` (`idProjeto`),
  KEY `idStatus` (`idStatus`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `sprint`
--

INSERT INTO `sprint` (`id`, `titulo`, `descricao`, `diasUteis`, `diasCerimonias`, `horasTrabDia`, `foco`, `dataInicio`, `dataConclusao`, `dataCriacao`, `dataExclusao`, `foiExcluido`, `idProjeto`, `idStatus`) VALUES
(2, 'eSocial', 'esocial', 15, 2, '08:00:00', 70, '2015-05-07 00:00:00', '2015-05-27 00:00:00', '2015-05-25 10:29:04', NULL, 0, 1, 1),
(3, 'Exemplo 2 ', 'Sprint modelo 2', 15, 2, '08:00:00', 70, '2015-05-28 00:00:00', '2015-06-18 00:00:00', '2015-05-25 10:29:04', NULL, 0, 1, 1),
(4, 'Sprint Modelo 4', 'esocial', 15, 2, '08:00:00', 70, '2015-06-19 00:00:00', '2015-07-09 00:00:00', '2015-05-25 10:29:04', NULL, 0, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `idStatus` int(11) NOT NULL AUTO_INCREMENT,
  `status` longtext,
  PRIMARY KEY (`idStatus`),
  UNIQUE KEY `idStatus` (`idStatus`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `status`
--

INSERT INTO `status` (`idStatus`, `status`) VALUES
(1, 'Nova');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tarefa`
--

CREATE TABLE IF NOT EXISTS `tarefa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` longtext NOT NULL,
  `descricao` longtext NOT NULL,
  `horasEstimativa` time NOT NULL,
  `horasEfetiva` time DEFAULT NULL,
  `dataConclusao` datetime DEFAULT NULL,
  `obs` longtext,
  `dataInicio` datetime NOT NULL,
  `dataCriacao` datetime NOT NULL,
  `dataExclusao` datetime DEFAULT NULL,
  `foiExcluido` tinyint(1) NOT NULL,
  `idEstoria` bigint(20) NOT NULL,
  `idTipotarefa` bigint(20) NOT NULL,
  `idUsuarioPapelTime` bigint(20) DEFAULT NULL,
  `idStatus` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idEstoria` (`idEstoria`),
  KEY `idUsuarioPapelTime` (`idUsuarioPapelTime`),
  KEY `idStatus` (`idStatus`),
  KEY `idTipotarefa` (`idTipotarefa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=250 ;

--
-- Extraindo dados da tabela `tarefa`
--

INSERT INTO `tarefa` (`id`, `titulo`, `descricao`, `horasEstimativa`, `horasEfetiva`, `dataConclusao`, `obs`, `dataInicio`, `dataCriacao`, `dataExclusao`, `foiExcluido`, `idEstoria`, `idTipotarefa`, `idUsuarioPapelTime`, `idStatus`) VALUES
(1, 'Tela - 1						', 'Tela - 1						\r\n', '08:00:00', NULL, '2015-05-27 00:00:00', NULL, '2015-05-25 00:00:00', '2015-05-25 10:36:24', NULL, 0, 1, 1, 1, 1),
(2, 'Tela - 2				', 'Tela - 2', '08:00:00', NULL, '2015-05-08 00:00:00', NULL, '2015-05-25 00:00:00', '2015-05-25 10:43:47', NULL, 0, 1, 1, 1, 1),
(3, 'Tela -3				', 'Tela -3				', '08:00:00', NULL, '2015-06-10 00:00:00', NULL, '2015-05-25 00:00:00', '2015-05-25 10:44:34', NULL, 0, 1, 1, 1, 1),
(4, 'Tela - 4', 'Tela - 4', '08:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:45:02', NULL, 0, 1, 1, 1, 1),
(5, 'tela 5', 'tela 5', '08:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:45:28', NULL, 0, 1, 1, 1, 1),
(6, 'Tela de aterrissagem', 'Tela de aterrissagem\r\n', '02:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:47:22', NULL, 0, 1, 2, 2, 1),
(7, 'Atributos de informações de aposentadoria', 'Atributos de informações de aposentadoria\r\n', '02:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:48:20', NULL, 0, 1, 2, 2, 1),
(8, 'Atributos aplicar p/ outros contratos (Multicontratos)', 'Atributos aplicar p/ outros contratos (Multicontratos)\r\n', '02:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:48:52', NULL, 0, 1, 2, 2, 1),
(9, 'Atributos de Motivo anterior do afastamento', 'Atributos de Motivo anterior do afastamento\r\n', '02:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:49:38', NULL, 0, 1, 2, 2, 1),
(10, 'Atributos de Moléstia grave', 'Atributos de Moléstia grave\r\n', '02:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:50:25', NULL, 0, 1, 2, 2, 1),
(11, 'Cadastro de aposentadoria (Simples)', 'Cadastro de aposentadoria (Simples)\r\n', '02:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:50:54', NULL, 0, 1, 2, 2, 1),
(12, 'Cadastro de aposentadoria (Simples c/ multicont.)', 'Cadastro de aposentadoria (Simples c/ multicont.)\r\n', '03:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:51:21', NULL, 0, 1, 2, 2, 1),
(13, 'Cadastro de aposentadoria (Moléstia grave)', 'Cadastro de aposentadoria (Moléstia grave)\r\n', '03:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:51:55', NULL, 0, 1, 1, 2, 1),
(14, 'Cad. Aposent. (Molést. grave c/ Alter. motivo afast.)', 'Cad. Aposent. (Molést. grave c/ Alter. motivo afast.)\r\n', '06:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:52:21', NULL, 0, 1, 2, 2, 1),
(15, 'Cad. Aposent. (Molést. grave c/ Alter. motivo afast. E Multicont.)', 'Cad. Aposent. (Molést. grave c/ Alter. motivo afast. E Multicont.)\r\n', '08:00:00', NULL, NULL, NULL, '2015-05-25 00:00:00', '2015-05-25 10:52:51', NULL, 0, 1, 2, 2, 1),
(16, 'Cad. Aposentadoria (Alter. motivo afastamento)', 'Cad. Aposentadoria (Alter. motivo afastamento)\r\n', '05:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:53:15', NULL, 0, 1, 2, 2, 1),
(17, 'Anexos', 'Anexos\r\n', '02:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:54:00', NULL, 0, 1, 2, 2, 1),
(18, 'Ret - Implementação						', 'Ret - Implementação						', '08:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:57:59', NULL, 0, 1, 3, 1, 1),
(19, 'Ret - Implementação						', 'Ret - Implementação						', '08:00:00', NULL, NULL, NULL, '2015-05-25 00:00:00', '2015-05-25 10:58:21', NULL, 0, 1, 4, 1, 1),
(20, 'Ret - Testes - 1						', 'Ret - Testes - 1						', '08:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:58:53', NULL, 0, 1, 4, 2, 1),
(21, 'Ret - Testes - 2						', 'Ret - Testes - 2						', '08:00:00', NULL, NULL, NULL, '2015-05-25 00:00:00', '2015-05-25 10:59:26', NULL, 0, 1, 4, 2, 1),
(22, 'Ret - Requisitos						', 'Ret - Requisitos						', '05:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 11:00:02', NULL, 0, 1, 4, 2, 1),
(23, 'Tela de aterrissagem', 'Tela de aterrissagem\r\n', '03:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:31:05', NULL, 0, 2, 2, 2, 1),
(24, 'Atributos informações subs. De cargos.', 'Atributos informações subs. De cargos.\r\n', '03:30:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:32:53', NULL, 0, 2, 2, 2, 1),
(25, 'Atributos Dados do colab. Substituto', 'Atributos Dados do colab. Substituto\r\n', '02:30:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:33:54', NULL, 0, 2, 2, 2, 1),
(26, 'Atrib. Dados da substituição (substituído e Cargo)', 'Atrib. Dados da substituição (substituído e Cargo)\r\n', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:34:22', NULL, 0, 2, 2, 2, 1),
(27, 'Atributos Valores base p/ gratificação', 'Atributos Valores base p/ gratificação\r\n', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:34:56', NULL, 0, 2, 2, 2, 1),
(28, 'Cadastro por Substituição – 1', 'Cadastro por Substituição – 1\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:35:21', NULL, 0, 1, 2, 2, 1),
(29, 'Cadastro por Substituição – 2', 'Cadastro por Substituição – 2\r\n', '07:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:35:48', NULL, 0, 2, 2, 2, 1),
(30, 'Cadastro por Avaliação – 1', 'Cadastro por Avaliação – 1\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:36:11', NULL, 0, 2, 2, 2, 1),
(31, 'Cadastro por Avaliação – 2', 'Cadastro por Avaliação – 2\r\n', '07:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:36:35', NULL, 0, 2, 2, 2, 1),
(32, 'Anexos', 'Anexos\r\n', '02:30:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:37:10', NULL, 0, 2, 2, 2, 1),
(33, 'Ret - Requisitos', 'Ret - Requisitos\r\n', '02:30:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:38:08', NULL, 0, 2, 4, 2, 1),
(34, 'Ret - Implementação - 1', 'Ret - Implementação - 1\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:39:16', NULL, 0, 2, 4, 1, 1),
(35, 'Ret - Implementação - 2', 'Ret - Implementação - 2\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:39:39', NULL, 0, 2, 4, 1, 1),
(36, 'Ret - Testes - 1						', 'Ret - Testes - 1\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:40:07', NULL, 0, 2, 4, 2, 1),
(37, 'Ret - Testes - 2', 'Ret - Testes - 2', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:40:27', NULL, 0, 2, 4, 2, 1),
(38, 'Banco						', 'Banco						\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:42:01', NULL, 0, 3, 1, 1, 1),
(39, 'Objeto						', 'Objeto						\r\n', '06:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:42:28', NULL, 0, 3, 1, 1, 1),
(40, 'Repositorio						', 'Repositorio						', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:42:48', NULL, 0, 2, 1, 1, 1),
(41, 'Validações - 1						', 'Validações -', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:43:22', NULL, 0, 3, 1, 1, 1),
(42, 'Validações - 2', 'Validações - ', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:43:47', NULL, 0, 3, 1, 1, 1),
(43, 'Validações - 3', 'Validações - ', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:44:12', NULL, 0, 3, 1, 1, 1),
(44, 'Validações - 4', 'Validações - ', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:44:37', NULL, 0, 3, 1, 1, 1),
(45, 'Validações - 5', 'Validações - ', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:44:56', NULL, 0, 3, 1, 1, 1),
(46, 'Conversor - 1						', 'Conversor - 1						', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:45:14', NULL, 0, 3, 1, 1, 1),
(47, 'Conversor - 2', 'Conversor - 1						', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:45:31', NULL, 0, 3, 1, 1, 1),
(48, 'Serviço - 1						', 'Serviço - 1						', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:45:50', NULL, 0, 3, 1, 1, 1),
(49, 'Serviço - 2', 'Serviço - 2', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:46:13', NULL, 0, 3, 1, 1, 1),
(50, 'Tela - 1						', 'Tela - 1						\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:47:06', NULL, 0, 3, 1, 1, 1),
(51, 'TEla - 2', 'Tela - 2', '08:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:52:01', NULL, 0, 3, 1, 1, 1),
(52, 'TEla - 3', 'Tela - 2', '08:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:52:21', NULL, 0, 3, 1, 1, 1),
(53, 'TEla - 4', 'Tela - 2', '08:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:52:25', NULL, 0, 3, 1, 1, 1),
(54, 'TEla - 5', 'Tela - 2', '08:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:52:29', NULL, 0, 3, 1, 1, 1),
(55, 'TEla - 6', 'Tela - 2', '08:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:52:32', NULL, 0, 3, 1, 1, 1),
(56, 'Ajustar Validações de Estabilidade						\n', 'Tela - 2', '02:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:52:54', NULL, 0, 3, 1, 1, 1),
(57, '\nCriar campos em Configurações por Empresa					\n\n', 'Tela - 2', '08:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:53:35', NULL, 0, 3, 1, 1, 1),
(58, '\nRevisão de CT						\n				\n\n', 'Tela - 2', '02:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:54:25', NULL, 0, 3, 1, 1, 1),
(59, '\nEspecificação de CTs						\n					\n				\n\n', 'Tela - 2', '05:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:55:06', NULL, 0, 3, 1, 1, 1),
(60, '\nRET - Requisitos 						\n						\n					\n				\n\n', 'Tela - 2', '06:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:55:26', NULL, 0, 3, 1, 1, 1),
(61, '\nRET - Casos de Testes						\n\n', 'Tela - 2', '04:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:55:39', NULL, 0, 3, 1, 1, 1),
(62, 'Atualização do requisito de Perfil						', 'Atualização do requisito de Perfil						', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:00:31', NULL, 0, 4, 3, 1, 1),
(63, 'Impactos no requisito de Motivo						', 'Impactos no requisito de Motivo						', '02:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:00:54', NULL, 0, 4, 3, 1, 1),
(64, 'Finalizar Conceitos Contratuais Básicos - Atributos', 'Finalizar Conceitos Contratuais Básicos - Atributos\r\n', '02:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:01:18', NULL, 0, 4, 3, 1, 1),
(65, 'Finalizar Conceitos Contratuais Básicos - Regras', 'Finalizar Conceitos Contratuais Básicos - Regras\r\n', '06:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:01:48', NULL, 0, 4, 3, 1, 1),
(66, 'Cargo Efetivo + Salário', 'Cargo Efetivo + Salário\r\n', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:02:14', NULL, 0, 4, 3, 1, 1),
(67, 'Função Efetiva + Salário', 'Função Efetiva + Salário\r\n', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:02:36', NULL, 0, 4, 3, 1, 1),
(68, 'Cargo Comissionado + Salário', 'Cargo Comissionado + Salário\r\n', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:02:59', NULL, 0, 4, 3, 1, 1),
(69, 'Função Comissionada + Salário', 'Função Comissionada + Salário\r\n', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:03:34', NULL, 0, 4, 3, 1, 1),
(70, 'Cargo Efetivo + Tabela', 'Cargo Efetivo + Tabela\r\n', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:03:55', NULL, 0, 4, 3, 1, 1),
(71, 'Função Efetiva + Tabela', 'Função Efetiva + Tabela\r\n', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:04:17', NULL, 0, 4, 3, 1, 1),
(72, 'Cargo Comissionado + Tabela', 'Cargo Comissionado + Tabela\r\n', '04:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 19:04:36', NULL, 0, 4, 3, 1, 1),
(73, 'Função Comissionada + Tabela', 'Função Comissionada + Tabela\r\n', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:04:55', NULL, 0, 4, 3, 1, 1),
(74, 'Revisão de conceitos relacionados a POSIÇÃO						', 'Revisão de conceitos relacionados a POSIÇÃO						\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:05:17', NULL, 0, 4, 3, 1, 1),
(75, 'Levantamento de Regras de Movimentação Entre Empresas - 1', 'Levantamento de Regras de Movimentação Entre Empresas - 1\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:05:42', NULL, 0, 4, 3, 1, 1),
(76, 'Levantamento de Regras de Movimentação Entre Empresas - 2', 'Levantamento de Regras de Movimentação Entre Empresas - 2\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:06:04', NULL, 0, 4, 3, 1, 1),
(77, 'Levantamento de Regras de Movimentação Entre Empresas - 3', 'Levantamento de Regras de Movimentação Entre Empresas - 3\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:06:20', NULL, 0, 4, 3, 1, 1),
(78, 'GCS - 1\n', 'GCS', '02:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 19:09:18', NULL, 0, 5, 1, 1, 1),
(79, 'GCS - 2\n', 'GCS', '02:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 19:09:27', NULL, 0, 5, 1, 1, 1),
(80, 'GCS - 3\n', 'GCS', '02:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 19:09:30', NULL, 0, 5, 1, 1, 1),
(81, 'GCS - 4\n', 'GCS', '02:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 19:09:33', NULL, 0, 5, 1, 1, 1),
(82, 'GCS - 5\n', 'GCS', '02:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 19:09:34', NULL, 0, 5, 1, 1, 1),
(83, 'GCS - 6\n', 'GCS', '02:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 19:09:36', NULL, 0, 5, 1, 1, 1),
(84, 'Tela - 1						', 'Tela - 1						\r\n', '08:00:00', NULL, '2015-05-29 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:36:24', NULL, 0, 6, 1, 1, 1),
(85, 'Tela - 2				', 'Tela - 2', '08:00:00', NULL, '2015-05-29 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:43:47', NULL, 0, 6, 1, 1, 1),
(86, 'Tela -3				', 'Tela -3				', '08:00:00', NULL, '2015-05-29 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:44:34', NULL, 0, 6, 1, 1, 1),
(87, 'Tela - 4', 'Tela - 4', '08:00:00', NULL, '2015-05-29 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:45:02', NULL, 0, 6, 1, 1, 1),
(88, 'tela 5', 'tela 5', '08:00:00', NULL, '2015-05-30 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:45:28', NULL, 0, 6, 1, 1, 1),
(89, 'Tela de aterrissagem', 'Tela de aterrissagem\r\n', '02:00:00', NULL, '2015-05-30 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:47:22', NULL, 0, 6, 2, 2, 1),
(90, 'Atributos de informações de aposentadoria', 'Atributos de informações de aposentadoria\r\n', '02:00:00', NULL, '2015-05-30 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:48:20', NULL, 0, 6, 2, 2, 1),
(91, 'Atributos aplicar p/ outros contratos (Multicontratos)', 'Atributos aplicar p/ outros contratos (Multicontratos)\r\n', '02:00:00', NULL, '2015-05-30 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:48:52', NULL, 0, 6, 2, 2, 1),
(92, 'Atributos de Motivo anterior do afastamento', 'Atributos de Motivo anterior do afastamento\r\n', '02:00:00', NULL, '2015-05-30 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:49:38', NULL, 0, 6, 2, 2, 1),
(93, 'Atributos de Moléstia grave', 'Atributos de Moléstia grave\r\n', '02:00:00', NULL, '2015-05-30 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:50:25', NULL, 0, 6, 2, 2, 1),
(94, 'Cadastro de aposentadoria (Simples)', 'Cadastro de aposentadoria (Simples)\r\n', '02:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:50:54', NULL, 0, 6, 2, 2, 1),
(95, 'Cadastro de aposentadoria (Simples c/ multicont.)', 'Cadastro de aposentadoria (Simples c/ multicont.)\r\n', '03:00:00', NULL, '2015-06-01 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:51:21', NULL, 0, 6, 2, 2, 1),
(96, 'Cadastro de aposentadoria (Moléstia grave)', 'Cadastro de aposentadoria (Moléstia grave)\r\n', '03:00:00', NULL, '2015-06-01 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:51:55', NULL, 0, 6, 1, 2, 1),
(97, 'Cad. Aposent. (Molést. grave c/ Alter. motivo afast.)', 'Cad. Aposent. (Molést. grave c/ Alter. motivo afast.)\r\n', '06:00:00', NULL, '2015-06-01 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:52:21', NULL, 0, 6, 2, 2, 1),
(98, 'Cad. Aposent. (Molést. grave c/ Alter. motivo afast. E Multicont.)', 'Cad. Aposent. (Molést. grave c/ Alter. motivo afast. E Multicont.)\r\n', '08:00:00', NULL, '2015-06-01 00:00:00', NULL, '2015-05-25 00:00:00', '2015-05-25 10:52:51', NULL, 0, 6, 2, 2, 1),
(99, 'Cad. Aposentadoria (Alter. motivo afastamento)', 'Cad. Aposentadoria (Alter. motivo afastamento)\r\n', '05:00:00', NULL, '2015-06-01 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:53:15', NULL, 0, 6, 2, 2, 1),
(100, 'Anexos', 'Anexos\r\n', '02:00:00', NULL, '2015-06-02 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:54:00', NULL, 0, 6, 2, 2, 1),
(101, 'Ret - Implementação						', 'Ret - Implementação						', '08:00:00', NULL, '2015-06-02 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:57:59', NULL, 0, 6, 3, 1, 1),
(102, 'Ret - Implementação						', 'Ret - Implementação						', '08:00:00', NULL, '2015-06-02 00:00:00', NULL, '2015-05-25 00:00:00', '2015-05-25 10:58:21', NULL, 0, 6, 4, 1, 1),
(103, 'Ret - Testes - 1						', 'Ret - Testes - 1						', '08:00:00', NULL, '2015-06-02 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:58:53', NULL, 0, 6, 4, 2, 1),
(104, 'Ret - Testes - 2						', 'Ret - Testes - 2						', '08:00:00', NULL, '2015-06-02 00:00:00', NULL, '2015-05-25 00:00:00', '2015-05-25 10:59:26', NULL, 0, 6, 4, 2, 1),
(105, 'Ret - Requisitos						', 'Ret - Requisitos						', '05:00:00', NULL, '2015-06-02 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 11:00:02', NULL, 0, 6, 4, 2, 1),
(106, 'Tela de aterrissagem', 'Tela de aterrissagem\r\n', '03:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:31:05', NULL, 0, 7, 2, 2, 1),
(107, 'Atributos informações subs. De cargos.', 'Atributos informações subs. De cargos.\r\n', '03:30:00', NULL, '2015-06-03 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:32:53', NULL, 0, 7, 2, 2, 1),
(108, 'Atributos Dados do colab. Substituto', 'Atributos Dados do colab. Substituto\r\n', '02:30:00', NULL, '2015-06-03 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:33:54', NULL, 0, 7, 2, 2, 1),
(109, 'Atrib. Dados da substituição (substituído e Cargo)', 'Atrib. Dados da substituição (substituído e Cargo)\r\n', '04:00:00', NULL, '2015-06-03 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:34:22', NULL, 0, 7, 2, 2, 1),
(110, 'Atributos Valores base p/ gratificação', 'Atributos Valores base p/ gratificação\r\n', '04:00:00', NULL, '2015-06-03 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:34:56', NULL, 0, 7, 2, 2, 1),
(111, 'Cadastro por Substituição – 1', 'Cadastro por Substituição – 1\r\n', '08:00:00', NULL, '2015-06-03 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:35:21', NULL, 0, 6, 2, 2, 1),
(112, 'Cadastro por Substituição – 2', 'Cadastro por Substituição – 2\r\n', '07:00:00', NULL, '2015-06-04 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:35:48', NULL, 0, 7, 2, 2, 1),
(113, 'Cadastro por Avaliação – 1', 'Cadastro por Avaliação – 1\r\n', '08:00:00', NULL, '2015-06-04 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:36:11', NULL, 0, 7, 2, 2, 1),
(114, 'Cadastro por Avaliação – 2', 'Cadastro por Avaliação – 2\r\n', '07:00:00', NULL, '2015-06-04 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:36:35', NULL, 0, 7, 2, 2, 1),
(115, 'Anexos', 'Anexos\r\n', '02:30:00', NULL, '2015-06-04 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:37:10', NULL, 0, 7, 2, 2, 1),
(116, 'Ret - Requisitos', 'Ret - Requisitos\r\n', '02:30:00', NULL, '2015-06-04 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:38:08', NULL, 0, 7, 4, 2, 1),
(117, 'Ret - Implementação - 1', 'Ret - Implementação - 1\r\n', '08:00:00', NULL, '2015-06-04 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:39:16', NULL, 0, 7, 4, 1, 1),
(118, 'Ret - Implementação - 2', 'Ret - Implementação - 2\r\n', '08:00:00', NULL, '2015-06-04 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:39:39', NULL, 0, 7, 4, 1, 1),
(119, 'Ret - Testes - 1						', 'Ret - Testes - 1\r\n', '08:00:00', NULL, '2015-06-05 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:40:07', NULL, 0, 7, 4, 2, 1),
(120, 'Ret - Testes - 2', 'Ret - Testes - 2', '08:00:00', NULL, '2015-06-05 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:40:27', NULL, 0, 7, 4, 2, 1),
(121, 'Banco						', 'Banco						\r\n', '08:00:00', NULL, '2015-06-05 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:42:01', NULL, 0, 8, 1, 1, 1),
(122, 'Objeto						', 'Objeto						\r\n', '06:00:00', NULL, '2015-06-05 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:42:28', NULL, 0, 8, 1, 1, 1),
(123, 'Repositorio						', 'Repositorio						', '04:00:00', NULL, '2015-06-05 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:42:48', NULL, 0, 7, 1, 1, 1),
(124, 'Validações - 1						', 'Validações -', '08:00:00', NULL, '2015-06-05 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:43:22', NULL, 0, 8, 1, 1, 1),
(125, 'Validações - 2', 'Validações - ', '08:00:00', NULL, '2015-06-05 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:43:47', NULL, 0, 8, 1, 1, 1),
(126, 'Validações - 3', 'Validações - ', '08:00:00', NULL, '2015-06-06 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:44:12', NULL, 0, 8, 1, 1, 1),
(127, 'Validações - 4', 'Validações - ', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:44:37', NULL, 0, 8, 1, 1, 1),
(128, 'Validações - 5', 'Validações - ', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:44:56', NULL, 0, 8, 1, 1, 1),
(129, 'Conversor - 1						', 'Conversor - 1						', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:45:14', NULL, 0, 8, 1, 1, 1),
(130, 'Conversor - 2', 'Conversor - 1						', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:45:31', NULL, 0, 8, 1, 1, 1),
(131, 'Serviço - 1						', 'Serviço - 1						', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:45:50', NULL, 0, 8, 1, 1, 1),
(132, 'Serviço - 2', 'Serviço - 2', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:46:13', NULL, 0, 8, 1, 1, 1),
(133, 'Tela - 1						', 'Tela - 1						\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:47:06', NULL, 0, 8, 1, 1, 1),
(134, 'TEla - 2', 'Tela - 2', '08:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:52:01', NULL, 0, 8, 1, 1, 1),
(135, 'TEla - 3', 'Tela - 2', '08:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:52:21', NULL, 0, 8, 1, 1, 1),
(136, 'TEla - 4', 'Tela - 2', '08:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:52:25', NULL, 0, 8, 1, 1, 1),
(137, 'TEla - 5', 'Tela - 2', '08:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:52:29', NULL, 0, 8, 1, 1, 1),
(138, 'TEla - 6', 'Tela - 2', '08:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:52:32', NULL, 0, 8, 1, 1, 1),
(139, 'Ajustar Validações de Estabilidade						\n', 'Tela - 2', '02:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:52:54', NULL, 0, 8, 1, 1, 1),
(140, '\nCriar campos em Configurações por Empresa					\n\n', 'Tela - 2', '08:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:53:35', NULL, 0, 8, 1, 1, 1),
(141, '\nRevisão de CT						\n				\n\n', 'Tela - 2', '02:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:54:25', NULL, 0, 8, 1, 1, 1),
(142, '\nEspecificação de CTs						\n					\n				\n\n', 'Tela - 2', '05:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:55:06', NULL, 0, 8, 1, 1, 1),
(143, '\nRET - Requisitos 						\n						\n					\n				\n\n', 'Tela - 2', '06:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:55:26', NULL, 0, 8, 1, 1, 1),
(144, '\nRET - Casos de Testes						\n\n', 'Tela - 2', '04:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:55:39', NULL, 0, 8, 1, 1, 1),
(145, 'Atualização do requisito de Perfil						', 'Atualização do requisito de Perfil						', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:00:31', NULL, 0, 9, 3, 1, 1),
(146, 'Impactos no requisito de Motivo						', 'Impactos no requisito de Motivo						', '02:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:00:54', NULL, 0, 9, 3, 1, 1),
(147, 'Finalizar Conceitos Contratuais Básicos - Atributos', 'Finalizar Conceitos Contratuais Básicos - Atributos\r\n', '02:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:01:18', NULL, 0, 9, 3, 1, 1),
(148, 'Finalizar Conceitos Contratuais Básicos - Regras', 'Finalizar Conceitos Contratuais Básicos - Regras\r\n', '06:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:01:48', NULL, 0, 9, 3, 1, 1),
(149, 'Cargo Efetivo + Salário', 'Cargo Efetivo + Salário\r\n', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:02:14', NULL, 0, 9, 3, 1, 1),
(150, 'Função Efetiva + Salário', 'Função Efetiva + Salário\r\n', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:02:36', NULL, 0, 9, 3, 1, 1),
(151, 'Cargo Comissionado + Salário', 'Cargo Comissionado + Salário\r\n', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:02:59', NULL, 0, 9, 3, 1, 1),
(152, 'Função Comissionada + Salário', 'Função Comissionada + Salário\r\n', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:03:34', NULL, 0, 9, 3, 1, 1),
(153, 'Cargo Efetivo + Tabela', 'Cargo Efetivo + Tabela\r\n', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:03:55', NULL, 0, 9, 3, 1, 1),
(154, 'Função Efetiva + Tabela', 'Função Efetiva + Tabela\r\n', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:04:17', NULL, 0, 9, 3, 1, 1),
(155, 'Cargo Comissionado + Tabela', 'Cargo Comissionado + Tabela\r\n', '04:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 19:04:36', NULL, 0, 9, 3, 1, 1),
(156, 'Função Comissionada + Tabela', 'Função Comissionada + Tabela\r\n', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:04:55', NULL, 0, 9, 3, 1, 1),
(157, 'Revisão de conceitos relacionados a POSIÇÃO						', 'Revisão de conceitos relacionados a POSIÇÃO						\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:05:17', NULL, 0, 9, 3, 1, 1),
(158, 'Levantamento de Regras de Movimentação Entre Empresas - 1', 'Levantamento de Regras de Movimentação Entre Empresas - 1\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:05:42', NULL, 0, 9, 3, 1, 1),
(159, 'Levantamento de Regras de Movimentação Entre Empresas - 2', 'Levantamento de Regras de Movimentação Entre Empresas - 2\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:06:04', NULL, 0, 9, 3, 1, 1),
(160, 'Levantamento de Regras de Movimentação Entre Empresas - 3', 'Levantamento de Regras de Movimentação Entre Empresas - 3\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:06:20', NULL, 0, 9, 3, 1, 1),
(161, 'GCS - 1\n', 'GCS', '02:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 19:09:18', NULL, 0, 10, 1, 1, 1),
(162, 'GCS - 2\n', 'GCS', '02:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 19:09:27', NULL, 0, 10, 1, 1, 1),
(163, 'GCS - 3\n', 'GCS', '02:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 19:09:30', NULL, 0, 10, 1, 1, 1),
(164, 'GCS - 4\n', 'GCS', '02:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 19:09:33', NULL, 0, 10, 1, 1, 1),
(165, 'GCS - 5\n', 'GCS', '02:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 19:09:34', NULL, 0, 10, 1, 1, 1),
(166, 'GCS - 6\n', 'GCS', '02:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 19:09:36', NULL, 0, 10, 1, 1, 1),
(167, 'Tela - 1						', 'Tela - 1						\r\n', '08:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:36:24', NULL, 0, 11, 1, 1, 1),
(168, 'Tela - 2				', 'Tela - 2', '08:00:00', NULL, '2015-06-20 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:43:47', NULL, 0, 11, 1, 1, 1),
(169, 'Tela -3				', 'Tela -3				', '08:00:00', NULL, '2015-06-20 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:44:34', NULL, 0, 11, 1, 1, 1),
(170, 'Tela - 4', 'Tela - 4', '08:00:00', NULL, '2015-06-20 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:45:02', NULL, 0, 11, 1, 1, 1),
(171, 'tela 5', 'tela 5', '08:00:00', NULL, '2015-06-20 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:45:28', NULL, 0, 11, 1, 1, 1),
(172, 'Tela de aterrissagem', 'Tela de aterrissagem\r\n', '02:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:47:22', NULL, 0, 11, 2, 2, 1),
(173, 'Atributos de informações de aposentadoria', 'Atributos de informações de aposentadoria\r\n', '02:00:00', NULL, '2015-06-21 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:48:20', NULL, 0, 11, 2, 2, 1),
(174, 'Atributos aplicar p/ outros contratos (Multicontratos)', 'Atributos aplicar p/ outros contratos (Multicontratos)\r\n', '02:00:00', NULL, '2015-06-21 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:48:52', NULL, 0, 11, 2, 2, 1),
(175, 'Atributos de Motivo anterior do afastamento', 'Atributos de Motivo anterior do afastamento\r\n', '02:00:00', NULL, '2015-06-21 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:49:38', NULL, 0, 11, 2, 2, 1),
(176, 'Atributos de Moléstia grave', 'Atributos de Moléstia grave\r\n', '02:00:00', NULL, '2015-06-21 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:50:25', NULL, 0, 11, 2, 2, 1),
(177, 'Cadastro de aposentadoria (Simples)', 'Cadastro de aposentadoria (Simples)\r\n', '02:00:00', NULL, '2015-06-21 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:50:54', NULL, 0, 11, 2, 2, 1),
(178, 'Cadastro de aposentadoria (Simples c/ multicont.)', 'Cadastro de aposentadoria (Simples c/ multicont.)\r\n', '03:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:51:21', NULL, 0, 11, 2, 2, 1),
(179, 'Cadastro de aposentadoria (Moléstia grave)', 'Cadastro de aposentadoria (Moléstia grave)\r\n', '03:00:00', NULL, '2015-06-22 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:51:55', NULL, 0, 11, 1, 2, 1),
(180, 'Cad. Aposent. (Molést. grave c/ Alter. motivo afast.)', 'Cad. Aposent. (Molést. grave c/ Alter. motivo afast.)\r\n', '06:00:00', NULL, '2015-06-22 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:52:21', NULL, 0, 11, 2, 2, 1),
(181, 'Cad. Aposent. (Molést. grave c/ Alter. motivo afast. E Multicont.)', 'Cad. Aposent. (Molést. grave c/ Alter. motivo afast. E Multicont.)\r\n', '08:00:00', NULL, '2015-06-22 00:00:00', NULL, '2015-05-25 00:00:00', '2015-05-25 10:52:51', NULL, 0, 11, 2, 2, 1),
(182, 'Cad. Aposentadoria (Alter. motivo afastamento)', 'Cad. Aposentadoria (Alter. motivo afastamento)\r\n', '05:00:00', NULL, '2015-06-22 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:53:15', NULL, 0, 11, 2, 2, 1),
(183, 'Anexos', 'Anexos\r\n', '02:00:00', NULL, '2015-06-22 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:54:00', NULL, 0, 11, 2, 2, 1),
(184, 'Ret - Implementação						', 'Ret - Implementação						', '08:00:00', NULL, '2015-06-22 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 10:57:59', NULL, 0, 11, 3, 1, 1),
(185, 'Ret - Implementação						', 'Ret - Implementação						', '08:00:00', NULL, '2015-06-22 00:00:00', NULL, '2015-05-25 00:00:00', '2015-05-25 10:58:21', NULL, 0, 11, 4, 1, 1),
(186, 'Ret - Testes - 1						', 'Ret - Testes - 1						', '08:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 10:58:53', NULL, 0, 11, 4, 2, 1),
(187, 'Ret - Testes - 2						', 'Ret - Testes - 2						', '08:00:00', NULL, '2015-06-23 00:00:00', NULL, '2015-05-25 00:00:00', '2015-05-25 10:59:26', NULL, 0, 11, 4, 2, 1),
(188, 'Ret - Requisitos						', 'Ret - Requisitos						', '05:00:00', NULL, '2015-06-23 00:00:00', '', '2015-05-25 00:00:00', '2015-05-25 11:00:02', NULL, 0, 11, 4, 2, 1),
(189, 'Tela de aterrissagem', 'Tela de aterrissagem\r\n', '03:00:00', NULL, '2015-06-23 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:31:05', NULL, 0, 12, 2, 2, 1),
(190, 'Atributos informações subs. De cargos.', 'Atributos informações subs. De cargos.\r\n', '03:30:00', NULL, '2015-06-23 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:32:53', NULL, 0, 12, 2, 2, 1),
(191, 'Atributos Dados do colab. Substituto', 'Atributos Dados do colab. Substituto\r\n', '02:30:00', NULL, '2015-06-23 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:33:54', NULL, 0, 12, 2, 2, 1),
(192, 'Atrib. Dados da substituição (substituído e Cargo)', 'Atrib. Dados da substituição (substituído e Cargo)\r\n', '04:00:00', NULL, '2015-06-23 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:34:22', NULL, 0, 12, 2, 2, 1),
(193, 'Atributos Valores base p/ gratificação', 'Atributos Valores base p/ gratificação\r\n', '04:00:00', NULL, '2015-06-23 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:34:56', NULL, 0, 12, 2, 2, 1),
(194, 'Cadastro por Substituição – 1', 'Cadastro por Substituição – 1\r\n', '08:00:00', NULL, '2015-06-24 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:35:21', NULL, 0, 11, 2, 2, 1),
(195, 'Cadastro por Substituição – 2', 'Cadastro por Substituição – 2\r\n', '07:00:00', NULL, '2015-06-24 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:35:48', NULL, 0, 12, 2, 2, 1),
(196, 'Cadastro por Avaliação – 1', 'Cadastro por Avaliação – 1\r\n', '08:00:00', NULL, '2015-06-24 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:36:11', NULL, 0, 12, 2, 2, 1),
(197, 'Cadastro por Avaliação – 2', 'Cadastro por Avaliação – 2\r\n', '07:00:00', NULL, '2015-06-24 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:36:35', NULL, 0, 12, 2, 2, 1),
(198, 'Anexos', 'Anexos\r\n', '02:30:00', NULL, '2015-06-24 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:37:10', NULL, 0, 12, 2, 2, 1),
(199, 'Ret - Requisitos', 'Ret - Requisitos\r\n', '02:30:00', NULL, '2015-06-24 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:38:08', NULL, 0, 12, 4, 2, 1),
(200, 'Ret - Implementação - 1', 'Ret - Implementação - 1\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:39:16', NULL, 0, 12, 4, 1, 1),
(201, 'Ret - Implementação - 2', 'Ret - Implementação - 2\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:39:39', NULL, 0, 12, 4, 1, 1),
(202, 'Ret - Testes - 1						', 'Ret - Testes - 1\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:40:07', NULL, 0, 12, 4, 2, 1),
(203, 'Ret - Testes - 2', 'Ret - Testes - 2', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:40:27', NULL, 0, 12, 4, 2, 1),
(204, 'Banco						', 'Banco						\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:42:01', NULL, 0, 13, 1, 1, 1),
(205, 'Objeto						', 'Objeto						\r\n', '06:00:00', NULL, '2015-06-26 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:42:28', NULL, 0, 13, 1, 1, 1),
(206, 'Repositorio						', 'Repositorio						', '04:00:00', NULL, '2015-06-26 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:42:48', NULL, 0, 12, 1, 1, 1),
(207, 'Validações - 1						', 'Validações -', '08:00:00', NULL, '2015-06-26 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:43:22', NULL, 0, 13, 1, 1, 1),
(208, 'Validações - 2', 'Validações - ', '08:00:00', NULL, '2015-06-26 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:43:47', NULL, 0, 13, 1, 1, 1),
(209, 'Validações - 3', 'Validações - ', '08:00:00', NULL, '2015-06-26 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:44:12', NULL, 0, 13, 1, 1, 1),
(210, 'Validações - 4', 'Validações - ', '08:00:00', NULL, '2015-06-29 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:44:37', NULL, 0, 13, 1, 1, 1),
(211, 'Validações - 5', 'Validações - ', '08:00:00', NULL, '2015-06-29 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:44:56', NULL, 0, 13, 1, 1, 1),
(212, 'Conversor - 1						', 'Conversor - 1						', '08:00:00', NULL, '2015-06-29 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:45:14', NULL, 0, 13, 1, 1, 1),
(213, 'Conversor - 2', 'Conversor - 1						', '08:00:00', NULL, '2015-06-29 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:45:31', NULL, 0, 13, 1, 1, 1),
(214, 'Serviço - 1						', 'Serviço - 1						', '08:00:00', NULL, '2015-06-29 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:45:50', NULL, 0, 13, 1, 1, 1),
(215, 'Serviço - 2', 'Serviço - 2', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 18:46:13', NULL, 0, 13, 1, 1, 1),
(216, 'Tela - 1						', 'Tela - 1						\r\n', '08:00:00', NULL, '2015-06-30 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 18:47:06', NULL, 0, 13, 1, 1, 1),
(217, 'TEla - 2', 'Tela - 2', '08:00:00', NULL, '2015-06-30 00:00:00', NULL, '2015-05-07 00:00:00', '2015-05-25 18:52:01', NULL, 0, 13, 1, 1, 1),
(218, 'TEla - 3', 'Tela - 2', '08:00:00', NULL, '2015-06-30 00:00:00', NULL, '2015-05-07 00:00:00', '2015-05-25 18:52:21', NULL, 0, 13, 1, 1, 1),
(219, 'TEla - 4', 'Tela - 2', '08:00:00', NULL, '2015-06-30 00:00:00', NULL, '2015-05-07 00:00:00', '2015-05-25 18:52:25', NULL, 0, 13, 1, 1, 1),
(220, 'TEla - 5', 'Tela - 2', '08:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:52:29', NULL, 0, 13, 1, 1, 1),
(221, 'TEla - 6', 'Tela - 2', '08:00:00', NULL, '2015-07-01 00:00:00', NULL, '2015-05-07 00:00:00', '2015-05-25 18:52:32', NULL, 0, 13, 1, 1, 1),
(222, 'Ajustar Validações de Estabilidade						\n', 'Tela - 2', '02:00:00', NULL, '2015-07-01 00:00:00', NULL, '2015-05-07 00:00:00', '2015-05-25 18:52:54', NULL, 0, 13, 1, 1, 1),
(223, '\nCriar campos em Configurações por Empresa					\n\n', 'Tela - 2', '08:00:00', NULL, '2015-07-01 00:00:00', NULL, '2015-05-07 00:00:00', '2015-05-25 18:53:35', NULL, 0, 13, 1, 1, 1),
(224, '\nRevisão de CT						\n				\n\n', 'Tela - 2', '02:00:00', NULL, '2015-07-01 00:00:00', NULL, '2015-05-07 00:00:00', '2015-05-25 18:54:25', NULL, 0, 13, 1, 1, 1),
(225, '\nEspecificação de CTs						\n					\n				\n\n', 'Tela - 2', '05:00:00', NULL, '2015-07-01 00:00:00', NULL, '2015-05-07 00:00:00', '2015-05-25 18:55:06', NULL, 0, 13, 1, 1, 1),
(226, '\nRET - Requisitos 						\n						\n					\n				\n\n', 'Tela - 2', '06:00:00', NULL, '2015-07-01 00:00:00', NULL, '2015-05-07 00:00:00', '2015-05-25 18:55:26', NULL, 0, 13, 1, 1, 1),
(227, '\nRET - Casos de Testes						\n\n', 'Tela - 2', '04:00:00', NULL, NULL, NULL, '2015-05-07 00:00:00', '2015-05-25 18:55:39', NULL, 0, 13, 1, 1, 1),
(228, 'Atualização do requisito de Perfil						', 'Atualização do requisito de Perfil						', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:00:31', NULL, 0, 14, 3, 1, 1),
(229, 'Impactos no requisito de Motivo						', 'Impactos no requisito de Motivo						', '02:00:00', NULL, '2015-06-25 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 19:00:54', NULL, 0, 14, 3, 1, 1),
(230, 'Finalizar Conceitos Contratuais Básicos - Atributos', 'Finalizar Conceitos Contratuais Básicos - Atributos\r\n', '02:00:00', NULL, '2015-06-25 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 19:01:18', NULL, 0, 14, 3, 1, 1),
(231, 'Finalizar Conceitos Contratuais Básicos - Regras', 'Finalizar Conceitos Contratuais Básicos - Regras\r\n', '06:00:00', NULL, '2015-06-25 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 19:01:48', NULL, 0, 14, 3, 1, 1),
(232, 'Cargo Efetivo + Salário', 'Cargo Efetivo + Salário\r\n', '04:00:00', NULL, '2015-06-25 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 19:02:14', NULL, 0, 14, 3, 1, 1),
(233, 'Função Efetiva + Salário', 'Função Efetiva + Salário\r\n', '04:00:00', NULL, '2015-06-25 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 19:02:36', NULL, 0, 14, 3, 1, 1),
(234, 'Cargo Comissionado + Salário', 'Cargo Comissionado + Salário\r\n', '04:00:00', NULL, '2015-06-25 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 19:02:59', NULL, 0, 14, 3, 1, 1),
(235, 'Função Comissionada + Salário', 'Função Comissionada + Salário\r\n', '04:00:00', NULL, '2015-06-25 00:00:00', '', '2015-05-07 00:00:00', '2015-05-25 19:03:34', NULL, 0, 14, 3, 1, 1),
(236, 'Cargo Efetivo + Tabela', 'Cargo Efetivo + Tabela\r\n', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:03:55', NULL, 0, 14, 3, 1, 1),
(237, 'Função Efetiva + Tabela', 'Função Efetiva + Tabela\r\n', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:04:17', NULL, 0, 14, 3, 1, 1),
(238, 'Cargo Comissionado + Tabela', 'Cargo Comissionado + Tabela\r\n', '04:00:00', NULL, NULL, '', '2015-05-25 00:00:00', '2015-05-25 19:04:36', NULL, 0, 14, 3, 1, 1),
(239, 'Função Comissionada + Tabela', 'Função Comissionada + Tabela\r\n', '04:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:04:55', NULL, 0, 14, 3, 1, 1),
(240, 'Revisão de conceitos relacionados a POSIÇÃO						', 'Revisão de conceitos relacionados a POSIÇÃO						\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:05:17', NULL, 0, 14, 3, 1, 1),
(241, 'Levantamento de Regras de Movimentação Entre Empresas - 1', 'Levantamento de Regras de Movimentação Entre Empresas - 1\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:05:42', NULL, 0, 14, 3, 1, 1),
(242, 'Levantamento de Regras de Movimentação Entre Empresas - 2', 'Levantamento de Regras de Movimentação Entre Empresas - 2\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:06:04', NULL, 0, 14, 3, 1, 1),
(243, 'Levantamento de Regras de Movimentação Entre Empresas - 3', 'Levantamento de Regras de Movimentação Entre Empresas - 3\r\n', '08:00:00', NULL, NULL, '', '2015-05-07 00:00:00', '2015-05-25 19:06:20', NULL, 0, 14, 3, 1, 1),
(244, 'GCS - 1\n', 'GCS', '02:00:00', NULL, '2015-06-28 00:00:00', NULL, '2015-05-07 00:00:00', '2015-05-25 19:09:18', NULL, 0, 15, 1, 1, 1),
(245, 'GCS - 2\n', 'GCS', '02:00:00', NULL, '2015-06-28 00:00:00', NULL, '2015-05-07 00:00:00', '2015-05-25 19:09:27', NULL, 0, 15, 1, 1, 1),
(246, 'GCS - 3\n', 'GCS', '02:00:00', NULL, '2015-06-28 00:00:00', NULL, '2015-05-07 00:00:00', '2015-05-25 19:09:30', NULL, 0, 15, 1, 1, 1),
(247, 'GCS - 4\n', 'GCS', '02:00:00', NULL, '2015-06-28 00:00:00', NULL, '2015-05-07 00:00:00', '2015-05-25 19:09:33', NULL, 0, 15, 1, 1, 1),
(248, 'GCS - 5\n', 'GCS', '02:00:00', NULL, '2015-06-28 00:00:00', NULL, '2015-05-07 00:00:00', '2015-05-25 19:09:34', NULL, 0, 15, 1, 1, 1),
(249, 'GCS - 6\n', 'GCS', '02:00:00', NULL, '2015-06-28 00:00:00', NULL, '2015-05-07 00:00:00', '2015-05-25 19:09:36', NULL, 0, 15, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `time`
--

CREATE TABLE IF NOT EXISTS `time` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` longtext NOT NULL,
  `dataCriacao` datetime NOT NULL,
  `dataExclusao` datetime DEFAULT NULL,
  `foiExcluido` tinyint(1) NOT NULL,
  `idUsuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idUsuario` (`idUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `time`
--

INSERT INTO `time` (`id`, `nome`, `dataCriacao`, `dataExclusao`, `foiExcluido`, `idUsuario`) VALUES
(1, 'Omega', '2015-05-25 10:33:18', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipotarefa`
--

CREATE TABLE IF NOT EXISTS `tipotarefa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` longtext NOT NULL,
  `descricao` longtext NOT NULL,
  `dataCriacao` datetime NOT NULL,
  `dataExclusao` datetime DEFAULT NULL,
  `foiExcluido` tinyint(1) NOT NULL,
  `idUsuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idUsuario` (`idUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `tipotarefa`
--

INSERT INTO `tipotarefa` (`id`, `titulo`, `descricao`, `dataCriacao`, `dataExclusao`, `foiExcluido`, `idUsuario`) VALUES
(1, 'Implementação', 'imp', '2015-05-25 10:32:38', NULL, 0, 1),
(2, 'Teste', 'Teste', '2015-05-25 10:32:53', NULL, 0, 1),
(3, 'Requisito', 'Requisito', '2015-05-25 10:33:06', NULL, 0, 1),
(4, 'Retrabalho', 'Retrabalho', '2015-05-25 10:56:47', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` longtext NOT NULL,
  `senha` longtext NOT NULL,
  `nome` longtext NOT NULL,
  `foto` longtext,
  `dataCriacao` datetime NOT NULL,
  `dataExclusao` datetime DEFAULT NULL,
  `foiExcluido` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `email`, `senha`, `nome`, `foto`, `dataCriacao`, `dataExclusao`, `foiExcluido`) VALUES
(1, 'srdaniiel@gmail.com', '1234', 'daniel', NULL, '2015-05-22 09:49:08', NULL, 0);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `estoria`
--
ALTER TABLE `estoria`
  ADD CONSTRAINT `Sprint_estorias` FOREIGN KEY (`idSprint`) REFERENCES `sprint` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `Status_estorias` FOREIGN KEY (`idStatus`) REFERENCES `status` (`idStatus`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `membrotime`
--
ALTER TABLE `membrotime`
  ADD CONSTRAINT `MembroTime_papel` FOREIGN KEY (`idPapel`) REFERENCES `papel` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `Time_membrotimes` FOREIGN KEY (`idTime`) REFERENCES `time` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `papel`
--
ALTER TABLE `papel`
  ADD CONSTRAINT `Papel_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `projeto`
--
ALTER TABLE `projeto`
  ADD CONSTRAINT `Usuario_projetos` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `sprint`
--
ALTER TABLE `sprint`
  ADD CONSTRAINT `Projeto_sprints` FOREIGN KEY (`idProjeto`) REFERENCES `projeto` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `Status_sprints` FOREIGN KEY (`idStatus`) REFERENCES `status` (`idStatus`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tarefa`
--
ALTER TABLE `tarefa`
  ADD CONSTRAINT `Status_tarefas` FOREIGN KEY (`idStatus`) REFERENCES `status` (`idStatus`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `Tarefa_estoria` FOREIGN KEY (`idEstoria`) REFERENCES `estoria` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `Tarefa_membrotime` FOREIGN KEY (`idUsuarioPapelTime`) REFERENCES `membrotime` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `TipoTarefa_tarefas` FOREIGN KEY (`idTipotarefa`) REFERENCES `tipotarefa` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `time`
--
ALTER TABLE `time`
  ADD CONSTRAINT `Time_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tipotarefa`
--
ALTER TABLE `tipotarefa`
  ADD CONSTRAINT `TipoTarefa_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
