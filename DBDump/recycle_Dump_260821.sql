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
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='이벤트 로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventlog`
--

LOCK TABLES `eventlog` WRITE;
/*!40000 ALTER TABLE `eventlog` DISABLE KEYS */;
INSERT INTO `eventlog` VALUES (121,1,'PATROL_START','순찰 시작','','Task','2026-08-04 10:45:05'),(122,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-04 10:46:45'),(123,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-04 10:49:38'),(124,1,'PATROL_START','순찰 시작','','Task','2026-08-04 11:00:01'),(125,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-04 11:00:17'),(126,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-04 11:00:31'),(127,1,'PATROL_START','순찰 시작','','Task','2026-08-04 11:01:19'),(128,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-04 11:01:44'),(129,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-04 11:01:59'),(130,1,'PATROL_START','순찰 시작','','Task','2026-08-04 11:19:08'),(131,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-04 11:19:16'),(132,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-04 11:19:24'),(133,1,'PATROL_START','순찰 시작','','Task','2026-08-04 12:31:03'),(134,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-04 12:31:04'),(135,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-04 12:31:04'),(136,1,'PATROL_START','순찰 시작','','Task','2026-08-07 15:05:18'),(137,1,'OBJECT_DETECTED','물체 감지','물체: plastic / 신뢰도: 0.43','Detect','2026-08-07 15:05:22'),(138,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-07 15:05:22'),(139,1,'PATROL_START','순찰 시작','','Task','2026-08-07 15:08:48'),(140,1,'OBJECT_DETECTED','물체 감지','물체: plastic / 신뢰도: 0.55','Detect','2026-08-07 15:08:52'),(141,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-07 15:08:52'),(142,1,'OBJECT_PICKUP_SUCCESS','수거 성공','','Task','2026-08-07 15:09:54'),(143,1,'PATROL_RESUME','순찰 재개','','Task','2026-08-07 15:09:54'),(144,1,'OBJECT_DETECTED','물체 감지','물체: plastic / 신뢰도: 0.45','Detect','2026-08-07 15:10:15'),(145,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-07 15:10:15'),(146,1,'OBJECT_PICKUP_SUCCESS','수거 성공','','Task','2026-08-07 15:11:37'),(147,1,'PATROL_RESUME','순찰 재개','','Task','2026-08-07 15:11:37'),(148,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.43','Detect','2026-08-07 15:12:41'),(149,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-07 15:12:41'),(150,1,'PATROL_START','순찰 시작','','Task','2026-08-07 15:20:51'),(151,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-07 15:23:29'),(152,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-07 15:24:51'),(153,1,'PATROL_START','순찰 시작','','Task','2026-08-07 15:25:16'),(154,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-07 15:30:21'),(155,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-07 15:31:31'),(156,1,'PATROL_START','순찰 시작','','Task','2026-08-07 15:36:31'),(157,1,'PATROL_START','순찰 시작','','Task','2026-08-07 15:39:49'),(158,1,'PATROL_START','순찰 시작','','Task','2026-08-07 15:43:46'),(159,1,'PATROL_START','순찰 시작','','Task','2026-08-07 15:48:36'),(160,1,'PATROL_START','순찰 시작','','Task','2026-08-07 16:45:44'),(161,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.53','Detect','2026-08-07 16:46:10'),(162,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-07 16:46:10'),(163,1,'PATROL_START','순찰 시작','','Task','2026-08-07 16:48:30'),(164,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.53','Detect','2026-08-07 16:48:30'),(165,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-07 16:50:01'),(166,1,'PATROL_START','순찰 시작','','Task','2026-08-07 17:23:50'),(167,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.52','Detect','2026-08-07 17:24:10'),(168,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-07 17:24:10'),(169,1,'PATROL_START','순찰 시작','','Task','2026-08-07 17:26:10'),(170,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.59','Detect','2026-08-07 17:26:23'),(171,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-07 17:26:23'),(172,1,'OBJECT_PICKUP_SUCCESS','수거 성공','','Task','2026-08-07 17:27:41'),(173,1,'PATROL_RESUME','순찰 재개','','Task','2026-08-07 17:27:41'),(174,1,'PATROL_START','순찰 시작','','Task','2026-08-10 10:50:58'),(175,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.63','Detect','2026-08-10 10:51:10'),(176,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 10:51:10'),(177,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-10 10:51:12'),(178,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.63','Detect','2026-08-10 10:51:12'),(179,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 10:51:12'),(180,1,'PATROL_START','순찰 시작','','Task','2026-08-10 10:52:49'),(181,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.54','Detect','2026-08-10 10:53:00'),(182,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 10:53:00'),(183,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-10 10:53:10'),(184,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.45','Detect','2026-08-10 10:53:30'),(185,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 10:53:30'),(186,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.56','Detect','2026-08-10 10:59:13'),(187,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 10:59:13'),(188,1,'PATROL_START','순찰 시작','','Task','2026-08-10 10:59:14'),(189,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.65','Detect','2026-08-10 10:59:14'),(190,1,'PATROL_START','순찰 시작','','Task','2026-08-10 10:59:58'),(191,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.47','Detect','2026-08-10 11:00:10'),(192,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 11:00:10'),(193,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-10 11:00:24'),(194,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-10 11:00:40'),(195,1,'PATROL_START','순찰 시작','','Task','2026-08-10 11:00:45'),(196,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-10 11:00:50'),(197,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-10 11:00:56'),(198,1,'PATROL_START','순찰 시작','','Task','2026-08-10 12:12:56'),(199,1,'PATROL_START','순찰 시작','','Task','2026-08-10 12:21:19'),(200,1,'PATROL_START','순찰 시작','','Task','2026-08-10 12:46:17'),(201,1,'OBJECT_DETECTED','물체 감지','물체: plastic / 신뢰도: 0.47','Detect','2026-08-10 12:46:29'),(202,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 12:46:29'),(203,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-10 12:46:34'),(204,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.53','Detect','2026-08-10 12:46:34'),(205,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 12:46:34'),(206,1,'PATROL_START','순찰 시작','','Task','2026-08-10 12:55:06'),(207,1,'OBJECT_DETECTED','물체 감지','물체: plastic / 신뢰도: 0.43','Detect','2026-08-10 12:55:54'),(208,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 12:55:54'),(209,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-10 12:55:59'),(210,1,'OBJECT_DETECTED','물체 감지','물체: plastic / 신뢰도: 0.55','Detect','2026-08-10 12:55:59'),(211,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 12:55:59'),(212,1,'PATROL_START','순찰 시작','','Task','2026-08-10 13:50:26'),(213,1,'OBJECT_DETECTED','물체 감지','물체: plastic / 신뢰도: 0.42','Detect','2026-08-10 13:50:38'),(214,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 13:50:38'),(215,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-10 13:50:41'),(216,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.45','Detect','2026-08-10 13:50:41'),(217,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 13:50:41'),(218,1,'PATROL_START','순찰 시작','','Task','2026-08-10 13:55:35'),(219,1,'OBJECT_DETECTED','물체 감지','물체: plastic / 신뢰도: 0.40','Detect','2026-08-10 13:55:45'),(220,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 13:55:45'),(221,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-10 13:55:50'),(222,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-10 13:56:02'),(223,1,'PATROL_START','순찰 시작','','Task','2026-08-10 13:56:04'),(224,1,'PATROL_START','순찰 시작','','Task','2026-08-10 13:56:06'),(225,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-10 13:56:32'),(226,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-10 13:56:55'),(227,1,'PATROL_START','순찰 시작','','Task','2026-08-10 13:57:08'),(228,1,'OBJECT_DETECTED','물체 감지','물체: plastic / 신뢰도: 0.41','Detect','2026-08-10 13:57:23'),(229,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 13:57:23'),(230,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-10 13:57:38'),(231,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-10 13:57:55'),(232,1,'PATROL_START','순찰 시작','','Task','2026-08-10 14:15:20'),(233,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.47','Detect','2026-08-10 14:15:29'),(234,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 14:15:29'),(235,1,'PATROL_START','순찰 시작','','Task','2026-08-10 14:34:12'),(236,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.77','Detect','2026-08-10 14:34:25'),(237,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 14:34:25'),(238,1,'PATROL_START','순찰 시작','','Task','2026-08-10 14:36:16'),(239,1,'OBJECT_DETECTED','물체 감지','물체: plastic / 신뢰도: 0.46','Detect','2026-08-10 14:36:30'),(240,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 14:36:30'),(241,1,'PATROL_START','순찰 시작','','Task','2026-08-10 14:45:16'),(242,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.40','Detect','2026-08-10 14:45:30'),(243,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 14:45:30'),(244,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-10 14:45:39'),(245,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-10 14:46:21'),(246,1,'PATROL_START','순찰 시작','','Task','2026-08-10 14:54:59'),(247,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.43','Detect','2026-08-10 14:55:11'),(248,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 14:55:12'),(249,1,'PATROL_START','순찰 시작','','Task','2026-08-10 14:56:47'),(250,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.40','Detect','2026-08-10 14:57:01'),(251,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 14:57:01'),(252,1,'PATROL_START','순찰 시작','','Task','2026-08-10 15:07:41'),(253,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.55','Detect','2026-08-10 15:07:53'),(254,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 15:07:53'),(255,1,'OBJECT_PICKUP_SUCCESS','수거 성공','','Task','2026-08-10 15:09:04'),(256,1,'PATROL_RESUME','순찰 재개','','Task','2026-08-10 15:09:04'),(257,1,'OBJECT_DETECTED','물체 감지','물체: plastic / 신뢰도: 0.44','Detect','2026-08-10 15:09:13'),(258,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-10 15:09:13'),(259,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-10 15:09:18'),(260,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-10 15:09:47'),(261,1,'PATROL_START','순찰 시작','','Task','2026-08-10 15:09:53'),(262,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-10 15:10:00'),(263,1,'PATROL_START','순찰 시작','','Task','2026-08-11 10:06:52'),(264,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.52','Detect','2026-08-11 10:07:03'),(265,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-11 10:07:04'),(266,1,'PATROL_START','순찰 시작','','Task','2026-08-11 10:13:51'),(267,1,'PATROL_START','순찰 시작','','Task','2026-08-11 10:17:21'),(268,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-11 10:20:10'),(269,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-11 10:20:15'),(270,1,'PATROL_START','순찰 시작','','Task','2026-08-11 10:20:32'),(271,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-11 10:20:33'),(272,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-11 10:20:34'),(273,1,'PATROL_START','순찰 시작','','Task','2026-08-11 10:21:42'),(274,1,'PATROL_START','순찰 시작','','Task','2026-08-11 10:24:59'),(275,1,'PATROL_START','순찰 시작','','Task','2026-08-11 10:27:38'),(276,1,'PATROL_START','순찰 시작','','Task','2026-08-11 10:31:10'),(277,1,'PATROL_START','순찰 시작','','Task','2026-08-11 10:33:58'),(278,1,'PATROL_START','순찰 시작','','Task','2026-08-11 10:37:01'),(279,1,'BATTERY_LOW','배터리 경고','배터리가 30% 이하','WARNING','2026-08-11 10:37:40'),(280,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-11 10:37:40'),(281,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-11 10:38:14'),(282,1,'PATROL_START','순찰 시작','','Task','2026-08-11 10:48:45'),(283,1,'PATROL_START','순찰 시작','','Task','2026-08-11 10:52:12'),(284,1,'PATROL_START','순찰 시작','','Task','2026-08-11 10:55:26'),(285,1,'PATROL_START','순찰 시작','','Task','2026-08-11 10:58:15'),(286,1,'PATROL_START','순찰 시작','','Task','2026-08-11 11:02:18'),(287,1,'BATTERY_LOW','배터리 경고','배터리가 30% 이하','WARNING','2026-08-11 11:04:06'),(288,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-11 11:04:37'),(289,1,'PATROL_START','순찰 시작','','Task','2026-08-12 10:08:26'),(290,1,'PATROL_START','순찰 시작','','Task','2026-08-12 10:39:58'),(291,1,'PATROL_START','순찰 시작','','Task','2026-08-12 10:41:45'),(292,1,'PATROL_START','순찰 시작','','Task','2026-08-12 10:43:14'),(293,1,'PATROL_START','순찰 시작','','Task','2026-08-12 11:20:57'),(294,1,'PATROL_START','순찰 시작','','Task','2026-08-12 11:31:47'),(295,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-12 11:33:52'),(296,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-12 11:34:28'),(297,1,'PATROL_START','순찰 시작','','Task','2026-08-12 11:34:38'),(298,1,'PATROL_START','순찰 시작','','Task','2026-08-13 11:14:05'),(299,1,'PATROL_START','순찰 시작','','Task','2026-08-13 11:24:17'),(300,1,'PATROL_START','순찰 시작','','Task','2026-08-13 11:27:30'),(301,1,'PATROL_START','순찰 시작','','Task','2026-08-13 11:31:18'),(302,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-13 11:32:31'),(303,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-13 11:33:11'),(304,1,'PATROL_START','순찰 시작','','Task','2026-08-13 11:51:15'),(305,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-13 11:51:59'),(306,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-13 11:52:40'),(307,1,'PATROL_START','순찰 시작','','Task','2026-08-13 12:33:57'),(308,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-13 12:35:35'),(309,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-13 12:36:10'),(310,1,'PATROL_START','순찰 시작','','Task','2026-08-13 12:40:11'),(311,1,'PATROL_START','순찰 시작','','Task','2026-08-20 10:55:59'),(312,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.67','Detect','2026-08-20 10:56:00'),(313,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-20 10:56:00'),(314,1,'PATROL_START','순찰 시작','','Task','2026-08-20 10:57:14'),(315,1,'OBJECT_DETECTED','물체 감지','물체: plastic / 신뢰도: 0.40','Detect','2026-08-20 10:57:41'),(316,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-20 10:57:41'),(317,1,'PATROL_START','순찰 시작','','Task','2026-08-20 10:59:53'),(318,1,'OBJECT_DETECTED','물체 감지','물체: plastic / 신뢰도: 0.64','Detect','2026-08-20 10:59:55'),(319,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-20 10:59:55'),(320,1,'PATROL_START','순찰 시작','','Task','2026-08-20 11:00:04'),(321,1,'PATROL_START','순찰 시작','','Task','2026-08-20 14:15:26');
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
INSERT INTO `map` VALUES (1,'map2','/image/map/map2.jpg',0.05,-1.38,-3.16,0,99,67,1,'2026-07-31 10:03:49','2026-08-04 15:13:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='물체 수거 로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recyclehistory`
--

LOCK TABLES `recyclehistory` WRITE;
/*!40000 ALTER TABLE `recyclehistory` DISABLE KEYS */;
INSERT INTO `recyclehistory` VALUES (1,'Plastic','Success','2026-07-19 20:08:29'),(2,'Can','Success','2026-07-19 20:08:38'),(3,'Paper','Success','2026-07-19 20:08:51'),(4,'Plastic','Success','2026-07-20 20:08:29'),(5,'Can','Success','2026-07-20 20:08:38'),(6,'Paper','Success','2026-07-20 20:08:51'),(7,'Plastic','Success','2026-07-20 20:08:29'),(8,'Can','Success','2026-07-20 20:08:38'),(9,'Paper','Success','2026-07-20 20:08:51'),(10,'Plastic','Success','2026-07-20 20:08:29'),(11,'Can','Fail','2026-07-20 20:08:38'),(12,'Paper','Fail','2026-07-20 20:08:51'),(13,'Plastic','Fail','2026-07-20 20:08:29'),(14,'Can','Fail','2026-07-20 20:08:38'),(15,'Paper','Success','2026-07-20 20:08:51'),(16,'Plastic','Success','2026-07-20 20:08:29'),(17,'Can','Success','2026-07-20 20:08:38'),(18,'Paper','Fail','2026-07-20 20:08:51'),(19,'Plastic','Success','2026-07-21 20:08:29'),(20,'Can','Success','2026-07-21 20:08:38'),(21,'Paper','Success','2026-07-21 20:08:51'),(22,'Plastic','True','2026-07-21 20:08:29'),(23,'Can','True','2026-07-21 20:08:38'),(24,'Plastic','True','2026-07-21 20:08:51'),(25,'Plastic','True','2026-07-21 20:08:29'),(26,'Can','True','2026-07-21 20:08:38'),(27,'Plastic','True','2026-07-21 20:08:51'),(28,'Plastic','True','2026-07-21 20:08:29'),(29,'Can','True','2026-07-21 20:08:38'),(30,'Plastic','True','2026-07-21 20:08:51'),(31,'Plastic','True','2026-07-21 20:08:29'),(32,'Can','True','2026-07-21 20:08:38'),(33,'Plastic','True','2026-07-21 20:08:51'),(34,'Plastic','True','2026-07-23 20:08:29'),(35,'Can','True','2026-07-21 20:08:38'),(36,'Plastic','True','2026-07-23 20:08:51'),(37,'Plastic','True','2026-07-23 20:08:29'),(38,'Can','True','2026-07-21 20:08:38'),(39,'Plastic','True','2026-07-23 20:08:51'),(40,'Plastic','True','2026-07-23 20:08:29'),(41,'Can','True','2026-07-21 20:08:38'),(42,'Plastic','True','2026-07-23 20:08:51'),(43,'Paper','True','2026-07-23 20:08:29'),(44,'Can','True','2026-07-21 20:08:38'),(45,'Plastic','True','2026-07-23 20:08:51'),(46,'Paper','True','2026-08-05 20:08:29'),(47,'Can','True','2026-08-05 20:08:38'),(48,'Plastic','True','2026-08-05 20:08:51'),(49,'plastic','Success','2026-08-07 15:05:22'),(50,'plastic','Success','2026-08-07 15:08:52'),(51,'plastic','Success','2026-08-07 15:10:15'),(52,'can','Success','2026-08-07 15:12:40'),(53,'can','Success','2026-08-07 16:46:10'),(54,'can','Success','2026-08-07 16:48:30'),(55,'can','Success','2026-08-07 17:24:10'),(56,'can','Success','2026-08-07 17:26:23'),(57,'can','Success','2026-08-10 10:51:10'),(58,'can','Success','2026-08-10 10:51:12'),(59,'can','Success','2026-08-10 10:53:00'),(60,'can','Success','2026-08-10 10:53:30'),(61,'can','Success','2026-08-10 10:59:13'),(62,'can','Success','2026-08-10 10:59:14'),(63,'can','Success','2026-08-10 11:00:10'),(64,'plastic','Success','2026-08-10 12:46:29'),(65,'can','Success','2026-08-10 12:46:34'),(66,'plastic','Success','2026-08-10 12:55:54'),(67,'plastic','Success','2026-08-10 12:55:59'),(68,'plastic','Success','2026-08-10 13:50:38'),(69,'can','Success','2026-08-10 13:50:41'),(70,'plastic','Success','2026-08-10 13:55:45'),(71,'plastic','Success','2026-08-10 13:57:23'),(72,'can','Success','2026-08-10 15:09:04');
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
  `startDestinationX` double DEFAULT NULL,
  `startDestinationY` double DEFAULT NULL,
  `goalDestinationX` double DEFAULT NULL,
  `goalDestinationY` double DEFAULT NULL,
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
INSERT INTO `robotstatus` VALUES (1,1,'state','Running',2.5751559750070494,-0.49261352413152526,3,-2.5,'2026-08-03 10:51:19','2026-08-20 14:16:51');
/*!40000 ALTER TABLE `robotstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `scheduleId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `scheduleName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `scheduleDate` date NOT NULL,
  `executionTime` time NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `task` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '"대기"',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'SCH001','오전 수거 시작','2026-08-22','09:00:00','WAIT','쓰레기 수거 시작','지정된 시간에 로봇 쓰레기 수거 작업을 자동으로 시작합니다.'),(2,'SCH001','오전 수거 시작','2026-08-21','12:30:00','WAIT','쓰레기 수거 시작','지정된 시간에 로봇 쓰레기 수거 작업을 자동으로 시작합니다.'),(10,'SCH001','집가기','2026-08-18','12:00:00','WAIT','쓰레기 수거 시작','ㅁㄴㅇㄹ'),(11,'SCH001','ㅁㄴㅇ','2026-08-18','12:00:00','WAIT','쓰레기 수거 시작','지정된 시간에 로봇 쓰레기 수거 작업을 자동으로 시작합니다.'),(13,'SCH001','ㅁㄴㅇㄹ','2026-08-18','12:00:00','WAIT','쓰레기 수거 시작','');
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
-- Table structure for table `voicecommand`
--

DROP TABLE IF EXISTS `voicecommand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voicecommand` (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `command` text NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voicecommand`
--

LOCK TABLES `voicecommand` WRITE;
/*!40000 ALTER TABLE `voicecommand` DISABLE KEYS */;
INSERT INTO `voicecommand` VALUES (1,'오전 9시에 수거 시작 등록해줘','2026-08-21 15:08:05');
/*!40000 ALTER TABLE `voicecommand` ENABLE KEYS */;
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

-- Dump completed on 2026-08-21 16:00:16
