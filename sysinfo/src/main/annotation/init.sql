/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.16 : Database - ups
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sys_test` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sys_test`;

/*Table structure for table `t_adminuserroles` */

DROP TABLE IF EXISTS `t_adminuserroles`;

CREATE TABLE `t_adminuserroles` (
  `adminUserId` bigint(20) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  KEY `AdminUsers_Roles_idx` (`adminUserId`),
  KEY `Roles_AdminUsers_idx` (`roleId`),
  CONSTRAINT `AdminUsers_Roles` FOREIGN KEY (`adminUserId`) REFERENCES `t_adminusers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Roles_AdminUsers` FOREIGN KEY (`roleId`) REFERENCES `t_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_adminuserroles` */

insert  into `t_adminuserroles`(`adminUserId`,`roleId`) values (1,1),(2,1),(3,1);

/*Table structure for table `t_adminusers` */

DROP TABLE IF EXISTS `t_adminusers`;

CREATE TABLE `t_adminusers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `passwordSalt` varchar(200) DEFAULT NULL,
  `isDisabled` tinyint(1) DEFAULT '0',
  `isDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_ACCOUNT` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_adminusers` */

insert  into `t_adminusers`(`id`,`account`,`password`,`passwordSalt`,`isDisabled`,`isDeleted`) values (1,'superadmin','7e531a3a360ceffeb4111b790c13e19d','7e531a3a360ceffeb4111b790c13e19d',0,0),(2,'admin','57e64ddb119f71026fccd52e7c169102','57e64ddb119f71026fccd52e7c169102',0,0),(3,'test','57e64ddb119f71026fccd52e7c169102','6fb19b8809521b31396a731b93b926c6',0,0),(5,'test1',NULL,NULL,0,0),(6,'admin2','a5faac98f5cbd3c188863cab8cf32a57','a5faac98f5cbd3c188863cab8cf32a57',0,0);

/*Table structure for table `t_permissions` */

DROP TABLE IF EXISTS `t_permissions`;

CREATE TABLE `t_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission` varchar(200) DEFAULT NULL,
  `description` text,
  `isDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `t_permissions` */

insert  into `t_permissions`(`id`,`permission`,`description`,`isDeleted`) values (1,'admin','系统管理',0),(2,'/adminUser/list.do','管理员用户管理',0),(3,'/role/list.do','角色管理',0),(4,'/permission/list.do','权限管理',0),(5,'/adminUser/delete.do','删除管理员用户',0),(6,'/adminUser/updatePassWord.do','重置管理员用户密码',0),(7,'/adminUser/updateAdminUserRole.do','分配管理员角色',0),(8,'/adminUser/updateDisabled.do','管理员用户-禁用/启用',0),(9,'/role/delete.do','删除角色',0),(10,'TEST','TEST',0);

/*Table structure for table `t_rolepermissions` */

DROP TABLE IF EXISTS `t_rolepermissions`;

CREATE TABLE `t_rolepermissions` (
  `roleId` bigint(20) DEFAULT NULL,
  `permissionId` bigint(20) DEFAULT NULL,
  KEY `Roles_Permissions_idx` (`roleId`),
  KEY `Permissions_Roles_idx` (`permissionId`),
  CONSTRAINT `Permissions_Roles` FOREIGN KEY (`permissionId`) REFERENCES `t_permissions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Roles_Permissions` FOREIGN KEY (`roleId`) REFERENCES `t_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `t_rolepermissions` */

insert  into `t_rolepermissions`(`roleId`,`permissionId`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10);

/*Table structure for table `t_roles` */

DROP TABLE IF EXISTS `t_roles`;

CREATE TABLE `t_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` text,
  `isDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_roles` */

insert  into `t_roles`(`id`,`name`,`description`,`isDeleted`) values (1,'超级管理员','上帝般的存在，拥有对系统的所有权限',0),(2,'普通管理员','不能操作系统管理',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
