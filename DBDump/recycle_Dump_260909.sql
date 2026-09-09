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
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='이벤트 로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventlog`
--

LOCK TABLES `eventlog` WRITE;
/*!40000 ALTER TABLE `eventlog` DISABLE KEYS */;
INSERT INTO `eventlog` VALUES (121,1,'PATROL_START','순찰 시작','','Task','2026-08-04 10:45:05'),(122,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-04 10:46:45'),(123,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-04 10:49:38'),(124,1,'PATROL_START','순찰 시작','','Task','2026-08-04 11:00:01'),(125,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-04 11:00:17'),(126,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-04 11:00:31'),(127,1,'PATROL_START','순찰 시작','','Task','2026-08-04 11:01:19'),(128,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-04 11:01:44'),(129,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-04 11:01:59'),(130,1,'PATROL_START','순찰 시작','','Task','2026-08-04 11:19:08'),(131,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-04 11:19:16'),(132,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-04 11:19:24'),(133,1,'PATROL_START','순찰 시작','','Task','2026-08-04 12:31:03'),(134,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-08-04 12:31:04'),(135,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-04 12:31:04'),(136,1,'PATROL_START','순찰 시작','','Task','2026-08-24 11:46:30'),(137,1,'PATROL_START','순찰 시작','','Task','2026-08-24 11:49:27'),(138,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.78','Detect','2026-08-24 11:59:23'),(139,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-24 11:59:23'),(140,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.49','Detect','2026-08-24 11:59:43'),(141,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-24 11:59:43'),(142,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.74','Detect','2026-08-24 12:02:33'),(143,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-24 12:02:33'),(144,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.70','Detect','2026-08-24 12:02:56'),(145,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-24 12:02:56'),(146,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-24 12:05:58'),(147,1,'PATROL_START','순찰 시작','','Task','2026-08-24 17:04:24'),(148,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.60','Detect','2026-08-24 17:04:41'),(149,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-24 17:04:41'),(150,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.83','Detect','2026-08-24 17:04:57'),(151,1,'PATROL_START','순찰 시작','','Task','2026-08-24 17:07:49'),(152,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.54','Detect','2026-08-24 17:08:06'),(153,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-24 17:08:06'),(154,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.60','Detect','2026-08-24 17:08:27'),(155,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.91','Detect','2026-08-24 17:08:29'),(156,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-24 17:08:29'),(157,1,'PATROL_START','순찰 시작','','Task','2026-08-24 17:11:53'),(158,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.79','Detect','2026-08-24 17:12:09'),(159,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-24 17:12:09'),(160,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.54','Detect','2026-08-24 17:12:36'),(161,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-24 17:12:36'),(162,1,'PATROL_START','순찰 시작','','Task','2026-08-25 10:39:55'),(163,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.72','Detect','2026-08-25 10:40:10'),(164,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-25 10:40:10'),(165,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.51','Detect','2026-08-25 10:40:36'),(166,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-25 10:40:36'),(167,1,'OBJECT_PICKUP_SUCCESS','수거 성공','','Task','2026-08-25 11:18:08'),(168,1,'PATROL_RESUME','순찰 재개','','Task','2026-08-25 11:18:08'),(169,1,'OBJECT_PICKUP_FAIL','분리수거 실패','','Error','2026-08-25 11:30:19'),(170,1,'PATROL_START','순찰 시작','','Task','2026-08-25 11:31:31'),(171,1,'OBJECT_PICKUP_SUCCESS','수거 성공','','Task','2026-08-25 11:34:30'),(172,1,'PATROL_RESUME','순찰 재개','','Task','2026-08-25 11:34:30'),(173,1,'OBJECT_PICKUP_SUCCESS','수거 성공','','Task','2026-08-25 11:38:39'),(174,1,'PATROL_RESUME','순찰 재개','','Task','2026-08-25 11:38:39'),(175,1,'OBJECT_PICKUP_SUCCESS','수거 성공','','Task','2026-08-25 11:42:18'),(176,1,'PATROL_RESUME','순찰 재개','','Task','2026-08-25 11:42:18'),(177,1,'PATROL_START','순찰 시작','','Task','2026-08-25 11:46:01'),(178,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-08-25 11:48:36'),(179,1,'PATROL_START','순찰 시작','','Task','2026-08-26 10:07:58'),(180,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.81','Detect','2026-08-26 10:08:16'),(181,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-26 10:08:16'),(182,1,'PATROL_START','순찰 시작','','Task','2026-08-26 10:12:47'),(183,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.76','Detect','2026-08-26 10:13:08'),(184,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-26 10:13:08'),(185,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.58','Detect','2026-08-26 10:13:28'),(186,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-26 10:13:28'),(187,1,'PATROL_START','순찰 시작','','Task','2026-08-26 10:15:37'),(188,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.58','Detect','2026-08-26 10:15:57'),(189,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-26 10:15:57'),(190,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.84','Detect','2026-08-26 10:16:32'),(191,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-26 10:16:32'),(192,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-26 10:22:10'),(193,1,'OBJECT_PICKUP_FAIL','분리수거 실패','','Error','2026-08-26 10:22:36'),(194,1,'PATROL_START','순찰 시작','','Task','2026-08-26 10:25:59'),(195,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.56','Detect','2026-08-26 10:26:18'),(196,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-26 10:26:18'),(197,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.80','Detect','2026-08-26 10:26:34'),(198,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.73','Detect','2026-08-26 10:28:06'),(199,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-26 10:28:06'),(200,1,'PATROL_START','순찰 시작','','Task','2026-08-26 10:29:41'),(201,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.80','Detect','2026-08-26 10:30:02'),(202,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-26 10:30:02'),(203,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.74','Detect','2026-08-26 10:30:19'),(204,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-26 10:30:19'),(205,1,'OBJECT_DETECTED','물체 감지','물체: paper / 신뢰도: 0.52','Detect','2026-08-27 08:05:53'),(206,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-27 08:05:53'),(207,1,'OBJECT_DETECTED','물체 감지','물체: paper / 신뢰도: 0.83','Detect','2026-08-27 08:09:57'),(208,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-27 08:09:57'),(209,1,'OBJECT_DETECTED','물체 감지','물체: paper / 신뢰도: 0.66','Detect','2026-08-27 08:10:14'),(210,1,'OBJECT_DETECTED','물체 감지','물체: paper / 신뢰도: 0.46','Detect','2026-08-27 08:22:09'),(211,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-27 08:22:09'),(212,1,'OBJECT_DETECTED','물체 감지','물체: paper / 신뢰도: 0.79','Detect','2026-08-27 08:22:21'),(213,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-27 08:22:21'),(214,1,'OBJECT_DETECTED','물체 감지','물체: paper / 신뢰도: 0.83','Detect','2026-08-27 08:22:38'),(215,1,'PATROL_START','순찰 시작','','Task','2026-08-28 01:16:49'),(216,1,'PATROL_START','순찰 시작','','Task','2026-08-28 01:17:37'),(217,1,'OBJECT_DETECTED','물체 감지','물체: paper / 신뢰도: 0.49','Detect','2026-08-28 01:17:41'),(218,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-28 01:17:41'),(219,1,'PATROL_START','순찰 시작','','Task','2026-08-28 01:20:15'),(220,1,'OBJECT_DETECTED','물체 감지','물체: paper / 신뢰도: 0.58','Detect','2026-08-28 01:20:19'),(221,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-28 01:20:19'),(222,1,'OBJECT_DETECTED','물체 감지','물체: paper / 신뢰도: 0.67','Detect','2026-08-28 01:20:27'),(223,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-28 01:20:27'),(224,1,'PATROL_START','순찰 시작','','Task','2026-08-28 01:25:03'),(225,1,'OBJECT_DETECTED','물체 감지','물체: paper / 신뢰도: 0.73','Detect','2026-08-28 01:25:21'),(226,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-28 01:25:21'),(227,1,'OBJECT_DETECTED','물체 감지','물체: paper / 신뢰도: 0.80','Detect','2026-08-28 01:25:47'),(228,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-28 01:25:47'),(229,1,'PATROL_START','순찰 시작','','Task','2026-08-28 01:35:55'),(230,1,'OBJECT_DETECTED','물체 감지','물체: paper / 신뢰도: 0.83','Detect','2026-08-28 01:36:11'),(231,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-08-28 01:36:11'),(232,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-01 10:39:50'),(233,1,'PATROL_START','순찰 시작','','Task','2026-09-01 10:41:02'),(234,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.69','Detect','2026-09-01 10:41:24'),(235,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-09-01 10:41:24'),(236,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.84','Detect','2026-09-01 10:41:52'),(237,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-09-01 10:41:53'),(238,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 09:17:16'),(239,1,'PATROL_START','순찰 시작','','Task','2026-09-03 09:17:16'),(240,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.87','Detect','2026-09-03 09:17:23'),(241,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-09-03 09:17:23'),(242,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 09:18:39'),(243,1,'PATROL_START','순찰 시작','','Task','2026-09-03 09:18:39'),(244,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 09:22:09'),(245,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 09:22:31'),(246,1,'PATROL_START','순찰 시작','','Task','2026-09-03 09:22:31'),(247,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 09:26:18'),(248,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 09:26:25'),(249,1,'PATROL_START','순찰 시작','','Task','2026-09-03 09:26:25'),(250,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 09:29:13'),(251,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 09:29:22'),(252,1,'PATROL_START','순찰 시작','','Task','2026-09-03 09:29:22'),(253,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-09-03 09:29:43'),(254,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 09:29:57'),(255,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 09:30:15'),(256,1,'PATROL_START','순찰 시작','','Task','2026-09-03 09:30:15'),(257,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-09-03 09:30:55'),(258,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 09:31:47'),(259,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 09:32:03'),(260,1,'PATROL_START','순찰 시작','','Task','2026-09-03 09:32:03'),(261,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 09:38:39'),(262,1,'PATROL_START','순찰 시작','','Task','2026-09-03 09:38:41'),(263,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 09:41:54'),(264,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 09:42:01'),(265,1,'PATROL_START','순찰 시작','','Task','2026-09-03 09:42:08'),(266,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 09:45:49'),(267,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 09:46:46'),(268,1,'PATROL_START','순찰 시작','','Task','2026-09-03 09:46:49'),(269,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 09:51:38'),(270,1,'PATROL_START','순찰 시작','','Task','2026-09-03 09:51:42'),(271,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 09:52:27'),(272,1,'PATROL_START','순찰 시작','','Task','2026-09-03 09:52:31'),(273,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 09:53:23'),(274,1,'PATROL_START','순찰 시작','','Task','2026-09-03 09:53:26'),(275,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 09:56:58'),(276,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 10:23:39'),(277,1,'PATROL_START','순찰 시작','','Task','2026-09-03 10:23:41'),(278,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 10:26:37'),(279,1,'PATROL_START','순찰 시작','','Task','2026-09-03 10:26:38'),(280,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 10:27:56'),(281,1,'PATROL_START','순찰 시작','','Task','2026-09-03 10:27:57'),(282,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-09-03 10:28:28'),(283,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 10:52:01'),(284,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 10:53:02'),(285,1,'PATROL_START','순찰 시작','','Task','2026-09-03 10:56:04'),(286,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 10:59:02'),(287,1,'PATROL_START','순찰 시작','','Task','2026-09-03 10:59:05'),(288,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-09-03 10:59:33'),(289,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 11:00:01'),(290,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 11:02:02'),(291,1,'PATROL_START','순찰 시작','','Task','2026-09-03 11:02:05'),(292,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 11:04:39'),(293,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 11:36:27'),(294,1,'PATROL_START','순찰 시작','','Task','2026-09-03 11:36:28'),(295,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-09-03 11:37:53'),(296,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 11:38:37'),(297,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 11:39:34'),(298,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 11:43:22'),(299,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 11:48:55'),(300,1,'PATROL_START','순찰 시작','','Task','2026-09-03 11:48:56'),(301,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 11:51:41'),(302,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 11:53:12'),(303,1,'PATROL_START','순찰 시작','','Task','2026-09-03 11:53:12'),(304,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 14:03:48'),(305,1,'PATROL_START','순찰 시작','','Task','2026-09-03 14:03:51'),(306,1,'USER_COMMAND','사용자 명령','순찰 종료','Task','2026-09-03 14:05:33'),(307,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 14:06:27'),(308,1,'PATROL_START','순찰 시작','','Task','2026-09-03 14:07:05'),(309,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 14:11:00'),(310,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 14:14:45'),(311,1,'PATROL_START','순찰 시작','','Task','2026-09-03 14:14:49'),(312,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 14:17:32'),(313,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 14:17:42'),(314,1,'PATROL_START','순찰 시작','','Task','2026-09-03 14:17:47'),(315,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 14:20:33'),(316,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 14:21:02'),(317,1,'PATROL_START','순찰 시작','','Task','2026-09-03 14:21:04'),(318,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 14:23:49'),(319,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 14:23:51'),(320,1,'PATROL_START','순찰 시작','','Task','2026-09-03 14:23:55'),(321,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 14:27:12'),(322,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 14:27:21'),(323,1,'PATROL_START','순찰 시작','','Task','2026-09-03 14:27:24'),(324,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 14:29:10'),(325,1,'PATROL_START','순찰 시작','','Task','2026-09-03 14:29:16'),(326,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 14:32:55'),(327,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 14:34:22'),(328,1,'PATROL_START','순찰 시작','','Task','2026-09-03 14:34:25'),(329,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 14:36:57'),(330,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 14:37:09'),(331,1,'PATROL_START','순찰 시작','','Task','2026-09-03 14:37:16'),(332,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 14:40:20'),(333,1,'PATROL_START','순찰 시작','','Task','2026-09-03 14:41:43'),(334,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 14:44:43'),(335,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 14:45:06'),(336,1,'PATROL_START','순찰 시작','','Task','2026-09-03 14:45:12'),(337,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-03 14:46:22'),(338,1,'PATROL_START','순찰 시작','','Task','2026-09-03 14:46:25'),(339,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-03 14:49:57'),(340,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-08 12:13:54'),(341,1,'PATROL_START','순찰 시작','','Task','2026-09-08 12:13:55'),(342,1,'PATROL_START','순찰 시작','','Task','2026-09-08 12:14:03'),(343,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-08 12:14:03'),(344,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.50','Detect','2026-09-08 12:14:04'),(345,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-09-08 12:14:05'),(346,1,'PATROL_COMPLETE','순찰 종료','','Task','2026-09-08 12:15:26'),(347,1,'PATROL_PREPARE','순찰 준비','','Task','2026-09-08 12:15:38'),(348,1,'PATROL_START','순찰 시작','','Task','2026-09-08 12:15:45'),(349,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.87','Detect','2026-09-08 12:16:01'),(350,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-09-08 12:16:01'),(351,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.85','Detect','2026-09-08 12:16:21'),(352,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-09-08 12:16:22'),(353,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.83','Detect','2026-09-08 12:16:53'),(354,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-09-08 12:16:53'),(355,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.72','Detect','2026-09-08 12:29:21'),(356,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-09-08 12:29:21'),(357,1,'OBJECT_DETECTED','물체 감지','물체: can / 신뢰도: 0.54','Detect','2026-09-08 12:30:00'),(358,1,'OBJECT_PICKUP_START','수거 시작','','Task','2026-09-08 12:30:00');
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
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='물체 수거 로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recyclehistory`
--

LOCK TABLES `recyclehistory` WRITE;
/*!40000 ALTER TABLE `recyclehistory` DISABLE KEYS */;
INSERT INTO `recyclehistory` VALUES (1,'Plastic','Success','2026-07-19 20:08:29'),(2,'Can','Success','2026-07-19 20:08:38'),(3,'Paper','Success','2026-07-19 20:08:51'),(4,'Plastic','Success','2026-07-20 20:08:29'),(5,'Can','Success','2026-07-20 20:08:38'),(6,'Paper','Success','2026-07-20 20:08:51'),(7,'Plastic','Success','2026-07-20 20:08:29'),(8,'Can','Success','2026-07-20 20:08:38'),(9,'Paper','Success','2026-07-20 20:08:51'),(10,'Plastic','Success','2026-07-20 20:08:29'),(11,'Can','Fail','2026-07-20 20:08:38'),(12,'Paper','Fail','2026-07-20 20:08:51'),(13,'Plastic','Fail','2026-07-20 20:08:29'),(14,'Can','Fail','2026-07-20 20:08:38'),(15,'Paper','Success','2026-07-20 20:08:51'),(16,'Plastic','Success','2026-07-20 20:08:29'),(17,'Can','Success','2026-07-20 20:08:38'),(18,'Paper','Fail','2026-07-20 20:08:51'),(19,'Plastic','Success','2026-07-21 20:08:29'),(20,'Can','Success','2026-07-21 20:08:38'),(21,'Paper','Success','2026-07-21 20:08:51'),(22,'Plastic','True','2026-07-21 20:08:29'),(23,'Can','True','2026-07-21 20:08:38'),(24,'Plastic','True','2026-07-21 20:08:51'),(25,'Plastic','True','2026-07-21 20:08:29'),(26,'Can','True','2026-07-21 20:08:38'),(27,'Plastic','True','2026-07-21 20:08:51'),(28,'Plastic','True','2026-07-21 20:08:29'),(29,'Can','True','2026-07-21 20:08:38'),(30,'Plastic','True','2026-07-21 20:08:51'),(31,'Plastic','True','2026-07-21 20:08:29'),(32,'Can','True','2026-07-21 20:08:38'),(33,'Plastic','True','2026-07-21 20:08:51'),(34,'Plastic','True','2026-07-23 20:08:29'),(35,'Can','True','2026-07-21 20:08:38'),(36,'Plastic','True','2026-07-23 20:08:51'),(37,'Plastic','True','2026-07-23 20:08:29'),(38,'Can','True','2026-07-21 20:08:38'),(39,'Plastic','True','2026-07-23 20:08:51'),(40,'Plastic','True','2026-07-23 20:08:29'),(41,'Can','True','2026-07-21 20:08:38'),(42,'Plastic','True','2026-07-23 20:08:51'),(43,'Paper','True','2026-07-23 20:08:29'),(44,'Can','True','2026-07-21 20:08:38'),(45,'Plastic','True','2026-07-23 20:08:51'),(46,'Paper','True','2026-08-05 20:08:29'),(47,'Can','True','2026-08-05 20:08:38'),(48,'Plastic','True','2026-08-05 20:08:51'),(49,'plastic','Success','2026-08-07 15:05:22'),(50,'plastic','Success','2026-08-07 15:08:52'),(51,'plastic','Success','2026-08-07 15:10:15'),(52,'can','Success','2026-08-07 15:12:40'),(53,'can','Success','2026-08-07 16:46:10'),(54,'can','Success','2026-08-07 16:48:30'),(55,'can','Success','2026-08-07 17:24:10'),(56,'can','Success','2026-08-07 17:26:23'),(57,'can','Success','2026-08-10 10:51:10'),(58,'can','Success','2026-08-10 10:51:12'),(59,'can','Success','2026-08-10 10:53:00'),(60,'can','Success','2026-08-10 10:53:30'),(61,'can','Success','2026-08-10 10:59:13'),(62,'can','Success','2026-08-10 10:59:14'),(63,'can','Success','2026-08-10 11:00:10'),(64,'plastic','Success','2026-08-10 12:46:29'),(65,'can','Success','2026-08-10 12:46:34'),(66,'plastic','Success','2026-08-10 12:55:54'),(67,'plastic','Success','2026-08-10 12:55:59'),(68,'plastic','Success','2026-08-10 13:50:38'),(69,'can','Success','2026-08-10 13:50:41'),(70,'plastic','Success','2026-08-10 13:55:45'),(71,'plastic','Success','2026-08-10 13:57:23'),(72,'can','Success','2026-08-10 15:09:04'),(73,'can','Success','2026-09-08 12:14:04'),(74,'can','Success','2026-09-08 12:16:01'),(75,'can','Success','2026-09-08 12:16:21'),(76,'can','Success','2026-09-08 12:16:53'),(77,'can','Success','2026-09-08 12:29:21'),(78,'can','Success','2026-09-08 12:30:00');
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
  `connect` varchar(100) DEFAULT NULL,
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `robotId` bigint NOT NULL,
  `eventType` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
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
INSERT INTO `robotstatus` VALUES ('CONNECT',1,1,'state','Stop',0,0,'2026-08-03 10:51:19','2026-09-09 11:39:23');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'SCH001','오전 수거 시작','2026-09-02','10:00:00','WAIT','쓰레기 수거 시작','지정된 시간에 로봇 쓰레기 수거 작업을 자동으로 시작합니다.'),(2,'SCH001','오전 수거 시작','2026-09-02','13:00:00','COMPLETE','쓰레기 수거 시작','지정된 시간에 로봇 쓰레기 수거 작업을 자동으로 시작합니다.'),(10,'SCH001','오전 수거 시작','2026-09-03','09:42:00','COMPLETE','쓰레기 수거 시작','지정된 시간에 로봇 쓰레기 수거 작업을 자동으로 시작합니다.'),(11,'SCH001','오전 수거 시작','2026-09-02','12:00:00','COMPLETE','쓰레기 수거 시작','지정된 시간에 로봇 쓰레기 수거 작업을 자동으로 시작합니다.'),(13,'SCH001','오전 수거 시작','2026-09-02','09:00:00','CANCEL','쓰레기 수거 시작','지정된 시간에 로봇 쓰레기 수거 작업을 자동으로 시작합니다.'),(14,'SCH001','오전 수거 시작','2026-09-03','14:07:00','COMPLETE','쓰레기 수거 시작','123'),(15,'SCH001','오전 수거 시작','2026-09-03','11:02:00','COMPLETE','쓰레기 수거 시작','123'),(16,'SCH001','2026-09-09 1출발 스케줄','2026-09-09','00:00:01','WAIT','쓰레기 수거 시작','지정된 시간에 쓰레기 수거 작업을 자동으로 시작합니다.'),(17,'SCH001','2026-09-09 0출발 스케줄','2026-09-09','00:00:00','WAIT','쓰레기 수거 시작','지정된 시간에 쓰레기 수거 작업을 자동으로 시작합니다.'),(18,'SCH001','2026-09-09 0출발 스케줄','2026-09-09','00:00:00','WAIT','쓰레기 수거 시작','지정된 시간에 쓰레기 수거 작업을 자동으로 시작합니다.'),(19,'SCH001','2026-09-09 00:00출발 스케줄','2026-09-09','00:00:00','WAIT','쓰레기 수거 시작','지정된 시간에 쓰레기 수거 작업을 자동으로 시작합니다.'),(20,'SCH001','2026-09-09 02:00출발 스케줄','2026-09-09','02:00:00','WAIT','쓰레기 수거 시작','지정된 시간에 쓰레기 수거 작업을 자동으로 시작합니다.'),(21,'SCH001','2026-09-09 01:00출발 스케줄','2026-09-09','01:00:00','WAIT','쓰레기 수거 시작','지정된 시간에 쓰레기 수거 작업을 자동으로 시작합니다.'),(22,'SCH001','2026-09-09 00:00출발 스케줄','2026-09-09','00:00:00','WAIT','쓰레기 수거 시작','지정된 시간에 쓰레기 수거 작업을 자동으로 시작합니다.'),(23,'SCH001','2026-09-09 03:00출발 스케줄','2026-09-09','03:00:00','WAIT','쓰레기 수거 시작','지정된 시간에 쓰레기 수거 작업을 자동으로 시작합니다.'),(24,'SCH001','2026-09-09 00:00출발 스케줄','2026-09-09','00:00:00','WAIT','쓰레기 수거 시작','지정된 시간에 쓰레기 수거 작업을 자동으로 시작합니다.'),(25,'SCH001','2026-09-09 00:00출발 스케줄','2026-09-09','00:00:00','WAIT','쓰레기 수거 시작','지정된 시간에 쓰레기 수거 작업을 자동으로 시작합니다.'),(26,'SCH001','2026-09-09 01:00출발 스케줄','2026-09-09','01:00:00','WAIT','쓰레기 수거 시작','지정된 시간에 쓰레기 수거 작업을 자동으로 시작합니다.');
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
  `commandIdx` int NOT NULL,
  `startTime` time DEFAULT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voicecommand`
--

LOCK TABLES `voicecommand` WRITE;
/*!40000 ALTER TABLE `voicecommand` DISABLE KEYS */;
INSERT INTO `voicecommand` VALUES (2,'한 번 찍고 와.',0,NULL,'2026-09-08 10:35:12'),(3,'감사합니다.',0,NULL,'2026-09-08 10:38:35'),(4,'집에 와.',0,NULL,'2026-09-08 10:40:50'),(5,'베이번티',0,NULL,'2026-09-08 10:41:18'),(6,'유리반찍',0,NULL,'2026-09-08 10:41:43'),(7,'1번 찍고 3번 찍고 하',0,NULL,'2026-09-08 10:42:24'),(8,'다행이다.',0,NULL,'2026-09-08 10:44:24'),(9,'한시에 쓰고 시작해',1,'00:00:01','2026-09-09 11:31:11'),(10,'안녕!',1,'00:00:00','2026-09-09 11:31:48'),(11,'고마워요.',1,'00:00:00','2026-09-09 11:34:25'),(12,'하...',1,'00:00:00','2026-09-09 11:35:32'),(13,'2시에 숙고 시작 좀 해줄래?',1,'00:00:00','2026-09-09 11:37:10'),(14,'한시에 수고하시죠?',1,'01:00:00','2026-09-09 11:40:15'),(15,'수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다. 수고하셨습니다.',1,'00:00:00','2026-09-09 11:40:47'),(16,'3시에서',1,'03:00:00','2026-09-09 11:41:18'),(17,'다섯 신수고 시작해',1,'00:00:00','2026-09-09 11:42:10'),(18,'하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하... 하...',1,'00:00:00','2026-09-09 11:43:13'),(19,'일곱 피해 수고하시죠?',1,'01:00:00','2026-09-09 11:45:44');
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

-- Dump completed on 2026-09-09 11:46:28
