-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: c9
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2017_05_08_000919_create_tb_estado',1),('2017_05_08_000949_create_tb_cidade',1),('2017_05_08_003049_create_tb_endereco',2),('2017_05_19_185622_create_table_usuario',3),('2017_05_19_190023_create_tb_doacao',4),('2017_05_19_190449_create_tb_tipo_produto',5),('2017_05_19_191124_create_tb_produto',5),('2017_05_19_191526_create_tb_doacao_produto',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cidade`
--

DROP TABLE IF EXISTS `tb_cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cidade` (
  `id_cidade` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nm_cidade` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_estado` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_cidade`),
  KEY `tb_cidade_id_estado_foreign` (`id_estado`),
  CONSTRAINT `tb_cidade_id_estado_foreign` FOREIGN KEY (`id_estado`) REFERENCES `tb_estado` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cidade`
--

LOCK TABLES `tb_cidade` WRITE;
/*!40000 ALTER TABLE `tb_cidade` DISABLE KEYS */;
INSERT INTO `tb_cidade` VALUES (1,'Acrelândia',1,NULL,NULL);
/*!40000 ALTER TABLE `tb_cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_doacao`
--

DROP TABLE IF EXISTS `tb_doacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_doacao` (
  `id_doacao` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dt_doacao` date NOT NULL,
  `id_usuario_doador` int(10) unsigned NOT NULL,
  `id_usuario` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_doacao`),
  KEY `tb_doacao_id_usuario_doador_foreign` (`id_usuario_doador`),
  KEY `tb_doacao_id_usuario_foreign` (`id_usuario`),
  CONSTRAINT `tb_doacao_id_usuario_foreign` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`),
  CONSTRAINT `tb_doacao_id_usuario_doador_foreign` FOREIGN KEY (`id_usuario_doador`) REFERENCES `tb_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_doacao`
--

LOCK TABLES `tb_doacao` WRITE;
/*!40000 ALTER TABLE `tb_doacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_doacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_doacao_produto`
--

DROP TABLE IF EXISTS `tb_doacao_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_doacao_produto` (
  `id_doacao_produto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_doacao` int(10) unsigned NOT NULL,
  `id_produto` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_doacao_produto`),
  KEY `tb_doacao_produto_id_doacao_foreign` (`id_doacao`),
  KEY `tb_doacao_produto_id_produto_foreign` (`id_produto`),
  CONSTRAINT `tb_doacao_produto_id_produto_foreign` FOREIGN KEY (`id_produto`) REFERENCES `tb_produto` (`id_produto`),
  CONSTRAINT `tb_doacao_produto_id_doacao_foreign` FOREIGN KEY (`id_doacao`) REFERENCES `tb_doacao` (`id_doacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_doacao_produto`
--

LOCK TABLES `tb_doacao_produto` WRITE;
/*!40000 ALTER TABLE `tb_doacao_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_doacao_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_endereco`
--

DROP TABLE IF EXISTS `tb_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_endereco` (
  `id_endereco` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nm_logradouro` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cd_logradouro` int(11) NOT NULL,
  `ds_complemento` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nm_bairro` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_cidade` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `tb_endereco_id_cidade_foreign` (`id_cidade`),
  CONSTRAINT `tb_endereco_id_cidade_foreign` FOREIGN KEY (`id_cidade`) REFERENCES `tb_cidade` (`id_cidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_endereco`
--

LOCK TABLES `tb_endereco` WRITE;
/*!40000 ALTER TABLE `tb_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_estado`
--

DROP TABLE IF EXISTS `tb_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_estado` (
  `id_estado` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nm_estado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estado`
--

LOCK TABLES `tb_estado` WRITE;
/*!40000 ALTER TABLE `tb_estado` DISABLE KEYS */;
INSERT INTO `tb_estado` VALUES (1,'Acre',NULL,NULL);
/*!40000 ALTER TABLE `tb_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_produto`
--

DROP TABLE IF EXISTS `tb_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_produto` (
  `id_produto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nm_produto` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `qt_produto` int(11) NOT NULL,
  `id_tipo_produto` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `tb_produto_id_tipo_produto_foreign` (`id_tipo_produto`),
  CONSTRAINT `tb_produto_id_tipo_produto_foreign` FOREIGN KEY (`id_tipo_produto`) REFERENCES `tb_tipo_produto` (`id_tipo_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_produto`
--

LOCK TABLES `tb_produto` WRITE;
/*!40000 ALTER TABLE `tb_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_produto`
--

DROP TABLE IF EXISTS `tb_tipo_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tipo_produto` (
  `id_tipo_produto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nm_tipo_produto` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_produto`
--

LOCK TABLES `tb_tipo_produto` WRITE;
/*!40000 ALTER TABLE `tb_tipo_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tipo_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_usuario` (
  `id_usuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nm_usuario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nm_email_usuario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nm_senha_usuario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ic_status_usuario` tinyint(4) NOT NULL,
  `id_endereco` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `tb_usuario_id_endereco_foreign` (`id_endereco`),
  CONSTRAINT `tb_usuario_id_endereco_foreign` FOREIGN KEY (`id_endereco`) REFERENCES `tb_endereco` (`id_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-19 19:25:56
