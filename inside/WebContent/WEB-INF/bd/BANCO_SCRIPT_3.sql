CREATE DATABASE  IF NOT EXISTS `pi_6_inside_2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pi_6_inside_2`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pi_6_inside_2
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.35-MariaDB

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
-- Table structure for table `tb_arquivo`
--

DROP TABLE IF EXISTS `tb_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_arquivo` (
  `ID_ARQUIVO` int(11) NOT NULL AUTO_INCREMENT,
  `DIRETORIO_ARQ` varchar(300) NOT NULL,
  `ID_DEMANDA` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_ARQUIVO`),
  KEY `fk_tb_arquivo_tb_demanda1_idx` (`ID_DEMANDA`),
  CONSTRAINT `FKky6x90m8jq03tggclrc2amn9f` FOREIGN KEY (`ID_DEMANDA`) REFERENCES `tb_demanda` (`ID_DEMANDA`),
  CONSTRAINT `fk_tb_arquivo_tb_demanda1` FOREIGN KEY (`ID_DEMANDA`) REFERENCES `tb_demanda` (`ID_DEMANDA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_arquivo`
--

LOCK TABLES `tb_arquivo` WRITE;
/*!40000 ALTER TABLE `tb_arquivo` DISABLE KEYS */;
INSERT INTO `tb_arquivo` VALUES (1,'C:\\inside\\vlcsnap-2017-09-02-21h19m31s894.png',5,'foto-mto-maneira','png'),(2,'C:\\inside\\BANCO_MER.mwb',5,'mer','mwb'),(3,'C:\\inside\\MER.png',5,'mer-imagem','png'),(4,'C:\\inside\\Aula02-Lab-USJT-2018-ArqSw-SpringMVC-ioc.pdf',5,'doc-informativo-spring','pdf'),(5,'C:\\inside\\login-backgroundjpg',11,'login-background','jpg'),(6,'C:\\inside\\skypng',11,'sky','png'),(7,'C:\\inside\\~SLApng',11,'~SLA','png');
/*!40000 ALTER TABLE `tb_arquivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cargo_func`
--

DROP TABLE IF EXISTS `tb_cargo_func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cargo_func` (
  `ID_CARGO_FUNC` int(11) NOT NULL AUTO_INCREMENT,
  `DESC_CARGO` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_CARGO_FUNC`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cargo_func`
--

LOCK TABLES `tb_cargo_func` WRITE;
/*!40000 ALTER TABLE `tb_cargo_func` DISABLE KEYS */;
INSERT INTO `tb_cargo_func` VALUES (2,'Analista Jr'),(3,'Gestor de Projetos');
/*!40000 ALTER TABLE `tb_cargo_func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cliente` (
  `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `NOME_CLIENTE` varchar(130) NOT NULL,
  `REPRESENTANTE` varchar(80) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `EMAIL_REP` varchar(80) DEFAULT NULL,
  `cnpj` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (2,'Universidade São Judas','Rodrigo Bossini','(11)5421-4585','usjr@mail.com','12.345.678/9123-45','Av. Vital Brasil, 1999'),(3,'Teste','Testador','(11)2124-2145','tester@mail.com','12.345.678/9123-45','Rua teste, 213');
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_comentario`
--

DROP TABLE IF EXISTS `tb_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_comentario` (
  `ID_COMENTARIO` int(11) NOT NULL AUTO_INCREMENT,
  `COMENTARIO` varchar(400) NOT NULL,
  `DT_COMENTARIO` datetime NOT NULL,
  `LOGIN` varchar(40) NOT NULL,
  `ID_DEMANDA` int(11) NOT NULL,
  PRIMARY KEY (`ID_COMENTARIO`),
  KEY `fk_tb_comentario_tb_usuario1_idx` (`LOGIN`),
  KEY `fk_tb_comentario_tb_demanda1_idx` (`ID_DEMANDA`),
  CONSTRAINT `FKfkpfwq5o1yx8vdhxksb2oa4s5` FOREIGN KEY (`LOGIN`) REFERENCES `tb_usuario` (`LOGIN`),
  CONSTRAINT `FKknliooh283fmrxxpsmfo3mwq6` FOREIGN KEY (`ID_DEMANDA`) REFERENCES `tb_demanda` (`ID_DEMANDA`),
  CONSTRAINT `fk_tb_comentario_tb_demanda1` FOREIGN KEY (`ID_DEMANDA`) REFERENCES `tb_demanda` (`ID_DEMANDA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_comentario_tb_usuario1` FOREIGN KEY (`LOGIN`) REFERENCES `tb_usuario` (`LOGIN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_comentario`
--

LOCK TABLES `tb_comentario` WRITE;
/*!40000 ALTER TABLE `tb_comentario` DISABLE KEYS */;
INSERT INTO `tb_comentario` VALUES (1,'Lorem ipsum dolor sit amet, consectetur adipisicing elit.','2018-10-25 20:16:56','janaina.abc3@gmail.com',5),(2,'Finalmente funcionou essa porrada','2018-10-25 20:40:32','janaina.abc3@gmail.com',5),(3,'Teste','2018-10-25 20:42:21','janaina.abc3@gmail.com',5),(4,'OKA','2018-10-25 20:59:10','janaina.abc3@gmail.com',5),(5,'novo comentario','2018-10-25 21:16:32','janaina.abc3@gmail.com',5),(6,'Teste','2018-11-01 02:45:38','admin',10),(7,'Lorem ipsum dolor sit amet, consectetur adipisicing elit.','2018-11-02 19:50:48','janaina.abc3@gmail.com',11),(8,'teste','2018-11-07 20:14:06','admin',5),(9,'Lorem ipsum dolor sit amet, consectetur adipisici]][ng elit.','2018-11-07 20:30:02','janaina.abc3@gmail.com',11);
/*!40000 ALTER TABLE `tb_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_demanda`
--

DROP TABLE IF EXISTS `tb_demanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_demanda` (
  `ID_DEMANDA` int(11) NOT NULL AUTO_INCREMENT,
  `DESC_DEMANDA` varchar(70) NOT NULL,
  `DETALHES` varchar(200) NOT NULL,
  `ID_PROJETO` int(11) NOT NULL,
  `ID_FUNCIONARIO` int(11) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `dt_inicio` datetime NOT NULL,
  `dt_fim` datetime NOT NULL,
  `duracao` time DEFAULT NULL,
  PRIMARY KEY (`ID_DEMANDA`),
  KEY `FK7p4expdg7ema9npuc2hyfcepw` (`ID_FUNCIONARIO`),
  KEY `FKp3n6cthpip7ar2x069ksv8we5` (`ID_PROJETO`),
  CONSTRAINT `FK7p4expdg7ema9npuc2hyfcepw` FOREIGN KEY (`ID_FUNCIONARIO`) REFERENCES `tb_funcionario` (`ID_FUNCIONARIO`),
  CONSTRAINT `FK_TB_DEMANDA_TB_FUNCIONARIO1` FOREIGN KEY (`ID_FUNCIONARIO`) REFERENCES `tb_funcionario` (`ID_FUNCIONARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TB_DEMANDA_TB_PROJETO1` FOREIGN KEY (`ID_PROJETO`) REFERENCES `tb_projeto` (`ID_PROJETO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKp3n6cthpip7ar2x069ksv8we5` FOREIGN KEY (`ID_PROJETO`) REFERENCES `tb_projeto` (`ID_PROJETO`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_demanda`
--

LOCK TABLES `tb_demanda` WRITE;
/*!40000 ALTER TABLE `tb_demanda` DISABLE KEYS */;
INSERT INTO `tb_demanda` VALUES (5,'Upload de Arquivos','Implementar upload de arquivos e lista-los para download.',4,2,'pausado','2018-10-10 00:00:00','2018-11-21 00:00:00',NULL),(10,'Implementação do cronograma','Validar a inserção de uma demanda para um analista dentro de um período busy.',4,3,'em andamento','2018-11-01 00:00:00','2018-11-15 00:00:00','21:00:06'),(11,'Teste','Teste',4,2,'finalizado','2018-11-16 00:00:00','2018-11-20 00:00:00','00:02:14'),(12,'Escopo do Projeto','Desenvolvimento do escopo do projeto.',5,2,'aberto','2018-11-16 00:00:00','2018-11-20 00:00:00',NULL),(13,'Implementação Spring MVC','Implementar estrutura MVC utilizando framework Spring',6,2,'aberto','2018-11-21 00:00:00','2018-12-20 00:00:00',NULL);
/*!40000 ALTER TABLE `tb_demanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_funcionario`
--

DROP TABLE IF EXISTS `tb_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_funcionario` (
  `ID_FUNCIONARIO` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(130) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `ESPECIALIDADE` varchar(100) NOT NULL,
  `LOCALIZACAO` varchar(100) NOT NULL,
  `CELULAR` varchar(11) DEFAULT NULL,
  `CPF` varchar(11) NOT NULL,
  `RG` varchar(9) DEFAULT NULL,
  `ID_CARGO_FUNC` int(11) NOT NULL,
  `OBSERVACOES` varchar(500) DEFAULT NULL,
  `TELEFONE` varchar(10) DEFAULT NULL,
  `LOGIN` varchar(40) NOT NULL,
  PRIMARY KEY (`ID_FUNCIONARIO`),
  UNIQUE KEY `EMAIL` (`EMAIL`),
  UNIQUE KEY `CPF` (`CPF`),
  UNIQUE KEY `LOGIN_UNIQUE` (`ID_FUNCIONARIO`),
  KEY `FKe6br5on4uhp7j7hctb6igyvkk` (`ID_CARGO_FUNC`),
  KEY `FKqiymbt0btd7ra5ney5efstjnu` (`LOGIN`),
  CONSTRAINT `FK_TB_FUNCIONARIO_TB_USUARIO1` FOREIGN KEY (`LOGIN`) REFERENCES `tb_usuario` (`LOGIN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TB_USUARIO_TB_CARGO_FUNC1` FOREIGN KEY (`ID_CARGO_FUNC`) REFERENCES `tb_cargo_func` (`ID_CARGO_FUNC`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKe6br5on4uhp7j7hctb6igyvkk` FOREIGN KEY (`ID_CARGO_FUNC`) REFERENCES `tb_cargo_func` (`ID_CARGO_FUNC`),
  CONSTRAINT `FKqiymbt0btd7ra5ney5efstjnu` FOREIGN KEY (`LOGIN`) REFERENCES `tb_usuario` (`LOGIN`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_funcionario`
--

LOCK TABLES `tb_funcionario` WRITE;
/*!40000 ALTER TABLE `tb_funcionario` DISABLE KEYS */;
INSERT INTO `tb_funcionario` VALUES (2,'Janaina Emilia','janaina.abc3@gmail.com','Analista Jr','So Paulo/SP',NULL,'55541244587',NULL,2,NULL,NULL,'janaina.abc3@gmail.com'),(3,'Dennis Siqueira','dennis.siqueira@gmail.com','UX/UI','So Paulo/SP',NULL,'44451245745',NULL,2,NULL,NULL,'dennis.siqueira@gmail.com'),(5,'Ge Rente','ge.rente@mail.com','Gestor de Projetos','So Paulo/SP','11921454578','55514574585',NULL,3,NULL,NULL,'ge.rente@mail.com');
/*!40000 ALTER TABLE `tb_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_perfil`
--

DROP TABLE IF EXISTS `tb_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_perfil` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_perfil`
--

LOCK TABLES `tb_perfil` WRITE;
/*!40000 ALTER TABLE `tb_perfil` DISABLE KEYS */;
INSERT INTO `tb_perfil` VALUES (3,'Administrador'),(4,'Analista');
/*!40000 ALTER TABLE `tb_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_producao`
--

DROP TABLE IF EXISTS `tb_producao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_producao` (
  `ID_PRODUCAO` int(11) NOT NULL AUTO_INCREMENT,
  `DATA` date NOT NULL,
  `HR_INICIO` time NOT NULL,
  `HR_FIM` time DEFAULT NULL,
  `ID_DEMANDA` int(11) NOT NULL,
  PRIMARY KEY (`ID_PRODUCAO`),
  KEY `FKrstbdugvc691kxuo40lkn8a95` (`ID_DEMANDA`),
  CONSTRAINT `FK_TB_PRODUCAO_TB_DEMANDA1` FOREIGN KEY (`ID_DEMANDA`) REFERENCES `tb_demanda` (`ID_DEMANDA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKrstbdugvc691kxuo40lkn8a95` FOREIGN KEY (`ID_DEMANDA`) REFERENCES `tb_demanda` (`ID_DEMANDA`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_producao`
--

LOCK TABLES `tb_producao` WRITE;
/*!40000 ALTER TABLE `tb_producao` DISABLE KEYS */;
INSERT INTO `tb_producao` VALUES (5,'2018-11-03','19:37:03','19:37:21',5),(6,'2018-11-03','19:42:35','19:45:38',5),(7,'2018-11-03','19:48:30','19:48:36',5),(8,'2018-11-03','19:52:35','19:52:40',5),(9,'2018-11-03','19:55:38','20:10:39',5),(10,'2018-11-03','20:16:14','20:22:15',5),(11,'2018-11-03','20:25:43','20:42:48',5),(12,'2018-11-03','20:42:52','20:42:58',5),(13,'2018-11-03','20:43:02','20:53:26',5),(14,'2018-11-03','20:53:31','20:53:44',5),(15,'2018-11-03','20:53:58','20:54:01',5),(16,'2018-11-03','20:59:22','20:59:26',5),(17,'2018-11-03','20:59:32','20:59:35',5),(18,'2018-11-03','20:59:40','20:59:44',5),(19,'2018-11-03','21:43:46','21:43:49',5),(20,'2018-11-04','05:21:31','18:59:08',5),(21,'2018-11-04','18:58:48','18:58:54',11),(22,'2018-11-04','18:59:16','18:59:19',5),(23,'2018-11-04','18:59:23','18:59:25',5),(24,'2018-11-04','18:59:30','20:44:29',5),(25,'2018-11-04','19:00:12','20:29:52',11),(26,'2018-11-07','20:42:55','22:15:23',11),(27,'2018-11-13','22:15:40',NULL,11),(28,'2018-11-15','19:48:55','19:49:01',5),(29,'2018-11-15','19:49:24','19:49:29',5),(30,'2018-11-20','18:01:42','18:01:48',10),(31,'2018-11-20','18:01:51',NULL,10);
/*!40000 ALTER TABLE `tb_producao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_projeto`
--

DROP TABLE IF EXISTS `tb_projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_projeto` (
  `ID_PROJETO` int(11) NOT NULL AUTO_INCREMENT,
  `DESC_PROJETO` varchar(45) NOT NULL,
  `ID_CLIENTE` int(11) NOT NULL,
  `DETALHE` varchar(200) NOT NULL,
  `ATIVIDADE` varchar(80) DEFAULT NULL,
  `DT_INICIO` date NOT NULL,
  `DT_FIM` date NOT NULL,
  `HORAS` varchar(4) NOT NULL,
  `LOGIN` varchar(40) NOT NULL,
  `STATUS` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_PROJETO`),
  KEY `FKceid4ix9uqjw2a7ka71n8ef6b` (`LOGIN`),
  KEY `FKmsekk2kicixyjqtngg64876g4` (`ID_CLIENTE`),
  CONSTRAINT `FK_TB_PROJETO_TB_CLIENTE1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `tb_cliente` (`ID_CLIENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKceid4ix9uqjw2a7ka71n8ef6b` FOREIGN KEY (`LOGIN`) REFERENCES `tb_usuario` (`LOGIN`),
  CONSTRAINT `FKmsekk2kicixyjqtngg64876g4` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `tb_cliente` (`ID_CLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_projeto`
--

LOCK TABLES `tb_projeto` WRITE;
/*!40000 ALTER TABLE `tb_projeto` DISABLE KEYS */;
INSERT INTO `tb_projeto` VALUES (4,'Projeto Beta',2,'Detalhes do projeto','Educacional','2018-11-20','2019-01-20','85','admin','aberto'),(5,'UniGo',2,'Projeto de conclusão de curso. Grória a Deux.','-','2019-03-11','2020-03-02','0','admin','aberto'),(6,'Media Center',2,'Projeto top em andamento','Educacional','2018-10-08','2019-01-08','0','admin','aberto');
/*!40000 ALTER TABLE `tb_projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_usuario` (
  `LOGIN` varchar(40) NOT NULL,
  `SENHA` varchar(20) NOT NULL,
  `ID_PERFIL` int(11) NOT NULL,
  PRIMARY KEY (`LOGIN`),
  KEY `FK4vnmbh2ttieyby11hn7rbt9xo` (`ID_PERFIL`),
  CONSTRAINT `FK4vnmbh2ttieyby11hn7rbt9xo` FOREIGN KEY (`ID_PERFIL`) REFERENCES `tb_perfil` (`ID`),
  CONSTRAINT `FK_TB_USUARIO_TB_PERFIL1` FOREIGN KEY (`ID_PERFIL`) REFERENCES `tb_perfil` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES ('admin','admin',3),('analista','analista',4),('dennis.siqueira@gmail.com','123',4),('ge.rente@mail.com','57166',3),('janaina.abc3@gmail.com','janaina',4),('teste@mail.com','59152',4);
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

-- Dump completed on 2018-11-20 20:51:24
