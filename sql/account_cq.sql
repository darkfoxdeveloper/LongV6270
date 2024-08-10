CREATE DATABASE  IF NOT EXISTS `account_cq` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `account_cq`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: account_cq
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
-- Table structure for table `city_location`
--

DROP TABLE IF EXISTS `city_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip_from` bigint DEFAULT NULL,
  `ip_to` bigint DEFAULT NULL,
  `country_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `country_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `latitude` double(255,9) DEFAULT NULL,
  `longitude` double(255,9) DEFAULT NULL,
  `zip_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_location`
--

LOCK TABLES `city_location` WRITE;
/*!40000 ALTER TABLE `city_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `city_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conquer_account`
--

DROP TABLE IF EXISTS `conquer_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conquer_account` (
  `Id` int NOT NULL,
  `UserName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Salt` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `AuthorityId` int DEFAULT '1',
  `Flag` int DEFAULT '0',
  `IpAddress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MacAddress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ParentId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conquer_account`
--

LOCK TABLES `conquer_account` WRITE;
/*!40000 ALTER TABLE `conquer_account` DISABLE KEYS */;
INSERT INTO `conquer_account` VALUES (1000001,'test','ae6e2af6782e5479aeb0005c2b21c6de008152a63382c7afeee7f2300463dac4','ed5242b13ca205bcdb19491d45cf0db7',2,0,NULL,NULL,'5a28920a-5d82-453a-b951-27c4879a5d06','2024-04-03 00:00:00','2024-08-10 20:42:52',NULL);
/*!40000 ALTER TABLE `conquer_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conquer_account_authority`
--

DROP TABLE IF EXISTS `conquer_account_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conquer_account_authority` (
  `Id` int NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NormalizedName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conquer_account_authority`
--

LOCK TABLES `conquer_account_authority` WRITE;
/*!40000 ALTER TABLE `conquer_account_authority` DISABLE KEYS */;
INSERT INTO `conquer_account_authority` VALUES (1,'Player','Player'),(2,'Player','Player');
/*!40000 ALTER TABLE `conquer_account_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conquer_account_login_record`
--

DROP TABLE IF EXISTS `conquer_account_login_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conquer_account_login_record` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `AccountId` int DEFAULT NULL,
  `IpAddress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LocationId` int DEFAULT NULL,
  `LoginTime` datetime DEFAULT NULL,
  `Success` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=424 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conquer_account_login_record`
--

LOCK TABLES `conquer_account_login_record` WRITE;
/*!40000 ALTER TABLE `conquer_account_login_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `conquer_account_login_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conquer_account_vip`
--

DROP TABLE IF EXISTS `conquer_account_vip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conquer_account_vip` (
  `Id` int NOT NULL,
  `ConquerAccountId` int DEFAULT NULL,
  `VipLevel` tinyint DEFAULT NULL,
  `DurationMinutes` int DEFAULT NULL,
  `StartDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EndDate` datetime NOT NULL,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conquer_account_vip`
--

LOCK TABLES `conquer_account_vip` WRITE;
/*!40000 ALTER TABLE `conquer_account_vip` DISABLE KEYS */;
/*!40000 ALTER TABLE `conquer_account_vip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm`
--

DROP TABLE IF EXISTS `realm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm` (
  `RealmID` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `RealmIdx` int NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `AuthorityID` int DEFAULT '0',
  `GameIPAddress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `RpcIPAddress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GamePort` int DEFAULT '0',
  `RpcPort` int DEFAULT '0',
  `Status` tinyint DEFAULT NULL,
  `Username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LastPing` datetime DEFAULT NULL,
  `DatabaseHost` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DatabaseUser` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DatabasePass` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DatabaseSchema` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DatabasePort` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Active` bit(1) DEFAULT b'1',
  `ProductionRealm` bit(1) DEFAULT b'1',
  `Attribute` int DEFAULT NULL,
  `MasterRealmID` int DEFAULT NULL,
  `CrossPort` int DEFAULT NULL,
  PRIMARY KEY (`RealmID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm`
--

LOCK TABLES `realm` WRITE;
/*!40000 ALTER TABLE `realm` DISABLE KEYS */;
INSERT INTO `realm` VALUES ('94390aa0-c75d-11ed-9586-0050560401e2',1,'WarLord',6,'192.168.1.129','127.0.0.1',5816,9921,1,'2vOQ/9KufSH7WkyTDiH0F0YB887vU+NuDyp97CKAW44=','KSNMdd6bh56v0M7iY0OZIAiL1fAPvdrpp+rzDwlP3cg=','2024-04-03 01:37:07','','','','','',_binary '\0',_binary '',1,NULL,9857);
/*!40000 ALTER TABLE `realm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_user`
--

DROP TABLE IF EXISTS `realm_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm_user` (
  `PlayerId` int NOT NULL AUTO_INCREMENT,
  `RealmId` int DEFAULT NULL,
  `AccountId` int DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`PlayerId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_user`
--

LOCK TABLES `realm_user` WRITE;
/*!40000 ALTER TABLE `realm_user` DISABLE KEYS */;
INSERT INTO `realm_user` VALUES (8,1,8,'2024-07-19 01:32:43'),(9,1,9,'2024-07-19 01:58:06'),(10,1,9,'2024-07-19 01:58:33'),(11,1,9,'2024-07-19 02:01:17'),(12,1,9,'2024-07-19 02:05:05'),(13,1,9,'2024-07-19 02:09:44'),(14,1,9,'2024-07-19 10:20:41'),(15,1,10,'2024-07-19 13:24:16'),(16,1,1000001,'2024-07-19 13:42:01'),(17,1,1000002,'2024-07-19 14:08:07'),(18,1,1000002,'2024-07-19 14:14:01');
/*!40000 ALTER TABLE `realm_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'account_cq'
--

--
-- Dumping routines for database 'account_cq'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-10 20:58:21
