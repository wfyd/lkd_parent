/*
SQLyog Ultimate v8.32 
MySQL - 8.0.16 : Database - lkd_order
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lkd_order` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `lkd_order`;

/*Table structure for table `tb_order` */

DROP TABLE IF EXISTS `tb_order`;

CREATE TABLE `tb_order` (
  `id` bigint(20) NOT NULL,
  `order_no` varchar(34) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  `third_no` varchar(34) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付流水号',
  `inner_code` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机器编号',
  `area_id` int(11) DEFAULT NULL COMMENT '区域Id',
  `company_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'skuId',
  `sku_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `status` int(11) DEFAULT NULL COMMENT '订单状态:0-创建;1-支付完成;2-出货成功;3-出货失败;',
  `ctime` datetime DEFAULT NULL COMMENT '创建时间',
  `utime` datetime DEFAULT NULL COMMENT '更新时间',
  `amount` int(11) NOT NULL DEFAULT '0' COMMENT '支付金额',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '商品金额',
  `pay_type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付类型，1支付宝 2微信',
  `pay_status` int(11) DEFAULT '0' COMMENT '支付状态，0-未支付;1-支付完成;2-退款中;3-退款完成',
  `bill` int(11) DEFAULT '0' COMMENT '合作商账单金额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Order_OrderNo_uindex` (`order_no`),
  UNIQUE KEY `order_ThirdNo_uindex` (`third_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_order` */

insert  into `tb_order`(`id`,`order_no`,`third_no`,`inner_code`,`area_id`,`company_id`,`sku_id`,`sku_name`,`status`,`ctime`,`utime`,`amount`,`price`,`pay_type`,`pay_status`,`bill`) values (1,'1','1','037900004',1,1,1,'1',2,'2019-09-29 06:53:38','2019-09-29 06:53:41',1,1,'1',1,0),(2,'2','2','037900004',1,1,1,'1',2,'2019-09-29 06:54:14','2019-09-29 06:54:16',1,1,'1',1,0),(3,'3','3','037900004',2,1,1,'1',2,'2019-09-29 06:54:54','2019-09-29 06:54:57',1,1,'1',1,0),(1181831227343847426,'11111111440940859672500',NULL,'037900004',2,1,1,'测试商品',2,'2019-10-09 15:18:17','2019-10-09 15:18:17',0,1,'1',0,0),(1181831335527530498,'11111111440966645578500',NULL,'037900004',2,1,1,'测试商品',2,'2019-10-09 15:18:42','2019-10-09 15:18:42',0,1,'1',0,0),(1181831481766133761,'11111111441001501614800',NULL,'037900004',2,1,1,'测试商品',0,'2019-10-09 15:19:17','2019-10-09 15:19:17',0,1,'1',0,0),(1181831721881649154,'11111111441058774217000',NULL,'037900004',2,1,1,'测试商品',0,'2019-10-09 15:20:15','2019-10-09 15:20:15',0,1,'1',0,0),(1181831895433560066,'11111111441100131505300',NULL,'037900004',2,1,1,'测试商品',0,'2019-10-09 15:20:56','2019-10-09 15:20:56',0,1,'1',0,0),(1181832151302881282,'11111111441161138044500',NULL,'037900004',2,1,1,'测试商品',0,'2019-10-09 15:21:57','2019-10-09 15:21:57',0,1,'1',0,0),(1181832591784538113,'11111111441265416045200',NULL,'037900004',2,1,1,'测试商品',0,'2019-10-09 15:23:41','2019-10-09 15:23:41',0,1,'1',0,0),(1181832662294982658,'11111111441282969540400',NULL,'037900004',2,1,1,'测试商品',0,'2019-10-09 15:23:59','2019-10-09 15:23:59',0,1,'1',0,0),(1181832895963852802,'11111111441338683940900',NULL,'037900004',2,1,1,'测试商品',0,'2019-10-09 15:24:54','2019-10-09 15:24:54',0,1,'1',0,0),(1181832996916555777,'11111111441362768396900',NULL,'037900004',2,1,1,'测试商品',0,'2019-10-09 15:25:18','2019-10-09 15:25:19',0,1,'1',0,0),(1181833326563684353,'11111111441441016873500',NULL,'037900004',2,1,1,'测试商品',0,'2019-10-09 15:26:37','2019-10-09 15:26:37',0,1,'1',0,0),(1181833667715788802,'11111111441522638526300',NULL,'037900004',2,1,1,'测试商品',2,'2019-10-09 15:27:58','2019-10-09 15:27:58',1,1,'1',0,0),(1181833936075747330,'11111111441586617116900',NULL,'037900004',2,1,1,'测试商品',2,'2019-10-09 15:29:02','2019-10-09 15:29:02',1,1,'1',0,0),(1181834000881938433,'11111111441602130128300',NULL,'037900004',2,1,1,'测试商品',2,'2019-10-09 15:29:18','2019-10-09 15:29:18',1,1,'1',0,0),(1181834314347331586,'11111111441676119349500','2019100922001455790506292641','037900004',2,1,1,'测试商品',2,'2019-10-09 15:30:32','2019-10-09 15:30:32',1,1,'1',1,0),(1181834483780435969,'11111111441717265685100','2019100922001455790506277807','037900004',2,1,1,'测试商品',2,'2019-10-09 15:31:13','2019-10-09 15:31:13',1,1,'1',1,0),(1181835516413886466,'11111111441963457503000','2019100922001455790505877532','037900004',2,1,1,'测试商品',2,'2019-10-09 15:35:19','2019-10-09 15:35:19',1,1,'1',1,0),(1181836527224373249,'11111111442188340925600',NULL,'037900004',2,1,1,'测试商品',2,'2019-10-09 15:39:20','2019-10-09 15:39:20',1,1,'1',0,0),(1181836804702846978,'11111111442269844367600','2019100922001455790506918921','037900004',2,1,1,'测试商品',2,'2019-10-09 15:40:26','2019-10-09 15:40:26',1,1,'1',1,0),(1181837883951742977,'11111111442527174139800','2019100922001455790507844941','037900004',2,1,1,'测试商品',2,'2019-10-09 15:44:43','2019-10-09 15:44:43',1,1,'1',1,0),(1181839377501454338,'11111111442884010440000','2019100922001455790507759912','037900004',2,1,1,'测试商品',2,'2019-10-09 15:50:40','2019-10-09 15:50:40',1,1,'1',1,0),(1181839659371266050,'11111111442951144710800',NULL,'037900004',2,1,1,'测试商品',2,'2019-10-09 15:51:47','2019-10-09 15:51:47',1,1,'1',0,0),(1181839849989799937,'11111111442996647863300',NULL,'037900004',2,1,1,'测试商品',2,'2019-10-09 15:52:32','2019-10-09 15:52:32',1,1,'1',0,0),(1181840472747417601,'11111111443144437936700',NULL,'037900004',2,1,1,'测试商品',2,'2019-10-09 15:55:00','2019-10-09 15:55:00',1,1,'1',0,0),(1181840810393083906,'11111111443225644086400',NULL,'037900004',2,1,1,'测试商品',2,'2019-10-09 15:56:21','2019-10-09 15:56:21',1,1,'1',0,0),(1181840951455916034,'11111111443259274762300',NULL,'037900004',2,1,1,'测试商品',2,'2019-10-09 15:56:55','2019-10-09 15:56:55',1,1,'1',0,0),(1181841603754143746,'11111111443413902498200',NULL,'037900004',2,1,1,'测试商品',2,'2019-10-09 15:59:30','2019-10-09 15:59:30',1,1,'1',0,0),(1181842965174820865,'11111111443738493582300',NULL,'037900004',2,1,1,'测试商品',2,'2019-10-09 16:04:54','2019-10-09 16:04:54',1,1,'1',0,0),(1181843700541169665,'11111111443914692212500',NULL,'037900004',2,1,1,'测试商品',2,'2019-10-09 16:07:50','2019-10-09 16:07:50',1,1,'1',0,0),(1181845119654629377,'11111111444252325670800',NULL,'037900004',2,1,2,'测试商品',2,'2019-10-09 16:13:28','2019-10-09 16:13:28',1,1,'1',0,0),(1181845788843307010,'11111111444411875954100',NULL,'037900004',2,1,2,'测试商品2',2,'2019-10-17 16:16:08','2019-10-21 14:11:27',1,1,'1',1,0);

/*Table structure for table `tb_order_collect` */

DROP TABLE IF EXISTS `tb_order_collect`;

CREATE TABLE `tb_order_collect` (
  `id` bigint(20) NOT NULL COMMENT 'Id',
  `company_id` int(11) DEFAULT NULL COMMENT '公司Id',
  `company_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司名',
  `area_Id` int(11) DEFAULT NULL COMMENT '区域Id',
  `area_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地区名称',
  `order_total_money` bigint(20) DEFAULT NULL COMMENT '订单总金额',
  `vendout_total_count` bigint(20) DEFAULT NULL COMMENT '出货总数量',
  `date` date DEFAULT NULL COMMENT '发生日期',
  `bill` int(11) DEFAULT '0' COMMENT '账单',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_order_collect_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单汇总表';

/*Data for the table `tb_order_collect` */

insert  into `tb_order_collect`(`id`,`company_id`,`company_name`,`area_Id`,`area_name`,`order_total_money`,`vendout_total_count`,`date`,`bill`) values (0,1,'公司1',2,'洛阳市',1,1,'2019-10-17',0),(1,1,'1号公司',1,'地区1',100,100,'2019-09-28',0),(2,1,'1号公司',2,'地区2',150,100,'2019-09-28',0),(3,2,'2号公司',1,'地区1',100,100,'2019-09-28',0),(4,1,'1号公司',1,'地区1',200,200,'2019-10-07',0),(5,1,'1号公司',2,'地区2',100,100,'2019-10-07',0),(1185113357050081282,1,'公司1',2,'洛阳市',1,1,'2019-10-17',0);

/*Table structure for table `tb_order_month_collect` */

DROP TABLE IF EXISTS `tb_order_month_collect`;

CREATE TABLE `tb_order_month_collect` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `compony_id` int(11) DEFAULT NULL COMMENT '公司Id',
  `company_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL COMMENT '区域Id',
  `order_total_money` bigint(20) DEFAULT NULL COMMENT '订单总金额',
  `order_total_count` bigint(20) DEFAULT NULL COMMENT '订单总数',
  `month` int(11) DEFAULT NULL COMMENT '月份',
  `year` int(11) DEFAULT NULL COMMENT '年份',
  `area_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地区名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_order_month_collect_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='按月统计各公司销售情况表';

/*Data for the table `tb_order_month_collect` */

insert  into `tb_order_month_collect`(`id`,`compony_id`,`company_name`,`area_id`,`order_total_money`,`order_total_count`,`month`,`year`,`area_name`) values (1,1,'1号公司',1,100,100,1,2019,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;