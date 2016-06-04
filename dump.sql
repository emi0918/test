-- MySQL dump 10.13  Distrib 5.6.27, for osx10.11 (x86_64)
--
-- Host: localhost    Database: Seekle_development
-- ------------------------------------------------------
-- Server version	5.6.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `note_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (4,45,14,'2016-05-21 09:55:26','2016-05-21 09:55:26'),(6,45,16,'2016-05-21 11:35:33','2016-05-21 11:35:33'),(7,45,15,'2016-05-21 11:36:06','2016-05-21 11:36:06'),(8,57,16,'2016-05-21 11:50:49','2016-05-21 11:50:49'),(10,60,18,'2016-05-21 12:16:58','2016-05-21 12:16:58'),(13,63,20,'2016-05-21 14:07:25','2016-05-21 14:07:25'),(15,63,19,'2016-05-21 14:22:34','2016-05-21 14:22:34'),(16,63,22,'2016-05-22 08:51:00','2016-05-22 08:51:00');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailboxer_conversation_opt_outs`
--

DROP TABLE IF EXISTS `mailboxer_conversation_opt_outs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailboxer_conversation_opt_outs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unsubscriber_id` int(11) DEFAULT NULL,
  `unsubscriber_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type` (`unsubscriber_id`,`unsubscriber_type`),
  KEY `index_mailboxer_conversation_opt_outs_on_conversation_id` (`conversation_id`),
  CONSTRAINT `mb_opt_outs_on_conversations_id` FOREIGN KEY (`conversation_id`) REFERENCES `mailboxer_conversations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailboxer_conversation_opt_outs`
--

LOCK TABLES `mailboxer_conversation_opt_outs` WRITE;
/*!40000 ALTER TABLE `mailboxer_conversation_opt_outs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailboxer_conversation_opt_outs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailboxer_conversations`
--

DROP TABLE IF EXISTS `mailboxer_conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailboxer_conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailboxer_conversations`
--

LOCK TABLES `mailboxer_conversations` WRITE;
/*!40000 ALTER TABLE `mailboxer_conversations` DISABLE KEYS */;
INSERT INTO `mailboxer_conversations` VALUES (1,'hi','2016-05-02 05:09:52','2016-05-02 05:09:52'),(2,'hi','2016-05-02 05:15:33','2016-05-02 05:15:33'),(3,'こんにちわ','2016-05-02 05:47:49','2016-05-02 05:47:49'),(4,'えみですか','2016-05-02 07:25:44','2016-05-02 07:25:44'),(5,'','2016-05-02 07:56:16','2016-05-02 07:56:16'),(6,'','2016-05-02 08:06:32','2016-05-02 08:06:32'),(7,'','2016-05-02 08:06:56','2016-05-02 08:06:56'),(8,'','2016-05-03 02:39:45','2016-05-03 02:39:45'),(9,'','2016-05-03 03:43:53','2016-05-03 03:43:53'),(10,'','2016-05-03 05:19:44','2016-05-03 05:19:44'),(11,'','2016-05-03 05:21:26','2016-05-03 05:21:26'),(12,'','2016-05-03 05:22:06','2016-05-03 05:22:06'),(13,'','2016-05-03 05:22:21','2016-05-03 05:22:21'),(14,'','2016-05-03 05:41:43','2016-05-03 05:41:43'),(15,'','2016-05-03 06:03:14','2016-05-03 06:03:14'),(16,'','2016-05-03 06:04:41','2016-05-03 06:04:41'),(17,'','2016-05-03 06:07:15','2016-05-03 06:07:15'),(18,'','2016-05-03 06:08:12','2016-05-03 06:08:12'),(19,'','2016-05-03 06:09:31','2016-05-03 06:09:31'),(20,'','2016-05-03 06:11:34','2016-05-03 06:11:34'),(21,'','2016-05-03 06:12:26','2016-05-03 06:12:26'),(22,'','2016-05-03 06:13:42','2016-05-03 06:13:42'),(23,'','2016-05-03 06:15:53','2016-05-03 06:15:53'),(24,'','2016-05-03 06:17:25','2016-05-03 06:17:25'),(25,'','2016-05-06 08:39:13','2016-05-06 08:39:13'),(26,'はろ','2016-05-06 10:01:41','2016-05-06 10:01:41'),(27,'morikawa','2016-05-06 11:04:22','2016-05-06 11:04:22'),(28,'morikawa','2016-05-06 11:05:18','2016-05-06 11:05:18'),(29,'morikawa','2016-05-06 11:11:36','2016-05-06 11:11:36'),(30,'もりかえあ','2016-05-06 11:12:43','2016-05-06 11:12:43'),(31,'もりかえあ','2016-05-06 11:13:44','2016-05-06 11:13:44'),(32,'あ','2016-05-06 11:47:27','2016-05-06 11:47:27'),(33,'いあう','2016-05-06 11:51:41','2016-05-06 11:51:41'),(34,'あう','2016-05-06 11:52:46','2016-05-06 11:52:46'),(35,'あう','2016-05-06 11:53:14','2016-05-06 11:53:14'),(36,'えいえ','2016-05-06 11:53:34','2016-05-06 11:53:34'),(37,'あいう','2016-05-06 11:54:20','2016-05-06 11:54:20'),(38,'あいう','2016-05-06 11:55:09','2016-05-06 11:55:09'),(39,'あいう','2016-05-06 11:57:06','2016-05-06 11:57:06'),(40,'あ','2016-05-06 11:57:38','2016-05-06 11:57:38'),(41,'あ','2016-05-06 11:59:11','2016-05-06 11:59:11'),(42,'あ','2016-05-06 11:59:15','2016-05-06 11:59:15'),(43,'あ','2016-05-06 11:59:45','2016-05-06 11:59:45'),(44,'あい','2016-05-06 12:03:26','2016-05-06 12:03:26'),(45,'あいう','2016-05-06 12:03:59','2016-05-06 12:03:59'),(46,'くろこ','2016-05-06 12:08:21','2016-05-06 12:08:21'),(47,'くろこ','2016-05-06 12:10:32','2016-05-06 12:10:32'),(48,'くろこ','2016-05-06 12:10:36','2016-05-06 12:10:36'),(49,'あいあ','2016-05-06 12:23:36','2016-05-09 10:45:56'),(50,'もりかわ','2016-05-10 08:02:23','2016-05-10 08:02:23'),(51,'あう','2016-05-10 08:03:00','2016-05-10 08:03:00'),(52,'あいう','2016-05-10 08:04:17','2016-05-10 08:04:17'),(53,'あいう','2016-05-10 08:04:42','2016-05-10 08:04:42'),(54,'あう','2016-05-10 08:06:08','2016-05-10 08:06:08'),(55,'あう','2016-05-10 08:06:10','2016-05-10 08:06:10'),(56,'あいうあ','2016-05-11 09:50:36','2016-05-11 09:50:36'),(57,'a','2016-05-12 03:48:50','2016-05-12 03:48:50'),(58,'てすと','2016-05-13 10:32:57','2016-05-13 10:32:57'),(59,'おーい！','2016-05-13 15:07:49','2016-05-13 15:08:35'),(60,'あいう','2016-05-15 05:21:15','2016-05-15 05:21:15'),(61,'あいう','2016-05-28 04:04:39','2016-05-28 04:04:39');
/*!40000 ALTER TABLE `mailboxer_conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailboxer_notifications`
--

DROP TABLE IF EXISTS `mailboxer_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailboxer_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `sender_id` int(11) DEFAULT NULL,
  `sender_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `draft` tinyint(1) DEFAULT '0',
  `notification_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notified_object_id` int(11) DEFAULT NULL,
  `notified_object_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `global` tinyint(1) DEFAULT '0',
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mailboxer_notifications_on_conversation_id` (`conversation_id`),
  KEY `index_mailboxer_notifications_on_type` (`type`),
  KEY `index_mailboxer_notifications_on_sender_id_and_sender_type` (`sender_id`,`sender_type`),
  KEY `index_mailboxer_notifications_on_notified_object_id_and_type` (`notified_object_id`,`notified_object_type`),
  CONSTRAINT `notifications_on_conversation_id` FOREIGN KEY (`conversation_id`) REFERENCES `mailboxer_conversations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailboxer_notifications`
--

LOCK TABLES `mailboxer_notifications` WRITE;
/*!40000 ALTER TABLE `mailboxer_notifications` DISABLE KEYS */;
INSERT INTO `mailboxer_notifications` VALUES (15,'Mailboxer::Message','あ','あ',32,'User',13,0,NULL,NULL,NULL,NULL,'2016-05-03 05:22:21','2016-05-03 05:22:21',0,NULL),(16,'Mailboxer::Message','くろこ','こんにちわ',32,'User',14,0,NULL,NULL,NULL,NULL,'2016-05-03 05:41:43','2016-05-03 05:41:43',0,NULL),(27,'Mailboxer::Message','はろ','もりかわっっっです',32,'User',25,0,NULL,NULL,NULL,NULL,'2016-05-06 08:39:13','2016-05-06 08:39:13',0,NULL),(28,'Mailboxer::Message','s','はろ',32,'User',26,0,NULL,NULL,NULL,NULL,'2016-05-06 10:01:41','2016-05-06 10:01:41',0,NULL),(29,'Mailboxer::Message','emi','morikawa',32,'User',27,0,NULL,NULL,NULL,NULL,'2016-05-06 11:04:22','2016-05-06 11:04:22',0,NULL),(30,'Mailboxer::Message','ああああああああああああああああああああああああああ','morikawa',32,'User',28,0,NULL,NULL,NULL,NULL,'2016-05-06 11:05:18','2016-05-06 11:05:18',0,NULL),(31,'Mailboxer::Message','ああああああああああああああああああああああああああ','morikawa',32,'User',29,0,NULL,NULL,NULL,NULL,'2016-05-06 11:11:36','2016-05-06 11:11:36',0,NULL),(32,'Mailboxer::Message','あ','もりかえあ',32,'User',30,0,NULL,NULL,NULL,NULL,'2016-05-06 11:12:43','2016-05-06 11:12:43',0,NULL),(33,'Mailboxer::Message','あ','もりかえあ',32,'User',31,0,NULL,NULL,NULL,NULL,'2016-05-06 11:13:44','2016-05-06 11:13:44',0,NULL),(34,'Mailboxer::Message','う','あ',32,'User',32,0,NULL,NULL,NULL,NULL,'2016-05-06 11:47:27','2016-05-06 11:47:27',0,NULL),(35,'Mailboxer::Message','し','いあう',32,'User',33,0,NULL,NULL,NULL,NULL,'2016-05-06 11:51:41','2016-05-06 11:51:41',0,NULL),(36,'Mailboxer::Message','あいう','あう',32,'User',34,0,NULL,NULL,NULL,NULL,'2016-05-06 11:52:46','2016-05-06 11:52:46',0,NULL),(37,'Mailboxer::Message','あいう','あう',32,'User',35,0,NULL,NULL,NULL,NULL,'2016-05-06 11:53:14','2016-05-06 11:53:14',0,NULL),(38,'Mailboxer::Message','あいう','えいえ',32,'User',36,0,NULL,NULL,NULL,NULL,'2016-05-06 11:53:34','2016-05-06 11:53:34',0,NULL),(39,'Mailboxer::Message','あ','あいう',32,'User',37,0,NULL,NULL,NULL,NULL,'2016-05-06 11:54:20','2016-05-06 11:54:20',0,NULL),(40,'Mailboxer::Message','あ','あいう',32,'User',38,0,NULL,NULL,NULL,NULL,'2016-05-06 11:55:09','2016-05-06 11:55:09',0,NULL),(41,'Mailboxer::Message','あ','あいう',32,'User',39,0,NULL,NULL,NULL,NULL,'2016-05-06 11:57:06','2016-05-06 11:57:06',0,NULL),(42,'Mailboxer::Message','あ','あ',32,'User',40,0,NULL,NULL,NULL,NULL,'2016-05-06 11:57:38','2016-05-06 11:57:38',0,NULL),(43,'Mailboxer::Message','あ','あ',32,'User',41,0,NULL,NULL,NULL,NULL,'2016-05-06 11:59:11','2016-05-06 11:59:11',0,NULL),(44,'Mailboxer::Message','あ','あ',32,'User',42,0,NULL,NULL,NULL,NULL,'2016-05-06 11:59:15','2016-05-06 11:59:15',0,NULL),(45,'Mailboxer::Message','あ','あ',32,'User',43,0,NULL,NULL,NULL,NULL,'2016-05-06 11:59:45','2016-05-06 11:59:45',0,NULL),(46,'Mailboxer::Message','し','あい',32,'User',44,0,NULL,NULL,NULL,NULL,'2016-05-06 12:03:26','2016-05-06 12:03:26',0,NULL),(47,'Mailboxer::Message','あ','あいう',32,'User',45,0,NULL,NULL,NULL,NULL,'2016-05-06 12:03:59','2016-05-06 12:03:59',0,NULL),(48,'Mailboxer::Message','あ','くろこ',32,'User',46,0,NULL,NULL,NULL,NULL,'2016-05-06 12:08:21','2016-05-06 12:08:21',0,NULL),(49,'Mailboxer::Message','あ','くろこ',32,'User',47,0,NULL,NULL,NULL,NULL,'2016-05-06 12:10:32','2016-05-06 12:10:32',0,NULL),(50,'Mailboxer::Message','あ','くろこ',32,'User',48,0,NULL,NULL,NULL,NULL,'2016-05-06 12:10:36','2016-05-06 12:10:36',0,NULL),(51,'Mailboxer::Message','あ','あいあ',32,'User',49,0,NULL,NULL,NULL,NULL,'2016-05-06 12:23:36','2016-05-06 12:23:36',0,NULL),(52,'Mailboxer::Message','こんにちえあ','あいあ',32,'User',49,0,NULL,NULL,NULL,NULL,'2016-05-09 10:45:55','2016-05-09 10:45:55',0,NULL),(53,'Mailboxer::Message','もりかわ','もりかわ',32,'User',50,0,NULL,NULL,NULL,NULL,'2016-05-10 08:02:23','2016-05-10 08:02:23',0,NULL),(54,'Mailboxer::Message','あいう','あう',32,'User',51,0,NULL,NULL,NULL,NULL,'2016-05-10 08:03:00','2016-05-10 08:03:00',0,NULL),(55,'Mailboxer::Message','あいう','あいう',32,'User',52,0,NULL,NULL,NULL,NULL,'2016-05-10 08:04:17','2016-05-10 08:04:17',0,NULL),(56,'Mailboxer::Message','あいう','あいう',32,'User',53,0,NULL,NULL,NULL,NULL,'2016-05-10 08:04:42','2016-05-10 08:04:42',0,NULL),(57,'Mailboxer::Message','あう','あう',32,'User',54,0,NULL,NULL,NULL,NULL,'2016-05-10 08:06:08','2016-05-10 08:06:08',0,NULL),(58,'Mailboxer::Message','あう','あう',32,'User',55,0,NULL,NULL,NULL,NULL,'2016-05-10 08:06:10','2016-05-10 08:06:10',0,NULL),(59,'Mailboxer::Message','あ','あいうあ',37,'User',56,0,NULL,NULL,NULL,NULL,'2016-05-11 09:50:36','2016-05-11 09:50:36',0,NULL),(60,'Mailboxer::Message','a','a',37,'User',57,0,NULL,NULL,NULL,NULL,'2016-05-12 03:48:50','2016-05-12 03:48:50',0,NULL),(61,'Mailboxer::Message','haro\r\n','てすと',43,'User',58,0,NULL,NULL,NULL,NULL,'2016-05-13 10:32:57','2016-05-13 10:32:57',0,NULL),(62,'Mailboxer::Message','おーい！','おーい！',42,'User',59,0,NULL,NULL,NULL,NULL,'2016-05-13 15:07:49','2016-05-13 15:07:49',0,NULL),(63,'Mailboxer::Message','yahoooo','おーい！',42,'User',59,0,NULL,NULL,NULL,NULL,'2016-05-13 15:08:16','2016-05-13 15:08:16',0,NULL),(64,'Mailboxer::Message','ffefe','おーい！',42,'User',59,0,NULL,NULL,NULL,NULL,'2016-05-13 15:08:35','2016-05-13 15:08:35',0,NULL),(65,'Mailboxer::Message','あ','あいう',45,'User',60,0,NULL,NULL,NULL,NULL,'2016-05-15 05:21:15','2016-05-15 05:21:15',0,NULL),(66,'Mailboxer::Message','あ','あいう',63,'User',61,0,NULL,NULL,NULL,NULL,'2016-05-28 04:04:39','2016-05-28 04:04:39',0,NULL);
/*!40000 ALTER TABLE `mailboxer_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailboxer_receipts`
--

DROP TABLE IF EXISTS `mailboxer_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailboxer_receipts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_id` int(11) DEFAULT NULL,
  `receiver_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_id` int(11) NOT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `trashed` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `mailbox_type` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mailboxer_receipts_on_notification_id` (`notification_id`),
  KEY `index_mailboxer_receipts_on_receiver_id_and_receiver_type` (`receiver_id`,`receiver_type`),
  CONSTRAINT `receipts_on_notification_id` FOREIGN KEY (`notification_id`) REFERENCES `mailboxer_notifications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailboxer_receipts`
--

LOCK TABLES `mailboxer_receipts` WRITE;
/*!40000 ALTER TABLE `mailboxer_receipts` DISABLE KEYS */;
INSERT INTO `mailboxer_receipts` VALUES (94,31,'User',49,0,0,0,'inbox','2016-05-06 12:10:32','2016-05-06 12:10:32'),(95,32,'User',49,1,0,0,'sentbox','2016-05-06 12:10:32','2016-05-06 12:10:32'),(96,31,'User',50,0,0,0,'inbox','2016-05-06 12:10:36','2016-05-06 12:10:36'),(97,32,'User',50,1,0,0,'sentbox','2016-05-06 12:10:36','2016-05-06 12:10:36'),(98,32,'User',51,1,1,0,'inbox','2016-05-06 12:23:36','2016-05-06 12:23:36'),(99,32,'User',51,1,1,0,'sentbox','2016-05-06 12:23:36','2016-05-06 12:23:36'),(100,32,'User',52,1,1,0,'sentbox','2016-05-09 10:45:56','2016-05-09 10:45:56'),(101,33,'User',53,0,0,0,'inbox','2016-05-10 08:02:23','2016-05-10 08:02:23'),(102,32,'User',53,1,0,0,'sentbox','2016-05-10 08:02:23','2016-05-10 08:02:23'),(103,35,'User',54,0,0,0,'inbox','2016-05-10 08:03:00','2016-05-10 08:03:00'),(104,32,'User',54,1,0,0,'sentbox','2016-05-10 08:03:00','2016-05-10 08:03:00'),(105,31,'User',55,0,0,0,'inbox','2016-05-10 08:04:17','2016-05-10 08:04:17'),(106,32,'User',55,1,0,0,'sentbox','2016-05-10 08:04:17','2016-05-10 08:04:17'),(107,30,'User',56,0,0,0,'inbox','2016-05-10 08:04:42','2016-05-10 08:04:42'),(108,32,'User',56,1,0,0,'sentbox','2016-05-10 08:04:42','2016-05-10 08:04:42'),(109,29,'User',57,0,0,0,'inbox','2016-05-10 08:06:08','2016-05-10 08:06:08'),(110,32,'User',57,1,0,0,'sentbox','2016-05-10 08:06:08','2016-05-10 08:06:08'),(111,29,'User',58,0,0,0,'inbox','2016-05-10 08:06:10','2016-05-10 08:06:10'),(112,32,'User',58,1,0,0,'sentbox','2016-05-10 08:06:10','2016-05-10 08:06:10'),(113,37,'User',59,1,0,0,'sentbox','2016-05-11 09:50:36','2016-05-11 09:50:36'),(114,37,'User',60,1,0,0,'inbox','2016-05-12 03:48:50','2016-05-12 03:48:50'),(115,37,'User',60,1,0,0,'sentbox','2016-05-12 03:48:50','2016-05-12 03:48:50'),(116,42,'User',61,1,0,0,'inbox','2016-05-13 10:32:57','2016-05-13 10:32:57'),(117,43,'User',61,1,0,0,'sentbox','2016-05-13 10:32:57','2016-05-13 10:32:57'),(118,42,'User',62,1,0,0,'inbox','2016-05-13 15:07:50','2016-05-13 15:07:50'),(119,42,'User',62,1,0,0,'sentbox','2016-05-13 15:07:50','2016-05-13 15:07:50'),(120,42,'User',63,1,0,0,'sentbox','2016-05-13 15:08:16','2016-05-13 15:08:16'),(121,42,'User',64,1,0,0,'sentbox','2016-05-13 15:08:35','2016-05-13 15:08:35'),(122,45,'User',65,1,0,0,'inbox','2016-05-15 05:21:16','2016-05-15 05:21:16'),(123,45,'User',65,1,0,0,'sentbox','2016-05-15 05:21:16','2016-05-15 05:21:16'),(124,63,'User',66,1,0,0,'inbox','2016-05-28 04:04:39','2016-05-28 04:04:39'),(125,63,'User',66,1,0,0,'sentbox','2016-05-28 04:04:39','2016-05-28 04:04:39');
/*!40000 ALTER TABLE `mailboxer_receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_1` text COLLATE utf8_unicode_ci,
  `image_2` text COLLATE utf8_unicode_ci,
  `image_3` text COLLATE utf8_unicode_ci,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule` text COLLATE utf8_unicode_ci,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (25,'英語を教えます','ーーー','2016-05-25 07:26:04','2016-05-25 07:26:04','4000','gahag-0047740295.jpg',NULL,NULL,'その他','','63',NULL);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20160325144550'),('20160326075232'),('20160412130617'),('20160414095309'),('20160414102014'),('20160414103127'),('20160414104353'),('20160414131556'),('20160414170824'),('20160415141245'),('20160415145709'),('20160419072139'),('20160419072349'),('20160421053931'),('20160428153619'),('20160428154824'),('20160428155959'),('20160428160355'),('20160428161816'),('20160501074233'),('20160501080630'),('20160501111434'),('20160501131355'),('20160501131356'),('20160501131357'),('20160517055522'),('20160517055917'),('20160517065710'),('20160521082610');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `profile_pic` text COLLATE utf8_unicode_ci,
  `profile` text COLLATE utf8_unicode_ci,
  `area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (60,'a@gmail.com','$2a$10$JfMInS1qcvl07k//stgjF.ABwrJKr3/FU1kp.ioCHvMTwPdKmb86y',NULL,NULL,NULL,3,'2016-05-21 14:19:48','2016-05-21 12:22:38','::1','::1','2016-05-21 12:15:15','2016-05-21 14:19:48',NULL,NULL,'岩手県','あ',NULL,NULL,NULL),(61,'b@gmail.com','$2a$10$tuciFHAjX9YK0x4KOQZBJOPWZM48Ks8qEkZUS.GTqrQGqTo3AhgIO',NULL,NULL,NULL,2,'2016-05-21 12:35:30','2016-05-21 12:18:24','::1','::1','2016-05-21 12:18:24','2016-05-21 12:35:30',NULL,NULL,'山形県','く',NULL,NULL,NULL),(62,'c@gmail.com','$2a$10$9qlQ1y3oogBUalcPyIz3ku49qrecjsfU4uJzOeI31ydHnYVMyEbkS',NULL,NULL,NULL,1,'2016-05-21 12:54:04','2016-05-21 12:54:04','::1','::1','2016-05-21 12:54:04','2016-05-21 12:54:04',NULL,NULL,'青森県','み',NULL,NULL,NULL),(63,'cew@gmail.com','$2a$10$A/O/DRndSd6dqN7x4Pt.h.Q/YBCieEmJeE.s/h51ytxzrcpQk1haa',NULL,NULL,NULL,2,'2016-05-21 14:21:13','2016-05-21 12:58:15','::1','::1','2016-05-21 12:58:15','2016-05-21 14:21:13',NULL,NULL,'青森県','えみ',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-30 15:51:36
