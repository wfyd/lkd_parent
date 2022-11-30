/*
SQLyog Ultimate v8.32 
MySQL - 8.0.16 : Database - lkd_user
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lkd_user` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `lkd_user`;

/*Table structure for table `tb_company` */

DROP TABLE IF EXISTS `tb_company`;

CREATE TABLE `tb_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `business_type` int(11) DEFAULT NULL COMMENT '0:平台方;1:加盟客户',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合作商名称',
  `divide` int(11) DEFAULT NULL COMMENT '分成比例',
  `enable` int(11) DEFAULT '1' COMMENT '是否启用,0:未启用；1-启用',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '联系人',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='公司';

/*Data for the table `tb_company` */

insert  into `tb_company`(`id`,`business_type`,`name`,`divide`,`enable`,`user_name`,`mobile`) values (1,1,'公司1',10,1,'',''),(2,1,'公司2',5,0,'',''),(3,1,'测试创建合作商',5,1,'张三','13511111111'),(4,1,'测试创建合作商',5,1,'张三','13511111111'),(5,1,'公司1',10,1,'','');

/*Table structure for table `tb_role` */

DROP TABLE IF EXISTS `tb_role`;

CREATE TABLE `tb_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色编号',
  `role_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户角色表';

/*Data for the table `tb_role` */

insert  into `tb_role`(`role_id`,`role_code`,`role_name`) values (1,'1000','管理员'),(2,'1001','运营员'),(3,'1002','维修员');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '角色Id',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名称',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登录名',
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `area_id` int(11) NOT NULL COMMENT '区域id',
  `secret` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '私钥',
  `role_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色编号',
  `mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `company_id` int(11) DEFAULT '1' COMMENT '公司Id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_user_Id_uindex` (`id`),
  UNIQUE KEY `login_name_unique` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`role_id`,`user_name`,`login_name`,`password`,`area_id`,`secret`,`role_code`,`mobile`,`company_id`) values (1,1,'管理员','admin','$2a$10$YKBtSI3aNzRQRXSCPQgcCeYcpmhoh/7USKKo9CmE1S4o9uRC1yqRu',1,'123456','1000','13552047187',1),(2,2,'运营员','yunying','$2a$10$YKBtSI3aNzRQRXSCPQgcCeYcpmhoh/7USKKo9CmE1S4o9uRC1yqRu',1,'123456','1001','13552047187',1),(3,3,'维修员','维修','$2a$10$YKBtSI3aNzRQRXSCPQgcCeYcpmhoh/7USKKo9CmE1S4o9uRC1yqRu',1,'123456','1002','13552047187',1);

/*Table structure for table `tb_user_vm` */

DROP TABLE IF EXISTS `tb_user_vm`;

CREATE TABLE `tb_user_vm` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vm_id` bigint(20) DEFAULT NULL COMMENT '售货机编号',
  `inner_code` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机器编号',
  `role_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色编号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户编号',
  `user_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='售货机用户映射表';

/*Data for the table `tb_user_vm` */

insert  into `tb_user_vm`(`id`,`vm_id`,`inner_code`,`role_code`,`user_id`,`user_Name`) values (7,NULL,'037900004','1001',2,'运营员'),(8,NULL,'037900004','1002',3,'维修员');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
