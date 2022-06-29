CREATE DATABASE  IF NOT EXISTS `bdbarbearia` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bdbarbearia`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: bdbarbearia
-- ------------------------------------------------------
-- Server version	5.7.35-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agenda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dtagenda` date NOT NULL,
  `horario` time NOT NULL,
  `idfuncinario` int(11) DEFAULT NULL,
  `idcliente` int(11) NOT NULL,
  `idservico` int(11) DEFAULT NULL,
  `datacadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_agenda_funcionario_idx` (`idfuncinario`),
  KEY `fk_agenda_cliente_idx` (`idcliente`),
  KEY `fk_agenda_servico_idx` (`idservico`),
  CONSTRAINT `fk_agenda_cliente` FOREIGN KEY (`idcliente`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_agenda_funcionario` FOREIGN KEY (`idfuncinario`) REFERENCES `funcionario` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_agenda_servico` FOREIGN KEY (`idservico`) REFERENCES `servico` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
INSERT INTO `agenda` VALUES (3,'2022-06-30','09:00:00',NULL,1,NULL,'2022-06-28 14:20:05'),(4,'2022-06-30','09:00:00',NULL,1,NULL,'2022-06-28 14:21:30'),(5,'2022-07-20','09:00:00',NULL,1,NULL,'2022-06-28 14:21:34'),(6,'2022-07-07','09:00:00',NULL,1,NULL,'2022-06-28 14:21:38'),(7,'2022-07-30','09:00:00',NULL,1,NULL,'2022-06-28 14:21:42'),(8,'2022-06-29','17:00:00',NULL,3,NULL,'2022-06-28 14:22:10'),(9,'2022-07-01','17:00:00',NULL,3,NULL,'2022-06-28 14:22:13'),(10,'2022-06-30','17:00:00',NULL,3,NULL,'2022-06-28 14:22:18'),(11,'2022-07-01','09:00:00',NULL,3,NULL,'2022-06-28 14:24:06');
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato`
--

DROP TABLE IF EXISTS `contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mensagem` varchar(300) NOT NULL,
  `dtcadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato`
--

LOCK TABLES `contato` WRITE;
/*!40000 ALTER TABLE `contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`matricula`),
  KEY `funcionario_usuario_idx` (`idUsuario`),
  CONSTRAINT `funcionario_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1001,'Felipe TheNebrosa','Chefe ne pai',1);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario_servico`
--

DROP TABLE IF EXISTS `funcionario_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario_servico` (
  `id` int(11) NOT NULL,
  `idFuncionario` int(11) NOT NULL,
  `idServico` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_funcserv_Funcionario_idx` (`idFuncionario`),
  KEY `fk_funcserv_servico_idx` (`idServico`),
  CONSTRAINT `fk_funcserv_funcionario` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcserv_servico` FOREIGN KEY (`idServico`) REFERENCES `servico` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario_servico`
--

LOCK TABLES `funcionario_servico` WRITE;
/*!40000 ALTER TABLE `funcionario_servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servico` varchar(45) NOT NULL,
  `valor` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `dataNascimento` date NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `eh_adm` char(1) NOT NULL DEFAULT 'N',
  `dtcadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Felipe bla bla ','06671458502','2002-09-04','lipefs@gmail.com','123','(27) 40028-922','F','S','2022-04-19 11:08:51'),(3,'Testante','47083069549','2022-04-19','teste@teste.com','1234','(12) 34567-8960','M','N','2022-04-20 11:16:37'),(7,'teste da verificaÃ§Ã£o santos','65651351651','2001-02-02','juliana@gmail.com','123','(96) 44654-6565','F','N','2022-06-15 13:22:29'),(10,'xfgjsfhgjnd','46573537856','2022-06-30','testete@gmail.com','1234','(45) 37453-7537','F','N','2022-06-15 13:35:30'),(12,'fdghsrgh','23452345234','2022-06-09','vali@vali.com','123456','(12) 34234-2342','M','N','2022-06-15 13:52:11'),(13,'fdghsrgh','23452345234','2022-06-09','vali@vali.com','123456','(12) 34234-2342','M','N','2022-06-15 13:52:25'),(14,'jklghjkfhjkety','34534534534','2022-06-24','lipefs@vali.com','123456','(34) 53453-4534','M','N','2022-06-15 13:55:07'),(15,'jklghjkfhjkety','34534534534','2022-06-24','lipefs@vali.com','234234','(34) 53453-4534','M','N','2022-06-15 13:55:48'),(16,'jklghjkfhjkety','34534534534','2022-06-24','lipefs@vali.com','234234','(34) 53453-4534','M','N','2022-06-15 13:56:10'),(17,'jklghjkfhjkety','34534534534','2022-06-24','lipefs@vali.com','234234','(34) 53453-4534','M','N','2022-06-15 13:57:12'),(18,'dfsghgsdgfbsdgfb','33456345634','2022-05-30','lipefs@vali.com','123456','(12) 31241-2312','M','N','2022-06-15 14:05:21'),(19,'dfsghgsdgfbsdgfb','33456345634','2022-05-30','lipefs@vali.com','123456','(12) 31241-2312','M','N','2022-06-15 14:07:06'),(20,'dfsghgsdgfbsdgfb','33456345634','2022-05-30','lipefs@vali.com','123456','(12) 31241-2312','M','N','2022-06-15 14:07:54'),(21,'dfsghgsdgfbsdgfb','33456345634','2022-05-30','lipefs@vali.com','123456','(12) 31241-2312','M','N','2022-06-15 14:16:00'),(22,'dfsghgsdgfbsdgfb','33456345634','2022-05-30','lipefs@vali.com','545643','(12) 31241-2312','M','N','2022-06-15 14:17:09'),(23,'fxghjdthjedtyu','78678567527','2022-06-03','lipefs@vailif.com','123456','(45) 64234-5374','M','N','2022-06-15 14:27:58'),(24,'fxghjdthjedtyu','78678567527','2022-06-03','lipefs@vailif.com','123456','(45) 64234-5374','M','N','2022-06-15 14:28:14');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bdbarbearia'
--

--
-- Dumping routines for database 'bdbarbearia'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-29 11:45:05
