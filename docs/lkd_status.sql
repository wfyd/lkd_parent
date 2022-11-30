/*
SQLyog Ultimate v8.32 
MySQL - 8.0.16 : Database - lkd_status
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lkd_status` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `lkd_status`;

/*Table structure for table `tb_status_type` */

DROP TABLE IF EXISTS `tb_status_type`;

CREATE TABLE `tb_status_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `status_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态代码',
  `descr` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `StatusType_StatusCode_uindex` (`status_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_status_type` */

insert  into `tb_status_type`(`id`,`status_code`,`descr`) values (1,'10001','断网'),(2,'10002','设备故障'),(3,'10003','缺货');

/*Table structure for table `tb_vm_status_info` */

DROP TABLE IF EXISTS `tb_vm_status_info`;

CREATE TABLE `tb_vm_status_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inner_code` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '售货机编号',
  `status_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '售货机状态码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `utime` datetime DEFAULT NULL COMMENT '发生时间',
  `operater_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_vm_status_info` */

insert  into `tb_vm_status_info`(`id`,`inner_code`,`status_code`,`status`,`utime`,`operater_name`) values (1,'037900004','10001',0,'2019-10-21 14:11:17','维修员');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
