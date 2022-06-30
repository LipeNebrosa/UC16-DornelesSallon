CREATE DATABASE  IF NOT EXISTS `bdbarbearia` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bdbarbearia`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: bdbarbearia
-- ------------------------------------------------------
-- Server version	5.7.36-log

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
  `dtagenda` varchar(45) NOT NULL,
  `horario` time NOT NULL,
  `idfuncinario` int(11) DEFAULT NULL,
  `idcliente` int(11) NOT NULL,
  `idservico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_agenda_funcionario_idx` (`idfuncinario`),
  KEY `fk_agenda_cliente_idx` (`idcliente`),
  KEY `fk_agenda_servico_idx` (`idservico`),
  CONSTRAINT `fk_agenda_cliente` FOREIGN KEY (`idcliente`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_agenda_funcionario` FOREIGN KEY (`idfuncinario`) REFERENCES `funcionario` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_agenda_servico` FOREIGN KEY (`idservico`) REFERENCES `servico` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
INSERT INTO `agenda` VALUES (1,'2022-07-01','13:00:00',NULL,1,NULL),(3,'2022-06-30','12:00:00',NULL,1,NULL),(4,'2022-07-09','09:00:00',NULL,1,NULL),(7,'2022-07-01','09:00:00',NULL,1,NULL),(8,'2022-06-30','11:00:00',NULL,1,NULL),(9,'2022-06-30','11:00:00',NULL,1,NULL),(10,'2022-06-30','09:00:00',NULL,1,NULL),(11,'2022-06-30','14:00:00',NULL,1,NULL),(12,'2022-07-08','11:00:00',NULL,1,NULL),(13,'2022-07-29','17:00:00',NULL,1,NULL),(14,'2022-07-29','12:00:00',NULL,1,NULL),(15,'2022-07-14','12:00:00',NULL,1,NULL),(16,'2022-06-30','11:00:00',NULL,1,NULL);
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `matricula` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `dtcadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`matricula`),
  KEY `funcionario_usuario_idx` (`idUsuario`),
  CONSTRAINT `funcionario_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'teste','blabla',26,'2022-06-30 07:08:56'),(2,'teste','blabla',26,'2022-06-30 07:11:21'),(4,'Glad','Gerencia',29,'2022-06-30 08:13:28');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Felipe Ferreira dos Santos','06671458502','2001-04-09','lipefs2009@gmail.com','admin','(27) 99243-8451','M','S','2022-06-26 01:37:39'),(26,'Testante Testador','47083069549','2022-06-07','teste@teste.com','123','(12) 31231-2413','F','S','2022-06-26 01:48:36'),(29,'Jose Matheu','14696119700','2022-05-30','matheu@mail.com','123','(57) 68467-8567','M','S','2022-06-30 07:43:11');
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

-- Dump completed on 2022-06-30  5:16:19
