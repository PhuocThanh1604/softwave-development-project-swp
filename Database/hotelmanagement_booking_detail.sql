CREATE DATABASE  IF NOT EXISTS `hotelmanagement` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hotelmanagement`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hotelmanagement
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `booking_detail`
--

DROP TABLE IF EXISTS `booking_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `check_in_time` varchar(255) DEFAULT NULL,
  `check_out_time` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `total_room` double DEFAULT NULL,
  `total_service` double DEFAULT NULL,
  `fk_booking` bigint DEFAULT NULL,
  `fk_room` bigint DEFAULT NULL,
  `fk_room_category` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKry7fwapaklvf26fuxn2sykt13` (`fk_booking`),
  KEY `FK3d5bee5p1d08x63fijnen8th5` (`fk_room`),
  KEY `FKjym2x0u6hwonkc05kfbqu43bl` (`fk_room_category`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_detail`
--

LOCK TABLES `booking_detail` WRITE;
/*!40000 ALTER TABLE `booking_detail` DISABLE KEYS */;
INSERT INTO `booking_detail` VALUES (1,'2022-07-05','2022-07-06',_binary '',0,1000000,0,1,NULL,1),(2,'2022-07-10','2022-07-14',_binary '',0,8000000,0,2,NULL,2),(3,'2022-07-05','2022-07-06',_binary '',0,1000000,0,3,NULL,1),(4,'2022-07-11','2022-07-12',_binary '',0,1000000,0,4,NULL,1),(5,'2022-07-11','2022-07-12',_binary '',0,2000000,0,5,NULL,2),(6,'2022-07-12','2022-07-13',_binary '',3000000,3000000,0,6,19,3),(7,'2022-07-12','2022-07-13',_binary '',2000000,2000000,0,7,5,2),(8,'2022-07-12','2022-07-13',_binary '',1000000,1000000,0,8,4,1),(9,'2022-07-12','2022-07-13',_binary '',1000000,1000000,0,9,17,1),(10,'2022-07-12','2022-07-13',_binary '',3000000,3000000,0,10,14,3),(11,'2022-07-12','2022-07-13',_binary '',2000000,2000000,0,11,9,2),(12,'2022-07-13','2022-07-14',_binary '',0,0,0,12,NULL,4),(13,'2022-07-13','2022-07-14',_binary '',0,0,0,13,1,1),(14,'2022-07-14','2022-07-14',_binary '',2000000,2000000,0,14,5,2),(15,'2022-07-14','2022-07-14',_binary '',3000000,3000000,0,15,10,3),(16,'2022-07-14','2022-07-14',_binary '',1000000,1000000,0,16,1,1),(17,'2022-07-14','2022-07-14',_binary '',1000000,1000000,0,17,17,1),(18,'2022-07-14','2022-07-14',_binary '',0,1000000,0,18,1,1),(19,'2022-07-14','2022-07-15',_binary '',0,0,0,19,NULL,2),(20,'2022-07-14','2022-07-14',_binary '',0,0,0,20,8,2);
/*!40000 ALTER TABLE `booking_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-15 13:07:34
