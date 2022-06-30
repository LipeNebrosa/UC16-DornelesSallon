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
  `dtagenda` varchar(45) NOT NULL,
  `horario` time NOT NULL,
  `idfuncinario` int(11) DEFAULT NULL,
  `idcliente` int(11) NOT NULL,
  `idservico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_agenda_funcionario_idx` (`idfuncinario`),
  KEY `fk_agenda_cliente_idx` (`idcliente`),
  CONSTRAINT `fk_agenda_cliente` FOREIGN KEY (`idcliente`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_agenda_funcionario` FOREIGN KEY (`idfuncinario`) REFERENCES `funcionario` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
INSERT INTO `agenda` VALUES (1,'2022-07-01','13:00:00',NULL,3,NULL),(2,'2022-07-30','14:00:00',NULL,3,NULL),(3,'2022-07-02','12:00:00',NULL,1,NULL),(4,'2022-07-02','13:00:00',NULL,1,NULL),(5,'2022-07-12','12:00:00',NULL,1,NULL),(6,'2022-07-21','14:00:00',NULL,1,NULL);
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
  CONSTRAINT `funcionario_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Felipe Ferreira dos Santos','06671458502','2001-04-09','lipefs2009@gmail.com','admin','(27) 99243-8451','M','S','2022-06-26 01:37:39'),(2,'William Roseno Alcebiades','19277315776','2001-07-04','williamroseno55@gmail.com','rosenoalcebiades','(27) 99644-5761','M','N','2022-06-30 12:26:38'),(3,'marcos','11111111111','1997-02-01','marcos1@gmail.com','12','(99) 99999-9999','M','N','2022-06-30 12:29:40'),(4,'Gladson','18617405732','2002-06-26','gladson@gmail.com','gemd','(27) 99783-3885','M','N','2022-06-30 12:33:19');
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

-- Dump completed on 2022-06-30 10:13:07
