CREATE DATABASE  IF NOT EXISTS `campus_chronicles_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `campus_chronicles_db`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: campus_chronicles_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `place_id` (`place_id`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,1,'https://knowiiest.netlify.app/static/media/hostel7.58d5d684.png'),(2,2,'https://knowiiest.netlify.app/static/media/hostel8.440bb57c.jfif'),(3,3,'https://knowiiest.netlify.app/static/media/hostel10.b47af077.jpg'),(4,4,'https://knowiiest.netlify.app/static/media/aksealhall.1bd1686b.jpg'),(5,5,'https://knowiiest.netlify.app/static/media/hostel11.9744c011.jpg'),(6,6,'https://knowiiest.netlify.app/static/media/hostel13.ad0735be.jpg'),(7,7,'https://knowiiest.netlify.app/static/media/hostel14.b1fabce5.jpg'),(8,8,'https://knowiiest.netlify.app/static/media/hostel15.28f6ef9b.jfif'),(9,9,'https://knowiiest.netlify.app/static/media/hostel16.d21b1f83.jpg'),(10,10,'https://knowiiest.netlify.app/static/media/nivedita.6c2f0fb4.jpg'),(11,11,'https://knowiiest.netlify.app/static/media/richardsonhall.d6223ace.jpg'),(12,12,'https://knowiiest.netlify.app/static/media/macdonald.feb126c6.jpg'),(13,13,'https://knowiiest.netlify.app/static/media/senhall.f6cb231c.jpg'),(14,14,'https://knowiiest.netlify.app/static/media/senguptahall.647d9705.jpg'),(15,15,'https://knowiiest.netlify.app/static/media/wolf.1e44ad8a.jfif'),(16,16,'https://knowiiest.netlify.app/static/media/pandyahall.f3e61a2c.jpg'),(17,17,'https://knowiiest.netlify.app/static/media/williamshall.99463110.jpg'),(18,18,'https://knowiiest.netlify.app/static/media/workshop.8f64208c.jpg'),(19,19,'https://knowiiest.netlify.app/static/media/slaterhall.b99a2350.jpg'),(20,20,'https://www.iiests.ac.in/ckfinder/userfiles/files/09(1).jpg'),(21,21,'https://knowiiest.netlify.app/static/media/Downinghall.bcc2b2ed.jpg');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (1,'A.C. Roy Hall (Hostel 7)','ac-roy-hall','Hostel','A multi-seated boys\' hostel known for its vibrant community and central location. Features common rooms, mess, and indoor games facilities. Capacity: 300+',22.555000,88.306000,'2025-11-19 18:07:12'),(2,'D. Banerjee Hall (Hostel 8)','d-banerjee-hall','Hostel','Popular among first-year students, offering shared triple rooms with attached canteen serving traditional Bengali meals. Capacity: 250+',22.555000,88.306000,'2025-11-19 18:07:12'),(3,'A.K. Seal Hall (Hostel 9)','ak-seal-hall','Hostel','A historic hostel with colonial architecture, providing a nostalgic living experience for engineering enthusiasts. Capacity: 280+',22.555000,88.306000,'2025-11-19 18:07:12'),(4,'Hostel 10','hostel-10','Hostel','Modern facilities for undergraduates, including Wi-Fi, laundry, and proximity to academic buildings. Capacity: 200+',22.555000,88.306000,'2025-11-19 18:07:12'),(5,'Hostel 11','hostel-11','Hostel','Dedicated to fostering innovation, with spaces for group studies and tech clubs. Capacity: 220+',22.555000,88.306000,'2025-11-19 18:07:12'),(6,'Hostel 13 (PG)','hostel-13','Hostel','Exclusively for postgraduate and research scholars, offering single rooms and quiet study environments. Capacity: 150+',22.555000,88.306000,'2025-11-19 18:07:12'),(7,'Hostel 14','hostel-14','Hostel','Spacious multi-seater for boys, with outdoor sports access and evening cultural events. Capacity: 300+',22.555000,88.306000,'2025-11-19 18:07:12'),(8,'Hostel 15','hostel-15','Hostel','One of the largest, accommodating diverse student batches with 24/7 security. Capacity: 350+',22.555000,88.306000,'2025-11-19 18:07:12'),(9,'Hostel 16','hostel-16','Hostel','Newly renovated with eco-friendly features, ideal for environmentally conscious students. Capacity: 250+',22.555000,88.306000,'2025-11-19 18:07:12'),(10,'Sister Nivedita Hall','sister-nivedita-hall','Hostel','Premier girls\' hostel with modern amenities, safe environment, and dedicated warden support. Capacity: 200+',22.555000,88.306000,'2025-11-19 18:07:12'),(11,'Richardson Hall','richardson-hall','Hostel','Historic 3-storey boys\' hostel built in the early 1960s, with a unique 3-wing design. Capacity: 260+',22.555000,88.306000,'2025-11-19 18:07:12'),(12,'MacDonald Hall','macdonald-hall','Hostel','Single-seated boys\' hall for 3rd and 4th-year UG students, emphasizing discipline and academic focus. Capacity: 150+',22.555000,88.306000,'2025-11-19 18:07:12'),(13,'Sen Hall','sen-hall','Hostel','Single-seated boys\' hall for 3rd and 4th-year UG students, with indoor games and garden. Capacity: 280+',22.555000,88.306000,'2025-11-19 18:07:12'),(14,'Sengupta Hall','sengupta-hall','Hostel','Single-seated boys\' hall named after a renowned professor, with strong traditions. Capacity: 270+',22.555000,88.306000,'2025-11-19 18:07:12'),(15,'Wolfenden Hall','wolfenden-hall','Hostel','Glamorous single-seated boys\' hall for final years, known for its vibrant social life. Capacity: 250+',22.555000,88.306000,'2025-11-19 18:07:12'),(16,'Pandya Hall','pandya-hall','Hostel','Girls\' hostel for 2nd-4th year UG and PG students, near the clock tower. Capacity: 180+',22.555000,88.306000,'2025-11-19 18:07:12'),(17,'Lt. William Hall','lt-william-hall','Hostel','Ladies\' hostel for PG and research scholars, with 2-seater rooms and scenic Ganga views. Capacity: 100+',22.555000,88.306000,'2025-11-19 18:07:12'),(18,'Workshop Complex','workshop-complex','Heritage','The old Workshop complex where the former Bengal Engineering College was originally started. encompassing an area of about 8500 square metres.',22.556000,88.307000,'2025-11-19 18:07:12'),(19,'Slater Hall','slater-hall','Culture','Slater Hall houses some of the clubs and societies of the institute, most notably the Music Club and Innovation Centre.',22.556000,88.307000,'2025-11-19 18:07:12'),(20,'Clock Tower','clock-tower','Heritage','The IIEST Shibpur clock tower is an iconic, century-old engineering marvel with a unique, intricate mechanical movement.',22.556000,88.307000,'2025-11-19 18:07:12'),(21,'Downing Hall','downing-hall','Heritage','Possibly oldest hostel of IIEST Shibpur, built in 19th century. Named after first principal S.F. Downing.',22.556000,88.307000,'2025-11-19 18:07:12');
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-20  9:58:11
