/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : benz

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2015-11-19 16:44:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `country_id` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', '北京', '1');
INSERT INTO `province` VALUES ('2', '上海', '1');
INSERT INTO `province` VALUES ('3', '重庆', '1');
INSERT INTO `province` VALUES ('4', '天津', '1');
INSERT INTO `province` VALUES ('5', '香港', '1');
INSERT INTO `province` VALUES ('6', '澳门', '1');
INSERT INTO `province` VALUES ('7', '河北', '1');
INSERT INTO `province` VALUES ('8', '河南', '1');
INSERT INTO `province` VALUES ('9', '辽宁', '1');
INSERT INTO `province` VALUES ('10', '吉林', '1');
INSERT INTO `province` VALUES ('11', '黑龙江', '1');
INSERT INTO `province` VALUES ('12', '山西', '1');
INSERT INTO `province` VALUES ('13', '内蒙古', '1');
INSERT INTO `province` VALUES ('14', '江苏', '1');
INSERT INTO `province` VALUES ('15', '浙江', '1');
INSERT INTO `province` VALUES ('16', '安徽', '1');
INSERT INTO `province` VALUES ('17', '江西', '1');
INSERT INTO `province` VALUES ('18', '福建', '1');
INSERT INTO `province` VALUES ('19', '山东', '1');
INSERT INTO `province` VALUES ('20', '台湾', '1');
INSERT INTO `province` VALUES ('21', '湖北', '1');
INSERT INTO `province` VALUES ('22', '湖南', '1');
INSERT INTO `province` VALUES ('23', '广东', '1');
INSERT INTO `province` VALUES ('24', '广西', '1');
INSERT INTO `province` VALUES ('25', '海南', '1');
INSERT INTO `province` VALUES ('26', '四川', '1');
INSERT INTO `province` VALUES ('27', '云南', '1');
INSERT INTO `province` VALUES ('28', '西藏', '1');
INSERT INTO `province` VALUES ('29', '贵州', '1');
INSERT INTO `province` VALUES ('30', '陕西', '1');
INSERT INTO `province` VALUES ('31', '甘肃', '1');
INSERT INTO `province` VALUES ('32', '青海', '1');
INSERT INTO `province` VALUES ('33', '宁夏', '1');
INSERT INTO `province` VALUES ('34', '新疆', '1');
