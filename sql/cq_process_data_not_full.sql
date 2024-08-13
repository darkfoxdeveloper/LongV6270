-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: game_cq
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Dumping data for table `cq_process_goal`
--

LOCK TABLES `cq_process_goal` WRITE;
/*!40000 ALTER TABLE `cq_process_goal` DISABLE KEYS */;
INSERT INTO `cq_process_goal` VALUES (1,5,0,3005107,1,1,0,0,0,0,0,0),(2,7,0,3005108,1,1,0,0,0,0,0,0),(3,6,0,3005109,1,1,0,0,0,0,0,0),(4,9,0,3005110,1,1,0,0,0,0,0,0);
/*!40000 ALTER TABLE `cq_process_goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cq_process_task`
--

LOCK TABLES `cq_process_task` WRITE;
/*!40000 ALTER TABLE `cq_process_task` DISABLE KEYS */;
INSERT INTO `cq_process_task` VALUES (101,1,0,0,0,3006150,1,1),(102,5,0,0,0,1088001,1,1),(103,255,0,0,0,723017,1,1),(104,255,0,0,0,723017,1,1),(105,6,0,0,0,723700,1,1),(201,1,0,0,0,3006151,1,1),(202,5,0,0,0,1088001,1,1),(203,12,0,0,0,723017,1,1),(204,7,0,0,0,1200000,1,1),(205,44,0,0,0,1088001,1,1),(301,1,0,0,0,3005119,1,1),(401,1,0,0,0,3005120,1,1),(302,5,0,0,0,3001264,1,1),(402,5,0,0,0,721090,1,1),(303,11,0,0,0,3005123,1,1),(403,22,0,0,0,1088001,1,1),(304,13,0,0,0,730001,1,1),(206,45,0,0,0,300000,1,1),(207,255,0,0,0,723017,1,1),(208,9,0,0,0,1088001,1,1),(305,14,0,0,0,1200001,1,1),(306,15,0,0,0,723700,1,1);
/*!40000 ALTER TABLE `cq_process_task` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-13 19:08:59
