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
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `place_id` int NOT NULL,
  `image_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `place_id` (`place_id`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,1,'https://knowiiest.netlify.app/static/media/hostel7.58d5d684.png'),(2,2,'https://knowiiest.netlify.app/static/media/hostel8.440bb57c.jfif'),(3,3,'https://knowiiest.netlify.app/static/media/hostel10.b47af077.jpg'),(4,4,'https://knowiiest.netlify.app/static/media/aksealhall.1bd1686b.jpg'),(5,5,'https://knowiiest.netlify.app/static/media/hostel11.9744c011.jpg'),(6,6,'https://knowiiest.netlify.app/static/media/hostel13.ad0735be.jpg'),(7,7,'https://knowiiest.netlify.app/static/media/hostel14.b1fabce5.jpg'),(8,8,'https://knowiiest.netlify.app/static/media/hostel15.28f6ef9b.jfif'),(9,9,'https://knowiiest.netlify.app/static/media/hostel16.d21b1f83.jpg'),(10,10,'https://knowiiest.netlify.app/static/media/nivedita.6c2f0fb4.jpg'),(11,11,'https://knowiiest.netlify.app/static/media/richardsonhall.d6223ace.jpg'),(12,12,'https://knowiiest.netlify.app/static/media/macdonald.feb126c6.jpg'),(13,13,'https://knowiiest.netlify.app/static/media/senhall.f6cb231c.jpg'),(14,14,'https://knowiiest.netlify.app/static/media/senguptahall.647d9705.jpg'),(15,15,'https://knowiiest.netlify.app/static/media/wolf.1e44ad8a.jfif'),(16,16,'https://knowiiest.netlify.app/static/media/pandyahall.f3e61a2c.jpg'),(17,17,'https://knowiiest.netlify.app/static/media/williamshall.99463110.jpg'),(18,18,'https://knowiiest.netlify.app/static/media/workshop.8f64208c.jpg'),(19,19,'https://knowiiest.netlify.app/static/media/slaterhall.b99a2350.jpg'),(20,20,'https://www.iiests.ac.in/ckfinder/userfiles/files/09(1).jpg'),(21,21,'https://knowiiest.netlify.app/static/media/Downinghall.bcc2b2ed.jpg');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
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

-- Dump completed on 2026-02-03 14:51:32
