/*
SQLyog Ultimate v9.20 
MySQL - 8.0.18 : Database - shop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `shop`;

/*Table structure for table `admins` */

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admins` */

insert  into `admins`(`adminid`,`name`,`surname`,`login`,`password`) values (1,'Tigran','Baloyan','tikbaloyan','admin'),(2,'Hayk','Lachikyan','haklachikyan','user'),(3,'Nikol','ddd','aaa','bbb');

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `catid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `categories` */

insert  into `categories`(`catid`,`name`,`images`) values (1,'Processor','cpu.jpg'),(2,'Motherboard','motherboard.png'),(3,'Videocard','videocard.jpg'),(4,'RAM','ram.jpg'),(5,'HDD/SDD','hdd.jpg'),(6,'Monitor','monitor.png'),(7,'PowerSupply','powersupply.jpg'),(8,'Accessories','accessories.png');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `prodid` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  PRIMARY KEY (`prodid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `products` */

insert  into `products`(`prodid`,`model`,`price`,`count`,`catid`) values (1,'Intel core i3 8 series',80000,7,1),(2,'Intel core i5 8 series',100000,8,1),(3,'Intel core i7 8 series',120000,10,1),(4,'Asus H361-M',30000,10,2),(5,'Asus P5Q3 Deluxe',20000,5,2),(6,'nVidia GTX 1080 Ti',250000,2,3),(7,'nVidia GTX 1050',120000,5,3),(8,'Kingmax DDR4 16GB',20000,5,4),(9,'Corsair DDR3 8GB',15000,3,4),(10,'Seagate 1TB HDD',20000,5,5),(11,'Patriot Torche 128GB SSD',15000,4,5),(12,'Asus 24\" Gaming ',300000,2,6),(13,'Dell 16\" Monitor',70000,5,6),(14,'Genius Mouse',5000,5,8),(15,'Genius Speakers',7000,7,8),(16,'Genius Keyboard',5000,5,8),(21,'HiTech 800W',15000,3,7);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
