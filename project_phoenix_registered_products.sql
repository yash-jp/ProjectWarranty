-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: project_phoenix
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `registered_products`
--

DROP TABLE IF EXISTS `registered_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registered_products` (
  `registered_product_userid` int(11) NOT NULL,
  `registered_product_productid` int(11) NOT NULL,
  `registered_product_date` date DEFAULT NULL,
  `registered_product_status` varchar(20) DEFAULT 'Not Claimed',
  `registered_product_claimed_times` int(11) DEFAULT '0',
  `registered_product_claimed_date` date DEFAULT NULL,
  PRIMARY KEY (`registered_product_userid`,`registered_product_productid`),
  KEY `purchased_prod_productid_fk_idx` (`registered_product_productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registered_products`
--

LOCK TABLES `registered_products` WRITE;
/*!40000 ALTER TABLE `registered_products` DISABLE KEYS */;
INSERT INTO `registered_products` VALUES (3,1,'2019-11-16','approved',1,'2019-11-01'),(3,2,'2019-11-01','Not Claimed',0,NULL),(3,4,'2019-11-22','pending',1,'2019-11-13'),(3,5,'2019-11-07','rejected',1,'2019-11-05'),(7,1,'2019-11-15','Not Claimed',0,NULL),(7,4,'2019-11-03','Not Claimed',0,NULL),(10,4,'2019-10-29','Not Claimed',0,NULL);
/*!40000 ALTER TABLE `registered_products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-16 23:56:27
