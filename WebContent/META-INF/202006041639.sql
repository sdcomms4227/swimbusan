-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: swimbusan
-- ------------------------------------------------------
-- Server version	5.6.45-log

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
INSERT INTO `board` VALUES (1,'1','홍길동','1','제목입니다.','내용입니다.',NULL,1,0,0,4,'2020-05-30 19:03:41','0:0:0:0:0:0:0:1',NULL),(2,'1','홍길동','1','제목입니다.','내용입니다.',NULL,2,0,0,5,'2020-05-30 19:03:41','0:0:0:0:0:0:0:1',NULL),(3,'1','홍길동','1','제목입니다.','내용입니다.',NULL,3,0,0,8,'2020-05-30 19:03:41','0:0:0:0:0:0:0:1',NULL),(4,'1','홍길동','1','제목입니다.','내용입니다.',NULL,4,0,0,2,'2020-05-30 19:03:41','0:0:0:0:0:0:0:1',NULL),(6,'1','홍길동','1','제목입니다.','내용입니다.',NULL,6,0,0,2,'2020-05-30 19:03:41','0:0:0:0:0:0:0:1',NULL),(7,'1','홍길동','1','제목입니다.','내용입니다.',NULL,7,0,0,0,'2020-05-30 19:03:41','0:0:0:0:0:0:0:1',NULL),(8,'1','홍길동','1','제목입니다.','내용입니다.',NULL,8,0,0,0,'2020-05-30 19:03:41','0:0:0:0:0:0:0:1',NULL),(9,'1','홍길동','1','제목입니다.','내용입니다.',NULL,9,0,0,0,'2020-05-30 19:03:41','0:0:0:0:0:0:0:1',NULL),(10,'1','홍길동','1','제목입니다.','내용입니다.',NULL,10,0,0,0,'2020-05-30 19:03:41','0:0:0:0:0:0:0:1',NULL),(11,'1','홍길동','1','제목입니다.','내용입니다.',NULL,11,0,0,0,'2020-05-30 19:04:13','0:0:0:0:0:0:0:1',NULL),(12,'1','홍길동','1','제목입니다.','내용입니다.',NULL,12,0,0,0,'2020-05-30 19:04:13','0:0:0:0:0:0:0:1',NULL),(13,'1','홍길동','1','제목입니다.','내용입니다.',NULL,13,0,0,0,'2020-05-30 19:04:13','0:0:0:0:0:0:0:1',NULL),(14,'1','홍길동','1','제목입니다.','내용입니다.',NULL,14,0,0,0,'2020-05-30 19:04:13','0:0:0:0:0:0:0:1',NULL),(15,'1','홍길동','1','제목입니다.','내용입니다.',NULL,15,0,0,0,'2020-05-30 19:04:13','0:0:0:0:0:0:0:1',NULL),(16,'1','홍길동','1','제목입니다.','내용입니다.',NULL,16,0,0,0,'2020-05-30 19:04:13','0:0:0:0:0:0:0:1',NULL),(17,'1','홍길동','1','제목입니다.','내용입니다.',NULL,17,0,0,0,'2020-05-30 19:04:13','0:0:0:0:0:0:0:1',NULL),(18,'1','홍길동','1','제목입니다.','내용입니다.',NULL,18,0,0,0,'2020-05-30 19:04:13','0:0:0:0:0:0:0:1',NULL),(19,'1','홍길동','1','제목입니다.','내용입니다.',NULL,19,0,0,0,'2020-05-30 19:04:13','0:0:0:0:0:0:0:1',NULL),(20,'1','홍길동','1','제목입니다.','내용입니다.',NULL,20,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(21,'1','홍길동','1','제목입니다.','내용입니다.',NULL,21,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(22,'1','홍길동','1','제목입니다.','내용입니다.',NULL,22,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(23,'1','홍길동','1','제목입니다.','내용입니다.',NULL,23,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(24,'1','홍길동','1','제목입니다.','내용입니다.',NULL,24,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(25,'1','홍길동','1','제목입니다.','내용입니다.',NULL,25,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(26,'1','홍길동','1','제목입니다.','내용입니다.',NULL,26,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(27,'1','홍길동','1','제목입니다.','내용입니다.',NULL,27,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(28,'1','홍길동','1','제목입니다.','내용입니다.',NULL,28,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(29,'1','홍길동','1','제목입니다.','내용입니다.',NULL,29,0,0,0,'2020-05-30 19:04:33','0:0:0:0:0:0:0:1',NULL),(30,'1','홍길동','1','제목입니다.','내용입니다.',NULL,30,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(31,'1','홍길동','1','제목입니다.','내용입니다.',NULL,31,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(32,'1','홍길동','1','제목입니다.','내용입니다.',NULL,32,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(33,'1','홍길동','1','제목입니다.','내용입니다.',NULL,33,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(34,'1','홍길동','1','제목입니다.','내용입니다.',NULL,34,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(35,'1','홍길동','1','제목입니다.','내용입니다.',NULL,35,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(36,'1','홍길동','1','제목입니다.','내용입니다.',NULL,36,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(37,'1','홍길동','1','제목입니다.','내용입니다.',NULL,37,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(38,'1','홍길동','1','제목입니다.','내용입니다.',NULL,38,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(39,'1','홍길동','1','제목입니다.','내용입니다.',NULL,39,0,0,0,'2020-05-30 19:04:55','0:0:0:0:0:0:0:1',NULL),(40,'1','홍길동','1','제목입니다.','내용입니다.',NULL,40,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(41,'1','홍길동','1','제목입니다.','내용입니다.',NULL,41,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(42,'1','홍길동','1','제목입니다.','내용입니다.',NULL,42,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(43,'1','홍길동','1','제목입니다.','내용입니다.',NULL,43,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(44,'1','홍길동','1','제목입니다.','내용입니다.',NULL,44,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(45,'1','홍길동','1','제목입니다.','내용입니다.',NULL,45,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(46,'1','홍길동','1','제목입니다.','내용입니다.',NULL,46,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(47,'1','홍길동','1','제목입니다.','내용입니다.',NULL,47,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(48,'1','홍길동','1','제목입니다.','내용입니다.',NULL,48,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(49,'1','홍길동','1','제목입니다.','내용입니다.',NULL,49,0,0,0,'2020-05-30 19:05:33','0:0:0:0:0:0:0:1',NULL),(50,'1','홍길동','1','제목입니다.','내용입니다.',NULL,50,0,0,2,'2020-05-30 19:06:02','0:0:0:0:0:0:0:1',NULL),(51,'1','홍길동','1','제목입니다.','내용입니다.',NULL,51,0,0,0,'2020-05-30 19:06:02','0:0:0:0:0:0:0:1',NULL),(52,'1','홍길동','1','제목입니다.','내용입니다.',NULL,52,0,0,2,'2020-05-30 19:06:02','0:0:0:0:0:0:0:1',NULL),(53,'1','홍길동','1','제목입니다.','내용입니다.',NULL,53,0,0,0,'2020-05-30 19:06:02','0:0:0:0:0:0:0:1',NULL),(54,'1','홍길동','1','제목입니다.','내용입니다.',NULL,54,0,0,7,'2020-05-30 19:06:02','0:0:0:0:0:0:0:1',NULL),(55,'1','홍길동','1','글 수정 테스트 입니다.','내용입니다.','img_52@2x.png',55,0,0,31,'2020-05-30 19:06:02','0:0:0:0:0:0:0:1',NULL),(56,'1','홍길동','1','제목입니다.','내용입니다.',NULL,56,0,0,2,'2020-05-30 19:06:02','0:0:0:0:0:0:0:1',NULL),(57,'1','홍길동','1','제목입니다.','내용입니다.',NULL,57,0,0,0,'2020-05-30 19:06:02','0:0:0:0:0:0:0:1',NULL),(58,'1','홍길동','1','제목입니다.','내용입니다.',NULL,58,0,0,2,'2020-05-30 19:06:02','0:0:0:0:0:0:0:1',NULL),(59,'1','홍길동','1','제목입니다. 제목입니다.','내용입니다.',NULL,59,0,0,10,'2020-05-30 19:06:02','0:0:0:0:0:0:0:1',NULL),(60,'2','이순신','2','게시글 제목 입니다.','내용',NULL,60,0,0,14,'2020-05-30 19:16:00','0:0:0:0:0:0:0:1',NULL),(61,'2','이순신','2','답글 : 게시글 제목 입니다.','답글답글',NULL,60,1,1,9,'2020-05-30 19:50:52','0:0:0:0:0:0:0:1',NULL),(62,'2','이순신','2','답글 : 답글 : 게시글 제목 입니다.','답답',NULL,60,2,4,2,'2020-05-30 19:55:12','0:0:0:0:0:0:0:1',NULL),(63,'2','이순신','2','답글 : 답글 : 게시글 제목 입니다.','답답2',NULL,60,2,2,3,'2020-05-30 19:55:25','0:0:0:0:0:0:0:1',NULL),(64,'2','이순신','2','답글 : 답글 : 답글 : 게시글 제목 입니다.','답답답',NULL,60,3,3,1,'2020-05-30 19:55:40','0:0:0:0:0:0:0:1',NULL),(67,'2','이순신','2','답글 : 제목입니다. 제목입니다.','답글이여라',NULL,59,1,2,1,'2020-05-30 22:21:04','0:0:0:0:0:0:0:1',NULL),(68,'2','이순신','2','답글 제목 변경이 가능합니다.','내용',NULL,59,1,1,3,'2020-05-30 22:22:28','0:0:0:0:0:0:0:1',NULL),(69,'2','이순신','2','첨부파일이 있을 경우 우측에 아이콘이 출력됩니다.','내용','img_31.png',69,0,0,16,'2020-05-30 22:31:16','0:0:0:0:0:0:0:1',NULL),(72,'2','이순신','2','답글에도 파일을 첨부할 수 있습니다.','내용','img_11.jpg',69,1,1,2,'2020-05-30 22:43:45','0:0:0:0:0:0:0:1',NULL),(73,'2','이순신','2','글 수정 테스트 글 수정 테스트 글 수정 테스트','내용','img_13.jpg',73,0,0,64,'2020-05-30 22:49:59','0:0:0:0:0:0:0:1',NULL),(74,'1','홍길동','1','게시판 분리하기','게시판 분리하기',NULL,74,0,0,11,'2020-05-31 11:13:57','0:0:0:0:0:0:0:1',NULL),(75,'1','홍길동','1','게시판 모듈 수정중','내용\r\n여러줄로\r\n적기','img_12.jpg',75,0,0,70,'2020-05-31 12:03:24','0:0:0:0:0:0:0:1',NULL),(76,'1','홍길동','1','답글 : 게시판 분리하기','분리중',NULL,74,1,1,7,'2020-05-31 12:14:48','0:0:0:0:0:0:0:1',NULL),(77,'1','홍길동','1','1','1','',77,0,0,58,'2020-06-02 17:15:59','0:0:0:0:0:0:0:1',NULL),(78,'1','홍길동','1','11','11','Symphony.txt',78,0,0,6,'2020-06-02 17:48:00','0:0:0:0:0:0:0:1',NULL),(79,'1','홍길동','1','12','12','바탕화면1920.jpg',79,0,0,3,'2020-06-02 17:48:07','0:0:0:0:0:0:0:1',NULL);
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
INSERT INTO `gallery` VALUES (1,'2','이순신','2','농특산품 & 우수중소기업박람회','농특산품 & 우수중소기업박람회','img_11.jpg,img_12.jpg,img_13.jpg',1,0,0,17,'2020-05-31 23:18:05','0:0:0:0:0:0:0:1',NULL),(3,'2','이순신','2','농특산품 & 우수중소기업박람회','농특산품 & 우수중소기업박람회','img_21.jpg,,',3,0,0,6,'2020-05-31 23:26:52','0:0:0:0:0:0:0:1',NULL),(4,'2','이순신','2','부산 MBC','부산 MBC','img_31.png',4,0,0,14,'2020-05-31 23:27:37','0:0:0:0:0:0:0:1',NULL),(5,'2','이순신','2','농특산품 & 우수중소기업박람회','농특산품 & 우수중소기업박람회','img_12.jpg',5,0,0,0,'2020-05-31 23:40:10','0:0:0:0:0:0:0:1',NULL),(6,'2','이순신','2','농특산품 & 우수중소기업박람회','농특산품 & 우수중소기업박람회','img_13.jpg',6,0,0,0,'2020-05-31 23:40:18','0:0:0:0:0:0:0:1',NULL),(8,'2','이순신','2','배경이미지','배경이미지','11.jpg,12.jpg,13.jpg',8,0,0,1,'2020-05-31 23:46:43','0:0:0:0:0:0:0:1',NULL),(9,'2','이순신','2','모뉴먼트밸리','모뉴먼트밸리','mv_oct13_05_0.png,mv_oct13_06_0.png,screenshot1.jpg',9,0,0,18,'2020-05-31 23:54:38','0:0:0:0:0:0:0:1',NULL),(10,'2','이순신','2','해변','해변','e8.jpg,c3.jpg,e2.jpg',10,0,0,162,'2020-05-31 23:57:19','0:0:0:0:0:0:0:1',NULL),(11,'1','홍길동','1','출석체크','체크','bg01.jpg,bg02.jpg,bg03.jpg',11,0,0,8,'2020-06-02 17:53:38','0:0:0:0:0:0:0:1',NULL);
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
INSERT INTO `info` VALUES (1,'admin','관리자','1','수영 영법의 종류','수영 영법은 4가지가 있습니다.\r\n\r\n1. 자유형\r\n2. 배영\r\n3. 평영\r\n4. 접영',NULL,1,0,0,5,'2020-05-31 11:10:45','0:0:0:0:0:0:0:1',NULL),(2,'admin','관리자','1','자유형이란?','자유형은 형식에 제한이 없음을 뜻한다.\r\n\r\n그래서 자유형 경기 때는 배영, 평영, 접영을 해도 상관없다.',NULL,2,0,0,3,'2020-05-31 11:12:11','0:0:0:0:0:0:0:1',NULL),(3,'admin','관리자','1','배영이란?','배영은 누운 채 물 위에 떠서 팔을 크게 휘저으며 나아가는 영법이다.',NULL,3,0,0,7,'2020-05-31 11:13:29','0:0:0:0:0:0:0:1',NULL),(4,'admin','관리자','1','평영이란?','평영은 팔과 다리의 동작이 마치 개구리와 비슷해서 개구리 헤엄이라 부르기도 한다.\r\n\r\n팔을 앞으로 모았다가 양 옆으로 펼쳐 밀어내며 추진력을 얻는다.\r\n\r\n다리는 무릎과 발목을 직각으로 해서 뒤로 모았다가 발목과 무릎을 밖으로 벌리면서 다리를 쭉 펴주면 된다.',NULL,4,0,0,11,'2020-05-31 11:32:04','0:0:0:0:0:0:0:1',NULL),(6,'admin','관리자','1','접영이란?','접영은 나비 영법이라고 불리우며 4개의 기본 영법 중에서 가장 에너지 소모가 많은 영법이다.',NULL,6,0,0,43,'2020-05-31 12:18:54','0:0:0:0:0:0:0:1',NULL);
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
INSERT INTO `member` VALUES ('1','1','홍길동','1@1',6561,'서울 서초구 동광로19길 10','1','1','2020-05-30'),('2','2','이순신','2@2',0,NULL,NULL,NULL,'2020-05-30'),('3','3','3','3@3',0,NULL,NULL,NULL,'2020-06-01'),('admin','1234','관리자','admin@admin',0,NULL,NULL,NULL,'2020-05-31');
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
INSERT INTO `pool` VALUES (1,'사직수영장',47500,'부산 연제구 월드컵대로 344',NULL,'051-500-2354~5','http://www.busan.go.kr/stadium/sfcomplexswim01','수영장:사직수영장\r\n주소:부산 연제구 월드컵대로 344(거제2동 1299)\r\n전화:051-500-2354~5\r\n홈페이지:http://www.busan.go.kr/stadium/sfcomplexswim01\r\n레인길이(M):50\r\n레인수(개):10\r\n수심(M):2','2020-05-31 15:25:29'),(2,'연제구국민체육센터',47579,'부산 연제구 쌍미천로 132',NULL,'051-665-5121~4','http://sports.yeonje.go.kr/','수영장:연제구국민체육센터\r\n주소:부산 연제구 쌍미천로 132(연산동 799)\r\n전화:051-665-5121~4\r\n홈페이지:http://sports.yeonje.go.kr/\r\n레인길이(M):25\r\n레인수(개):8\r\n수심(M):1.1-1.3','2020-05-31 15:26:25'),(3,'동래구국민체육센터',47827,'부산 동래구 미남로 110',NULL,'051-504-6640~1','http://sports.dongnae.go.kr/','수영장:동래구국민체육센터\r\n주소:부산 동래구 미남로 110(온천동 1448-2)\r\n전화:051-504-6640~1\r\n홈페이지:http://sports.dongnae.go.kr/\r\n레인길이(M):25\r\n레인수(개):6\r\n수심(M):','2020-05-31 18:09:22');
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
INSERT INTO `reply` VALUES (1,'info',6,'1','홍길동','댓글입니다.','2020-06-01 12:54:01'),(2,'info',6,'1','홍길동','댓글입니다.','2020-06-01 12:54:04'),(3,'board',75,'1','홍길동','댓글 테스트','2020-06-01 13:07:30'),(4,'board',76,'1','홍길동','123','2020-06-01 13:33:10'),(5,'board',75,'1','홍길동','댓글1','2020-06-01 14:39:00'),(6,'board',75,'1','홍길동','댓글2','2020-06-01 14:39:05'),(7,'board',6,'1','홍길동','자유게시판 6번 게시글에 댓글 달기','2020-06-01 14:42:46'),(8,'info',6,'1','홍길동','댓글','2020-06-01 16:54:46'),(9,'gallery',10,'1','홍길동','123','2020-06-02 12:11:43');
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
INSERT INTO `review` VALUES (1,'1','홍길동','1','연제국민체육센터 수영장 후기입니다.','후기',NULL,1,0,0,23,'2020-05-31 12:53:22','0:0:0:0:0:0:0:1','연제구국민체육센터'),(2,'1','홍길동','1','사직수영장 후기입니다.','후기',NULL,2,0,0,37,'2020-05-31 12:58:45','0:0:0:0:0:0:0:1','사직수영장'),(4,'2','이순신','2','답글 : 사직수영장 후기입니다.','후기답글','img_11.jpg',2,1,1,11,'2020-05-31 13:38:06','0:0:0:0:0:0:0:1','사직수영장'),(5,'1','홍길동','1','사직 후기 1','후기',NULL,5,0,0,3,'2020-05-31 17:18:09','0:0:0:0:0:0:0:1','사직수영장'),(6,'2','이순신','2','동래구국민체육센터 후기','후기','',6,0,0,16,'2020-05-31 18:52:24','0:0:0:0:0:0:0:1','동래구국민체육센터');
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

-- Dump completed on 2020-06-04 16:39:44
