/*
SQLyog Ultimate v8.32 
MySQL - 8.0.16 : Database - lkd_production
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lkd_production` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `lkd_production`;

/*Table structure for table `tb_job` */

DROP TABLE IF EXISTS `tb_job`;

CREATE TABLE `tb_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `alert_value` int(11) DEFAULT NULL COMMENT '警戒值百分比',
  `hour` int(11) DEFAULT NULL COMMENT '工单生成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自动补货任务';

/*Data for the table `tb_job` */

insert  into `tb_job`(`id`,`alert_value`,`hour`) values (1,50,9);

/*Table structure for table `tb_task` */

DROP TABLE IF EXISTS `tb_task`;

CREATE TABLE `tb_task` (
  `task_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '工单编号',
  `task_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '工单名称',
  `task_status` int(11) DEFAULT NULL COMMENT '工单状态',
  `create_type` int(11) DEFAULT NULL COMMENT '创建类型 0：自动 1：手动',
  `inner_code` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '售货机编码',
  `user_id` bigint(20) NOT NULL COMMENT '执行人id',
  `user_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行人名称',
  `desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `ctime` datetime DEFAULT NULL COMMENT '创建时间',
  `utime` datetime DEFAULT NULL COMMENT '更新时间',
  `product_type_id` int(11) DEFAULT '1' COMMENT '工单类型id',
  `expect` datetime DEFAULT NULL COMMENT '计划完成时间',
  `assignor_id` bigint(20) DEFAULT NULL COMMENT '指派人Id',
  PRIMARY KEY (`task_id`),
  KEY `task_productiontype_TypeId_fk` (`product_type_id`),
  KEY `task_taskstatustype_StatusID_fk` (`task_status`),
  KEY `task_tasktype_TypeId_fk` (`create_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='工单表';

/*Data for the table `tb_task` */

insert  into `tb_task`(`task_id`,`task_name`,`task_status`,`create_type`,`inner_code`,`user_id`,`user_name`,`desc`,`ctime`,`utime`,`product_type_id`,`expect`,`assignor_id`) values (1,'测试工单',1,1,'12345',2,'测试','测试','2019-10-11 08:45:25','2019-10-11 08:45:27',1,'2019-10-11 08:45:33',2),(5,'自动补货工单',1,0,'037900004',0,NULL,'自动补货工单','2019-10-29 11:07:43','2019-10-29 11:07:43',2,'2019-10-29 00:00:00',2);

/*Table structure for table `tb_task_details` */

DROP TABLE IF EXISTS `tb_task_details`;

CREATE TABLE `tb_task_details` (
  `details_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) DEFAULT NULL COMMENT '工单Id',
  `channel_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '货道编号',
  `expect_capacity` int(11) NOT NULL DEFAULT '0' COMMENT '补货后期望容量',
  PRIMARY KEY (`details_id`),
  KEY `taskdetails_task_TaskId_fk` (`task_id`),
  CONSTRAINT `taskdetails_task_TaskId_fk` FOREIGN KEY (`task_id`) REFERENCES `tb_task` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='工单详情，只有补货工单才有';

/*Data for the table `tb_task_details` */

insert  into `tb_task_details`(`details_id`,`task_id`,`channel_code`,`expect_capacity`) values (1,5,'1-1',1),(2,5,'1-2',9),(3,5,'1-3',9),(4,5,'1-4',9),(5,5,'1-5',10),(6,5,'1-6',10),(7,5,'1-7',10),(8,5,'1-8',10),(9,5,'1-9',10),(10,5,'1-10',10),(11,5,'2-1',10),(12,5,'2-2',10),(13,5,'2-3',10),(14,5,'2-4',10),(15,5,'2-5',10),(16,5,'2-6',10),(17,5,'2-7',10),(18,5,'2-8',10),(19,5,'2-9',10),(20,5,'2-10',10),(21,5,'3-1',10),(22,5,'3-2',10),(23,5,'3-3',10),(24,5,'3-4',10),(25,5,'3-5',10),(26,5,'3-6',10),(27,5,'3-7',10),(28,5,'3-8',10),(29,5,'3-9',10),(30,5,'3-10',10),(31,5,'4-1',10),(32,5,'4-2',10),(33,5,'4-3',10),(34,5,'4-4',10),(35,5,'4-5',10),(36,5,'4-6',10),(37,5,'4-7',10),(38,5,'4-8',10),(39,5,'4-9',10),(40,5,'4-10',10),(41,5,'5-1',10),(42,5,'5-2',10),(43,5,'5-3',10),(44,5,'5-4',10),(45,5,'5-5',10),(46,5,'5-6',10),(47,5,'5-7',10),(48,5,'5-8',10),(49,5,'5-9',10),(50,5,'5-10',10);

/*Table structure for table `tb_task_status_type` */

DROP TABLE IF EXISTS `tb_task_status_type`;

CREATE TABLE `tb_task_status_type` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `TaskStatusType_StatusID_uindex` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='工单任务状态';

/*Data for the table `tb_task_status_type` */

insert  into `tb_task_status_type`(`status_id`,`status_name`) values (0,'创建'),(1,'进行'),(2,'取消'),(3,'完成');

/*Table structure for table `tb_task_type` */

DROP TABLE IF EXISTS `tb_task_type`;

CREATE TABLE `tb_task_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='工单类型';

/*Data for the table `tb_task_type` */

insert  into `tb_task_type`(`type_id`,`type_name`) values (1,'投放工单'),(2,'补货工单'),(3,'维修工单'),(4,'撤机工单');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
