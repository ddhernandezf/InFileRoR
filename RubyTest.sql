-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: RubyTest
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu18.04.1

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
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `TaxNumber` varchar(10) NOT NULL,
  `Firstname` varchar(150) NOT NULL,
  `Lastname` varchar(150) NOT NULL,
  `Address` varchar(45) NOT NULL,
  PRIMARY KEY (`TaxNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('1795813-k','Odilia','Figueroa','Ciudad'),('4345279-5','Douglas','Hernandez','Ciudad'),('c/f','','','');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvoiceDetail`
--

DROP TABLE IF EXISTS `InvoiceDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InvoiceDetail` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Header` bigint(20) NOT NULL,
  `Product` int(11) NOT NULL,
  `Quantity` smallint(6) NOT NULL,
  `Price` decimal(18,2) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_InvHeader_InvDetail_idx` (`Header`),
  KEY `fk_InvDetail_Product_idx` (`Product`),
  CONSTRAINT `fk_InvDetail_InvHeader` FOREIGN KEY (`Header`) REFERENCES `InvoiceHeader` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_InvDetail_Product` FOREIGN KEY (`Product`) REFERENCES `Product` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvoiceDetail`
--

LOCK TABLES `InvoiceDetail` WRITE;
/*!40000 ALTER TABLE `InvoiceDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `InvoiceDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvoiceHeader`
--

DROP TABLE IF EXISTS `InvoiceHeader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InvoiceHeader` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `State` tinyint(4) NOT NULL,
  `Customer` varchar(10) NOT NULL,
  `InvoiceDateTime` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_InvHeader_Customer_idx` (`Customer`),
  KEY `fk_InvHeader_InvState_idx` (`State`),
  CONSTRAINT `fk_InvHeader_Customer` FOREIGN KEY (`Customer`) REFERENCES `Customer` (`TaxNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_InvHeader_InvState` FOREIGN KEY (`State`) REFERENCES `InvoiceState` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvoiceHeader`
--

LOCK TABLES `InvoiceHeader` WRITE;
/*!40000 ALTER TABLE `InvoiceHeader` DISABLE KEYS */;
INSERT INTO `InvoiceHeader` VALUES (1,1,'4345279-5','2018-07-11 00:00:00');
/*!40000 ALTER TABLE `InvoiceHeader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvoiceState`
--

DROP TABLE IF EXISTS `InvoiceState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InvoiceState` (
  `Id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `Name` varchar(15) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvoiceState`
--

LOCK TABLES `InvoiceState` WRITE;
/*!40000 ALTER TABLE `InvoiceState` DISABLE KEYS */;
INSERT INTO `InvoiceState` VALUES (1,'Saved'),(2,'Ready'),(3,'Done'),(4,'Canceled'),(5,'Test states');
/*!40000 ALTER TABLE `InvoiceState` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) NOT NULL,
  `CurrentPrice` decimal(18,2) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Giant Glory',4000.00),(2,'Moongoose Black Diamond',3000.00),(3,'Santa Cruz V10',9000.00),(4,'Specialized Demo 8',7000.00),(5,'Specialized Enduro',3000.00),(6,'Giant Reign',3500.00);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-11 18:55:35
