CREATE DATABASE  IF NOT EXISTS `itax` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `itax`;
-- MySQL dump 10.13  Distrib 5.6.10, for Win64 (x86_64)
--
-- Host: localhost    Database: itax
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `social_insurance`
--

DROP TABLE IF EXISTS `social_insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_insurance` (
  `region` varchar(45) NOT NULL,
  `pension` varchar(45) DEFAULT NULL,
  `Lpension` varchar(45) DEFAULT NULL,
  `Upension` varchar(45) DEFAULT NULL,
  `med` varchar(45) DEFAULT NULL,
  `Lmed` varchar(45) DEFAULT NULL,
  `Umed` varchar(45) DEFAULT NULL,
  `unemp` varchar(45) DEFAULT NULL,
  `Lunemp` varchar(45) DEFAULT NULL,
  `Uunemp` varchar(45) DEFAULT NULL,
  `house` varchar(45) DEFAULT NULL,
  `Lhouse` varchar(45) DEFAULT NULL,
  `Uhouse` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`region`),
  UNIQUE KEY `地区_UNIQUE` (`region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_insurance`
--

LOCK TABLES `social_insurance` WRITE;
/*!40000 ALTER TABLE `social_insurance` DISABLE KEYS */;
INSERT INTO `social_insurance` VALUES ('上海','8%','4927','24633','2%','4927','24633','0.5%','4927','24633','7%','2420','23496'),('乌鲁木齐','8%','3235','16176','2.5%','3235','16176','0.5%','3235','16176','12%','1620','16599'),('兰州','8%','3287','16431','2%','3287','16431','0.3%','3287','16431','12%','1620','21393.75'),('北京','8%','3613','23565','2%','5557','27786','0.2%','3613','23565','12%','2200','27786'),('南京','8%','3368','16842','2%','3368','16842','0.5%','3369','16842','12%','2020','25300'),('南宁','8%','2955.1','14775.3','2%','2955.1','14775.3','0.5%','2955.1','14775.3','12%','1680','20067'),('南昌','8%','3072','15357','2%','3501','17505','0.5%','3072','15357','12%','1083','20668'),('合肥','8%','2711.24','13556.22','2%','2711.4','14556.22','0.5%','2711.24','13556.22','12%','1550','21268'),('呼和浩特','8%','3384.6','16823','2%','4205.6','15771','0.5%','3154.2',NULL,'12%','1760','15770'),('哈尔滨','8%','2764.5','13822.5','2%','5628.5','16885.5','0.5%','3377.1','16885.5','12%','1680','16886'),('天津','8%','3364','17613','2%','3364','17613','0.5%','3364','17613','12%','2050','25983'),('太原','8%','2739','13695','2%','2739','13695','0.3%','2739','13695','12%','1700','20208'),('广州','8%','3803','19014','2%','5592','27960','0.2%','2100','27960','12%','2100','27960'),('成都','8%','2697','16179','2%','3236','16179','0.4%','3236','16179','12%','1650','21498'),('拉萨','8%','4552.2','22761','2%','4552.2','22761','0.5%','4552.2','22761','12%','4552.2','22761'),('昆明','8%','3673','18378','2%','3676','18378','0.3%','2004',NULL,'12%','1670','20063'),('杭州','8%','3321.6','16608','2%','3321.6','16608','0.5%','3321.6','16608','12%','2010','25950'),('武汉','8%','3739.8','18699','2%','3739.8','18699','0.3%','3739.8','18699','12%','1750','33118.75'),('沈阳','8%','2881','14403','2%','5244','15732','0.5%','2881','14403','12%','1620','20516'),('济南','8%','3269','16342','2%','3269','16342','0.3%','3269','16342','12%','1910','17781'),('海口','8%','3422.4','17112','2%','3422.4','17112','0.5%','3422.4','17112','12%','1670','18981'),('深圳','8%','2200','17346','2%','5009','25044','0.3%','2200','2200','12%','2200','27927'),('石家庄','8%','2836.2','14181','2%','5000','14181','0.3%','3394',NULL,'12%','3695','18476'),('福州','8%','1800','16168','2%','3772.48','16167.75','0.5%','3772.48','16167.75','12%','1650','20793'),('西宁','8%','3827','19134','2%','3827','19134','0.5%','3827','19134','10%','1500','19134'),('西安','8%','3372','16858','2%','3889','19443','0.3%','3889','19443','12%','1800','20955'),('贵阳','8%','3397.6','16988','2%','4530.13','16988','0.3%','3397.6','16988','12%','1680','40500'),('郑州','8%','2745','13725','2%','2745','13725','0.3%','2745','13725','12%','2120','20242'),('重庆','8%','3664','18318','2%','3664','18318','0.5%','3664','18318','12%','1800','20441'),('银川','8%','3103','15513','2%','3103','15513','0.5%','3103','15513','12%','1660','18462'),('长春','8%','3029','15147','2%','3606.8','18034','0.3%','3967',NULL,'12%','1780','18033'),('长沙','8%','2630','13146','2%','2630','13146','0.3%','2630','13146','12%','1588','21300');
/*!40000 ALTER TABLE `social_insurance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-22 20:40:36
