-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: recycle
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `eventlog`
--

DROP TABLE IF EXISTS `eventlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventlog` (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `robotId` bigint NOT NULL,
  `eventType` varchar(50) NOT NULL,
  `message` varchar(50) NOT NULL,
  `note` text,
  `status` varchar(50) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='이벤트 로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventlog`
--

LOCK TABLES `eventlog` WRITE;
/*!40000 ALTER TABLE `eventlog` DISABLE KEYS */;
INSERT INTO `eventlog` VALUES (1,1,'PATROL_START','순찰 시작',NULL,'Task','2026-07-19 18:56:15'),(2,1,'OBJECT_DETECTED','물체 감지','object:plastic_bottle,\n confidence:0.87,\n class_id:1','Detect','2026-07-19 18:56:57'),(3,1,'OBJECT_PICKUP_START','수거 시작',NULL,'Task','2026-07-19 18:57:44'),(4,1,'OBJECT_PICKUP_SUCCESS','수거 성공',NULL,'Task','2026-07-19 18:57:59'),(5,1,'PATROL_COMPLETE','순찰 종료',NULL,'Task','2026-07-19 18:58:41'),(6,1,'BATTERY_LOW','배터리 부족','배터리가 30% 이하입니다.','Warning','2026-07-19 19:01:27'),(7,1,'PATROL_RESUME','순찰 재개',NULL,'Task','2026-07-19 20:51:47'),(8,1,'OBJECT_PICKUP_FAIL','수거 실패',NULL,'Error','2026-07-19 20:52:28'),(9,1,'USER_COMMAND','사용자 명령','순찰 시작','Task','2026-07-19 20:53:05'),(10,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-07-19 20:54:57'),(11,1,'PATROL_START','순찰 시작',NULL,'Task','2026-07-19 18:56:15'),(12,1,'OBJECT_DETECTED','물체 감지','object:plastic_bottle,\n confidence:0.87,\n class_id:1','Detect','2026-07-19 18:56:57'),(13,1,'OBJECT_PICKUP_START','수거 시작',NULL,'Task','2026-07-19 18:57:44'),(14,1,'OBJECT_PICKUP_SUCCESS','수거 성공',NULL,'Task','2026-07-19 18:57:59'),(15,1,'PATROL_COMPLETE','순찰 종료',NULL,'Task','2026-07-19 18:58:41'),(16,1,'BATTERY_LOW','배터리 부족','배터리가 30% 이하입니다.','Warning','2026-07-19 19:01:27'),(17,1,'PATROL_RESUME','순찰 재개',NULL,'Task','2026-07-19 20:51:47'),(18,1,'OBJECT_PICKUP_FAIL','수거 실패',NULL,'Error','2026-07-19 20:52:28'),(19,1,'USER_COMMAND','사용자 명령','순찰 시작','Task','2026-07-19 20:53:05'),(20,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-07-19 20:54:57'),(21,1,'PATROL_START','순찰 시작',NULL,'Task','2026-07-19 18:56:15'),(22,1,'OBJECT_DETECTED','물체 감지','object:plastic_bottle,\n confidence:0.87,\n class_id:1','Detect','2026-07-19 18:56:57'),(23,1,'OBJECT_PICKUP_START','수거 시작',NULL,'Task','2026-07-19 18:57:44'),(24,1,'OBJECT_PICKUP_SUCCESS','수거 성공',NULL,'Task','2026-07-19 18:57:59'),(25,1,'PATROL_COMPLETE','순찰 종료',NULL,'Task','2026-07-19 18:58:41'),(26,1,'BATTERY_LOW','배터리 부족','배터리가 30% 이하입니다.','Warning','2026-07-19 19:01:27'),(27,1,'PATROL_RESUME','순찰 재개',NULL,'Task','2026-07-19 20:51:47'),(28,1,'OBJECT_PICKUP_FAIL','수거 실패',NULL,'Error','2026-07-19 20:52:28'),(29,1,'USER_COMMAND','사용자 명령','순찰 시작','Task','2026-07-19 20:53:05'),(30,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-07-19 20:54:57'),(31,1,'PATROL_START','순찰 시작',NULL,'Task','2026-07-19 18:56:15'),(32,1,'OBJECT_DETECTED','물체 감지','object:plastic_bottle,\n confidence:0.87,\n class_id:1','Detect','2026-07-19 18:56:57'),(33,1,'OBJECT_PICKUP_START','수거 시작',NULL,'Task','2026-07-19 18:57:44'),(34,1,'OBJECT_PICKUP_SUCCESS','수거 성공',NULL,'Task','2026-07-19 18:57:59'),(35,1,'PATROL_COMPLETE','순찰 종료',NULL,'Task','2026-07-19 18:58:41'),(36,1,'BATTERY_LOW','배터리 부족','배터리가 30% 이하입니다.','Warning','2026-07-19 19:01:27'),(37,1,'PATROL_RESUME','순찰 재개',NULL,'Task','2026-07-19 20:51:47'),(38,1,'OBJECT_PICKUP_FAIL','수거 실패',NULL,'Error','2026-07-19 20:52:28'),(39,1,'USER_COMMAND','사용자 명령','순찰 시작','Task','2026-07-19 20:53:05'),(40,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-07-19 20:54:57'),(41,1,'PATROL_START','순찰 시작',NULL,'Task','2026-07-19 18:56:15'),(42,1,'OBJECT_DETECTED','물체 감지','object:plastic_bottle,\n confidence:0.87,\n class_id:1','Detect','2026-07-19 18:56:57'),(43,1,'OBJECT_PICKUP_START','수거 시작',NULL,'Task','2026-07-19 18:57:44'),(44,1,'OBJECT_PICKUP_SUCCESS','수거 성공',NULL,'Task','2026-07-19 18:57:59'),(45,1,'PATROL_COMPLETE','순찰 종료',NULL,'Task','2026-07-19 18:58:41'),(46,1,'BATTERY_LOW','배터리 부족','배터리가 30% 이하입니다.','Warning','2026-07-19 19:01:27'),(47,1,'PATROL_RESUME','순찰 재개',NULL,'Task','2026-07-19 20:51:47'),(48,1,'OBJECT_PICKUP_FAIL','수거 실패',NULL,'Error','2026-07-19 20:52:28'),(49,1,'USER_COMMAND','사용자 명령','순찰 시작','Task','2026-07-19 20:53:05'),(50,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-07-19 20:54:57'),(51,1,'PATROL_START','순찰 시작',NULL,'Task','2026-07-19 18:56:15'),(52,1,'OBJECT_DETECTED','물체 감지','object:plastic_bottle,\n confidence:0.87,\n class_id:1','Detect','2026-07-19 18:56:57'),(53,1,'OBJECT_PICKUP_START','수거 시작',NULL,'Task','2026-07-19 18:57:44'),(54,1,'OBJECT_PICKUP_SUCCESS','수거 성공',NULL,'Task','2026-07-19 18:57:59'),(55,1,'PATROL_COMPLETE','순찰 종료',NULL,'Task','2026-07-19 18:58:41'),(56,1,'BATTERY_LOW','배터리 부족','배터리가 30% 이하입니다.','Warning','2026-07-19 19:01:27'),(57,1,'PATROL_RESUME','순찰 재개',NULL,'Task','2026-07-19 20:51:47'),(58,1,'OBJECT_PICKUP_FAIL','수거 실패',NULL,'Error','2026-07-19 20:52:28'),(59,1,'USER_COMMAND','사용자 명령','순찰 시작','Task','2026-07-19 20:53:05'),(60,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-07-19 20:54:57'),(61,1,'PATROL_START','순찰 시작',NULL,'Task','2026-07-19 18:56:15'),(62,1,'OBJECT_DETECTED','물체 감지','object:plastic_bottle,\n confidence:0.87,\n class_id:1','Detect','2026-07-19 18:56:57'),(63,1,'OBJECT_PICKUP_START','수거 시작',NULL,'Task','2026-07-19 18:57:44'),(64,1,'OBJECT_PICKUP_SUCCESS','수거 성공',NULL,'Task','2026-07-19 18:57:59'),(65,1,'PATROL_COMPLETE','순찰 종료',NULL,'Task','2026-07-19 18:58:41'),(66,1,'BATTERY_LOW','배터리 부족','배터리가 30% 이하입니다.','Warning','2026-07-19 19:01:27'),(67,1,'PATROL_RESUME','순찰 재개',NULL,'Task','2026-07-19 20:51:47'),(68,1,'OBJECT_PICKUP_FAIL','수거 실패',NULL,'Error','2026-07-19 20:52:28'),(69,1,'USER_COMMAND','사용자 명령','순찰 시작','Task','2026-07-19 20:53:05'),(70,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-07-19 20:54:57'),(71,1,'PATROL_START','순찰 시작',NULL,'Task','2026-07-19 18:56:15'),(72,1,'OBJECT_DETECTED','물체 감지','object:plastic_bottle,\n confidence:0.87,\n class_id:1','Detect','2026-07-19 18:56:57'),(73,1,'OBJECT_PICKUP_START','수거 시작',NULL,'Task','2026-07-19 18:57:44'),(74,1,'OBJECT_PICKUP_SUCCESS','수거 성공',NULL,'Task','2026-07-19 18:57:59'),(75,1,'PATROL_COMPLETE','순찰 종료',NULL,'Task','2026-07-19 18:58:41'),(76,1,'BATTERY_LOW','배터리 부족','배터리가 30% 이하입니다.','Warning','2026-07-19 19:01:27'),(77,1,'PATROL_RESUME','순찰 재개',NULL,'Task','2026-07-19 20:51:47'),(78,1,'OBJECT_PICKUP_FAIL','수거 실패',NULL,'Error','2026-07-19 20:52:28'),(79,1,'USER_COMMAND','사용자 명령','순찰 시작','Task','2026-07-19 20:53:05'),(80,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-07-19 20:54:57'),(81,1,'PATROL_START','순찰 시작',NULL,'Task','2026-07-19 18:56:15'),(82,1,'OBJECT_DETECTED','물체 감지','object:plastic_bottle,\n confidence:0.87,\n class_id:1','Detect','2026-07-19 18:56:57'),(83,1,'OBJECT_PICKUP_START','수거 시작',NULL,'Task','2026-07-19 18:57:44'),(84,1,'OBJECT_PICKUP_SUCCESS','수거 성공',NULL,'Task','2026-07-19 18:57:59'),(85,1,'PATROL_COMPLETE','순찰 종료',NULL,'Task','2026-07-19 18:58:41'),(86,1,'BATTERY_LOW','배터리 부족','배터리가 30% 이하입니다.','Warning','2026-07-19 19:01:27'),(87,1,'PATROL_RESUME','순찰 재개',NULL,'Task','2026-07-19 20:51:47'),(88,1,'OBJECT_PICKUP_FAIL','수거 실패',NULL,'Error','2026-07-19 20:52:28'),(89,1,'USER_COMMAND','사용자 명령','순찰 시작','Task','2026-07-19 20:53:05'),(90,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-07-19 20:54:57'),(91,1,'PATROL_START','순찰 시작',NULL,'Task','2026-07-19 18:56:15'),(92,1,'OBJECT_DETECTED','물체 감지','object:plastic_bottle,\n confidence:0.87,\n class_id:1','Detect','2026-07-19 18:56:57'),(93,1,'OBJECT_PICKUP_START','수거 시작',NULL,'Task','2026-07-19 18:57:44'),(94,1,'OBJECT_PICKUP_SUCCESS','수거 성공',NULL,'Task','2026-07-19 18:57:59'),(95,1,'PATROL_COMPLETE','순찰 종료',NULL,'Task','2026-07-19 18:58:41'),(96,1,'BATTERY_LOW','배터리 부족','배터리가 30% 이하입니다.','Warning','2026-07-19 19:01:27'),(97,1,'PATROL_RESUME','순찰 재개',NULL,'Task','2026-07-19 20:51:47'),(98,1,'OBJECT_PICKUP_FAIL','수거 실패',NULL,'Error','2026-07-19 20:52:28'),(99,1,'USER_COMMAND','사용자 명령','순찰 시작','Task','2026-07-19 20:53:05'),(100,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-07-19 20:54:57'),(101,1,'PATROL_START','순찰 시작',NULL,'Task','2026-07-19 18:56:15'),(102,1,'OBJECT_DETECTED','물체 감지','object:plastic_bottle,\n confidence:0.87,\n class_id:1','Detect','2026-07-19 18:56:57'),(103,1,'OBJECT_PICKUP_START','수거 시작',NULL,'Task','2026-07-19 18:57:44'),(104,1,'OBJECT_PICKUP_SUCCESS','수거 성공',NULL,'Task','2026-07-19 18:57:59'),(105,1,'PATROL_COMPLETE','순찰 종료',NULL,'Task','2026-07-19 18:58:41'),(106,1,'BATTERY_LOW','배터리 부족','배터리가 30% 이하입니다.','Warning','2026-07-19 19:01:27'),(107,1,'PATROL_RESUME','순찰 재개',NULL,'Task','2026-07-19 20:51:47'),(108,1,'OBJECT_PICKUP_FAIL','수거 실패',NULL,'Error','2026-07-19 20:52:28'),(109,1,'USER_COMMAND','사용자 명령','순찰 시작','Task','2026-07-19 20:53:05'),(110,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-07-19 20:54:57'),(111,1,'PATROL_START','순찰 시작',NULL,'Task','2026-07-20 18:56:15'),(112,1,'OBJECT_DETECTED','물체 감지','object:plastic_bottle, \n confidence:0.87,\n class_id:1','Detect','2026-07-20 18:56:57'),(113,1,'OBJECT_PICKUP_START','수거 시작',NULL,'Task','2026-07-20 18:57:44'),(114,1,'OBJECT_PICKUP_SUCCESS','수거 성공',NULL,'Task','2026-07-20 18:57:59'),(115,1,'PATROL_COMPLETE','순찰 종료',NULL,'Task','2026-07-20 18:58:41'),(116,1,'BATTERY_LOW','배터리 부족','배터리가 30% 이하입니다.','Warning','2026-07-20 19:01:27'),(117,1,'PATROL_RESUME','순찰 재개',NULL,'Task','2026-07-20 20:51:47'),(118,1,'OBJECT_PICKUP_FAIL','수거 실패',NULL,'Error','2026-07-20 20:52:28'),(119,1,'USER_COMMAND','사용자 명령','순찰 시작','Task','2026-07-20 20:53:05'),(120,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-07-20 20:54:57');
/*!40000 ALTER TABLE `eventlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map`
--

DROP TABLE IF EXISTS `map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map` (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `mapName` varchar(100) NOT NULL,
  `imagePath` varchar(255) NOT NULL,
  `resolution` double NOT NULL,
  `originX` double NOT NULL,
  `originY` double NOT NULL,
  `originTheta` double NOT NULL,
  `width` int NOT NULL,
  `height` int NOT NULL,
  `isDefault` tinyint(1) DEFAULT '1',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `updateTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map`
--

LOCK TABLES `map` WRITE;
/*!40000 ALTER TABLE `map` DISABLE KEYS */;
INSERT INTO `map` VALUES (1,'map2','/image/map/map2.png',0.05,-1.38,-3.16,0,99,67,1,'2026-07-31 10:03:49','2026-07-31 14:30:40');
/*!40000 ALTER TABLE `map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recyclehistory`
--

DROP TABLE IF EXISTS `recyclehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recyclehistory` (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `objectType` varchar(50) NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT '0' COMMENT '물체 수거 성공 여부',
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='물체 수거 로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recyclehistory`
--

LOCK TABLES `recyclehistory` WRITE;
/*!40000 ALTER TABLE `recyclehistory` DISABLE KEYS */;
INSERT INTO `recyclehistory` VALUES (1,'Plastic','Success','2026-07-19 20:08:29'),(2,'Can','Success','2026-07-19 20:08:38'),(3,'Paper','Success','2026-07-19 20:08:51'),(4,'Plastic','Success','2026-07-20 20:08:29'),(5,'Can','Success','2026-07-20 20:08:38'),(6,'Paper','Success','2026-07-20 20:08:51'),(7,'Plastic','Success','2026-07-20 20:08:29'),(8,'Can','Success','2026-07-20 20:08:38'),(9,'Paper','Success','2026-07-20 20:08:51'),(10,'Plastic','Success','2026-07-20 20:08:29'),(11,'Can','Fail','2026-07-20 20:08:38'),(12,'Paper','Fail','2026-07-20 20:08:51'),(13,'Plastic','Fail','2026-07-20 20:08:29'),(14,'Can','Fail','2026-07-20 20:08:38'),(15,'Paper','Success','2026-07-20 20:08:51'),(16,'Plastic','Success','2026-07-20 20:08:29'),(17,'Can','Success','2026-07-20 20:08:38'),(18,'Paper','Fail','2026-07-20 20:08:51'),(19,'Plastic','Success','2026-07-21 20:08:29'),(20,'Can','Success','2026-07-21 20:08:38'),(21,'Paper','Success','2026-07-21 20:08:51'),(22,'Plastic','True','2026-07-21 20:08:29'),(23,'Can','True','2026-07-21 20:08:38'),(24,'Plastic','True','2026-07-21 20:08:51'),(25,'Plastic','True','2026-07-21 20:08:29'),(26,'Can','True','2026-07-21 20:08:38'),(27,'Plastic','True','2026-07-21 20:08:51'),(28,'Plastic','True','2026-07-21 20:08:29'),(29,'Can','True','2026-07-21 20:08:38'),(30,'Plastic','True','2026-07-21 20:08:51'),(31,'Plastic','True','2026-07-21 20:08:29'),(32,'Can','True','2026-07-21 20:08:38'),(33,'Plastic','True','2026-07-21 20:08:51'),(34,'Plastic','True','2026-07-23 20:08:29'),(35,'Can','True','2026-07-21 20:08:38'),(36,'Plastic','True','2026-07-23 20:08:51'),(37,'Plastic','True','2026-07-23 20:08:29'),(38,'Can','True','2026-07-21 20:08:38'),(39,'Plastic','True','2026-07-23 20:08:51'),(40,'Plastic','True','2026-07-23 20:08:29'),(41,'Can','True','2026-07-21 20:08:38'),(42,'Plastic','True','2026-07-23 20:08:51'),(43,'Paper','True','2026-07-23 20:08:29'),(44,'Can','True','2026-07-21 20:08:38'),(45,'Plastic','True','2026-07-23 20:08:51'),(46,'Paper','True','2026-07-23 20:08:29'),(47,'Can','True','2026-07-21 20:08:38'),(48,'Plastic','True','2026-07-23 20:08:51');
/*!40000 ALTER TABLE `recyclehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robot`
--

DROP TABLE IF EXISTS `robot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `robot` (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) NOT NULL,
  `rosVersion` varchar(50) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='로봇 종류';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robot`
--

LOCK TABLES `robot` WRITE;
/*!40000 ALTER TABLE `robot` DISABLE KEYS */;
INSERT INTO `robot` VALUES (1,'turtlebot3-01','Turtlebot3 Waffle Pi','ROS2 Humble');
/*!40000 ALTER TABLE `robot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robotstatus`
--

DROP TABLE IF EXISTS `robotstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `robotstatus` (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `robotId` bigint NOT NULL,
  `eventType` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='로봇 실시간 상태';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robotstatus`
--

LOCK TABLES `robotstatus` WRITE;
/*!40000 ALTER TABLE `robotstatus` DISABLE KEYS */;
INSERT INTO `robotstatus` VALUES (1,1,'state','Stop','2026-08-03 10:51:19','2026-08-03 18:24:06');
/*!40000 ALTER TABLE `robotstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='사용자';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'1234','$2a$10$4HgE3NUT8Mb/aNKfyAkbD.etkhe7Hr4K9O6K/Gt55PdX/zXZSmbuK','1234'),(3,'qwer','$2a$10$Z6OUWXOrvqPcKY5f4T9yae095A81bulAg6eWPtXUObZ2m3qCOQ8dm','qwer');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'recycle'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-03 18:38:59
