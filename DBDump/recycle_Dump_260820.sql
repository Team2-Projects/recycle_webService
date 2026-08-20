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
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='이벤트 로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventlog`
--

LOCK TABLES `eventlog` WRITE;
/*!40000 ALTER TABLE `eventlog` DISABLE KEYS */;
INSERT INTO `eventlog` VALUES (121,1,'PATROL_START','순찰 시작','','Task','2026-08-04 10:45:05'),(122,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-04 10:46:45'),(123,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-04 10:49:38'),(124,1,'PATROL_START','순찰 시작','','Task','2026-08-04 11:00:01'),(125,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-04 11:00:17'),(126,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-04 11:00:31'),(127,1,'PATROL_START','순찰 시작','','Task','2026-08-04 11:01:19'),(128,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-04 11:01:44'),(129,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-04 11:01:59'),(130,1,'PATROL_START','순찰 시작','','Task','2026-08-04 11:19:08'),(131,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-04 11:19:16'),(132,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-04 11:19:24'),(133,1,'PATROL_START','순찰 시작','','Task','2026-08-04 12:31:03'),(134,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-04 12:31:04'),(135,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-04 12:31:04');
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
INSERT INTO `map` VALUES (1,'map2','/image/map/map2.jpg',0.05,-1.38,-3.16,0,99,67,1,'2026-07-31 10:03:49','2026-07-31 14:30:40');
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
  `confidence` float NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='물체 수거 로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recyclehistory`
--

LOCK TABLES `recyclehistory` WRITE;
/*!40000 ALTER TABLE `recyclehistory` DISABLE KEYS */;
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
INSERT INTO `robotstatus` VALUES (1,1,'state','Stop','2026-08-03 10:51:19','2026-08-04 12:31:04');
/*!40000 ALTER TABLE `robotstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `scheduleId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `scheduleName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `scheduleDate` date NOT NULL,
  `executionTime` time NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `task` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '"대기"',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES ('SCH001','오전 수거 시작','2026-08-21','09:00:00','WAIT','로봇 쓰레기 수거 시작','지정된 시간에 로봇 쓰레기 수거 작업을 자동으로 시작합니다.'),('SCH001','오전 수거 시작','2026-08-22','09:00:00','WAIT','로봇 쓰레기 수거 시작','지정된 시간에 로봇 쓰레기 수거 작업을 자동으로 시작합니다.');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
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

-- Dump completed on 2026-08-20 16:40:07
