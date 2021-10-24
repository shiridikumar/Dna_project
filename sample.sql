-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: amazing
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `customer_phone_no`
--

DROP TABLE IF EXISTS `customer_phone_no`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_phone_no` (
  `Customer_id` int DEFAULT NULL,
  `phone_no` bigint DEFAULT NULL,
  KEY `fk_customer` (`Customer_id`),
  CONSTRAINT `fk_customer` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`Customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_phone_no`
--

LOCK TABLES `customer_phone_no` WRITE;
/*!40000 ALTER TABLE `customer_phone_no` DISABLE KEYS */;
INSERT INTO `customer_phone_no` VALUES (1,8008048963),(1,9490264820),(2,8819231121),(3,8919251141),(3,9819251145),(4,7819489145),(5,7812311231),(5,7111111111),(6,9876543219),(7,6789543219);
/*!40000 ALTER TABLE `customer_phone_no` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_purchases`
--

DROP TABLE IF EXISTS `customer_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_purchases` (
  `customer_id` int NOT NULL,
  `Timestamp` timestamp NOT NULL,
  PRIMARY KEY (`customer_id`,`Timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_purchases`
--

LOCK TABLES `customer_purchases` WRITE;
/*!40000 ALTER TABLE `customer_purchases` DISABLE KEYS */;
INSERT INTO `customer_purchases` VALUES (1,'2021-10-24 06:55:22'),(2,'2021-10-24 06:55:27'),(3,'2021-10-24 06:55:52'),(4,'2021-10-24 06:55:56'),(5,'2021-10-24 06:56:04'),(6,'2021-10-24 06:56:08'),(7,'2021-10-24 06:55:22');
/*!40000 ALTER TABLE `customer_purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `Customer_id` int NOT NULL AUTO_INCREMENT,
  `Email` char(40) DEFAULT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Date` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `Year` int DEFAULT NULL,
  PRIMARY KEY (`Customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'shiridikumarpeddinti836@gmail.com','shiridikumar',8,4,2002),(2,'neeraj@gmail.com','neeraj',10,5,2001),(3,'debanil@gmail.com','debanil',12,6,2003),(4,'A@gmail.com','akanksha',1,1,1998),(5,'B@gmail.com','bob',2,2,2001),(6,'C@gmail.com','charlie',11,11,2000),(7,'D@gmail.com','daniel',10,9,1992);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dateofbirths`
--

DROP TABLE IF EXISTS `dateofbirths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dateofbirths` (
  `Date` int NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `Age` int DEFAULT NULL,
  PRIMARY KEY (`Date`,`month`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dateofbirths`
--

LOCK TABLES `dateofbirths` WRITE;
/*!40000 ALTER TABLE `dateofbirths` DISABLE KEYS */;
INSERT INTO `dateofbirths` VALUES (1,1,1998,23),(2,2,2001,20),(8,4,2002,19),(10,5,2001,20),(10,9,1992,29),(11,11,2000,20),(12,6,2003,18);
/*!40000 ALTER TABLE `dateofbirths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `payment_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `delivery_status` varchar(20) DEFAULT NULL,
  `expected_delivery` timestamp NULL DEFAULT NULL,
  `door_no` char(50) DEFAULT NULL,
  `street` char(50) DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  KEY `payment_id` (`payment_id`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,1,'dispatched','2021-10-30 18:30:00','1/20','sriramnnagar',530026),(1,1,'not yet dispatched','2021-11-01 18:30:00','1/20','sriramnnagar',530026),(2,2,'shipped','2021-10-29 18:30:00','4/29 happypartments','moula ali',500001),(3,3,'packed','2021-11-02 18:30:00','30/200 ecopolis','lb nagar',500035),(4,4,'dispatched','2021-10-28 18:30:00','4/29-10 eternaleva','lb nagar',500035),(5,5,'shipped','2021-10-30 18:30:00','10/10 kalasalingam univeristy','krishnankoil',626126),(6,6,'not yet dispatched','2021-11-02 18:30:00','5-2/10 steel plant','kurmanpalem',530026),(7,7,'dispatched','2021-10-31 18:30:00','12-10 REAP','BRIGADE road',560001);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `pincode` int NOT NULL,
  `district` char(30) DEFAULT NULL,
  PRIMARY KEY (`pincode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (500001,'Hyderabad'),(500035,'Hyderabad'),(530026,'Visakhapatnam'),(560001,'bangalore'),(626126,'Virudhanagar');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fashion`
--

DROP TABLE IF EXISTS `fashion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fashion` (
  `product_id` int DEFAULT NULL,
  `size` int DEFAULT NULL,
  `fit_type` char(20) DEFAULT NULL,
  `wear` char(20) DEFAULT NULL,
  KEY `product2_fk` (`product_id`),
  CONSTRAINT `product2_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fashion`
--

LOCK TABLES `fashion` WRITE;
/*!40000 ALTER TABLE `fashion` DISABLE KEYS */;
INSERT INTO `fashion` VALUES (2,NULL,'Slim fit full sleeve','Mens wear');
/*!40000 ALTER TABLE `fashion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `final_price`
--

DROP TABLE IF EXISTS `final_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `final_price` (
  `price` int NOT NULL,
  `discount` float NOT NULL,
  `final_price` float DEFAULT NULL,
  PRIMARY KEY (`price`,`discount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `final_price`
--

LOCK TABLES `final_price` WRITE;
/*!40000 ALTER TABLE `final_price` DISABLE KEYS */;
INSERT INTO `final_price` VALUES (1299,5,1234.05),(1999,7,1859.07),(11499,8,10579.1),(12098,10,10888.2),(45499,15,38674.1);
/*!40000 ALTER TABLE `final_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laptops`
--

DROP TABLE IF EXISTS `laptops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laptops` (
  `Product_id` int DEFAULT NULL,
  `Processor` char(20) DEFAULT NULL,
  `Ram` char(20) DEFAULT NULL,
  `Memory` char(20) DEFAULT NULL,
  `graphics` char(20) DEFAULT NULL,
  `resolution` char(20) DEFAULT NULL,
  KEY `produut_fk` (`Product_id`),
  CONSTRAINT `produut_fk` FOREIGN KEY (`Product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptops`
--

LOCK TABLES `laptops` WRITE;
/*!40000 ALTER TABLE `laptops` DISABLE KEYS */;
INSERT INTO `laptops` VALUES (2,'Intel i5','8GB','1TB hdd + 256GB SSD','2GB NVIDIA grraphics','15.6 inch');
/*!40000 ALTER TABLE `laptops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobiles`
--

DROP TABLE IF EXISTS `mobiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mobiles` (
  `Product_id` int DEFAULT NULL,
  `RAM` char(20) DEFAULT NULL,
  `Internal_storage` char(20) DEFAULT NULL,
  `Resolution` char(20) DEFAULT NULL,
  `Camera` char(20) DEFAULT NULL,
  KEY `product_fk` (`Product_id`),
  CONSTRAINT `product_fk` FOREIGN KEY (`Product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobiles`
--

LOCK TABLES `mobiles` WRITE;
/*!40000 ALTER TABLE `mobiles` DISABLE KEYS */;
INSERT INTO `mobiles` VALUES (1,'6GB','128GB','6.5 inch','48mp rear camera'),(5,'8GB','128GB','6.3 inch','48mp rear camera');
/*!40000 ALTER TABLE `mobiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `Customer_id` int DEFAULT NULL,
  `Payment_id` int DEFAULT NULL,
  `Product_id` int DEFAULT NULL,
  KEY `Customer_id` (`Customer_id`),
  KEY `Product_id` (`Product_id`),
  KEY `Payment_id` (`Payment_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`Customer_id`) ON DELETE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`Payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1),(1,1,4),(2,2,2),(3,3,3),(4,4,1),(5,5,6),(6,6,6),(7,7,2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `payment_method` char(20) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `discount` float DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'UPI',12098,10),(2,'cash on delivery',45499,15),(3,'cash on delivery',1299,5),(4,'Debit card',11499,8),(5,'Debit card',1999,7),(6,'UPI',1999,7),(7,'UPI',45499,15);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_purchased`
--

DROP TABLE IF EXISTS `product_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_purchased` (
  `customer_id` int DEFAULT NULL,
  `Timestamp` timestamp NULL DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  KEY `customer_id` (`customer_id`,`Timestamp`),
  CONSTRAINT `product_purchased_ibfk_1` FOREIGN KEY (`customer_id`, `Timestamp`) REFERENCES `customer_purchases` (`customer_id`, `Timestamp`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_purchased`
--

LOCK TABLES `product_purchased` WRITE;
/*!40000 ALTER TABLE `product_purchased` DISABLE KEYS */;
INSERT INTO `product_purchased` VALUES (1,'2021-10-24 06:55:22',1),(1,'2021-10-24 06:55:22',4),(2,'2021-10-24 06:55:27',2),(3,'2021-10-24 06:55:52',3),(4,'2021-10-24 06:55:56',1),(5,'2021-10-24 06:56:04',6),(6,'2021-10-24 06:56:08',6),(7,'2021-10-24 06:55:22',2);
/*!40000 ALTER TABLE `product_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_reviews` (
  `Customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `review` varchar(150) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  PRIMARY KEY (`Customer_id`,`product_id`),
  CONSTRAINT `customer2_fk` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`Customer_id`) ON DELETE CASCADE,
  CONSTRAINT `fk` FOREIGN KEY (`Customer_id`) REFERENCES `customer_purchases` (`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
INSERT INTO `product_reviews` VALUES (1,1,'Worth the price!!! the display is really good.The way it was packed while i recieved is not good',4),(1,4,'Avergae quality lasts not more than 3 months!!',3),(2,2,'Best laptop for this price i have ever seen.!!!',5),(3,3,'Good quality but the color is slightly faded..',3),(4,1,'FInally got it :) love the display and also the speed is good doesnt heat frequently',4),(5,6,'Nice and worth product .Too atttratice.',4.5);
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` char(30) DEFAULT NULL,
  `manufacturer` char(30) DEFAULT NULL,
  `overall_reviews` int DEFAULT NULL,
  `overall_rating` float(10,2) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'samsung galaxy m12','samsung',2,4.00,11499,5),(2,'Asus vivobook 14','ASUS',1,5.00,45499,1),(3,'ROADSTER t-shirt full sleeve','ROADSTER',1,3.00,1299,6),(4,'BOAT Ear phones','BOAT',1,3.00,699,4),(5,'ONE PLUS NORD 2 5G','ONE PLUS',0,0.00,30999,5),(6,'Mi & Mo ceramic plate set','ceramic',1,4.50,1999,2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommendations`
--

DROP TABLE IF EXISTS `recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommendations` (
  `customer_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `recommendations_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`Customer_id`) ON DELETE CASCADE,
  CONSTRAINT `recommendations_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendations`
--

LOCK TABLES `recommendations` WRITE;
/*!40000 ALTER TABLE `recommendations` DISABLE KEYS */;
INSERT INTO `recommendations` VALUES (1,5),(1,4),(2,5),(2,4),(3,4),(4,4),(5,4),(6,4),(4,5),(3,2);
/*!40000 ALTER TABLE `recommendations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-24 18:43:07
