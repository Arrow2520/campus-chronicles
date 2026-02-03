-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: mysql-3b92c5b5-campus-chronicles.c.aivencloud.com    Database: campus_chronicles_db
-- ------------------------------------------------------
-- Server version	8.0.35

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '1903dd4f-00e1-11f1-a43d-ee3aacde950f:1-15,
2edc3e75-e00a-11f0-9ce0-2a1830dba16f:1-54,
9f2cbf4e-f0fe-11f0-8dff-8e679559c150:1-19,
cb366ef0-eb28-11f0-b41f-be119413d860:1-19';

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` text,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (1,'A.C. Roy Hall (Hostel 7)','ac-roy-hall','Hostel','A multi-seated boys\' hostel known for its vibrant community and central location. Features common rooms, mess, and indoor games facilities. Capacity: 300+',22.555000,88.306000,'2025-12-23 15:04:37'),(2,'D. Banerjee Hall (Hostel 8)','d-banerjee-hall','Hostel','Popular among first-year students, offering shared triple rooms with attached canteen serving traditional Bengali meals. Capacity: 250+',22.555000,88.306000,'2025-12-23 15:04:37'),(3,'A.K. Seal Hall (Hostel 9)','ak-seal-hall','Hostel','A historic hostel with colonial architecture, providing a nostalgic living experience for engineering enthusiasts. Capacity: 280+',22.555000,88.306000,'2025-12-23 15:04:37'),(4,'Hostel 10','hostel-10','Hostel','Modern facilities for undergraduates, including Wi-Fi, laundry, and proximity to academic buildings. Capacity: 200+',22.555000,88.306000,'2025-12-23 15:04:37'),(5,'Hostel 11','hostel-11','Hostel','Dedicated to fostering innovation, with spaces for group studies and tech clubs. Capacity: 220+',22.555000,88.306000,'2025-12-23 15:04:37'),(6,'Hostel 13 (PG)','hostel-13','Hostel','Exclusively for postgraduate and research scholars, offering single rooms and quiet study environments. Capacity: 150+',22.555000,88.306000,'2025-12-23 15:04:37'),(7,'Hostel 14','hostel-14','Hostel','Spacious multi-seater for boys, with outdoor sports access and evening cultural events. Capacity: 300+',22.555000,88.306000,'2025-12-23 15:04:37'),(8,'Hostel 15','hostel-15','Hostel','One of the largest, accommodating diverse student batches with 24/7 security. Capacity: 350+',22.555000,88.306000,'2025-12-23 15:04:37'),(9,'Hostel 16','hostel-16','Hostel','Newly renovated with eco-friendly features, ideal for environmentally conscious students. Capacity: 250+',22.555000,88.306000,'2025-12-23 15:04:37'),(10,'Sister Nivedita Hall','sister-nivedita-hall','Hostel','Premier girls\' hostel with modern amenities, safe environment, and dedicated warden support. Capacity: 200+',22.555000,88.306000,'2025-12-23 15:04:37'),(11,'Richardson Hall','richardson-hall','Hostel','Historic 3-storey boys\' hostel built in the early 1960s, with a unique 3-wing design. Capacity: 260+',22.555000,88.306000,'2025-12-23 15:04:37'),(12,'MacDonald Hall','macdonald-hall','Hostel','Single-seated boys\' hall for 3rd and 4th-year UG students, emphasizing discipline and academic focus. Capacity: 150+',22.555000,88.306000,'2025-12-23 15:04:37'),(13,'Sen Hall','sen-hall','Hostel','Single-seated boys\' hall for 3rd and 4th-year UG students, with indoor games and garden. Capacity: 280+',22.555000,88.306000,'2025-12-23 15:04:37'),(14,'Sengupta Hall','sengupta-hall','Hostel','Single-seated boys\' hall named after a renowned professor, with strong traditions. Capacity: 270+',22.555000,88.306000,'2025-12-23 15:04:37'),(15,'Wolfenden Hall','wolfenden-hall','Hostel','Glamorous single-seated boys\' hall for final years, known for its vibrant social life. Capacity: 250+',22.555000,88.306000,'2025-12-23 15:04:37'),(16,'Pandya Hall','pandya-hall','Hostel','Girls\' hostel for 2nd-4th year UG and PG students, near the clock tower. Capacity: 180+',22.555000,88.306000,'2025-12-23 15:04:37'),(17,'Lt. William Hall','lt-william-hall','Hostel','Ladies\' hostel for PG and research scholars, with 2-seater rooms and scenic Ganga views. Capacity: 100+',22.555000,88.306000,'2025-12-23 15:04:37'),(18,'Workshop Complex','workshop-complex','Heritage','The old Workshop complex where the former Bengal Engineering College was originally started. encompassing an area of about 8500 square metres.',22.556000,88.307000,'2025-12-23 15:04:37'),(19,'Slater Hall','slater-hall','Culture','Slater Hall houses some of the clubs and societies of the institute, most notably the Music Club and Innovation Centre.',22.556000,88.307000,'2025-12-23 15:04:37'),(20,'Clock Tower','clock-tower','Heritage','The IIEST Shibpur clock tower is an iconic, century-old engineering marvel with a unique, intricate mechanical movement.',22.556000,88.307000,'2025-12-23 15:04:37'),(21,'Downing Hall','downing-hall','Heritage','Possibly oldest hostel of IIEST Shibpur, built in 19th century. Named after first principal S.F. Downing.',22.556000,88.307000,'2025-12-23 15:04:37');
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-03 14:51:36
