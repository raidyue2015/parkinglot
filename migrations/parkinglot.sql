/*
Navicat MySQL Data Transfer

Source Server         : WQH
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : parkinglot

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-01-11 21:08:44
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `consumption`
-- ----------------------------
DROP TABLE IF EXISTS `consumption`;
CREATE TABLE `consumption` (
  `CID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `UID` int(11) unsigned zerofill NOT NULL,
  `PID` int(11) unsigned zerofill NOT NULL,
  `LID` int(11) unsigned zerofill NOT NULL,
  `STime` date NOT NULL,
  `ETime` date NOT NULL,
  `cost` double NOT NULL,
  PRIMARY KEY (`CID`),
  KEY `UID` (`UID`),
  KEY `PID` (`PID`),
  KEY `LID` (`LID`),
  CONSTRAINT `consumption_ibfk_3` FOREIGN KEY (`LID`) REFERENCES `lot` (`LID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consumption_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consumption_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `parkinglot` (`PID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consumption
-- ----------------------------

-- ----------------------------
-- Table structure for `lot`
-- ----------------------------
DROP TABLE IF EXISTS `lot`;
CREATE TABLE `lot` (
  `LID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `PID` int(10) unsigned zerofill NOT NULL,
  `LNum` varchar(10) NOT NULL,
  `Statu` varchar(2) NOT NULL,
  PRIMARY KEY (`LID`),
  KEY `PID` (`PID`),
  CONSTRAINT `lot_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `parkinglot` (`PID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lot
-- ----------------------------

-- ----------------------------
-- Table structure for `parkinglot`
-- ----------------------------
DROP TABLE IF EXISTS `parkinglot`;
CREATE TABLE `parkinglot` (
  `PID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `PName` varchar(20) NOT NULL,
  `PSity` varchar(20) NOT NULL,
  `PAdress` varchar(100) NOT NULL,
  `charge` double NOT NULL,
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parkinglot
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `UID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `over` double NOT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
