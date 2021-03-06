-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: meetgrid
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `blocked` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
INSERT INTO `block` VALUES (25,3,16),(26,3,10),(27,3,12);
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `favorited` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES (1,3,6),(6,5,3),(10,3,5),(13,3,4),(14,3,12),(15,3,11),(16,3,15),(17,3,17),(19,3,18),(21,3,19),(22,6,3);
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `pic` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (31,3,6,'una foto','2020-11-09 19:07:18','https://firebasestorage.googleapis.com/v0/b/meetgridalixar.appspot.com/o/images%2F1231604945235656?alt=media&token=f7ec7b24-8584-4f4d-b73e-c9f875118ad8'),(32,3,6,'SABES LO QUE TE DIGO? SO FEA','2020-11-09 19:23:37','https://firebasestorage.googleapis.com/v0/b/meetgridalixar.appspot.com/o/images%2F1231604946212288?alt=media&token=62faee8e-67bc-44ce-9d73-4e5974a9362a'),(33,3,6,'EL PEPE','2020-11-09 19:36:29','https://firebasestorage.googleapis.com/v0/b/meetgridalixar.appspot.com/o/messagepics%2F1231604946984835?alt=media&token=23d5268c-3e6a-4c04-8821-0f0a72254534'),(34,6,3,'Yo como sigas enviandome mensajes:','2020-11-09 21:08:03','https://firebasestorage.googleapis.com/v0/b/meetgridalixar.appspot.com/o/messagepics%2F1231604952479475?alt=media&token=8ac42405-7600-4625-975b-fd16e8afc20c'),(35,3,17,'Hola','2020-11-18 12:54:23',''),(36,3,6,'Hola','2020-11-18 19:20:01',''),(37,3,5,'Hola Tifa!','2020-11-18 20:01:54','');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `reported` int(11) NOT NULL,
  `motive` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (10,3,4,'Cloud es emo.','2020-10-22 21:40:55'),(20,3,12,'Dice palabrotas.','2020-11-04 00:20:54'),(23,3,5,'Me ha pegao.','2020-11-09 22:40:25'),(25,3,17,'Amenaza de muerte.','2020-11-09 22:43:04'),(26,3,16,'Es un ESPÍA','2020-11-19 23:36:20');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `type` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` int(1) NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `pic` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2a$10$6ssNkpxsNlw2YqzaDDB6P.Z.t2zs9gD0Lnx55pMhbpzWD6OfA9B56',1,'AdminPrueba',30,'N','Sevilla',NULL,NULL),(3,'prueba','$2a$10$z95UfdXEft5DTKZNklhnwe53/Hbb6IATXHtABVc3GHASQBbhw21DC',2,'User',31,'H','Sevilla','https://firebasestorage.googleapis.com/v0/b/meetgridalixar.appspot.com/o/images%2F1231604958342628?alt=media&token=e108b2c0-cc95-486d-8a44-1468297bd251','<p><b>EL VERDADERO ADMIN</b></p><p><b><br></b></p><p><b><br></b></p><p style=\"text-align: right; \">...o no.</p>'),(4,'cloud@meetgrid.com','$2a$10$HHWIfgGzue38XtheN7stwOvSYotnR.PU4RXA78YXxul8GSL3GG4ju',2,'Cloud',21,'H','Madrid','https://static1-www.millenium.gg/articles/3/11/01/3/@/124281-cloud-avatar3-full-1.jpg','Omnilátigo.'),(5,'tifa@meetgrid.com','$2a$10$w05m.EdERa5VAaZvSTrHJeQ5z.rM0iOCkqvtSrgK9IlqvcGXP87s6',2,'Tifa',23,'M','Madrid','https://static1-www.millenium.gg/articles/3/11/01/3/@/124311-tifa-avatar1-full-1.jpg','Shiva.'),(6,'aeris@meetgrid.com','$2a$10$WOc4/wHMQh2gHVzhtODL1.kFNfrNWLhiTs3Eexb4V3ww2D8HTCsX2',2,'Aeris',25,'M','Madrid','https://static1-www.millenium.gg/articles/3/11/01/3/@/124323-aerith-avatar1-full-1.jpg','Anciana.'),(10,'caith@meetgrid.com','$2a$10$mKFE/kdD09dT0j82/ZCrCevpgdZK2PxQK64Rho14aF9iRLw1g0eKu',2,'Cait_Sith',30,'N','Sevilla','https://dissidiadb.com/static/img/cait_sith.c822d00.png','Shhhhh!'),(12,'barret@meetgrid.com','$2a$10$tfmz0VFeYlKJkyU1jVUNJ.Nxb2MxqJzQJ3Fwvq8ede4iSGXZt2P5S',2,'Barret',32,'H','Teruel','https://static1-www.millenium.gg/articles/3/11/01/3/@/124302-barret-avatar2-full-1.jpg','Tengo una hija.'),(16,'carlos@meetgrid.com','$2a$10$ArLsCwmISlPOKYDxRfljDOru6ENHBF00jqy7ugORG87VQydJlxOea',2,'Carlos_Oliveira',25,'H','Cuenca','https://firebasestorage.googleapis.com/v0/b/meetgridalixar.appspot.com/o/images%2F1231604701972190?alt=media&token=c3aeb069-73dc-478f-b588-b6f2a78a7a17','<p>NO SOY <b>ESPIA</b></p>'),(17,'jill@meetgrid.com','$2a$10$jJMcWVQ4UAH19Au.SQLkTezmniTUTv99mBQ9MPXbMwH58kHtQsGUW',2,'Jill_Valentine',23,'M','Cuenca','https://pbs.twimg.com/media/EYDkSljXQAcIUHk.jpg','STARS'),(18,'leon@meetgrid.com','$2a$10$FrOYCuh7ezgh27yk4edthOW8HfrpiEw8Dx0ULAmO.hCoYqw8jxeTK',2,'Leon_Kennedy',21,'H','Cuenca','https://pbs.twimg.com/profile_images/1107340557943259138/o5dHqbA0_400x400.jpg','RPD'),(19,'claire@meetgrid.com','$2a$10$Hi7K0QzV44pzT7eHgGCYv.EiTkRGhKNgBlFDgLTXGmhM1oJpA29Q.',2,'Claire_Redfield',19,'M','Cuenca','https://movieleatherjackets.com/wp-content/uploads/2020/01/Resident-Evil-2-Claire-Redfield-Jacket02.jpg','<p>-Motos.</p><p>-Activismo.</p><p>-Chris si me lees, <b><u>contacta conmigo.</u></b></p>');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-19 23:40:39
