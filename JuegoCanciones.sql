CREATE DATABASE  IF NOT EXISTS `juegocanciones` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `juegocanciones`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: juegocanciones
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `artistas`
--

DROP TABLE IF EXISTS `artistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artistas` (
  `idArtista` int NOT NULL AUTO_INCREMENT,
  `nombreArtista` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idArtista`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artistas`
--

LOCK TABLES `artistas` WRITE;
/*!40000 ALTER TABLE `artistas` DISABLE KEYS */;
INSERT INTO `artistas` VALUES (1,'Chayanne'),(2,'David Bisbal'),(3,'David Civera'),(4,'Jacob Forever'),(5,'Nando Pro'),(6,'Michel Delgado'),(7,'Georgie Dann'),(8,'Raúl Fuentes'),(9,'Shakira'),(10,'Morat'),(11,'Juanes'),(12,'Txus di Fellatio'),(13,'Sergio Cisneros Anguita'),(14,'José Andrëa');
/*!40000 ALTER TABLE `artistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancionartista`
--

DROP TABLE IF EXISTS `cancionartista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancionartista` (
  `idCancionArtista` int NOT NULL AUTO_INCREMENT,
  `idArtistaFK` int DEFAULT NULL,
  `idCancionFK` int DEFAULT NULL,
  PRIMARY KEY (`idCancionArtista`),
  KEY `idArtistaFK1` (`idArtistaFK`),
  KEY `idCancionFK3` (`idCancionFK`),
  CONSTRAINT `idArtistaFK1` FOREIGN KEY (`idArtistaFK`) REFERENCES `artistas` (`idArtista`),
  CONSTRAINT `idCancionFK3` FOREIGN KEY (`idCancionFK`) REFERENCES `canciones` (`idCancion`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancionartista`
--

LOCK TABLES `cancionartista` WRITE;
/*!40000 ALTER TABLE `cancionartista` DISABLE KEYS */;
INSERT INTO `cancionartista` VALUES (16,1,1),(17,2,2),(18,2,3),(19,3,4),(21,4,5),(22,5,5),(23,6,5),(24,7,6),(25,8,7),(26,9,8),(27,10,9),(28,11,9),(29,12,10),(30,13,10),(31,14,10);
/*!40000 ALTER TABLE `cancionartista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canciones`
--

DROP TABLE IF EXISTS `canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canciones` (
  `idCancion` int NOT NULL AUTO_INCREMENT,
  `tituloCancion` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `folderCancion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `filenameCancion` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idCancion`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canciones`
--

LOCK TABLES `canciones` WRITE;
/*!40000 ALTER TABLE `canciones` DISABLE KEYS */;
INSERT INTO `canciones` VALUES (1,'Torero','/assets/audio/','torero.mp3'),(2,'Ave María','/assets/audio/','ave_maria.mp3'),(3,'A partir de hoy','/assets/audio/','a_partir_de_hoy.mp3'),(4,'Que la detengan','/assets/audio/','que_la_detengan.mp3'),(5,'La gozadera','/assets/audio/','la_gozadera.mp3'),(6,'La barbacoa','/assets/audio/','la_barbacoa.mp3'),(7,'Sueño su boca','/assets/audio/','sueno_tu_boca.mp3'),(8,'Waka Waka','/assets/audio/','waka_waka.mp3'),(9,'Besos en guerra','/assets/audio/','besos_en_guerra.mp3'),(10,'Fiesta pagana','/assets/audio/','fiesta_pagana.mp3'),(11,'Baila el Chiki Chiki','/assets/audio/','baila_el_chiki_chiki.mp3'),(12,'Vino tinto','/assets/audio/','vino_tinto.mp3'),(13,'Yo te esperaré','/assets/audio/','yo_te_esperare.mp3'),(14,'Berlín','/assets/audio/','Aitana_Berlín.mp3'),(15,'Tatoo','/assets/audio/','Camilo_Tattoo.mp3'),(16,'Colgando en tus manos','/assets/audio/','Carlos_Baute_Colgando_en_tus_manos.mp3'),(17,'Slomo','/assets/audio/','Chanel_SloMo.mp3'),(18,'La Mayonesa','/assets/audio/','Chocolate_La_Mayonesa.mp3'),(19,'Si tú la quieres','/assets/audio/','David_Bisbal_Aitana_Si_Tú_La_Quieres.mp3'),(20,'Esperanza','/assets/audio/','Diego_Torres_Color_Esperanza.mp3'),(21,'La raja de tu falda','/assets/audio/','Estopa_La_Raja_de_Tu_Falda.mp3'),(22,'A Dios le pido','/assets/audio/','Juanes_A_Dios_Le_Pido.mp3'),(23,'La camisa negra','/assets/audio/','Juanes_La_Camisa_Negra.mp3'),(24,'Bomba','/assets/audio/','King_africa_Bomba.mp3'),(25,'Despacito','/assets/audio/','Luis_Fonsi_Despacito.mp3'),(26,'Carolina','/assets/audio/','M_Clan_Carolina.mp3'),(27,'Hawái','/assets/audio/','Maluma_Hawái.mp3'),(28,'Tacones rojos','/assets/audio/','Sebastián_Yatra_Tacones_Rojos.mp3'),(29,'Tu me dejaste de querer','/assets/audio/','Tangana_Tu_me_dejaste_de_querer.mp3'),(30,'Mon Amour','/assets/audio/','Zzoilo&Aitana_Mon_Amour.mp3'),(31,'Besos','/assets/audio/','El_Canto_del_Loco_Besos.mp3'),(32,'Por la boca vive el pez','/assets/audio/','Fito_Y_Fitipaldis_Por_la_boca_vive_el_pez.mp3'),(33,'20 de enero','/assets/audio/','La_Oreja_de_Van_Gogh_20_de_Enero.mp3'),(34,'Caminando por la vida','/assets/audio/','Melendi_Caminando_por_la_vida.mp3'),(35,'Livin la vida loca','/assets/audio/','Ricky_Martin_Livin_La_Vida_Loca.mp3'),(36,'Como quieres que te quiera','/assets/audio/','Rosario_Como_Quieres_Que_Te_Quiera.mp3'),(37,'Salomé','/assets/audio/','Chayanne_Salomé.mp3'),(38,'Siete vidas','/assets/audio/','Antonio_Flores_Siete_Vidas.mp3');
/*!40000 ALTER TABLE `canciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partidas`
--

DROP TABLE IF EXISTS `partidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partidas` (
  `idPartida` int NOT NULL AUTO_INCREMENT,
  `tiempoPartida` time DEFAULT NULL,
  `fechaPartida` datetime DEFAULT NULL,
  `idUsuarioFK` int DEFAULT NULL,
  PRIMARY KEY (`idPartida`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partidas`
--

LOCK TABLES `partidas` WRITE;
/*!40000 ALTER TABLE `partidas` DISABLE KEYS */;
INSERT INTO `partidas` VALUES (1,'15:00:00','2022-04-30 15:10:51',1),(2,'18:00:00','2022-04-06 12:29:22',2),(285,NULL,'2022-05-31 16:24:06',25),(286,NULL,'2022-05-31 16:24:11',25),(287,NULL,'2022-05-31 16:24:36',25),(288,NULL,'2022-06-01 12:29:58',25),(289,NULL,'2022-06-01 12:34:24',25),(290,NULL,'2022-06-01 12:43:35',26),(291,NULL,'2022-06-01 13:03:54',1),(292,NULL,'2022-06-06 16:21:29',1),(293,NULL,'2022-06-06 16:23:17',1),(294,NULL,'2022-06-06 16:24:28',1),(295,NULL,'2022-06-06 16:26:03',1),(296,NULL,'2022-06-06 16:26:07',1),(297,NULL,'2022-06-06 16:43:35',29),(298,NULL,'2022-06-06 16:45:40',29),(299,NULL,'2022-06-06 16:46:48',29),(300,NULL,'2022-06-06 16:46:56',29),(301,NULL,'2022-06-06 16:47:21',29),(302,NULL,'2022-06-06 16:47:43',29),(303,NULL,'2022-06-06 16:49:21',29),(304,NULL,'2022-06-06 16:57:27',29),(305,NULL,'2022-06-09 09:34:57',30),(306,NULL,'2022-06-10 14:15:12',29),(307,NULL,'2022-06-11 12:44:22',29),(308,NULL,'2022-06-11 12:46:57',31),(309,NULL,'2022-06-11 13:24:28',30),(310,NULL,'2022-06-13 00:56:53',30),(311,NULL,'2022-06-13 00:57:50',30),(312,NULL,'2022-06-16 15:06:56',30),(313,NULL,'2022-06-16 15:07:33',30),(314,NULL,'2022-06-16 15:08:16',30),(315,NULL,'2022-06-16 15:08:44',30),(316,NULL,'2022-06-16 15:14:14',30),(317,NULL,'2022-06-16 15:15:34',30),(318,NULL,'2022-06-16 15:17:40',30),(319,NULL,'2022-06-16 15:18:33',30),(320,NULL,'2022-06-16 15:22:31',30),(321,NULL,'2022-06-16 15:22:54',30),(322,NULL,'2022-06-16 15:23:17',30),(323,NULL,'2022-06-16 15:24:04',30),(324,NULL,'2022-06-16 15:24:26',30),(325,NULL,'2022-06-16 15:25:24',30),(326,NULL,'2022-06-16 15:28:28',30),(327,NULL,'2022-06-16 15:28:32',30),(328,NULL,'2022-06-16 15:30:19',30),(329,NULL,'2022-06-16 15:30:42',30),(330,NULL,'2022-06-16 15:31:14',30),(331,NULL,'2022-06-16 15:31:49',30),(332,NULL,'2022-06-16 15:32:05',30),(333,NULL,'2022-06-16 15:33:00',30),(334,NULL,'2022-06-16 15:33:09',30),(335,NULL,'2022-06-16 15:33:50',30),(336,NULL,'2022-06-16 15:34:27',30),(337,NULL,'2022-06-16 15:35:10',30),(338,NULL,'2022-06-16 15:35:50',30),(339,NULL,'2022-06-16 15:56:21',30);
/*!40000 ALTER TABLE `partidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuestas` (
  `idRepuesta` int NOT NULL AUTO_INCREMENT,
  `puntuacionRespuesta` int DEFAULT NULL,
  `idPartidaFK` int DEFAULT NULL,
  `idCancionFK` int DEFAULT NULL,
  `idCancionRespuestaFK` int DEFAULT NULL,
  PRIMARY KEY (`idRepuesta`),
  KEY `idPartidaFK1_idx` (`idPartidaFK`),
  KEY `idCancionFK2_idx` (`idCancionFK`),
  KEY `idCancionRespuestaFK5` (`idCancionRespuestaFK`),
  CONSTRAINT `idCancionFK2` FOREIGN KEY (`idCancionFK`) REFERENCES `canciones` (`idCancion`),
  CONSTRAINT `idCancionRespuestaFK5` FOREIGN KEY (`idCancionRespuestaFK`) REFERENCES `canciones` (`idCancion`),
  CONSTRAINT `idPartidaFK4` FOREIGN KEY (`idPartidaFK`) REFERENCES `partidas` (`idPartida`)
) ENGINE=InnoDB AUTO_INCREMENT=650 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
INSERT INTO `respuestas` VALUES (1,10,1,3,1),(2,4,2,10,10),(3,8,2,1,1),(4,4,2,1,1),(5,100,2,1,1),(9,10,1,2,2),(358,20,286,4,4),(359,20,286,13,13),(360,0,286,7,12),(361,20,286,11,11),(362,20,287,10,10),(363,0,287,5,6),(364,0,287,2,7),(365,20,287,3,3),(366,0,288,1,4),(367,0,288,2,4),(368,20,288,12,12),(369,20,288,9,9),(370,20,289,4,4),(371,20,289,3,3),(372,20,289,12,12),(373,20,289,1,1),(374,0,291,3,13),(375,20,291,4,4),(376,20,291,6,6),(377,0,291,10,12),(378,0,292,12,8),(379,0,292,9,6),(380,20,292,5,5),(381,0,292,11,10),(382,0,292,4,2),(383,20,292,13,13),(384,20,292,3,3),(385,20,292,2,2),(386,0,294,1,15),(387,0,294,25,13),(388,0,294,2,19),(389,20,294,21,21),(390,0,294,3,28),(391,0,294,30,20),(392,20,294,26,26),(393,0,294,5,6),(394,0,296,30,22),(395,20,296,10,10),(396,20,296,4,4),(397,0,296,15,24),(398,20,296,12,12),(399,0,296,8,17),(400,0,296,19,29),(401,20,296,6,6),(402,0,296,25,14),(403,0,296,1,16),(404,20,297,14,14),(405,20,297,15,15),(406,0,297,20,7),(407,20,297,25,25),(408,20,297,6,6),(409,20,297,11,11),(410,20,297,18,18),(411,20,297,4,4),(412,0,297,17,13),(413,20,297,26,26),(414,20,298,5,5),(415,20,300,16,16),(416,20,300,3,3),(417,20,300,24,24),(418,20,300,7,7),(419,20,300,22,22),(420,20,300,8,8),(421,20,300,28,28),(422,20,300,20,20),(423,0,301,20,25),(424,0,301,28,15),(425,0,301,4,26),(426,20,301,2,2),(427,0,301,10,22),(428,20,301,1,1),(429,0,301,6,7),(430,20,301,27,27),(431,0,302,29,11),(432,20,302,17,17),(433,0,302,23,5),(434,0,302,12,8),(435,0,302,1,16),(436,20,302,20,20),(437,0,302,6,3),(438,0,302,28,15),(439,0,303,8,7),(440,20,303,5,5),(441,20,303,4,4),(442,20,303,16,16),(443,20,303,10,10),(444,0,303,28,13),(445,20,303,21,21),(446,20,303,15,15),(447,0,304,22,6),(448,0,304,1,18),(449,0,304,2,6),(450,0,304,9,25),(451,0,304,26,17),(452,0,304,10,30),(453,0,304,3,24),(454,0,304,15,4),(455,20,305,25,25),(456,0,305,22,23),(457,20,305,1,1),(458,20,305,11,11),(459,20,305,9,9),(460,20,305,21,21),(461,20,305,26,26),(462,20,305,16,16),(463,20,306,17,17),(464,20,306,11,11),(465,0,306,8,16),(466,20,306,6,6),(467,20,306,14,14),(468,20,306,21,21),(469,20,306,29,29),(470,0,306,1,5),(471,20,308,6,6),(472,0,308,13,7),(473,0,308,20,26),(474,20,308,14,14),(475,20,308,5,5),(476,0,308,23,19),(477,20,308,16,16),(478,20,308,18,18),(479,0,309,30,25),(480,0,309,19,25),(481,0,309,11,27),(482,20,309,24,24),(483,20,309,6,6),(484,20,309,28,28),(485,20,309,14,14),(486,20,309,15,15),(487,0,311,1,7),(488,20,311,25,25),(489,20,312,13,13),(490,0,312,29,9),(491,0,312,3,30),(492,0,312,11,22),(493,0,312,37,35),(494,20,312,32,32),(495,0,312,34,5),(496,20,312,24,24),(497,20,312,38,38),(498,20,312,2,2),(499,0,313,22,27),(500,0,313,34,33),(501,20,315,11,11),(502,20,315,10,10),(503,20,315,19,19),(504,20,315,16,16),(505,20,315,14,14),(506,20,318,17,17),(507,20,318,21,21),(508,20,318,32,32),(509,20,318,26,26),(510,20,318,29,29),(511,20,318,3,3),(512,20,318,36,36),(513,20,318,15,15),(514,20,318,18,18),(515,20,318,30,30),(516,0,319,31,9),(517,20,319,10,10),(518,0,319,37,12),(519,0,319,34,3),(520,0,319,15,12),(521,20,321,31,31),(522,0,321,1,3),(523,0,321,9,21),(524,20,321,30,30),(525,20,321,27,27),(526,0,321,13,19),(527,0,321,25,34),(528,0,321,36,15),(529,0,321,12,8),(530,0,321,16,14),(531,20,322,1,1),(532,20,322,28,28),(533,20,322,29,29),(534,20,322,33,33),(535,20,322,27,27),(536,20,322,15,15),(537,20,322,4,4),(538,20,322,11,11),(539,20,322,36,36),(540,20,322,38,38),(541,20,323,1,1),(542,20,323,30,30),(543,0,323,20,35),(544,20,324,5,5),(545,20,324,1,1),(546,20,324,20,20),(547,0,324,38,19),(548,20,324,7,7),(549,20,324,28,28),(550,20,324,26,26),(551,20,324,33,33),(552,20,324,8,8),(553,20,324,10,10),(554,20,325,29,29),(555,20,325,1,1),(556,0,325,12,15),(557,20,325,20,20),(558,0,325,25,36),(559,20,325,17,17),(560,0,325,2,27),(561,20,325,23,23),(562,0,325,8,19),(563,0,325,24,38),(564,20,327,17,17),(565,0,327,18,36),(566,0,327,20,14),(567,0,327,28,33),(568,0,327,6,26),(569,0,328,31,24),(570,0,328,20,36),(571,0,328,4,19),(572,0,328,32,15),(573,0,328,35,11),(574,0,328,2,8),(575,20,328,22,22),(576,0,328,37,5),(577,0,328,38,30),(578,0,328,28,33),(579,0,329,31,23),(580,0,329,2,22),(581,0,329,15,7),(582,0,329,18,16),(583,0,329,27,10),(584,0,329,35,6),(585,20,329,29,29),(586,0,331,11,24),(587,0,331,18,22),(588,0,331,16,12),(589,20,331,3,3),(590,0,331,10,1),(591,0,331,4,20),(592,0,331,6,5),(593,0,332,27,15),(594,0,332,12,38),(595,0,332,20,33),(596,0,333,8,37),(597,0,333,7,38),(598,20,333,24,24),(599,20,334,29,29),(600,20,334,24,24),(601,20,334,26,26),(602,0,334,32,16),(603,20,334,6,6),(604,20,334,5,5),(605,20,334,28,28),(606,20,334,10,10),(607,20,334,25,25),(608,20,334,21,21),(609,20,335,29,29),(610,20,335,5,5),(611,20,335,10,10),(612,20,335,36,36),(613,20,335,8,8),(614,20,335,12,12),(615,20,335,13,13),(616,20,335,7,7),(617,0,335,31,38),(618,20,335,11,11),(619,20,336,25,25),(620,20,336,14,14),(621,20,336,1,1),(622,20,336,21,21),(623,20,336,16,16),(624,20,336,20,20),(625,20,336,23,23),(626,20,336,11,11),(627,20,336,3,3),(628,20,336,26,26),(629,20,337,14,14),(630,20,337,8,8),(631,20,337,36,36),(632,20,337,23,23),(633,20,337,20,20),(634,20,337,27,27),(635,20,337,33,33),(636,0,337,7,37),(637,20,337,19,19),(638,20,337,2,2),(639,20,338,26,26),(640,20,338,22,22),(641,0,338,24,6),(642,20,338,20,20),(643,20,338,35,35),(644,20,338,12,12),(645,20,338,23,23),(646,20,338,31,31),(647,20,338,36,36),(648,20,338,3,3),(649,0,339,7,11);
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `passwordUsuario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `aliasUsuario` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `permisoUsuario` tinyint DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan','e3a96c29002aed35295dc9c062e1f331','Jmr',1),(2,'admin','21232f297a57a5a743894a0e4a801fc3','admin',0),(24,'vayatela','28e8f88b45db29c25ed7fca987b7dae5','vayatela',1),(25,'mentalista1','ecec8fb5a305f8715fb3937f0110e7b8','mentalista1',1),(26,'pepe','bf38983aac6827fb6b65f2824aafe3f2','pepe1',1),(27,'maria','263bce650e68ab4e23f28263760b9fa5','maria',1),(28,'joder','8b00d07deaa9ffc877c9d936fbaabbe0','joder',1),(29,'aaaaaaaaaaaa','45e4812014d83dde5666ebdf5a8ed1ed','aaaaaaaaaaaa',1),(30,'Juan1','e3a96c29002aed35295dc9c062e1f331','juan1',1),(31,'Marta','a763a66f984948ca463b081bf0f0e6d0','Martita',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-16 16:18:31
