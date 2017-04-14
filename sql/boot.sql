/*
Navicat MySQL Data Transfer

Source Server         : 123456
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2017-04-14 15:19:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `isRead` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `sendName` varchar(255) DEFAULT NULL,
  `receiveName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('2', '1', '很高兴认识你！', '2017-04-11', '张三', 'shermo');
INSERT INTO `message` VALUES ('4', '1', '七年前，刘看山还是个生活在北极的宅狐。一日，看山收到燕鸥小姐寄来的书，赠言「看山君，见字如面。长夏已尽，凛冬将至。心念所归，无惧无退。」看山想，燕鸥小姐向来吝啬自己的推荐，如果不是非常喜欢，一般不会说出口，看来这本《冰与火之歌》是一定要读的了。', '2017-04-12', '张三', 'shermo');
INSERT INTO `message` VALUES ('5', '1', '你好！', '2017-04-12', 'shermo', '张三');
INSERT INTO `message` VALUES ('6', '1', '今天下雨了，记得带伞', '2017-04-13', '张三', 'shermo');
INSERT INTO `message` VALUES ('7', '1', '知道了！', '2017-04-13', 'shermo', '张三');

-- ----------------------------
-- Table structure for `students`
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `sid` varchar(8) NOT NULL,
  `sname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('S0000002', '张无忌', '女', '武当山2号', '2015-06-24');
INSERT INTO `students` VALUES ('S0000004', '李白', '男', '西安长安区', '2015-06-06');
INSERT INTO `students` VALUES ('S0000005', '岳云鹏', '男', '天津', '2017-02-25');
INSERT INTO `students` VALUES ('S0000006', '韩梅梅', '女', '北京', '2017-03-06');
INSERT INTO `students` VALUES ('S0000007', '韩梅梅', '女', '北京', '2017-03-06');
INSERT INTO `students` VALUES ('S0000008', '李磊', '男', '西安', '2017-03-06');
INSERT INTO `students` VALUES ('S0000020', '杨幂', '女', '马来西亚', '2017-03-09');
INSERT INTO `students` VALUES ('S0000022', '博尔特', '男', '牙买加', '2017-01-21');
INSERT INTO `students` VALUES ('S0000023', '阿三', '男', '印度', '1960-01-27');
INSERT INTO `students` VALUES ('S0000024', '路飞', '男', '东海', '2017-06-07');
INSERT INTO `students` VALUES ('S0000025', '索隆', '男', '东海', '2017-03-11');
INSERT INTO `students` VALUES ('S0000026', '娜美', '女', '东海', '2017-03-10');
INSERT INTO `students` VALUES ('S0000027', '泰罗', '男', 'M78星云', '2017-04-12');
INSERT INTO `students` VALUES ('S0000028', '小樱', '女', '木叶', '2017-02-08');
INSERT INTO `students` VALUES ('S0000029', '尼古拉斯赵四', '男', '铁岭', '2017-02-08');
INSERT INTO `students` VALUES ('S0000030', '特朗普', '男', '华盛顿', '2017-02-08');
INSERT INTO `students` VALUES ('S0000031', '许仙', '男', '西湖', '2017-02-22');
INSERT INTO `students` VALUES ('S0000032', '白娘子', '女', '雷峰塔', '2016-11-23');
INSERT INTO `students` VALUES ('S0000033', '盖伦', '男', '德玛西亚', '2017-02-02');
INSERT INTO `students` VALUES ('S0000034', '卡特琳娜', '女', '诺克萨斯', '2017-02-15');
INSERT INTO `students` VALUES ('S0000035', '孙燕姿', '女', '马来西亚', '2017-03-25');
INSERT INTO `students` VALUES ('S0000036', '李磊', '男', '西安', '2017-04-11');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '张三', '111');
INSERT INTO `users` VALUES ('2', 'Shermo', '111');
INSERT INTO `users` VALUES ('3', 'root', '111111');
INSERT INTO `users` VALUES ('6', '西西', '11111111');
INSERT INTO `users` VALUES ('7', 'bxm', '111111');

-- ----------------------------
-- Procedure structure for `myproc`
-- ----------------------------
DROP PROCEDURE IF EXISTS `myproc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `myproc`(OUT s int)
BEGIN
select COUNT(*) into s from users;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `myproc2`
-- ----------------------------
DROP PROCEDURE IF EXISTS `myproc2`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `myproc2`(IN num int)
BEGIN
SELECT num;
SET num=num+1;
SELECT num;
END
;;
DELIMITER ;
