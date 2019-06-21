/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : hrdb

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2019-06-21 22:48:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dept_inf
-- ----------------------------
DROP TABLE IF EXISTS `dept_inf`;
CREATE TABLE `dept_inf` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `remark` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept_inf
-- ----------------------------
INSERT INTO `dept_inf` VALUES ('1', '财务部', '无');
INSERT INTO `dept_inf` VALUES ('2', '学术部', '无');
INSERT INTO `dept_inf` VALUES ('3', '公关部', '无');
INSERT INTO `dept_inf` VALUES ('4', '科技部', '无');
INSERT INTO `dept_inf` VALUES ('5', '天文部', '无');
INSERT INTO `dept_inf` VALUES ('6', '建设部', '无');
INSERT INTO `dept_inf` VALUES ('7', '测试', '测试');
INSERT INTO `dept_inf` VALUES ('8', '测试', '测试');
INSERT INTO `dept_inf` VALUES ('9', '测试', '测试');
INSERT INTO `dept_inf` VALUES ('10', '测试', '测试');
INSERT INTO `dept_inf` VALUES ('11', '测试', '测试');

-- ----------------------------
-- Table structure for employee_inf
-- ----------------------------
DROP TABLE IF EXISTS `employee_inf`;
CREATE TABLE `employee_inf` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEPT_ID` int(11) NOT NULL,
  `JOB_ID` int(11) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `CARD_ID` varchar(18) NOT NULL,
  `ADDRESS` varchar(50) NOT NULL,
  `POST_CODE` varchar(50) DEFAULT NULL,
  `TEL` varchar(16) DEFAULT NULL,
  `PHONE` varchar(11) DEFAULT NULL,
  `QQ_NUM` varchar(10) DEFAULT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `SEX` int(11) NOT NULL DEFAULT '1',
  `PARTY` varchar(10) DEFAULT NULL,
  `BIRTHDAY` datetime NOT NULL,
  `RACE` varchar(100) DEFAULT NULL,
  `EDUCATION` varchar(10) DEFAULT NULL,
  `SPECIALITY` varchar(20) DEFAULT NULL,
  `HOBBY` varchar(100) NOT NULL,
  `REMARK` varchar(500) DEFAULT NULL,
  `CREATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_EMP_DEPT` (`DEPT_ID`),
  KEY `FK_EMP_JOB` (`JOB_ID`),
  CONSTRAINT `FK_EMP_DEPT` FOREIGN KEY (`DEPT_ID`) REFERENCES `dept_inf` (`ID`),
  CONSTRAINT `FK_EMP_JOB` FOREIGN KEY (`JOB_ID`) REFERENCES `job_inf` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_inf
-- ----------------------------

-- ----------------------------
-- Table structure for job_inf
-- ----------------------------
DROP TABLE IF EXISTS `job_inf`;
CREATE TABLE `job_inf` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  `remark` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job_inf
-- ----------------------------
INSERT INTO `job_inf` VALUES ('1', '工程师', '无');
INSERT INTO `job_inf` VALUES ('2', '会计师', '无');
INSERT INTO `job_inf` VALUES ('3', '普通职员', '无');
INSERT INTO `job_inf` VALUES ('4', '程序员', '无');
INSERT INTO `job_inf` VALUES ('5', 'wfed ', 'wfed ');
INSERT INTO `job_inf` VALUES ('6', '郭敬潮', '12');

-- ----------------------------
-- Table structure for user_inf
-- ----------------------------
DROP TABLE IF EXISTS `user_inf`;
CREATE TABLE `user_inf` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(20) NOT NULL,
  `PASSWORD` varchar(16) NOT NULL,
  `STATUS` int(11) NOT NULL DEFAULT '1',
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_inf
-- ----------------------------
INSERT INTO `user_inf` VALUES ('18', '郭敬潮', '123456', '2', '2019-06-04 10:25:43', '郭敬潮');
INSERT INTO `user_inf` VALUES ('19', '23423', '123456', '0', '2019-06-06 21:43:41', '23423');
INSERT INTO `user_inf` VALUES ('20', '23423', '123456', '0', '2019-06-06 21:43:50', '23423');
INSERT INTO `user_inf` VALUES ('21', '23423', '123456', '0', '2019-06-06 21:43:52', '23423');
INSERT INTO `user_inf` VALUES ('22', '23423', '123456', '0', '2019-06-06 21:43:54', '23423');
INSERT INTO `user_inf` VALUES ('23', '士大夫发射点', '123456', '0', '2019-06-09 16:50:36', '关键是大哥');
INSERT INTO `user_inf` VALUES ('24', '士大夫发射点', '123456', '0', '2019-06-09 16:50:38', '关键是大哥');
INSERT INTO `user_inf` VALUES ('25', '士大夫发', '123456', '0', '2019-06-09 16:50:43', '关键是大');
INSERT INTO `user_inf` VALUES ('26', '士大夫发', '123456', '0', '2019-06-09 16:50:46', '关键是大');
INSERT INTO `user_inf` VALUES ('27', '士大夫发', '123456', '0', '2019-06-09 16:50:51', '关键是');
INSERT INTO `user_inf` VALUES ('28', '士大夫发', '123456', '0', '2019-06-09 16:50:52', '关键是');
INSERT INTO `user_inf` VALUES ('29', '士大deg ', '123456', '0', '2019-06-09 16:51:00', '关键');
INSERT INTO `user_inf` VALUES ('30', '士大deg ', '123456', '0', '2019-06-09 16:51:01', '关键');
INSERT INTO `user_inf` VALUES ('31', '士大deg ', '123456', '0', '2019-06-09 16:51:03', '关键');
INSERT INTO `user_inf` VALUES ('32', '士大deg ', '123456', '0', '2019-06-09 16:51:09', '关');
INSERT INTO `user_inf` VALUES ('33', '士大f', '123456', '0', '2019-06-09 16:51:16', '关');
INSERT INTO `user_inf` VALUES ('34', '士大f', '123456', '0', '2019-06-09 16:51:18', '关');
INSERT INTO `user_inf` VALUES ('35', 'jhniujhnuij', '123456', '0', '2019-06-09 20:09:36', '你');
INSERT INTO `user_inf` VALUES ('36', '士大夫', '123456', '0', '2019-06-13 10:42:55', '士大夫');
INSERT INTO `user_inf` VALUES ('37', '郭敬潮', '123456', '2', '2019-06-21 13:33:05', '千万人');
INSERT INTO `user_inf` VALUES ('38', '124', '123456', '1', '2019-06-21 21:45:15', '蔡泽隆');
INSERT INTO `user_inf` VALUES ('39', '123123', '123456', '1', '2019-06-21 21:55:29', '刚发给各个');
