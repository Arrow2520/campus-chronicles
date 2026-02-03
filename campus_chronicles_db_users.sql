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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(120) NOT NULL,
  `roll_number` varchar(20) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `roll_number` (`roll_number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@iiests.ac.in','ADMIN001','temp_hash_admin','admin','2025-12-23 15:05:01','Temp_Admin'),(2,'2024csb052.soubhik@students.iiests.ac.in','2024CSB052','scrypt:32768:8:1$cXJVkMXSyxlOIUhP$ef6b8b4455fe2a355b7dea98125223429e37fadf9003618e44306d94fed80f66832c681678809b77cde5bdce6ad82b447bbefae9b6ae52fec2e1851ee597d2a0','admin','2025-12-23 15:18:10','Soubhik Raha'),(3,'2024csb058.tamanna@students.iiests.ac.in','2024csb058','scrypt:32768:8:1$MMPSMqeeoLPt3Wjc$eb99422649875c9ed892727303d9482394c3b2e1fbe00c6b87f9ef21aefc031c10e191d779c1c814eafc969deffbf3c5c44d0c1ca57adda460242b12f705921f','user','2025-12-23 15:32:15','Tamanna'),(4,'2024csb034.subhajit@students.iiests.ac.in','2024CSB034','scrypt:32768:8:1$XdgjWADpOKctbKgy$2bc75b2f56e2bd1345b1e68993d42d72582dece613532cb9108399317ce5c772afea53fe029d09ca4ecfb865f48355e3e767881cc4814085eb26728bb2b8d947','user','2025-12-23 17:06:56','Subhajit Saha'),(5,'2024eeb113.debangik@students.iiests.ac.in','2024EEB113','scrypt:32768:8:1$TgDdLJsoTAutTTTM$367c0696a5e686dd40281b35bfe5e039ded70d07d5759d3fdfd28af1cfb57b36384f2352026c7792290a6b4f401bc79e6e66f4c58f85dbf4be560098c7b6baa0','user','2026-01-06 18:04:28','Debangik Biswas');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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

-- Dump completed on 2026-02-03 14:51:41
