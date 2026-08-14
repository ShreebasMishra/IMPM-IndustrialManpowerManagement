/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 6.0.8-alpha-community : Database - impmdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`impmdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `impmdb`;

/*Table structure for table `impm_tblattendance` */

DROP TABLE IF EXISTS `impm_tblattendance`;

CREATE TABLE `impm_tblattendance` (
  `referenceno` char(50) DEFAULT NULL,
  `date` char(50) DEFAULT NULL,
  `employeeid` char(50) DEFAULT NULL,
  `employeename` char(50) DEFAULT NULL,
  `gender` char(50) DEFAULT NULL,
  `department` char(50) DEFAULT NULL,
  `shiftname` char(50) DEFAULT NULL,
  `starttime` char(50) DEFAULT NULL,
  `intime` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `impm_tblattendance` */

insert  into `impm_tblattendance`(`referenceno`,`date`,`employeeid`,`employeename`,`gender`,`department`,`shiftname`,`starttime`,`intime`) values ('1001','2025-07-12','E001','MANOJ KUMAR MOHAPATRA','Male','HRM','MORNING','06:00','06:20'),('1012','2025-07-12','E002','ADITYA MISHRA','Male','ADMINISTRATION','DAY','14:00','14:30'),('1020','2025-07-12','E003','VIKRANT SAHOO','Male','FINANCE','NIGHT','22:00','22:15'),('1031','2025-07-12','E004','KARTIK SHARMA','Male','MARKETING','DAY','14:00','14:35'),('1001','2025-07-14','E001','MANOJ KUMAR MOHAPATRA','Male','HRM','MORNING','06:00','06:15'),('1012','2025-07-14','E002','ADITYA MISHRA','Male','ADMINISTRATION','DAY','14:00','14:10'),('1020','2025-07-14','E003','VIKRANT SAHOO','Male','FINANCE','NIGHT','22:00','22:05'),('1031','2025-07-14','E004','KARTIK SHARMA','Male','MARKETING','DAY','14:00','14:10'),('1001','2025-07-15','E001','MANOJ KUMAR MOHAPATRA','Male','HRM','MORNING','06:00','06:10'),('1012','2025-07-15','E002','ADITYA MISHRA','Male','ADMINISTRATION','DAY','14:00','14:15'),('1020','2025-07-15','E003','VIKRANT SAHOO','Male','FINANCE','NIGHT','22:00','22:10'),('1031','2025-07-15','E004','KARTIK SHARMA','Male','MARKETING','DAY','14:00','14:20');

/*Table structure for table `impm_tblattendanceout` */

DROP TABLE IF EXISTS `impm_tblattendanceout`;

CREATE TABLE `impm_tblattendanceout` (
  `referenceno` char(50) DEFAULT NULL,
  `date` char(50) DEFAULT NULL,
  `employeeid` char(50) DEFAULT NULL,
  `employeename` char(50) DEFAULT NULL,
  `gender` char(50) DEFAULT NULL,
  `department` char(50) DEFAULT NULL,
  `shiftname` char(50) DEFAULT NULL,
  `endtime` char(50) DEFAULT NULL,
  `outtime` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `impm_tblattendanceout` */

insert  into `impm_tblattendanceout`(`referenceno`,`date`,`employeeid`,`employeename`,`gender`,`department`,`shiftname`,`endtime`,`outtime`) values ('1001','2025-07-12','E001','MANOJ KUMAR MOHAPATRA','Male','HRM','MORNING','14:00','14:20'),('1012','2025-07-12','E002','ADITYA MISHRA','Male','ADMINISTRATION','DAY','22:00','22:15'),('1020','2025-07-12','E003','VIKRANT SAHOO','Male','FINANCE','NIGHT','06:00','06:20'),('1031','2025-07-12','E004','KARTIK SHARMA','Male','MARKETING','DAY','22:00','22:30'),('1001','2025-07-14','E001','MANOJ KUMAR MOHAPATRA','Male','HRM','MORNING','14:00','14:15'),('1012','2025-07-14','E002','ADITYA MISHRA','Male','ADMINISTRATION','DAY','22:00','22:20'),('1020','2025-07-14','E003','VIKRANT SAHOO','Male','FINANCE','NIGHT','06:00','06:15'),('1031','2025-07-14','E004','KARTIK SHARMA','Male','MARKETING','DAY','22:00','22:20'),('1001','2025-07-15','E001','MANOJ KUMAR MOHAPATRA','Male','HRM','MORNING','14:00','14:10'),('1012','2025-07-15','E002','ADITYA MISHRA','Male','ADMINISTRATION','DAY','22:00','22:10'),('1020','2025-07-15','E003','VIKRANT SAHOO','Male','FINANCE','NIGHT','06:00','06:10'),('1031','2025-07-15','E004','KARTIK SHARMA','Male','MARKETING','DAY','22:00','22:10');

/*Table structure for table `impm_tbldept` */

DROP TABLE IF EXISTS `impm_tbldept`;

CREATE TABLE `impm_tbldept` (
  `deptcode` char(20) DEFAULT NULL,
  `deptname` char(50) DEFAULT NULL,
  `depthead` char(50) DEFAULT NULL,
  `phoneno` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `impm_tbldept` */

insert  into `impm_tbldept`(`deptcode`,`deptname`,`depthead`,`phoneno`) values ('D001','HRM','SHREEBAS MISHRA','7848042918'),('D002','MARKETING','RAJEEB MOHAPATRA','9862575234'),('D003','ADMINISTRATION','BHUVAN DASH','9763432896'),('D004','FINANCE','PRATYUSH MISHRA','8480718898');

/*Table structure for table `impm_tblemployee` */

DROP TABLE IF EXISTS `impm_tblemployee`;

CREATE TABLE `impm_tblemployee` (
  `employeeid` char(50) DEFAULT NULL,
  `employeename` char(50) DEFAULT NULL,
  `gender` char(50) DEFAULT NULL,
  `dobirth` char(50) DEFAULT NULL,
  `photo` char(50) DEFAULT NULL,
  `fathername` char(50) DEFAULT NULL,
  `mothername` char(50) DEFAULT NULL,
  `locality` char(50) DEFAULT NULL,
  `city` char(50) DEFAULT NULL,
  `state` char(50) DEFAULT NULL,
  `pin` char(50) DEFAULT NULL,
  `phoneno` char(50) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `dojoin` char(50) DEFAULT NULL,
  `department` char(50) DEFAULT NULL,
  `shiftcode` char(50) DEFAULT NULL,
  `shiftname` char(50) DEFAULT NULL,
  `starttime` char(50) DEFAULT NULL,
  `endtime` char(50) DEFAULT NULL,
  `basicsalary` char(50) DEFAULT NULL,
  `dearnessallowances` char(50) DEFAULT NULL,
  `houserent` char(50) DEFAULT NULL,
  `providentfund` char(50) DEFAULT NULL,
  `tax` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `impm_tblemployee` */

insert  into `impm_tblemployee`(`employeeid`,`employeename`,`gender`,`dobirth`,`photo`,`fathername`,`mothername`,`locality`,`city`,`state`,`pin`,`phoneno`,`email`,`dojoin`,`department`,`shiftcode`,`shiftname`,`starttime`,`endtime`,`basicsalary`,`dearnessallowances`,`houserent`,`providentfund`,`tax`) values ('E001','MANOJ KUMAR MOHAPATRA','Male','2000-07-09','null','RAJAN MOHAPATRA','BHANUPRIYA MOHAPATRA','NUABAZAR','CUTTACK','Odisha','753004','7665432176','Manoj123@gmail.com','2020-09-09','HRM','S001','MORNING','06:00','14:00','25000','30','3','null','7'),('E002','ADITYA MISHRA','Male','1995-10-18','null','SHANTANU MISHRA','PRATIVA MISHRA','CHANDRASEKHARPUR','BBSR','Odisha','751016','98612343267','Aditya95@gmail.com','2017-07-12','ADMINISTRATION','S002','DAY','14:00','22:00','40000','40','5','null','8'),('E003','VIKRANT SAHOO','Male','1999-11-25','','RAMAKANT SAHOO','JANKI SAHOO','TULSIPUR','CUTTACK','Odisha','753008','9437463422','Viksh@gmail.com','2019-12-10','FINANCE','S003','NIGHT','22:00','06:00','35000','40','4','null','8'),('E004','KARTIK SHARMA','Male','1998-09-20','','RAJESH SHARMA','TULSI SHARMA','BAPUJI NAGAR','BBSR','Odisha','751009','9763654234','Kartik321@gmail.com','2019-12-10','MARKETING','S002','DAY','14:00','22:00','30000','30','3','null','7');

/*Table structure for table `impm_tblindus` */

DROP TABLE IF EXISTS `impm_tblindus`;

CREATE TABLE `impm_tblindus` (
  `regdno` char(20) DEFAULT NULL,
  `estdt` char(20) DEFAULT NULL,
  `nmindus` char(50) DEFAULT NULL,
  `hdindus` char(50) DEFAULT NULL,
  `locality` char(50) DEFAULT NULL,
  `city` char(50) DEFAULT NULL,
  `state` char(50) DEFAULT NULL,
  `phoneno` char(20) DEFAULT NULL,
  `emailid` char(50) DEFAULT NULL,
  `gstno` char(30) DEFAULT NULL,
  `gstdt` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `impm_tblindus` */

insert  into `impm_tblindus`(`regdno`,`estdt`,`nmindus`,`hdindus`,`locality`,`city`,`state`,`phoneno`,`emailid`,`gstno`,`gstdt`) values ('12356','1/9/2023','SM GROUP OF INDUSTRIES','SHREEBAS MISHRA','MADHUPATNA','CUTTACK','Odisha','7848042918','shreebasmishra.02@gmail.com','21xyz429824','1/10/2023');

/*Table structure for table `impm_tbllogin` */

DROP TABLE IF EXISTS `impm_tbllogin`;

CREATE TABLE `impm_tbllogin` (
  `username` char(50) DEFAULT NULL,
  `password` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `impm_tbllogin` */

insert  into `impm_tbllogin`(`username`,`password`) values ('SHREEBAS MISHRA','SHREEBAS');

/*Table structure for table `impm_tblshift` */

DROP TABLE IF EXISTS `impm_tblshift`;

CREATE TABLE `impm_tblshift` (
  `shiftcode` char(20) DEFAULT NULL,
  `shiftname` char(20) DEFAULT NULL,
  `starttime` char(20) DEFAULT NULL,
  `endtime` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `impm_tblshift` */

insert  into `impm_tblshift`(`shiftcode`,`shiftname`,`starttime`,`endtime`) values ('S001','M0RNING','06:00','14:00'),('S002','DAY','14:00','22:00'),('S003','NIGHT','22:00','06:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
