-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: swimbusan
-- ------------------------------------------------------
-- Server version	5.7.29-log

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `boardNum` int(11) NOT NULL,
  `userId` varchar(20) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `boardPw` varchar(20) DEFAULT NULL,
  `boardSubject` varchar(50) NOT NULL,
  `boardContent` varchar(2000) NOT NULL,
  `boardFile` varchar(50) DEFAULT NULL,
  `boardRe_ref` int(11) DEFAULT NULL,
  `boardRe_lev` int(11) DEFAULT NULL,
  `boardRe_seq` int(11) DEFAULT NULL,
  `boardCount` int(11) DEFAULT NULL,
  `boardDate` datetime DEFAULT NULL,
  `boardIp` varchar(20) DEFAULT NULL,
  `boardCategory` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`boardNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,1,0,0,4,'2020-05-30 19:03:41','0:0:0:0:0:0:0:1',NULL),(2,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,2,0,0,5,'2020-05-30 19:03:41','0:0:0:0:0:0:0:1',NULL),(3,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,3,0,0,8,'2020-05-30 19:03:41','0:0:0:0:0:0:0:1',NULL),(4,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,4,0,0,2,'2020-05-30 19:03:41','0:0:0:0:0:0:0:1',NULL),(6,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,6,0,0,0,'2020-05-30 19:03:41','0:0:0:0:0:0:0:1',NULL),(7,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,7,0,0,0,'2020-05-30 19:03:41','0:0:0:0:0:0:0:1',NULL),(8,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,8,0,0,0,'2020-05-30 19:03:41','0:0:0:0:0:0:0:1',NULL),(9,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,9,0,0,0,'2020-05-30 19:03:41','0:0:0:0:0:0:0:1',NULL),(10,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,10,0,0,0,'2020-05-30 19:03:41','0:0:0:0:0:0:0:1',NULL),(11,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,11,0,0,0,'2020-05-30 19:04:13','0:0:0:0:0:0:0:1',NULL),(12,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,12,0,0,0,'2020-05-30 19:04:13','0:0:0:0:0:0:0:1',NULL),(13,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,13,0,0,0,'2020-05-30 19:04:13','0:0:0:0:0:0:0:1',NULL),(14,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,14,0,0,0,'2020-05-30 19:04:13','0:0:0:0:0:0:0:1',NULL),(15,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,15,0,0,0,'2020-05-30 19:04:13','0:0:0:0:0:0:0:1',NULL),(16,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,16,0,0,0,'2020-05-30 19:04:13','0:0:0:0:0:0:0:1',NULL),(17,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,17,0,0,0,'2020-05-30 19:04:13','0:0:0:0:0:0:0:1',NULL),(18,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,18,0,0,0,'2020-05-30 19:04:13','0:0:0:0:0:0:0:1',NULL),(19,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,19,0,0,0,'2020-05-30 19:04:13','0:0:0:0:0:0:0:1',NULL),(20,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,20,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(21,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,21,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(22,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,22,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(23,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,23,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(24,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,24,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(25,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,25,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(26,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,26,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(27,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,27,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(28,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,28,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(29,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,29,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(30,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,30,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(31,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,31,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(32,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,32,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(33,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,33,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(34,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,34,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(35,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,35,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(36,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,36,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(37,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,37,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(38,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,38,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(39,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,39,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(40,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,40,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(41,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,41,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(42,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,42,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(43,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,43,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(44,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,44,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(45,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,45,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(46,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,46,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(47,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,47,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(48,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,48,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(49,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,49,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(50,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,50,0,0,2,'2020-05-30 19:06:02','0:0:0:0:0:0:0:1',NULL),(51,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,51,0,0,0,'2020-05-30 19:06:02','0:0:0:0:0:0:0:1',NULL),(52,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,52,0,0,2,'2020-05-30 19:06:02','0:0:0:0:0:0:0:1',NULL),(53,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,53,0,0,0,'2020-05-30 19:06:02','0:0:0:0:0:0:0:1',NULL),(54,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,54,0,0,7,'2020-05-30 19:06:02','0:0:0:0:0:0:0:1',NULL),(56,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,56,0,0,2,'2020-05-30 19:06:02','0:0:0:0:0:0:0:1',NULL),(57,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,57,0,0,0,'2020-05-30 19:06:02','0:0:0:0:0:0:0:1',NULL),(58,'hong','홍길동','1','제목입니다.','내용입니다.',NULL,58,0,0,2,'2020-05-30 19:06:02','0:0:0:0:0:0:0:1',NULL),(59,'hong','홍길동','1','게시글 입니다.','게시글 입니다.','',59,0,0,12,'2020-05-30 19:06:02','0:0:0:0:0:0:0:1',NULL),(60,'lee','이순신','2','게시글 제목 입니다.','내용',NULL,60,0,0,14,'2020-05-30 19:16:00','0:0:0:0:0:0:0:1',NULL),(61,'lee','이순신','2','답글 : 게시글 제목 입니다.','답글답글',NULL,60,1,1,9,'2020-05-30 19:50:52','0:0:0:0:0:0:0:1',NULL),(62,'lee','이순신','2','답글 : 답글 : 게시글 제목 입니다.','답답',NULL,60,2,4,2,'2020-05-30 19:55:12','0:0:0:0:0:0:0:1',NULL),(63,'lee','이순신','2','답글 : 답글 : 게시글 제목 입니다.','답답2',NULL,60,2,2,3,'2020-05-30 19:55:25','0:0:0:0:0:0:0:1',NULL),(64,'lee','이순신','2','답글 : 답글 : 답글 : 게시글 제목 입니다.','답답답',NULL,60,3,3,2,'2020-05-30 19:55:40','0:0:0:0:0:0:0:1',NULL),(67,'lee','이순신','2','두 번째 답글입니다.','답글이여라','',59,1,2,3,'2020-05-30 22:21:04','0:0:0:0:0:0:0:1',NULL),(68,'lee','이순신','2','답글을 작성할 수 있습니다.','내용','',59,1,1,5,'2020-05-30 22:22:28','0:0:0:0:0:0:0:1',NULL),(69,'lee','이순신','2','첨부파일이 있을 경우 우측에 아이콘이 출력됩니다.','내용','41.jpg',69,0,0,18,'2020-05-30 22:31:16','0:0:0:0:0:0:0:1',NULL),(72,'lee','이순신','2','답글에도 파일을 첨부할 수 있습니다.','내용','52.jpg',69,1,1,4,'2020-05-30 22:43:45','0:0:0:0:0:0:0:1',NULL),(74,'hong','홍길동','1','이미지 파일 첨부시 미리보기가 출력됩니다.','이미지 파일 첨부시 미리보기가 출력됩니다.','33.jpg',74,0,0,14,'2020-05-31 11:13:57','0:0:0:0:0:0:0:1',NULL),(77,'hong','홍길동','1','자유게시판에서 파일첨부가 가능합니다.','자유게시판에서 파일첨부가 가능합니다.','Symphony.txt',77,0,0,5,'2020-06-07 23:45:25','0:0:0:0:0:0:0:1',NULL),(78,'hong','홍길동','1','제목 우측에 댓글수가 출력됩니다.','제목 우측에 댓글수가 출력됩니다.',NULL,78,0,0,2,'2020-06-08 00:02:19','0:0:0:0:0:0:0:1',NULL);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery` (
  `boardNum` int(11) NOT NULL,
  `userId` varchar(20) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `boardPw` varchar(20) DEFAULT NULL,
  `boardSubject` varchar(50) NOT NULL,
  `boardContent` varchar(2000) NOT NULL,
  `boardFile` varchar(200) DEFAULT NULL,
  `boardRe_ref` int(11) DEFAULT NULL,
  `boardRe_lev` int(11) DEFAULT NULL,
  `boardRe_seq` int(11) DEFAULT NULL,
  `boardCount` int(11) DEFAULT NULL,
  `boardDate` datetime DEFAULT NULL,
  `boardIp` varchar(20) DEFAULT NULL,
  `boardCategory` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`boardNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES (1,'hong','홍길동','1','북구 국민체육센터','북구 국민체육센터','12.jpg,11.jpg,13.jpg',1,0,0,6,'2020-06-07 23:13:59','0:0:0:0:0:0:0:1',NULL),(2,'hong','홍길동','1','해운대 해수욕장','해운대 해수욕장','21.jpg,22.jpg',2,0,0,1,'2020-06-07 23:25:42','0:0:0:0:0:0:0:1',NULL),(3,'hong','홍길동','1','바다','바다','31.jpg,32.jpg,33.jpg',3,0,0,2,'2020-06-07 23:27:19','0:0:0:0:0:0:0:1',NULL),(4,'hong','홍길동','1','바다','바다','32.jpg,33.jpg,31.jpg',4,0,0,1,'2020-06-07 23:27:41','0:0:0:0:0:0:0:1',NULL),(5,'hong','홍길동','1','바다','바다','33.jpg,31.jpg,32.jpg',5,0,0,0,'2020-06-07 23:27:57','0:0:0:0:0:0:0:1',NULL),(6,'hong','홍길동','1','달빛수영축제','달빛수영축제','41.jpg,42.jpg,43.jpg',6,0,0,0,'2020-06-07 23:31:31','0:0:0:0:0:0:0:1',NULL),(7,'lee','이순신','2','송도 다이빙대','송도 다이빙대','51.jpg,52.jpg,53.jpg',7,0,0,0,'2020-06-07 23:35:40','0:0:0:0:0:0:0:1',NULL),(8,'lee','이순신','2','송도 스카이워크','송도 스카이워크','61.jpg,62.jpg,63.jpg',8,0,0,0,'2020-06-07 23:37:45','0:0:0:0:0:0:0:1',NULL),(9,'lee','이순신','2','북극곰 수영축제','북극곰 수영축제','71.jpg,72.jpg,73.jpg',9,0,0,2,'2020-06-07 23:41:16','0:0:0:0:0:0:0:1',NULL);
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `boardNum` int(11) NOT NULL,
  `userId` varchar(20) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `boardPw` varchar(20) DEFAULT NULL,
  `boardSubject` varchar(50) NOT NULL,
  `boardContent` varchar(2000) NOT NULL,
  `boardFile` varchar(50) DEFAULT NULL,
  `boardRe_ref` int(11) DEFAULT NULL,
  `boardRe_lev` int(11) DEFAULT NULL,
  `boardRe_seq` int(11) DEFAULT NULL,
  `boardCount` int(11) DEFAULT NULL,
  `boardDate` datetime DEFAULT NULL,
  `boardIp` varchar(20) DEFAULT NULL,
  `boardCategory` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`boardNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'admin','관리자','1','수영 영법의 종류','수영 영법은 4가지가 있습니다.\r\n\r\n1. 자유형\r\n2. 배영\r\n3. 평영\r\n4. 접영',NULL,1,0,0,9,'2020-05-31 11:10:45','0:0:0:0:0:0:0:1',NULL),(2,'admin','관리자','1','자유형이란?','자유형은 형식에 제한이 없음을 뜻한다.\r\n\r\n그래서 자유형 경기 때는 배영, 평영, 접영을 해도 상관없다.',NULL,2,0,0,3,'2020-05-31 11:12:11','0:0:0:0:0:0:0:1',NULL),(3,'admin','관리자','1','배영이란?','배영은 누운 채 물 위에 떠서 팔을 크게 휘저으며 나아가는 영법이다.',NULL,3,0,0,7,'2020-05-31 11:13:29','0:0:0:0:0:0:0:1',NULL),(4,'admin','관리자','1','평영이란?','평영은 팔과 다리의 동작이 마치 개구리와 비슷해서 개구리 헤엄이라 부르기도 한다.\r\n\r\n팔을 앞으로 모았다가 양 옆으로 펼쳐 밀어내며 추진력을 얻는다.\r\n\r\n다리는 무릎과 발목을 직각으로 해서 뒤로 모았다가 발목과 무릎을 밖으로 벌리면서 다리를 쭉 펴주면 된다.',NULL,4,0,0,10,'2020-05-31 11:32:04','0:0:0:0:0:0:0:1',NULL),(6,'admin','관리자','1','접영이란?','접영은 나비 영법이라고 불리우며 4개의 기본 영법 중에서 가장 에너지 소모가 많은 영법이다.',NULL,6,0,0,25,'2020-05-31 12:18:54','0:0:0:0:0:0:0:1',NULL);
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `userId` varchar(20) NOT NULL,
  `userPw` varchar(20) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `userEmail` varchar(50) NOT NULL,
  `userZipcode` int(11) DEFAULT NULL,
  `userAddress1` varchar(50) DEFAULT NULL,
  `userAddress2` varchar(50) DEFAULT NULL,
  `userPhone` varchar(20) DEFAULT NULL,
  `userRegdate` date DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('admin','1234','관리자','admin@admin',0,NULL,NULL,NULL,'2020-05-31'),('hong','1','홍길동','hong@hong.com',6561,'서울 서초구 동광로19길 10',NULL,'010-1234-1234','2020-05-30'),('lee','2','이순신','lee@lee.com',0,NULL,NULL,NULL,'2020-05-30');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pool`
--

DROP TABLE IF EXISTS `pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pool` (
  `poolNum` int(11) NOT NULL,
  `poolName` varchar(20) DEFAULT NULL,
  `poolZipcode` int(11) DEFAULT NULL,
  `poolAddress1` varchar(50) DEFAULT NULL,
  `poolAddress2` varchar(50) DEFAULT NULL,
  `poolTel` varchar(20) DEFAULT NULL,
  `poolUrl` varchar(50) DEFAULT NULL,
  `poolContent` varchar(2000) DEFAULT NULL,
  `poolDate` datetime DEFAULT NULL,
  PRIMARY KEY (`poolNum`),
  UNIQUE KEY `poolName` (`poolName`),
  UNIQUE KEY `poolName_2` (`poolName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pool`
--

LOCK TABLES `pool` WRITE;
/*!40000 ALTER TABLE `pool` DISABLE KEYS */;
INSERT INTO `pool` VALUES (1,'사직종합운동장 실내수영장',47500,'부산 연제구 월드컵대로 344',NULL,'051-500-2354~5','http://www.busan.go.kr/stadium/sfcomplexswim01','레인길이 : 50미터\r\n레인수 : 10개\r\n수심 : 최대 2미터','2020-05-31 15:25:29'),(2,'연제구국민체육센터',47579,'부산 연제구 쌍미천로 132',NULL,'051-665-5121~4','http://sports.yeonje.go.kr/','레인길이 : 25미터\r\n레인수 : 8개\r\n수심 : 1.1 ~ 1.3미터','2020-05-31 15:26:25'),(3,'동래구국민체육센터',47827,'부산 동래구 미남로 110',NULL,'051-504-6640~1','http://sports.dongnae.go.kr/','레인길이 : 25미터\r\n레인수 : 6개','2020-05-31 18:09:22'),(4,'북구국민체육센터',46534,'부산 북구 화명대로94번길 83',NULL,'051-365-7070','http://www.bukgusports.com/','레인길이 : 25미터\r\n레인수 : 5개','2020-06-07 23:19:23');
/*!40000 ALTER TABLE `pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `replyNum` int(11) NOT NULL,
  `boardId` varchar(20) DEFAULT NULL,
  `boardNum` int(11) DEFAULT NULL,
  `userId` varchar(20) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `replyContent` varchar(200) DEFAULT NULL,
  `replyDate` datetime DEFAULT NULL,
  PRIMARY KEY (`replyNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,'info',6,'hong','홍길동','댓글입니다.','2020-06-01 12:54:01'),(2,'info',6,'hong','홍길동','댓글입니다.','2020-06-01 12:54:04'),(3,'board',75,'hong','홍길동','댓글 테스트','2020-06-01 13:07:30'),(4,'board',76,'hong','홍길동','123','2020-06-01 13:33:10'),(5,'board',78,'hong','홍길동','댓글1','2020-06-08 00:02:24'),(6,'board',78,'hong','홍길동','댓글2','2020-06-08 00:02:26'),(7,'board',78,'hong','홍길동','댓글3','2020-06-08 00:02:28'),(8,'review',6,'hong','홍길동','저도 다녀왔어요','2020-06-08 00:05:36'),(9,'review',6,'lee','이순신','너무 좋아요','2020-06-08 01:10:50'),(10,'review',6,'lee','이순신','또 가고 싶어요','2020-06-08 01:11:53');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `boardNum` int(11) NOT NULL,
  `userId` varchar(20) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `boardPw` varchar(20) DEFAULT NULL,
  `boardSubject` varchar(50) NOT NULL,
  `boardContent` varchar(2000) NOT NULL,
  `boardFile` varchar(50) DEFAULT NULL,
  `boardRe_ref` int(11) DEFAULT NULL,
  `boardRe_lev` int(11) DEFAULT NULL,
  `boardRe_seq` int(11) DEFAULT NULL,
  `boardCount` int(11) DEFAULT NULL,
  `boardDate` datetime DEFAULT NULL,
  `boardIp` varchar(20) DEFAULT NULL,
  `boardCategory` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`boardNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'hong','홍길동','1','연제국민체육센터 수영장 후기입니다.','후기',NULL,1,0,0,28,'2020-05-31 12:53:22','0:0:0:0:0:0:0:1','연제구국민체육센터'),(2,'hong','홍길동','1','사직수영장 후기입니다.','후기','',2,0,0,42,'2020-05-31 12:58:45','0:0:0:0:0:0:0:1','사직종합운동장 실내수영장'),(4,'lee','이순신','2','답글 : 사직수영장 후기입니다.','후기답글','31.jpg',2,1,1,15,'2020-05-31 13:38:06','0:0:0:0:0:0:0:1','사직종합운동장 실내수영장'),(5,'hong','홍길동','1','사직수영장 후기','후기','',5,0,0,9,'2020-05-31 17:18:09','0:0:0:0:0:0:0:1','사직종합운동장 실내수영장'),(6,'lee','이순신','2','동래구국민체육센터 후기','후기','',6,0,0,30,'2020-05-31 18:52:24','0:0:0:0:0:0:0:1','동래구국민체육센터');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-08  1:18:18
