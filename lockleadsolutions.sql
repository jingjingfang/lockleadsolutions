-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: lockleadsolutions
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `Item_Num` int NOT NULL AUTO_INCREMENT,
  `Item_Desc` varchar(45) NOT NULL,
  `Category` varchar(45) NOT NULL,
  PRIMARY KEY (`Item_Num`)
) ENGINE=InnoDB AUTO_INCREMENT=2201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1100,'200 Amp Panel','Electrical'),(1200,'50 Watt Breaker','Electrical'),(1300,'20 Watt Breaker','Electrical'),(1400,'15 Watt Breaker','Electrical'),(1500,'12 ga, 3 Wire, per foot','Electrical'),(1550,'14 ga, 3 Wire, per foot','Electrical'),(1600,'Siding, 4x8 feet','Exterior'),(1700,'1x4 - 8 feet','Exterior'),(1800,'Cedar Shingles, bundle','Exterior'),(2000,'Door','Interior'),(2100,'Door Hinge Set','Interior'),(2200,'Door Handle Set','Interior');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `Proj_ID` int NOT NULL AUTO_INCREMENT,
  `Proj_Name` varchar(45) NOT NULL,
  `Owner_Name` varchar(45) NOT NULL,
  `Owner_Phone` varchar(45) NOT NULL,
  PRIMARY KEY (`Proj_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Highland House','Elizabeth Barnaby','555-444-8899'),(2,'Baker Remodel','John Stanley','555-787-8392'),(3,'Hew Remodel','Ralph Hew','555-298-4244');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote`
--

DROP TABLE IF EXISTS `quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quote` (
  `Quote_ID` int NOT NULL AUTO_INCREMENT,
  `Proj_ID` int NOT NULL,
  `Item_Num` int NOT NULL,
  `Supplier_ID` int NOT NULL,
  `Quantity` int NOT NULL,
  `Unit_Price` decimal(8,2) NOT NULL,
  `Extended_Price` decimal(12,2) NOT NULL,
  PRIMARY KEY (`Quote_ID`),
  KEY `Proj_ID_idx` (`Proj_ID`),
  KEY `Item_Num_idx` (`Item_Num`),
  KEY `Supplier_ID_idx` (`Supplier_ID`),
  CONSTRAINT `Item_Num` FOREIGN KEY (`Item_Num`) REFERENCES `item` (`Item_Num`),
  CONSTRAINT `Proj_ID` FOREIGN KEY (`Proj_ID`) REFERENCES `project` (`Proj_ID`),
  CONSTRAINT `Supplier_ID` FOREIGN KEY (`Supplier_ID`) REFERENCES `supplier` (`Supplier_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote`
--

LOCK TABLES `quote` WRITE;
/*!40000 ALTER TABLE `quote` DISABLE KEYS */;
INSERT INTO `quote` VALUES (1,1,1100,1,1,170.00,170.00),(2,1,1200,1,3,60.00,180.00),(3,1,1300,1,7,35.00,245.00),(4,1,1400,1,15,35.00,525.00),(5,1,1500,2,200,1.50,300.00),(6,1,1500,2,300,1.25,375.00),(7,2,1600,3,35,22.50,787.50),(8,1,1400,2,10,35.00,350.00),(9,2,1700,3,28,4.75,133.00),(10,2,1800,3,100,65.00,6500.00),(11,1,2000,4,15,275.00,4125.00),(12,1,2100,4,15,29.95,449.25),(13,1,2200,4,15,52.50,787.50),(14,3,1100,1,1,170.00,170.00),(15,3,1200,1,2,60.00,120.00),(16,3,1300,1,5,35.00,175.00),(17,3,1400,1,20,35.00,700.00),(18,3,1500,1,150,1.50,225.00),(19,3,1550,1,300,1.25,375.00);
/*!40000 ALTER TABLE `quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `Supplier_ID` int NOT NULL AUTO_INCREMENT,
  `Supplier_Name` varchar(45) NOT NULL,
  `Discount` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`Supplier_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'NW Electric',25.00),(2,'EB Supplies',15.00),(3,'Contractor, Inc.',35.00),(4,'Interior, Inc.',15.00);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'lockleadsolutions'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-21 10:21:41

use lockleadsolutions;

-- Total final price for the Highland House project --
select proj_name, round(sum(extended_price*(1-discount/100)),2)as finalprice
from project, quote, supplier
where project.proj_id =quote.proj_id and
quote.supplier_id= supplier.supplier_id AND
project.proj_name like 'highland house'
group by proj_name;

-- the total final price for all items, grouped by category and sorted in descending order of total final price  --                          
                            
SELECT category, round(sum(extended_price * (1-discount/100)), 2) as totalprice
from item, quote, supplier
where quote.supplier_id=supplier.supplier_id and
item.item_Num= quote.item_Num
group by category
order by totalprice desc;

/* List all of the company projects (project name), the owner name and contact information for each project, the equipment (item description) 
   needed for that project, and the total final price (which includes the discount, defined above) */                 
                           
select proj_name, owner_name, owner_phone, item_desc, round(sum(extended_price * (1-discount/100)), 2) as totalprice
from project, item, quote, supplier
where item.item_num= quote.Item_Num
and project.Proj_ID= quote.Proj_ID
and supplier.Supplier_ID= quote.Supplier_ID
group by proj_name, item_desc, owner_name, owner_phone
order by proj_name, item_desc;

/*List the total final price (defined above) grouped by each supplier name. Round the
result to two decimal places. Sort the result in descending order by total final price.*/                                            
                                                                
SELECT supplier_name, Round(sum(extended_price*(1-discount/100)),2) as Totalprice
FROM supplier, quote
WHERE supplier.supplier_id= quote.supplier_id
group by supplier_name
order by totalprice desc;

-- List the extended_price is more than $1000 --
select * from quote
where extended_price in (select extended_price from quote where extended_price > 1000) 
order by extended_price desc;
