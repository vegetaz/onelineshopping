-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: onlineshopping
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `street` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ward` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `town` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `postal_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL,
  `is_shipping` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_user_id` (`user_id`),
  CONSTRAINT `fk_address_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,4,'444','Hoàng Hoa Thám','Thuỵ Khuê','Tây Hồ','Hà Nội','100000',1,0),(2,5,'27/33','Đốc Ngữ','Liễu Giai','Ba Đình','Hà Nội','100000',1,0),(3,6,'27/33','Doc Ngu','Lieu Giai','Ba Dinh','Ha Noi','100000',1,0),(4,7,'27/33','Äá»c Ngá»¯','Liá»u Giai','Ba ÄÃ¬nh','HÃ  Ná»i','100000',1,0),(5,8,'ngÃµ 80','XuÃ¢n PhÆ°Æ¡ng','PhÆ°Æ¡ng Canh','Nam Tá»« LiÃªm','HÃ  Ná»i','24071995',1,0),(6,9,'NHÃ Cá»¬A VÃ Äá»I Sá»NG','1','PhÆ°Æ¡ng Canh','- Cá»­a hÃ ng -','- Cá»­a hÃ ng -','1234',1,0),(7,10,'1','1','1','1','1','1',1,0),(8,11,'1','1','1','1','1','1',1,0);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amount`
--

DROP TABLE IF EXISTS `amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `amount` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(100) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amount`
--

LOCK TABLES `amount` WRITE;
/*!40000 ALTER TABLE `amount` DISABLE KEYS */;
/*!40000 ALTER TABLE `amount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `grand_total` decimal(10,2) DEFAULT NULL,
  `cart_lines` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_user_id` (`user_id`),
  CONSTRAINT `fk_cart_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,4,0.00,0),(2,5,0.00,0),(3,7,1060000.00,1),(4,9,30050000.00,2),(5,12,0.00,0),(6,13,0.00,0);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_line`
--

DROP TABLE IF EXISTS `cart_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL,
  `buying_price` decimal(10,2) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cartline_product_id` (`product_id`),
  CONSTRAINT `fk_cartline_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_line`
--

LOCK TABLES `cart_line` WRITE;
/*!40000 ALTER TABLE `cart_line` DISABLE KEYS */;
INSERT INTO `cart_line` VALUES (36,4,1060000.00,26,1,1060000.00,1),(37,4,28990000.00,7,1,28990000.00,1);
/*!40000 ALTER TABLE `cart_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `image_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'SamSung','Đây là mô tả cho danh mục điện thoại SamSung','CAT_1.png',1),(2,'iPhone','Đây là mô tả cho danh mục điện thoại Apple (iPhone)','CAT_2.png',1),(3,'Xiaomi','Đây là mô tả cho danh mục điện thoại Xiaomi','CAT_3.png',1),(4,'OPPO','Đây là mô tả cho danh mục điện thoại OPPO','CAT_4.png',1),(5,'Huawei','Đây là mô tả cho danh mục điện thoại Huawei','CAT_5.png',1),(6,'Nokia','Đây là mô tả cho danh mục điện thoại Nokia','CAT_6.png',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_amount`
--

DROP TABLE IF EXISTS `log_amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `log_amount` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(100) DEFAULT '0',
  `path_image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_amount`
--

LOCK TABLES `log_amount` WRITE;
/*!40000 ALTER TABLE `log_amount` DISABLE KEYS */;
INSERT INTO `log_amount` VALUES (2,'nguyen24quang@gmail.com',11111111,'/onlineshopping/resources/images/04052019134049583420739964777643724.jpg',1),(3,'nguyen24quang@gmail.com',1222222,'/onlineshopping/resources/images/04052019960069737755657819691897091.jpg',1),(4,'nguyen24quang@gmail.com',1222222,'/onlineshopping/resources/images/0405201970139511324754732174590062.jpg',1),(5,'nguyen24quang@gmail.com',50000000,'/onlineshopping/resources/images/04052019165288652749595538123349384.jpg',1),(6,'nguyen24quang@gmail.com',122222222,'/onlineshopping/resources/images/0405201976104917656652921083538391.jpg',0);
/*!40000 ALTER TABLE `log_amount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `order_total` decimal(10,2) DEFAULT NULL,
  `order_count` int(11) DEFAULT NULL,
  `shipping_id` int(11) DEFAULT NULL,
  `billing_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `image_path` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_order_detail_user_id` (`user_id`),
  KEY `fk_order_detail_shipping_id` (`shipping_id`),
  KEY `fk_order_detail_billing_id` (`billing_id`),
  CONSTRAINT `fk_order_detail_billing_id` FOREIGN KEY (`billing_id`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_order_detail_shipping_id` FOREIGN KEY (`shipping_id`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_order_detail_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (21,9,1060000.00,1,6,6,'2019-04-27','/onlineshopping/resources/images/27042019952474026112748141899284657.jpg',1),(22,9,28990000.00,1,6,6,'2019-04-27','/onlineshopping/resources/images/2704201929933851858385297913812822.jpg',1),(23,9,1060000.00,1,6,6,'2019-04-27','/onlineshopping/resources/images/2704201933757815322675097205230517.jpg',0),(24,9,7990000.00,1,6,6,'2019-04-27','/onlineshopping/resources/images/27042019982987182751943342941942196.jpg',0),(25,9,1060000.00,1,6,6,'2019-05-01',NULL,0),(26,9,57980000.00,1,6,6,'2019-05-04',NULL,0),(27,9,1990000.00,1,6,6,'2019-05-04','-1',0),(28,9,1060000.00,1,6,6,'2019-05-04','-1',0),(29,9,1060000.00,1,6,6,'2019-05-04','-1',0);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL,
  `buying_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_item_product_id` (`product_id`),
  KEY `fk_order_item_order_id` (`order_id`),
  CONSTRAINT `fk_order_item_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_detail` (`id`),
  CONSTRAINT `fk_order_item_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (23,21,1060000.00,26,1,1060000.00),(24,22,28990000.00,7,1,28990000.00),(25,23,1060000.00,26,1,1060000.00),(26,24,7990000.00,22,1,7990000.00),(27,25,1060000.00,26,1,1060000.00),(28,26,57980000.00,7,2,28990000.00),(29,27,1990000.00,37,1,1990000.00),(30,28,1060000.00,26,1,1060000.00),(31,29,1060000.00,26,1,1060000.00);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `brand` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `purchases` int(11) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_product_category_id` (`category_id`),
  KEY `fk_product_supplier_id` (`supplier_id`),
  CONSTRAINT `fk_product_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_product_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `user_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'PRDABC123DEFX','iPhone 5s','apple','Đây là mô tả cho iPhone 5S',18000.00,5,0,3,2,0,2),(2,'PRDDEF123DEFX','Samsung s7','samsung','Đây là mô tả cho Samsung S7',32000.00,1,0,3,3,1,4),(3,'PRDPQR123WGTX','Google Pixel','google','Đây là mô tả cho Google Pixel',57000.00,5,0,3,2,0,4),(4,'PRDMNO123PQRX',' Macbook Pro','apple','Đây là mô tả cho Macbook Pro',54000.00,3,0,1,2,0,0),(5,'PRDABCXYZDEFX','Dell Latitude E6510','dell','Đây là mô tả cho Dell',48000.00,5,0,1,3,0,0),(6,'PRD4B86C4E0CD','iPhone Xs 64GB','Apple','Đây là mô tả cho iPhone XS 64GB',200000.00,12,0,2,1,0,2),(7,'PRD00861375D0','Samsung Galaxy S10+ (512GB)','Samsung','Đây là mô tả cho Samsung Galaxy S10+ (512GB)',28990000.00,80,1,1,1,20,28),(8,'PRDD0D85159AB','Samsung Galaxy Note 9 512GB','Samsung','Đây là mô tả cho  Samsung Galaxy Note 9 512GB',24490000.00,100,1,1,1,0,0),(9,'PRDF14F63ABCB','Samsung Galaxy Note 8','Samsung','Đây là mô tả cho Samsung Galaxy Note 8',11990000.00,100,1,1,1,0,0),(10,'PRDEDE9C34E29','Samsung Galaxy A9 (2018)','Samsung','Đây là mô tả cho Samsung Galaxy A9 (2018)',8990000.00,100,1,1,1,0,0),(11,'PRD38DB07D425','Samsung Galaxy A7 (2018) 128GB','Samsung','Đây là mô tả cho Samsung Galaxy A7 (2018) 128GB',6490000.00,100,1,1,1,0,1),(12,'PRD380D630E7C','iPhone Xs Max 512GB','Apple','Đây là mô tả cho iPhone Xs Max 512GB',39990000.00,100,1,2,1,0,0),(13,'PRD7A8A0EA1AD','iPhone X 256GB','Apple','Đây là mô tả cho iPhone X 256GB',27990000.00,100,1,2,1,0,0),(14,'PRDD8B349F981','iPhone Xr 128GB','Apple','Đây là mô tả cho  iPhone Xr 128GB',21990000.00,100,1,2,1,0,0),(15,'PRDA0D4AFE0C6','iPhone 7 Plus 32GB','Apple','Đây là mô tả cho iPhone 7 Plus 32GB',12990000.00,100,1,2,1,0,0),(16,'PRDBAE69BF8E1','iPhone 6s Plus 32GB','Apple','Đây là mô tả cho iPhone 6s Plus 32GB',9990000.00,100,1,2,1,0,0),(17,'PRD6ABA5819FC','OPPO Find X','OPPO','Đây là mô tả cho OPPO Find X',17990000.00,100,1,4,1,0,0),(18,'PRDA07BB5F96E','OPPO R17 Pro','OPPO','Đây là mô tả cho OPPO R17 Pro',13990000.00,100,1,4,1,0,0),(19,'PRDEB49E1713F','OPPO F11 Pro','OPPO','Đây là mô tả cho OPPO F11 Pro',8490000.00,100,1,4,1,0,0),(20,'PRD232B297040','OPPO F9','OPPO','Đây là mô tả cho OPPO F9',6490000.00,100,1,4,1,0,0),(21,'PRDB3AF769E7E','OPPO A7 32GB','OPPO','Đây là mô tả cho OPPO A7 32GB',4290000.00,100,1,4,1,0,0),(22,'PRD61B58658C4','Nokia 8.1','Nokia','Đây là mô tả cho Nokia 8.1',7990000.00,98,1,6,1,2,4),(23,'PRD3F9A55B2F9','Nokia 6.1 Plus','Nokia','Đây là mô tả cho Nokia 6.1 Plus',5490000.00,100,1,6,1,0,0),(24,'PRD0B9BE93F80','Nokia 5.1 Plus','Nokia','Đây là mô tả cho Nokia 5.1 Plus',3890000.00,100,1,6,1,0,0),(25,'PRDA19254708B','Nokia 3.1 Plus','Nokia','Đây là mô tả cho Nokia 3.1 Plus',3890000.00,100,1,6,1,0,0),(26,'PRD5B0DC7E471','Nokia 3310 2017','Nokia','Đây là mô tả cho Nokia 3310 2017',1060000.00,92,1,6,1,8,13),(27,'PRD3F09E77D79','Huawei P30','Huawei','Đây là mô tả cho Huawei P30',16990000.00,100,1,5,1,0,0),(28,'PRD89BDEF055A','Huawei Mate 20 Pro','Huawei','Đây là mô tả cho Huawei Mate 20 Pro',17990000.00,100,1,5,1,0,0),(29,'PRDB544E5C9F5','Huawei Nova 3i','Huawei','Đây là mô tả cho Huawei Nova 3i',5990000.00,100,1,5,1,0,0),(30,'PRD29DB656B8F','Huawei Y9 (2019)','Huawei','Đây là mô tả cho Huawei Y9 (2019)',4990000.00,100,1,5,1,0,0),(31,'PRD9966E55F09','Huawei Y6 Prime (2018)','Huawei','Đây là mô tả cho Huawei Y6 Prime (2018)',2290000.00,100,1,5,1,0,0),(32,'PRD002BF31BE2','Xiaomi Mi 8','Xiaomi','Đây là mô tả cho Xiaomi Mi 8',11990000.00,100,1,3,1,0,0),(33,'PRD337C27031C','Xiaomi Mi A2','Xiaomi','Đây là mô tả cho Xiaomi Mi A2',5690000.00,100,1,3,1,0,0),(34,'PRDE9E2C0094E','Xiaomi Redmi Note 6 Pro 64GB','Xiaomi','Đây là mô tả cho Xiaomi Redmi Note 6 Pro 64GB',4990000.00,100,1,3,1,0,1),(35,'PRD61B0A322F2','Xiaomi Redmi Note 7 64GB','Xiaomi','Đây là mô tả cho Xiaomi Redmi Note 7 64GB',4990000.00,100,1,3,1,0,0),(36,'PRDF6CE2A5748','Xiaomi Redmi Go','Xiaomi','Đây là mô tả cho Xiaomi Redmi Go',1890000.00,100,1,3,1,0,0),(37,'PRD416297D26D','Nokia 2.1','Nokia','Đây là mô tả cho Nokia 2.1',1990000.00,97,1,6,1,3,10),(38,'PRDE5507BDCBC','123','123','123',30.00,1,1,1,1,0,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_detail`
--

DROP TABLE IF EXISTS `user_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `contact_number` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_detail`
--

LOCK TABLES `user_detail` WRITE;
/*!40000 ALTER TABLE `user_detail` DISABLE KEYS */;
INSERT INTO `user_detail` VALUES (1,'Van','Van','ADMIN',1,'$2a$06$ORtBskA2g5Wg0HDgRE5ZsOQNDHUZSdpJqJ2.PGXv0mKyEvLnKP7SW','vk@gmail.com','8888888888'),(2,'My','Linh','SUPPLIER',1,'$2a$06$bzYMivkRjSxTK2LPD8W4te6jjJa795OwJR1Of5n95myFsu3hgUnm6','rj@gmail.com','9999999999'),(3,'Hai','Yen','SUPPLIER',1,'$2a$06$i1dLNlXj2uY.UBIb9kUcAOxCigGHUZRKBtpRlmNtL5xtgD6bcVNOK','ra@gmail.com','7777777777'),(4,'Trung','Kien','USER',1,'$2a$06$4mvvyO0h7vnUiKV57IW3oudNEaKPpH1xVSdbie1k6Ni2jfjwwminq','kn@gmail.com','7777777777'),(5,'Nguyen Van','Van','ADMIN',1,'$2a$10$T/zS/8u.GzaIJ62K9OrIQ.d/0Qm5yNG0.EUeFyFhz96DCXflpH.HK','van@gmail.com','0972389367'),(6,'Sut','Ngao','SUPPLIER',1,'$2a$10$4wA11.rbSRB6IA03FLO3KuCNECwDLOx97zv1pctWc5LUoTGl0TpbK','sut@ngao.com','0123456789'),(7,'test','test','USER',1,'$2a$10$s6qOHpy2.tYe.A9H2.DKVO76A9skBwVqQmO0OlyN7Yl5QW.Lq5G7a','test@gmail.com','0123456789'),(8,'Pham Do','Thinh','SUPPLIER',1,'$2a$10$0wq80kbwe/GtQxNEsWAORuoL7ZRFOIPzz8L3zCCnfLJy9YUPSUMBa','thinh2407@gmail.com','0377270204'),(9,'Pham Do','Thinh','USER',1,'$2a$10$Ry2gpbkioWNmWe9VaqkyN.POlq7wiSuQy0EQEyTeL/FsbXMpAe/wm','nguyen24quang@gmail.com','0377270204'),(10,'1','1','SUPPLIER',1,'$2a$10$DzK/Dafsg3OxTXirXyyUd.6xfVtXak64lDnK0kRBBWongip1dit.2','1','1'),(11,'1','1','SUPPLIER',1,'$2a$10$2UukaRQpeAiGgLEVamm3UObGYhwvnpOylBImg8eWWn2eyzqQWBL36','1@gmail.com','1'),(12,'na','na','USER',1,'$2a$10$MybOTAvtoyqKR4JKsSaEqOMxajjK4WgDBkrK1lfaVdTYw32YvJ1kW','na@na.com','1234567890'),(13,'na','na','USER',1,'$2a$10$SFe6aWpe97C7jvFgczLFOuagFiEUwmiF1IIrUjB9ctuEFRfYBlOBC','na@na.com','1234567890');
/*!40000 ALTER TABLE `user_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-05  1:37:17
