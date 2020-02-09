-- MySQL dump 10.13  Distrib 8.0.19, for osx10.14 (x86_64)
--
-- Host: eu-cdbr-west-02.cleardb.net    Database: heroku_6e0756b43116fe9
-- ------------------------------------------------------
-- Server version	5.6.46-log

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
-- Current Database: `heroku_6e0756b43116fe9`
--

-- CREATE DATABASE /*!32312 IF NOT EXISTS*/ `heroku_6e0756b43116fe9` /*!40100 DEFAULT CHARACTER SET utf8 */;

-- USE `heroku_6e0756b43116fe9`;

--
-- Table structure for table `active_storage_attachments`
--

DROP TABLE IF EXISTS `active_storage_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_storage_attachments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `record_type` varchar(255) NOT NULL,
  `record_id` bigint(20) NOT NULL,
  `blob_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_attachments_uniqueness` (`record_type`,`record_id`,`name`,`blob_id`),
  KEY `index_active_storage_attachments_on_blob_id` (`blob_id`),
  CONSTRAINT `fk_rails_c3b3935057` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_attachments`
--

LOCK TABLES `active_storage_attachments` WRITE;
/*!40000 ALTER TABLE `active_storage_attachments` DISABLE KEYS */;
INSERT INTO `active_storage_attachments` VALUES (81,'picture','Artwork',81,101,'2020-02-01 14:38:21'),(91,'picture','Artwork',91,111,'2020-02-01 14:45:37'),(111,'picture','Artwork',111,131,'2020-02-01 14:52:33'),(121,'picture','Artwork',121,141,'2020-02-01 14:55:11'),(131,'picture','Artwork',131,151,'2020-02-01 14:56:26'),(141,'picture','Artwork',141,161,'2020-02-01 14:58:13'),(151,'picture','Artwork',151,171,'2020-02-01 15:00:37'),(161,'picture','Artwork',161,181,'2020-02-01 15:01:57'),(171,'picture','Artwork',171,191,'2020-02-01 15:03:48');
/*!40000 ALTER TABLE `active_storage_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_blobs`
--

DROP TABLE IF EXISTS `active_storage_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_storage_blobs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `metadata` text,
  `byte_size` bigint(20) NOT NULL,
  `checksum` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_blobs_on_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_blobs`
--

LOCK TABLES `active_storage_blobs` WRITE;
/*!40000 ALTER TABLE `active_storage_blobs` DISABLE KEYS */;
INSERT INTO `active_storage_blobs` VALUES (1,'x67butu2nveq002yklb3zl6k4teb','munch_dance.jpg','image/jpeg',NULL,190916,'CEwdvQ91UqMxfbxeVoFH9A==','2020-01-30 18:09:57'),(11,'lodby1qpbetlbd2u4froclwvgwux','munch_dance.jpg','image/jpeg',NULL,190916,'CEwdvQ91UqMxfbxeVoFH9A==','2020-01-30 18:49:26'),(101,'admdobyo3dlozeym1mnxrp89lpe2','ПОХОРОН ЯРОСЛАВА МУДРОГО.jpg','image/jpeg','{\"identified\":true,\"width\":631,\"height\":889,\"analyzed\":true}',159337,'hDIGI/H63hnFAygpjw9nwQ==','2020-02-01 14:38:21'),(111,'ohvyjzsoampbz845m6jur0jrsj6f','НАТЮРМОРТ З ГОЛОВОЮ ТА ГІЛКОЮ 2018–2019 ПОЛОТНО, ОЛІЯ 150Х150 СМ.jpg','image/jpeg','{\"identified\":true,\"width\":2338,\"height\":2341,\"analyzed\":true}',1575845,'qEjigG/vxAmFyxRHWHeRwA==','2020-02-01 14:45:37'),(131,'v6v1wnbcy6t1xa1c657vq2ceul7q','library_rose.jpg','image/jpeg','{\"identified\":true,\"width\":1500,\"height\":2191,\"analyzed\":true}',457658,'uorY/puphz4kxrkpXj3AnA==','2020-02-01 14:52:33'),(141,'rxsh0opeddvbedb509hqb7amhyu8','СЕЛФІ #5 2019 ПОЛОТНО, МІШАНА ТЕХНІКА 40X45 СМ.jpg','image/jpeg','{\"identified\":true,\"width\":2943,\"height\":2604,\"analyzed\":true}',1144361,'o2mnbgnKzTqkBfSWbw/BKg==','2020-02-01 14:55:11'),(151,'5zdt8nf7g172oge1y57ptdwew7kf','kurmaz3.jpg','image/jpeg','{\"identified\":true,\"width\":800,\"height\":1185,\"analyzed\":true}',344564,'YZfSfItyKmj9DLEPTgQcyg==','2020-02-01 14:56:26'),(161,'u3b16pthc4iun8bgtxkl53iw01jr','СЕМЕНІВКА 2016 ПСИХІАТРИЧНА ЛІКАРНЯ 2017 АКВАРЕЛЬ ПАПІР 6Х10 СМ .jpg','image/jpeg','{\"identified\":true,\"width\":4724,\"height\":3484,\"analyzed\":true}',1489203,'oNnTBocOE70Rc8J0EKNAwA==','2020-02-01 14:58:13'),(171,'4ttliyiv3rnmrz0exzxdgyyb8gda','ІЗ СЕРІЇ _РОЗРИВ_ 2018 ПАПАР ВУГІЛЛЯ 240x150 см.jpg','image/jpeg','{\"identified\":true,\"width\":1871,\"height\":2960,\"analyzed\":true}',2724884,'SNZ8SzewjZrgw0F/K+6Ijw==','2020-02-01 15:00:37'),(181,'uf5ac05kwb4nwo6o5p74oyws31ty','IMG_1287.JPG','image/jpeg','{\"identified\":true,\"width\":3901,\"height\":2998,\"analyzed\":true}',3733991,'jInQkE5HF9B8NzNtCYLnxA==','2020-02-01 15:01:57'),(191,'b2c8c6k82fbrl35yy4oc2p2tnnhv','ПІСЛЯ МОРОКУ СВІТЛО 2017 ДВП НА ПІДРАМНИКУ, АКРИЛ, КОЛЛАЖ 36Х58 СМ.jpg','image/jpeg','{\"identified\":true,\"width\":769,\"height\":458,\"analyzed\":true}',49690,'v31Tbwqpvo5hYBat1nY6ig==','2020-02-01 15:03:48');
/*!40000 ALTER TABLE `active_storage_blobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

-- DROP TABLE IF EXISTS `ar_internal_metadata`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
-- CREATE TABLE `ar_internal_metadata` (
--   `key` varchar(255) NOT NULL,
--   `value` varchar(255) DEFAULT NULL,
--   `created_at` datetime(6) NOT NULL,
--   `updated_at` datetime(6) NOT NULL,
--   PRIMARY KEY (`key`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;
-- 
-- --
-- -- Dumping data for table `ar_internal_metadata`
-- --
-- 
-- LOCK TABLES `ar_internal_metadata` WRITE;
-- /*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
-- INSERT INTO `ar_internal_metadata` VALUES ('environment','production','2020-01-30 18:08:44.642129','2020-01-30 18:08:44.642129');
-- /*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (51,'YEVGEN GOLUBENTSEV','','2020-02-01 14:36:30.540719','2020-02-01 14:36:30.540719'),(61,'OLGA GAIDASH','','2020-02-01 14:43:29.418392','2020-02-01 14:43:29.418392'),(71,'KSENIA HNYLYTSKA','','2020-02-01 14:46:29.501519','2020-02-01 14:46:29.501519'),(81,'LUCY IVANOVA','','2020-02-01 14:54:26.805283','2020-02-01 14:54:26.805283'),(91,'SASHA KURMAZ','','2020-02-01 14:55:33.928482','2020-02-01 14:55:33.928482'),(101,'ANNA SCHERBYNA','','2020-02-01 14:57:42.030533','2020-02-01 14:57:42.030533'),(111,'SERHIY SABAKAR','','2020-02-01 14:59:30.544180','2020-02-01 14:59:30.544180'),(121,'ALINA YAKUBENKO','','2020-02-01 15:01:06.450534','2020-02-01 15:01:06.450534'),(131,'OLEKSANDRA KADZEVYCH','','2020-02-01 15:03:08.666467','2020-02-01 15:03:08.666467');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artworks`
--

DROP TABLE IF EXISTS `artworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artworks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `artist_id` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `is_preview` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_artworks_on_artist_id` (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artworks`
--

LOCK TABLES `artworks` WRITE;
/*!40000 ALTER TABLE `artworks` DISABLE KEYS */;
INSERT INTO `artworks` VALUES (81,'FUNERAL OF YAROSLAV MUDRII PHOTO','30 x 21, paper, marker',51,'2020-02-01 14:38:21.081940','2020-02-01 14:38:21.384295',1),(91,'STILL LIFE WITH HEAD AND BRANCH','OIL ON CANVAS, 150x150, 2018-2019',61,'2020-02-01 14:45:37.849383','2020-02-01 14:45:38.794044',1),(111,'FRAGMENT OF THE ROSE ON VERNADSKYI LIBRARY','OIL ON CANVAS, 174x118, 2017-2019',71,'2020-02-01 14:52:33.346578','2020-02-01 14:52:33.751031',1),(121,'SELFIE #5','MIXED ON CANVAS, 40x45, 2019',81,'2020-02-01 14:55:11.280955','2020-02-01 14:55:11.707237',1),(131,'FROM THE SERIES “VAIN YOUTH”','PRINT ON PHOTOPAPER, 60X40, 2012',91,'2020-02-01 14:56:26.040882','2020-02-01 14:56:26.350907',1),(141,'SEMENIVKA 2016. HOSPITAL','WATERCOLOR ON PAPER, 6x10, 2018',101,'2020-02-01 14:58:13.755796','2020-02-01 14:58:14.291026',1),(151,'RAPTURE','PAPER, CHARCOAL, 240x150, 2018',111,'2020-02-01 15:00:37.188486','2020-02-01 15:00:37.797408',1),(161,'NO TITLE','ACRILYC ON PAPER, 28x21.5, 2012',121,'2020-02-01 15:01:57.303276','2020-02-01 15:01:57.855219',1),(171,'AFTER DARKNESS LIGHT','PANEL ON STRETCHER, ACRYLIC, COLLAGE, 26x58, 2017',131,'2020-02-01 15:03:48.046774','2020-02-01 15:03:48.588798',1);
/*!40000 ALTER TABLE `artworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

-- DROP TABLE IF EXISTS `schema_migrations`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
-- CREATE TABLE `schema_migrations` (
--   `version` varchar(255) NOT NULL,
--   PRIMARY KEY (`version`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- /*!40101 SET character_set_client = @saved_cs_client */;
-- 
-- --
-- -- Dumping data for table `schema_migrations`
-- --
-- 
-- LOCK TABLES `schema_migrations` WRITE;
-- /*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
-- INSERT INTO `schema_migrations` VALUES ('20200125202614'),('20200125202652'),('20200128184637'),('20200128190527'),('20200130145206'),('20200130145212');
-- /*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
-- UNLOCK TABLES;
-- /*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-06 18:42:00
