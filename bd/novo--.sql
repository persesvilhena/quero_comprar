-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 14-Ago-2017 às 15:55
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `novo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_autor_evento`
--

CREATE TABLE `cc_autor_evento` (
  `auo_evento_id` int(11) NOT NULL,
  `auo_usuario_id` int(11) NOT NULL,
  `auo_original` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `cc_autor_evento`
--

INSERT INTO `cc_autor_evento` (`auo_evento_id`, `auo_usuario_id`, `auo_original`) VALUES
(2, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_autor_noticia`
--

CREATE TABLE `cc_autor_noticia` (
  `aut_noticia_id` int(11) NOT NULL,
  `aut_usuario_id` int(11) NOT NULL,
  `aut_original` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `cc_autor_noticia`
--

INSERT INTO `cc_autor_noticia` (`aut_noticia_id`, `aut_usuario_id`, `aut_original`) VALUES
(1, 1, 1),
(2, 1, 1),
(2, 2, 0),
(3, 1, 1),
(74, 3, 1),
(75, 3, 1),
(76, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_cidade`
--

CREATE TABLE `cc_cidade` (
  `cid_id` int(11) NOT NULL,
  `cid_nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `cid_estado_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `cc_cidade`
--

INSERT INTO `cc_cidade` (`cid_id`, `cid_nome`, `cid_estado_id`) VALUES
(1, 'Muzambinho', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_documento`
--

CREATE TABLE `cc_documento` (
  `doc_id` int(11) NOT NULL,
  `doc_nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `doc_descricao` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `doc_descricao_sem_formatacao` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `doc_arquivo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `doc_slug` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `doc_inclusao` date NOT NULL,
  `doc_atualizado` date NOT NULL,
  `doc_target` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `doc_palavra_chave` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Palavras chave para seo',
  `doc_tipo` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT 'códigos: downloads - 0, 1 - documentos, 2 - horarios, 3 - regimentos e normas',
  `doc_grupo_usuario_grupo_id` int(11) NOT NULL,
  `doc_grupo_usuario_usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela de Arquivos para Download';

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_download`
--

CREATE TABLE `cc_download` (
  `dow_id` int(100) NOT NULL,
  `dow_nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dow_descricao` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dow_arquivo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dow_url` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dow_target` varchar(7) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela de Arquivos para Download' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_empresa_instituicao`
--

CREATE TABLE `cc_empresa_instituicao` (
  `emp_id` int(11) NOT NULL,
  `emp_nome` varchar(255) CHARACTER SET utf8 NOT NULL,
  `emp_cnpj` varchar(45) CHARACTER SET utf8 NOT NULL,
  `emp_endereco` varchar(255) CHARACTER SET utf8 NOT NULL,
  `emp_num` varchar(45) CHARACTER SET utf8 NOT NULL,
  `emp_telefone` varchar(45) CHARACTER SET utf8 NOT NULL,
  `emp_email` varchar(45) CHARACTER SET utf8 NOT NULL,
  `emp_responsavel` varchar(45) CHARACTER SET utf8 NOT NULL,
  `emp_cidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_estado`
--

CREATE TABLE `cc_estado` (
  `est_id` int(11) NOT NULL,
  `est_uf` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `est_nome` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `est_pais_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `cc_estado`
--

INSERT INTO `cc_estado` (`est_id`, `est_uf`, `est_nome`, `est_pais_id`) VALUES
(1, 'MG', 'Minas Gerais', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_evento`
--

CREATE TABLE `cc_evento` (
  `eve_id` int(11) NOT NULL,
  `eve_titulo` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `eve_descricao` text COLLATE utf8_unicode_ci NOT NULL,
  `eve_descricao_sem_formatacao` text COLLATE utf8_unicode_ci NOT NULL,
  `eve_foto` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `eve_inicio` date NOT NULL,
  `eve_termino` date DEFAULT NULL,
  `eve_slug` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `eve_local` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `eve_endereco` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `eve_palavra_chave` tinytext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Palavras chave para seo',
  `eve_tipo_id` int(11) NOT NULL,
  `eve_num_pessoa_atendida` int(11) DEFAULT NULL COMMENT 'Numero de pessoas atentidas no evento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela de Eventos';

--
-- Extraindo dados da tabela `cc_evento`
--

INSERT INTO `cc_evento` (`eve_id`, `eve_titulo`, `eve_descricao`, `eve_descricao_sem_formatacao`, `eve_foto`, `eve_inicio`, `eve_termino`, `eve_slug`, `eve_local`, `eve_endereco`, `eve_palavra_chave`, `eve_tipo_id`, `eve_num_pessoa_atendida`) VALUES
(2, 'asdasa', 'asdas', 'asdasd', 'eab93814b27822e58155d2f5289cd2b6.jpg', '2017-07-18', '0000-00-00', 'asdasd', 'asdasd', 'asdasd', 'asdasd', 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_evento_nucleo`
--

CREATE TABLE `cc_evento_nucleo` (
  `evl_evento_id` int(11) NOT NULL,
  `evl_nucleo_id` int(11) NOT NULL,
  `evl_destaque` int(11) NOT NULL,
  `evl_visita` int(11) NOT NULL,
  `evl_aprovacao` int(11) NOT NULL,
  `evl_original` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `cc_evento_nucleo`
--

INSERT INTO `cc_evento_nucleo` (`evl_evento_id`, `evl_nucleo_id`, `evl_destaque`, `evl_visita`, `evl_aprovacao`, `evl_original`) VALUES
(2, 1, 0, 1, 1, 1),
(2, 2, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_evento_usuario`
--

CREATE TABLE `cc_evento_usuario` (
  `evo_evento_id` int(11) NOT NULL,
  `evo_usuario_id` int(11) NOT NULL,
  `evo_papel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_fomento`
--

CREATE TABLE `cc_fomento` (
  `fom_id` int(11) NOT NULL,
  `fom_nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_foto_evento_auxiliar`
--

CREATE TABLE `cc_foto_evento_auxiliar` (
  `fot_id` int(11) NOT NULL,
  `fot_caminho` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `fot_evento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_foto_noticia_auxiliar`
--

CREATE TABLE `cc_foto_noticia_auxiliar` (
  `for_id` int(11) NOT NULL,
  `for_caminho` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `for_noticia` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `cc_foto_noticia_auxiliar`
--

INSERT INTO `cc_foto_noticia_auxiliar` (`for_id`, `for_caminho`, `for_noticia`) VALUES
(1, '7fd046d49e1b0165deb66a89e7498bf4.jpg', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_grupo`
--

CREATE TABLE `cc_grupo` (
  `gru_id` int(11) NOT NULL,
  `gru_nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_grupo_usuario`
--

CREATE TABLE `cc_grupo_usuario` (
  `gro_grupo_id` int(11) NOT NULL,
  `gro_usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_grupo_usuario_subarea_conhecimento`
--

CREATE TABLE `cc_grupo_usuario_subarea_conhecimento` (
  `grt_subarea_conhecimento_id` int(11) NOT NULL,
  `grt_grupo_usuario_grupo_id` int(11) NOT NULL,
  `grt_grupo_usuario_usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_intercambista`
--

CREATE TABLE `cc_intercambista` (
  `int_usuario_id` int(11) NOT NULL,
  `int_periodo_inicio` date NOT NULL,
  `int_perido_fim` date DEFAULT NULL,
  `int_professor_orientador_externo` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `int_professor_orientador_externo_contato` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `int_instituicao_externa` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `int_observacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `int_status` tinyint(4) NOT NULL COMMENT '1 - Aluno do IF em Intercambio\n2 - Aluno de fora em Intercambio no IF',
  `int_fomento_id` int(11) NOT NULL,
  `int_grupo_usuario_grupo_prof_id` int(11) NOT NULL,
  `int_grupo_usuario_usuario_prof_id` int(11) NOT NULL,
  `int_grupo_usuario_grupo_usu_id` int(11) NOT NULL,
  `int_grupo_usuario_usuario_usu_id` int(11) NOT NULL,
  `int_cidade_id` int(11) NOT NULL,
  `int_cidade_est` int(2) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_linha_pesquisa`
--

CREATE TABLE `cc_linha_pesquisa` (
  `lin_id` int(11) NOT NULL,
  `lin_nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_link`
--

CREATE TABLE `cc_link` (
  `lik_id` int(100) NOT NULL,
  `lik_titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lik_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lik_target` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lik_miniatura` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela de Links' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_log`
--

CREATE TABLE `cc_log` (
  `log_id` int(11) NOT NULL,
  `log_titulo` text COLLATE utf8_unicode_ci NOT NULL,
  `log_horario` datetime NOT NULL,
  `log_acao` text COLLATE utf8_unicode_ci NOT NULL,
  `log_usuario` int(11) NOT NULL,
  `log_descricao` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `cc_log`
--

INSERT INTO `cc_log` (`log_id`, `log_titulo`, `log_horario`, `log_acao`, `log_usuario`, `log_descricao`) VALUES
(1, 'O usuário Perses De Vilhena adicionou uma nova notícia!', '2017-07-14 12:08:18', 'add-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova notícia com titulo: <b>zxzxczxczxc</b>, as <b>2017-07-14 12:08:18</b>'),
(2, 'O usuário Perses De Vilhena alterou uma notícia!', '2017-07-14 12:08:31', 'alt-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, alterou uma notícia com titulo: <b>zxzxczxczxc</b>, e id <b>72</b>, as <b>2017-07-14 12:08:31</b>'),
(3, 'O usuário Perses De Vilhena removeu uma notícia!', '2017-07-14 12:08:35', 'rmv-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu uma notícia com titulo: <b>asdasd</b>, e id <b>72</b>, as <b>2017-07-14 12:08:35</b>'),
(4, 'O usuário Perses De Vilhena adicionou destaque a uma notícia!', '2017-07-14 12:08:39', 'add-destaque-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou destaque a uma notícia com titulo: <b>zxzxczxczxc</b>, e id <b>71</b>, as <b>2017-07-14 12:08:39</b>'),
(5, 'O usuário Perses De Vilhena removeu o destaque de uma notícia!', '2017-07-14 12:08:42', 'rmv-desatque-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu destaque a uma notícia com titulo: <b>zxzxczxczxc</b>, e id <b>71</b>, as <b>2017-07-14 12:08:42</b>'),
(6, 'O usuário Perses De Vilhena removeu uma notícia!', '2017-07-14 12:08:45', 'rmv-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu uma notícia com titulo: <b>zxzxczxczxc</b>, e id <b>71</b>, as <b>2017-07-14 12:08:45</b>'),
(7, 'O usuário Perses De Vilhena adicionou uma nova notícia!', '2017-07-14 12:23:41', 'add-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova notícia com titulo: <b>sdasdasd</b>, as <b>2017-07-14 12:23:41</b>'),
(8, 'O usuário Perses De Vilhena adicionou uma nova notícia!', '2017-07-17 08:29:10', 'add-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova notícia com titulo: <b>sdasfsdfsdfsdfsdfsdf</b>, as <b>2017-07-17 08:29:10</b>'),
(9, 'O usuário Perses De Vilhena adicionou uma nova foto a uma notícia!', '2017-07-17 17:53:39', 'add-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova foto a notícia com titulo: <b>sdasdasd</b>, e id <b>73</b>, as <b>2017-07-17 17:53:39</b>'),
(10, 'O usuário Perses De Vilhena removeu uma foto de uma notícia!', '2017-07-17 17:53:53', 'rmv-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu uma foto da notícia com titulo: <b>sdasdasd</b>, e id <b>73</b>, as <b>2017-07-17 17:53:53</b>'),
(11, 'O usuário Perses De Vilhena removeu uma foto de uma notícia!', '2017-07-17 17:53:55', 'rmv-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu uma foto da notícia com titulo: <b>sdasdasd</b>, e id <b>73</b>, as <b>2017-07-17 17:53:55</b>'),
(12, 'O usuário Perses De Vilhena adicionou uma nova foto a uma notícia!', '2017-07-17 18:00:42', 'add-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova foto a notícia com titulo: <b>sdasdasd</b>, e id <b>73</b>, as <b>2017-07-17 18:00:42</b>'),
(13, 'O usuário Perses De Vilhena removeu uma notícia!', '2017-07-17 18:01:03', 'rmv-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu uma notícia com titulo: <b>sdasdasd</b>, e id <b>73</b>, as <b>2017-07-17 18:01:03</b>'),
(14, 'O usuário Perses De Vilhena adicionou uma nova foto a uma notícia!', '2017-07-18 10:06:29', 'add-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova foto a notícia com titulo: <b>Jovens Talentos para a Ciência</b>, e id <b>2</b>, as <b>2017-07-18 10:06:29</b>'),
(15, 'O usuário Perses De Vilhena alterou um evento!', '2017-07-31 11:18:37', 'alt-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, alterou um evento com titulo: <b>teste</b>, e id <b>2</b>, as <b>2017-07-31 11:18:37</b>'),
(16, 'O usuário Perses De Vilhena alterou um evento!', '2017-07-31 11:19:18', 'alt-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, alterou um evento com titulo: <b>teste</b>, e id <b>2</b>, as <b>2017-07-31 11:19:18</b>'),
(17, 'O usuário Perses De Vilhena alterou um evento!', '2017-08-01 08:32:28', 'alt-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, alterou um evento com titulo: <b>teste</b>, e id <b>2</b>, as <b>2017-08-01 08:32:28</b>'),
(18, 'O usuário Perses De Vilhena alterou um evento!', '2017-08-01 08:34:24', 'alt-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, alterou um evento com titulo: <b>asdasd</b>, e id <b>2</b>, as <b>2017-08-01 08:34:24</b>'),
(19, 'O usuário Perses De Vilhena alterou um evento!', '2017-08-01 08:35:27', 'alt-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, alterou um evento com titulo: <b>asdasd</b>, e id <b>2</b>, as <b>2017-08-01 08:35:27</b>'),
(20, 'O usuário Perses De Vilhena alterou um evento!', '2017-08-01 08:37:19', 'alt-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, alterou um evento com titulo: <b>asdasd</b>, e id <b>2</b>, as <b>2017-08-01 08:37:19</b>'),
(21, 'O usuário Perses De Vilhena alterou um evento!', '2017-08-01 08:38:28', 'alt-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, alterou um evento com titulo: <b>asdasd</b>, e id <b>2</b>, as <b>2017-08-01 08:38:28</b>'),
(22, 'O usuário Perses De Vilhena alterou um evento!', '2017-08-01 08:41:09', 'alt-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, alterou um evento com titulo: <b>asdasd</b>, e id <b>2</b>, as <b>2017-08-01 08:41:09</b>'),
(23, 'O usuário Perses De Vilhena alterou um evento!', '2017-08-01 08:41:55', 'alt-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, alterou um evento com titulo: <b>asdasd</b>, e id <b>2</b>, as <b>2017-08-01 08:41:55</b>'),
(24, 'O usuário Perses De Vilhena adicionou uma nova notícia!', '2017-08-01 09:08:21', 'add-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova notícia com titulo: <b>novo</b>, as <b>2017-08-01 09:08:21</b>'),
(25, 'O usuário Perses De Vilhena adicionou um novo autor a notícia!', '2017-08-01 11:02:12', 'add-autor-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou <b>Paulo</b> como autor da notícia com titulo: <b>novo</b>, as <b>2017-08-01 11:02:12</b>'),
(26, 'O usuário Perses De Vilhena removeu um autor da notícia!', '2017-08-01 11:02:16', 'rmv-autor-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu <b>Perses De Vilhena</b> como autor da notícia com titulo: <b></b>, as <b>2017-08-01 11:02:16</b>'),
(27, 'O usuário Perses De Vilhena adicionou um novo autor a notícia!', '2017-08-01 11:03:01', 'add-autor-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou <b>Perses De Vilhena</b> como autor da notícia com titulo: <b>novo</b>, as <b>2017-08-01 11:03:01</b>'),
(28, 'O usuário Perses De Vilhena removeu um autor da notícia!', '2017-08-01 11:03:07', 'rmv-autor-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu <b>Perses De Vilhena</b> como autor da notícia com titulo: <b></b>, as <b>2017-08-01 11:03:07</b>'),
(29, 'O usuário Perses De Vilhena adicionou um novo autor a notícia!', '2017-08-01 11:03:26', 'add-autor-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou <b>Perses De Vilhena</b> como autor da notícia com titulo: <b>novo</b>, as <b>2017-08-01 11:03:26</b>'),
(30, 'O usuário Perses De Vilhena adicionou um novo autor a notícia!', '2017-08-01 11:13:37', 'add-autor-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou <b>Paulo</b> como autor da notícia com titulo: <b>novo</b>, as <b>2017-08-01 11:13:37</b>'),
(31, 'O usuário Perses De Vilhena removeu um autor da notícia!', '2017-08-01 11:13:39', 'rmv-autor-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu <b>Paulo</b> como autor da notícia com titulo: <b>novo</b>, as <b>2017-08-01 11:13:39</b>'),
(32, 'O usuário Perses De Vilhena adicionou uma nova foto a uma notícia!', '2017-08-02 10:07:47', 'add-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova foto a notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:07:47</b>'),
(33, 'O usuário Perses De Vilhena adicionou uma nova foto a uma notícia!', '2017-08-02 10:08:38', 'add-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova foto a notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:08:38</b>'),
(34, 'O usuário Perses De Vilhena adicionou uma nova foto a uma notícia!', '2017-08-02 10:08:42', 'add-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova foto a notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:08:42</b>'),
(35, 'O usuário Perses De Vilhena adicionou uma nova foto a uma notícia!', '2017-08-02 10:09:33', 'add-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova foto a notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:09:33</b>'),
(36, 'O usuário Perses De Vilhena adicionou uma nova foto a uma notícia!', '2017-08-02 10:09:58', 'add-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova foto a notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:09:58</b>'),
(37, 'O usuário Perses De Vilhena adicionou uma nova foto a uma notícia!', '2017-08-02 10:17:37', 'add-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova foto a notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:17:37</b>'),
(38, 'O usuário Perses De Vilhena adicionou uma nova foto a uma notícia!', '2017-08-02 10:17:51', 'add-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova foto a notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:17:51</b>'),
(39, 'O usuário Perses De Vilhena adicionou uma nova foto a uma notícia!', '2017-08-02 10:19:51', 'add-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova foto a notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:19:51</b>'),
(40, 'O usuário Perses De Vilhena adicionou uma nova foto a uma notícia!', '2017-08-02 10:20:30', 'add-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova foto a notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:20:30</b>'),
(41, 'O usuário Perses De Vilhena removeu uma foto de uma notícia!', '2017-08-02 10:23:32', 'rmv-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu uma foto da notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:23:32</b>'),
(42, 'O usuário Perses De Vilhena removeu uma foto de uma notícia!', '2017-08-02 10:23:37', 'rmv-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu uma foto da notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:23:37</b>'),
(43, 'O usuário Perses De Vilhena removeu uma foto de uma notícia!', '2017-08-02 10:23:39', 'rmv-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu uma foto da notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:23:39</b>'),
(44, 'O usuário Perses De Vilhena removeu uma foto de uma notícia!', '2017-08-02 10:23:41', 'rmv-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu uma foto da notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:23:41</b>'),
(45, 'O usuário Perses De Vilhena removeu uma foto de uma notícia!', '2017-08-02 10:23:43', 'rmv-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu uma foto da notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:23:43</b>'),
(46, 'O usuário Perses De Vilhena removeu uma foto de uma notícia!', '2017-08-02 10:23:45', 'rmv-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu uma foto da notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:23:45</b>'),
(47, 'O usuário Perses De Vilhena removeu uma foto de uma notícia!', '2017-08-02 10:23:57', 'rmv-foto-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu uma foto da notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:23:57</b>'),
(48, 'O usuário Perses De Vilhena removeu uma foto de uma notícia!', '2017-08-02 10:25:28', 'rmv-foto-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu uma foto da notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:25:28</b>'),
(49, 'O usuário Perses De Vilhena adicionou uma nova foto a uma notícia!', '2017-08-02 10:33:04', 'add-foto-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova foto a notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:33:04</b>'),
(50, 'O usuário Perses De Vilhena adicionou uma nova foto a um evento!', '2017-08-02 10:34:02', 'add-foto-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova foto a um evento com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:34:02</b>'),
(51, 'O usuário Perses De Vilhena removeu uma foto de um evento!', '2017-08-02 10:37:10', 'rmv-foto-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu uma foto do evento com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:37:10</b>'),
(52, 'O usuário Perses De Vilhena removeu uma foto de um evento!', '2017-08-02 10:37:12', 'rmv-foto-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu uma foto do evento com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:37:12</b>'),
(53, 'O usuário Perses De Vilhena adicionou uma nova notícia!', '2017-08-02 10:41:15', 'add-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova notícia com titulo: <b>teste</b>, as <b>2017-08-02 10:41:15</b>'),
(54, 'O usuário Perses De Vilhena removeu uma foto de um evento!', '2017-08-02 10:48:54', 'rmv-foto-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu uma foto do evento com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-02 10:48:54</b>'),
(55, 'O usuário Perses De Vilhena adicionou destaque a uma notícia!', '2017-08-03 09:51:35', 'add-destaque-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou destaque a uma notícia com titulo: <b></b>, e id <b>3</b>, as <b>2017-08-03 09:51:35</b>'),
(56, 'O usuário Perses De Vilhena removeu o destaque de uma notícia!', '2017-08-03 09:54:34', 'rmv-destaque-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu destaque a uma notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-03 09:54:34</b>'),
(57, 'O usuário Perses De Vilhena adicionou destaque a uma notícia!', '2017-08-03 09:54:38', 'add-destaque-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou destaque a uma notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-03 09:54:38</b>'),
(58, 'O usuário Perses De Vilhena removeu o destaque de uma notícia!', '2017-08-03 09:54:58', 'rmv-destaque-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu destaque a uma notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-03 09:54:58</b>'),
(59, 'O usuário Perses De Vilhena adicionou destaque a uma notícia!', '2017-08-03 09:55:00', 'add-destaque-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou destaque a uma notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-03 09:55:00</b>'),
(60, 'O usuário Perses De Vilhena removeu uma notícia!', '2017-08-03 10:19:16', 'rmv-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu uma notícia com titulo: <b>novo</b>, e id <b>3</b>, as <b>2017-08-03 10:19:16</b>'),
(61, 'O usuário Perses De Vilhena adicionou uma novo evento!', '2017-08-03 10:20:34', 'add-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma novo evento com titulo: <b>sdfsadfdf</b>, as <b>2017-08-03 10:20:34</b>'),
(62, 'O usuário Perses De Vilhena adicionou um novo autor a notícia!', '2017-08-03 10:21:01', 'add-autor-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou <b>Paulo</b> como autor da notícia com titulo: <b>sdfsadfdf</b>, as <b>2017-08-03 10:21:01</b>'),
(63, 'O usuário Perses De Vilhena adicionou um novo autor a notícia!', '2017-08-03 10:21:04', 'add-autor-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou <b>Aracele</b> como autor da notícia com titulo: <b>sdfsadfdf</b>, as <b>2017-08-03 10:21:04</b>'),
(64, 'O usuário Perses De Vilhena adicionou uma nova foto a um evento!', '2017-08-03 10:21:18', 'add-foto-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova foto a um evento com titulo: <b>sdfsadfdf</b>, e id <b>4</b>, as <b>2017-08-03 10:21:18</b>'),
(65, 'O usuário Perses De Vilhena adicionou uma nova foto a um evento!', '2017-08-03 10:21:24', 'add-foto-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova foto a um evento com titulo: <b>sdfsadfdf</b>, e id <b>4</b>, as <b>2017-08-03 10:21:24</b>'),
(66, 'O usuário Perses De Vilhena adicionou uma nova foto a um evento!', '2017-08-03 10:21:30', 'add-foto-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova foto a um evento com titulo: <b>sdfsadfdf</b>, e id <b>4</b>, as <b>2017-08-03 10:21:30</b>'),
(67, 'O usuário Perses De Vilhena removeu uma foto de um evento!', '2017-08-03 10:21:32', 'rmv-foto-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu uma foto do evento com titulo: <b>sdfsadfdf</b>, e id <b>4</b>, as <b>2017-08-03 10:21:32</b>'),
(68, 'O usuário Perses De Vilhena removeu uma notícia!', '2017-08-03 10:21:42', 'rmv-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu uma notícia com titulo: <b>sdfsadfdf</b>, e id <b>4</b>, as <b>2017-08-03 10:21:42</b>'),
(69, 'O usuário Perses De Vilhena removeu o destaque de uma notícia!', '2017-08-07 08:19:09', 'rmv-destaque-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu destaque a uma notícia com titulo: <b>asdasa</b>, e id <b>2</b>, as <b>2017-08-07 08:19:09</b>'),
(70, 'O usuário Perses De Vilhena aprovou uma notícia!', '2017-08-07 08:45:53', 'add-aprovacao-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, aprovou uma notícia com titulo: <b></b>, e id <b>2</b>, as <b>2017-08-07 08:45:53</b>'),
(71, 'O usuário Perses De Vilhena reprovou uma notícia!', '2017-08-07 08:46:14', 'rmv-aprovacao-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, reprovou uma notícia com titulo: <b></b>, e id <b>2</b>, as <b>2017-08-07 08:46:14</b>'),
(72, 'O usuário Perses De Vilhena aprovou uma notícia!', '2017-08-07 08:46:37', 'add-aprovacao-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, aprovou uma notícia com titulo: <b></b>, e id <b>2</b>, as <b>2017-08-07 08:46:37</b>'),
(73, 'O usuário Perses De Vilhena reprovou uma notícia!', '2017-08-07 08:46:41', 'rmv-aprovacao-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, reprovou uma notícia com titulo: <b></b>, e id <b>2</b>, as <b>2017-08-07 08:46:41</b>'),
(74, 'O usuário Perses De Vilhena aprovou uma notícia!', '2017-08-07 08:47:15', 'add-aprovacao-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, aprovou uma notícia com titulo: <b>asdasa</b>, e id <b>2</b>, as <b>2017-08-07 08:47:15</b>'),
(75, 'O usuário Perses De Vilhena duplicou uma notícia!', '2017-08-07 09:43:43', 'add-duplicacao-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, duplicou uma notícia com titulo: <b>asdasa</b>, e id <b>2</b>, as <b>2017-08-07 09:43:43</b>'),
(76, 'O usuário Perses De Vilhena duplicou uma notícia!', '2017-08-07 09:46:39', 'add-duplicacao-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, duplicou uma notícia com titulo: <b>asdasa</b>, e id <b>2</b>, as <b>2017-08-07 09:46:39</b>'),
(77, 'O usuário Perses De Vilhena removeu a duplicação de uma notícia!', '2017-08-07 09:46:41', 'rmv-duplicacao-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu a duplicação da notícia com titulo: <b>asdasa</b>, e id <b>2</b>, as <b>2017-08-07 09:46:41</b>'),
(78, 'O usuário Perses De Vilhena duplicou uma notícia!', '2017-08-07 09:46:47', 'add-duplicacao-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, duplicou uma notícia com titulo: <b>asdasa</b>, e id <b>2</b>, as <b>2017-08-07 09:46:47</b>'),
(79, 'O usuário Perses De Vilhena reprovou uma notícia!', '2017-08-07 09:54:39', 'rmv-aprovacao-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, reprovou uma notícia com titulo: <b>asdasa</b>, e id <b>2</b>, as <b>2017-08-07 09:54:39</b>'),
(80, 'O usuário Perses De Vilhena removeu a duplicação de uma notícia!', '2017-08-07 09:54:46', 'rmv-duplicacao-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu a duplicação da notícia com titulo: <b>asdasa</b>, e id <b>2</b>, as <b>2017-08-07 09:54:46</b>'),
(81, 'O usuário Perses De Vilhena duplicou uma notícia!', '2017-08-07 09:55:29', 'add-duplicacao-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, duplicou uma notícia com titulo: <b>asdasa</b>, e id <b>2</b>, as <b>2017-08-07 09:55:29</b>'),
(82, 'O usuário Perses De Vilhena aprovou uma notícia!', '2017-08-07 09:55:39', 'add-aprovacao-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, aprovou uma notícia com titulo: <b>asdasa</b>, e id <b>2</b>, as <b>2017-08-07 09:55:39</b>'),
(83, 'O usuário Perses De Vilhena adicionou destaque a uma notícia!', '2017-08-07 09:55:44', 'add-destaque-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou destaque a uma notícia com titulo: <b>asdasa</b>, e id <b>2</b>, as <b>2017-08-07 09:55:44</b>'),
(84, 'O usuário Perses De Vilhena adicionou um novo autor a notícia!', '2017-08-07 10:08:29', 'add-autor-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou <b>Paulo</b> como autor da notícia com titulo: <b>asdasa</b>, as <b>2017-08-07 10:08:29</b>'),
(85, 'O usuário Perses De Vilhena removeu um autor da notícia!', '2017-08-07 10:08:31', 'rmv-autor-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu <b>Paulo</b> como autor da notícia com titulo: <b>asdasa</b>, as <b>2017-08-07 10:08:31</b>'),
(86, 'O usuário Perses De Vilhena aprovou uma notícia!', '2017-08-07 11:06:53', 'add-aprovacao-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, aprovou uma notícia com titulo: <b>asdasa</b>, e id <b>2</b>, as <b>2017-08-07 11:06:53</b>'),
(87, 'O usuário Perses De Vilhena alterou um evento!', '2017-08-07 11:17:44', 'alt-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, alterou um evento com titulo: <b>asdasa</b>, e id <b>2</b>, as <b>2017-08-07 11:17:44</b>'),
(88, 'O usuário Perses De Vilhena alterou um tipo de evento!', '2017-08-07 19:18:17', 'alt-tipo-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, alterou um tipo de evento com nome: <b>asd</b> para: <b>teste</b>, e id <b>1</b>, as <b>2017-08-07 19:18:17</b>'),
(89, 'O usuário Perses De Vilhena alterou um tipo de evento!', '2017-08-08 08:58:14', 'alt-tipo-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, alterou um tipo de evento com nome: <b>teste</b> para: <b></b>, e id <b>1</b>, as <b>2017-08-08 08:58:14</b>'),
(90, 'O usuário Perses De Vilhena inseriu um tipo de evento!', '2017-08-08 09:07:00', 'add-tipo-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, inseriu um tipo de evento com nome: <b>teste</b>, as <b>2017-08-08 09:07:00</b>'),
(91, 'O usuário Perses De Vilhena alterou um tipo de evento!', '2017-08-08 09:07:10', 'alt-tipo-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, alterou um tipo de evento com nome: <b>teste</b> para: <b>ASas</b>, e id <b>3</b>, as <b>2017-08-08 09:07:10</b>'),
(92, 'O usuário Perses De Vilhena alterou um tipo de evento!', '2017-08-08 09:09:29', 'alt-tipo-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, alterou um tipo de evento com nome: <b>ASas</b> para: <b>teste</b>, e id <b>3</b>, as <b>2017-08-08 09:09:29</b>'),
(93, 'O usuário Perses De Vilhena reprovou um evento!', '2017-08-08 09:23:39', 'rmv-aprovacao-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, reprovou um evento com titulo: <b>asdasa</b>, e id <b>2</b>, as <b>2017-08-08 09:23:39</b>'),
(94, 'O usuário Perses De Vilhena aprovou um evento!', '2017-08-08 09:23:43', 'add-aprovacao-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, aprovou um evento com titulo: <b>asdasa</b>, e id <b>2</b>, as <b>2017-08-08 09:23:43</b>'),
(95, 'O usuário Perses De Vilhena alterou um tipo de evento!', '2017-08-08 09:34:41', 'alt-tipo-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, alterou um tipo de evento com nome: <b>teste2</b> para: <b>asd</b>, e id <b>2</b>, as <b>09:34:41 08/08/2017</b>'),
(96, 'O usuário Perses De Vilhena adicionou uma nova notícia!', '2017-08-08 10:06:23', 'add-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma nova notícia com titulo: <b>teste</b>, as <b>10:06:23 08/08/2017</b>'),
(97, 'O usuário Perses De Vilhena alterou uma notícia!', '2017-08-08 10:10:47', 'alt-noticia', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, alterou uma notícia com titulo: <b>teste</b>, e id <b>76</b>, as <b>10:10:47 08/08/2017</b>'),
(98, 'O usuário Perses De Vilhena adicionou um novo evento!', '2017-08-08 10:19:14', 'add-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, adicionou uma novo evento com titulo: <b>novo evento</b>, as <b>10:19:14 08/08/2017</b>'),
(99, 'O usuário Perses De Vilhena alterou um evento!', '2017-08-08 10:19:37', 'alt-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, alterou um evento com titulo: <b>novo evento</b>, e id <b>3</b>, as <b>10:19:37 08/08/2017</b>'),
(100, 'O usuário Perses De Vilhena removeu um evento!', '2017-08-08 10:20:20', 'rmv-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, removeu um evento com titulo: <b>novo evento</b>, e id <b>3</b>, as <b>10:20:20 08/08/2017</b>'),
(101, 'O usuário asd adicionou uma nova notícia!', '2017-08-11 09:42:09', 'add-noticia', 8, 'O usuario do sistema: <b>asd</b>, adicionou uma nova notícia com titulo: <b>asdasdasd</b>, as <b>09:42:09 11/08/2017</b>'),
(102, 'O usuário Perses De Vilhena alterou um tipo de evento!', '2017-08-14 09:01:42', 'alt-tipo-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, alterou um tipo de evento com nome: <b>asd</b> para: <b>teste</b>, e id <b>2</b>, as <b>09:01:42 14/08/2017</b>'),
(103, 'O usuário Perses De Vilhena removeu um tipo de evento!', '2017-08-14 09:01:55', 'rmv-tipo-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, apagou um tipo de evento com nome: <b>teste</b>, e id <b>3</b>, as <b>09:01:55 14/08/2017</b>'),
(104, 'O usuário Perses De Vilhena inseriu um tipo de evento!', '2017-08-14 09:02:02', 'add-tipo-evento', 3, 'O usuario do sistema: <b>Perses De Vilhena</b>, inseriu um tipo de evento com nome: <b>novo</b>, as <b>09:02:02 14/08/2017</b>');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_noticia`
--

CREATE TABLE `cc_noticia` (
  `not_id` int(11) NOT NULL,
  `not_titulo` varchar(125) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `not_subtitulo` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `not_conteudo` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `not_conteudo_sem_formatacao` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `not_foto` varchar(125) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `not_criado` date NOT NULL,
  `not_revisado` date DEFAULT NULL,
  `not_exibicao` date NOT NULL,
  `not_slug` varchar(85) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `not_palavra_chave` varchar(155) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Palavras chave para seo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de Notícias' ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `cc_noticia`
--

INSERT INTO `cc_noticia` (`not_id`, `not_titulo`, `not_subtitulo`, `not_conteudo`, `not_conteudo_sem_formatacao`, `not_foto`, `not_criado`, `not_revisado`, `not_exibicao`, `not_slug`, `not_palavra_chave`) VALUES
(1, 'Projeto RONDON 2010', 'teste123', 'Desde o último dia 15 de Janeiro de 2011, professores e alunos do IFSULDEMINAS participam, na região Nordeste do Brasil, do Projeto Rondon, uma ação interministerial coordenada pelo Ministério da Defesa, em parceria com governos e municípios, que envolve a participação voluntária de universitários de diferentes áreas do conhecimento. Essa é a primeira vez que equipes do Campus Muzambinho integram a iniciativa.\r\n\r\nOs primeiros a seguir viagem foram os estudantes do grupo coordenado pelo professor Claudiomir Santos, que partiram para a cidade de Ipiranga do Piauí (PI) no dia 15. A comitiva é formada pela Prof.ª Josiane Pereira Fonseca,  Prof. Gustavo Rabelo Botrel Miranda e por oito alunos dos cursos de Ciência da Computação, Engenharia Agronômica, Ciências Biológicas e Educação Física. A equipe integra a Operação Zabelê, realizada em 20 municípios do Piauí. O retorno para Muzambinho está previsto para o dia 31 de janeiro de 2011.\r\n\r\nO segundo grupo a partir para o Nordeste é coordenado pela professora Narayana de Deus Nogueira. A equipe, que seguiu no dia 22 para o Rio Grande do Norte, é integrada pelo professor Marcelo Moraes e por oito estudantes dos cursos de Ciências Biológicas,', 'Desde o último dia 15 de Janeiro de 2011, professores e alunos do IFSULDEMINAS participam, na região Nordeste do Brasil, do Projeto Rondon, uma ação interministerial coordenada pelo Ministério da Defesa, em parceria com governos e municípios, que envolve a participação voluntária de universitários de diferentes áreas do conhecimento. Essa é a primeira vez que equipes do Campus Muzambinho integram a iniciativa.\r\n\r\nOs primeiros a seguir viagem foram os estudantes do grupo coordenado pelo professor Claudiomir Santos, que partiram para a cidade de Ipiranga do Piauí (PI) no dia 15. A comitiva é formada pela Prof.ª Josiane Pereira Fonseca,  Prof. Gustavo Rabelo Botrel Miranda e por oito alunos dos cursos de Ciência da Computação, Engenharia Agronômica, Ciências Biológicas e Educação Física. A equipe integra a Operação Zabelê, realizada em 20 municípios do Piauí. O retorno para Muzambinho está previsto para o dia 31 de janeiro de 2011.\r\n\r\nO segundo grupo a partir para o Nordeste é coordenado pela professora Narayana de Deus Nogueira. A equipe, que seguiu no dia 22 para o Rio Grande do Norte, é integrada pelo professor Marcelo Moraes e por oito estudantes dos cursos de Ciências Biológicas,', '90f0fd2835963fbaf71f56aa79e8eed3.jpg', '2013-07-19', '2015-05-11', '0000-00-00', 'projeto-rondon-2011', 'projeto rondon 2011 computação nordeste ifsuldeminas muzambinho'),
(2, 'Jovens Talentos para a Ciência', 'sub titulo', 'Aluno do 1º período do curso de Ciência da Computação do IFSULDEMINAS - Câmpus Muzambinho é aprovado no programa Jovens Talentos para a Ciência, coordenado pelo governo federal.\r\n\r\nA notícia foi divulgada pela Pró-Reitoria de Pesquisa, Pós-Graduação do IFSULDEMINAS.\r\n\r\nForam, ao todo, 4 alunos do IFSULDEMINAS aprovados para receberem bolsa da CAPES/CNPq para o programa \"Jovens talentos para a Ciência\".\r\n\r\nO programa Jovens talentos para a Ciência é destinado a estudantes de graduação de todas as áreas do conhecimento e tem o objetivo de inserir precocemente os estudantes no meio científico. Os aprovados receberão bolsa no valor de R$ 400,00 pelo período de 12 meses.\r\n\r\nOs alunos aprovados foram:\r\n\r\nJosé Adriano dos Santos - Câmpus Inconfidentes\r\n\r\nKarlmer Abel Bueno Correa - Câmpus Machado\r\n\r\nLuis Ovidio Viana Podestá - Câmpus Muzambinho (Ciência da Computação)\r\n\r\nRichard Geremias - Câmpus Muzambinho\r\n\r\n ', 'Aluno do 1º período do curso de Ciência da Computação do IFSULDEMINAS - Câmpus Muzambinho é aprovado no programa Jovens Talentos para a Ciência, coordenado pelo governo federal.\r\n\r\nA notícia foi divulgada pela Pró-Reitoria de Pesquisa, Pós-Graduação do IFSULDEMINAS.\r\n\r\nForam, ao todo, 4 alunos do IFSULDEMINAS aprovados para receberem bolsa da CAPES/CNPq para o programa \"Jovens talentos para a Ciência\".\r\n\r\nO programa Jovens talentos para a Ciência é destinado a estudantes de graduação de todas as áreas do conhecimento e tem o objetivo de inserir precocemente os estudantes no meio científico. Os aprovados receberão bolsa no valor de R$ 400,00 pelo período de 12 meses.\r\n\r\nOs alunos aprovados foram:\r\n\r\nJosé Adriano dos Santos - Câmpus Inconfidentes\r\n\r\nKarlmer Abel Bueno Correa - Câmpus Machado\r\n\r\nLuis Ovidio Viana Podestá - Câmpus Muzambinho (Ciência da Computação)\r\n\r\nRichard Geremias - Câmpus Muzambinho\r\n\r\n ', 'e09dc14f0ca998f34f9b7e6f950f15ee.jpg', '2013-07-31', '2015-05-11', '0000-00-00', 'jovens-talentos-para-a-cincia', 'jovens talentos aprovados computação ifsuldeminas muzambinho'),
(3, 'Olimpíada de Programação reúne alunos de vários Câmpus do IF', NULL, 'Equipes do IFSULDEMINAS – Câmpus Muzambinho garantem o 1° lugar nas categorias de Ensino Superior e Técnico da 3ª Olimpíada Interna de Programação – OLIP. Promovida pelo IFSULDEMINAS, a competição aconteceu no dia 22 de Junho de 2013 entre cerca de 100 estudantes e 31 equipes inscritas, sendo 16 na categoria Superior em Informática e 15 na categoria Técnico em Informática. O evento completo durou cerca de 7 horas tendo a competição ocorrido das 13 às 16 horas. O evento foi organizado pelos docentes do Câmpus Muzambinho, Heber, Aracele, Aline, Tiago Botelho e Gustavo Kyoshi, e também por docentes dos Câmpus de Passos, Machado, Inconfidentes e do Polo da Rede de Alterosa. De acordo com a professora Aracele Garcia de Oliveira Fassbinder, que integra a comissão organizadora, durante a competição, os participantes foram desafiados a resolver oito problemas nos quais deveriam criar programas de computador capazes de dar solução às situações propostas. As equipes que conseguiram resolver o maior número de questões em menos tempo foram as vencedoras. Durante a abertura do evento, a professora ainda citou a importância das olimpíadas já que a cada dia mais empresas de Tecnologia da Informaç', 'Equipes do IFSULDEMINAS – Câmpus Muzambinho garantem o 1° lugar nas categorias de Ensino Superior e Técnico da 3ª Olimpíada Interna de Programação – OLIP. Promovida pelo IFSULDEMINAS, a competição aconteceu no dia 22 de Junho de 2013 entre cerca de 100 estudantes e 31 equipes inscritas, sendo 16 na categoria Superior em Informática e 15 na categoria Técnico em Informática. O evento completo durou cerca de 7 horas tendo a competição ocorrido das 13 às 16 horas. O evento foi organizado pelos docentes do Câmpus Muzambinho, Heber, Aracele, Aline, Tiago Botelho e Gustavo Kyoshi, e também por docentes dos Câmpus de Passos, Machado, Inconfidentes e do Polo da Rede de Alterosa. De acordo com a professora Aracele Garcia de Oliveira Fassbinder, que integra a comissão organizadora, durante a competição, os participantes foram desafiados a resolver oito problemas nos quais deveriam criar programas de computador capazes de dar solução às situações propostas. As equipes que conseguiram resolver o maior número de questões em menos tempo foram as vencedoras. Durante a abertura do evento, a professora ainda citou a importância das olimpíadas já que a cada dia mais empresas de Tecnologia da Informaç', '23bf51f29eabad57c4f60d48c9752001.jpg', '2013-07-19', '2015-05-11', '0000-00-00', 'olimpada-de-programao-rene-alunos', 'equipes ifsuldeminas olip computação ifsuldeminas muzambinho'),
(4, 'TCC´s da Primeira Turma de Computação', 'TESTE', 'Alunos da primeira turma de formandos do curso de Bacharelado em Ciência da Computação apresentaram seus trabalhos de conclusão de curso durante os dias 01 e 04 de julho de 2013. Esta turma ingressou no câmpus Muzambinho em agosto de 2009 e a colação de grau está prevista para o início do segundo semestre de 2013. O trabalho de conclusão de curso, disposto nos períodos 7 e 8 da atual matriz curricular, consiste em uma monografia, que deve ser elaborada sob orientação acadêmica, e uma apresentação para banca examinadora, sob forma de seminário, aberto a comunidade. O desenvolvimento do TCC, segundo a professora Aracele Garcia de Oliveira Fassbinder, tem como objetivos consolidar os conhecimentos adquiridos durante o curso, integrar os alunos ao mercado de trabalho, orientar os alunos sobre como aprimorar seus conceitos e técnicas no desenvolvimento de projetos de pesquisa, dentre outros fatores que contribuam com a formação de um bom profissional Os alunos desenvolveram trabalhos em diversas áreas da computação, tais como Engenharia de Software, Computação Aplicada à Educação, Visão e Inteligência Computacional, Desenvolvimento Web e Mobile, Bioinformática, Robótica e Eletrônica, al', 'Alunos da primeira turma de formandos do curso de Bacharelado em Ciência da Computação apresentaram seus trabalhos de conclusão de curso durante os dias 01 e 04 de julho de 2013. Esta turma ingressou no câmpus Muzambinho em agosto de 2009 e a colação de grau está prevista para o início do segundo semestre de 2013. O trabalho de conclusão de curso, disposto nos períodos 7 e 8 da atual matriz curricular, consiste em uma monografia, que deve ser elaborada sob orientação acadêmica, e uma apresentação para banca examinadora, sob forma de seminário, aberto a comunidade. O desenvolvimento do TCC, segundo a professora Aracele Garcia de Oliveira Fassbinder, tem como objetivos consolidar os conhecimentos adquiridos durante o curso, integrar os alunos ao mercado de trabalho, orientar os alunos sobre como aprimorar seus conceitos e técnicas no desenvolvimento de projetos de pesquisa, dentre outros fatores que contribuam com a formação de um bom profissional Os alunos desenvolveram trabalhos em diversas áreas da computação, tais como Engenharia de Software, Computação Aplicada à Educação, Visão e Inteligência Computacional, Desenvolvimento Web e Mobile, Bioinformática, Robótica e Eletrônica, al', '50aa05c76d88f2bc637b95948533304a.jpg', '2013-07-19', '2015-05-11', '0000-00-00', 'tccs-da-primeira-turma-de', 'tcc primeira turma computação ifsuldeminas muzambinho'),
(5, 'Alunos no Exterior', NULL, '16 novos alunos do IFSULDEMINAS são aprovados no Ciência Sem Fronteiras.Entre eles estão os alunos do Curso Ciência da Computação: José Antônio Belquior Gomes, Lucas da Trindade e o Ricardo Vasconcelos de Carvalho Remédio. O IFSULDEMINAS já tem 21 alunos aprovados no Programa Ciência Sem Fronteiras. No dia 22 de agosto, saíram as listas de aprovação contemplando mais 16 estudantes, dos câmpus Inconfidentes, Machado e Muzambinho, que já se preparam para intercâmbio durante um ano em universidades dos EUA e Canadá.', '16 novos alunos do IFSULDEMINAS são aprovados no Ciência Sem Fronteiras.Entre eles estão os alunos do Curso Ciência da Computação: José Antônio Belquior Gomes, Lucas da Trindade e o Ricardo Vasconcelos de Carvalho Remédio. O IFSULDEMINAS já tem 21 alunos aprovados no Programa Ciência Sem Fronteiras. No dia 22 de agosto, saíram as listas de aprovação contemplando mais 16 estudantes, dos câmpus Inconfidentes, Machado e Muzambinho, que já se preparam para intercâmbio durante um ano em universidades dos EUA e Canadá.', '9c89b4e3b0cf0358c8d35861450fdc49.jpg', '2013-08-14', '2015-05-11', '0000-00-00', 'alunos-no-exterior', 'alunos exterior aprovado ifsuldeminas muzambinho'),
(6, 'Cisco Networking Academy', NULL, 'Professores do Câmpus Muzambinho participam de treinamento pela Cisco Networking Academy.             Entre os dias 26 e 30 de agosto, os professores do IFSULDEMINAS – Câmpus Muzambinho, Marcos Celso Rodrigues e Tiago Gonçalves Botelho, participaram de um treinamento no IFRJ - Instituto Federal do Rio de Janeiro, promovido pela Cisco, empresa especializada em networking, através de uma parceria entre os Institutos Federais.            O programa foi lançado em 1997 e já alcançou mais de 10 mil instituições educacionais, em mais de 150 países, com currículos ministrados em nove idiomas. O treinamento busca, através de um modelo educacional, preparar os alunos em escolas secundárias, faculdades e universidades, escolas técnicas e militares, e em organizações comunitárias, para desenvolverem carreiras em redes e TI, tanto no setor público como no privado. Busca também incentivar os estudos superiores nas áreas de engenharia, ciências da computação e outras áreas afins.veja mais em: http://www.muz.ifsuldeminas.edu.br/index.php/component/content/article/2200-cisco-networking-academy', 'Professores do Câmpus Muzambinho participam de treinamento pela Cisco Networking Academy.             Entre os dias 26 e 30 de agosto, os professores do IFSULDEMINAS – Câmpus Muzambinho, Marcos Celso Rodrigues e Tiago Gonçalves Botelho, participaram de um treinamento no IFRJ - Instituto Federal do Rio de Janeiro, promovido pela Cisco, empresa especializada em networking, através de uma parceria entre os Institutos Federais.            O programa foi lançado em 1997 e já alcançou mais de 10 mil instituições educacionais, em mais de 150 países, com currículos ministrados em nove idiomas. O treinamento busca, através de um modelo educacional, preparar os alunos em escolas secundárias, faculdades e universidades, escolas técnicas e militares, e em organizações comunitárias, para desenvolverem carreiras em redes e TI, tanto no setor público como no privado. Busca também incentivar os estudos superiores nas áreas de engenharia, ciências da computação e outras áreas afins.veja mais em: http://www.muz.ifsuldeminas.edu.br/index.php/component/content/article/2200-cisco-networking-academy', '422e6293abcb1a66a86b0e456c51cbac.jpg', '2013-09-05', '2015-05-11', '0000-00-00', 'cisco-networking-academy', 'networking academy treinamento professores ifsuldeminas muzambinho'),
(7, 'Aluna do Curso de Ciência da Computação do Câmpus Muzambinho tem trabalho publicado na SQL Magazine', '', 'Trabalho de Conclusão de Curso da aluna Fernanda Delizete Madeira, defendido em julho de 2013, é aceito na edição de setembro da SQL Magazine do Grupo DevMedia. A publicação apresenta os resultados obtidos na pesquisa orientada pela professora Aracele Garcia de Oliveira Fassbinder.\r\n\r\nFernanda faz parte da primeira turma de formandos do curso de Ciência da Computação que teve seu início em 2009 e atuou como estagiária no LabSoft – Laboratório de Tecnologias de Software e Computação Aplicada à Educação do Câmpus Muzambinho.', 'Trabalho de Conclusão de Curso da aluna Fernanda Delizete Madeira, defendido em julho de 2013, é aceito na edição de setembro da SQL Magazine do Grupo DevMedia. A publicação apresenta os resultados obtidos na pesquisa orientada pela professora Aracele Garcia de Oliveira Fassbinder.\r\n\r\nFernanda faz parte da primeira turma de formandos do curso de Ciência da Computação que teve seu início em 2009 e atuou como estagiária no LabSoft – Laboratório de Tecnologias de Software e Computação Aplicada à Educação do Câmpus Muzambinho.', '9936b1b3a92f1df1b49a402f52174eb9.png', '2013-09-23', '2015-05-11', '0000-00-00', 'aluna-do-curso-de-cincia', 'aluna magazine sql publicado computação ifsuldeminas muzambinho'),
(8, 'Vestibular 2014/ 1º semestre', NULL, 'Inscrições abertas de 7 de outubro a 07 de novembro de 2013. Para mais informações:    http://www.ifsuldeminas.edu.br/~vestibular/index.php/processos-seletivos/abertos/194-vestibular-2014-1o-semestre      ', 'Inscrições abertas de 7 de outubro a 07 de novembro de 2013. Para mais informações:    http://www.ifsuldeminas.edu.br/~vestibular/index.php/processos-seletivos/abertos/194-vestibular-2014-1o-semestre      ', '15a0d177917453d475c84bd8a7bcc8f2.jpg', '2013-09-27', '2015-05-11', '0000-00-00', 'vestibular-2014-1-semestre', 'vestibular semestre novembro ifsuldeminas muzambinho'),
(9, 'Equipes de alunos do curso de Ciência da Computação participam da primeira fase da XVIII Maratona de Programação.', NULL, 'Ocorreu no dia 14 de setembro, no Centro Universitário de Itajubá - FEPI, a primeira etapa da XVIII Maratona de Programação realizada pela Sociedade Brasileira de Computação – SBC.A escolha das equipes do IFSULDEMINAS – Câmpus Muzambinho que participaram da competição, se deu através da OLIP - III Olimpíada Interna de Programação realizada em junho de 2013 no Câmpus.As três equipes com a melhor classificação na OLIP foram as selecionadas para representar o Instituto na XVIII Maratona de Programação que teve a parte da manha para o aquecimento e o período das 14 as 19 horas para a disputa.Competiram 21 times, com três integrantes cada, provenientes de oito instituições distintas. A competição foi realizada, simultaneamente, em várias cidades do Brasil, e os alunos tinham que resolver um caderno com 10 problemas e sugerir algoritmos que os solucionassem. Continue lendo...http://www.muz.ifsuldeminas.edu.br/index.php/eventos/2246-maratona-de-programacao', 'Ocorreu no dia 14 de setembro, no Centro Universitário de Itajubá - FEPI, a primeira etapa da XVIII Maratona de Programação realizada pela Sociedade Brasileira de Computação – SBC.A escolha das equipes do IFSULDEMINAS – Câmpus Muzambinho que participaram da competição, se deu através da OLIP - III Olimpíada Interna de Programação realizada em junho de 2013 no Câmpus.As três equipes com a melhor classificação na OLIP foram as selecionadas para representar o Instituto na XVIII Maratona de Programação que teve a parte da manha para o aquecimento e o período das 14 as 19 horas para a disputa.Competiram 21 times, com três integrantes cada, provenientes de oito instituições distintas. A competição foi realizada, simultaneamente, em várias cidades do Brasil, e os alunos tinham que resolver um caderno com 10 problemas e sugerir algoritmos que os solucionassem. Continue lendo...http://www.muz.ifsuldeminas.edu.br/index.php/eventos/2246-maratona-de-programacao', '8e0226a0402be6163c9c6242c85730cf.jpg', '2013-09-27', '2015-05-11', '0000-00-00', 'equipes-de-alunos-do-curso', 'equipes curso maratona programação computação ifsuldeminas muzambinho'),
(10, 'Feira de Estágios', NULL, 'O Instituto Federal de Educação, Ciência e Tecnologia do Sul de Minas Gerais (IFSULDEMINAS) realiza, nos dias 22 e 23 de outubro, no Câmpus Muzambinho, a I Feira de Estágio e Emprego. O evento reunirá cerca de 15 empresas interessadas em contratar estudantes que desejam adquirir experiência em oportunidades de estágio. Alunos que estão prestes a se graduar ou que são recém-formados também poderão participar, uma vez que algumas das empresas farão cadastro de currículos. A feira é aberta a estudantes de quaisquer instituições de ensino da região.\n\nAs atividades serão realizadas no ginásio poliesportivo do Câmpus Muzambinho, a partir de 12h. Na terça-feira, a abertura oficial está marcada para 13h e será seguida pela palestra “Como se tornar atraente para o mercado de trabalho”, ministrada pelo psicólogo André Tomé. O evento receberá o apoio da Associação Comercial e Industrial de Pouso Alegre (Acipa).\n\n\n Confira:http://www.ifsuldeminas.edu.br/index.php/pt/noticias/2518-feira-de-estagios', 'O Instituto Federal de Educação, Ciência e Tecnologia do Sul de Minas Gerais (IFSULDEMINAS) realiza, nos dias 22 e 23 de outubro, no Câmpus Muzambinho, a I Feira de Estágio e Emprego. O evento reunirá cerca de 15 empresas interessadas em contratar estudantes que desejam adquirir experiência em oportunidades de estágio. Alunos que estão prestes a se graduar ou que são recém-formados também poderão participar, uma vez que algumas das empresas farão cadastro de currículos. A feira é aberta a estudantes de quaisquer instituições de ensino da região.\n\nAs atividades serão realizadas no ginásio poliesportivo do Câmpus Muzambinho, a partir de 12h. Na terça-feira, a abertura oficial está marcada para 13h e será seguida pela palestra “Como se tornar atraente para o mercado de trabalho”, ministrada pelo psicólogo André Tomé. O evento receberá o apoio da Associação Comercial e Industrial de Pouso Alegre (Acipa).\n\n\n Confira:http://www.ifsuldeminas.edu.br/index.php/pt/noticias/2518-feira-de-estagios', 'd07373f09c8d72bc46624969832307aa.jpg', '2013-10-22', '2015-05-11', '0000-00-00', 'feira-de-estgios', 'feira estágios evento estudantes ifsuldeminas muzambinho'),
(11, 'Alunos da Ciência da Computação realizam viagem técnica à S)', NULL, 'Alunos do curso de Ciência da Computação do IFSULDEMINAS - Campus Muzambinho, acompanhados pelo professor Heber Rocha Moreira, realizaram, em 25 de outubro, viagem técnica à Santa Rita de Sapucaí (MG), município localizado na região conhecida como Vale da Eletrônica, com o intuito de visitar a 32ª Feira Tecnológica do Inatel (Fetin). No evento, foram expostos vários projetos de diferentes níveis e complexidade, pelos quais os alunos puderam ver aplicações dos fundamentos e conceitos de disciplinas lecionadas no curso. Na ocasião, os alunos também visitaram a 24ª Feira de Tecnologia da FAI (FAITEC). ', 'Alunos do curso de Ciência da Computação do IFSULDEMINAS - Campus Muzambinho, acompanhados pelo professor Heber Rocha Moreira, realizaram, em 25 de outubro, viagem técnica à Santa Rita de Sapucaí (MG), município localizado na região conhecida como Vale da Eletrônica, com o intuito de visitar a 32ª Feira Tecnológica do Inatel (Fetin). No evento, foram expostos vários projetos de diferentes níveis e complexidade, pelos quais os alunos puderam ver aplicações dos fundamentos e conceitos de disciplinas lecionadas no curso. Na ocasião, os alunos também visitaram a 24ª Feira de Tecnologia da FAI (FAITEC). ', '32473379dc1ba40aaf77cd82183d2913.jpg', '2013-11-02', '2015-05-11', '0000-00-00', 'alunos-da-cincia-da-computao', 'alunos curso viagem técnica feira evento computação ifsuldeminas muzambinho'),
(12, 'Processo de Tranferência', NULL, 'O IFSULDEMINAS - Câmpus Muzambinho receberá, até o dia 09 de dezembro , inscrições de interessados em participar do processo de transferência interna ou externa dos cursos de graduação. O processo de transferência se dará de acordo com a resolução n° 28/2011 (Normativa de Transferência – Conselho Superior - IFSULDEMINAS), através da Secretaria de Registros Acadêmicos dos Cursos Superiores do IFSULDEMINAS - Câmpus Muzambinho.Serão vagas para transferência interna ou externa dos cursos de Graduação e para portadores de diploma de ensino superior para preenchimento de vagas ociosas de curso similar ou área afim de Instituições de Ensino Superior.Constam em edital as vagas disponíveis entre licenciatura e bacharelado em Educação Física, licenciatura em Ciências Biológicas, bacharelado em Ciências da Computação e Engenharia Agronômica.Os interessados deverão comparecer à Secretaria de Registros Escolares, munidos da documentação prevista em edital, no período de 29 de novembro até 09 de dezembro de 2013, para efetuar sua inscrição. Local: Secretaria escolar do IFSULDEMINAS - Câmpus MuzambinhoEstrada de Muzambinho, km 35, Bairro Morro Preto – Muzambinho/MG.Horário: 08h00 às 10h30 e de 14', 'O IFSULDEMINAS - Câmpus Muzambinho receberá, até o dia 09 de dezembro , inscrições de interessados em participar do processo de transferência interna ou externa dos cursos de graduação. O processo de transferência se dará de acordo com a resolução n° 28/2011 (Normativa de Transferência – Conselho Superior - IFSULDEMINAS), através da Secretaria de Registros Acadêmicos dos Cursos Superiores do IFSULDEMINAS - Câmpus Muzambinho.Serão vagas para transferência interna ou externa dos cursos de Graduação e para portadores de diploma de ensino superior para preenchimento de vagas ociosas de curso similar ou área afim de Instituições de Ensino Superior.Constam em edital as vagas disponíveis entre licenciatura e bacharelado em Educação Física, licenciatura em Ciências Biológicas, bacharelado em Ciências da Computação e Engenharia Agronômica.Os interessados deverão comparecer à Secretaria de Registros Escolares, munidos da documentação prevista em edital, no período de 29 de novembro até 09 de dezembro de 2013, para efetuar sua inscrição. Local: Secretaria escolar do IFSULDEMINAS - Câmpus MuzambinhoEstrada de Muzambinho, km 35, Bairro Morro Preto – Muzambinho/MG.Horário: 08h00 às 10h30 e de 14', '6216971bf0f9015f54109875162242ef.jpg', '2013-12-10', '2015-05-11', '0000-00-00', 'processo-de-tranferncia', 'processo transferência entre curso computação ifsuldeminas muzambinho'),
(13, 'Alunos de Ciência da Computação apresentaram o I Seminário A', NULL, 'No último dia 06, ocorreu no Câmpus Muzambinho o I Seminário Acadêmico da Disciplina de Metodologia de Pesquisa em Ciência da Computação. Foram apresentados doze trabalhos científicos dos alunos do 2º período do curso de Ciências da Computação.Para a professora organizadora, Aracele Garcia de Oliveira Fassbinder, o Seminário é uma oportunidade de fomento à prática da iniciação científica pelos alunos da disciplina de Metodologia de Pesquisa em Ciência da Computação. No seminário, os trabalhos apresentados foram avaliados pela banca composta pelos professores Heber, Aline e Ieda.Os alunos puderam escolher uma área de pesquisa e desenvolver seu projeto de pesquisa, de acordo com o modelo exigido pelo NIPE. Além de executar esse trabalho, um artigo científico foi escrito pelos estudantes. Todo esse processo antecedeu a apresentação oral feita no Seminário Acadêmico - para mais detalhes: http://www.muz.ifsuldeminas.edu.br/index.php/gerais/2481-seminario', 'No último dia 06, ocorreu no Câmpus Muzambinho o I Seminário Acadêmico da Disciplina de Metodologia de Pesquisa em Ciência da Computação. Foram apresentados doze trabalhos científicos dos alunos do 2º período do curso de Ciências da Computação.Para a professora organizadora, Aracele Garcia de Oliveira Fassbinder, o Seminário é uma oportunidade de fomento à prática da iniciação científica pelos alunos da disciplina de Metodologia de Pesquisa em Ciência da Computação. No seminário, os trabalhos apresentados foram avaliados pela banca composta pelos professores Heber, Aline e Ieda.Os alunos puderam escolher uma área de pesquisa e desenvolver seu projeto de pesquisa, de acordo com o modelo exigido pelo NIPE. Além de executar esse trabalho, um artigo científico foi escrito pelos estudantes. Todo esse processo antecedeu a apresentação oral feita no Seminário Acadêmico - para mais detalhes: http://www.muz.ifsuldeminas.edu.br/index.php/gerais/2481-seminario', '74d7e5e2bada57a98b3adc5ca3159076.jpg', '2013-12-13', '2015-05-11', '0000-00-00', 'alunos-de-cincia-da-computao', 'seminário pesquisa acadêmico metodologia computação ifsuldeminas muzambinho'),
(14, 'IFSULDEMINAS tem 401 vagas para cursos de graduação com ingresso pelo Sisu', NULL, 'Aberto nesta segunda-feira, 6 de janeiro, o período de inscrição para o Sistema de Seleção Unificada (Sisu) do Ministério da Educação. O Instituto Federal do Sul de Minas disponibilizou 401 vagas, sendo 163 para o Câmpus Inconfidentes, 133 para o Câmpus Machado e 105 vagas para o Câmpus Muzambinho. Os interessados terão prazo até às 23h59 do dia 10 de janeiro para fazer a inscrição on-line. Nesta primeira edição de 2014, o estudante pode fazer até duas opções de curso.O Sisu seleciona candidatos com base nas notas obtidas no Exame Nacional do Ensino Médio (Enem) 2013. Fica impedido de se inscrever aquele que tenha tirado zero na prova de redação.O CURSO DE CIÊNCIA DA COMPUTAÇÃO POSSUI 21 VAGASMais informações? Acesse http://www.ifsuldeminas.edu.br/index.php/en/noticias/2907-sisu-2014', 'Aberto nesta segunda-feira, 6 de janeiro, o período de inscrição para o Sistema de Seleção Unificada (Sisu) do Ministério da Educação. O Instituto Federal do Sul de Minas disponibilizou 401 vagas, sendo 163 para o Câmpus Inconfidentes, 133 para o Câmpus Machado e 105 vagas para o Câmpus Muzambinho. Os interessados terão prazo até às 23h59 do dia 10 de janeiro para fazer a inscrição on-line. Nesta primeira edição de 2014, o estudante pode fazer até duas opções de curso.O Sisu seleciona candidatos com base nas notas obtidas no Exame Nacional do Ensino Médio (Enem) 2013. Fica impedido de se inscrever aquele que tenha tirado zero na prova de redação.O CURSO DE CIÊNCIA DA COMPUTAÇÃO POSSUI 21 VAGASMais informações? Acesse http://www.ifsuldeminas.edu.br/index.php/en/noticias/2907-sisu-2014', '4bcc7fe2d96f3532359341472b1dab47.jpg', '2014-06-26', '2015-05-11', '0000-00-00', 'ifsuldeminas-tem-401-vagas-para', '401 vagas sisu curso computação ifsuldeminas muzambinho'),
(15, 'FAPEMIG concede novas bolsas de Iniciação Científica para o IFSULDEMINAS', NULL, 'O Instituto Federal de Educação, Ciência e Tecnologia do Sul de Minas (IFSULDEMINAS) foi contemplado, neste mês de janeiro, com 10 novas bolsas para Iniciação Científica (IC) pela Fundação de Amparo à Pesquisa do Estado de Minas Gerais (Fapemig) na modalidade BIC (Programa Institucional de Bolsas de Iniciação Científica).Em comparação com o ano passado, a cota de bolsas para IC provindas do BIC, destinadas a alunos dos cursos superiores do Instituto Federal, de 20 passou para 30 bolsas. Em outro programa da Fapemig, o BIC-JR (Programa Institucional de Bolsas de Iniciação Científica Júnior), a cota de bolsas designadas para o EnsinoMédio/Técnico permanece em 20.Confira - http://www.ifsuldeminas.edu.br/index.php/pt/noticias/2958-iniciacao-cientifica', 'O Instituto Federal de Educação, Ciência e Tecnologia do Sul de Minas (IFSULDEMINAS) foi contemplado, neste mês de janeiro, com 10 novas bolsas para Iniciação Científica (IC) pela Fundação de Amparo à Pesquisa do Estado de Minas Gerais (Fapemig) na modalidade BIC (Programa Institucional de Bolsas de Iniciação Científica).Em comparação com o ano passado, a cota de bolsas para IC provindas do BIC, destinadas a alunos dos cursos superiores do Instituto Federal, de 20 passou para 30 bolsas. Em outro programa da Fapemig, o BIC-JR (Programa Institucional de Bolsas de Iniciação Científica Júnior), a cota de bolsas designadas para o EnsinoMédio/Técnico permanece em 20.Confira - http://www.ifsuldeminas.edu.br/index.php/pt/noticias/2958-iniciacao-cientifica', '6221bda2c2fd697a4418b7269dc556cf.jpg', '2014-01-27', '2015-05-11', '0000-00-00', 'fapemig-concede-novas-bolsas-de', 'concede novas bolsas fapemig iniciação científica ifsuldeminas'),
(16, 'Programa Auxílio Estudantil – ANO 2014 – Primeiro Semestre', NULL, 'O Edital destina-se a identificar e selecionar, estudantes do IFSULDEMINAS matriculados em cursos presenciais de nível técnico profissionalizante, tecnológico e de graduação, na modalidade presencial, em situação de vulnerabilidade socioeconômica, visando às ofertas de auxílio alimentação, auxílio creche, auxílio transporte, auxílio material didático e auxílio moradia, promovendo condições de permanência e êxito do estudante.\n\nFaça o download e leia atentamente - http://www.ifsuldeminas.edu.br/auxilioestudantil/edital/Edital3.pdf', 'O Edital destina-se a identificar e selecionar, estudantes do IFSULDEMINAS matriculados em cursos presenciais de nível técnico profissionalizante, tecnológico e de graduação, na modalidade presencial, em situação de vulnerabilidade socioeconômica, visando às ofertas de auxílio alimentação, auxílio creche, auxílio transporte, auxílio material didático e auxílio moradia, promovendo condições de permanência e êxito do estudante.\n\nFaça o download e leia atentamente - http://www.ifsuldeminas.edu.br/auxilioestudantil/edital/Edital3.pdf', 'a00b0aa78ea190e56b934a9142f64ced.jpg', '2014-01-28', '2015-05-11', '0000-00-00', 'programa-auxlio-estudantil-ano', 'programa auxílio estudantil 2014 computação ifsuldeminas muzambinho'),
(17, 'Aprovação em Mestrado na UFSCAR', NULL, ' O ex-aluno do curso de Ciência da Computação do IFSULDEMINAS – Câmpus Muzambinho, Marcelo Rodrigo de Castro, turma 2009/2 - 2013/1, é aprovado no programa de pós-graduação stricto sensu, nível Mestrado, na Universidade Federal de São Carlos, UFSCAR.\nA linha de pesquisa escolhida é SISTEMAS DISTRIBUÍDOS E REDES DE COMPUTADORES. Marcelo Castrofoi um aluno que participou ativamente do curso, atuando como facilitador em oficinas, membro da organização de eventos, bem como em projetos de pesquisa.\n ', ' O ex-aluno do curso de Ciência da Computação do IFSULDEMINAS – Câmpus Muzambinho, Marcelo Rodrigo de Castro, turma 2009/2 - 2013/1, é aprovado no programa de pós-graduação stricto sensu, nível Mestrado, na Universidade Federal de São Carlos, UFSCAR.\nA linha de pesquisa escolhida é SISTEMAS DISTRIBUÍDOS E REDES DE COMPUTADORES. Marcelo Castrofoi um aluno que participou ativamente do curso, atuando como facilitador em oficinas, membro da organização de eventos, bem como em projetos de pesquisa.\n ', 'e7538f1ccc6fdbb450c9c6c53dc64f33.jpg', '2014-02-14', '2015-05-11', '0000-00-00', 'aprovao-em-mestrado-na-ufscar', 'mestrado ufscar  aprovação ex-aluno computação ifsuldeminas muzambinho'),
(18, 'Câmpus Muzambinho receberá inscrições para o processo de transferência interna ou externa', NULL, 'O IFSULDEMINAS - Câmpus Muzambinho receberá, até 27 de junho de 2014, inscrições de interessados em participar do processo de transferência interna ou externa dos cursos de graduação.O processo de transferência se dará de acordo com a resolução n° 28/2011 (Normativa de Transferência – Conselho Superior - IFSULDEMINAS), através da Secretaria de Registros Acadêmicos dos Cursos Superiores do IFSULDEMINAS - Câmpus Muzambinho.Serão vagas para transferência interna ou externa dos cursos de Graduação e para portadores de diploma de ensino superior para preenchimento de vagas ociosas de curso similar ou área afim de Instituições de Ensino Superior.confira>: http://www.muz.ifsuldeminas.edu.br/index.php/espaco-do-aluno/127-espaco-do-aluno/2929-transferencia-2014-inscricoes-abertas', 'O IFSULDEMINAS - Câmpus Muzambinho receberá, até 27 de junho de 2014, inscrições de interessados em participar do processo de transferência interna ou externa dos cursos de graduação.O processo de transferência se dará de acordo com a resolução n° 28/2011 (Normativa de Transferência – Conselho Superior - IFSULDEMINAS), através da Secretaria de Registros Acadêmicos dos Cursos Superiores do IFSULDEMINAS - Câmpus Muzambinho.Serão vagas para transferência interna ou externa dos cursos de Graduação e para portadores de diploma de ensino superior para preenchimento de vagas ociosas de curso similar ou área afim de Instituições de Ensino Superior.confira>: http://www.muz.ifsuldeminas.edu.br/index.php/espaco-do-aluno/127-espaco-do-aluno/2929-transferencia-2014-inscricoes-abertas', 'd79e99d6d85fe508a049661ddbf133ac.jpg', '2014-06-26', '2015-05-11', '0000-00-00', 'cmpus-muzambinho-receber-inscries-para', 'processo transferência interna entre cursos computaçao muzambinho ifsuldeminas'),
(19, 'ATENÇÃO ALUNOS QUE ESTÃO CONCLUINDO O CURSO ATÉ AGOSTO/2015!', NULL, 'Todo aluno provável formando no 2º semestre de 2014 ou no 1º semestre de 2015 deverá fazer o ENADE, se o seu nome não consta da lista (anexo) procurar com urgência a Coordenação de Curso para inclusão até dia 29/08/2014 às 16 horas.\nNa página do INEP você encontra o Manual do aluno, bem como provas anteriores e demais informações sobre o ENADE.\nAcesse o site do ENADE para maiores informações!    http://portal.inep.gov.br/enade/\nNome \nALEX SANTINI CONCLUINTE   \nDANIEL CORREIA CONCLUINTE \nDOUGLAS FALCONI NICOLA CONCLUINTE  \nERIC DOMINGOS DA SILVA CONCLUINTE\nEVERSON FELIX LEITE CONCLUINTE  \nFRANCISCO BALBINO NETO CONCLUINTE  \nFRANCISCO JOSE NARDI FILHO CONCLUINTE  \nGILVAN CORREA RODRIGUES CONCLUINTE  \nGUILHERME MASSAHIKO IOSHIMINE CONCLUINTE  \nLEANDRO MARQUES REZENDE CONCLUINTE  \nMARCELO FASSBINDER CONCLUINTE \nNILVA ALICE GASPAR CONCLUINTE\nPAULO RICARDO DA SILVA CONCLUINTE \nRODOLFO CESAR DOS SANTOS CONCLUINTE \nROSANE FERNANDES NASCIMENTO CONCLUINTE \nTHOMAZ ANTONIO CAMARGO PINTO CORREA CONCLUINTE\nVITOR FALTZ DIAS CONCLUINTE \nWAGNER MONTEIRO AZEVEDO SANTOS CONCLUINTE \nLocal da Prova: Muzambinho!', 'Todo aluno provável formando no 2º semestre de 2014 ou no 1º semestre de 2015 deverá fazer o ENADE, se o seu nome não consta da lista (anexo) procurar com urgência a Coordenação de Curso para inclusão até dia 29/08/2014 às 16 horas.\nNa página do INEP você encontra o Manual do aluno, bem como provas anteriores e demais informações sobre o ENADE.\nAcesse o site do ENADE para maiores informações!    http://portal.inep.gov.br/enade/\nNome \nALEX SANTINI CONCLUINTE   \nDANIEL CORREIA CONCLUINTE \nDOUGLAS FALCONI NICOLA CONCLUINTE  \nERIC DOMINGOS DA SILVA CONCLUINTE\nEVERSON FELIX LEITE CONCLUINTE  \nFRANCISCO BALBINO NETO CONCLUINTE  \nFRANCISCO JOSE NARDI FILHO CONCLUINTE  \nGILVAN CORREA RODRIGUES CONCLUINTE  \nGUILHERME MASSAHIKO IOSHIMINE CONCLUINTE  \nLEANDRO MARQUES REZENDE CONCLUINTE  \nMARCELO FASSBINDER CONCLUINTE \nNILVA ALICE GASPAR CONCLUINTE\nPAULO RICARDO DA SILVA CONCLUINTE \nRODOLFO CESAR DOS SANTOS CONCLUINTE \nROSANE FERNANDES NASCIMENTO CONCLUINTE \nTHOMAZ ANTONIO CAMARGO PINTO CORREA CONCLUINTE\nVITOR FALTZ DIAS CONCLUINTE \nWAGNER MONTEIRO AZEVEDO SANTOS CONCLUINTE \nLocal da Prova: Muzambinho!', 'f6775b548f78bd1e2c00bbd7dd797185.jpg', '2014-08-28', '2015-05-11', '0000-00-00', 'ateno-alunos-que-esto-concluindo', 'concluinte enade 2015 computação ifsuldeminas muzambinho'),
(20, 'Equipes de alunos do curso de Ciência da Computação participam da primeira fase da XIX Maratona de Programação.', NULL, 'Ocorreu no dia 13 de setembro, na Universidade Federal de Itajubá - UNIFEI, a primeira etapa da XIX Maratona de Programação realizada pela Sociedade Brasileira de Computação – SBC.A escolha das equipes do IFSULDEMINAS – Câmpus Muzambinho que participaram da competição, se deu através da IV OLIP - Olimpíada Interna de Programação realizada em junho de 2014 no Câmpus.As três equipes com a melhor classificação na OLIP foram as selecionadas para representar o Instituto na XIX Maratona de Programação que teve a parte da manhã para o aquecimento e o período das 14 as 19 horas para a disputa. Competiram 21 times, com três integrantes cada, provenientes de sete instituições distintas. A competição foi realizada, simultaneamente, entre 643 times em 41 sedes espalhadas pelo Brasil, e os alunos tinham que resolver um caderno com 11 problemas e sugerir algoritmos que os solucionassem.As equipes do Câmpus Muzambinho, que marcaram presença no evento pelo quinto ano consecutivo, obtiveram, no final, as classificações de 5º, 9º e 10º lugar. Além disso, as mesmas equipes ficaram entre as 100 melhores do Brasil, em um ranking geral. Além disto, foram mais dois alunos como reservas e os mesmos também', 'Ocorreu no dia 13 de setembro, na Universidade Federal de Itajubá - UNIFEI, a primeira etapa da XIX Maratona de Programação realizada pela Sociedade Brasileira de Computação – SBC.A escolha das equipes do IFSULDEMINAS – Câmpus Muzambinho que participaram da competição, se deu através da IV OLIP - Olimpíada Interna de Programação realizada em junho de 2014 no Câmpus.As três equipes com a melhor classificação na OLIP foram as selecionadas para representar o Instituto na XIX Maratona de Programação que teve a parte da manhã para o aquecimento e o período das 14 as 19 horas para a disputa. Competiram 21 times, com três integrantes cada, provenientes de sete instituições distintas. A competição foi realizada, simultaneamente, entre 643 times em 41 sedes espalhadas pelo Brasil, e os alunos tinham que resolver um caderno com 11 problemas e sugerir algoritmos que os solucionassem.As equipes do Câmpus Muzambinho, que marcaram presença no evento pelo quinto ano consecutivo, obtiveram, no final, as classificações de 5º, 9º e 10º lugar. Além disso, as mesmas equipes ficaram entre as 100 melhores do Brasil, em um ranking geral. Além disto, foram mais dois alunos como reservas e os mesmos também', '2671f1a7efd68f366c9d4fac42c16e44.jpg', '2014-09-19', '2015-05-11', '0000-00-00', 'equipes-de-alunos-do-curso', 'unifei maratona programação sbc computação muzambinho ifsuldeminas'),
(21, 'IFSULDEMINAS lança edital do Vestibular 2015', NULL, 'O Instituto Federal do Sul de Minas (IFSULDEMINAS) publicou na quarta-feira, 24 de setembro, o edital para o Vestibular 2015 do 1º semestre, que oferta cursos nos câmpus Inconfidentes, Machado, Muzambinho, Passos, Poços de Caldas, Pouso Alegre e nos câmpus avançados Três Corações e Carmo de Minas. Neste processo seletivo, o número de vagas abertas em cursos presenciais será o maior já oferecido: serão 3.150. Além dos cursos conhecidos, os candidatos poderão escolher outras 14 novas opções de formação, sendo cinco cursos técnicos e nove superiores, aprovados pelo Conselho Superior no dia 9 de setembro.Com destaque para o  curso de Bacharelado em Ciência da Computação.30 Vagas. Conceito 4 (MEC).Diversos laboratórios temáticos (Lab de Redes/Sistemas Distribuídos/Programação Paralela, Lab de Robótica/Eletrônica/Sistemas Digitais, Hardware, Lab de Hardware e Arquitetura de Computadores, Laboratórios de Programação), além de ambientes e grupos de pesquisa, tal como o Laboratório de Tecnologias de Software e Computação Aplicada à Eduação. Maiores informações em: http://www.ifsuldeminas.edu.br/index.php/pt/noticias/3451-edital-publicado', 'O Instituto Federal do Sul de Minas (IFSULDEMINAS) publicou na quarta-feira, 24 de setembro, o edital para o Vestibular 2015 do 1º semestre, que oferta cursos nos câmpus Inconfidentes, Machado, Muzambinho, Passos, Poços de Caldas, Pouso Alegre e nos câmpus avançados Três Corações e Carmo de Minas. Neste processo seletivo, o número de vagas abertas em cursos presenciais será o maior já oferecido: serão 3.150. Além dos cursos conhecidos, os candidatos poderão escolher outras 14 novas opções de formação, sendo cinco cursos técnicos e nove superiores, aprovados pelo Conselho Superior no dia 9 de setembro.Com destaque para o  curso de Bacharelado em Ciência da Computação.30 Vagas. Conceito 4 (MEC).Diversos laboratórios temáticos (Lab de Redes/Sistemas Distribuídos/Programação Paralela, Lab de Robótica/Eletrônica/Sistemas Digitais, Hardware, Lab de Hardware e Arquitetura de Computadores, Laboratórios de Programação), além de ambientes e grupos de pesquisa, tal como o Laboratório de Tecnologias de Software e Computação Aplicada à Eduação. Maiores informações em: http://www.ifsuldeminas.edu.br/index.php/pt/noticias/3451-edital-publicado', '4bb20078b44b51e813fee73b6699ee55.png', '2014-10-06', '2015-05-11', '0000-00-00', 'ifsuldeminas-lana-edital-do-vestibular', 'edital vestibular 2015 computação ifsuldeminas muzambinho'),
(22, '1ª Mostra de Softwares promove palestras e divulga trabalhos desenvolvidos por alunos do Câmpus Muzambinho', NULL, 'No dia 23 de setembro, aconteceu a 1ª Mostra de Softwares do IFSULDEMINAS - Câmpus Muzambinho. Destinado aos estudantes dos cursos da Ciência da Computação e dos cursos Técnicos de Informática Integrado e Subsequente, o objetivo desse evento é divulgar os softwares desenvolvidos pelos próprios alunos do Câmpus e incentivá-los na realização de projetos de tecnologia.\"Conscientizar os alunos sobre a importância e oportunidades da área de desenvolvimento de software. Além de estimulá-los a colocarem em prática os conceitos teóricos aprendidos durante o curso\", comentou a professora Aline Marques Del Valle.Confera: <a href=\"http://www.muz.ifsuldeminas.edu.br/index.php/eventos/3118-1a-mostra-de-softwares-acontece-no-campus\">Site do IFSULDEMINAS</a>', 'No dia 23 de setembro, aconteceu a 1ª Mostra de Softwares do IFSULDEMINAS - Câmpus Muzambinho. Destinado aos estudantes dos cursos da Ciência da Computação e dos cursos Técnicos de Informática Integrado e Subsequente, o objetivo desse evento é divulgar os softwares desenvolvidos pelos próprios alunos do Câmpus e incentivá-los na realização de projetos de tecnologia.\"Conscientizar os alunos sobre a importância e oportunidades da área de desenvolvimento de software. Além de estimulá-los a colocarem em prática os conceitos teóricos aprendidos durante o curso\", comentou a professora Aline Marques Del Valle.Confera: Site do IFSULDEMINAS', 'a09479fbbe0277ceee786e23d28f2ca3.jpg', '2014-10-06', '2015-05-11', '0000-00-00', '1-mostra-de-softwares-promove', 'mostra softwares computação ifsuldeminas muzambinho'),
(23, 'Apresentação no Exterior', NULL, '<p>A aluna do curso de Ciência da Computação, Nilva Alice Gaspar, apresentou trabalho em forma de pôster na \"XV Reunion Binacional Uruguai - Argentina de Agrometeorologia\", realizado em Piriapolis, no Uruguai, entre os dias 01 e 03 de outubro.</p><p>O trabalho apresentou o software System for Water Balance (SYSWAB) que consiste em uma ferramenta que gerencia e transforma dados em informações mais práticas no auxílio de monitoramento das condições climáticas para a agricultura. Também realiza estimativas de produtividade de qualquer cultivo de interesse, ajudando no planejamento agrícola.</p><p>Sob a orientação do prof. Tiago Gonçalves Botelho e co-orientação do prof. Paulo Sergio de Souza, ambos do Câmpus Muzambinho, o trabalho conta com a colaboração do Prof. Glauco de Souza Rolim da UNESP (Câmpus Jaboticabal), e do ex-aluno do Câmpus Muzambinho, Lucas Eduardo Oliveira Aparecido, atualmente mestrando e orientado pelo Prof. Glauco.</p><p>De acordo com a estudante, o evento contou com a participação de vários professores, pesquisadores e alunos do Brasil, Argentina, Uruguai e México. Ao apresentar o trabalho, a principal dúvida e interesse por parte dos participantes do evento foi saber se o software era livre e quais seriam as etapas para sua instalação. A maioria dos pesquisadores que estavam presentes no evento tinham conhecimento do trabalho feito pelo Professor Glauco de Souza Rolim, colaborador deste projeto.</p><p>De acordo com o prof. Tiago, o software está em processo de registro com apoio do ELITT (Escritório Local de Transferência de Tecnologia) do Câmpus Muzambinho, e deverá ser disponibilizado como software livre para utilização de toda comunidade acadêmica interessada e produtores rurais. O evento contou também com a participação de outra aluna do IFSULDEMINAS – Câmpus Muzambinho, Daniela de Moraes Cardoso, estudante do curso de Agronomia.</p><p>Texto: IFSULDEMINAS - Câmpus Muzambinho com informações do prof. Tiago Gonçalves Botelho</p>', 'A aluna do curso de Ciência da Computação, Nilva Alice Gaspar, apresentou trabalho em forma de pôster na \"XV Reunion Binacional Uruguai - Argentina de Agrometeorologia\", realizado em Piriapolis, no Uruguai, entre os dias 01 e 03 de outubro.O trabalho apresentou o software System for Water Balance (SYSWAB) que consiste em uma ferramenta que gerencia e transforma dados em informações mais práticas no auxílio de monitoramento das condições climáticas para a agricultura. Também realiza estimativas de produtividade de qualquer cultivo de interesse, ajudando no planejamento agrícola.Sob a orientação do prof. Tiago Gonçalves Botelho e co-orientação do prof. Paulo Sergio de Souza, ambos do Câmpus Muzambinho, o trabalho conta com a colaboração do Prof. Glauco de Souza Rolim da UNESP (Câmpus Jaboticabal), e do ex-aluno do Câmpus Muzambinho, Lucas Eduardo Oliveira Aparecido, atualmente mestrando e orientado pelo Prof. Glauco.De acordo com a estudante, o evento contou com a participação de vários professores, pesquisadores e alunos do Brasil, Argentina, Uruguai e México. Ao apresentar o trabalho, a principal dúvida e interesse por parte dos participantes do evento foi saber se o software era livre e quais seriam as etapas para sua instalação. A maioria dos pesquisadores que estavam presentes no evento tinham conhecimento do trabalho feito pelo Professor Glauco de Souza Rolim, colaborador deste projeto.De acordo com o prof. Tiago, o software está em processo de registro com apoio do ELITT (Escritório Local de Transferência de Tecnologia) do Câmpus Muzambinho, e deverá ser disponibilizado como software livre para utilização de toda comunidade acadêmica interessada e produtores rurais. O evento contou também com a participação de outra aluna do IFSULDEMINAS – Câmpus Muzambinho, Daniela de Moraes Cardoso, estudante do curso de Agronomia.Texto: IFSULDEMINAS - Câmpus Muzambinho com informações do prof. Tiago Gonçalves Botelho', '1f1370463e9ea0891dc3913f6341d393.JPG', '2014-10-16', '2015-05-11', '0000-00-00', 'apresentao-no-exterior', 'apresentação trabalho uruguai computação ifsuldeminas muzambinho');
INSERT INTO `cc_noticia` (`not_id`, `not_titulo`, `not_subtitulo`, `not_conteudo`, `not_conteudo_sem_formatacao`, `not_foto`, `not_criado`, `not_revisado`, `not_exibicao`, `not_slug`, `not_palavra_chave`) VALUES
(24, 'Professora Aracele do IFSULDEMINAS apresenta artigos no 44th Annual Frontiers in Education Conference', NULL, 'Entre os dias 22 e 25 de Outubro de 2014, a professora Aracele Garcia de Oliveira Fassbinder, vinculada aos cursos Técnicos em Informática e Ciência da Computação do IFSULDEMINAS – Câmpus Muzambinho, esteve em Madri, na Espanha, para a apresentação oral de dois artigos completos aceitos no 44th Annual Frontiers in Education (FIE) Conference.FIE é uma conferência internacional com foco em inovações educacionais e de pesquisa em engenharia e computação e está classificada como B1 no Qualis das Conferências em Computação, que possui os estratos A1, A2, B1, B2, B3, B4 e B5, nesta ordem de qualidade.Mariores informações confira: http://www.muz.ifsuldeminas.edu.br/index.php/eventos/3198-evento-internacional', 'Entre os dias 22 e 25 de Outubro de 2014, a professora Aracele Garcia de Oliveira Fassbinder, vinculada aos cursos Técnicos em Informática e Ciência da Computação do IFSULDEMINAS – Câmpus Muzambinho, esteve em Madri, na Espanha, para a apresentação oral de dois artigos completos aceitos no 44th Annual Frontiers in Education (FIE) Conference.FIE é uma conferência internacional com foco em inovações educacionais e de pesquisa em engenharia e computação e está classificada como B1 no Qualis das Conferências em Computação, que possui os estratos A1, A2, B1, B2, B3, B4 e B5, nesta ordem de qualidade.Mariores informações confira: http://www.muz.ifsuldeminas.edu.br/index.php/eventos/3198-evento-internacional', 'dc3b5b4c7823182f4fadda58c3e8e582.jpg', '2014-11-03', '2015-05-11', '0000-00-00', 'professora-aracele-do-ifsuldeminas-apresenta', 'ifsuldeminas computação muzambinho professora aracele apresenta artigos'),
(25, '9ª Semana de Informática (Seminfo) e a 4ª Semana de Empreendedorismo (Empreenda)', NULL, 'Entre os dias 17 e 21 de novembro, ocorrerá no IFSULDEMINAS – Câmpus Muzambinho a 9ª Semana de Informática (Seminfo) e a 4ª Semana de Empreendedorismo (Empreenda).\n\nAs atividades estão sendo organizadas pelo curso de Ciência da Computação, Diretório Acadêmico Alan Turing, Clube de Empreendedorismo e ELITT/NIT do Câmpus Muzambinho.\n\nMais informações, a programação completa e o link para inscrições podem ser obtidos através do site:\n\nhttps://eventioz.com.br/e/9-semana-de-informatica-e-4-empreenda\n\nOs eventos contarão com oficinas, minicursos em diversas áreas e a Maratona de Empreendedorismo inscrições abertas para todos os interessados, participe!\n\nINFORMÁTICA BÁSICA:\n- Planilha eletrônica\n- Informática Básica\n\nROBÓTICA:\n- Oficina com arduíno\n- Criando apresentações com o PREZI\n- Programação utilizando kits LEGO\n\nPROGRAMAÇÃO:\n- Construção de uma ferramenta gráfica para a educação\n- Introdução ao Desenvolvimento Web \n- Desenvolvimento de jogos web \n- APIs para o desenvolvimento web \n- Desenvolvimento de aplicações web Code Igniter-Bootstrap\n- Webservices na linguagem java \n- Python \n- Desenvolvimento de jogos com Game Maker\n\nREDES E HARDWARE:\n- Simulação', 'Entre os dias 17 e 21 de novembro, ocorrerá no IFSULDEMINAS – Câmpus Muzambinho a 9ª Semana de Informática (Seminfo) e a 4ª Semana de Empreendedorismo (Empreenda).\n\nAs atividades estão sendo organizadas pelo curso de Ciência da Computação, Diretório Acadêmico Alan Turing, Clube de Empreendedorismo e ELITT/NIT do Câmpus Muzambinho.\n\nMais informações, a programação completa e o link para inscrições podem ser obtidos através do site:\n\nhttps://eventioz.com.br/e/9-semana-de-informatica-e-4-empreenda\n\nOs eventos contarão com oficinas, minicursos em diversas áreas e a Maratona de Empreendedorismo inscrições abertas para todos os interessados, participe!\n\nINFORMÁTICA BÁSICA:\n- Planilha eletrônica\n- Informática Básica\n\nROBÓTICA:\n- Oficina com arduíno\n- Criando apresentações com o PREZI\n- Programação utilizando kits LEGO\n\nPROGRAMAÇÃO:\n- Construção de uma ferramenta gráfica para a educação\n- Introdução ao Desenvolvimento Web \n- Desenvolvimento de jogos web \n- APIs para o desenvolvimento web \n- Desenvolvimento de aplicações web Code Igniter-Bootstrap\n- Webservices na linguagem java \n- Python \n- Desenvolvimento de jogos com Game Maker\n\nREDES E HARDWARE:\n- Simulação', '4d717abde6f02d3240c7d1ce48bdc5b4.jpg', '2014-11-13', '2015-05-24', '0000-00-00', '9-semana-de-informtica-seminfo', 'semana informatica seminfo computação ifsuldeminas muzambinho'),
(26, 'Palestra sobre Computação Forense e Perícia Criminal', NULL, '<p>Aconteceu nesta quinta-feira, 07 de maio, uma palestra sobre \"Computação Forense e a Perícia Criminal na área de Informática\" no Poliesportivo do IFSULDEMINAS - Câmpus Muzambinho às 19h.</p><p>O palestrante convidado é o perito criminal federal <i>Pedro Monteiro da Silva Eleutério</i>, que apresentou os conceitos básicos da computação forense, uma das áreas mais novas e intrigantes da Computação. Foram apresentadas as principais técnicas utilizadas em exames periciais na informática, incluindo as fases do exame, os desafios, quebra de senhas, entre outras técnicas forenses. Além disso, abordou a carreira de Perito Criminal na tecnologia de informação. Ao final, o palestrante exibiu alguns exemplos de casos reais decorrentes de sua experiência profissional, que foram solucionados com uso de algumas das técnicas apresentadas.</p><p><b>Minicurrículo do palestrante:</b> Pedro Monteiro da Silva Eleutério é Perito Criminal Federal do Departamento de Polícia Federal, onde trabalha diariamente desvendando os mais diversos crimes cometidos com uso do computador. É formado em Engenharia de Computação pela Universidade Federal de São Carlos (UFSCar) e possui Mestrado em Ciência da Computaç', 'Aconteceu nesta quinta-feira, 07 de maio, uma palestra sobre \"Computação Forense e a Perícia Criminal na área de Informática\" no Poliesportivo do IFSULDEMINAS - Câmpus Muzambinho às 19h.O palestrante convidado é o perito criminal federal Pedro Monteiro da Silva Eleutério, que apresentou os conceitos básicos da computação forense, uma das áreas mais novas e intrigantes da Computação. Foram apresentadas as principais técnicas utilizadas em exames periciais na informática, incluindo as fases do exame, os desafios, quebra de senhas, entre outras técnicas forenses. Além disso, abordou a carreira de Perito Criminal na tecnologia de informação. Ao final, o palestrante exibiu alguns exemplos de casos reais decorrentes de sua experiência profissional, que foram solucionados com uso de algumas das técnicas apresentadas.Minicurrículo do palestrante: Pedro Monteiro da Silva Eleutério é Perito Criminal Federal do Departamento de Polícia Federal, onde trabalha diariamente desvendando os mais diversos crimes cometidos com uso do computador. É formado em Engenharia de Computação pela Universidade Federal de São Carlos (UFSCar) e possui Mestrado em Ciência da Computaç', 'bf2b888e4e7521e75bc582dd70e008f1.jpg', '2015-05-07', '2015-05-11', '0000-00-00', 'palestra-sobre-computao-forense-e', 'palestra sobre informatica criminal forense computação ifsuldeminas muzambinho'),
(27, 'Abertura da 6ª Gincana Tecnológica e 10ª Semana de Informática do IFSULDEMINAS - Câmpus Muzambinho', NULL, '<p>Aconteceu segunda feira, 04 de maio, a abertura da 6ª Gincana Tecnológica e 10ª Semana de Informática do IFSULDEMINAS - Câmpus Muzambinho. A programação do evento conta com jogos, palestras e minicursos que vão até o próximo sábado, 09 de maio.</p><p>A cerimônia de abertura contou com a presença da Diretora do Departamento de Desenvolvimento Educacional, prof.ª Luciana Maria Vieira Lopes Mendonça, da representante da Pró-Reitoria de Ensino, o Diretor de Ensino a Distância do IFSULDEMINAS, prof. Marcos Roberto Cândido, da Coordenadora Geral de Ensino, prof. Daniela Ferreira Cardoso Cruvinel, do Coordenador do Curso de Ciência da Computação, prof. Tiago Gonçalves Botelho, Coordenador do curso Técnico Integrado em Informática, prof. Heber Rocha Moreira, do Coordenador do curso técnico em Informática Subsequente, prof. Ramon Gustavo Teodoro Marques da Silva e do presidente do Centro Acadêmico do curso de Ciência da Computação, Luís Ovídio Viana Podestá.</p><p>Representante da Direção do Câmpus Muzambinho, prof.ª Luciana, parabenizou o trabalho desenvolvido pelos cursos na realização do evento e reiterou o apoio do Câmpus a eventos desse tipo.&nbsp;Após a solenidade de abertura, aconteceu uma palestra sobre \"Robótica: algoritmos genéticos aplicados em planejamento de rota para VANTs e Robótica Evolutiva\" e foi ministrada pelo especialista da USP de São Carlos, Jesimar Arantes. No final da noite, a Gincana começou com a realização de provas relâmpago entre as equipes.</p><p style=\"text-align: right;\">Texto: Lucas Constantino</p><p style=\"text-align: right;\">Fotos: Luiz Fernando Bócoli</p>', 'Aconteceu segunda feira, 04 de maio, a abertura da 6ª Gincana Tecnológica e 10ª Semana de Informática do IFSULDEMINAS - Câmpus Muzambinho. A programação do evento conta com jogos, palestras e minicursos que vão até o próximo sábado, 09 de maio.A cerimônia de abertura contou com a presença da Diretora do Departamento de Desenvolvimento Educacional, prof.ª Luciana Maria Vieira Lopes Mendonça, da representante da Pró-Reitoria de Ensino, o Diretor de Ensino a Distância do IFSULDEMINAS, prof. Marcos Roberto Cândido, da Coordenadora Geral de Ensino, prof. Daniela Ferreira Cardoso Cruvinel, do Coordenador do Curso de Ciência da Computação, prof. Tiago Gonçalves Botelho, Coordenador do curso Técnico Integrado em Informática, prof. Heber Rocha Moreira, do Coordenador do curso técnico em Informática Subsequente, prof. Ramon Gustavo Teodoro Marques da Silva e do presidente do Centro Acadêmico do curso de Ciência da Computação, Luís Ovídio Viana Podestá.Representante da Direção do Câmpus Muzambinho, prof.ª Luciana, parabenizou o trabalho desenvolvido pelos cursos na realização do evento e reiterou o apoio do Câmpus a eventos desse tipo.&nbsp;Após a solenidade de abertura, aconteceu uma palestra sobre \"Robótica: algoritmos genéticos aplicados em planejamento de rota para VANTs e Robótica Evolutiva\" e foi ministrada pelo especialista da USP de São Carlos, Jesimar Arantes. No final da noite, a Gincana começou com a realização de provas relâmpago entre as equipes.Texto: Lucas ConstantinoFotos: Luiz Fernando Bócoli', '0ee8e284cade7841097edb470398320b.jpg', '2015-05-07', '2015-05-11', '0000-00-00', 'abertura-da-6-gincana-tecnolgica', 'abertura gincana maio computação ifsuldeminas muzambinho'),
(28, 'Dr. Tapas Kar ministra palestra no IFSULDEMINAs', NULL, 'Aconteceu no dia de 27 de abril de 2015 uma palestra ministrada pelo Dr. Tapas Kar, vinculado a Utah State University com o tema: “Tecnologia: Passado, Presente e Futuro”.<br><br><p>A palestra foi realizada no auditório do câmpus Muzambinho e contou com a participação de alunos de vários cursos como Computação, Agronomia, Biologia dentre outros.<br><br><p>Natural de Calcutá, residente em Logan – EUA. O palestrante trabalha com Química Computacional e Nanotecnologia e está vinculado ao corpo de docentes do departamento de química da Universidade Estadual de Utah.<br><br></p><p>A viagem, patrocinada pela Capes, abrange o trabalho do pesquisador na USP de Ribeirão Preto e na Universidade de Franca (UNIFRAN) onde teve a oportunidade de ministrar uma palestra a alunos de pós graduação em Química, curso este que possui alunos do IFSULDEMINAS.<br><br><a href=\"http://www.chem.usu.edu/htm/faculty-staff/memberID=5338\">Currículo do Palestrante - Departamento de Química</a><br><br></p></p>', 'Aconteceu no dia de 27 de abril de 2015 uma palestra ministrada pelo Dr. Tapas Kar, vinculado a Utah State University com o tema: “Tecnologia: Passado, Presente e Futuro”.A palestra foi realizada no auditório do câmpus Muzambinho e contou com a participação de alunos de vários cursos como Computação, Agronomia, Biologia dentre outros.Natural de Calcutá, residente em Logan – EUA. O palestrante trabalha com Química Computacional e Nanotecnologia e está vinculado ao corpo de docentes do departamento de química da Universidade Estadual de Utah.A viagem, patrocinada pela Capes, abrange o trabalho do pesquisador na USP de Ribeirão Preto e na Universidade de Franca (UNIFRAN) onde teve a oportunidade de ministrar uma palestra a alunos de pós graduação em Química, curso este que possui alunos do IFSULDEMINAS.Currículo do Palestrante - Departamento de Química', '45598036f0c56b7709908cc8e34a511d.jpg', '2015-05-11', '2015-05-11', '0000-00-00', 'dr-tapas-kar-ministra-palestra', 'palestra tapas kar computação ifsuldeminas muzambinho'),
(29, 'LabSoft Completa 3 Anos de Trabalhos Sendo Desenvolvidos', NULL, '<p>Em 2015, o Laboratório de Tecnologias de Software e Computação Aplicada à Educação (LabSoft) completa 3 anos de trabalhos sendo desenvolvidos.</p><p>Não foi fácil (e ainda não é), criar em um curso novo, dentro de uma instituição em mudanças constantes, um ambiente que tem como função colaborar com a educação dos alunos do curso de Computação e técnico em informática, tendo como base a integração entre ensino, a pesquisa e a extensão.</p><p>Lá podem ser desenvolvidos projetos que envolvam pesquisa aplicada, técnica e tecnológica, integrada às tecnologias de software (engenharia, banco de dados, IHC, etc), de forma geral, mas com um olhar atencioso sobre o contexto educacional (computação e educação).</p><p>Sendo assim, desde a criação do Lab, em 2012, são conduzidas atividades de estágio articulados à pesquisa e à extensão, prática bem comum em diversas instituições de ensino e adotada pelo programa Ciência sem Fronteiras, onde o aluno deve fazer disciplinas e estágio de pesquisa em alguma empresa ou universidade no exterior.&nbsp;</p><p>Adicionalmente, e como fator importante para o fortalecimento da área de software dentro do curso de Computação/Técnico, também estão associados ao Lab os Trabalhos de Conclusão de Curso, Iniciação Científica, Estágio de alunos intercambistas, Extensão e trabalhos voluntários de alunos que gostam dessa área: software e educação.</p><p>Sendo assim, são diversas as oportunidades que os alunos possuem para aumentar o seu desenvolvimento pessoal e profissional.</p><p>Fique por dentro de atividades que serão realizadas durante esse ano, a fim de \"comemorar\" o fortalecimento do laboratório e refletir sobre o seu papel e a importância do mesmo na formação de nossos alunos e, também, do próprio corpo docente.</p><p>Acreditamos que o nosso papel, como fundadores, líderes ou membros desta iniciativa é continuar lutando para termos um espaço de diálogo, reflexão e investigação entre professores e estudantes interessados nesta linha de pesquisa, considerando que o curso fundamental é de base científica (Ciência da Computação).</p><p>Participem das oportunidades que surgirem (estágio, tcc, projetos gerais, etc), bem como os seminários que são realizados mensalmente</p><p>Maiores informações acessem o <a href=\" http://labsoft.muz.ifsuldeminas.edu.br/\">site do Laboratório</a></p><p>Ou falem com os professores Ramon Marques, Aracele Garcia, Paulo Santos e colaboradores: Adolfo Carvalho, Aline, Sandra e Iara, bem como os estagiários atuantes do mesmo.</p><p style=\"text-align: right;\">Texto: Aracele G. O. Fassbinder</p>', 'Em 2015, o Laboratório de Tecnologias de Software e Computação Aplicada à Educação (LabSoft) completa 3 anos de trabalhos sendo desenvolvidos.Não foi fácil (e ainda não é), criar em um curso novo, dentro de uma instituição em mudanças constantes, um ambiente que tem como função colaborar com a educação dos alunos do curso de Computação e técnico em informática, tendo como base a integração entre ensino, a pesquisa e a extensão.Lá podem ser desenvolvidos projetos que envolvam pesquisa aplicada, técnica e tecnológica, integrada às tecnologias de software (engenharia, banco de dados, IHC, etc), de forma geral, mas com um olhar atencioso sobre o contexto educacional (computação e educação).Sendo assim, desde a criação do Lab, em 2012, são conduzidas atividades de estágio articulados à pesquisa e à extensão, prática bem comum em diversas instituições de ensino e adotada pelo programa Ciência sem Fronteiras, onde o aluno deve fazer disciplinas e estágio de pesquisa em alguma empresa ou universidade no exterior.&nbsp;Adicionalmente, e como fator importante para o fortalecimento da área de software dentro do curso de Computação/Técnico, também estão associados ao Lab os Trabalhos de Conclusão de Curso, Iniciação Científica, Estágio de alunos intercambistas, Extensão e trabalhos voluntários de alunos que gostam dessa área: software e educação.Sendo assim, são diversas as oportunidades que os alunos possuem para aumentar o seu desenvolvimento pessoal e profissional.Fique por dentro de atividades que serão realizadas durante esse ano, a fim de \"comemorar\" o fortalecimento do laboratório e refletir sobre o seu papel e a importância do mesmo na formação de nossos alunos e, também, do próprio corpo docente.Acreditamos que o nosso papel, como fundadores, líderes ou membros desta iniciativa é continuar lutando para termos um espaço de diálogo, reflexão e investigação entre professores e estudantes interessados nesta linha de pesquisa, considerando que o curso fundamental é de base científica (Ciência da Computação).Participem das oportunidades que surgirem (estágio, tcc, projetos gerais, etc), bem como os seminários que são realizados mensalmenteMaiores informações acessem o site do LaboratórioOu falem com os professores Ramon Marques, Aracele Garcia, Paulo Santos e colaboradores: Adolfo Carvalho, Aline, Sandra e Iara, bem como os estagiários atuantes do mesmo.Texto: Aracele G. O. Fassbinder', '11d3c0ec3c7f5a6429556510192ae385.png', '2015-05-12', '2015-05-12', '0000-00-00', 'labsoft-completa-3-anos-de-trabalhos-sendo-desenvolvidos', 'laboratório software aplicada educação labsoft pesquisa '),
(30, 'Festival Brasileiro de Games Independentes', NULL, 'Ocorrerá, entre os dias 27 de junho a 5 de julho, no <a href=\"http://www.centrocultural.sp.gov.br/\">Centro Cultural São Paulo</a>, o BIG (Brazil\'s Independent Games Festival). Um festival de jogos independentes pioneiro na américa latina.<p>Os melhores jogos indie do ano são expostos e avaliados de acordo com aspectos visuais, sonoros, narrativos, de gameplay e inovação. Em caso de dúvidas sobre as normas para participação, consulte o&nbsp;<span style=\"line-height: 1.5;\"><a href=\"http://www.bigfestival.com.br/faq\" style=\"line-height: 1.5;\">FAQ</a></span> do evento.</p><p></p><p></p><p>Promovido pela Apex-Brasil, a 2ª edição do evento atraiu mais de 8000 visitantes, o dobro da primeira, e busca divulgar as características do mercado brasileiro de games, atualmente o quarto maior consumidor do mundo no setor.</p><p></p><p>O evento, em sua 3ª edição, terá como novidade uma seção para jogos educacionais e de aprendizado.</p><p></p><p>Para maiores informações, acesse o site do evento:</p><p><a href=\"http://www.bigfestival.com.br/home\">http://www.bigfestival.com.br/home</a></p><p>Confira um vídeo de <a href=\"https://www.youtube.com/watch?v=KXHJx-EITjk\"><b>apresentação da 2ª edição (2014)</b></a>.</p>', 'Ocorrerá, entre os dias 27 de junho a 5 de julho, no Centro Cultural São Paulo, o BIG (Brazil\'s Independent Games Festival). Um festival de jogos independentes pioneiro na américa latina.Os melhores jogos indie do ano são expostos e avaliados de acordo com aspectos visuais, sonoros, narrativos, de gameplay e inovação. Em caso de dúvidas sobre as normas para participação, consulte o&nbsp;FAQ do evento.Promovido pela Apex-Brasil, a 2ª edição do evento atraiu mais de 8000 visitantes, o dobro da primeira, e busca divulgar as características do mercado brasileiro de games, atualmente o quarto maior consumidor do mundo no setor.O evento, em sua 3ª edição, terá como novidade uma seção para jogos educacionais e de aprendizado.Para maiores informações, acesse o site do evento:http://www.bigfestival.com.br/homeConfira um vídeo de apresentação da 2ª edição (2014).', 'c592ac7c061b5c67e0a0ff27e4eebf39.jpg', '2015-05-16', '2015-05-16', '0000-00-00', 'festival-brasileiro-de-games-independentes', 'big brasil independent games festival são paulo'),
(31, 'Evento Comemorativo ao 3º Aniversário do LabSoft', NULL, '<p>Aconteceu quarta-feira, dia 20 de maio de 2015, na sala 22 do Prédio Pedagógico de Informática do IFSULDEMINAS, um evento comemorativo aos <u>3 anos</u> de atividade do&nbsp;<b style=\"line-height: 1.5;\">Laboratório de Tecnologias de Software e Computação Aplicada à Educação</b><span style=\"line-height: 1.5;\">. O objetivo era divulgar a história do laboratório e seus projetos nos campos de ensino, pesquisa e extensão.&nbsp;</span></p><p>O evento contou com a apresentação de professores, estagiários, ex-estagiários, e alunos com projetos ligados ao laboratório.&nbsp;</p><p>Estavam presentes dentre os espectadores alunos de diversos períodos do curso de Ciência da Computação, que tiveram a oportunidade de conhecer melhor a importância que o grupo têm dentro do curso e da instituição.&nbsp;</p><p><span style=\"line-height: 1.6;\">O LabSoft conta atualmente com:</span></p><p></p><ul><li><span style=\"line-height: 1.6;\">&nbsp;</span><u style=\"line-height: 1.6;\">3</u><span style=\"line-height: 1.6;\"> estagiários e </span><u style=\"line-height: 1.6;\">8</u><span style=\"line-height: 1.6;\"> alunos de TCC vinculados</span></li><li><span style=\"line-height: 1.6;\"><u style=\"line-height: 1.6;\">5</u> ex-estagiários e <u style=\"line-height: 1.6;\">5</u> ex-alunos de TCC</span></li><li><span style=\"line-height: 1.6;\"><u style=\"line-height: 1.6;\">1</u> ex-intercambista</span></li><li><span style=\"line-height: 1.6;\"><u style=\"line-height: 1.6;\">5</u> projetos de extensão em andamento</span></li><li><span style=\"line-height: 1.6;\"><u style=\"line-height: 1.6;\">2</u> Projetos de Pesquisa ou extensão/pesquisa em andamento</span></li></ul><p></p><p>Foi realizada uma introdução as linhas de pesquisa sendo conduzidas no momento, onde pode-se destacar:&nbsp;</p><p></p><ul><li><span style=\"line-height: 1.5;\">Educação em Computação: Aracele Fasbinder</span></li><li><span style=\"line-height: 1.5;\">Computação Aplicada à Educação: Aracele Fassbinder</span></li><li><span style=\"line-height: 1.5;\">Educação à Distância: Adolfo Carvalho</span></li><li><span style=\"line-height: 1.5;\">Desenvolvimento Web e Web Semântica: Ramon Marques</span></li><li><span style=\"line-height: 1.5;\">Desenvolvimento de Jogos Educacionais para Plataforma Web: Ramon Marques</span></li><li><span style=\"line-height: 1.5;\">Gamificação e Processos de Aprendizagem: Ramon Marques</span></li><li><span style=\"line-height: 1.5;\">Massive Open Online Courses (MOOCs): Aracele Fassbinder</span></li></ul><p></p>', 'Aconteceu quarta-feira, dia 20 de maio de 2015, na sala 22 do Prédio Pedagógico de Informática do IFSULDEMINAS, um evento comemorativo aos 3 anos de atividade do&nbsp;Laboratório de Tecnologias de Software e Computação Aplicada à Educação. O objetivo era divulgar a história do laboratório e seus projetos nos campos de ensino, pesquisa e extensão.&nbsp;O evento contou com a apresentação de professores, estagiários, ex-estagiários, e alunos com projetos ligados ao laboratório.&nbsp;Estavam presentes dentre os espectadores alunos de diversos períodos do curso de Ciência da Computação, que tiveram a oportunidade de conhecer melhor a importância que o grupo têm dentro do curso e da instituição.&nbsp;O LabSoft conta atualmente com:&nbsp;3 estagiários e 8 alunos de TCC vinculados5 ex-estagiários e 5 ex-alunos de TCC1 ex-intercambista5 projetos de extensão em andamento2 Projetos de Pesquisa ou extensão/pesquisa em andamentoFoi realizada uma introdução as linhas de pesquisa sendo conduzidas no momento, onde pode-se destacar:&nbsp;Educação em Computação: Aracele FasbinderComputação Aplicada à Educação: Aracele FassbinderEducação à Distância: Adolfo CarvalhoDesenvolvimento Web e Web Semântica: Ramon MarquesDesenvolvimento de Jogos Educacionais para Plataforma Web: Ramon MarquesGamificação e Processos de Aprendizagem: Ramon MarquesMassive Open Online Courses (MOOCs): Aracele Fassbinder', 'c895abc6ff91ff9f7ef615e4da365347.jpg', '2015-05-22', '2015-05-25', '0000-00-00', 'evento-comemorativo-ao-3-aniversrio', 'laboratório evento 3 anos computação educação computação ifsuldeminas muzambinho'),
(32, 'Google Realiza Mudanças em seu Algoritmo', NULL, '<p>Desde 29 de abril de 2015, o <b>Google</b> aplicou mudanças em seu algoritmo, a atualização irá melhorar a posição de websites que sejam <u>“mobile-friendly”</u> ou que tenham uma boa usabilidade em smarthphones.</p><p>A mudança irá afetar apenas as buscas por dispositivos móveis em todos os idiomas e lugares. No entanto, websites desenvolvidos exclusivamente para telas maiores poderão sofrer uma significante queda de posicionamento.</p><p>A atualização, que muda drasticamente as regras do jogo, tal qual a atualização onde o <b>Google</b> passou a punir quem buscava “trapacear”com seu algoritmo através de palavras-chave e conteúdo questionável, não irá substituir os critérios já estabelecidos. Segundo a empresa:</p><p>“Enquanto a mudança para <u>mobile-friendly</u> é importante, nós ainda utilizamos vários sinais para ranquear resultados de pesquisa. O conteúdo ainda é um fator importante – então, se a página tiver um bom conteúdo mas não for <u>mobile-friendly</u> ela ainda aparecerá bem ranqueada.”&nbsp;</p>', 'Desde 29 de abril de 2015, o Google aplicou mudanças em seu algoritmo, a atualização irá melhorar a posição de websites que sejam “mobile-friendly” ou que tenham uma boa usabilidade em smarthphones.A mudança irá afetar apenas as buscas por dispositivos móveis em todos os idiomas e lugares. No entanto, websites desenvolvidos exclusivamente para telas maiores poderão sofrer uma significante queda de posicionamento.A atualização, que muda drasticamente as regras do jogo, tal qual a atualização onde o Google passou a punir quem buscava “trapacear”com seu algoritmo através de palavras-chave e conteúdo questionável, não irá substituir os critérios já estabelecidos. Segundo a empresa:“Enquanto a mudança para mobile-friendly é importante, nós ainda utilizamos vários sinais para ranquear resultados de pesquisa. O conteúdo ainda é um fator importante – então, se a página tiver um bom conteúdo mas não for mobile-friendly ela ainda aparecerá bem ranqueada.”&nbsp;', 'cf374a15ecdf0ff299373fa1ece9fd82.jpg', '2015-05-25', NULL, '0000-00-00', 'google-realiza-mudanas-em-seu', 'mobile friendly google atualização pesquisas'),
(33, 'Criador da Web Completa 60 anos de Vida', NULL, '<p style=\"margin:0cm;margin-bottom:.0001pt\"><font face=\"Arial, sans-serif\">Você talvez não tenha ouvido seu nome, mas acredite, todos devem muito a <b>Sir Timothy John Berners-Lee</b>, cientista da computação nascido em Londres, que completa 60 anos de vida no dia 8 de junho de 2015. <b>Berners-Lee</b> é mundialmente conhecido como o criador da <u>Word Wide Web</u>.</font></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><font face=\"Arial, sans-serif\"><br></font></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><font face=\"Arial, sans-serif\">A idéia da <u>Web</u> veio de uma necessidade científica, <b>Berners-Lee</b> constatou que os cientistas ao redor do mundo precisavam compartilhar dados de suas pesquisas, ele propôs então a criação de um “grande banco de dados com hiperligações”, &nbsp;chamado de “Information Management: A Proposal” que acabou não sendo aceita de imediato.</font></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><font face=\"Arial, sans-serif\"><br></font></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><font face=\"Arial, sans-serif\">A época trabalhando no <i>CERN (European Organizationfor Nuclear Research)</i>, seu chefe <b>Mike Sendall</b> notou as palavras “Vago, mas empolgante” escritas na capa, <b>Sendall</b> então se empenhou em dar tempo, para que <b>Berners-Lee</b> trabalhasse no projeto em setembro de 1990, inicialmente em um computador <u>NeXT</u>. Curiosamente a web nunca foi um projeto oficial do <i>CERN</i>.</font></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><font face=\"Arial, sans-serif\"><br></font></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><font face=\"Arial, sans-serif\">No mês seguinte, <b>Berners-Lee</b> definiu as 3 tecnologias que seriam o alicerce da Web:&nbsp;</font></p><p style=\"margin:0cm;margin-bottom:.0001pt\"></p><ul><li><span style=\"line-height: 1.6;\"><u style=\"line-height: 1.6;\">HTML</u>, a linguagem de marcação (formatação)da Web;&nbsp;</span></li><li><span style=\"line-height: 1.6;\"><u style=\"line-height: 1.6;\">URI</u>, uma espécie de endereço único utilizado para identificar cada recurso na Web, também chamada de URL; &nbsp;</span></li><li><span style=\"line-height: 1.6;\"><u style=\"line-height: 1.6;\">HTTP (Hypertext Transfer Protocol)</u> &nbsp;que permite a recuperação de recursos com ligações em toda a Web.&nbsp;</span></li></ul><p></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><font face=\"Arial, sans-serif\" style=\"margin:0cm;margin-bottom:.0001pt\">O cientista também desenvolveu &nbsp;o primeiro navegador, chamado de “</font><u style=\"margin:0cm;margin-bottom:.0001pt\">WorldWideWeb.app</u><font face=\"Arial, sans-serif\" style=\"margin:0cm;margin-bottom:.0001pt\">” e também o primeiro servidor web “<span style=\"margin:0cm;margin-bottom:.0001pt\"><u style=\"margin:0cm;margin-bottom:.0001pt\">httpd</u></span>”.</font></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><font face=\"Arial, sans-serif\"><br></font></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><font face=\"Arial, sans-serif\" style=\"margin:0cm;margin-bottom:.0001pt\">Embora o browser tivesse capacidade de acessar notícias e arquivos <u style=\"margin:0cm;margin-bottom:.0001pt\">FTP</u>,rodava apenas no <u style=\"margin:0cm;margin-bottom:.0001pt\">NeXT</u>. Então <b style=\"margin:0cm;margin-bottom:.0001pt\">Nicolla Pellow</b> desenvolveu um navegador compatível com outros sistemas operacionais, como o Unix.Contribuindo para o crescimento vertiginoso observado nos anos seguintes.</font></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><font face=\"Arial, sans-serif\"><br></font></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><font face=\"Arial, sans-serif\">Seria muito ingênuo e injusto a sua obra tentar resumir as contribuições de <b>Berners-Lee</b> ao mundo da tecnologia, porém,recomenda-se que procure conhecer mais sobre a vida deste grande cientista, sem o qual não seria possível nem mesmo ler este texto.</font></p>', 'Você talvez não tenha ouvido seu nome, mas acredite, todos devem muito a Sir Timothy John Berners-Lee, cientista da computação nascido em Londres, que completa 60 anos de vida no dia 8 de junho de 2015. Berners-Lee é mundialmente conhecido como o criador da Word Wide Web.A idéia da Web veio de uma necessidade científica, Berners-Lee constatou que os cientistas ao redor do mundo precisavam compartilhar dados de suas pesquisas, ele propôs então a criação de um “grande banco de dados com hiperligações”, &nbsp;chamado de “Information Management: A Proposal” que acabou não sendo aceita de imediato.A época trabalhando no CERN (European Organizationfor Nuclear Research), seu chefe Mike Sendall notou as palavras “Vago, mas empolgante” escritas na capa, Sendall então se empenhou em dar tempo, para que Berners-Lee trabalhasse no projeto em setembro de 1990, inicialmente em um computador NeXT. Curiosamente a web nunca foi um projeto oficial do CERN.No mês seguinte, Berners-Lee definiu as 3 tecnologias que seriam o alicerce da Web:&nbsp;HTML, a linguagem de marcação (formatação)da Web;&nbsp;URI, uma espécie de endereço único utilizado para identificar cada recurso na Web, também chamada de URL; &nbsp;HTTP (Hypertext Transfer Protocol) &nbsp;que permite a recuperação de recursos com ligações em toda a Web.&nbsp;O cientista também desenvolveu &nbsp;o primeiro navegador, chamado de “WorldWideWeb.app” e também o primeiro servidor web “httpd”.Embora o browser tivesse capacidade de acessar notícias e arquivos FTP,rodava apenas no NeXT. Então Nicolla Pellow desenvolveu um navegador compatível com outros sistemas operacionais, como o Unix.Contribuindo para o crescimento vertiginoso observado nos anos seguintes.Seria muito ingênuo e injusto a sua obra tentar resumir as contribuições de Berners-Lee ao mundo da tecnologia, porém,recomenda-se que procure conhecer mais sobre a vida deste grande cientista, sem o qual não seria possível nem mesmo ler este texto.', 'a583f01c858a4d3c2c55d49bb5285001.jpg', '2015-05-30', '2015-05-31', '0000-00-00', 'criador-da-web-completa-60', 'cientista computação cern web berners-lee criador world wide web'),
(34, 'Conheça a Computação Contextual', NULL, '<p class=\"MsoNormal\" style=\"text-align:justify;text-justify:inter-ideograph\">A <b style=\"text-align:justify;text-justify:inter-ideograph\">computação contextual</b> é um paradigma móvel onde os aplicativos podem, de uma maneira resumida, apresentar a informação correta na hora em que você precisa dela, retornando por exemplo a localização do usuário, situação do tempo, resultados baseados em atividades recentes e etc. Essa área tem atraído grande interesse do setor acadêmico e industrial, vide o destaque recebido nas conferências de duas gigantes: <i style=\"text-align:justify;text-justify:inter-ideograph\">Apple</i> e <i style=\"text-align:justify;text-justify:inter-ideograph\">Google</i>. </p><p class=\"MsoNormal\" style=\"text-align:justify;text-justify:inter-ideograph\">Durante o evento I/O o <i style=\"text-align:justify;text-justify:inter-ideograph\">Google</i> anunciou a expansão do <i style=\"text-align:justify;text-justify:inter-ideograph\">Google Now</i>, que a partir dos dados que a empresa possui sobre o usuário pode informar, por exemplo, a previsão do clima na cidade em que ele se encontra, ou a situação do trânsito. Com as melhorias, o aplicativo poderá retornar dados que a empresa não têm sobre o usuário, através da disponibilização de uma <i style=\"text-align:justify;text-justify:inter-ideograph\">API</i> que possibilitará a integração com cerca de 100 aplicativos diferentes.</p><p class=\"MsoNormal\" style=\"text-align:justify;text-justify:inter-ideograph\">Por outro lado a <i style=\"text-align:justify;text-justify:inter-ideograph\">Apple</i>, na conferência para desenvolvedores&nbsp;<i style=\"text-align:justify;text-justify:inter-ideograph\">WWDC</i>, divulgou melhorias em seu aplicativo “assistente pessoal” <i style=\"text-align:justify;text-justify:inter-ideograph\">Siri</i>, que terá influência do <i style=\"text-align:justify;text-justify:inter-ideograph\">Now</i> e passará a ser mais proativo, exibindo informações consideradas relevantes ao usuário.</p><p class=\"MsoNormal\" style=\"text-align:justify;text-justify:inter-ideograph\">Não é possível afirmar em que nível essa área poderá chegar, porém existem alguns indícios de que o futuro da computação seja de alguma forma&nbsp;<b style=\"text-align:justify;text-justify:inter-ideograph\">contextual</b>.&nbsp;</p>', 'A computação contextual é um paradigma móvel onde os aplicativos podem, de uma maneira resumida, apresentar a informação correta na hora em que você precisa dela, retornando por exemplo a localização do usuário, situação do tempo, resultados baseados em atividades recentes e etc. Essa área tem atraído grande interesse do setor acadêmico e industrial, vide o destaque recebido nas conferências de duas gigantes: Apple e Google. Durante o evento I/O o Google anunciou a expansão do Google Now, que a partir dos dados que a empresa possui sobre o usuário pode informar, por exemplo, a previsão do clima na cidade em que ele se encontra, ou a situação do trânsito. Com as melhorias, o aplicativo poderá retornar dados que a empresa não têm sobre o usuário, através da disponibilização de uma API que possibilitará a integração com cerca de 100 aplicativos diferentes.Por outro lado a Apple, na conferência para desenvolvedores&nbsp;WWDC, divulgou melhorias em seu aplicativo “assistente pessoal” Siri, que terá influência do Now e passará a ser mais proativo, exibindo informações consideradas relevantes ao usuário.Não é possível afirmar em que nível essa área poderá chegar, porém existem alguns indícios de que o futuro da computação seja de alguma forma&nbsp;contextual.&nbsp;', '853f0c07d344853de73ec1b634783aae.jpg', '2015-06-10', '2015-06-10', '0000-00-00', 'conhea-a-computao-contextual', 'computação contextual apple google now siri api'),
(35, 'Estudantes de Ciência da Computação conquistam vaga na Final Brasileira da XX Maratona de Programação.', NULL, '<span style=\"color: rgb(109, 110, 113); font-size: 12px; line-height: 20px; text-align: justify; background-color: rgb(247, 249, 247);\">No dia 12 de setembro, estudantes do Curso de Ciência da Computação do IFSULDEMINAS - Campus Muzambinho participaram da primeira etapa da XX Maratona de Programação no Instituto Nacional de Telecomunicações (INATEL) em Santa Rita do Sapucaí (MG). A competição é organizada pela Sociedade Brasileira de Computação – SBC. Durante a manhã, ocorreu o aquecimento dos participantes e às 14h começou a maratona que foi até às 19h.&nbsp;</span><p><span style=\"color: rgb(109, 110, 113); font-size: 12px; line-height: 20px; text-align: justify; background-color: rgb(247, 249, 247);\">Confira a matéria completa e fotos em:&nbsp;</span><font color=\"#6d6e71\"><span style=\"font-size: 12px; line-height: 20px;\">http://www.muz.ifsuldeminas.edu.br/index.php/gerais/3811-olimpiada-de-programacao-inatel</span></font></p>', 'No dia 12 de setembro, estudantes do Curso de Ciência da Computação do IFSULDEMINAS - Campus Muzambinho participaram da primeira etapa da XX Maratona de Programação no Instituto Nacional de Telecomunicações (INATEL) em Santa Rita do Sapucaí (MG). A competição é organizada pela Sociedade Brasileira de Computação – SBC. Durante a manhã, ocorreu o aquecimento dos participantes e às 14h começou a maratona que foi até às 19h.&nbsp;Confira a matéria completa e fotos em:&nbsp;http://www.muz.ifsuldeminas.edu.br/index.php/gerais/3811-olimpiada-de-programacao-inatel', '92eef54268779a85ff3158fa0281c086.jpg', '2015-09-21', NULL, '0000-00-00', 'estudantes-de-cincia-da-computao', 'estudantes do Curso de Ciência da Computação'),
(36, 'Vestibular 2016 e Sisu - 1º Semestre - Ciência da Computação - NOTURNO', NULL, '<p style=\"text-align: justify;\"><font color=\"#000000\"><span style=\"background-color: rgb(247, 249, 247);\">O Instituto Federal do Sul de Minas (IFSULDEMINAS) divulga o edital para o Vestibular 2016/1º semestre. Serão mais de 3100 vagas ofertadas para mais de 30 áreas do conhecimento em cursos superiores e técnicos nos campi de Inconfidentes, Machado, Muzambinho, Passos, Poços de Caldas, Pouso Alegre e nos campi avançados de Carmo de Minas e Três Corações.&nbsp;</span></font></p><p style=\"text-align: justify;\"><font color=\"#000000\"><span style=\"background-color: rgb(247, 249, 247);\">O curso de Ciência da Computação do IFSULDEMINAS - Campus Muzambinho disponibilizará 21 vagas para o vestibular e 9 vagas para o Sisu na modalidade NOTURNO. Confira o edital e mais detalhes no link abaixo:</span></font></p><p style=\"text-align: justify;\"><span style=\"background-color: rgb(247, 249, 247);\">http://www.ifsuldeminas.edu.br/index.php/pt/noticias/4189-2015-09-28-11-35-42</span></p><p style=\"text-align: justify;\"><span style=\"background-color: rgb(247, 249, 247);\">Caso você tenha perdido o momento de inscrição no vestibular e tenha feito a prova do ENEM, ainda é possível concorrer a uma vaga para o curso de Ciência da Computação no Campus Muzambinho. Em data a ser divulgada pelo MEC você poderá concorrer às vagas oferecidas pelo Sisu. Vale lembrar que os alunos com entrada em 2016/01 ingressarão na modalidade NOTURNO.</span></p><p style=\"text-align: justify;\"></p>', 'O Instituto Federal do Sul de Minas (IFSULDEMINAS) divulga o edital para o Vestibular 2016/1º semestre. Serão mais de 3100 vagas ofertadas para mais de 30 áreas do conhecimento em cursos superiores e técnicos nos campi de Inconfidentes, Machado, Muzambinho, Passos, Poços de Caldas, Pouso Alegre e nos campi avançados de Carmo de Minas e Três Corações.&nbsp;O curso de Ciência da Computação do IFSULDEMINAS - Campus Muzambinho disponibilizará 21 vagas para o vestibular e 9 vagas para o Sisu na modalidade NOTURNO. Confira o edital e mais detalhes no link abaixo:http://www.ifsuldeminas.edu.br/index.php/pt/noticias/4189-2015-09-28-11-35-42Caso você tenha perdido o momento de inscrição no vestibular e tenha feito a prova do ENEM, ainda é possível concorrer a uma vaga para o curso de Ciência da Computação no Campus Muzambinho. Em data a ser divulgada pelo MEC você poderá concorrer às vagas oferecidas pelo Sisu. Vale lembrar que os alunos com entrada em 2016/01 ingressarão na modalidade NOTURNO.', '51a2ab3ccea3ba1157819fc69d369dfc.png', '2015-10-09', '2016-01-27', '0000-00-00', 'vestibular-2016-e-sisu', 'vestibular, Ciência da Computação, noturno'),
(37, 'Divulgado o edital de transferência interna, externa e obtenção de novo título', NULL, '<span style=\"color: rgb(20, 24, 35); font-family: helvetica, arial, sans-serif; line-height: 18px;\">Divulgado o edital de transferência interna, externa e obtenção de novo título para o IFSULDEMINAS - Campus Muzambinho.&nbsp;</span><br style=\"color: rgb(20, 24, 35); font-family: helvetica, arial, sans-serif; line-height: 18px;\"><span style=\"color: rgb(20, 24, 35); font-family: helvetica, arial, sans-serif; line-height: 18px;\">Há vagas para o curso de Ciência da Computação para ingresso no 3º ou 5º períodos mediante o atendimento de requisitos em edital. Confira mais detalhes no link.</span><p><br style=\"color: rgb(20, 24, 35); font-family: helvetica, arial, sans-serif; line-height: 18px;\"><a href=\"http://www.muz.ifsuldeminas.edu.br/index.php/gerais/4116-vagas-remanescentes\" rel=\"nofollow nofollow\" target=\"_blank\" style=\"color: rgb(59, 89, 152); cursor: pointer; text-decoration: none; font-family: helvetica, arial, sans-serif; line-height: 18px;\">http://<wbr>www.muz.ifsuldeminas.edu.br<wbr>/index.php/gerais/<wbr>4116-vagas-remanescentes</a></p>', 'Divulgado o edital de transferência interna, externa e obtenção de novo título para o IFSULDEMINAS - Campus Muzambinho.&nbsp;Há vagas para o curso de Ciência da Computação para ingresso no 3º ou 5º períodos mediante o atendimento de requisitos em edital. Confira mais detalhes no link.http://www.muz.ifsuldeminas.edu.br/index.php/gerais/4116-vagas-remanescentes', '4ea6493bb3d492b6cb77fc4246eba0c4.jpg', '2016-01-27', '2016-03-29', '0000-00-00', 'divulgado-o-edital-de-transferncia', 'edital, transferência'),
(38, 'Centro Acadêmico do curso de Ciência da Computação faz recepção dos calouros ', NULL, '<p style=\"margin-bottom: 6px; color: rgb(20, 24, 35); font-family: helvetica, arial, sans-serif; line-height: 19.32px;\">O Centro Acadêmico Alan Turing do curso de Ciência da Computação montou uma estação informativa próxima ao local de matrículas.</p><p style=\"margin-top: 6px; margin-bottom: 6px; color: rgb(20, 24, 35); font-family: helvetica, arial, sans-serif; line-height: 19.32px;\">A intenção da iniciativa é auxiliar todos os calouros sobre o Campus Muzambinho e, principalmente, informações pertinentes aos ingressantes do curso de Ciência da Computação.</p><p style=\"margin-top: 6px; margin-bottom: 6px; color: rgb(20, 24, 35); font-family: helvetica, arial, sans-serif; line-height: 19.32px;\">Os alunos fizeram também um questionário para identificar o perfil dos alunos que irão ingressar neste semestre no curso.</p><p class=\"text_exposed_show\" style=\"display: inline; color: rgb(20, 24, 35); font-family: helvetica, arial, sans-serif; line-height: 19.32px;\"></p><p style=\"margin-bottom: 6px;\">A estação informativa funcionou durante os dias que houver chamada para o curso de Ciência da Computação.</p><p></p>', 'O Centro Acadêmico Alan Turing do curso de Ciência da Computação montou uma estação informativa próxima ao local de matrículas.A intenção da iniciativa é auxiliar todos os calouros sobre o Campus Muzambinho e, principalmente, informações pertinentes aos ingressantes do curso de Ciência da Computação.Os alunos fizeram também um questionário para identificar o perfil dos alunos que irão ingressar neste semestre no curso.A estação informativa funcionou durante os dias que houver chamada para o curso de Ciência da Computação.', 'c8465cb9de441fc5dd662260035d9a1c.jpg', '2016-01-27', '2016-01-27', '0000-00-00', 'centro-acadmico-do-curso-de', 'CA, recepção, calouros'),
(39, 'Seleção de monitores 01/2016', NULL, '<p>Edital para seleção de monitores remunerados e voluntários com inscrições abertas de 28/03 a 03/04. Participe. Existem vagas para monitoria em que alunos do curso de Ciência da Computação podem participar, c<span style=\"line-height: 1.5;\">onfira detalhes no link abaixo</span></p><p>http://www.muz.ifsuldeminas.edu.br/index.php/gerais/4272-selecaodemonitores012016</p>', 'Edital para seleção de monitores remunerados e voluntários com inscrições abertas de 28/03 a 03/04. Participe. Existem vagas para monitoria em que alunos do curso de Ciência da Computação podem participar, confira detalhes no link abaixohttp://www.muz.ifsuldeminas.edu.br/index.php/gerais/4272-selecaodemonitores012016', '20a179c0092fc7e693d299c7a6138b91.jpg', '2016-03-29', NULL, '0000-00-00', 'seleo-de-monitores-012016', 'monitoria'),
(40, 'Semana Nacional de Mobilização da Comunidade Escolar pelo Combate ao Aedes aegypti', NULL, '<p style=\"margin-bottom: 0cm; line-height: 0.56cm; orphans: 1\"><font color=\"#333333\"><font face=\"Arial, Helvetica, sans-serif\"><font style=\"font-size: 10pt\">OInstituto Federal do Sul de Minas (IFSULDEMINAS) realiza desde o mêsde fevereiro, ações de combate ao mosquito Aedes Aegypti. Dia 06 deabril os alunos do curso de Ciência da Computação do CampusMuzambinho participam da Semana Nacional de Mobilização da Famíliae da Comunidade Escolar pelo Combate ao&nbsp;Aedes aegypti promovidapelo Campus Muzambinho. A atividade reuniu alunos, professores efuncionários da instituição e contou com atividades educativas emutirões de limpeza. Esta iniciativa tem sido desenvolvida em&nbsp;todoo Brasil e faz parte do Pacto da Educação Brasileira contra o Zika,assinado pelo Conselho Nacional das Instituições da Rede Federal deEducação Profissional Científica e Tecnológica (Conif) eentidades ligadas à área.</font></font></font></p>', 'OInstituto Federal do Sul de Minas (IFSULDEMINAS) realiza desde o mêsde fevereiro, ações de combate ao mosquito Aedes Aegypti. Dia 06 deabril os alunos do curso de Ciência da Computação do CampusMuzambinho participam da Semana Nacional de Mobilização da Famíliae da Comunidade Escolar pelo Combate ao&nbsp;Aedes aegypti promovidapelo Campus Muzambinho. A atividade reuniu alunos, professores efuncionários da instituição e contou com atividades educativas emutirões de limpeza. Esta iniciativa tem sido desenvolvida em&nbsp;todoo Brasil e faz parte do Pacto da Educação Brasileira contra o Zika,assinado pelo Conselho Nacional das Instituições da Rede Federal deEducação Profissional Científica e Tecnológica (Conif) eentidades ligadas à área.', 'c23bebb64b2471496920b72946c4ba0e.JPG', '2016-04-11', '2016-04-11', '0000-00-00', 'semana-nacional-de-mobilizao-da', 'zika, virus, aedes');
INSERT INTO `cc_noticia` (`not_id`, `not_titulo`, `not_subtitulo`, `not_conteudo`, `not_conteudo_sem_formatacao`, `not_foto`, `not_criado`, `not_revisado`, `not_exibicao`, `not_slug`, `not_palavra_chave`) VALUES
(41, '6ª Olimpíada Interna de Programação do IFSULDEMINAS (OLIP)', NULL, '<p>A Sociedade Brasileira de Computação (SBC) anualmente realiza a Olimpíada Brasileira de Informática (OBI), uma competição organizada nos moldes das outras olimpíadas científicas brasileiras, como Matemática, Física e Astronomia. O objetivo da OBI é despertar nos alunos o interesse por uma ciência importante na formação básica hoje em dia (no caso, ciência da computação), através de uma atividade que envolve desafio, engenhosidade e uma saudável dose de competição. Diversas instituições de ensino criaram mecanismos internos para estimular os seus alunos a participarem deste tipo de competição. Além do estímulo, espera-se identificar estudantes capacitados para participar das etapas regionais, nacionais e internacionais deste tipo de evento. Os melhores classificados em cada modalidade adotada são convidados a participar das seletivas da OBI.Dentro deste contexto, a 6ª Olimpíada Interna de Programação do IFSULDEMINAS (OLIP), objetiva proporcionar a oportunidade e o incentivo necessários para o desenvolvimento&nbsp;<span style=\"line-height: 1.5;\">do acadêmico da área de informática quanto á sua capacidade para a resolução de problemas e a implementação de algoritmos em tempo limitado. &lt;br&gt;Com este propósito, criam-se ferramentas para avaliar e premiar tais habilidades, estimulando seu aperfeiçoamento.&lt;br&gt;Podem participar os alunos dos cursos de informática dos câmpus do IFSULDEMINAS, em todas as suas modalidades (técnico integrado, técnico subsequente, PROEJA, bacharelado, licenciatura, especialização técnica e EAD). Alunos dos pelos ligados aos câmpus também poderão se inscrever (polos avançados e pelos de rede).A OLIP consistirá em uma bateria de problemas a serem resolvidos na data da prova. As equipes submeterão as possíveis soluções á Comissão Julgadora á medida que as obtiverem. Esta avaliará a submissão, aprovando-a ou rejeitando-a, e notificando a equipe. No caso de rejeição, a equipe poderá submeter novas soluções para o mesmo problema.Todos os membros das equipes receberão certificados de participação. Os melhores colocados de cada&nbsp;</span><span style=\"line-height: 1.5;\">modalidade receberão medalhas simbólicas. Os melhores colocados das duas modalidades (Técnico e Graduação) poderão ser convidados a participarem da Olimpíada Brasileira de Informática (nível técnico) e da Maratona de Programação (etapa regional, nível superior).As inscrições da OLIP já estão abertas. Estas irão de 06/06 até 20/06/2016. Podem se inscrever equipes de 2 ou 3 alunos, nas categorias técnico e superior. O valor simbólico da inscrição é um quilo de alimento não perecível, exceto sal. Maiores informações no site: &nbsp;</span><a href=\"http://maratona.muz.ifsuldeminas.edu.br\" style=\"line-height: 1.6;\">&nbsp;maratona.muz.ifsuldeminas.edu.br</a></p>', 'A Sociedade Brasileira de Computação (SBC) anualmente realiza a Olimpíada Brasileira de Informática (OBI), uma competição organizada nos moldes das outras olimpíadas científicas brasileiras, como Matemática, Física e Astronomia. O objetivo da OBI é despertar nos alunos o interesse por uma ciência importante na formação básica hoje em dia (no caso, ciência da computação), através de uma atividade que envolve desafio, engenhosidade e uma saudável dose de competição. Diversas instituições de ensino criaram mecanismos internos para estimular os seus alunos a participarem deste tipo de competição. Além do estímulo, espera-se identificar estudantes capacitados para participar das etapas regionais, nacionais e internacionais deste tipo de evento. Os melhores classificados em cada modalidade adotada são convidados a participar das seletivas da OBI.Dentro deste contexto, a 6ª Olimpíada Interna de Programação do IFSULDEMINAS (OLIP), objetiva proporcionar a oportunidade e o incentivo necessários para o desenvolvimento&nbsp;do acadêmico da área de informática quanto á sua capacidade para a resolução de problemas e a implementação de algoritmos em tempo limitado. &lt;br&gt;Com este propósito, criam-se ferramentas para avaliar e premiar tais habilidades, estimulando seu aperfeiçoamento.&lt;br&gt;Podem participar os alunos dos cursos de informática dos câmpus do IFSULDEMINAS, em todas as suas modalidades (técnico integrado, técnico subsequente, PROEJA, bacharelado, licenciatura, especialização técnica e EAD). Alunos dos pelos ligados aos câmpus também poderão se inscrever (polos avançados e pelos de rede).A OLIP consistirá em uma bateria de problemas a serem resolvidos na data da prova. As equipes submeterão as possíveis soluções á Comissão Julgadora á medida que as obtiverem. Esta avaliará a submissão, aprovando-a ou rejeitando-a, e notificando a equipe. No caso de rejeição, a equipe poderá submeter novas soluções para o mesmo problema.Todos os membros das equipes receberão certificados de participação. Os melhores colocados de cada&nbsp;modalidade receberão medalhas simbólicas. Os melhores colocados das duas modalidades (Técnico e Graduação) poderão ser convidados a participarem da Olimpíada Brasileira de Informática (nível técnico) e da Maratona de Programação (etapa regional, nível superior).As inscrições da OLIP já estão abertas. Estas irão de 06/06 até 20/06/2016. Podem se inscrever equipes de 2 ou 3 alunos, nas categorias técnico e superior. O valor simbólico da inscrição é um quilo de alimento não perecível, exceto sal. Maiores informações no site: &nbsp;&nbsp;maratona.muz.ifsuldeminas.edu.br', 'f24fdfa90bd242a1b5c132aeefc348f0.jpg', '2016-06-06', '2016-06-06', '0000-00-00', '6-olimpada-interna-de-programao', 'olip'),
(47, '<p>Semin&aacute;rio do LabSoft (18/09/2014)</p>', '<p>Mensalmente s&atilde;o realizados os semin&aacute;rios de grupo do LabSoft, os quais t&ecirc;m como objetivo geral criar um espa&ccedil;o para</p>', '<p>Mensalmente s&atilde;o realizados os semin&aacute;rios de grupo do LabSoft, os quais t&ecirc;m como objetivo geral criar um espa&ccedil;o para integra&ccedil;&atilde;o acad&ecirc;mica entre os alunos, professores e demais colaboradores do grupo de estudos em Tecnologias de Software e Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o, a fim de que atividades desenvolvidas no est&aacute;gio, projetos de inicia&ccedil;&atilde;o cient&iacute;fica ou conclus&atilde;o de curso, experi&ecirc;ncias de interc&acirc;mbio estudantil, dentre outras, sejam discutidas e refletidas.</p>', NULL, 'assets/images/site/noticias/seminrio-do-labsoft-18092014/noticia.jpg', '2016-05-05', NULL, '2016-05-05', 'seminrio_do_labsoft_18092014', NULL),
(48, '<p>LabSoft no Painel dos Grupos de Pesquisa em Inform&aacute;tica na Educa&ccedil;&atilde;o</p>', '<p>O LabSoft teve a participa&ccedil;&atilde;o aprovada no PGPIE, evento sat&eacute;lite do Congresso Brasileiro de Inform&aacute;tica na Educa&ccedil;&atilde;o,...</p>', '<p>O LabSoft teve a participa&ccedil;&atilde;o aprovada no PGPIE, evento sat&eacute;lite do Congresso Brasileiro de Inform&aacute;tica na Educa&ccedil;&atilde;o, que ser&aacute; realizado em Dourados-MG, em novembro/2014.</p>', NULL, 'assets/images/site/noticias/labsoft-no-painel-dos-grupos-de-pesquisa-em-informtica-na-educao/noticia.jpg', '2016-05-05', NULL, '2016-05-05', 'labsoft_no_painel_dos_grupos_de_pesquisa_em_informtica_na_educao', NULL),
(49, '<p>Labsoft do C&acirc;mpus Muzambinho auxilia profissionais interessados em participar no curso oferecido pelo Google</p>', '<p>A empresa Google est&aacute; oferecendo um curso online para quem quer trazer tecnologia para a sala de aula e quer descobrir ...</p>', '<p>A empresa Google est&aacute; oferecendo um curso online para quem quer trazer tecnologia para a sala de aula e quer descobrir novas formas de criar experi&ecirc;ncias de aprendizagem significativas para seus alunos.</p>', NULL, 'assets/images/site/noticias/labsoft-do-cmpus-muzambinho-auxilia-profissionais-interessados-em-participar-no-curso-oferecido-p', '2016-05-05', NULL, '2016-05-05', 'labsoft_do_cmpus_muzambinho_auxilia_profissionais_interessados_em_participar_no_curso', NULL),
(50, '<p>Evento Internacional Frontiers in Education</p>', '<p>Entre os dias 22 e 25 de Outubro de 2014, a professora Aracele Garcia de Oliveira Fassbinder, vinculada aos cursos ...</p>', '<p>Entre os dias 22 e 25 de Outubro de 2014, a professora Aracele Garcia de Oliveira Fassbinder, vinculada aos cursos T&eacute;cnicos em Inform&aacute;tica e Ci&ecirc;ncia da Computa&ccedil;&atilde;o do IFSULDEMINAS &ndash; C&acirc;mpus Muzambinho, esteve em Madri, na Espanha, para a apresenta&ccedil;&atilde;o oral de dois artigos completos aceitos no 44th Annual Frontiers in Education (FIE) Conference.</p>', NULL, 'assets/images/site/noticias/evento-internacional-frontiers-in-education/noticia.jpg', '2016-05-05', NULL, '2016-05-05', 'evento_internacional_frontiers_in_education', NULL),
(51, '<p>LABSOFT no CITE 2015</p>', '<p>O CITE 2015 (Congresso Internacional de tecnologia educacional da ABT), ocorreu de 01 a 04 de julho de 2015 e foi sediado ...</p>', '<p>O CITE 2015 (Congresso Internacional de tecnologia educacional da ABT), ocorreu de 01 a 04 de julho de 2015 e foi sediado pelo Instituto Federal do Sul de Minas Gerais &ndash; Campus Muzambinho, onde ocorreram v&aacute;rios minicursos, mesas de debate e exposi&ccedil;&atilde;o de trabalhos. O LABSOFT esteve presente em todas as partes do evento, desde a organiza&ccedil;&atilde;o, minicursos, exposi&ccedil;&atilde;o de trabalhos e mostra tecnol&oacute;gica.</p>', NULL, 'assets/images/site/noticias/labsoft-no-cite-2015/cite.jpg', '2016-05-05', NULL, '2016-05-05', 'labsoft_no_cite_2015', NULL),
(52, '<p>LabSoft no 3&ordm; Congresso Brasileiro de Inform&aacute;tica na Educa&ccedil;&atilde;o</p>', '<p>Entre os dias 03 e 06 de Novembro de 2014, a professora Aracele Garcia de Oliveira Fassbinder, vinculada aos cursos ...</p>', '<p>Entre os dias 03 e 06 de Novembro de 2014, a professora Aracele Garcia de Oliveira Fassbinder, vinculada aos cursos T&eacute;cnicos em Inform&aacute;tica e Ci&ecirc;ncia da Computa&ccedil;&atilde;o do IFSULDEMINAS &ndash; C&acirc;mpus Muzambinho, esteve em Dourados, Mato Grosso do Sul, para a apresenta&ccedil;&atilde;o oral de um artigo completo e de um banner no 3&ordm; Congresso Brasileiro de Inform&aacute;tica na Educa&ccedil;&atilde;o (CBIE).</p>', NULL, 'assets/images/site/noticias/labsoft-no-3-congresso-brasileiro-de-informtica-na-educao/3congresso.jpg', '2016-05-05', NULL, '2016-05-05', 'labsoft_no_3_congresso_brasileiro_de_informtica_na_educao0', NULL),
(53, '<p>Evento Comemorativo ao 3&ordm; Anivers&aacute;rio do Labsoft</p>', '<p>Aconteceu quarta-feira, dia 20 de maio de 2015, na sala 22 do Pr&eacute;dio Pedag&oacute;gico de Inform&aacute;tica do IFSULDEMINAS, um ...</p>', '<p>Aconteceu quarta-feira, dia 20 de maio de 2015, na sala 22 do Pr&eacute;dio Pedag&oacute;gico de Inform&aacute;tica do IFSULDEMINAS, um evento comemorativo aos 3 anos de atividade do Laborat&oacute;rio de Tecnologias de Software e Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o. O objetivo era divulgar a hist&oacute;ria do laborat&oacute;rio e seus projetos nos campos de ensino, pesquisa e extens&atilde;o.</p>', NULL, 'assets/images/site/noticias/evento-comemorativo-ao-3-aniversrio-do-labsoft/aniversario.jpg', '2016-05-05', NULL, '2016-05-05', 'evento_comemorativo_ao_3_aniversrio_do_labsoft', NULL),
(54, '<p>IV Congresso Brasileiro de Tecnologia Educacional</p>', '<p>Com muita satisfa&ccedil;&atilde;o informamos-lhe que a Associa&ccedil;&atilde;o Brasileira de Tecnologia Educacional - ABT, em parceria com a Faculdade...</p>', '<p>O Congresso Brasileiro de Tecnologia Educacional &eacute; promovido bienalmente pela ABT - Associa&ccedil;&atilde;o Brasileira de Tecnologia Educacional em parceria com entidades ligadas aos estudos das tecnologias educacionais.<br />Em 2016 o evento ser&aacute; realizado em Araraquara - SP, na Faculdade de Ci&ecirc;ncias e Letras da UNESP - Universidade Estadual Paulista, no per&iacute;odo de 27 a 29 de julho.<br /> Durante a realiza&ccedil;&atilde;o do evento ser&atilde;o realizadas palestras, mesas de discuss&otilde;es, haver&aacute; apresenta&ccedil;&atilde;o de trabalhos nos formatos de p&ocirc;steres e comunica&ccedil;&atilde;o oral.<br /><br /><br /><br />Os eixos tem&aacute;ticos do evento s&atilde;o:<br />1- Pol&iacute;ticas p&uacute;blicas;<br />2- Experi&ecirc;ncias de forma&ccedil;&atilde;o e atua&ccedil;&atilde;o docente;<br />3- Educa&ccedil;&atilde;o a dist&acirc;ncia;<br />4- Cultura digital e comunica&ccedil;&atilde;o.</p>', NULL, 'assets/images/site/noticias/iv-congresso-brasileiro-de-tecnologia-educacional/cbie.png', '2016-05-12', NULL, '2016-05-12', 'iv_congresso_brasileiro_de_tecnologia_educacional', NULL),
(55, '<p>LabSoft realiza mais um semin&aacute;rio sobre projetos na &aacute;rea de tecnologia de informa&ccedil;&atilde;o e comunic', '<p>No dia 09 de abril, recome&ccedil;aram os semin&aacute;rios para apresenta&ccedil;&atilde;o dos projetos de TCC, pesquisa e extens&atilde;o do Laborat&oacute;rio de Tecnol&oacute;gicas de Software ...</p>', '<p>No dia 09 de abril, recome&ccedil;aram os semin&aacute;rios para apresenta&ccedil;&atilde;o dos projetos de TCC, pesquisa e extens&atilde;o do Laborat&oacute;rio de Tecnol&oacute;gicas de Software e Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o (LabSoft) que est&atilde;o previstos para o ano de 2016. Na ocasi&atilde;o, foram apresentados os projetos de extens&atilde;o em andamento:<br /><br />- Projeto Computar Brincando (apresentado por Erlon Charles Gomes de Aquino Junior)<br />- Projeto Aluno Digital: O uso de tecnologia da informa&ccedil;&atilde;o e comunica&ccedil;&atilde;o em ambiente escolar (apresentado pelos alunos Andr&eacute; Felipe e Leonardo Fonseca Moreira)<br />- O Semin&aacute;rio contou com a participa&ccedil;&atilde;o dos professores Ramon Gustavo Teodoro Marques da Silva, Sandra Helena Miranda, Aline Marques Del Valle, Paulo Cesar dos Santos e Ieda M. Sabino Kawashita. Tamb&eacute;m participaram os alunos estagi&aacute;rios e bolsistas de inicia&ccedil;&atilde;o cient&iacute;fica Matheus Carvalho Barbosa, &Iacute;caro Messias, Raphael de Paiva Gon&ccedil;alves, Erlon Chales G. de Aquino Junior, Andr&eacute; Felipe, Leonardo Fonseca Moreira, Jonathan Felipe e Nat&aacute;lia Gaspar. A iniciativa possibilitou o debate e sugest&atilde;o de novas ideias, assim como o alinhamento de algumas propostas.<br /><br />Conhe&ccedil;a abaixo um pouco sobre os trabalhos que est&atilde;o sendo realizados pelo LabSoft:<br /><br /><strong>ALUNO DIGITAL</strong><br /><br />O Projeto de extens&atilde;o Aluno Digital tem o objetivo de levar o suporte de tecnologia da informa&ccedil;&atilde;o &agrave;s escolas de Muzambinho. Nosso objetivo &eacute; ampliar o uso da tecnologia em favor das possibilidades did&aacute;ticas. Com isso, o projeto vai atender alunos e professores (cerca 2500 pessoas) da cidade por meio de minicursos com tem&aacute;ticas relacionadas a tecnologias de informa&ccedil;&atilde;o e comunica&ccedil;&atilde;o com um laborat&oacute;rio itinerante.<br /><br /><strong>COMPUTAR BRINCANDO</strong><br /><br />O Projeto Computar Brincando, com bolsa CNPq, visa incentivar os alunos da Escola Estadual Ces&aacute;rio Coimbra a realizarem buscas por meio do conhecimento dentro da &aacute;rea de tecnologia, fazendo com que tais entrem em contato, ainda no Ensino Fundamental, com l&oacute;gica de programa&ccedil;&atilde;o.<br /><br /><strong>Conhe&ccedil;a um pouco mais sobre o LabSoft</strong><br /><br />O LabSoft &ndash; Laborat&oacute;rio de Tecnol&oacute;gicas de Software e Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o vem se consolidando nos &uacute;ltimos anos com os resultados dos trabalhos aceitos e divulgados perante a comunidade cient&iacute;fica. O laborat&oacute;rio foi criado em 2012 com o apoio do NDE, Colegiado do Curso de Ci&ecirc;ncia da Computa&ccedil;&atilde;o e da Dire&ccedil;&atilde;o do Campus Muzambinho.<br /><br />Os projetos de pesquisa e extens&atilde;o desenvolvidos pelos professores e alunos, seguem duas linhas b&aacute;sicas: Educa&ccedil;&atilde;o e Tecnologia. As sub&aacute;reas relacionadas s&atilde;o: Educa&ccedil;&atilde;o em Computa&ccedil;&atilde;o, Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o e Educa&ccedil;&atilde;o Especial, Educa&ccedil;&atilde;o &agrave; Dist&acirc;ncia, Desenvolvimento Web, Web Sem&acirc;ntica e Desenvolvimento de Jogos Educacionais.<br /><br />Atualmente participam tr&ecirc;s docentes que atuam como membros: Aracele Fassbinder, Ramon Marques e Paulo C&eacute;sar dos Santos. Os professores Adolfo Carvalho, Elenice Carlos, Ieda Mayumi, Aline Marques e Sandra Miranda participam como colaboradores internos (IFSULDEMINAS). E a professora Ellen Barbosa (USP-ICMC) como colaboradora externa.<br /><br />Cerca de dez estudantes desenvolvem est&aacute;gio, inicia&ccedil;&atilde;o cient&iacute;fica, projeto acad&ecirc;mico ou trabalho de conclus&atilde;o de curso sob orienta&ccedil;&atilde;o dos professores respons&aacute;veis pelo laborat&oacute;rio.<br /><br />Bimestralmente s&atilde;o realizados os semin&aacute;rios de grupo do LabSoft, os quais t&ecirc;m como objetivo criar um espa&ccedil;o para integra&ccedil;&atilde;o acad&ecirc;mica entre os alunos, professores e demais colaboradores do grupo de estudos em Tecnologias de Software e Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o, a fim de que atividades desenvolvidas no est&aacute;gio, projetos de inicia&ccedil;&atilde;o cient&iacute;fica ou conclus&atilde;o de curso, experi&ecirc;ncias de interc&acirc;mbio estudantil, dentre outras, sejam discutidas e refletidas.<br /><br />Quando um aluno ou professor faz uma apresenta&ccedil;&atilde;o para os demais, cria-se um canal de sugest&otilde;es, cr&iacute;ticas construtivas e identifica&ccedil;&atilde;o de interesses comuns, o que pode resultar em novas ideias, novos projetos e na melhoria das atividades ainda pendentes.<br /><br /></p>', NULL, 'assets/images/site/noticias/labsoft-realiza-mais-um-seminrio-sobre-projetos-na-rea-de-tecnologia-de-informao-e-comunicao-apli', '2016-05-16', NULL, '2016-05-16', 'labsoft_realiza_mais_um_seminrio_sobre_projetos_na_rea_de_tecnologia_de_informao_e_co', NULL),
(56, '<p>Docente do IFSULDEMINAS - Campus Muzambinho apresenta trabalho na VIII Confer&ecirc;ncia da ABEP-UK.</p>', '<p>No dia 14 de Maio de 2016, a professora Aracele Garcia de Oliveira Fassbinder apresentou um trabalho, aceito na modalidade poster...</p>', '<p>No dia 14 de Maio de 2016, a professora Aracele Garcia de Oliveira Fassbinder apresentou um trabalho, aceito na modalidade poster, na VIII ABEP-UK Conference, realizada no King College, em Londres na Inglaterra.<br />A Associa&ccedil;&atilde;o de Brasileiros Estudantes de P&oacute;s-Gradua&ccedil;&atilde;o e Pesquisadores no Reino Unido (ABEP &ndash; UK) &eacute; uma sociedade de car&aacute;ter civil, sem fins lucrativos, com sede em Londres, que congrega estudantes de p&oacute;s-gradua&ccedil;&atilde;o e pesquisadores brasileiros que a ela se filiarem e que estejam no Reino Unido.<br />J&aacute; a Confer&ecirc;ncia da ABEP-UK &eacute; uma boa oportunidade para estudantes e pesquisadores brasileiros apresentarem e discutirem os resultados dos trabalhos que v&ecirc;m sendo conduzidos em parceria com pesquisadores associados &agrave;s institui&ccedil;&otilde;es do Reino Unido.<br />Em 2016, o tema do evento foi \"Research and Development: Shaping the Future of Brazil\", e consistiu em palestra com membros da Embaixada Brasileira em Londres, mesa redonda sobre como construir uma carreira acad&ecirc;mica no Reino Unido, organizada por brasileiros que residem e trabalham em institui&ccedil;&otilde;es brit&acirc;nicas de ensino e pesquisa, bem como apresenta&ccedil;&otilde;es de trabalhos cient&iacute;ficos nas modalidades oral e poster.<br />O resultado do trabalho apresentado pela professora Aracele est&aacute; relacionado ao est&aacute;gio de doutoramento realizado no Birkbeck College, University of London, no per&iacute;odo de Junho de 2015 e Maio de 2016. O est&aacute;gio tem o apoio do programa Ci&ecirc;ncia sem Fronteiras e est&aacute; vinculado &agrave; pesquisa em Engenharia de Software Aplicada &agrave; Educa&ccedil;&atilde;o que a professora vem desenvolvendo no seu doutorado no Instituto de Ci&ecirc;ncias Matem&aacute;ticas e de Computa&ccedil;&atilde;o (ICMC), na Universidade de S&atilde;o Paulo (USP).</p>', NULL, 'assets/images/site/noticias/docente-do-ifsuldeminas-campus-muzambinho-apresenta-trabalho-na-viii-conferncia-da-abep-uk/aracel', '2016-05-18', NULL, '2016-05-18', 'docente_do_ifsuldeminas_-_campus_muzambinho_apresenta_trabalho_na_viii_conferncia_da_', NULL),
(57, '<p>6&ordf; Olimp&iacute;ada Interna de Programa&ccedil;&atilde;o do IFSULDEMINAS (OLIP)</p>', '<p>A Sociedade Brasileira de Computa&ccedil;&atilde;o (SBC) anualmente realiza a Olimp&iacute;ada Brasileira de Inform&aacute;tica (OBI), uma competi&ccedil;&atilde;o ...</p>', '<p>A Sociedade Brasileira de Computa&ccedil;&atilde;o (SBC) anualmente realiza a Olimp&iacute;ada Brasileira de Inform&aacute;tica (OBI), uma competi&ccedil;&atilde;o organizada nos moldes das outras olimp&iacute;adas cient&iacute;ficas brasileiras, como Matem&aacute;tica, F&iacute;sica e Astronomia. O objetivo da OBI &eacute; despertar nos alunos o interesse por uma ci&ecirc;ncia importante na forma&ccedil;&atilde;o b&aacute;sica hoje em dia (no caso, ci&ecirc;ncia da computa&ccedil;&atilde;o), atrav&eacute;s de uma atividade que envolve desafio, engenhosidade e uma saud&aacute;vel dose de competi&ccedil;&atilde;o. Diversas institui&ccedil;&otilde;es de ensino criaram mecanismos internos para estimular os seus alunos a participarem deste tipo de competi&ccedil;&atilde;o. Al&eacute;m do est&iacute;mulo, espera-se identificar estudantes capacitados para participar das etapas regionais, nacionais e internacionais deste tipo de evento. Os melhores classificados em cada modalidade adotada s&atilde;o convidados a participar das seletivas da OBI.Dentro deste contexto, a 6&ordf; Olimp&iacute;ada Interna de Programa&ccedil;&atilde;o do IFSULDEMINAS (OLIP), objetiva proporcionar a oportunidade e o incentivo necess&aacute;rios para o desenvolvimento do o acad&ecirc;mico da &aacute;rea de inform&aacute;tica quanto &aacute; sua capacidade para a resolu&ccedil;&atilde;o de problemas e a implementa&ccedil;&atilde;o de algoritmos em tempo limitado. <br />Com este prop&oacute;sito, criam-se ferramentas para avaliar e premiar tais habilidades, estimulando seu aperfei&ccedil;oamento.<br />Podem participar os alunos dos cursos de inform&aacute;tica dos c&acirc;mpus do IFSULDEMINAS, em todas as suas modalidades (t&eacute;cnico integrado, t&eacute;cnico subsequente, PROEJA, bacharelado, licenciatura, especializa&ccedil;&atilde;o t&eacute;cnica e EAD). Alunos dos pelos ligados aos c&acirc;mpus tamb&eacute;m poder&atilde;o se inscrever (polos avan&ccedil;ados e pelos de rede).A OLIP consistir&aacute; em uma bateria de problemas a serem resolvidos na data da prova. As equipes submeter&atilde;o as poss&iacute;veis solu&ccedil;&otilde;es &aacute; Comiss&atilde;o Julgadora &aacute; medida que as obtiverem. Esta avaliar&aacute; a submiss&atilde;o, aprovando-a ou rejeitando-a, e notificando a equipe. No caso de rejei&ccedil;&atilde;o, a equipe poder&aacute; submeter novas solu&ccedil;&otilde;es para o mesmo problema.Todos os membros das equipes receber&atilde;o certificados de participa&ccedil;&atilde;o. Os melhores colocados de cada modalidade receber&atilde;o medalhas simb&oacute;licas. Os melhores colocados das duas modalidades (T&eacute;cnico e Gradua&ccedil;&atilde;o) poder&atilde;o ser convidados a participarem da Olimp&iacute;ada Brasileira de Inform&aacute;tica (n&iacute;vel t&eacute;cnico) e da Maratona de Programa&ccedil;&atilde;o (etapa regional, n&iacute;vel superior).As inscri&ccedil;&otilde;es da OLIP j&aacute; est&atilde;o abertas. Estas ir&atilde;o de 06/06 at&eacute; 20/06/2016. Podem se inscrever equipes de 2 ou 3 alunos, nas categorias t&eacute;cnico e superior. O valor simb&oacute;lico da inscri&ccedil;&atilde;o &eacute; um quilo de alimento n&atilde;o perec&iacute;vel, exceto sal. Maiores informa&ccedil;&otilde;es no site: <a href=\"http://maratona.muz.ifsuldeminas.edu.br/\" target=\"_blank\">maratona.muz.ifsuldeminas.edu.br</a></p>', NULL, 'assets/images/site/noticias/6-olimpada-interna-de-programao-do-ifsuldeminas-olip/logo_olimpiada.gif', '2016-06-06', NULL, '2016-06-06', '6_olimpada_interna_de_programao_do_ifsuldeminas_olip', NULL),
(58, 'VIII Seminário do LABSOFT', 'LABSOFT realiza seminário sobre projetos na área de  informática na educação', '<p>Ocorreu, no dia 27 de junho, o segundo semin&aacute;rio de 2016 do LabSoft &ndash; Laborat&oacute;rio de&nbsp;Tecnol&oacute;gicas de Software e Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o. Na ocasi&atilde;o foram&nbsp;apresentados os seguintes projetos de inicia&ccedil;&atilde;o cient&iacute;fica e trabalho de conclus&atilde;o de&nbsp;curso em andamento:</p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>Modelagem, desenvolvimento e avalia&ccedil;&atilde;o de um aplicativo m&oacute;vel como recurso&nbsp;na alfabetiza&ccedil;&atilde;o de crian&ccedil;as (por Raphael Gon&ccedil;alves &shy; 7o Per&iacute;odo do curso de Ci&ecirc;ncia da Computa&ccedil;&atilde;o &shy; Projeto de Inicia&ccedil;&atilde;o Cient&iacute;fica)</li>\r\n</ul>\r\n<ul>\r\n<li>Modelagem e implementa&ccedil;&atilde;o de um sistema de recomenda&ccedil;&atilde;o para as unidades&nbsp;b&aacute;sicas de sa&uacute;de (por Icaro Brito de Carvalho Messias &shy; 7o Per&iacute;odo do curso de Ci&ecirc;ncia da Computa&ccedil;&atilde;o &shy; Projeto de Conclus&atilde;o de Curso).</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>Tamb&eacute;m contamos com a presen&ccedil;a da fundadora do LabSoft, professora Aracele Garcia&nbsp;de Oliveira Fassbinder, que apresentou um relato de experi&ecirc;ncia sobre a sua pesquisa&nbsp;de doutorado no Birkbeck College &shy; University of London (Londres, Inglaterra). A&nbsp;apresenta&ccedil;&atilde;o foi esclarecedora e motivadora para os estudantes e docentes que tem&nbsp;interesse em fazer um interc&acirc;mbio no exterior. Segundo a professora, a experi&ecirc;ncia&nbsp;adquirida foi fundamental em seu amadurecimento profissional e pessoal.</p>\r\n<p>O Semin&aacute;rio tamb&eacute;m contou com a participa&ccedil;&atilde;o dos professores Ramon Gustavo&nbsp;Teodoro Marques da Silva e Paulo C&eacute;sar dos Santos, l&iacute;der e v&iacute;ce&shy;l&iacute;der do LabSoft,</p>\r\n<p>respectivamente, e de Sandra Helena Miranda, Aline Marques Del Valle e Ieda M. Sabino&nbsp;Kawashita. Tamb&eacute;m participaram os alunos estagi&aacute;rios e bolsistas de inicia&ccedil;&atilde;o cient&iacute;fica&nbsp;Icaro Messias, Raphael de Paiva Gon&ccedil;alves, Erlon Chales G. de Arquino Junior, Andr&eacute;&nbsp;Felipe, Nat&aacute;lia Gaspar, Fabiana Ziote, Matheus Reis, Jo&atilde;o Marcos, Rober Oliveira, Flavia&nbsp;B&oacute;coli, Andre Santiago e Pedro Henrico. Por meio do semin&aacute;rio foi poss&iacute;vel o debate,&nbsp;discuss&atilde;o e o refinamento dos trabalhos apresentados.</p>\r\n<p>A seguir s&atilde;o apresentadas informa&ccedil;&otilde;es sobre os projetos.</p>\r\n<p>O projeto Modelagem, desenvolvimento e avalia&ccedil;&atilde;o de um aplicativo m&oacute;vel como&nbsp;recurso na alfabetiza&ccedil;&atilde;o de crian&ccedil;as tem como prop&oacute;sito o desenvolvimento de um&nbsp;aplicativo m&oacute;vel para a alfabetiza&ccedil;&atilde;o de crian&ccedil;as, como foco no design universal, para a&nbsp;garantia de usabilidade e acessibilidade aos usu&aacute;rios. Em uma parceria com a FAM&nbsp;(Funda&ccedil;&atilde;o de Amparo ao Menor) de Muzambinho, por meio da colaboradora Miriam&nbsp;Bueno Guimar&atilde;es, o aplicativo ser&aacute; testado com as crian&ccedil;as, visando a avalia&ccedil;&atilde;o do&nbsp;mesmo quanto a usabilidade, acessibilidade e recurso did&aacute;tico para o ensino e&nbsp;alfabetiza&ccedil;&atilde;o. O projeto possui fomento da FAPEMIG, e tem prazo de termino em Mar&ccedil;o&nbsp;de 2017.</p>\r\n<p>J&aacute; o projeto de Conclus&atilde;o de Curso Modelagem e implementa&ccedil;&atilde;o de um sistema de&nbsp;recomenda&ccedil;&atilde;o para as unidades b&aacute;sicas de sa&uacute;de visa o desenvolvimento de uma&nbsp;ferramenta web baseada em sistema de recomenda&ccedil;&atilde;o a partir da literatura, sinais e&nbsp;sintomas de clientes das Unidades B&aacute;sicas de Sa&uacute;de, com o intuito de agilizar o&nbsp;atendimento e auxiliar profissionais da sa&uacute;de nos diagn&oacute;sticos cl&iacute;nicos de doen&ccedil;as. A&nbsp;partir dos dados de entrada, a ferramenta recomendar&aacute; um poss&iacute;vel diagn&oacute;stico para o&nbsp;paciente. A recomenda&ccedil;&atilde;o ocorrer&aacute; com base nos dados do perfil do paciente, seus&nbsp;sinais e sintomas. Tamb&eacute;m ser&atilde;o base para a recomenda&ccedil;&atilde;o as informa&ccedil;&otilde;es sobre&nbsp;doen&ccedil;as que s&atilde;o mais incidentes na regi&atilde;o e informa&ccedil;&otilde;es da literatura. O Projeto de&nbsp;conclus&atilde;o de curso tem prazo de t&eacute;rmino em Dezembro de 2016.</p>\r\n<p>Vejam tamb&eacute;m not&iacute;cias de semin&aacute;rios anteriores realizados pelo LabSoft:</p>\r\n<p><a href=\"http://www.muz.ifsuldeminas.edu.br/index.php/gerais/4393&shy;seminario&shy;labsoft\">http://www.muz.ifsuldeminas.edu.br/index.php/gerais/4393&shy;seminario&shy;labsoft</a></p>\r\n<p><a href=\"http://www.muz.ifsuldeminas.edu.br/index.php/palestras/3477&shy;labsoft\">http://www.muz.ifsuldeminas.edu.br/index.php/palestras/3477&shy;labsoft</a></p>\r\n<p><a href=\"http://www.muz.ifsuldeminas.edu.br/index.php/eventos/3093&shy;seminarios&shy;do&shy;labsoft\">http://www.muz.ifsuldeminas.edu.br/index.php/eventos/3093&shy;seminarios&shy;do&shy;labsoft</a></p>\r\n<p>&nbsp;</p>\r\n<p>Conhe&ccedil;a um pouco mais sobre o LabSoft:</p>\r\n<p>O LabSoft &ndash; Laborat&oacute;rio de Tecnol&oacute;gicas de Software e Computa&ccedil;&atilde;o Aplicada &agrave;&nbsp;Educa&ccedil;&atilde;o &shy; criado em 2012, com o apoio do NDE, Colegiado do Curso de Ci&ecirc;ncia da</p>\r\n<p>Computa&ccedil;&atilde;o e Dire&ccedil;&atilde;o do C&acirc;mpus Muzambinho, vem se consolidando nos &uacute;ltimos anos&nbsp;com os resultados dos trabalhos aceitos e divulgados perante a comunidade cient&iacute;fica.&nbsp;Os projetos de pesquisa e extens&atilde;o, desenvolvidos pelos professores e alunos, seguem&nbsp;2 linhas b&aacute;sicas: educa&ccedil;&atilde;o e tecnologia. As sub&aacute;reas relacionadas s&atilde;o: Educa&ccedil;&atilde;o em Computa&ccedil;&atilde;o, Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o e Educa&ccedil;&atilde;o Especial, Educa&ccedil;&atilde;o &agrave;&nbsp;Dist&acirc;ncia, Desenvolvimento Web, Web Sem&acirc;ntica e Desenvolvimento de Jogos&nbsp;Educacionais.</p>\r\n<p>Atualmente participam os professores Aracele Fassbinder, Ramon Marques e Paulo&nbsp;C&eacute;sar dos Santos, que atuam no papel de membros. Os professores Adolfo Carvalho,&nbsp;Ieda Mayumi, Aline Marques e Sandra Miranda no papel de colaboradores internos&nbsp;(IFSULDEMINAS). E as professoras Ellen Barbosa (USP&shy;ICMC) e Elenice Carlos&nbsp;(IFSULDEMINAS &shy; Campus Po&ccedil;os), como colaboradoras externas.&nbsp;Cerca de 10 alunos desenvolvem est&aacute;gio, inicia&ccedil;&atilde;o cient&iacute;fica, projeto acad&ecirc;mico ou&nbsp;trabalho de conclus&atilde;o de curso sob orienta&ccedil;&atilde;o dos professores respons&aacute;veis pelo&nbsp;laborat&oacute;rio.</p>\r\n<p>Bimestralmente s&atilde;o realizados os semin&aacute;rios de grupo do LabSoft, os quais t&ecirc;m como&nbsp;objetivo geral criar um espa&ccedil;o para integra&ccedil;&atilde;o acad&ecirc;mica entre os alunos, professores e&nbsp;demais colaboradores do grupo de estudos em Tecnologias de Software e Computa&ccedil;&atilde;o&nbsp;Aplicada &agrave; Educa&ccedil;&atilde;o, a fim de que atividades desenvolvidas no est&aacute;gio, projetos de&nbsp;inicia&ccedil;&atilde;o cient&iacute;fica ou conclus&atilde;o de curso, experi&ecirc;ncias de interc&acirc;mbio estudantil, dentre&nbsp;outras, sejam discutidas e refletidas.&nbsp;Quando um aluno ou professor faz uma apresenta&ccedil;&atilde;o para os demais, cria&shy;se um canal&nbsp;de sugest&otilde;es, cr&iacute;ticas construtivas e identifica&ccedil;&atilde;o de interesses comuns, o que pode&nbsp;resultar em novas ideias, novos projetos e na melhoria das atividades ainda pendentes.&nbsp;</p>\r\n<p>Maiores informa&ccedil;&otilde;es:</p>\r\n<p>Site do Lab <a href=\"../../\">http://labsoft.muz.ifsuldeminas.edu.br</a></p>\r\n<p>Grupo no Face: <a href=\"https://www.facebook.com/labsoft.ifsuldeminas\">https://www.facebook.com/labsoft.ifsuldeminas</a></p>\r\n<p>E&shy;mail: labsoft@muz.ifsuldeminas.edu.br</p>\r\n<p>Localiza&ccedil;&atilde;o: Sala de Pesquisa 24, Terceiro Andar, Pr&eacute;dio de Inform&aacute;tica.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', NULL, 'assets/images/site/noticias/viii-seminrio-do-labsoft/conteudo-2.jpg', '2016-07-04', NULL, '2016-06-27', 'viii_seminrio_do_labsoft', NULL),
(59, 'Apresentação de Trabalho no Brazilian Technology Symposium', 'Aluno e docentes do Campus Muzambinho apresentam artigo no Brazilian Technology Symposium (BTSym)', '<p>Nos dias 01 e 02 de dezembro, aconteceu o Brazilian Technology Symposium (BTSym2016) no Centro de Conven&ccedil;&otilde;es da Universidade Estadual de Campinas (UNICAMP). No evento ocorreram palestras e apresenta&ccedil;&otilde;es envolvendo projetos e trabalhos inovadores com enfoques nas seguintes &aacute;reas: Arquitetura e Urbanismo, Ci&ecirc;ncia da Computa&ccedil;&atilde;o, Inform&aacute;tica, Desenho Industrial, Probabilidade e Estat&iacute;stica, Engenharias diversas.</p>\n<p>O egresso do curso de Ci&ecirc;ncia da Computa&ccedil;&atilde;o do IFSULDEMINAS - Campus Muzambinho, Francisco Jos&eacute; Nardi Filho, apresentou parte dos resultados do seu Trabalho de Conclus&atilde;o de Curso (TCC) no evento. O projeto foi conduzido no Laborat&oacute;rio de Tecnologias de Software e Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o (LabSoft) do IFSULDEMINAS &ndash; Campus Muzambinho, sob orienta&ccedil;&atilde;o do Professor Ramon Gustavo Teodoro Marques da Silva e com a colabora&ccedil;&atilde;o da Professora Aracele Garcia de Oliveira Fassbinder.</p>\n<p>O trabalho intitulado &ldquo;Minera&ccedil;&atilde;o de Dados sobre os Censos do IBGE, IPEA e INEP com Foco no Desenvolvimento Socioeducacional da Regi&atilde;o da AMOG&rdquo; visa a an&aacute;lise de dados p&uacute;blicos diversos a partir dos &oacute;rg&atilde;os IBGE, IPEA e INEP utilizando t&eacute;cnicas de Minera&ccedil;&atilde;o de dados para a obten&ccedil;&atilde;o de informa&ccedil;&atilde;o estrat&eacute;gica para a tomada de decis&atilde;o nos investimentos p&uacute;blicos em &aacute;reas como educa&ccedil;&atilde;o, sa&uacute;de, obras, etc. na regi&atilde;o da AMOG.</p>\n<p>Na condu&ccedil;&atilde;o do trabalho foi realizada uma revis&atilde;o sistem&aacute;tica visando identificar as principais t&eacute;cnicas de minera&ccedil;&atilde;o de dados utilizadas no contexto governamental brasileiro.</p>\n<p>Os resultados da revis&atilde;o sistem&aacute;tica levaram a publica&ccedil;&atilde;o do seguinte artigo no BTSym2016:</p>\n<ul>\n<li><strong><a href=\"http://www.muz.ifsuldeminas.edu.br/images/stories/PDF/2016/12/Artigo-BTSym2016-UNICAMP.pdf\">Towards the identification of Data Mining techniques in the Brazilian governmental context. Autoria de Francisco Jos&eacute; Nardi Filho, Aracele Fassbinder e Ramon Gustavo Teodoro Marques da Silva.</a></strong></li>\n</ul>\n<p>Site com resultados da revis&atilde;o sistem&aacute;tica: <a href=\"https://sites.google.com/site/socioeconedusysrev/home\">https://sites.google.com/site/socioeconedusysrev/home</a><br />Mais informa&ccedil;&otilde;es do evento em: <a href=\"http://lcv.fee.unicamp.br/brazilian-technology-symposium\">http://lcv.fee.unicamp.br/brazilian-technology-symposium</a> <br />Sobre o LabSoft: <a href=\"../../\">http://labsoft.muz.ifsuldeminas.edu.br/</a><br />Sobre o Curso de Ci&ecirc;ncia da Computa&ccedil;&atilde;o do Campus Muzambinho: <a href=\"http://comp.muz.ifsuldeminas.edu.br/\">http://comp.muz.ifsuldeminas.edu.br/</a></p>', NULL, 'assets/images/site/noticias/apresentao-de-trabalho-no-brazilian-technology-symposium/Symposium_3.jpg', '2017-03-10', NULL, '2016-12-01', 'apresentao_de_trabalho_no_brazilian_technology_symposium', NULL),
(60, 'Apresentação de Trabalho no 21º Congresso Internacional de Informática Educativa', 'Docente do Campus Muzambinho apresenta artigos no 21º Congresso Internacional de Informática Educativa', '<p>Entre os dias 29, 30 de novembro e 01 de dezembro de 2016, a professora Aracele Garcia de Oliveira Fassbinder realizou a apresenta&ccedil;&atilde;o oral de dois artigos completos aceitos no XXI Congresso Internacional de Inform&aacute;tica Educativa (TISE), em Santiago, no Chile.</p>\n<p>Trata-se de um evento multidisciplinar que recebe trabalhos de profissionais que atuam nas &aacute;reas de Engenharia de Software, Educa&ccedil;&atilde;o, Intera&ccedil;&atilde;o Humano-Computador, Psicologia Educacional, Desenho Gr&aacute;fico e Telecomunica&ccedil;&otilde;es, dentre outras. A confer&ecirc;ncia foi organizada pelo Centro de Computaci&oacute;n y Comunicaci&oacute;n para la Construcci&oacute;n del Conocimiento, do Departamento de Ci&ecirc;ncias da Computa&ccedil;&atilde;o, da Universidade do Chile.</p>\n<p>Os resultados dos trabalhos apresentados est&atilde;o relacionados &agrave; pesquisa em Engenharia de Software Aplicada &agrave; Educa&ccedil;&atilde;o que a professora vem desenvolvendo no seu doutorado, no Instituto de Ci&ecirc;ncias Matem&aacute;ticas e de Computa&ccedil;&atilde;o (ICMC), na Universidade de S&atilde;o Paulo (USP), em S&atilde;o Carlos/SP. Eles tamb&eacute;m est&atilde;o alinhados com as atividades do Laborat&oacute;rio de Tecnologias de Software e Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o (LabSoft) do IFSULDEMINAS &ndash; Campus Muzambinho, do qual a professora faz parte.</p>\n<p>Um dos trabalhos foi desenvolvido em colabora&ccedil;&atilde;o com o professor George Magoulas, do Birkbeck College &ndash; University of London, durante o per&iacute;odo em que Aracele realizou est&aacute;gio de doutoramento em Londres, na Inglaterra, de Junho/2015 at&eacute; Maio/2016.</p>\n<p>A docente &eacute; vinculada aos cursos T&eacute;cnicos em Inform&aacute;tica e Ci&ecirc;ncia da Computa&ccedil;&atilde;o do IFSULDEMINAS &ndash; Campus Muzambinho e atualmente est&aacute; afastada para qualifica&ccedil;&atilde;o.</p>\n<p>Segundo a professora Aracele Fassbinder, a apresenta&ccedil;&atilde;o de trabalhos &eacute; fundamental para disseminar o conhecimento j&aacute; adquirido durante o processo de desenvolvimento da pesquisa. Tamb&eacute;m &eacute; uma oportunidade para conhecer o trabalho de outras pessoas, estabelecer novas parcerias e ampliar a rede de contatos.</p>\n<p>No TISE, especificamente, a professora teve contato com professores da Universidade Carlos III de Madrid, Espanha, que est&atilde;o trabalhando com Cursos Abertos, Online e Massivos (do ingl&ecirc;s Massive Open Online Courses, MOOCs), tema de pesquisa do seu doutorado. Tais professores facilitaram uma palestra, dois cursos, uma mesa redonda e apresentaram artigos relatando as experi&ecirc;ncias com o desenvolvimento desse tipo de curso virtual, na Espanha e no Chile.</p>\n<p>Adicionalmente, &ldquo;se o evento ocorre em outro pa&iacute;s, voc&ecirc; tem a possibilidade de conhecer outra cultura e ampliar sua vis&atilde;o do mundo&rdquo;. Na ocasi&atilde;o, a professora conheceu a Cordilheira dos Andes, algo que s&oacute; teve contato pelos livros e pela internet. &ldquo;Uma das maravilhas do mundo e que possui grande influ&ecirc;ncia na cultura e modo de vida do povo chileno&rdquo;, acrescentou.</p>\n<p>Os trabalhos apresentados por Aracele, ambos na se&ccedil;&atilde;o Educa&ccedil;&atilde;o a Dist&acirc;ncia (e-Learning, MOOCs e outros), est&atilde;o descritos a seguir:</p>\n<ul>\n<li>Towards a MOOC Design Model based on Flipped Learning and Patterns: A Case on Introductory Courses. Autoria de Aracele Fassbinder (IFSULDEMINAS), Marcelo Fassbinder (UNIFRAN Virtual), Ellen Francine Barbosa (USP) e George Magoulas (Birkbeck College-University of London).</li>\n<li>A Preliminary Set of Pedagogical Requirements for Characterization and Comparison of MOOCs Platforms. Autoria de Aracele Fassbinder (IFSULDEMINAS), Marcelo Fassbinder (UNIFRAN Virtual) e Ellen Francine Barbosa (USP).</li>\n</ul>\n<p>Para esta confer&ecirc;ncia, especificamente, a professora agradece o apoio da CAPES/USP pela inscri&ccedil;&atilde;o no evento e transporte. De forma geral, para condu&ccedil;&atilde;o do doutorado, agradece ao IFSULDEMINAS, Universidade de S&atilde;o Paulo e o Birkbeck College.</p>\n<p>Mais informa&ccedil;&otilde;es em: <a href=\"http://tise.cl/\">http://tise.cl/</a><br />Sobre o LabSoft: <a href=\"../../\">http://labsoft.muz.ifsuldeminas.edu.br/</a><br />Sobre o Curso de Ci&ecirc;ncia da Computa&ccedil;&atilde;o do Campus Muzambinho: <a href=\"http://comp.muz.ifsuldeminas.edu.br/\">http://comp.muz.ifsuldeminas.edu.br/</a><br />Sobre o Projeto de Doutoramento da Professora Aracele: <a href=\"http://caed.icmc.usp.br/mooc/\">http://caed.icmc.usp.br/mooc/</a></p>', NULL, 'assets/images/site/noticias/apresentao-de-trabalho-no-21-congresso-internacional-de-informtica-educativa/Congresso_Internacio', '2017-03-10', NULL, '2016-11-29', 'apresentao_de_trabalho_no_21_congresso_internacional_de_informtica_educativa', NULL),
(61, 'VII Seminário do LABSOFT', 'LabSoft realiza seminário sobre projetos na área de tecnologia de informação e comunicação aplicados à educação.', '<p>No dia 09 de abril de 2016, recome&ccedil;aram os semin&aacute;rios para apresenta&ccedil;&atilde;o dos projetos de TCC, pesquisa e extens&atilde;o do Laborat&oacute;rio de Tecnol&oacute;gicas de Software e Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o (LabSoft) que est&atilde;o previstos para o ano de 2016. Na ocasi&atilde;o, foram apresentados os projetos de extens&atilde;o em andamento:</p>\n<ul>\n<li>Projeto Computar Brincando (apresentado por Erlon Charles Gomes de Aquino Junior)</li>\n<li>Projeto Aluno Digital: O uso de tecnologia da informa&ccedil;&atilde;o e comunica&ccedil;&atilde;o em ambiente escolar (apresentado pelos alunos Andr&eacute; Felipe e Leonardo Fonseca Moreira)</li>\n</ul>\n<p>O Semin&aacute;rio contou com a participa&ccedil;&atilde;o dos professores Ramon Gustavo Teodoro Marques da Silva, Sandra Helena Miranda, Aline Marques Del Valle, Paulo Cesar dos Santos e Ieda M. Sabino Kawashita. Tamb&eacute;m participaram os alunos estagi&aacute;rios e bolsistas de inicia&ccedil;&atilde;o cient&iacute;fica Matheus Carvalho Barbosa, &Iacute;caro Messias, Raphael de Paiva Gon&ccedil;alves, Erlon Chales G. de Aquino Junior, Andr&eacute; Felipe, Leonardo Fonseca Moreira, Jonathan Felipe e Nat&aacute;lia Gaspar. A iniciativa possibilitou o debate e sugest&atilde;o de novas ideias, assim como o alinhamento de algumas propostas.</p>', NULL, 'assets/images/site/noticias/vii-seminrio-do-labsoft/Seminario_-_Labsoft_5.jpg', '2017-03-10', NULL, '2016-04-09', 'vii_seminrio_do_labsoft', NULL),
(62, 'Hora do Código 2016', 'Campus Muzambinho participa de evento global sobre introdução à Ciência da Computação e fundamentos de programação.', '<p>Aconteceu na &uacute;ltima quinta-feira, 17 de mar&ccedil;o, a Hora do C&oacute;digo - uma iniciativa global que busca promover a linguagem de programa&ccedil;&atilde;o de forma acess&iacute;vel para qualquer usu&aacute;rio. Nesta edi&ccedil;&atilde;o, o evento atingiu dezenas de milh&otilde;es de estudantes em mais de 180 pa&iacute;ses entre os cerca de 200 mil eventos espalhados pelo mundo (930 deles realizados no Brasil).</p>\n<p>O evento &eacute; organizado pela Code.org, uma institui&ccedil;&atilde;o p&uacute;blica sem fins lucrativos dedicada a promover e a tornar a ci&ecirc;ncia da computa&ccedil;&atilde;o dispon&iacute;vel ao maior n&uacute;mero de escolas poss&iacute;vel e garantindo que chegue tamb&eacute;m &agrave; minorias sociais, empoderando, por exemplo, mulheres e negros &agrave; participa&ccedil;&atilde;o nesta &aacute;rea.</p>\n<p>No Campus Muzambinho, a Hora do C&oacute;digo foi organizada pela Coordena&ccedil;&atilde;o dos cursos T&eacute;cnico em Inform&aacute;tica Subsequente, Integrado e superior em Ci&ecirc;ncia da Computa&ccedil;&atilde;o, juntamente com o Laborat&oacute;rio de Tecnologias de Software e Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o (LABSOFT). De acordo com prof. Ramon Gustavo Teodoro Marques da Silva, organizador do evento no Campus, a iniciativa foi preparada para participa&ccedil;&atilde;o de qualquer pessoa.</p>\n<p>&ldquo;As atividades trabalharam no&ccedil;&otilde;es matem&aacute;ticas e, principalmente, de racioc&iacute;nio l&oacute;gico dos estudantes. Al&eacute;m disso, tamb&eacute;m aproveitamos o momento para levantar discuss&otilde;es sobre a tecnologia e a informatiza&ccedil;&atilde;o no mundo atual e no mercado de trabalho\", explicou Ramon.</p>\n<p>A iniciativa foi realizada durante todo o dia em uma das salas do Pr&eacute;dio da Inform&aacute;tica. Ao final do evento, no audit&oacute;rio, foi feita uma apresenta&ccedil;&atilde;o dos grupos de pesquisa e laborat&oacute;rios dos cursos de T&eacute;cnico em Inform&aacute;tica e Ci&ecirc;ncia da Computa&ccedil;&atilde;o. Foram apresentados os laborat&oacute;rios:</p>\n<ul>\n<li>LabSoft - Laborat&oacute;rio de Tecnologias de Software e Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o (Coordenador: Ramon Gustavo Teodoro Marques da Silva)</li>\n<li>Laborat&oacute;rio de Eletr&ocirc;nica, Rob&oacute;tica e Sistemas Digitais (Coordenador: Heber Rocha Moreira)</li>\n<li>Laborat&oacute;rio de Redes de computadores (Coordenador: Augusto Marcio da Silva Jr)</li>\n<li>LAPIVIC - Laborat&oacute;rio de processamento de Imagens e Vis&atilde;o Computacional. (Jo&atilde;o Marcelo Ribeiro)</li>\n<li>Clube de Programa&ccedil;&atilde;o (Coordenador: Ricardo Jos&eacute; Martins)</li>\n</ul>\n<p>Al&eacute;m disso, foram apresentadas tamb&eacute;m as linhas de pesquisa que s&atilde;o desenvolvidas nesses locais, assim como as oportunidades e editais para as atividades de est&aacute;gio, pesquisa e extens&atilde;o que s&atilde;o conduzidas. <br /><br /><strong>Alunos colaboradores:</strong> Ricardo Negreiros (Ci&ecirc;ncia da Computa&ccedil;&atilde;o) / Natanael Batista (T&eacute;cnico em Inform&aacute;tica) / Andr&ecirc;s Oliveira (T&eacute;cnico em Inform&aacute;tica) / Matheus Carvalho (Labsoft - Ci&ecirc;ncia da Computa&ccedil;&atilde;o) / Icaro Messias (Ci&ecirc;ncia da Computa&ccedil;&atilde;o).</p>\n<p><strong>Organizadores:</strong> Ramon Gustavo Teodoro Marques da Silva / Heber Rocha Moreira / Tiago Gon&ccedil;alves Botelho / LabSoft.</p>\n<p>Mais informa&ccedil;&otilde;es podem ser obtidas nos sites <a href=\"https://hourofcode.com/br\">https://hourofcode.com/br</a> e <a href=\"https://br.code.org/\">https://br.code.org/.</a></p>', NULL, 'assets/images/site/noticias/hora-do-cdigo-2016/A_hora_do_Código_17.jpg', '2017-03-10', NULL, '2016-03-17', 'hora_do_cdigo_2016', NULL);
INSERT INTO `cc_noticia` (`not_id`, `not_titulo`, `not_subtitulo`, `not_conteudo`, `not_conteudo_sem_formatacao`, `not_foto`, `not_criado`, `not_revisado`, `not_exibicao`, `not_slug`, `not_palavra_chave`) VALUES
(63, 'Cerimônia de Lançamento do Aluno Digital', 'Programa Aluno Digital: iniciativa vai atender mais de 2500 pessoas dentre estudantes e professores de Muzambinho.', '<p>Aconteceu na &uacute;ltima ter&ccedil;a-feira, 01 de mar&ccedil;o, a cerim&ocirc;nia de lan&ccedil;amento do Programa Aluno Digital, um projeto que vai oferecer suporte tecnol&oacute;gico, levando a inform&aacute;tica &agrave;s escolas do munic&iacute;pio de Muzambinho com a oferta de minicursos que abordem tem&aacute;ticas relacionadas &agrave;s tecnologias de informa&ccedil;&atilde;o e comunica&ccedil;&atilde;o para alunos e professores por meio do laborat&oacute;rio itinerante.</p>\n<p>Com o nome \"Programa Aluno Digital: O uso de tecnologia da informa&ccedil;&atilde;o e comunica&ccedil;&atilde;o em ambiente escolar\", o projeto vai contar com a atua&ccedil;&atilde;o de 13 participantes vinculados ao Campus Muzambinho (duas coordenadoras, cinco colaboradores e seis estagi&aacute;rios). Essa equipe vai dar suporte tecnol&oacute;gico &agrave;s escolas de rede p&uacute;blica e privada de Muzambinho que trabalham com Pr&eacute;-Escola, Fundamental I, Fundamental II e Ensino M&eacute;dio. Ao todo, o Programa vai atender mais de 2500 pessoas - dentre os n&uacute;meros da rede p&uacute;blica, ser&atilde;o atendidos mais de 200 professores e mais de 2000 alunos.</p>\n<p>A solenidade contou com a presen&ccedil;a do Diretor Geral do IFSULDEMINAS - Campus Muzambinho, prof. Luiz Carlos Machado Rodrigues, do Prefeito Municipal de Muzambinho, prof. Ivan Ant&ocirc;nio de Freitas, do Secret&aacute;rio de Educa&ccedil;&atilde;o, prof. Leandro Silva Bueno, da Diretora de Esporte Participativo, Lia Mara Zaghi, da Subsecret&aacute;ria de Educa&ccedil;&atilde;o, Sueli Moreira, do Coordenador do NTI, Geraldo Russo Filho, e das Coordenadoras do Programa Aluno Digital, prof.&ordf; Sandra Helena Miranda e prof.&ordf; Aline Marques Del Valle.</p>\n<p>Ao final da cerim&ocirc;nia, os representantes da Prefeitura Municipal aproveitaram a ocasi&atilde;o para homenagear o trabalho desenvolvido pela Coordenadora do Programa e professora do Campus Muzambinho, Sandra. Na ocasi&atilde;o, reconheceram o empenho e a dedica&ccedil;&atilde;o da docente em sempre contribuir para o desenvolvimento da educa&ccedil;&atilde;o do munic&iacute;pio e do Campus.</p>\n<h3>Sobre o Programa Aluno Digital</h3>\n<p>O Programa Aluno Digital nasceu de uma demanda identificada numa pesquisa realizada em escolas de Muzambinho. Os pesquisadores descobriram que 69% das institui&ccedil;&otilde;es analisadas possuem laborat&oacute;rios de inform&aacute;tica, mas apenas um ter&ccedil;o dos professores utilizam esse espa&ccedil;o para fins did&aacute;ticos. Al&eacute;m disso, mais da metade dos docentes que participaram da pesquisa, 53%, disseram que n&atilde;o se sentem aptos a fazer uso dos laborat&oacute;rios devido &agrave; falta de est&iacute;mulo por parte da escola e tamb&eacute;m pela car&ecirc;ncia de uma capacita&ccedil;&atilde;o t&eacute;cnica sobre o assunto. Faltam tamb&eacute;m profissionais de assist&ecirc;ncia que atuem nas institui&ccedil;&otilde;es de ensino - 75% delas n&atilde;o possui profissional para suporte t&eacute;cnico.</p>\n<p>\"A partir dessas car&ecirc;ncias, o Programa Aluno Digital surge para dar o suporte tecnol&oacute;gico e levar a inform&aacute;tica &agrave;s escolas de Muzambinho. Nosso objetivo &eacute; ampliar o uso da tecnologia em favor das possibilidades did&aacute;ticas. Com isso, o projeto vai atender alunos e professores da cidade por meio de minicursos com tem&aacute;ticas relacionadas a tecnologias de informa&ccedil;&atilde;o e comunica&ccedil;&atilde;o com um laborat&oacute;rio itinerante\", explicou a coordenadora do projeto, prof.&ordf; Sandra.</p>\n<p>A iniciativa prev&ecirc; a&ccedil;&otilde;es a serem desenvolvidas at&eacute; dezembro deste ano. Al&eacute;m das duas coordenadoras, Aline e Sandra, o projeto conta com o trabalho de mais cinco colaboradores:</p>\n<div>\n<ul>\n<li>Ramon Gustavo Teodoro Marques Silva - Professor do IFSULDEMINAS - Campus Muzambinho</li>\n<li>Tiago Gon&ccedil;alves Botelho - Professor do IFSULDEMINAS - Campus Muzambinho</li>\n<li>Geraldo Russo Filho - Coordenador do NTI do IFSULDEMINAS - Campus Muzambinho</li>\n<li>Erlon Charles Gomes de Aquino J&uacute;nior - Graduando em Ci&ecirc;ncia da Computa&ccedil;&atilde;o</li>\n<li>Leonardo Fonseca Moreira - Graduando em Ci&ecirc;ncia da Computa&ccedil;&atilde;o</li>\n</ul>\n</div>\n<p>Esse trabalho tamb&eacute;m vai contar com o apoio do LabSoft - Laborat&oacute;rio de Software e Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o, local onde estudantes e professores do Campus Muzambinho desenvolvem pesquisas, debates e outras iniciativas sobre pesquisas na &aacute;rea de Engenharia de Software e Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o.</p>\n<p>No cronograma de atua&ccedil;&atilde;o do Programa, est&atilde;o previstos pelo menos dez minicursos e tamb&eacute;m um suporte de manuten&ccedil;&atilde;o &agrave;s m&aacute;quinas que os laborat&oacute;rios das escolas possuem. Ao final de cada minicurso, ser&aacute; realizada uma avalia&ccedil;&atilde;o sobre as a&ccedil;&otilde;es desenvolvidas para identifica&ccedil;&atilde;o de poss&iacute;veis falhas e tamb&eacute;m quais pontos poder&atilde;o ser mais aprofundados.</p>\n<p>O primeiro atendimento come&ccedil;ou na &uacute;ltima segunda-feira, 29 de fevereiro, na Escola Estadual Ces&aacute;rio Coimbra com a participa&ccedil;&atilde;o dos estagi&aacute;rios do projeto e da Coordenadora Sandra. Nesse primeiro contato, a iniciativa contou com o envolvimento de 30 professores.</p>\n<p><em>Texto: Lucas Constantino<br /></em><em>Fotos: Thom&aacute;s Soares</em></p>', NULL, 'assets/images/site/noticias/cerimnia-de-lanamento-do-aluno-digital/Lançamento_Programa_Aluno_Digital_1.jpg', '2017-03-10', NULL, '2016-03-01', 'cerimnia_de_lanamento_do_aluno_digital', NULL),
(64, 'Apresentação de Trabalho no lV Congresso Brasileiro de Informática na Educação (CBIE) ', 'Docente do curso de Ciência da Computação apresenta artigo em Congresso realizado em Maceió – AL.', '<p>Entre os dias 26 a 30 de outubro, o professor Ramon Gustavo Teodoro Marques da Silva, realizou a apresenta&ccedil;&atilde;o oral de um artigo no lV Congresso Brasileiro de Inform&aacute;tica na Educa&ccedil;&atilde;o (CBIE) e X Confer&ecirc;ncia Latino-Americana de Objetos e Tecnologias de Aprendizagem (LACLO), realizado em Macei&oacute; - Alagoas.</p>\n<p>O CBIE &eacute; um evento de n&iacute;vel internacional que est&aacute; em sua 4&ordm; edi&ccedil;&atilde;o. &Eacute; voltado, essencialmente, a discutir a pesquisa e os desafios sobre a educa&ccedil;&atilde;o, tendo como premissa a reflex&atilde;o do uso das tecnologias digitais da informa&ccedil;&atilde;o e comunica&ccedil;&atilde;o no ensino, com vistas &agrave; melhoria da qualidade educacional.</p>\n<p>O LACLO tamb&eacute;m &eacute; um evento de n&iacute;vel internacional que est&aacute; em sua 10&deg; Edi&ccedil;&atilde;o, congregando toda a comunidade Latino-Americana interessada em Tecnologias na Educa&ccedil;&atilde;o. Possui foco na pesquisa, desenvolvimento e inova&ccedil;&atilde;o em tecnologias educacionais, como MOOCs (Massive Open Online Courses), Recursos Educacionais Abertos, sala invertida, entre outras.</p>\n<p>O artigo apresentado pelo docente aborda um trabalho realizado no LabSoft (Laborat&oacute;rio de Tecnologias de Software e Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o) pelo aluno de Ci&ecirc;ncia da Computa&ccedil;&atilde;o, Everson Felix Leite, e coordenado pelo Professor Ramon Gustavo Teodoro Marques da Silva, com a colabora&ccedil;&atilde;o da Prof&ordf;. Aracele Garcia de Oliveira Fassbinder.</p>\n<p>Os resultados do artigo est&atilde;o relacionadas com a linha de pesquisa de Web Sem&acirc;ntica do LabSoft, e mostram um estudo sobre a rela&ccedil;&atilde;o da web sem&acirc;ntica com os motores de busca. Considerando, principalmente, a influ&ecirc;ncia que o uso de t&eacute;cnicas de SEO, em conjunto com marca&ccedil;&atilde;o estruturada de conte&uacute;do, exerce sobre estes mecanismos.</p>\n<p>Assim, foram conduzidas atividades em um estudo de caso com o website do curso de Ci&ecirc;ncia da Computa&ccedil;&atilde;o do IFSULDEMINAS &ndash; Campus Muzambinho. E foram observados nos resultados de consultas, a ocorr&ecirc;ncia de informa&ccedil;&otilde;es sem&acirc;nticas ricas e uma melhora no posicionamento do site.</p>', NULL, 'assets/images/site/noticias/apresentao-de-trabalho-no-lv-congresso-brasileiro-de-informtica-na-educao-cbie/informática_na_edu', '2017-03-10', NULL, '2015-10-26', 'apresentao_de_trabalho_no_lv_congresso_brasileiro_de_informtica_na_educao_cbie', NULL),
(65, 'Apresentação de Trabalho no 45th Annual Frontiers in Education (FIE) Conference', 'Docente do Campus Muzambinho apresenta artigos no 45th Annual Frontiers in Education Conference', '<p>Entre os dias 21 e 24 de outubro, a professora Aracele Garcia de Oliveira Fassbinder realizou a apresenta&ccedil;&atilde;o oral de dois artigos completos aceitos no 45th Annual Frontiers in Education (FIE) Conference.</p>\n<p>O evento &eacute; uma confer&ecirc;ncia internacional com foco em inova&ccedil;&otilde;es educacionais e de pesquisa em engenharia e computa&ccedil;&atilde;o e est&aacute; classificada como B1 no Qualis das Confer&ecirc;ncias em Computa&ccedil;&atilde;o, que possui os estratos A1, A2, B1, B2, B3, B4 e B5, nesta ordem de qualidade. A confer&ecirc;ncia tem o apoio do Institute of Electric and Electronic Engineers (IEEE) Education Society, IEEE Computer Society e da American Society for Engineering Education (ASEE) Educational Research and Methods Division.</p>\n<p>Os resultados dos trabalhos apresentados est&atilde;o relacionados &agrave; pesquisa em Engenharia de Software Aplicada &agrave; Educa&ccedil;&atilde;o que a professora vem desenvolvendo no seu doutorado, no Instituto de Ci&ecirc;ncias Matem&aacute;ticas e de Computa&ccedil;&atilde;o (ICMC), na Universidade de S&atilde;o Paulo (USP). Eles tamb&eacute;m est&atilde;o alinhados com as atividades do Laborat&oacute;rio de Tecnologias de Software e Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o (LabSoft) do IFSULDEMINAS &ndash; Campus Muzambinho, do qual a professora faz parte.</p>\n<p>A docente &eacute; vinculada aos cursos T&eacute;cnicos em Inform&aacute;tica e Ci&ecirc;ncia da Computa&ccedil;&atilde;o do IFSULDEMINAS &ndash; Campus Muzambinho e atualmente est&aacute; afastada para qualifica&ccedil;&atilde;o e realiza&ccedil;&atilde;o de doutorado sandu&iacute;che no Birkbeck College, University of London, esteve em El Paso, no estado do Texas, Estados Unidos.</p>\n<p>Segundo a professora Aracele Fassbinder, a atua&ccedil;&atilde;o docente, em sua totalidade, deve envolver atividades de ensino, pesquisa, extens&atilde;o e inova&ccedil;&atilde;o. A pesquisa, especificamente, exige planejamento, dedica&ccedil;&atilde;o e gerenciamento, para que as barreiras do conhecimento em uma determinada &aacute;rea sejam alcan&ccedil;adas.</p>\n<p>Entre a defini&ccedil;&atilde;o de uma quest&atilde;o de pesquisa, a condu&ccedil;&atilde;o da pesquisa, a obten&ccedil;&atilde;o e publica&ccedil;&atilde;o dos resultados gasta-se, em m&eacute;dia, quase um ano de trabalho. Habilidades de leitura, escrita e apresenta&ccedil;&atilde;o na l&iacute;ngua inglesa tamb&eacute;m s&atilde;o de suma import&acirc;ncia, a fim de compartilhar com a comunidade cient&iacute;fica da &aacute;rea tudo o que foi alcan&ccedil;ado.</p>\n<p>Ao final desse processo, espera-se que o p&uacute;blico alvo da pesquisa seja beneficiado, de alguma forma. Toda a aprendizagem envolvida tamb&eacute;m retorna para a sala de aula, seja por meio da qualifica&ccedil;&atilde;o do professor ou pelo incremento do conhecimento e avan&ccedil;o na pr&oacute;pria &aacute;rea de atua&ccedil;&atilde;o.</p>\n<p>Os trabalhos apresentados no FIE foram:</p>\n<ul>\n<li>From Flipped Classroom Theory to the personalized design of learning experiences in Massive Open Online Courses (MOOCs). Autoria de Aracele Fassbinder, Marcelo Fassbinder e Ellen Francine Barbosa. Apresentado na categoria MOOCs and Big Data.</li>\n<li>Applying Flipped Classroom and Problem-Based Learning in a CS1 Course. Autoria de Aracele Fassbinder, Tiago Gon&ccedil;alves Botelho, Ricardo Martins e Ellen Francine Barbosa. Apresentado na categoria Interdisciplinary Education in Programming.</li>\n</ul>\n<p>Mais informa&ccedil;&otilde;es em:&nbsp;<a href=\"http://fie2015.org/\">http://fie2015.org/</a><br />Sobre o LabSoft:<a href=\"../../\">http://labsoft.muz.ifsuldeminas.edu.br/</a><br />Sobre o Curso de Ci&ecirc;ncia da Computa&ccedil;&atilde;o do C&acirc;mpus Muzambinho:<a href=\"http://comp.muz.ifsuldeminas.edu.br/\">http://comp.muz.ifsuldeminas.edu.br/</a></p>', NULL, 'assets/images/site/noticias/apresentao-de-trabalho-no-45th-annual-frontiers-in-education-fie-conference/Evento_Internacional_', '2017-03-10', NULL, '2015-10-21', 'apresentao_de_trabalho_no_45th_annual_frontiers_in_education_fie_conference', NULL),
(66, 'LabSoft participa de celebração do bicentenário de Ada Lovelace', 'Campus Muzambinho promove sessão de exibições digitais para celebrar o bicentenário de Ada Lovelace', '<p>Ser&atilde;o realizadas nos dias 15 e 16 de outubro uma s&eacute;rie de exibi&ccedil;&otilde;es digitais em celebra&ccedil;&atilde;o ao bicenten&aacute;rio do nascimento de Ada Lovelace.</p>\n<p>O IFSULDEMINAS - Campus Muzambinho, por meio do Laborat&oacute;rio de Tecnologias de Software e Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o (LabSoft), do Centro Acad&ecirc;mico Alan Turing e do curso de Ci&ecirc;ncia da Computa&ccedil;&atilde;o, participar&aacute; do movimento por meio de exibi&ccedil;&otilde;es que acontecer&atilde;o na sala do Centro Acad&ecirc;mico.</p>\n<p>O movimento Ada Lovelace visa homenagear a matem&aacute;tica e escritora Inglesa por suas contribui&ccedil;&otilde;es feitas nas &aacute;reas de Ci&ecirc;ncia, Tecnologia, Engenharia e Matem&aacute;tica.<br />O evento &eacute; organizado pela Professora Aracele Fassbinder e pelos alunos Raphael de Paiva Gon&ccedil;alves (6&ordm; Per&iacute;odo de Ci&ecirc;ncia da Computa&ccedil;&atilde;o) e Ricardo Negreiros (4&ordm; Per&iacute;odo de Ci&ecirc;ncia da Computa&ccedil;&atilde;o).</p>\n<p>Segundo Aracele, &ldquo;este ano, a data &eacute; ainda mais especial, pois comemora-se o bicenten&aacute;rio do nascimento de Ada&rdquo;.</p>\n<p>Ainda segundo a Professora, &ldquo;diversas atividades est&atilde;o sendo realizadas por institui&ccedil;&otilde;es de ensino e sociedades civis de todo mundo, com o objetivo de celebrar as conquistas de Ada e, de forma geral, as realiza&ccedil;&otilde;es de mulheres na ci&ecirc;ncia, tecnologia, engenharia e matem&aacute;tica, al&eacute;m de inspirar outras a seguirem carreira nessas &aacute;reas.</p>\n<p><strong>AGENDA DAS EXIBI&Ccedil;&Otilde;ES:</strong></p>\n<p><strong>DATA:</strong> 15 e 16 de Outubro de 2015 (quinta e sexta-feira)<br /><strong>HOR&Aacute;RIO:</strong> durante os intervalos das aulas (9h15 &agrave;s 9h30, 15h15 &agrave;s 15h30, 21h15 &agrave;s 21h30)<br /><strong>LOCAL:</strong> Sala do Centro Acad&ecirc;mico Alan Turing, 2&ordm; Andar, Pr&eacute;dio de Tecnologia da Informa&ccedil;&atilde;o.</p>\n<p>Link do evento no portal principal do Ada Lovelace Day: <br /><a href=\"http://findingada.com/event/ada-lovelace-day-ifsuldeminas-campus-muzambinho/\">http://findingada.com/event/ada-lovelace-day-ifsuldeminas-campus-muzambinho/</a></p>\n<h2>Conhe&ccedil;a um pouco mais sobre Ada Lovelace:</h2>\n<p>Ada nasceu em 1815, mas faleceu com apenas 36 anos de idade, v&iacute;tima de c&acirc;ncer. Foi a &uacute;nica filha leg&iacute;tima do poeta Lord Byron e sua esposa Anne Isabella. Foi a m&atilde;e de Ada quem promoveu o interesse da filha por matem&aacute;tica e l&oacute;gica em um momento no qual as mulheres n&atilde;o possu&iacute;am voz, mesmo dentro de suas casas.</p>\n<p>Hoje Ada &eacute; reconhecida, principalmente, por ter escrito o primeiro algoritmo para ser processado por uma m&aacute;quina. A m&aacute;quina anal&iacute;tica de Charles Babbage que serviu de inspira&ccedil;&atilde;o para chegarmos no atual modelo do computador que conhecemos.</p>\n<p>Durante o per&iacute;odo em que esteve envolvida com o projeto de Babbage, ela desenvolveu os algoritmos que permitiram &agrave; m&aacute;quina de Babbage computar os valores de fun&ccedil;&otilde;es matem&aacute;ticas, al&eacute;m de publicar uma cole&ccedil;&atilde;o de notas sobre a m&aacute;quina anal&iacute;tica. Por esse trabalho &eacute; considerada a primeira programadora de toda a hist&oacute;ria.</p>\n<p>TEXTO: IFSULDEMINAS - Campus Muzambinho com informa&ccedil;&otilde;es de Aracele Fassbinder, Raphael de Paiva Gon&ccedil;alves e Ricardo Negreiros.</p>', NULL, 'assets/images/site/noticias/labsoft-participa-de-celebrao-do-bicentenrio-de-ada-lovelace/ada-lovelace-0324.jpg', '2017-03-10', NULL, '2015-10-15', 'labsoft_participa_de_celebrao_do_bicentenrio_de_ada_lovelace', NULL),
(67, 'Curso de Lousa Digital', 'Projeto do Campus Muzambinho promove minicurso de Lousa Digital no Campus Inconfidentes', '<p>Foi realizado, no dia 29 de setembro, o minicurso &ldquo;Computador Interativo e Lousa Digital&rdquo;, ministrado pelos alunos do curso de Ci&ecirc;ncia da Computa&ccedil;&atilde;o do C&acirc;mpus Muzambinho &agrave; alunos e professores do IFSULDEMINAS &ndash; Campus Incofidentes.</p>\n<p>O minicurso foi ofertado pelos alunos Matheus Reis de Souza (6&ordm; per&iacute;odo) e Matheus Carvalho Barbosa (4&ordm; per&iacute;odo), estagi&aacute;rios do Laborat&oacute;rio de Tecnol&oacute;gicas de Software e Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o, do IFSULDEMINAS &ndash; C&acirc;mpus Muzambinho. E teve como p&uacute;blico alunos dos cursos de Licenciaturas em Matem&aacute;tica e Ci&ecirc;ncias Biol&oacute;gicas e professores EBTT participantes da 1&ordf; Semana de Licenciaturas do C&acirc;mpus Inconfidentes.</p>\n<p>De acordo com o organizador do evento, Prof. Rafael Cesar Bolleli Faria, o minicurso foi bastante v&aacute;lido, tanto para os alunos quanto para os professores.</p>\n<p>O minicurso &eacute; uma das a&ccedil;&otilde;es do projeto de extens&atilde;o &ldquo;As Tecnologias de Informa&ccedil;&atilde;o e Comunica&ccedil;&atilde;o como recursos no Processo de Ensino-Aprendizagem&rdquo;, do LabSoft, coordenado pelo Prof. Ramon Gustavo Teodoro Marques da Silva.</p>\n<p>O projeto conta ainda com a colabora&ccedil;&atilde;o dos professores Paulo C&eacute;sar dos Santos, Aracele Garcia de O. Fassbinder, Adolfo Lu&iacute;s de Carvalho, al&eacute;m dos estudantes Matheus Reis de Souza, Matheus Carvalho Barbosa e &Iacute;caro Brito de Carvalho Messias.</p>\n<p>Novas edi&ccedil;&otilde;es do minicurso ser&atilde;o oferecidas, assim como novos treinamentos com foco no uso did&aacute;tico de tecnologias de informa&ccedil;&atilde;o e comunica&ccedil;&atilde;o. Para o segundo semestre de 2015 h&aacute; a previs&atilde;o de oferta dos seguintes minicursos:</p>\n<ul>\n<li>Computador Interativo e Lousa Digital (4 horas)</li>\n<li>Ferramentas do Google para professores e profissionais de ensino (4 horas)</li>\n</ul>\n<p>Aos professores interessados em participar, favor enviar um email para <a href=\"mailto:labsoft@muz.ifsuldeminas.edu.br\">labsoft@muz.ifsuldeminas.edu.br</a> ou <a href=\"mailto:ramon.silva@muz.ifsuldeminas.edu.br\">ramon.silva@muz.ifsuldeminas.edu.br</a>.</p>\n<p><strong>Maiores informa&ccedil;&otilde;es:</strong><br />Site do Lab: <a href=\"../../\">http://labsoft.muz.ifsuldeminas.edu.br</a><br />P&aacute;gina no Face: <a href=\"https://www.facebook.com/labsoft.ifsuldeminas\">https://www.facebook.com/labsoft.ifsuldeminas</a><br />E-mail: <a href=\"mailto:labsoft@muz.ifsuldeminas.edu.br\">labsoft@muz.ifsuldeminas.edu.br</a><br />Localiza&ccedil;&atilde;o: Sala de Pesquisa 24, Terceiro Andar, Pr&eacute;dio de Inform&aacute;tica.</p>', NULL, 'assets/images/site/noticias/curso-de-lousa-digital/12092203_935313259885893_1960252415_n.jpg', '2017-03-10', NULL, '2015-09-29', 'curso_de_lousa_digital', NULL),
(68, '1º Workshop de Educação Aberta do IFSULDEMINAS', 'IFSULDEMINAS promove a primeira edição do Workshop de Educação Aberta', '<p>Criar oportunidades de discuss&atilde;o e conscientizar a comunidade sobre o movimento da educa&ccedil;&atilde;o aberta e o seu impacto no ensino e aprendizagem &eacute; o objetivo da primeira edi&ccedil;&atilde;o do Workshop de Educa&ccedil;&atilde;o Aberta. O evento acontecer&aacute; no dia 23 de maio, no audit&oacute;rio do Campus Muzambinho. Idealizado pela Pr&oacute;-Reitoria de Ensino, por meio da Diretoria de Educa&ccedil;&atilde;o a Dist&acirc;ncia e do Laborat&oacute;rio de Tecnologias de Software e Computa&ccedil;&atilde;o Aplicada &agrave; Educa&ccedil;&atilde;o (LabSoft) do Campus Muzambinho, &eacute; voltado para professores e demais profissionais que atuam na educa&ccedil;&atilde;o presencial e virtual do Instituto e de outras institui&ccedil;&otilde;es.</p>\n<p>Entre os assuntos abordados, est&atilde;o os aspectos te&oacute;ricos e pr&aacute;ticos e as experi&ecirc;ncias envolvendo os Cursos Abertos Online e Massivos (do ingl&ecirc;s Massive Open Online Courses ou MOOCs) e os Recursos Educacionais Abertos (REAs). Na ocasi&atilde;o, o diretor de Educa&ccedil;&atilde;o a Dist&acirc;ncia do IFSULDEMINAS, professor Giovane Jos&eacute; da Silva, far&aacute; tamb&eacute;m o lan&ccedil;amento de uma chamada (Edital) para professores do IFSULDEMINAS que se interessarem pela oferta dos cursos MOOCs.</p>\n<p>De acordo com Giovane, &ldquo;a diretoria de EaD, por meio de parcerias, busca fomentar as pr&aacute;ticas de educa&ccedil;&atilde;o aberta e de produ&ccedil;&atilde;o de objetos educacionais abertos no &acirc;mbito do IFSULDEMINAS. Trata-se de uma nova \"onda\" no campo da educa&ccedil;&atilde;o. Neste movimento, em &acirc;mbito internacional, j&aacute; participam institui&ccedil;&otilde;es como a Universidade Estadual de S&atilde;o Paulo e a Universidade Estadual de Campinas (Unicamp). Nosso prop&oacute;sito &eacute; inserir o IFSULDEMINAS entre os grandes produtores de cursos livres Massive Open Online Courses (MOOCs) e Recursos Educacionais Abertos (REAs).&rdquo; Ele esclarece que o IFSULDEMINAS j&aacute; conta com quatro cursos MOOCs produzidos e mais de 4.000 usu&aacute;rios cadastrados nos cursos.</p>\n<h3>&nbsp;Inscri&ccedil;&otilde;es</h3>\n<p>Os interessados poder&atilde;o se inscrever at&eacute; o dia 19 de maio pelo endere&ccedil;o eletr&ocirc;nico: <a href=\"../../projetos/wea/\">http://labsoft.muz.ifsuldeminas.edu.br/projetos/wea/</a>.&nbsp;O n&uacute;mero de vagas &eacute; limitado.</p>', NULL, 'assets/images/site/noticias/1-workshop-de-educao-aberta-do-ifsuldeminas/banner_495x170_workshop_deeducacao_aberta.png', '2017-04-28', NULL, '2017-04-28', '1_workshop_de_educao_aberta_do_ifsuldeminas', NULL),
(74, 'sdasfsdfsdfsdfsdfsdf', 'sdfsdfsdf', 'sdfsdf', 'sdfsdf', '201eb0d6b3981c81fceef8a257fe30b0.jpg', '2017-06-22', '0000-00-00', '2017-06-22', 'sdasfsdfsdfsdfsdfsdf', 'sdfsdf'),
(75, 'teste', 'teste', 'sdfsafadd', 'sdafadsf', '7622592c557598a1915ddf12f1488f42.jpg', '2017-06-22', '0000-00-00', '2017-06-23', 'teste', 'sdfasdf'),
(76, 'teste', 'asd', 'asd', 'asd', 'a69750227d721130228123077c3e5f13.jpg', '2017-01-02', '2017-02-02', '2017-03-02', 'teste-1', 'asd'),
(77, 'asdasdasd', 'asdasd', 'asddasd', 'asdasd', '57d6c7f44ebac89687a7774d1a77941f.png', '2017-02-01', '2017-03-01', '2017-04-01', 'asdasdasd', 'asdasd');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_noticia_nucleo`
--

CREATE TABLE `cc_noticia_nucleo` (
  `noo_noticia_id` int(11) NOT NULL,
  `noo_nucleo_id` int(11) NOT NULL,
  `noo_destaque` int(11) DEFAULT NULL COMMENT '0 - não\n1 - sim',
  `noo_visita` int(11) DEFAULT NULL COMMENT 'numero de visitas',
  `noo_aprovacao` int(11) NOT NULL COMMENT '0 - aguardando aprovacao1 - publicado',
  `noo_original` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cc_noticia_nucleo`
--

INSERT INTO `cc_noticia_nucleo` (`noo_noticia_id`, `noo_nucleo_id`, `noo_destaque`, `noo_visita`, `noo_aprovacao`, `noo_original`) VALUES
(1, 1, 1, 10, 1, 1),
(1, 2, 0, 0, 1, 0),
(2, 1, 1, 12, 1, 1),
(2, 2, 0, 0, 0, 0),
(3, 1, 1, 12, 1, 1),
(3, 2, 0, 0, 1, 0),
(4, 1, 1, 12, 1, 1),
(4, 2, 1, 0, 1, 0),
(7, 1, 0, 0, 0, 1),
(74, 1, 0, 0, 0, 1),
(75, 1, 0, 0, 0, 1),
(76, 1, 0, 0, 0, 1),
(77, 1, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_nucleo`
--

CREATE TABLE `cc_nucleo` (
  `nuc_id` int(11) NOT NULL,
  `nuc_nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `nuc_pagina` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `nuc_link_espelho_grupo_cnpq` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `cc_nucleo`
--

INSERT INTO `cc_nucleo` (`nuc_id`, `nuc_nome`, `nuc_pagina`, `nuc_link_espelho_grupo_cnpq`) VALUES
(1, 'Computação', 'comp', NULL),
(2, 'LabSoft', 'labsoft', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_nucleo_linha_pesquisa`
--

CREATE TABLE `cc_nucleo_linha_pesquisa` (
  `nus_nucleo_id` int(11) NOT NULL,
  `nus_linha_pesquisa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_nucleo_usuario`
--

CREATE TABLE `cc_nucleo_usuario` (
  `nuo_nucleo_id` int(11) NOT NULL,
  `nuo_usuario_id` int(11) NOT NULL,
  `nuo_inicio` date NOT NULL,
  `nuo_fim` date DEFAULT NULL,
  `nuo_papel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `cc_nucleo_usuario`
--

INSERT INTO `cc_nucleo_usuario` (`nuo_nucleo_id`, `nuo_usuario_id`, `nuo_inicio`, `nuo_fim`, `nuo_papel_id`) VALUES
(1, 1, '2017-07-10', NULL, 1),
(1, 2, '2017-07-10', NULL, 1),
(1, 3, '2017-08-11', NULL, 1),
(1, 6, '2017-08-10', NULL, 1),
(2, 1, '2017-07-10', NULL, 1),
(2, 2, '2017-07-10', NULL, 1),
(2, 3, '2017-07-10', NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_nucleo_usuario_permissao`
--

CREATE TABLE `cc_nucleo_usuario_permissao` (
  `nua_nucleo` int(11) NOT NULL,
  `nua_usuario` int(11) NOT NULL,
  `nua_permissao` int(11) NOT NULL,
  `nua_sistema` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `cc_nucleo_usuario_permissao`
--

INSERT INTO `cc_nucleo_usuario_permissao` (`nua_nucleo`, `nua_usuario`, `nua_permissao`, `nua_sistema`) VALUES
(1, 1, 1, 1),
(1, 1, 2, 1),
(1, 1, 3, 1),
(1, 1, 4, 1),
(1, 2, 1, 1),
(1, 3, 1, 1),
(1, 3, 1, 2),
(1, 3, 2, 1),
(1, 3, 2, 2),
(1, 3, 3, 1),
(1, 3, 3, 2),
(1, 3, 4, 1),
(1, 3, 4, 2),
(1, 3, 5, 1),
(1, 3, 5, 2),
(1, 3, 6, 1),
(1, 3, 6, 2),
(1, 3, 7, 1),
(1, 3, 7, 2),
(1, 3, 8, 1),
(1, 3, 8, 2),
(1, 3, 9, 1),
(1, 3, 9, 2),
(1, 3, 10, 1),
(1, 3, 10, 2),
(1, 3, 11, 1),
(1, 3, 11, 2),
(1, 3, 12, 1),
(1, 3, 12, 2),
(1, 3, 13, 1),
(1, 3, 13, 2),
(1, 3, 14, 1),
(1, 3, 14, 2),
(1, 3, 15, 1),
(1, 3, 15, 2),
(1, 3, 16, 1),
(1, 3, 16, 2),
(1, 3, 17, 1),
(1, 3, 17, 2),
(1, 3, 18, 1),
(1, 3, 18, 2),
(1, 3, 19, 1),
(1, 3, 19, 2),
(1, 4, 1, 1),
(1, 4, 5, 1),
(1, 4, 9, 1),
(1, 4, 13, 1),
(1, 6, 1, 1),
(1, 6, 2, 1),
(1, 6, 3, 1),
(1, 6, 4, 1),
(1, 6, 5, 1),
(1, 6, 6, 1),
(1, 6, 7, 1),
(1, 6, 8, 1),
(1, 6, 9, 1),
(1, 6, 10, 1),
(1, 6, 13, 1),
(1, 6, 14, 1),
(2, 1, 1, 1),
(2, 1, 2, 1),
(2, 1, 3, 1),
(2, 1, 4, 1),
(2, 3, 1, 1),
(2, 3, 1, 2),
(2, 3, 2, 2),
(2, 3, 3, 2),
(2, 3, 4, 2),
(2, 3, 5, 2),
(2, 3, 6, 2),
(2, 3, 7, 2),
(2, 3, 8, 2),
(2, 3, 9, 2),
(2, 3, 10, 2),
(2, 3, 11, 2),
(2, 3, 12, 2),
(2, 3, 13, 2),
(2, 3, 14, 2),
(2, 3, 15, 2),
(2, 3, 16, 2),
(2, 3, 17, 2),
(2, 3, 18, 2),
(2, 3, 19, 2),
(2, 4, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_oportunidade`
--

CREATE TABLE `cc_oportunidade` (
  `opo_id` int(11) NOT NULL,
  `opo_nome` varchar(255) NOT NULL,
  `opo_descricao` varchar(10000) NOT NULL,
  `opo_descricao_sem_formatacao` varchar(10000) NOT NULL,
  `opo_slug` varchar(80) NOT NULL,
  `opo_data` date NOT NULL,
  `opo_empresa_instituicao` int(11) NOT NULL,
  `opo_palavra_chave` varchar(155) NOT NULL COMMENT 'Palavras chave para seo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_pais`
--

CREATE TABLE `cc_pais` (
  `pai_id` int(11) NOT NULL,
  `pai_nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `cc_pais`
--

INSERT INTO `cc_pais` (`pai_id`, `pai_nome`) VALUES
(1, 'Brasil');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_papel`
--

CREATE TABLE `cc_papel` (
  `pap_id` int(11) NOT NULL,
  `pap_nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_papel_projeto`
--

CREATE TABLE `cc_papel_projeto` (
  `pao_id` int(11) NOT NULL,
  `pao_nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_permissao`
--

CREATE TABLE `cc_permissao` (
  `per_id` int(11) NOT NULL,
  `per_nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `per_descricao` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `cc_permissao`
--

INSERT INTO `cc_permissao` (`per_id`, `per_nome`, `per_descricao`) VALUES
(1, 'lis_sua_na', 'Listar suas (não aprovadas)'),
(2, 'lis_sua_a', 'Listar suas (aprovadas)'),
(3, 'lis_ger_na', 'Listar geral (não aprovadas)'),
(4, 'lis_ger_a', 'Listar geral (aprovadas)'),
(5, 'alt_sua_na', 'Alterar suas (não aprovadas)'),
(6, 'alt_sua_a', 'Alterar suas (aprovadas)'),
(7, 'alt_ger_na', 'Alterar geral (não aprovadas)'),
(8, 'alt_ger_a', 'Alterar geral (aprovadas)'),
(9, 'exc_sua_na', 'Excluir suas (não aprovadas)'),
(10, 'exc_sua_a', 'Excluir suas (aprovadas)'),
(11, 'exc_ger_na', 'Exluir geral (não aprovadas)'),
(12, 'exc_ger_a', 'Exluir geral (aprovadas)'),
(13, 'ins', 'Inserir'),
(14, 'apr', 'Aprovar'),
(15, 'dup_sua_na', 'Duplicar suas (não aprovadas)'),
(16, 'dup_sua_a', 'Duplicar suas (aprovadas)'),
(17, 'dup_ger_na', 'Duplicar geral (não aprovadas)'),
(18, 'dup_ger_a', 'Duplicar geral (aprovadas)'),
(19, 'des', 'Destacar');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_projeto`
--

CREATE TABLE `cc_projeto` (
  `pro_id` int(11) NOT NULL,
  `pro_nome` text NOT NULL,
  `pro_inicio` varchar(50) NOT NULL,
  `pro_fim` varchar(45) DEFAULT NULL,
  `pro_protocolo_nipe` varchar(45) DEFAULT NULL,
  `pro_status` tinyint(4) NOT NULL COMMENT '1 - em andamento\n2 - finalizado\n3 - interrompido',
  `pro_tipo_projeto_id` int(11) NOT NULL,
  `pro_data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pro_breve_descricao` longtext,
  `pro_url` varchar(45) DEFAULT NULL,
  `pro_fomento_id` int(11) NOT NULL,
  `pro_descricao_edital` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_publicacao`
--

CREATE TABLE `cc_publicacao` (
  `pub_id` int(11) NOT NULL,
  `pub_titulo` varchar(255) NOT NULL,
  `pub_tipo_publicacao_id` int(11) NOT NULL,
  `pub_local` varchar(100) NOT NULL,
  `pub_data` date NOT NULL,
  `pub_qualis` varchar(45) NOT NULL COMMENT 'Usar combo de acordo com o CNPq A1 A2 B1 ate B5 e C',
  `pub_pdf` varchar(100) DEFAULT NULL,
  `pub_projeto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_publicacao_usuario`
--

CREATE TABLE `cc_publicacao_usuario` (
  `puo_publicacao_id` int(11) NOT NULL,
  `puo_usuario_id` int(11) NOT NULL,
  `puo_ordem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_session`
--

CREATE TABLE `cc_session` (
  `ses_id` varchar(40) NOT NULL DEFAULT '0',
  `ses_ip_address` varchar(16) NOT NULL DEFAULT '0',
  `ses_user_agent` varchar(120) NOT NULL,
  `ses_last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ses_user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_sistema`
--

CREATE TABLE `cc_sistema` (
  `sis_id` int(11) NOT NULL,
  `sis_nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `cc_sistema`
--

INSERT INTO `cc_sistema` (`sis_id`, `sis_nome`) VALUES
(1, 'Notícias'),
(2, 'Eventos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_subarea_conhecimento`
--

CREATE TABLE `cc_subarea_conhecimento` (
  `sub_id` int(11) NOT NULL,
  `sub_nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ver tabela cnpq'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_subarea_conhecimento_nucleo`
--

CREATE TABLE `cc_subarea_conhecimento_nucleo` (
  `suo_subarea_conhecimento_id` int(11) NOT NULL,
  `suo_nucleo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_tipo_evento`
--

CREATE TABLE `cc_tipo_evento` (
  `tit_id` int(11) NOT NULL,
  `tit_nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `cc_tipo_evento`
--

INSERT INTO `cc_tipo_evento` (`tit_id`, `tit_nome`) VALUES
(2, 'teste'),
(4, 'novo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_tipo_projeto`
--

CREATE TABLE `cc_tipo_projeto` (
  `tio_id` int(11) NOT NULL,
  `tio_nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_tipo_publicacao`
--

CREATE TABLE `cc_tipo_publicacao` (
  `tip_id` int(11) NOT NULL,
  `tip_nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_usuario`
--

CREATE TABLE `cc_usuario` (
  `usu_id` int(11) NOT NULL,
  `usu_nome` varchar(85) COLLATE utf8_unicode_ci NOT NULL,
  `usu_login` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `usu_senha` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `usu_endereco` varchar(85) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usu_num` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usu_cidade` int(11) DEFAULT NULL,
  `usu_email` varchar(85) COLLATE utf8_unicode_ci NOT NULL,
  `usu_cel` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usu_tel` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usu_foto` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usu_sobre` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usu_lattes` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usu_matricula` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usu_ano_ingresso` date DEFAULT NULL,
  `usu_ano_saida` date DEFAULT NULL,
  `usu_adm` int(11) NOT NULL,
  `usu_aprovacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `cc_usuario`
--

INSERT INTO `cc_usuario` (`usu_id`, `usu_nome`, `usu_login`, `usu_senha`, `usu_endereco`, `usu_num`, `usu_cidade`, `usu_email`, `usu_cel`, `usu_tel`, `usu_foto`, `usu_sobre`, `usu_lattes`, `usu_matricula`, `usu_ano_ingresso`, `usu_ano_saida`, `usu_adm`, `usu_aprovacao`) VALUES
(1, 'Paulo', 'paulo', 'teste', NULL, NULL, 1, 'paulo@email.com', NULL, NULL, NULL, NULL, NULL, NULL, '2017-01-01', NULL, 1, 1),
(2, 'Aracele', 'aracele', 'teste', NULL, NULL, 1, 'aracele.garcia', NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-10', NULL, 1, 1),
(3, 'Perses De Vilhena', 'perses', 'teste', NULL, NULL, 1, 'persesvilhena01@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '2013-01-01', NULL, 1, 1),
(4, 'login1', 'login1', 'login1', NULL, NULL, 1, 'login1', NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-10', NULL, 0, 1),
(5, 'login2', 'login2', 'login2', NULL, NULL, 1, 'login2', NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-10', NULL, 0, 0),
(6, 'login3', 'login3', 'login3', NULL, NULL, 1, 'login3', NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-10', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cc_usuario_projeto`
--

CREATE TABLE `cc_usuario_projeto` (
  `uso_usuario_id` int(11) NOT NULL,
  `uso_projeto_id` int(11) NOT NULL,
  `uso_papel_projeto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cc_autor_evento`
--
ALTER TABLE `cc_autor_evento`
  ADD PRIMARY KEY (`auo_evento_id`,`auo_usuario_id`);

--
-- Indexes for table `cc_autor_noticia`
--
ALTER TABLE `cc_autor_noticia`
  ADD PRIMARY KEY (`aut_noticia_id`,`aut_usuario_id`),
  ADD KEY `fk_cc_noticia_has_cc_usuario_cc_usuario1_idx` (`aut_usuario_id`),
  ADD KEY `fk_cc_noticia_has_cc_usuario_cc_noticia1_idx` (`aut_noticia_id`);

--
-- Indexes for table `cc_cidade`
--
ALTER TABLE `cc_cidade`
  ADD PRIMARY KEY (`cid_id`),
  ADD KEY `fk_cidade_estado1_idx` (`cid_estado_id`);

--
-- Indexes for table `cc_documento`
--
ALTER TABLE `cc_documento`
  ADD PRIMARY KEY (`doc_id`),
  ADD KEY `fk_cc_documentos_grupo_usuario1_idx` (`doc_grupo_usuario_grupo_id`,`doc_grupo_usuario_usuario_id`);

--
-- Indexes for table `cc_download`
--
ALTER TABLE `cc_download`
  ADD PRIMARY KEY (`dow_id`);

--
-- Indexes for table `cc_empresa_instituicao`
--
ALTER TABLE `cc_empresa_instituicao`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `fk_cc_empresa_instituicao_cc_cidade1_idx` (`emp_cidade`);

--
-- Indexes for table `cc_estado`
--
ALTER TABLE `cc_estado`
  ADD PRIMARY KEY (`est_id`),
  ADD KEY `fk_cc_estado_cc_pais1_idx` (`est_pais_id`);

--
-- Indexes for table `cc_evento`
--
ALTER TABLE `cc_evento`
  ADD PRIMARY KEY (`eve_id`),
  ADD KEY `fk_cc_eventos_tipo_evento1_idx` (`eve_tipo_id`);

--
-- Indexes for table `cc_evento_nucleo`
--
ALTER TABLE `cc_evento_nucleo`
  ADD PRIMARY KEY (`evl_evento_id`,`evl_nucleo_id`);

--
-- Indexes for table `cc_evento_usuario`
--
ALTER TABLE `cc_evento_usuario`
  ADD PRIMARY KEY (`evo_evento_id`),
  ADD KEY `fk_cc_eventos_has_grupo_usuario_cc_eventos1_idx` (`evo_evento_id`),
  ADD KEY `fk_cc_eventos_has_grupo_usuario_papel1_idx` (`evo_papel_id`),
  ADD KEY `fk_usuario` (`evo_usuario_id`);

--
-- Indexes for table `cc_fomento`
--
ALTER TABLE `cc_fomento`
  ADD PRIMARY KEY (`fom_id`);

--
-- Indexes for table `cc_foto_evento_auxiliar`
--
ALTER TABLE `cc_foto_evento_auxiliar`
  ADD PRIMARY KEY (`fot_id`),
  ADD KEY `fk_cc_fotos_eventos_auxiliares_cc_eventos1_idx` (`fot_evento`);

--
-- Indexes for table `cc_foto_noticia_auxiliar`
--
ALTER TABLE `cc_foto_noticia_auxiliar`
  ADD PRIMARY KEY (`for_id`),
  ADD KEY `fk_foto_not_copy1_noticias1` (`for_noticia`);

--
-- Indexes for table `cc_grupo`
--
ALTER TABLE `cc_grupo`
  ADD PRIMARY KEY (`gru_id`);

--
-- Indexes for table `cc_grupo_usuario`
--
ALTER TABLE `cc_grupo_usuario`
  ADD PRIMARY KEY (`gro_grupo_id`,`gro_usuario_id`),
  ADD KEY `fk_grupo_has_usuario_usuario1_idx` (`gro_usuario_id`),
  ADD KEY `fk_grupo_has_usuario_grupo_idx` (`gro_grupo_id`);

--
-- Indexes for table `cc_grupo_usuario_subarea_conhecimento`
--
ALTER TABLE `cc_grupo_usuario_subarea_conhecimento`
  ADD PRIMARY KEY (`grt_subarea_conhecimento_id`),
  ADD KEY `fk_professores_has_subarea_conhecimento_subarea_conheciment_idx` (`grt_subarea_conhecimento_id`),
  ADD KEY `fk_professores_subarea_conhecimento_grupo_usuario1_idx` (`grt_grupo_usuario_grupo_id`,`grt_grupo_usuario_usuario_id`);

--
-- Indexes for table `cc_intercambista`
--
ALTER TABLE `cc_intercambista`
  ADD PRIMARY KEY (`int_usuario_id`),
  ADD KEY `fk_intercambista_fomento1_idx` (`int_fomento_id`),
  ADD KEY `fk_intercambista_grupo_usuario1_idx` (`int_grupo_usuario_grupo_prof_id`,`int_grupo_usuario_usuario_prof_id`),
  ADD KEY `fk_intercambista_grupo_usuario2_idx` (`int_grupo_usuario_grupo_usu_id`,`int_grupo_usuario_usuario_usu_id`),
  ADD KEY `fk_intercambista_cidade1_idx` (`int_cidade_id`,`int_cidade_est`);

--
-- Indexes for table `cc_linha_pesquisa`
--
ALTER TABLE `cc_linha_pesquisa`
  ADD PRIMARY KEY (`lin_id`);

--
-- Indexes for table `cc_link`
--
ALTER TABLE `cc_link`
  ADD PRIMARY KEY (`lik_id`);

--
-- Indexes for table `cc_log`
--
ALTER TABLE `cc_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `cc_noticia`
--
ALTER TABLE `cc_noticia`
  ADD PRIMARY KEY (`not_id`);

--
-- Indexes for table `cc_noticia_nucleo`
--
ALTER TABLE `cc_noticia_nucleo`
  ADD PRIMARY KEY (`noo_noticia_id`,`noo_nucleo_id`),
  ADD KEY `fk_cc_noticias_has_nucleos_usuario_cc_noticias1_idx` (`noo_noticia_id`),
  ADD KEY `fk_cc_noticia_nucleo_usuario_cc_nucleo1_idx` (`noo_nucleo_id`);

--
-- Indexes for table `cc_nucleo`
--
ALTER TABLE `cc_nucleo`
  ADD PRIMARY KEY (`nuc_id`);

--
-- Indexes for table `cc_nucleo_linha_pesquisa`
--
ALTER TABLE `cc_nucleo_linha_pesquisa`
  ADD PRIMARY KEY (`nus_nucleo_id`,`nus_linha_pesquisa_id`),
  ADD KEY `fk_nucleos_has_areas_conhecimento_areas_conhecimento1_idx` (`nus_linha_pesquisa_id`),
  ADD KEY `fk_nucleos_has_areas_conhecimento_nucleos1_idx` (`nus_nucleo_id`);

--
-- Indexes for table `cc_nucleo_usuario`
--
ALTER TABLE `cc_nucleo_usuario`
  ADD PRIMARY KEY (`nuo_nucleo_id`,`nuo_usuario_id`),
  ADD KEY `fk_nucleos_has_usuario_usuario1_idx` (`nuo_usuario_id`),
  ADD KEY `fk_nucleos_has_usuario_nucleos1_idx` (`nuo_nucleo_id`),
  ADD KEY `fk_nucleos_usuario_papel1_idx` (`nuo_papel_id`);

--
-- Indexes for table `cc_nucleo_usuario_permissao`
--
ALTER TABLE `cc_nucleo_usuario_permissao`
  ADD PRIMARY KEY (`nua_nucleo`,`nua_usuario`,`nua_permissao`,`nua_sistema`),
  ADD KEY `fk_nucleos_usuario_has_permissoes_permissoes1_idx` (`nua_permissao`),
  ADD KEY `fk_nucleos_usuario_has_permissoes_nucleos_usuario1_idx` (`nua_nucleo`,`nua_usuario`),
  ADD KEY `nua_sistema_id` (`nua_sistema`);

--
-- Indexes for table `cc_oportunidade`
--
ALTER TABLE `cc_oportunidade`
  ADD PRIMARY KEY (`opo_id`),
  ADD KEY `fk_cc_oportunidades_cc_empresa_instituicao1_idx` (`opo_empresa_instituicao`);

--
-- Indexes for table `cc_pais`
--
ALTER TABLE `cc_pais`
  ADD PRIMARY KEY (`pai_id`);

--
-- Indexes for table `cc_papel`
--
ALTER TABLE `cc_papel`
  ADD PRIMARY KEY (`pap_id`);

--
-- Indexes for table `cc_papel_projeto`
--
ALTER TABLE `cc_papel_projeto`
  ADD PRIMARY KEY (`pao_id`);

--
-- Indexes for table `cc_permissao`
--
ALTER TABLE `cc_permissao`
  ADD PRIMARY KEY (`per_id`);

--
-- Indexes for table `cc_projeto`
--
ALTER TABLE `cc_projeto`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `fk_projetos_tipo_projeto1_idx` (`pro_tipo_projeto_id`),
  ADD KEY `fk_projetos_fomento1_idx` (`pro_fomento_id`);

--
-- Indexes for table `cc_publicacao`
--
ALTER TABLE `cc_publicacao`
  ADD PRIMARY KEY (`pub_id`),
  ADD KEY `fk_publicacao_tipo_publicacao1_idx` (`pub_tipo_publicacao_id`),
  ADD KEY `fk_publicacao_projetos1_idx` (`pub_projeto_id`);

--
-- Indexes for table `cc_publicacao_usuario`
--
ALTER TABLE `cc_publicacao_usuario`
  ADD PRIMARY KEY (`puo_publicacao_id`,`puo_usuario_id`),
  ADD KEY `fk_publicacao_has_usuario_usuario1_idx` (`puo_usuario_id`),
  ADD KEY `fk_publicacao_has_usuario_publicacao1_idx` (`puo_publicacao_id`);

--
-- Indexes for table `cc_session`
--
ALTER TABLE `cc_session`
  ADD PRIMARY KEY (`ses_id`),
  ADD KEY `last_activity_idx` (`ses_last_activity`);

--
-- Indexes for table `cc_sistema`
--
ALTER TABLE `cc_sistema`
  ADD PRIMARY KEY (`sis_id`);

--
-- Indexes for table `cc_subarea_conhecimento`
--
ALTER TABLE `cc_subarea_conhecimento`
  ADD PRIMARY KEY (`sub_id`);

--
-- Indexes for table `cc_subarea_conhecimento_nucleo`
--
ALTER TABLE `cc_subarea_conhecimento_nucleo`
  ADD PRIMARY KEY (`suo_subarea_conhecimento_id`,`suo_nucleo_id`),
  ADD KEY `fk_subarea_conhecimento_has_nucleos_nucleos1_idx` (`suo_nucleo_id`),
  ADD KEY `fk_subarea_conhecimento_has_nucleos_subarea_conhecimento1_idx` (`suo_subarea_conhecimento_id`);

--
-- Indexes for table `cc_tipo_evento`
--
ALTER TABLE `cc_tipo_evento`
  ADD PRIMARY KEY (`tit_id`);

--
-- Indexes for table `cc_tipo_projeto`
--
ALTER TABLE `cc_tipo_projeto`
  ADD PRIMARY KEY (`tio_id`);

--
-- Indexes for table `cc_tipo_publicacao`
--
ALTER TABLE `cc_tipo_publicacao`
  ADD PRIMARY KEY (`tip_id`);

--
-- Indexes for table `cc_usuario`
--
ALTER TABLE `cc_usuario`
  ADD PRIMARY KEY (`usu_id`),
  ADD KEY `fk_cc_pessoa_cc_cidade1_idx` (`usu_cidade`);

--
-- Indexes for table `cc_usuario_projeto`
--
ALTER TABLE `cc_usuario_projeto`
  ADD PRIMARY KEY (`uso_usuario_id`,`uso_projeto_id`),
  ADD KEY `fk_usuario_has_projetos_projetos1_idx` (`uso_projeto_id`),
  ADD KEY `fk_usuario_has_projetos_usuario1_idx` (`uso_usuario_id`),
  ADD KEY `fk_usuario_projetos_papel_projeto1_idx` (`uso_papel_projeto_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cc_cidade`
--
ALTER TABLE `cc_cidade`
  MODIFY `cid_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cc_documento`
--
ALTER TABLE `cc_documento`
  MODIFY `doc_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cc_empresa_instituicao`
--
ALTER TABLE `cc_empresa_instituicao`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cc_estado`
--
ALTER TABLE `cc_estado`
  MODIFY `est_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cc_evento`
--
ALTER TABLE `cc_evento`
  MODIFY `eve_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cc_foto_evento_auxiliar`
--
ALTER TABLE `cc_foto_evento_auxiliar`
  MODIFY `fot_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cc_foto_noticia_auxiliar`
--
ALTER TABLE `cc_foto_noticia_auxiliar`
  MODIFY `for_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cc_linha_pesquisa`
--
ALTER TABLE `cc_linha_pesquisa`
  MODIFY `lin_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cc_link`
--
ALTER TABLE `cc_link`
  MODIFY `lik_id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cc_log`
--
ALTER TABLE `cc_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `cc_noticia`
--
ALTER TABLE `cc_noticia`
  MODIFY `not_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `cc_nucleo`
--
ALTER TABLE `cc_nucleo`
  MODIFY `nuc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cc_oportunidade`
--
ALTER TABLE `cc_oportunidade`
  MODIFY `opo_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cc_pais`
--
ALTER TABLE `cc_pais`
  MODIFY `pai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cc_papel`
--
ALTER TABLE `cc_papel`
  MODIFY `pap_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cc_permissao`
--
ALTER TABLE `cc_permissao`
  MODIFY `per_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `cc_projeto`
--
ALTER TABLE `cc_projeto`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cc_publicacao`
--
ALTER TABLE `cc_publicacao`
  MODIFY `pub_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cc_sistema`
--
ALTER TABLE `cc_sistema`
  MODIFY `sis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cc_tipo_evento`
--
ALTER TABLE `cc_tipo_evento`
  MODIFY `tit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cc_usuario`
--
ALTER TABLE `cc_usuario`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cc_autor_noticia`
--
ALTER TABLE `cc_autor_noticia`
  ADD CONSTRAINT `fk_cc_noticia_has_cc_usuario_cc_noticia1` FOREIGN KEY (`aut_noticia_id`) REFERENCES `cc_noticia` (`not_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cc_cidade`
--
ALTER TABLE `cc_cidade`
  ADD CONSTRAINT `fk_cidade_estado` FOREIGN KEY (`cid_estado_id`) REFERENCES `cc_estado` (`est_id`);

--
-- Limitadores para a tabela `cc_documento`
--
ALTER TABLE `cc_documento`
  ADD CONSTRAINT `fk_cc_documentos_grupo_usuario1` FOREIGN KEY (`doc_grupo_usuario_grupo_id`,`doc_grupo_usuario_usuario_id`) REFERENCES `cc_grupo_usuario` (`gro_grupo_id`, `gro_usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cc_empresa_instituicao`
--
ALTER TABLE `cc_empresa_instituicao`
  ADD CONSTRAINT `fk_cc_empresa_instituicao_cc_cidade1` FOREIGN KEY (`emp_cidade`) REFERENCES `cc_cidade` (`cid_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cc_estado`
--
ALTER TABLE `cc_estado`
  ADD CONSTRAINT `fk_estado_pais` FOREIGN KEY (`est_pais_id`) REFERENCES `cc_pais` (`pai_id`);

--
-- Limitadores para a tabela `cc_evento`
--
ALTER TABLE `cc_evento`
  ADD CONSTRAINT `fk_tipo` FOREIGN KEY (`eve_tipo_id`) REFERENCES `cc_tipo_evento` (`tit_id`);

--
-- Limitadores para a tabela `cc_evento_usuario`
--
ALTER TABLE `cc_evento_usuario`
  ADD CONSTRAINT `fk_evento` FOREIGN KEY (`evo_evento_id`) REFERENCES `cc_evento` (`eve_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`evo_usuario_id`) REFERENCES `cc_usuario` (`usu_id`);

--
-- Limitadores para a tabela `cc_foto_evento_auxiliar`
--
ALTER TABLE `cc_foto_evento_auxiliar`
  ADD CONSTRAINT `fk_cc_fotos_eventos_auxiliares_cc_eventos1` FOREIGN KEY (`fot_evento`) REFERENCES `cc_evento` (`eve_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cc_foto_noticia_auxiliar`
--
ALTER TABLE `cc_foto_noticia_auxiliar`
  ADD CONSTRAINT `fk_foto_noticias_auxiliares` FOREIGN KEY (`for_noticia`) REFERENCES `cc_noticia` (`not_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cc_grupo_usuario`
--
ALTER TABLE `cc_grupo_usuario`
  ADD CONSTRAINT `fk_grupo_has_usuario_grupo` FOREIGN KEY (`gro_grupo_id`) REFERENCES `cc_grupo` (`gru_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_grupo_has_usuario_usuario1` FOREIGN KEY (`gro_usuario_id`) REFERENCES `cc_usuario` (`usu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cc_intercambista`
--
ALTER TABLE `cc_intercambista`
  ADD CONSTRAINT `fk_cc_intercambista_cc_usuario1` FOREIGN KEY (`int_usuario_id`) REFERENCES `cc_usuario` (`usu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_intercambista_cidade1` FOREIGN KEY (`int_cidade_id`) REFERENCES `cc_cidade` (`cid_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_intercambista_fomento1` FOREIGN KEY (`int_fomento_id`) REFERENCES `cc_fomento` (`fom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_intercambista_grupo_usuario1` FOREIGN KEY (`int_grupo_usuario_grupo_prof_id`,`int_grupo_usuario_usuario_prof_id`) REFERENCES `cc_grupo_usuario` (`gro_grupo_id`, `gro_usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_intercambista_grupo_usuario2` FOREIGN KEY (`int_grupo_usuario_grupo_usu_id`,`int_grupo_usuario_usuario_usu_id`) REFERENCES `cc_grupo_usuario` (`gro_grupo_id`, `gro_usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cc_noticia_nucleo`
--
ALTER TABLE `cc_noticia_nucleo`
  ADD CONSTRAINT `fk_cc_noticias_has_nucleos_usuario_cc_noticias1` FOREIGN KEY (`noo_noticia_id`) REFERENCES `cc_noticia` (`not_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cc_nucleo_linha_pesquisa`
--
ALTER TABLE `cc_nucleo_linha_pesquisa`
  ADD CONSTRAINT `fk_nucleos_has_areas_conhecimento_areas_conhecimento1` FOREIGN KEY (`nus_linha_pesquisa_id`) REFERENCES `cc_linha_pesquisa` (`lin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cc_nucleo_usuario`
--
ALTER TABLE `cc_nucleo_usuario`
  ADD CONSTRAINT `fk_nucleo_usuario` FOREIGN KEY (`nuo_nucleo_id`) REFERENCES `cc_nucleo` (`nuc_id`),
  ADD CONSTRAINT `fk_nucleos_has_usuario_usuario1` FOREIGN KEY (`nuo_usuario_id`) REFERENCES `cc_usuario` (`usu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cc_nucleo_usuario_permissao`
--
ALTER TABLE `cc_nucleo_usuario_permissao`
  ADD CONSTRAINT `fk_permissao` FOREIGN KEY (`nua_permissao`) REFERENCES `cc_permissao` (`per_id`),
  ADD CONSTRAINT `fk_sistema` FOREIGN KEY (`nua_sistema`) REFERENCES `cc_sistema` (`sis_id`);

--
-- Limitadores para a tabela `cc_oportunidade`
--
ALTER TABLE `cc_oportunidade`
  ADD CONSTRAINT `fk_cc_oportunidades_cc_empresa_instituicao1` FOREIGN KEY (`opo_empresa_instituicao`) REFERENCES `cc_empresa_instituicao` (`emp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cc_projeto`
--
ALTER TABLE `cc_projeto`
  ADD CONSTRAINT `fk_projetos_fomento1` FOREIGN KEY (`pro_fomento_id`) REFERENCES `cc_fomento` (`fom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_projetos_tipo_projeto1` FOREIGN KEY (`pro_tipo_projeto_id`) REFERENCES `cc_tipo_projeto` (`tio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cc_publicacao`
--
ALTER TABLE `cc_publicacao`
  ADD CONSTRAINT `fk_publicacao_projetos1` FOREIGN KEY (`pub_projeto_id`) REFERENCES `cc_projeto` (`pro_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_publicacao_tipo_publicacao1` FOREIGN KEY (`pub_tipo_publicacao_id`) REFERENCES `cc_tipo_publicacao` (`tip_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cc_publicacao_usuario`
--
ALTER TABLE `cc_publicacao_usuario`
  ADD CONSTRAINT `fk_publicacao_has_usuario_publicacao1` FOREIGN KEY (`puo_publicacao_id`) REFERENCES `cc_publicacao` (`pub_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_publicacao_has_usuario_usuario1` FOREIGN KEY (`puo_usuario_id`) REFERENCES `cc_usuario` (`usu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cc_subarea_conhecimento_nucleo`
--
ALTER TABLE `cc_subarea_conhecimento_nucleo`
  ADD CONSTRAINT `fk_subarea_conhecimento_has_nucleos_subarea_conhecimento1` FOREIGN KEY (`suo_subarea_conhecimento_id`) REFERENCES `cc_subarea_conhecimento` (`sub_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cc_usuario`
--
ALTER TABLE `cc_usuario`
  ADD CONSTRAINT `fk_cc_pessoa_cc_cidade1` FOREIGN KEY (`usu_cidade`) REFERENCES `cc_cidade` (`cid_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cc_usuario_projeto`
--
ALTER TABLE `cc_usuario_projeto`
  ADD CONSTRAINT `fk_usuario_has_projetos_projetos1` FOREIGN KEY (`uso_projeto_id`) REFERENCES `cc_projeto` (`pro_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_projetos_usuario1` FOREIGN KEY (`uso_usuario_id`) REFERENCES `cc_usuario` (`usu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_projetos_papel_projeto1` FOREIGN KEY (`uso_papel_projeto_id`) REFERENCES `cc_papel_projeto` (`pao_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
