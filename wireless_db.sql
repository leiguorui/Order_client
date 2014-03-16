/*
SQLyog Trial v9.51 
MySQL - 5.5.13 : Database - wireless_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wireless_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `wireless_db`;

/*Table structure for table `checktable` */

DROP TABLE IF EXISTS `checktable`;

CREATE TABLE `checktable` (
  `num` int(11) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `checktable` */

/*Table structure for table `menutbl` */

DROP TABLE IF EXISTS `menutbl`;

CREATE TABLE `menutbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeId` (`typeId`),
  CONSTRAINT `menutbl_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `menutypetbl` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `menutbl` */

insert  into `menutbl`(`id`,`price`,`typeId`,`name`,`pic`,`remark`) values (1,10,1,'干煸豆角',NULL,'GOOD'),(2,30,2,'糖醋鱼',NULL,'GOOD'),(3,40,2,'红烧排骨',NULL,'GOOD'),(4,8,1,'土豆丝',NULL,'GOOD'),(5,12,1,'烧茄子',NULL,'GOOD');

/*Table structure for table `menutypetbl` */

DROP TABLE IF EXISTS `menutypetbl`;

CREATE TABLE `menutypetbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `menutypetbl` */

insert  into `menutypetbl`(`id`,`name`) values (1,'素菜'),(2,'肉菜');

/*Table structure for table `orderdetailtbl` */

DROP TABLE IF EXISTS `orderdetailtbl`;

CREATE TABLE `orderdetailtbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `menuId` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `menuId` (`menuId`),
  CONSTRAINT `orderdetailtbl_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `ordertbl` (`id`),
  CONSTRAINT `orderdetailtbl_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menutbl` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `orderdetailtbl` */

insert  into `orderdetailtbl`(`id`,`orderId`,`menuId`,`num`,`remark`) values (1,1,4,1,'1'),(2,2,1,20,'NO'),(3,4,2,2,'两份'),(4,5,4,8,'8份'),(5,5,2,3,'3份'),(6,7,4,2,'凉菜');

/*Table structure for table `ordertbl` */

DROP TABLE IF EXISTS `ordertbl`;

CREATE TABLE `ordertbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderTime` varchar(30) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `tableId` int(11) DEFAULT NULL,
  `personNum` int(11) DEFAULT NULL,
  `isPay` int(11) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `tableId` (`tableId`),
  CONSTRAINT `ordertbl_ibfk_2` FOREIGN KEY (`tableId`) REFERENCES `tabletbl` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `ordertbl` */

insert  into `ordertbl`(`id`,`orderTime`,`userId`,`tableId`,`personNum`,`isPay`,`remark`) values (1,'12:30:11 04:06',1,2,3,1,NULL),(2,'12:37:11 06:06',1,2,2,1,NULL),(3,'12:07:11 07:06',1,1,2,NULL,NULL),(4,'12-06-11 07:53',1,2,2,1,NULL),(5,'12-06-11 07:57',1,1,2,1,NULL),(6,'12-06-11 08:41',1,1,2,1,NULL),(7,'12-06-11 09:22',1,1,2,1,NULL);

/*Table structure for table `queryorder` */

DROP TABLE IF EXISTS `queryorder`;

CREATE TABLE `queryorder` (
  `orderTime` varchar(30) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `personNum` int(11) DEFAULT NULL,
  `tableId` int(11) DEFAULT NULL,
  KEY `tableId` (`tableId`),
  CONSTRAINT `queryorder_ibfk_1` FOREIGN KEY (`tableId`) REFERENCES `menutypetbl` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `queryorder` */

/*Table structure for table `queryorderdetail` */

DROP TABLE IF EXISTS `queryorderdetail`;

CREATE TABLE `queryorderdetail` (
  `name` varchar(40) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `queryorderdetail` */

/*Table structure for table `tabletbl` */

DROP TABLE IF EXISTS `tabletbl`;

CREATE TABLE `tabletbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tabletbl` */

insert  into `tabletbl`(`id`,`num`,`flag`,`description`) values (1,0,0,'GOOD'),(2,0,0,'GOOD'),(3,0,0,'GOOD'),(4,0,0,'GOOD');

/*Table structure for table `usertbl` */

DROP TABLE IF EXISTS `usertbl`;

CREATE TABLE `usertbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `permission` int(11) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `usertbl` */

insert  into `usertbl`(`id`,`account`,`password`,`name`,`gender`,`permission`,`remark`) values (1,'admin','123','admin','男',1,'good');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
