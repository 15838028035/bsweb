/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : upmcrm

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2017-03-16 10:02:16
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `crm_approval_log`
-- ----------------------------
DROP TABLE IF EXISTS `crm_approval_log`;
CREATE TABLE `crm_approval_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `batch_Id` int(11) DEFAULT NULL COMMENT '流程批次ID',
  `Flow_TYPE` varchar(255) DEFAULT NULL COMMENT '流程类型',
  `approve_opinion` varchar(1000) DEFAULT NULL COMMENT '审批意见',
  `approve_state` varchar(255) DEFAULT NULL COMMENT '审批状态： 通过 驳回',
  `create_By` int(11) DEFAULT NULL COMMENT '建创人',
  `create_Date` datetime DEFAULT NULL COMMENT '建创日期',
  `operator` varchar(255) DEFAULT NULL COMMENT '操作人名称',
  `flow_node` varchar(255) DEFAULT NULL COMMENT '节点名称',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=263 DEFAULT CHARSET=utf8 COMMENT='流程审批日志表';

-- ----------------------------
-- Records of crm_approval_log
-- ----------------------------
INSERT INTO `crm_approval_log` VALUES ('1', '9', 'MC_FLOW', null, '0', '0', null, 'loginNameSystem', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('2', '9', 'MC_FLOW', 'asdfasdfasdf打发阿萨', '0', '0', '2016-01-25 00:00:00', 'loginNameSystem', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('3', '9', 'MC_FLOW', 'asdfasdf', '0', '0', '2016-01-25 00:08:36', 'loginNameSystem', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('4', '9', 'MC_FLOW', '111', '0', '0', '2016-01-25 01:01:16', 'loginNameSystem', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('5', '9', 'MC_FLOW', null, null, '0', '2016-01-25 02:53:26', 'loginNameSystem', '总经理审批');
INSERT INTO `crm_approval_log` VALUES ('6', '9', 'MC_FLOW', null, null, '0', '2016-01-25 02:59:27', 'loginNameSystem', '总经理审批');
INSERT INTO `crm_approval_log` VALUES ('7', '9', 'MC_FLOW', null, null, '0', '2016-01-25 03:59:19', 'loginNameSystem', '总经理审批');
INSERT INTO `crm_approval_log` VALUES ('8', '10', 'MC_FLOW', null, null, '0', '2016-01-28 22:24:40', 'u001', null);
INSERT INTO `crm_approval_log` VALUES ('9', '11', 'MC_FLOW', null, null, '0', '2016-01-28 22:51:39', 'u001', null);
INSERT INTO `crm_approval_log` VALUES ('10', '11', 'MC_FLOW', '11', '0', '0', '2016-01-28 22:53:43', 'u001', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('11', '11', 'MC_FLOW', '', '0', '0', '2016-01-28 22:55:12', 'u001', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('12', '12', 'MC_FLOW', null, null, '0', '2016-01-28 22:59:02', 'u001', null);
INSERT INTO `crm_approval_log` VALUES ('13', '12', 'MC_FLOW', '1111111111111111', '0', '0', '2016-01-28 23:04:41', 'u001', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('14', '12', 'MC_FLOW', '审批通过', '0', '0', '2016-01-28 23:05:08', 'u001', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('15', '20', 'MC_FLOW', null, null, '0', '2016-01-30 00:56:00', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('16', '22', 'MC_FLOW', null, null, '0', '2016-01-30 01:28:51', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('17', '23', 'MC_FLOW', null, null, '0', '2016-01-30 01:37:15', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('18', '24', 'MC_FLOW', null, null, '0', '2016-01-30 02:04:11', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('19', '25', 'MC_FLOW', null, null, '0', '2016-01-30 02:10:55', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('20', '26', 'MC_FLOW', null, null, '0', '2016-01-30 02:21:35', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('21', '27', 'MC_FLOW', null, null, '0', '2016-01-30 02:29:09', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('22', '28', 'MC_FLOW', null, null, '0', '2016-01-30 02:42:00', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('23', '29', 'MC_FLOW', null, null, '0', '2016-01-30 02:48:21', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('24', '29', 'MC_FLOW', '11111', null, '0', '2016-01-30 02:50:07', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('25', '29', 'MC_FLOW', '1111', '0', '0', '2016-01-30 02:50:52', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('26', '29', 'MC_FLOW', '222222222', '0', '0', '2016-01-30 02:51:37', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('27', '29', 'MC_FLOW', '222222222', '0', '0', '2016-01-30 02:51:43', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('28', '29', 'MC_FLOW', '1111', null, '0', '2016-01-30 02:52:33', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('29', '29', 'MC_FLOW', '1111', null, '0', '2016-01-30 02:53:15', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('30', '30', 'MC_FLOW', null, null, '0', '2016-01-30 02:58:48', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('31', '30', 'MC_FLOW', '22222222222', '0', '0', '2016-01-30 02:59:12', 'admin', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('32', '30', 'MC_FLOW', '111', '0', '0', '2016-01-30 03:00:32', 'admin', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('33', '31', 'MV_FLOW', null, null, '0', '2016-01-30 09:03:23', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('34', '32', 'MV_FLOW', null, null, '0', '2016-01-30 09:11:26', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('35', '32', 'MC_FLOW', null, null, '0', '2016-01-30 09:12:01', 'admin', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('36', '33', 'MV_FLOW', null, null, '0', '2016-01-30 09:17:01', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('37', '33', 'MC_FLOW', null, null, '0', '2016-01-30 09:17:21', 'admin', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('38', '34', 'MV_FLOW', null, null, '0', '2016-01-30 09:23:03', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('39', '34', 'MC_FLOW', null, null, '0', '2016-01-30 09:23:22', 'admin', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('40', '34', 'MC_FLOW', null, null, '0', '2016-01-30 09:23:26', 'admin', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('41', '34', 'MC_FLOW', null, '0', '0', '2016-01-30 09:23:33', 'admin', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('42', '35', 'MV_FLOW', null, null, '0', '2016-01-30 09:29:11', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('43', '35', 'MC_FLOW', null, null, '0', '2016-01-30 09:29:28', 'admin', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('44', '35', 'MC_FLOW', null, null, '0', '2016-01-30 09:29:32', 'admin', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('45', '35', 'MC_FLOW', null, '0', '0', '2016-01-30 09:29:40', 'admin', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('46', '38', 'MC_FLOW', null, null, '0', '2016-01-30 17:01:33', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('47', '38', 'MC_FLOW', 'we', null, '0', '2016-01-30 17:01:56', 'admin', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('48', null, 'MC_FLOW', null, null, '0', '2016-01-30 17:01:57', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('49', null, 'MC_FLOW', null, null, '0', '2016-01-30 17:01:59', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('50', null, 'MC_FLOW', null, null, '0', '2016-01-30 17:02:00', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('51', null, 'MC_FLOW', null, null, '0', '2016-01-30 17:02:02', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('52', null, 'MC_FLOW', null, null, '0', '2016-01-30 17:02:03', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('53', null, 'MC_FLOW', null, null, '0', '2016-01-30 17:02:04', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('54', null, 'MC_FLOW', null, null, '0', '2016-01-30 17:02:06', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('55', null, 'MC_FLOW', null, null, '0', '2016-01-30 17:03:14', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('56', '34', 'MC_FLOW', null, null, '0', '2016-01-30 17:04:18', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('57', '28', 'MV_FLOW', null, null, '0', '2016-01-30 17:09:02', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('58', '38', 'MV_FLOW', null, null, '0', '2016-01-30 17:11:20', 'admin', null);
INSERT INTO `crm_approval_log` VALUES ('59', '38', 'MC_FLOW', null, null, '0', '2016-01-30 17:38:09', 'admin', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('60', '28', 'MC_FLOW', '', null, '0', '2016-01-30 17:39:57', 'admin', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('61', '179', 'MV_FLOW', null, null, '0', '2016-02-02 09:16:17', 'zhangshuzhi', null);
INSERT INTO `crm_approval_log` VALUES ('62', '240', 'MV_FLOW', null, null, '0', '2016-02-02 19:49:19', 'zhangshuzhi', null);
INSERT INTO `crm_approval_log` VALUES ('63', '241', 'MV_FLOW', null, null, '0', '2016-02-02 20:14:29', 'zhangshuzhi', null);
INSERT INTO `crm_approval_log` VALUES ('64', '241', 'MV_FLOW', '审批通过', '0', '0', '2016-02-02 20:15:40', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('65', '242', 'MV_FLOW', null, null, '0', '2016-02-02 20:25:36', 'zhangshuzhi', null);
INSERT INTO `crm_approval_log` VALUES ('66', '242', 'MV_FLOW', '1111', '0', '0', '2016-02-02 20:26:32', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('67', '242', 'MV_FLOW', null, '0', '0', '2016-02-02 20:29:35', 'wangfaxian', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('68', '242', 'MV_FLOW', null, null, '0', '2016-02-02 20:32:14', 'zhangshuzhi', '咨询部分派人员');
INSERT INTO `crm_approval_log` VALUES ('69', '243', 'MV_FLOW', null, null, '0', '2016-02-02 20:48:52', 'zhangshuzhi', null);
INSERT INTO `crm_approval_log` VALUES ('70', '243', 'MV_FLOW', '审批通过', '0', '0', '2016-02-02 20:50:24', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('71', '243', 'MV_FLOW', null, '0', '0', '2016-02-02 20:51:35', 'wangfaxian', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('72', '243', 'MV_FLOW', null, null, '0', '2016-02-02 20:52:44', 'zhangshuzhi', '咨询部分派人员');
INSERT INTO `crm_approval_log` VALUES ('250', '182', 'MV_FLOW', null, null, '11', '2016-03-23 19:22:58', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('249', '182', 'MV_FLOW', null, null, '11', '2016-03-23 19:22:53', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('248', '216', 'MV_FLOW', null, null, '11', '2016-03-23 19:13:10', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('76', '245', 'MV_FLOW', null, null, '0', '2016-02-02 21:24:21', 'zhangshuzhi', null);
INSERT INTO `crm_approval_log` VALUES ('77', '245', 'MV_FLOW', '审批通过，不需要咨询部协助，直接点到单子创建人那里', '0', '0', '2016-02-02 21:25:45', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('78', '245', 'MV_FLOW', null, null, '11', '2016-02-02 21:39:33', 'zhangshuzhi', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('79', '246', 'MC_FLOW', null, null, '11', '2016-02-02 22:01:39', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('80', '246', 'MC_FLOW', '1111111111', '0', '22', '2016-02-02 22:03:12', 'wangyong', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('81', '246', 'MC_FLOW', '1111111111', '0', '22', '2016-02-02 22:03:16', 'wangyong', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('82', '247', 'MC_FLOW', null, null, '11', '2016-02-02 22:10:13', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('83', '247', 'MC_FLOW', '111111111111111', '0', '22', '2016-02-02 22:10:49', 'wangyong', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('84', '248', 'MC_FLOW', null, null, '11', '2016-02-02 22:27:22', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('85', '248', 'MC_FLOW', '111111111111', '0', '22', '2016-02-02 22:35:08', 'wangyong', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('86', '250', 'MC_FLOW', null, null, '11', '2016-02-02 22:38:22', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('87', '250', 'MC_FLOW', '11111', '0', '22', '2016-02-02 22:38:50', 'wangyong', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('88', '250', 'MC_FLOW', '1111', '0', '22', '2016-02-02 22:44:44', 'wangyong', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('89', '250', 'MC_FLOW', '1111', '0', '22', '2016-02-02 22:49:05', 'wangyong', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('90', '250', 'MC_FLOW', '1111', '0', '22', '2016-02-02 22:54:26', 'wangyong', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('91', '250', 'MC_FLOW', '11111111111', '0', '18', '2016-02-02 22:56:04', 'liuguoyi', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('92', '250', 'MC_FLOW', '2222222', '0', '18', '2016-02-02 23:01:04', 'liuguoyi', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('93', '250', 'MC_FLOW', '11111111', '0', '18', '2016-02-02 23:06:30', 'liuguoyi', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('94', '250', 'MC_FLOW', '111', '0', '18', '2016-02-02 23:10:01', 'liuguoyi', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('95', '250', 'MC_FLOW', null, null, '12', '2016-02-02 23:14:43', 'xuningning', '总经理审批');
INSERT INTO `crm_approval_log` VALUES ('96', '349', 'MV_FLOW', null, null, '11', '2016-02-03 19:12:38', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('97', '349', 'MV_FLOW', '11', '0', '22', '2016-02-03 19:15:23', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('98', '351', 'MV_FLOW', null, null, '11', '2016-02-03 19:32:50', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('99', '351', 'MV_FLOW', '审批通过', '0', '22', '2016-02-03 19:34:20', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('100', '351', 'MV_FLOW', null, '0', '28', '2016-02-03 19:43:30', 'wangfaxian', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('101', '352', 'MV_FLOW', null, null, '11', '2016-02-03 20:09:21', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('102', '352', 'MV_FLOW', '审批通过!!', '0', '22', '2016-02-03 20:16:17', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('103', '352', 'MV_FLOW', null, null, '11', '2016-02-03 20:19:50', 'zhangshuzhi', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('104', '354', 'MV_FLOW', null, null, '11', '2016-02-03 20:27:02', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('105', '354', 'MV_FLOW', '审核通过！', '0', '22', '2016-02-03 20:29:32', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('106', '354', 'MV_FLOW', null, '0', '28', '2016-02-03 20:30:42', 'wangfaxian', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('107', '354', 'MV_FLOW', null, '0', '28', '2016-02-03 20:42:43', 'wangfaxian', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('108', '354', 'MV_FLOW', null, null, '11', '2016-02-03 20:44:17', 'zhangshuzhi', '咨询部分派人员');
INSERT INTO `crm_approval_log` VALUES ('109', '355', 'MV_FLOW', null, null, '11', '2016-02-03 20:46:02', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('110', '355', 'MV_FLOW', '驳回', '1', '22', '2016-02-03 20:46:53', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('111', '355', 'MC_FLOW', null, null, '11', '2016-02-03 20:51:42', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('112', '355', 'MC_FLOW', '11', '0', '22', '2016-02-03 21:03:06', 'wangyong', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('113', '355', 'MC_FLOW', '222', '0', '18', '2016-02-03 21:04:40', 'liuguoyi', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('114', '355', 'MC_FLOW', null, null, '10', '2016-02-03 21:06:41', 'sunli', '总经理审批');
INSERT INTO `crm_approval_log` VALUES ('115', '356', 'MC_FLOW', null, null, '11', '2016-02-03 21:13:28', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('116', '356', 'MC_FLOW', 'aaaaa', '0', '22', '2016-02-03 21:14:44', 'wangyong', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('117', '356', 'MC_FLOW', 'bbbbb', '0', '18', '2016-02-03 21:15:55', 'liuguoyi', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('118', '357', 'MC_FLOW', null, null, '11', '2016-02-03 21:31:40', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('119', '357', 'MC_FLOW', '驳回', '1', '22', '2016-02-03 21:32:29', 'wangyong', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('120', '359', 'MV_FLOW', null, null, '11', '2016-02-04 07:57:00', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('121', '359', 'MV_FLOW', '1111111111', '0', '22', '2016-02-04 09:45:35', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('122', '359', 'MV_FLOW', null, null, '13', '2016-02-04 09:53:54', 'zhangyu', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('123', '360', 'MV_FLOW', null, null, '11', '2016-02-04 10:00:44', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('124', '360', 'MV_FLOW', '1111', '0', '22', '2016-02-04 10:01:32', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('125', '361', 'MV_FLOW', null, null, '11', '2016-02-04 10:09:23', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('126', '361', 'MV_FLOW', '111', '0', '22', '2016-02-04 10:10:30', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('127', '361', 'MV_FLOW', null, null, '13', '2016-02-04 10:25:17', 'zhangyu', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('128', '362', 'MV_FLOW', null, null, '11', '2016-02-04 10:43:15', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('129', '362', 'MV_FLOW', '111', '0', '22', '2016-02-04 10:44:00', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('130', '362', 'MV_FLOW', null, null, '13', '2016-02-04 10:45:35', 'zhangyu', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('131', '363', 'MV_FLOW', null, null, '11', '2016-02-04 10:53:22', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('132', '363', 'MV_FLOW', '1111111', '0', '22', '2016-02-04 10:54:15', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('133', '363', 'MV_FLOW', null, '0', '28', '2016-02-04 10:56:10', 'wangfaxian', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('134', '366', 'MV_FLOW', null, null, '11', '2016-02-04 11:10:09', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('135', '366', 'MV_FLOW', '111111111111', '0', '22', '2016-02-04 11:11:19', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('136', '366', 'MV_FLOW', null, '0', '28', '2016-02-04 11:13:17', 'wangfaxian', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('137', '366', 'MV_FLOW', null, null, '26', '2016-02-04 11:14:57', 'gaolizhong', '咨询部分派人员');
INSERT INTO `crm_approval_log` VALUES ('138', '367', 'MV_FLOW', null, null, '11', '2016-02-04 11:17:29', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('139', '368', 'MV_FLOW', null, null, '11', '2016-02-04 11:32:25', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('140', '368', 'MV_FLOW', '11111111', '1', '22', '2016-02-04 11:33:20', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('141', '368', 'MV_FLOW', null, null, '11', '2016-02-04 11:39:05', 'zhangshuzhi', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('142', '197', 'MV_FLOW', null, null, '11', '2016-02-04 11:45:37', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('143', '197', 'MV_FLOW', '1111111111', '1', '22', '2016-02-04 11:46:08', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('144', '197', 'MV_FLOW', null, null, '11', '2016-02-04 11:47:14', 'zhangshuzhi', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('145', '370', 'MV_FLOW', null, null, '11', '2016-02-04 11:50:55', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('146', '370', 'MV_FLOW', '11111111111', '1', '22', '2016-02-04 11:52:09', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('147', '370', 'MV_FLOW', null, null, '11', '2016-02-04 12:06:55', 'zhangshuzhi', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('148', '370', 'MV_FLOW', null, null, '11', '2016-02-04 12:08:06', 'zhangshuzhi', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('149', '371', 'MV_FLOW', null, null, '11', '2016-02-04 12:12:36', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('150', '371', 'MV_FLOW', '111', '1', '22', '2016-02-04 12:13:37', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('151', '371', 'MV_FLOW', null, null, '11', '2016-02-04 12:15:19', 'zhangshuzhi', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('152', '372', 'MV_FLOW', null, null, '11', '2016-02-04 12:21:58', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('153', '372', 'MV_FLOW', '111', '1', '22', '2016-02-04 12:23:16', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('154', '373', 'MV_FLOW', null, null, '11', '2016-02-04 12:32:51', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('155', '373', 'MV_FLOW', '11111', '1', '22', '2016-02-04 12:33:37', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('156', '374', 'MV_FLOW', null, null, '11', '2016-02-04 12:40:34', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('157', '374', 'MV_FLOW', '11111', '1', '22', '2016-02-04 12:41:41', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('158', '374', 'MV_FLOW', null, null, '11', '2016-02-04 12:42:52', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('159', '374', 'MV_FLOW', '1111', '0', '22', '2016-02-04 12:43:47', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('160', '378', 'MC_FLOW', null, null, '11', '2016-02-04 15:00:09', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('161', '378', 'MC_FLOW', '1111', '0', '22', '2016-02-04 15:05:56', 'wangyong', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('162', '378', 'MC_FLOW', '11111', '0', '18', '2016-02-04 15:08:28', 'liuguoyi', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('163', '378', 'MC_FLOW', null, null, '10', '2016-02-04 15:13:31', 'sunli', '总经理审批');
INSERT INTO `crm_approval_log` VALUES ('164', '379', 'MC_FLOW', null, null, '22', '2016-02-04 15:42:33', 'wangyong', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('165', '379', 'MC_FLOW', '1111', '1', '22', '2016-02-04 15:52:42', 'wangyong', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('166', '380', 'MC_FLOW', null, null, '11', '2016-02-04 16:03:06', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('167', '380', 'MC_FLOW', '1111111111', '0', '22', '2016-02-04 16:04:01', 'wangyong', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('168', '381', 'MC_FLOW', null, null, '22', '2016-02-04 16:04:46', 'wangyong', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('169', '381', 'MC_FLOW', '1111', '1', '22', '2016-02-04 16:05:35', 'wangyong', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('170', '382', 'MC_FLOW', null, null, '11', '2016-02-04 16:06:48', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('171', '382', 'MC_FLOW', 'aaaaaaaaaaa', '1', '22', '2016-02-04 16:07:39', 'wangyong', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('172', '382', 'MC_FLOW', null, null, '11', '2016-02-04 16:09:34', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('173', '382', 'MC_FLOW', '111111111', '0', '22', '2016-02-04 16:15:33', 'wangyong', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('174', '382', 'MC_FLOW', '111111', '1', '18', '2016-02-04 16:18:22', 'liuguoyi', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('175', '383', 'MC_FLOW', null, null, '11', '2016-02-04 16:31:39', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('176', '384', 'MC_FLOW', null, null, '11', '2016-02-04 16:33:39', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('177', '385', 'MC_FLOW', null, null, '11', '2016-02-04 16:40:06', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('178', '386', 'MC_FLOW', null, null, '11', '2016-02-04 17:13:51', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('179', '388', 'MC_FLOW', null, null, '11', '2016-02-04 17:55:18', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('180', '388', 'MC_FLOW', '1111111111', '0', '22', '2016-02-04 17:55:59', 'wangyong', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('181', '388', 'MC_FLOW', '1111', '1', '18', '2016-02-04 17:57:09', 'liuguoyi', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('182', '388', 'MC_FLOW', '11111', '0', '22', '2016-02-04 17:58:30', 'wangyong', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('183', '390', 'MV_FLOW', null, null, '11', '2016-02-04 21:21:50', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('184', '390', 'MV_FLOW', null, null, '11', '2016-02-04 21:22:10', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('185', '391', 'MV_FLOW', null, null, '11', '2016-02-04 21:24:15', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('186', '391', 'MV_FLOW', null, null, '11', '2016-02-04 21:26:09', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('187', '392', 'MV_FLOW', null, null, '11', '2016-02-04 21:28:41', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('188', '392', 'MV_FLOW', null, null, '11', '2016-02-04 21:28:46', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('189', '392', 'MV_FLOW', '111', '0', '22', '2016-02-04 21:31:10', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('190', '392', 'MV_FLOW', null, null, '13', '2016-02-04 21:33:56', 'zhangyu', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('191', '393', 'MC_FLOW', null, null, '11', '2016-02-04 21:37:05', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('192', '393', 'MC_FLOW', '222222', '0', '22', '2016-02-04 21:42:43', 'wangyong', '销售经理，提交合同');
INSERT INTO `crm_approval_log` VALUES ('193', '393', 'MC_FLOW', '11', '0', '18', '2016-02-04 21:43:51', 'liuguoyi', '市场部经理审批');
INSERT INTO `crm_approval_log` VALUES ('194', '393', 'MC_FLOW', null, null, '10', '2016-02-04 21:48:45', 'sunli', '总经理审批');
INSERT INTO `crm_approval_log` VALUES ('195', '394', 'MV_FLOW', null, null, '11', '2016-02-04 21:50:27', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('196', '394', 'MV_FLOW', '222', '0', '22', '2016-02-04 21:51:07', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('197', '395', 'MV_FLOW', null, null, '11', '2016-02-04 21:57:13', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('198', '395', 'MV_FLOW', '', '0', '22', '2016-02-04 21:58:07', 'wangyong', '销售人员提交初审');
INSERT INTO `crm_approval_log` VALUES ('199', '395', 'MV_FLOW', null, null, '13', '2016-02-04 21:59:04', 'zhangyu', '市场经理初访审批');
INSERT INTO `crm_approval_log` VALUES ('200', '396', 'MV_FLOW', null, null, '18', '2016-02-05 08:47:11', 'liuguoyi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('201', '397', 'MV_FLOW', null, null, '11', '2016-02-05 08:48:19', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('202', '398', 'MV_FLOW', null, null, '11', '2016-02-05 12:06:26', 'zhangshuzhi', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('203', '352', 'BB2_FLOW', null, null, '11', '2016-03-12 17:12:04', '张树志', null);
INSERT INTO `crm_approval_log` VALUES ('204', '208', 'BB2_FLOW', null, null, '11', '2016-03-12 17:16:51', '张树志', null);
INSERT INTO `crm_approval_log` VALUES ('241', '390', 'BB2_FLOW', null, null, '11', '2016-03-14 19:40:35', '张树志', '提交报备');
INSERT INTO `crm_approval_log` VALUES ('240', '148', 'BB2_FLOW', null, '0', '11', '2016-03-14 19:39:37', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('207', '180', 'BB2_FLOW', null, null, '11', '2016-03-12 17:33:52', '张树志', null);
INSERT INTO `crm_approval_log` VALUES ('239', '148', 'BB2_FLOW', null, null, '11', '2016-03-14 19:39:31', '张树志', '提交报备');
INSERT INTO `crm_approval_log` VALUES ('238', '218', 'BB2_FLOW', null, null, '11', '2016-03-14 19:38:02', '张树志', '提交报备');
INSERT INTO `crm_approval_log` VALUES ('210', '243', 'BB2_FLOW', null, null, '11', '2016-03-12 18:24:17', '张树志', '提交报备');
INSERT INTO `crm_approval_log` VALUES ('211', '243', 'BB2_FLOW', '222222222222222', '1', '22', '2016-03-12 18:24:47', '王勇', '提交报备');
INSERT INTO `crm_approval_log` VALUES ('212', '243', 'BB2_FLOW', null, null, '11', '2016-03-12 18:25:24', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('213', '250', 'BB2_FLOW', null, null, '11', '2016-03-12 18:41:15', '张树志', '提交报备');
INSERT INTO `crm_approval_log` VALUES ('214', '250', 'BB2_FLOW', '33333333333333', '1', '22', '2016-03-12 18:42:05', '王勇', '提交报备');
INSERT INTO `crm_approval_log` VALUES ('215', '250', 'BB2_FLOW', null, null, '11', '2016-03-12 18:42:55', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('216', '200', 'BB2_FLOW', null, null, '11', '2016-03-12 18:54:52', '张树志', '提交报备');
INSERT INTO `crm_approval_log` VALUES ('217', '200', 'BB2_FLOW', '33333333333333333', '1', '22', '2016-03-12 18:55:30', '王勇', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('218', '242', 'BB2_FLOW', null, null, '11', '2016-03-12 18:58:23', '张树志', '提交报备');
INSERT INTO `crm_approval_log` VALUES ('219', '242', 'BB2_FLOW', '333333333333', '1', '22', '2016-03-12 18:59:03', '王勇', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('246', '251', 'MV_FLOW', null, null, '11', '2016-03-23 18:50:47', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('242', '390', 'BB2_FLOW', null, '0', '11', '2016-03-14 19:40:40', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('223', '206', 'BB2_FLOW', null, null, '11', '2016-03-12 19:18:01', '张树志', '提交报备');
INSERT INTO `crm_approval_log` VALUES ('224', '206', 'BB2_FLOW', '33333333333', '1', '22', '2016-03-12 19:18:40', '王勇', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('225', '206', 'BB2_FLOW', null, null, '11', '2016-03-12 19:19:05', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('226', '206', 'BB2_FLOW', null, null, '11', '2016-03-12 19:20:32', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('227', '206', 'BB2_FLOW', null, null, '11', '2016-03-12 19:24:19', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('228', '206', 'BB2_FLOW', null, null, '11', '2016-03-12 19:31:02', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('229', '206', 'BB2_FLOW', null, null, '11', '2016-03-12 19:31:22', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('230', '206', 'BB2_FLOW', null, null, '11', '2016-03-12 19:36:37', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('231', '206', 'BB2_FLOW', null, null, '11', '2016-03-12 19:37:23', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('232', '393', 'BB2_FLOW', null, null, '11', '2016-03-12 19:45:15', '张树志', '提交报备');
INSERT INTO `crm_approval_log` VALUES ('233', '393', 'BB2_FLOW', '333333333333', '1', '22', '2016-03-12 19:46:25', '王勇', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('234', '393', 'BB2_FLOW', null, '0', '11', '2016-03-12 19:46:54', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('235', '393', 'BB2_FLOW', '33333333', '0', '22', '2016-03-12 19:52:53', '王勇', '流程结束');
INSERT INTO `crm_approval_log` VALUES ('236', '217', 'BB2_FLOW', null, null, '11', '2016-03-14 18:43:43', '张树志', '提交报备');
INSERT INTO `crm_approval_log` VALUES ('237', '217', 'BB2_FLOW', null, '0', '11', '2016-03-14 18:43:50', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('247', '201', 'MV_FLOW', null, null, '11', '2016-03-23 19:07:25', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('251', '182', 'MV_FLOW', null, null, '11', '2016-03-23 19:23:48', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('252', '204', 'MV_FLOW', null, null, '11', '2016-03-23 19:42:51', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('253', '204', 'MV_FLOW', null, null, '11', '2016-03-23 19:42:58', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('254', null, 'MV_FLOW', null, null, '11', '2016-03-23 19:48:59', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('255', null, 'MV_FLOW', null, null, '11', '2016-03-23 19:49:09', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('256', null, 'MV_FLOW', null, null, '11', '2016-03-23 19:49:30', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('257', null, 'MV_FLOW', null, null, '11', '2016-03-23 19:50:15', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('258', null, 'MV_FLOW', null, null, '11', '2016-03-23 19:50:20', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('259', '424', 'MV_FLOW', null, null, '11', '2016-03-24 18:51:15', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('260', '424', 'MV_FLOW', null, null, '11', '2016-03-24 18:51:25', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('261', '424', 'MV_FLOW', null, null, '11', '2016-03-24 18:53:32', '张树志', '提交申请');
INSERT INTO `crm_approval_log` VALUES ('262', '424', 'MV_FLOW', null, null, '11', '2016-03-24 19:09:36', '张树志', '提交申请');

-- ----------------------------
-- Table structure for `crm_bao_bei`
-- ----------------------------
DROP TABLE IF EXISTS `crm_bao_bei`;
CREATE TABLE `crm_bao_bei` (
  `baoBei_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '报备编号',
  `batch_id` int(11) DEFAULT NULL COMMENT '批次编号',
  `is_need_zixun_help` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否需要咨询师协助',
  `remark` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '说明',
  `baoBei_zhouQi` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报备周期',
  `baoBei_state` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报备状态',
  `create_By` int(11) DEFAULT NULL COMMENT '创建人',
  `create_Date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_By` int(11) DEFAULT NULL COMMENT '更新人',
  `update_Date` datetime DEFAULT NULL COMMENT '更新日期',
  `baoBeiType` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approveState` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baoBeiState2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`baoBei_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of crm_bao_bei
-- ----------------------------
INSERT INTO `crm_bao_bei` VALUES ('3', '148', 'Y', '无要求', '3', '有效', '11', '2016-02-02 09:10:33', '0', null, null, null, null);
INSERT INTO `crm_bao_bei` VALUES ('4', '352', 'Y', '1111111111111111111', '一个月', null, '11', '2016-03-12 05:11:46', '0', null, '2', null, 'SB001');
INSERT INTO `crm_bao_bei` VALUES ('5', '208', 'Y', '111', '一个月', null, '11', '2016-03-12 05:16:47', '0', null, '2', null, 'SB001');
INSERT INTO `crm_bao_bei` VALUES ('7', '180', 'Y', '1111111111111111', '三个月', null, '11', '2016-03-12 05:33:52', '0', null, '2', null, 'SB001');
INSERT INTO `crm_bao_bei` VALUES ('9', '243', 'Y', '22222222222222233333333333333', '一个月', null, '11', '2016-03-12 06:24:17', '11', '2016-03-12 06:25:24', '2', '1', 'SB001');
INSERT INTO `crm_bao_bei` VALUES ('10', '250', 'Y', '222222222222244444444444', '一个月', null, '11', '2016-03-12 06:41:15', '11', '2016-03-12 06:42:55', '2', '1', 'SB001');
INSERT INTO `crm_bao_bei` VALUES ('11', '200', 'Y', '33333333333333', '一个月', null, '11', '2016-03-12 06:54:52', '22', '2016-03-12 06:55:30', '2', '1', 'SB001');
INSERT INTO `crm_bao_bei` VALUES ('12', '242', null, 'dddddddddddd', '一个月', null, '11', '2016-03-12 06:58:23', '22', '2016-03-12 06:59:03', '2', '1', 'SB001');
INSERT INTO `crm_bao_bei` VALUES ('14', '206', 'Y', '333333333333333333333333333333333', '一个月', null, '11', '2016-03-12 07:18:01', '11', '2016-03-12 07:37:23', '2', '1', 'SB001');
INSERT INTO `crm_bao_bei` VALUES ('16', '217', null, '33333333333333', '一个月', null, '11', '2016-03-14 06:43:43', '11', '2016-03-14 06:43:50', '2', '0', 'SB001');
INSERT INTO `crm_bao_bei` VALUES ('17', '218', 'Y', '444444444444', '一个月', null, '11', '2016-03-14 07:38:02', '0', null, '2', null, 'SB001');
INSERT INTO `crm_bao_bei` VALUES ('18', '148', null, '', '一个月', null, '11', '2016-03-14 07:39:31', '11', '2016-03-14 07:39:37', '2', '0', 'SB001');
INSERT INTO `crm_bao_bei` VALUES ('19', '390', null, 'ffffffffffffffff', '一个月', null, '11', '2016-03-14 07:40:35', '11', '2016-03-14 07:40:40', '2', '0', 'SB001');

-- ----------------------------
-- Table structure for `crm_comm_upload_file`
-- ----------------------------
DROP TABLE IF EXISTS `crm_comm_upload_file`;
CREATE TABLE `crm_comm_upload_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `file_name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件名',
  `file_path` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '路径',
  `flow_node_id` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '节点编号',
  `createBy` int(11) DEFAULT NULL COMMENT '建创人',
  `createDate` datetime DEFAULT NULL COMMENT '建创日期',
  `updateBy` int(11) DEFAULT NULL COMMENT '新更人',
  `updateDate` datetime DEFAULT NULL COMMENT '新更日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of crm_comm_upload_file
-- ----------------------------
INSERT INTO `crm_comm_upload_file` VALUES ('1', '1', '11', '1', '0', '2016-01-19 00:00:00', '0', '2016-01-19 00:00:00');
INSERT INTO `crm_comm_upload_file` VALUES ('2', '2', '/2', 'node2', '0', '2016-01-19 00:00:00', '0', '2016-01-19 00:00:00');

-- ----------------------------
-- Table structure for `crm_communication`
-- ----------------------------
DROP TABLE IF EXISTS `crm_communication`;
CREATE TABLE `crm_communication` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '沟通id',
  `batch_id` int(11) DEFAULT NULL COMMENT '批次编号',
  `com_time` datetime DEFAULT NULL COMMENT '通沟时间',
  `com_content` text COLLATE utf8_unicode_ci COMMENT '通沟纪要',
  `send_data_record` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发资料记录',
  `is_view_for_zixun` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '否是对咨询师可见',
  `create_By` int(11) DEFAULT NULL COMMENT '建创人',
  `create_Date` datetime DEFAULT NULL COMMENT '建创日期',
  `update_By` int(11) DEFAULT NULL COMMENT '新更人',
  `update_Date` int(11) DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`com_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of crm_communication
-- ----------------------------
INSERT INTO `crm_communication` VALUES ('1', '1001', '2016-01-20 00:00:00', 'comContent', '发货资料A', 'T', '0', '2016-01-20 00:00:00', '0', null);
INSERT INTO `crm_communication` VALUES ('2', '376', '2016-02-04 14:45:52', '', '', null, '11', null, '0', null);
INSERT INTO `crm_communication` VALUES ('3', '377', '2016-02-04 14:54:06', '', '', null, '11', null, '0', null);
INSERT INTO `crm_communication` VALUES ('4', '148', '2016-02-04 14:55:49', '111', '222', null, '11', '2016-02-04 02:55:49', '0', null);
INSERT INTO `crm_communication` VALUES ('5', '378', '2016-02-04 14:59:46', '1111', '', null, '11', null, '0', null);
INSERT INTO `crm_communication` VALUES ('6', '379', '2016-02-04 15:42:09', '', '', null, '22', null, '0', null);
INSERT INTO `crm_communication` VALUES ('7', '380', '2016-02-04 16:02:45', '', '', null, '11', null, '0', null);
INSERT INTO `crm_communication` VALUES ('8', '381', '2016-02-04 16:04:27', '', '', null, '22', null, '0', null);
INSERT INTO `crm_communication` VALUES ('9', '382', '2016-02-04 16:06:31', '', '', null, '11', null, '0', null);
INSERT INTO `crm_communication` VALUES ('10', '383', '2016-02-04 16:31:20', '', '', null, '11', null, '0', null);
INSERT INTO `crm_communication` VALUES ('11', '384', '2016-02-04 16:33:21', '', '', null, '11', null, '0', null);
INSERT INTO `crm_communication` VALUES ('12', '385', '2016-02-04 16:36:50', '', '', null, '11', null, '0', null);
INSERT INTO `crm_communication` VALUES ('13', '386', '2016-02-04 17:13:00', '', '', null, '11', null, '0', null);
INSERT INTO `crm_communication` VALUES ('14', '388', '2016-02-04 17:54:45', '', '', null, '11', null, '0', null);
INSERT INTO `crm_communication` VALUES ('15', '390', '2016-02-04 21:21:26', '', '', null, '11', null, '0', null);
INSERT INTO `crm_communication` VALUES ('16', '391', '2016-02-04 21:23:54', '', '', null, '11', null, '0', null);
INSERT INTO `crm_communication` VALUES ('17', '392', '2016-02-04 21:28:16', '', '', null, '11', null, '0', null);
INSERT INTO `crm_communication` VALUES ('18', '393', '2016-02-04 21:36:46', '', '', null, '11', null, '0', null);
INSERT INTO `crm_communication` VALUES ('19', '394', '2016-02-04 21:50:10', '', '', null, '11', null, '0', null);
INSERT INTO `crm_communication` VALUES ('20', '395', '2016-02-04 21:56:57', '', '', null, '11', null, '0', null);
INSERT INTO `crm_communication` VALUES ('21', '396', '2016-02-05 08:46:22', '11111', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('22', '397', '2016-02-05 08:48:03', '', '', null, '11', null, '0', null);
INSERT INTO `crm_communication` VALUES ('23', '398', '2016-02-05 12:05:56', '', '', null, '11', null, '0', null);
INSERT INTO `crm_communication` VALUES ('24', '399', '2016-02-05 12:30:25', '目前没生产', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('25', '400', '2016-02-05 12:30:26', '2015/12/3邵在做实验2015/12/4邵说现在规模很小', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('26', '401', '2016-02-05 12:30:26', '11-24：红艳联系，说跟中实合作了。超市里宣传蘑菇酱。', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('27', '402', '2016-02-05 12:30:26', '外检', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('28', '403', '2016-02-05 12:30:26', '不需要', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('29', '404', '2016-02-05 12:30:26', '没有电话，不知道', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('30', '405', '2016-02-05 12:30:26', '公司没办成', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('31', '406', '2016-02-05 12:30:26', '质检部没有负责人，单位很小', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('32', '407', '2016-02-05 12:30:26', '2015-10-15所有产品外检', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('33', '408', '2016-02-05 12:30:26', '占线', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('34', '409', '2016-02-05 12:30:26', '产品都是外检', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('35', '410', '2016-02-05 12:32:37', '目前没生产', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('36', '411', '2016-02-05 12:32:37', '2015/12/3邵在做实验2015/12/4邵说现在规模很小', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('37', '412', '2016-02-05 12:32:37', '11-24：红艳联系，说跟中实合作了。超市里宣传蘑菇酱。', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('38', '413', '2016-02-05 12:32:37', '外检', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('39', '414', '2016-02-05 12:32:37', '不需要', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('40', '415', '2016-02-05 12:32:37', '没有电话，不知道', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('41', '416', '2016-02-05 12:32:37', '公司没办成', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('42', '417', '2016-02-05 12:32:37', '质检部没有负责人，单位很小', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('43', '418', '2016-02-05 12:32:37', '2015-10-15所有产品外检', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('44', '419', '2016-02-05 12:32:37', '占线', '', null, '18', null, '0', null);
INSERT INTO `crm_communication` VALUES ('45', '420', '2016-02-05 12:32:37', '产品都是外检', '', null, '18', null, '0', null);

-- ----------------------------
-- Table structure for `crm_contract`
-- ----------------------------
DROP TABLE IF EXISTS `crm_contract`;
CREATE TABLE `crm_contract` (
  `contract_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '合同ID',
  `batch_id` int(11) DEFAULT NULL COMMENT '批次编号',
  `apply_submit` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '合同申请提交',
  `apply_submit_time` datetime DEFAULT NULL COMMENT '合同申请提交时间',
  `contract_state` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '合同审批状态',
  `sign_date` datetime DEFAULT NULL COMMENT '合同签订日期',
  `plan_exp_time` date DEFAULT NULL COMMENT '预期调研时间',
  `create_By` int(11) DEFAULT NULL COMMENT '创建人',
  `create_Date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_By` int(11) DEFAULT NULL COMMENT '更新人',
  `update_Date` datetime DEFAULT NULL COMMENT '更新日期',
  `contractSpecialRequire` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '合同特殊要求',
  `contractFileName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '合同文件名',
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of crm_contract
-- ----------------------------
INSERT INTO `crm_contract` VALUES ('1', '1001', '11', '2016-01-01 00:00:00', 'S001', '2016-01-01 00:00:00', '2016-01-01', '0', '2016-01-20 00:00:00', '0', null, null, null);
INSERT INTO `crm_contract` VALUES ('2', '9', '22', null, null, null, null, '0', '2016-01-24 00:00:00', '0', '2016-01-25 03:58:27', '111', 'upload_8c1ae5ca_6603_46eb_b19c_d9bc786804d3_00000011.tmp');
INSERT INTO `crm_contract` VALUES ('3', '9', '22', null, null, null, null, '0', '2016-01-24 00:00:00', '0', null, '11', null);
INSERT INTO `crm_contract` VALUES ('4', '10', '222', '2016-01-28 22:24:39', null, null, null, '10', '2016-01-28 10:24:39', '0', null, '111', null);
INSERT INTO `crm_contract` VALUES ('5', '11', '333333333333333', '2016-01-28 10:51:39', null, null, null, '10', '2016-01-28 10:51:39', '10', '2016-01-28 10:55:12', '合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111合同特殊要求内容11111', null);
INSERT INTO `crm_contract` VALUES ('6', '12', '11111111111111', '2016-01-28 10:59:02', null, null, null, '10', '2016-01-28 10:59:02', '10', '2016-01-28 11:05:08', '1111111111', null);
INSERT INTO `crm_contract` VALUES ('7', '20', '111', '2016-01-30 00:56:00', null, null, null, '2', '2016-01-30 12:56:00', '0', null, '11111', null);
INSERT INTO `crm_contract` VALUES ('8', '22', '1111', '2016-01-30 01:28:51', null, null, null, '2', '2016-01-30 01:28:51', '0', null, '111111', null);
INSERT INTO `crm_contract` VALUES ('9', '23', '111', '2016-01-30 01:37:15', null, null, null, '2', '2016-01-30 01:37:15', '0', null, '11', null);
INSERT INTO `crm_contract` VALUES ('10', '24', '11111111111111', '2016-01-30 02:04:11', null, null, null, '2', '2016-01-30 02:04:11', '0', null, '1111111111', null);
INSERT INTO `crm_contract` VALUES ('11', '25', '11111111', '2016-01-30 02:10:54', null, null, null, '2', '2016-01-30 02:10:54', '0', null, '1111111111', null);
INSERT INTO `crm_contract` VALUES ('12', '26', '1111', '2016-01-30 02:21:35', null, null, null, '2', '2016-01-30 02:21:35', '0', null, '111111111111111111', null);
INSERT INTO `crm_contract` VALUES ('13', '27', '4444', '2016-01-30 02:29:09', null, null, null, '2', '2016-01-30 02:29:09', '0', null, '444', null);
INSERT INTO `crm_contract` VALUES ('14', '28', '1111', '2016-01-30 02:42:00', null, null, null, '2', '2016-01-30 02:42:00', '2', '2016-01-30 05:39:57', '1`1', null);
INSERT INTO `crm_contract` VALUES ('15', '29', '2222222', '2016-01-30 02:48:21', null, null, null, '2', '2016-01-30 02:48:21', '2', '2016-01-30 02:53:15', '111', null);
INSERT INTO `crm_contract` VALUES ('16', '30', '111', '2016-01-30 02:58:48', null, null, null, '2', '2016-01-30 02:58:48', '2', '2016-01-30 03:00:20', '1111', null);
INSERT INTO `crm_contract` VALUES ('17', '38', 'ew', '2016-01-30 05:01:33', null, null, null, '2', '2016-01-30 05:01:33', '2', '2016-01-30 05:01:56', 'ew', null);
INSERT INTO `crm_contract` VALUES ('18', null, null, '2016-01-30 17:01:57', null, null, null, '2', '2016-01-30 05:01:57', '0', null, null, null);
INSERT INTO `crm_contract` VALUES ('19', null, null, '2016-01-30 17:01:59', null, null, null, '2', '2016-01-30 05:01:59', '0', null, null, null);
INSERT INTO `crm_contract` VALUES ('20', null, null, '2016-01-30 17:02:00', null, null, null, '2', '2016-01-30 05:02:00', '0', null, null, null);
INSERT INTO `crm_contract` VALUES ('21', null, null, '2016-01-30 17:02:02', null, null, null, '2', '2016-01-30 05:02:02', '0', null, null, null);
INSERT INTO `crm_contract` VALUES ('22', null, null, '2016-01-30 17:02:03', null, null, null, '2', '2016-01-30 05:02:03', '0', null, null, null);
INSERT INTO `crm_contract` VALUES ('23', null, null, '2016-01-30 17:02:04', null, null, null, '2', '2016-01-30 05:02:04', '0', null, null, null);
INSERT INTO `crm_contract` VALUES ('24', null, null, '2016-01-30 17:02:06', null, null, null, '2', '2016-01-30 05:02:06', '0', null, null, null);
INSERT INTO `crm_contract` VALUES ('25', null, null, '2016-01-30 17:03:14', null, null, null, '2', '2016-01-30 05:03:14', '0', null, null, null);
INSERT INTO `crm_contract` VALUES ('26', '34', '2016年1月30日', '2016-01-30 17:04:18', null, null, null, '2', '2016-01-30 05:04:18', '0', null, '预计16年底通过评审', null);
INSERT INTO `crm_contract` VALUES ('27', '246', '22', '2016-02-02 10:01:39', null, null, null, '11', '2016-02-02 10:01:39', '22', '2016-02-02 10:03:16', '11', null);
INSERT INTO `crm_contract` VALUES ('28', '247', '111', '2016-02-02 10:10:13', null, null, null, '11', '2016-02-02 10:10:13', '22', '2016-02-02 10:10:49', '11', null);
INSERT INTO `crm_contract` VALUES ('29', '248', '111', '2016-02-02 10:27:22', null, null, null, '11', '2016-02-02 10:27:22', '22', '2016-02-02 10:35:07', '111111111111', null);
INSERT INTO `crm_contract` VALUES ('30', '250', '11', '2016-02-02 10:38:22', '11', null, '2015-06-01', '11', '2016-02-02 10:38:22', '12', '2016-02-02 11:14:19', '11', 'upload_c228cbf0_5fbe_4d27_9925_fedfaad34b26_00000031.tmp');
INSERT INTO `crm_contract` VALUES ('31', '355', '222', '2016-02-03 08:51:42', '11111', '2016-01-01 00:00:00', '2016-01-01', '11', '2016-02-03 08:51:42', '10', '2016-02-03 09:06:41', '1111111111', 'upload_a7fa0559_2067_45aa_a83c_021c9c981fef_00000031.tmp');
INSERT INTO `crm_contract` VALUES ('32', '356', '222', '2016-02-03 09:13:28', null, null, null, '11', '2016-02-03 09:13:28', '18', '2016-02-03 09:15:55', '111111111111', null);
INSERT INTO `crm_contract` VALUES ('33', '357', '333', '2016-02-03 09:31:40', null, null, null, '11', '2016-02-03 09:31:40', '22', '2016-02-03 09:32:29', '111111111', null);
INSERT INTO `crm_contract` VALUES ('34', '378', null, '2016-02-04 03:00:09', '11111', '2016-01-01 00:00:00', '2016-01-01', '11', '2016-02-04 03:00:09', '10', '2016-02-04 03:13:31', '1111111111111111', 'upload_f3dd6075_3ab8_48f2_bf6c_e7960c5bc022_00000034.tmp');
INSERT INTO `crm_contract` VALUES ('35', '379', null, '2016-02-04 03:42:33', null, null, null, '22', '2016-02-04 03:42:33', '22', '2016-02-04 03:52:18', '1111', null);
INSERT INTO `crm_contract` VALUES ('36', '380', null, '2016-02-04 04:03:06', null, null, null, '11', '2016-02-04 04:03:06', '22', '2016-02-04 04:04:01', '1111', null);
INSERT INTO `crm_contract` VALUES ('37', '381', null, '2016-02-04 04:04:46', null, null, null, '22', '2016-02-04 04:04:46', '22', '2016-02-04 04:05:19', '111', null);
INSERT INTO `crm_contract` VALUES ('38', '382', null, '2016-02-04 04:06:48', null, null, null, '11', '2016-02-04 04:06:48', '18', '2016-02-04 04:17:33', 'abc--------------DDDDDDDDDDDDDD', null);
INSERT INTO `crm_contract` VALUES ('39', '383', null, '2016-02-04 16:31:38', null, null, null, '11', '2016-02-04 04:31:38', '0', null, 'eeeeeeeeeee', null);
INSERT INTO `crm_contract` VALUES ('40', '384', null, '2016-02-04 16:33:38', null, null, null, '11', '2016-02-04 04:33:38', '0', null, 'rrrrrrrr', null);
INSERT INTO `crm_contract` VALUES ('41', '385', null, '2016-02-04 16:40:06', null, null, null, '11', '2016-02-04 04:40:06', '0', null, '111111', null);
INSERT INTO `crm_contract` VALUES ('42', '386', null, '2016-02-04 17:13:27', null, null, null, '11', '2016-02-04 05:13:30', '0', null, '1111', null);
INSERT INTO `crm_contract` VALUES ('43', '388', null, '2016-02-04 05:55:18', null, null, null, '11', '2016-02-04 05:55:18', '22', '2016-02-04 05:58:30', 'fffffffffff', null);
INSERT INTO `crm_contract` VALUES ('44', '393', null, '2016-02-04 09:37:05', null, null, '2016-02-19', '11', '2016-02-04 09:37:05', '10', '2016-02-04 09:48:45', '111111111111111', 'upload_22e7b34e_9cf5_41ee_9745_015c47826b40_00000034.tmp');

-- ----------------------------
-- Table structure for `crm_cust`
-- ----------------------------
DROP TABLE IF EXISTS `crm_cust`;
CREATE TABLE `crm_cust` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户姓名',
  `keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关键字用于客户检查',
  `cust_type` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户类型',
  `cust_level` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '户客等级',
  `sale_manage` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '售销经理',
  `firt_vist_time` date DEFAULT NULL COMMENT '第一次拜访时间',
  `last_vist_time` date DEFAULT NULL COMMENT '最后一次拜访时间',
  `next_vist_time` date DEFAULT NULL COMMENT '下次拜访时间',
  `first_contact_man` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第一联系人',
  `first_contact_man_pos` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第一联系人职位',
  `first_contact_man_mobile` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第一联系人电话',
  `first_contact_man_company_phone` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第一联系人公司电话',
  `first_contact_man_email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第一联系人邮箱',
  `second_contact_man` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第二联系人',
  `second_contact_man_pos` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第二联系人职位',
  `second_contact_man_mobile` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第二联系人手机',
  `second_contact_man_company_phone` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第二联系人公司号码',
  `second_contact_man_email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第二联系人邮箱',
  `third_contact_man` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第三联系人',
  `third_contact_man_pos` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第三联系人职位',
  `third_contact_man_mobile` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第三联想人电话',
  `third_contact_man_company_phone` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第三联系人公司电话',
  `third_contact_man_email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第三联系人邮箱',
  `hang_ye` varchar(128) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '行业',
  `check_area` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '验检区域',
  `provence_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '省份',
  `pro_area` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地市',
  `ren_key_zhong_lei` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '可认种类',
  `bao_jia` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价',
  `address` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `jing_zheng_dui_shou` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '竞争对手',
  `dui_shou_introv` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '竞争对手介绍',
  `kai_biao_flag` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '否是开标',
  `kai_biao_date` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标开日期',
  `fcm_is_visual` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第一联系人是否对咨询师可见 Y可见 N不可见',
  `scm_is_visual` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第二联系人是否对咨询师可见 Y可见 N不可见',
  `tcm_is_visual` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第三联系人是否对咨询师可见 Y可见 N不可见',
  `batch_id` int(11) DEFAULT NULL COMMENT '批次ID 作为流程控制的字段',
  `create_By` int(11) DEFAULT NULL COMMENT '创建人',
  `create_Date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_By` int(11) DEFAULT NULL COMMENT '更新人',
  `update_Date` datetime DEFAULT NULL COMMENT '更新日期',
  `jianCeJiaoZhun` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '主要检测或校准领域',
  `BeiZhu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `counselor_id` int(11) DEFAULT NULL,
  `neiqin_Id` int(11) DEFAULT NULL,
  `custService_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of crm_cust
-- ----------------------------
INSERT INTO `crm_cust` VALUES ('13', 'ztq', '1', 'A', 'A', 'aaa', '2016-01-29', '2016-01-29', '2016-01-29', '222', '3', '3', '33', '33', '3234', '2', '34', '23', '423', '2333', '', '3', '3', '33', '3', 'A', 'A', 'A', 'A', '11', '3', '3', '3', '1', '1', 'Y', '1', null, '91', '0', '2016-01-29 23:14:43', '0', '2016-01-29 23:13:05', '111', '11', null, null, null);
INSERT INTO `crm_cust` VALUES ('35', '日月驰咨询', null, 'A', 'A', '', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'A', 'A', 'A', 'A', '', '', '', '', null, null, null, null, null, '47', '24', '2016-01-30 22:10:59', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('36', '北京日月驰信息技术', null, 'A', 'A', '', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'A', 'A', 'A', 'A', '', '', '', '', null, null, null, null, null, '48', '24', '2016-01-30 22:12:07', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('127', '北京日月驰信息技术', '日月驰', 'zjhd', 'D', '', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '148', '11', '2016-02-01 15:01:51', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('129', '汽车轴承股份有限公司', '汽车轴承', null, '', null, null, null, null, '龙老师（女），技术中心：金部长', null, '18762011080龙  13000277055金', '0710-3787302（301技术/305/333质检/240）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '汽车零部件', null, '湖北', '襄阳市', '17025', '6.8万（8.2万）', null, '重庆一家咨询公司（费用不详，只知道是所有家里价钱最高的）', null, null, null, null, null, null, '155', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('130', '江西中程煜煜程塑业有限公司', '中程煜', null, '', null, null, null, null, '黄经理，质检部：杨经理', null, '13500027325黄 18200285077杨', '0745-8871110黄（8829989办公/69销售）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '管业', null, '江西', '九江市', '17025', '7万', null, '丢给江西本地一家咨询公司（咨询费不到4W，没有差旅食宿费用，保证10个月通过现场评审）', null, null, null, null, null, null, '156', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('131', '中国石油化工股份有限公司江宁分公司', '石油化工', null, '', null, null, null, null, '质量处：王工，胡科长，质量中心：雷主任', null, '18171271973王 13297980793曹', '029-85595765王、029-85595768胡、85596600雷（85565513质检科/85515662）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '石油化工', null, '湖北', '武汉市', '17025', '7.5万', null, '爱格森', null, null, null, null, null, null, '157', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('132', '红旗华润有限公司', '华润', null, 'E', null, null, null, null, '质检部：杨工', null, '', '0716-71900310', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '电缆', null, '湖北', '宜昌市', null, null, null, '', null, null, null, null, null, null, '158', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('133', '襄阳五二有限公司', '五二', null, 'E', null, null, null, null, '技术部：李部长（质量部：雷科长）', null, '', '0716-3777068（3722061质量部）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '泵业', null, '湖北', '襄阳市', null, null, null, '', null, null, null, null, null, null, '159', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('134', '黄石山力有限公司', '山力', null, 'E', null, null, null, null, '质检部：雷部长', null, '1.517209696E10', '0724-3299702', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '冶金', null, '湖北', '黄冈市', null, null, null, '', null, null, null, null, null, null, '160', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('135', '中国中铁电气化局集团工程有限公司', '中铁电气', null, 'E', null, null, null, null, '实验中心：刘主任', null, '', '028-51882273', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '工程建筑', null, '湖北', '武汉市', null, null, null, '', null, null, null, null, null, null, '161', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('136', '湖北剑飞有限公司', '剑飞', null, 'E', null, null, null, null, '质检部：李部长', null, '', '0716-3663619（3663636）', '', null, null, null, null, null, null, null, null, null, null, '泵业', null, '湖北', '黄冈市', null, null, null, '', null, null, null, null, null, null, '162', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('137', '武汉科阳电子有限公司', '科阳电子', null, 'E', null, null, null, null, '技术部：陈工', null, '', '023-88967976-技术部', '', null, null, null, null, null, null, null, null, null, null, '光伏', null, '湖北', '武汉市', null, null, null, '', null, null, null, null, null, null, '163', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('138', '江西乳业股份有限公司', '乳业', null, 'E', null, null, null, null, '质检部：彭部长', null, '', '0799-82560067（85278434）', '', null, null, null, null, null, null, null, null, null, null, '乳业', null, '江西', '南昌市', null, null, null, '', null, null, null, null, null, null, '164', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('139', '武汉君乐宝药业股份有限公司', '君乐宝', null, 'E', null, null, null, null, '质检部：华部长', null, '', '025-84988633', '', null, null, null, null, null, null, null, null, null, null, '药业', null, '湖北', '武汉市', null, null, null, '', null, null, null, null, null, null, '165', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('140', '武汉市巨鲸有限公司', '巨鲸', null, 'E', null, null, null, null, '质检部：冯部长', null, '', '0719-8003852（3801/3808）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '机械制造', null, '湖北', '荆州市', null, null, null, '', null, null, null, null, null, null, '166', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('141', '湖北威威生物药业股份有限公司', '威威生物', null, 'E', null, null, null, null, '质量部：范部长/负责体系：罗总', null, '', '0724-6151385范（6515132罗）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '药业', null, '湖北', '黄冈市', null, null, null, '', null, null, null, null, null, null, '167', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('142', '湖北康阳药业有限公司', '康阳', null, 'E', null, null, null, null, '质保部：谭部长', null, '', '0715-3823465-8102', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '药业', null, '湖北', '鄂州市', null, null, null, '', null, null, null, null, null, null, '168', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('143', '江西省医学科学研究所', '医学科学院', null, 'E', null, null, null, null, '实验室：李主任', null, '', '0796-86326745', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '研究所', null, '江西', '南昌市', null, null, null, '', null, null, null, null, null, null, '169', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('144', '南昌大学第一附属医院', '南昌大学', null, 'E', null, null, null, null, '实验室：谢主任', null, '', '0792-88629507', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '医院', null, '江西', '南昌市', null, null, null, '', null, null, null, null, null, null, '170', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('145', '武威市食品药品检验所', '武威食品', null, 'E', null, null, null, null, '负责人：杨所长', null, '', '0718-8869600/8855251（联系人  胡晓茵\n电话/传真  0718-8898025 0718-8891037\nEmail  41444486@qq.com）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '检查机构', null, '湖北', '咸宁市', null, null, null, '', null, null, null, null, null, null, '171', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('146', '武威市长江工具有限责任', '长江工具', null, 'E', null, null, null, null, '技术部：洛工', null, '', '0723-6775732（6782626办公室）', '', null, null, null, null, null, null, null, null, null, null, '机械工具', null, '湖北', '武穴市', null, null, null, '', null, null, null, null, null, null, '172', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('147', '江西长河世纪新电源有限公司', '长河世纪', null, 'E', null, null, null, null, '品质部：孙部长', null, '', '0795-6665686-8901', '', null, null, null, null, null, null, null, null, null, null, '电池', null, '江西', '上饶市', null, null, null, '', null, null, null, null, null, null, '173', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('148', '湖南长思食品有限公司', '长思食品', null, 'E', null, null, null, null, '质检部：徐科长', null, '', '0726-6766859-8989', '', null, null, null, null, null, null, null, null, null, null, '食品', null, '湖北', '潜江市', null, null, null, '', null, null, null, null, null, null, '174', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('149', '江西煜煜塑业有限公司', '煜煜塑业', null, '', null, null, null, null, '黄经理，质检部：杨经理', null, '13500027325黄 18200285077杨', '0745-8871110黄（8829989办公/69销售）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '管业', null, '江西', '九江市', '17025', '7万', null, '丢给江西本地一家咨询公司（咨询费不到4W，没有差旅食宿费用，保证10个月通过现场评审）', null, null, null, null, null, null, '175', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('150', '中国石化化工股份有限公司江宁分公司', '中国石化', null, '', null, null, null, null, '质量处：王工，胡科长，质量中心：雷主任', null, '18171271973王 13297980793曹', '029-85595765王、029-85595768胡、85596600雷（85565513质检科/85515662）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '石油化工', null, '湖北', '武汉市', '17025', '7.5万', null, '爱格森', null, null, null, null, null, null, '176', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('151', '红旗润润有限公司', '红润', null, 'E', null, null, null, null, '质检部：杨工', null, '', '0716-71900310', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '电缆', null, '湖北', '宜昌市', null, null, null, '', null, null, null, null, null, null, '177', '22', '2016-02-01 15:38:41', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('152', '武威市药品检验所1', 'HEG', null, 'E', null, null, null, null, '负责人：杨所长', null, '', '0718-8869600/8855251（联系人  胡晓茵\n电话/传真  0718-8898025 0718-8891037\nEmail  41444486@qq.com）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '检查机构', null, '湖北', '咸宁市', null, null, null, '', null, null, null, null, null, null, '179', '11', '2016-02-02 09:03:18', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('153', '武威市长江工程有限责任1', 'SS', null, 'E', null, null, null, null, '技术部：洛工', null, '', '0723-6775732（6782626办公室）', '', null, null, null, null, null, null, null, null, null, null, '机械工具', null, '湖北', '武穴市', null, null, null, '', null, null, null, null, null, null, '180', '11', '2016-02-02 09:03:18', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('154', '江西世纪新电源有限公司1', 'DDD', null, 'E', null, null, null, null, '品质部：孙部长', null, '', '0795-6665686-8901', '', null, null, null, null, null, null, null, null, null, null, '电池', null, '江西', '上饶市', null, null, null, '', null, null, null, null, null, null, '181', '11', '2016-02-02 09:03:18', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('155', '湖南思念食品有限公司1', 'EEE', null, 'E', null, null, null, null, '质检部：徐科长', null, '', '0726-6766859-8989', '', null, null, null, null, null, null, null, null, null, null, '食品', null, '湖北', '潜江市', null, null, null, '', null, null, null, null, null, null, '182', '11', '2016-02-02 09:03:18', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('156', '湖北阳河生物药业股份有限公司1', 'WE', null, 'E', null, null, null, null, '质量部：范部长/负责体系：罗总', null, '', '0724-6151385范（6515132罗）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '药业', null, '湖北', '黄冈市', null, null, null, '', null, null, null, null, null, null, '183', '11', '2016-02-02 09:03:18', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('157', '湖北康王康药业有限公司1', 'EW', null, 'E', null, null, null, null, '质保部：谭部长', null, '', '0715-3823465-8102', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '药业', null, '湖北', '鄂州市', null, null, null, '', null, null, null, null, null, null, '184', '11', '2016-02-02 09:03:18', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('158', '江西省医学检验科学研究所1', 'WEWE', null, 'E', null, null, null, null, '实验室：李主任', null, '', '0796-86326745', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '研究所', null, '江西', '南昌市', null, null, null, '', null, null, null, null, null, null, '185', '11', '2016-02-02 09:03:18', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('159', '南昌第二附属医院1', '333WWE', null, 'E', null, null, null, null, '实验室：谢主任', null, '', '0792-88629507', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '医院', null, '江西', '南昌市', null, null, null, '', null, null, null, null, null, null, '186', '11', '2016-02-02 09:03:18', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('160', '威武市药品检验所1', 'RERER', null, 'E', null, null, null, null, '负责人：杨所长', null, '', '0718-8869600/8855251（联系人  胡晓茵\n电话/传真  0718-8898025 0718-8891037\nEmail  41444486@qq.com）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '检查机构', null, '湖北', '咸宁市', null, null, null, '', null, null, null, null, null, null, '187', '11', '2016-02-02 09:03:18', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('161', '武威市长城工程有限责任1', 'TRTRT', null, 'E', null, null, null, null, '技术部：洛工', null, '', '0723-6775732（6782626办公室）', '', null, null, null, null, null, null, null, null, null, null, '机械工具', null, '湖北', '武穴市', null, null, null, '', null, null, null, null, null, null, '188', '11', '2016-02-02 09:03:18', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('162', '汽车轴承有限公司1', 'SAD', null, '', null, null, null, null, '龙老师（女），技术中心：金部长', null, '18762011080龙  13000277055金', '0710-3787302（301技术/305/333质检/240）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '汽车零部件', null, '湖北', '襄阳市', '17025', '6.8万（8.2万）', null, '重庆一家咨询公司（费用不详，只知道是所有家里价钱最高的）', null, null, null, null, null, null, '189', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('163', '江西中程煜煜程塑业有限公司1', 'SASDA', null, '', null, null, null, null, '黄经理，质检部：杨经理', null, '13500027325黄 18200285077杨', '0745-8871110黄（8829989办公/69销售）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '管业', null, '江西', '九江市', '17025', '7万', null, '丢给江西本地一家咨询公司（咨询费不到4W，没有差旅食宿费用，保证10个月通过现场评审）', null, null, null, null, null, null, '190', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('164', '中国石油化工股份有限公司江宁分公司1', 'SDDAS', null, '', null, null, null, null, '质量处：王工，胡科长，质量中心：雷主任', null, '18171271973王 13297980793曹', '029-85595765王、029-85595768胡、85596600雷（85565513质检科/85515662）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '石油化工', null, '湖北', '武汉市', '17025', '7.5万', null, '爱格森', null, null, null, null, null, null, '191', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('165', '襄阳五二有限公司1', 'DSD', null, 'E', null, null, null, null, '技术部：李部长（质量部：雷科长）', null, '', '0716-3777068（3722061质量部）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '泵业', null, '湖北', '襄阳市', null, null, null, '', null, null, null, null, null, null, '192', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('166', '江西乳业股份有限公司1', 'YTY', null, 'E', null, null, null, null, '质检部：彭部长', null, '', '0799-82560067（85278434）', '', null, null, null, null, null, null, null, null, null, null, '乳业', null, '江西', '南昌市', null, null, null, '', null, null, null, null, null, null, '193', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('167', '武汉君乐宝药业股份有限公司1', 'GFG', null, 'E', null, null, null, null, '质检部：华部长', null, '', '025-84988633', '', null, null, null, null, null, null, null, null, null, null, '药业', null, '湖北', '武汉市', null, null, null, '', null, null, null, null, null, null, '194', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('168', '武汉市巨鲸有限公司1', 'YUYU', null, 'E', null, null, null, null, '质检部：冯部长', null, '', '0719-8003852（3801/3808）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '机械制造', null, '湖北', '荆州市', null, null, null, '', null, null, null, null, null, null, '195', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('169', '江西省医学科学研究所1', 'GFGF', null, 'E', null, null, null, null, '实验室：李主任', null, '', '0796-86326745', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '研究所', null, '江西', '南昌市', null, null, null, '', null, null, null, null, null, null, '196', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('170', '南昌大学第一附属医院1', 'IOIO', null, 'E', null, null, null, null, '实验室：谢主任', null, '', '0792-88629507', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '医院', null, '江西', '南昌市', null, null, null, '', null, null, null, null, null, null, '197', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('171', '武威市食品药品检验所1', 'OILJKUI', null, 'E', null, null, null, null, '负责人：杨所长', null, '', '0718-8869600/8855251（联系人  胡晓茵\n电话/传真  0718-8898025 0718-8891037\nEmail  41444486@qq.com）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '检查机构', null, '湖北', '咸宁市', null, null, null, '', null, null, null, null, null, null, '198', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('172', '武威市长江工具有限责任1', 'SRHSHFD', null, 'E', null, null, null, null, '技术部：洛工', null, '', '0723-6775732（6782626办公室）', '', null, null, null, null, null, null, null, null, null, null, '机械工具', null, '湖北', '武穴市', null, null, null, '', null, null, null, null, null, null, '199', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('173', '江西长河世纪新电源有限公司1', 'FGESRGS', null, 'E', null, null, null, null, '品质部：孙部长', null, '', '0795-6665686-8901', '', null, null, null, null, null, null, null, null, null, null, '电池', null, '江西', '上饶市', null, null, null, '', null, null, null, null, null, null, '200', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('174', '湖南长思食品有限公司1', 'RDFGR', null, 'E', null, null, null, null, '质检部：徐科长', null, '', '0726-6766859-8989', '', null, null, null, null, null, null, null, null, null, null, '食品', null, '湖北', '潜江市', null, null, null, '', null, null, null, null, null, null, '201', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('175', '轴承股份有限公司1', 'DVGER', null, '', null, null, null, null, '龙老师（女），技术中心：金部长', null, '18762011080龙  13000277055金', '0710-3787302（301技术/305/333质检/240）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '汽车零部件', null, '湖北', '襄阳市', '17025', '6.8万（8.2万）', null, '重庆一家咨询公司（费用不详，只知道是所有家里价钱最高的）', null, null, null, null, null, null, '202', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('176', '江西煜煜塑业有限公司1', 'REGDGR', null, '', null, null, null, null, '黄经理，质检部：杨经理', null, '13500027325黄 18200285077杨', '0745-8871110黄（8829989办公/69销售）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '管业', null, '江西', '九江市', '17025', '7万', null, '丢给江西本地一家咨询公司（咨询费不到4W，没有差旅食宿费用，保证10个月通过现场评审）', null, null, null, null, null, null, '203', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('177', '中国石化化工股份有限公司江宁分公司1', 'RGDGR', null, '', null, null, null, null, '质量处：王工，胡科长，质量中心：雷主任', null, '18171271973王 13297980793曹', '029-85595765王、029-85595768胡、85596600雷（85565513质检科/85515662）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '石油化工', null, '湖北', '武汉市', '17025', '7.5万', null, '爱格森', null, null, null, null, null, null, '204', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('178', '红旗润润有限公司1', 'ERGERG', null, 'E', null, null, null, null, '质检部：杨工', null, '', '0716-71900310', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '电缆', null, '湖北', '宜昌市', null, null, null, '', null, null, null, null, null, null, '205', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('179', '襄阳二二有限公司1', 'WEWSG', null, 'E', null, null, null, null, '技术部：李部长（质量部：雷科长）', null, '', '0716-3777068（3722061质量部）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '泵业', null, '湖北', '襄阳市', null, null, null, '', null, null, null, null, null, null, '206', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('180', '黄石力山有限公司1', 'FEGRE', null, 'E', null, null, null, null, '质检部：雷部长', null, '1.517209696E10', '0724-3299702', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '冶金', null, '湖北', '黄冈市', null, null, null, '', null, null, null, null, null, null, '207', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('181', '中国中铁电气集团工程有限公司1', 'EGEAG', null, 'E', null, null, null, null, '实验中心：刘主任', null, '', '028-51882273', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '工程建筑', null, '湖北', '武汉市', null, null, null, '', null, null, null, null, null, null, '208', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('182', '1湖北省建新集团有限公司', 'DFGER', null, 'E', null, null, null, null, '技术部：陈部长', null, '1.8971567036E10', '025-88208392技术/8431质量：汪部长', '', null, null, null, null, null, null, null, null, null, null, '工程建筑', null, '湖北', '武汉市', null, null, null, '', null, null, null, null, null, null, '209', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('183', '湖北剑业有限公司1', 'EFGRE', null, 'E', null, null, null, null, '质检部：李部长', null, '', '0716-3663619（3663636）', '', null, null, null, null, null, null, null, null, null, null, '泵业', null, '湖北', '黄冈市', null, null, null, '', null, null, null, null, null, null, '210', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('184', '武汉科阳科电子有限公司1', 'GREG', null, 'E', null, null, null, null, '技术部：陈工', null, '', '023-88967976-技术部', '', null, null, null, null, null, null, null, null, null, null, '光伏', null, '湖北', '武汉市', null, null, null, '', null, null, null, null, null, null, '211', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('185', '江西乳品股份有限公司1', 'RGDGGG', null, 'E', null, null, null, null, '质检部：彭部长', null, '', '0799-82560067（85278434）', '', null, null, null, null, null, null, null, null, null, null, '乳业', null, '江西', '南昌市', null, null, null, '', null, null, null, null, null, null, '212', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('186', '武汉君乐宝股份有限公司1', 'FDGREG', null, 'E', null, null, null, null, '质检部：华部长', null, '', '025-84988633', '', null, null, null, null, null, null, null, null, null, null, '药业', null, '湖北', '武汉市', null, null, null, '', null, null, null, null, null, null, '213', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('187', '武汉市鱼鲸有限公司1', 'DGEGAG', null, 'E', null, null, null, null, '质检部：冯部长', null, '', '0719-8003852（3801/3808）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '机械制造', null, '湖北', '荆州市', null, null, null, '', null, null, null, null, null, null, '214', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('188', '湖北威阳生物药业股份有限公司1', 'FDGERGDG', null, 'E', null, null, null, null, '质量部：范部长/负责体系：罗总', null, '', '0724-6151385范（6515132罗）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '药业', null, '湖北', '黄冈市', null, null, null, '', null, null, null, null, null, null, '215', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('189', '湖北康康药业有限公司1', 'DGRDGGGG', null, 'E', null, null, null, null, '质保部：谭部长', null, '', '0715-3823465-8102', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '药业', null, '湖北', '鄂州市', null, null, null, '', null, null, null, null, null, null, '216', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('190', '江西省医学科学研究所1', 'DGEDGGGG', null, 'E', null, null, null, null, '实验室：李主任', null, '', '0796-86326745', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '研究所', null, '江西', '南昌市', null, null, null, '', null, null, null, null, null, null, '217', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('191', '南昌第一附属医院1', 'GDGDGDGDGWEEE', null, 'E', null, null, null, null, '实验室：谢主任', null, '', '0792-88629507', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '医院', null, '江西', '南昌市', null, null, null, '', null, null, null, null, null, null, '218', '11', '2016-02-02 09:07:23', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('192', '斯蒂芬红旗华润有限公司1', 'REWARFQAW', null, 'E', null, null, null, null, '质检部：杨工', null, '', '0716-71900310', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '电缆', null, '湖北', '宜昌市', null, null, null, '', null, null, null, null, null, null, '220', '10', '2016-02-02 14:03:36', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('193', '襄斯蒂芬阳五二有限公司1', 'EFWWQAFEW', null, 'E', null, null, null, null, '技术部：李部长（质量部：雷科长）', null, '', '0716-3777068（3722061质量部）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '泵业', null, '湖北', '襄阳市', null, null, null, '', null, null, null, null, null, null, '221', '10', '2016-02-02 14:03:36', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('194', '黄速度石山力有限公司1', 'FW WEF', null, 'E', null, null, null, null, '质检部：雷部长', null, '1.517209696E10', '0724-3299702', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '冶金', null, '湖北', '黄冈市', null, null, null, '', null, null, null, null, null, null, '222', '10', '2016-02-02 14:03:36', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('195', '中国中铁电气化局集团工程发达省份的有限公司1', 'ERFWF', null, 'E', null, null, null, null, '实验中心：刘主任', null, '', '028-51882273', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '工程建筑', null, '湖北', '武汉市', null, null, null, '', null, null, null, null, null, null, '223', '10', '2016-02-02 14:03:36', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('196', '湖北省集团有限公司1', 'WEFWF', null, 'E', null, null, null, null, '技术部：陈部长', null, '1.8971567036E10', '025-88208392技术/8431质量：汪部长', '', null, null, null, null, null, null, null, null, null, null, '工程建筑', null, '湖北', '武汉市', null, null, null, '', null, null, null, null, null, null, '224', '10', '2016-02-02 14:03:36', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('197', '湖北山东省剑飞有限公司1', 'WFWFW', null, 'E', null, null, null, null, '质检部：李部长', null, '', '0716-3663619（3663636）', '', null, null, null, null, null, null, null, null, null, null, '泵业', null, '湖北', '黄冈市', null, null, null, '', null, null, null, null, null, null, '225', '10', '2016-02-02 14:03:36', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('198', '湖北康阿文台湾阳药业有限公司1', 'FWFWF', null, 'E', null, null, null, null, '质保部：谭部长', null, '', '0715-3823465-8102', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '药业', null, '湖北', '鄂州市', null, null, null, '', null, null, null, null, null, null, '226', '10', '2016-02-02 14:03:36', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('199', '武威市长江军方官员今天工具有限责任1', 'SFWFF', null, 'E', null, null, null, null, '技术部：洛工', null, '', '0723-6775732（6782626办公室）', '', null, null, null, null, null, null, null, null, null, null, '机械工具', null, '湖北', '武穴市', null, null, null, '', null, null, null, null, null, null, '227', '10', '2016-02-02 14:03:36', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('200', '黄石力山而同为有限公司1', 'FFWFWF', null, 'E', null, null, null, null, '质检部：雷部长', null, '1.517209696E10', '0724-3299702', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '冶金', null, '湖北', '黄冈市', null, null, null, '', null, null, null, null, null, null, '228', '10', '2016-02-02 14:03:36', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('201', '湖北威阳生物药业股份有限公司并且我而去1', 'FFWFDG', null, 'E', null, null, null, null, '质量部：范部长/负责体系：罗总', null, '', '0724-6151385范（6515132罗）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '药业', null, '湖北', '黄冈市', null, null, null, '', null, null, null, null, null, null, '229', '10', '2016-02-02 14:03:36', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('202', '湖北康康药业沃尔沃去有限公司1', 'DWF', null, 'E', null, null, null, null, '质保部：谭部长', null, '', '0715-3823465-8102', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '药业', null, '湖北', '鄂州市', null, null, null, '', null, null, null, null, null, null, '230', '10', '2016-02-02 14:03:36', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('203', '江西省医学科学研究所1为去', 'DGEWF', null, 'E', null, null, null, null, '实验室：李主任', null, '', '0796-86326745', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '研究所', null, '江西', '南昌市', null, null, null, '', null, null, null, null, null, null, '231', '10', '2016-02-02 14:03:36', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('204', '南昌第一附问天网属医院1', 'GDGDGDGDGWFEE', null, 'E', null, null, null, null, '实验室：谢主任', null, '', '0792-88629507', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '医院', null, '江西', '南昌市', null, null, null, '', null, null, null, null, null, null, '232', '10', '2016-02-02 14:03:36', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('205', '江西世纪去去而放弃新有限公司1', 'DWFW', null, 'E', null, null, null, null, '品质部：孙部长', null, '', '0795-6665686-8901', '', null, null, null, null, null, null, null, null, null, null, '电池', null, '江西', '上饶市', null, null, null, '', null, null, null, null, null, null, '233', '10', '2016-02-02 14:03:36', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('206', '江西省医学为辅科学研究所1', 'WEWFWF', null, 'E', null, null, null, null, '实验室：李主任', null, '', '0796-86326745', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '研究所', null, '江西', '南昌市', null, null, null, '', null, null, null, null, null, null, '234', '10', '2016-02-02 14:03:36', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('207', '南昌第我安慰属医院1', '333WFWFWE', null, 'E', null, null, null, null, '实验室：谢主任', null, '', '0792-88629507', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '医院', null, '江西', '南昌市', null, null, null, '', null, null, null, null, null, null, '235', '10', '2016-02-02 14:03:36', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('208', '威武市药品我我检验所1', 'REWFWRER', null, 'E', null, null, null, null, '负责人：杨所长', null, '', '0718-8869600/8855251（联系人  胡晓茵\n电话/传真  0718-8898025 0718-8891037\nEmail  41444486@qq.com）', 'LC407@163.com龙  jc@zyy.com.cn金', null, null, null, null, null, null, null, null, null, null, '检查机构', null, '湖北', '咸宁市', null, null, null, '', null, null, null, null, null, null, '236', '10', '2016-02-02 14:03:36', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('209', '额', 'TFWFRTRT', null, 'E', null, null, null, null, '技术部：洛工', null, '', '0723-6775732（6782626办公室）', '', null, null, null, null, null, null, null, null, null, null, '机械工具', null, '湖北', '武穴市', null, null, null, '', null, null, null, null, null, null, '237', '10', '2016-02-02 14:03:36', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('210', '江西新世纪我额源有限公司1', 'RFWFTRT', null, 'E', null, null, null, null, '品质部：孙部长', null, '', '0795-6665686-8901', '', null, null, null, null, null, null, null, null, null, null, '电池', null, '江西', '上饶市', null, null, null, '', null, null, null, null, null, null, '238', '10', '2016-02-02 14:03:37', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('211', '湖南念思文物食品有限', 'RTFWFWRT', null, 'E', null, null, null, null, '质检部：徐科长', null, '', '0726-6766859-8989', '', null, null, null, null, null, null, null, null, null, null, '食品', null, '湖北', '潜江市', null, null, null, '', null, null, null, null, null, null, '239', '10', '2016-02-02 14:03:37', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('212', '111', '111', 'zjhd', 'D', '', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '240', '11', '2016-02-02 19:46:00', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('213', '22', '22', 'zjhd', 'D', '', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '241', '11', '2016-02-02 20:14:03', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('214', '444', '444', 'zjhd', 'D', '', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '242', '11', '2016-02-02 20:25:15', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('215', '555', '555', 'zjhd', 'D', '', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '243', '11', '2016-02-02 20:48:24', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('216', '666', '666', 'zjhd', 'D', '', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '244', '11', '2016-02-02 21:02:03', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('217', '777', '777', 'zjhd', 'D', '', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '245', '11', '2016-02-02 21:23:10', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('218', '888', '888', 'zjhd', 'D', '', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '246', '11', '2016-02-02 21:56:51', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('219', '999', '999', 'zjhd', 'D', '', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '247', '11', '2016-02-02 22:07:22', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('220', '1222', '122', 'zjhd', 'D', '', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '248', '11', '2016-02-02 22:26:59', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('221', '44422', '42', 'zjhd', 'D', '', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '249', '11', '2016-02-02 22:36:49', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('222', '6666666666', '6767', 'zjhd', 'D', '', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '250', '11', '2016-02-02 22:37:54', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('223', '5555555', '5678', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '251', '11', '2016-02-02 23:34:02', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('317', '88899', '89', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '349', '11', '2016-02-03 19:12:06', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('318', '6666', '6666', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '351', '11', '2016-02-03 19:32:18', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('319', '客户01', '客户01', 'khjs', 'A', '张树志', null, null, null, '张三', '高级经理', '15838028035', '15838028035', '11@163.com', '李四', '客服经理', '111111', '15838028035', '22@163.com', '王五', '市场总监', '22222', '15838028035', '33@163.com', '行业01', 'D', 'A', 'A', 'rkzl13', '555.77', '地址01', '竞争对手01', '竞争对手01', 'Y', null, 'Y', 'Y', 'Y', '352', '11', '2016-02-03 20:01:52', '11', '2016-02-03 08:06:37', null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('320', '23333', '33222', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '354', '11', '2016-02-03 20:26:34', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('321', '111', '444111', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '355', '11', '2016-02-03 20:45:35', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('322', '777888', '897', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '356', '11', '2016-02-03 21:12:55', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('323', '8888', '8899', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '357', '11', '2016-02-03 21:25:30', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('325', '8888888', '9988', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '359', '11', '2016-02-04 07:56:39', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('326', '88888888', '899999', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '360', '11', '2016-02-04 10:00:24', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('327', '1212', '1212', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '361', '11', '2016-02-04 10:07:48', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('328', '8989', '8989', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '362', '11', '2016-02-04 10:42:52', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('329', '9988', '9898', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '363', '11', '2016-02-04 10:52:56', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('330', '8989', '89899999', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '366', '11', '2016-02-04 11:09:45', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('331', '11111', '23233', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '367', '11', '2016-02-04 11:16:57', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('332', '7788', '7788', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '368', '11', '2016-02-04 11:32:05', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('333', '7878', '7878', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '369', '11', '2016-02-04 11:45:19', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('334', '112233', '24423', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '370', '11', '2016-02-04 11:50:40', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('335', '3434', '3434', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '371', '11', '2016-02-04 12:12:15', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('336', '17', '17', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '372', '11', '2016-02-04 12:21:39', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('337', '9898', '9898112', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '373', '11', '2016-02-04 12:32:30', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('338', '7879', '78789', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '374', '11', '2016-02-04 12:40:10', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('339', '11112222', '1222', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '376', '11', '2016-02-04 14:45:52', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('340', '111333', '22222333', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '377', '11', '2016-02-04 14:54:06', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('341', '333', '4455555', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '378', '11', '2016-02-04 14:59:46', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('342', 'aaa', 'aa', 'zjhd', 'D', '王勇', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '379', '22', '2016-02-04 15:42:09', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('343', 'aabb', 'ab', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '380', '11', '2016-02-04 16:02:45', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('344', 'abbbb', 'abbb', 'zjhd', 'D', '王勇', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '381', '22', '2016-02-04 16:04:27', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('345', 'abbbbddd', 'abc', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '382', '11', '2016-02-04 16:06:31', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('346', 'eee', 'eeff', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '383', '11', '2016-02-04 16:31:20', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('347', 'rrr', 'rrr', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '384', '11', '2016-02-04 16:33:21', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('348', 'ggg', 'gggggggggg', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '385', '11', '2016-02-04 16:36:50', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('349', 'ggg', 'ggggfffffff', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '386', '11', '2016-02-04 17:13:00', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('350', 'qq', 'ggfffggggg', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '388', '11', '2016-02-04 17:54:44', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('351', 'ffff', 'ggfffgggggdddd', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '390', '11', '2016-02-04 21:21:26', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('352', 'ttt', 'tt', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '391', '11', '2016-02-04 21:23:54', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('353', 'hhh', 'hhh', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '392', '11', '2016-02-04 21:28:16', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('354', 'tg', 'tg', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '393', '11', '2016-02-04 21:36:46', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('355', 'rrrtt', 'rthhh', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '394', '11', '2016-02-04 21:50:10', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('356', 'eeeeeeeeeeee', 'eeeeeeeeerrr', 'zjhd', 'D', '张树志', '2016-02-05', '2016-02-05', null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '395', '11', '2016-02-04 21:56:57', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('358', 'fffffghhhhhhhhhhhhh', 'fffffffgggggggggggg', 'zjhd', 'D', '张树志', '2016-02-05', '2016-02-05', null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '397', '11', '2016-02-05 08:48:03', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('359', 'eeerrrrrrrrrrrrrr', 'erggggggg', 'zjhd', 'D', '张树志', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'D', 'A', 'A', 'RKZL6', '', '', '', '', null, null, null, null, null, '398', '11', '2016-02-05 12:05:56', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('371', '北京希波生物医学有限责任公司', '希波', null, 'E', '刘国义', null, null, null, '', null, '1.3634146287E10', '6.2981398E7', 'sunli8483@163.com', null, null, null, null, null, null, null, null, null, null, '', null, '', '', null, null, null, '', null, null, null, null, null, null, '410', '18', '2016-02-05 12:32:37', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('372', '浙江绿晶香精有限公司', '绿晶', null, 'E', '刘国义', null, null, null, '质检部邵主管', null, '1.3634146287E10', '0571-88627255　　88627256', 'sunli8483@163.com', null, null, null, null, null, null, null, null, null, null, '', null, '', '', null, null, null, '', null, null, null, null, null, null, '411', '18', '2016-02-05 12:32:37', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('373', '仲景大厨房股份有限公司中实', '仲景', null, 'E', '刘国义', null, null, null, '', null, '1.3634146287E10', '0377-69660000（总机）-质检', 'sunli8483@163.com', null, null, null, null, null, null, null, null, null, null, '食品', null, '', '', null, null, null, '', null, null, null, null, null, null, '412', '18', '2016-02-05 12:32:37', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('374', '山东鹤轩空调设备有限公司', '鹤轩', null, 'E', '刘国义', null, null, null, '', null, '1.3634146287E10', '0534-6362267', 'sunli8483@163.com', null, null, null, null, null, null, null, null, null, null, '', null, '', '', null, null, null, '', null, null, null, null, null, null, '413', '18', '2016-02-05 12:32:37', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('375', '浙江方顿仪表阀门有限公司', '方顿', null, 'E', '刘国义', null, null, null, '', null, '1.3634146287E10', '4008-268-952', 'sunli8483@163.com', null, null, null, null, null, null, null, null, null, null, '', null, '', '', null, null, null, '', null, null, null, null, null, null, '414', '18', '2016-02-05 12:32:37', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('376', '温州乐伟克阀门管件有限公司', '乐伟', null, 'E', '刘国义', null, null, null, '', null, '1.3634146287E10', '0577-85987803', 'sunli8483@163.com', null, null, null, null, null, null, null, null, null, null, '', null, '', '', null, null, null, '', null, null, null, null, null, null, '415', '18', '2016-02-05 12:32:37', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('377', '国电联合动力技术(潍坊)有限公司', '国电联合', null, 'E', '刘国义', null, null, null, '', null, '1.3634146287E10', '', 'sunli8483@163.com', null, null, null, null, null, null, null, null, null, null, '', null, '', '', null, null, null, '', null, null, null, null, null, null, '416', '18', '2016-02-05 12:32:37', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('378', '山东鲁尔胶管股份有限公司', '鲁尔胶管', null, 'E', '刘国义', null, null, null, '', null, '1.3634146287E10', '0536-6338339', 'sunli8483@163.com', null, null, null, null, null, null, null, null, null, null, '', null, '', '', null, null, null, '', null, null, null, null, null, null, '417', '18', '2016-02-05 12:32:37', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('379', '德州亚通空调有限公司', '亚通空调', null, 'E', '刘国义', null, null, null, '', null, '1.3634146287E10', '0534-5074444', 'sunli8483@163.com', null, null, null, null, null, null, null, null, null, null, '', null, '', '', null, null, null, '', null, null, null, null, null, null, '418', '18', '2016-02-05 12:32:37', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('380', '山东新风股份有限公司通过', '新风', null, 'E', '刘国义', null, null, null, '', null, '1.3634146287E10', '0533-7181589\n                              0533-7484866', 'sunli8483@163.com', null, null, null, null, null, null, null, null, null, null, '', null, '', '', null, null, null, '', null, null, null, null, null, null, '419', '18', '2016-02-05 12:32:37', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('381', ' 淄博国利新电源科技有限公司', '国利', null, 'E', '刘国义', null, null, null, '质量部', null, '1.3634146287E10', '0533-3581357-8009', 'sunli8483@163.com', null, null, null, null, null, null, null, null, null, null, '', null, '', '', null, null, null, '', null, null, null, null, null, null, '420', '18', '2016-02-05 12:32:37', '0', null, '', '', null, null, null);
INSERT INTO `crm_cust` VALUES ('382', 'ttt', 'ttt', 'zjhd', 'A', '张树志', '2016-02-18', '2016-02-18', null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'A ', '', '0', 'rkzl1', '', '', '', '', null, null, null, null, null, '422', '11', '2016-02-18 09:17:03', '0', null, null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('383', 'aaaaaaaaaaaaa', 'bbbbccccccccccc', 'zjhd', 'A', '刘国义', '2016-03-14', '2016-03-14', null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'A ', '', '0', 'rkzl1', '', '', '', '', null, null, null, null, null, '423', '18', '2016-03-14 19:13:13', '0', '2016-03-14 19:13:13', null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('384', 'bbbccc', 'bbccc', 'zjhd', 'A', '张树志', '2016-03-24', '2016-03-24', null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'A ', '', '0', 'rkzl1', '', '', '', '', null, null, null, null, null, '424', '11', '2016-03-24 18:50:49', '0', '2016-03-24 18:50:49', null, null, null, null, null);
INSERT INTO `crm_cust` VALUES ('385', 'erer', 'erer', 'zjhd', 'A', '张树志', '2016-03-24', '2016-03-24', null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '零售行业', 'A ', '', '0', 'rkzl1', '', '', '', '', null, null, null, null, null, '425', '11', '2016-03-24 19:24:33', '0', '2016-03-24 19:24:33', null, null, null, null, null);

-- ----------------------------
-- Table structure for `crm_first_visit`
-- ----------------------------
DROP TABLE IF EXISTS `crm_first_visit`;
CREATE TABLE `crm_first_visit` (
  `fv_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `batchId` int(11) DEFAULT NULL COMMENT '批次ID',
  `applyTime` date DEFAULT NULL COMMENT '初访申请时间',
  `planVisitTime` date DEFAULT NULL COMMENT '预期访问时间',
  `rideWay` varchar(500) DEFAULT NULL COMMENT '使用乘车方式',
  `intent` varchar(2000) DEFAULT NULL COMMENT '客户诉求',
  `visitor` varchar(255) DEFAULT NULL COMMENT '初访人 多个以逗号 分开',
  `completeTime` datetime DEFAULT NULL COMMENT '初访完成时间',
  `visitExplain` varchar(2000) DEFAULT NULL COMMENT '初访情况说明',
  `travelCostExplain` varchar(2000) DEFAULT NULL COMMENT '差旅费用说明',
  `createBy` int(11) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建日期',
  `updateBy` int(11) DEFAULT NULL COMMENT '新更人',
  `updateDate` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`fv_Id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='初访记录表';

-- ----------------------------
-- Records of crm_first_visit
-- ----------------------------
INSERT INTO `crm_first_visit` VALUES ('9', '9', '2016-01-24', '2016-01-20', '1', '2', '1', '2015-06-01 00:00:00', '433333333333', '4', '0', '2016-01-24 00:00:00', '0', '2016-01-24 00:00:00');
INSERT INTO `crm_first_visit` VALUES ('10', '31', '2016-01-30', '2016-02-01', '11', '11', null, null, '11', '11', '2', '2016-01-30 09:03:23', '0', null);
INSERT INTO `crm_first_visit` VALUES ('11', '32', '2016-01-30', '2016-02-01', '1', '13', '11111', null, '2', '21111', '2', '2016-01-30 09:11:26', '2', '2016-01-30 09:12:01');
INSERT INTO `crm_first_visit` VALUES ('12', '33', '2016-01-30', '2016-02-01', '11', '1111111111111', '11111', null, '11', '11111', '2', '2016-01-30 09:17:01', '2', '2016-01-30 09:17:21');
INSERT INTO `crm_first_visit` VALUES ('13', '34', '2016-01-30', '2016-02-01', '1', '111111111', '11111', null, '11111111', '1111111111111111', '2', '2016-01-30 09:23:03', '2', '2016-01-30 09:23:33');
INSERT INTO `crm_first_visit` VALUES ('14', '35', '2016-01-30', '2016-02-01', '11', '11', '111', null, '11', '11', '2', '2016-01-30 09:29:11', '2', '2016-01-30 09:29:39');
INSERT INTO `crm_first_visit` VALUES ('15', '28', '2016-01-30', '2016-02-03', '火车到长春后客户接', '是否具备启动条件', null, null, '客户硬件不具备启动条件，人员亦不满足要求', '客户方承担\r\n', '2', '2016-01-30 05:09:02', '0', null);
INSERT INTO `crm_first_visit` VALUES ('16', '38', '2016-01-30', '2015-01-06', '初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访', '初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访', null, null, '初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访', '初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访初访', '2', '2016-01-30 05:11:20', '2', '2016-01-30 05:38:09');
INSERT INTO `crm_first_visit` VALUES ('17', '179', '2016-02-02', '2016-04-02', '飞机+打车', '中国合格评定国家认可委员', null, null, '客户想看看咨询师的能力和沟通情况', '公司一般，客户一半。', '11', '2016-02-02 09:16:17', '0', null);
INSERT INTO `crm_first_visit` VALUES ('18', '240', '2016-02-02', '2016-02-01', '111', '222', null, null, null, '3333', '11', '2016-02-02 07:49:19', '0', null);
INSERT INTO `crm_first_visit` VALUES ('19', '241', '2016-02-02', '2016-02-01', '11', '22', ',sunli,zhangshuzhi', null, null, '333', '11', '2016-02-02 08:14:29', '22', '2016-02-02 08:15:40');
INSERT INTO `crm_first_visit` VALUES ('20', '242', '2016-02-02', '2016-02-01', '11', '22', ',sunli,zhangshuzhi,xuweiwei,panmai', '2016-01-20 00:00:00', '333', '333', '11', '2016-02-02 08:25:35', '11', '2016-02-02 08:32:14');
INSERT INTO `crm_first_visit` VALUES ('21', '243', '2016-02-02', '2016-02-01', '11', '22', ',xuningning,zhangyu,liuguoyi,zhangchengfeng', '2016-01-20 00:00:00', '33344444444444', '333', '11', '2016-02-02 08:48:52', '11', '2016-02-02 08:52:44');
INSERT INTO `crm_first_visit` VALUES ('56', '201', '2016-03-23', '2016-03-23', '22', '223333', null, null, null, '333333333333', '11', '2016-03-23 07:07:20', '0', null);
INSERT INTO `crm_first_visit` VALUES ('23', '245', '2016-02-02', '2016-02-01', '11', '22', ',李小勇,张成凤', '2016-01-20 00:00:00', '331111111111111', '33', '11', '2016-02-02 09:24:21', '11', '2016-02-02 09:39:33');
INSERT INTO `crm_first_visit` VALUES ('24', '349', '2016-02-03', '2016-02-01', '11', '22', ',孙丽,徐宁宁', null, null, '333', '11', '2016-02-03 07:12:38', '22', '2016-02-03 07:15:23');
INSERT INTO `crm_first_visit` VALUES ('25', '351', '2016-02-03', '2016-02-01', '111', '222', ',李小勇,张宇,李小勇,张成凤', null, null, '3333', '11', '2016-02-03 07:32:50', '28', '2016-02-03 07:43:30');
INSERT INTO `crm_first_visit` VALUES ('26', '352', '2016-02-03', '2016-02-01', '111111111', '2222222222', ',李小勇,张成凤', '2016-01-20 00:00:00', '555555555555555555555', '333333333333', '11', '2016-02-03 08:09:21', '11', '2016-02-03 08:19:50');
INSERT INTO `crm_first_visit` VALUES ('27', '354', '2016-02-03', '2016-02-01', '22', '33', ',李小勇,张宇,徐威威,刘国义', '2016-01-20 00:00:00', '555', '44', '11', '2016-02-03 08:27:01', '11', '2016-02-03 08:44:17');
INSERT INTO `crm_first_visit` VALUES ('28', '355', '2016-02-03', '2016-02-01', '11', '22', null, null, null, '333', '11', '2016-02-03 08:46:02', '22', '2016-02-03 08:46:53');
INSERT INTO `crm_first_visit` VALUES ('29', '359', '2016-02-04', '2016-02-01', '111', '22', ',张宇', '2016-01-20 00:00:00', '11111111111', '333', '11', '2016-02-04 07:57:00', '13', '2016-02-04 09:53:54');
INSERT INTO `crm_first_visit` VALUES ('30', '360', '2016-02-04', '2016-02-01', '11', '22', ',张宇', null, null, '333', '11', '2016-02-04 10:00:44', '22', '2016-02-04 10:01:32');
INSERT INTO `crm_first_visit` VALUES ('31', '361', '2016-02-04', '2016-02-01', '111111111', '2222222222', ',张宇', '2016-01-20 00:00:00', '1111', '33333333', '11', '2016-02-04 10:09:20', '13', '2016-02-04 10:12:32');
INSERT INTO `crm_first_visit` VALUES ('32', '362', '2016-02-04', '2016-02-01', '11', '22', ',张宇', '2016-01-20 00:00:00', '111111111111111', '333', '11', '2016-02-04 10:43:15', '13', '2016-02-04 10:45:16');
INSERT INTO `crm_first_visit` VALUES ('33', '363', '2016-02-04', '2016-02-01', '11', '22', ',杨勇辉,高利忠', null, null, '33', '11', '2016-02-04 10:53:22', '28', '2016-02-04 10:55:55');
INSERT INTO `crm_first_visit` VALUES ('34', '366', '2016-02-04', '2016-02-01', '11', '22', ',高利忠,杨勇辉', '2016-01-20 00:00:00', '11111111111111111111', '3333', '11', '2016-02-04 11:10:09', '26', '2016-02-04 11:14:49');
INSERT INTO `crm_first_visit` VALUES ('35', '367', '2016-02-04', '2016-02-01', '11', '22', null, null, null, '333', '11', '2016-02-04 11:17:28', '22', '2016-02-04 11:25:49');
INSERT INTO `crm_first_visit` VALUES ('36', '368', '2016-02-04', '2016-03-02', '11', '2', null, null, null, '33', '11', '2016-02-04 11:32:25', '11', '2016-02-04 11:39:05');
INSERT INTO `crm_first_visit` VALUES ('37', '197', '2016-02-04', '2016-03-02', '1', '2', null, null, null, '3', '11', '2016-02-04 11:45:37', '11', '2016-02-04 11:47:14');
INSERT INTO `crm_first_visit` VALUES ('38', '370', '2016-02-04', '2016-02-01', '11', '2', null, null, null, '333', '11', '2016-02-04 11:50:55', '11', '2016-02-04 12:07:16');
INSERT INTO `crm_first_visit` VALUES ('39', '371', '2016-02-04', '2016-02-01', '11', '22', null, null, null, '333', '11', '2016-02-04 12:12:35', '11', '2016-02-04 12:14:52');
INSERT INTO `crm_first_visit` VALUES ('40', '372', '2016-02-04', '2016-02-01', '1', '2', null, null, null, '3', '11', '2016-02-04 12:21:58', '22', '2016-02-04 12:23:16');
INSERT INTO `crm_first_visit` VALUES ('41', '373', '2016-02-04', '2016-02-01', '11', '2', null, null, null, '33', '11', '2016-02-04 12:32:51', '22', '2016-02-04 12:33:26');
INSERT INTO `crm_first_visit` VALUES ('42', '374', '2016-02-04', '2016-02-01', '11', '22', ',张宇', null, null, '333', '11', '2016-02-04 12:40:34', '22', '2016-02-04 12:43:47');
INSERT INTO `crm_first_visit` VALUES ('43', '390', '2016-02-04', '2016-02-26', '111', '222', null, null, null, '333', '11', '2016-02-04 09:21:50', '0', null);
INSERT INTO `crm_first_visit` VALUES ('44', '390', '2016-02-04', '2016-02-04', '111', '222', null, null, null, '333', '11', '2016-02-04 09:22:10', '0', null);
INSERT INTO `crm_first_visit` VALUES ('45', '391', '2016-02-04', '2016-02-26', 'ffffffff', 'ffdddddddd', null, null, null, 'ddddddddd', '11', '2016-02-04 09:24:15', '0', null);
INSERT INTO `crm_first_visit` VALUES ('46', '391', '2016-02-04', '2016-02-19', 'ffffffff', 'ffdddddddd', null, null, null, 'ddddddddd', '11', '2016-02-04 09:26:09', '0', null);
INSERT INTO `crm_first_visit` VALUES ('47', '392', '2016-02-04', '2016-03-04', '11', '22', ',张宇', '2016-02-20 00:00:00', '111111111111', '33', '11', '2016-02-04 09:28:41', '13', '2016-02-04 09:33:56');
INSERT INTO `crm_first_visit` VALUES ('48', '392', '2016-02-04', '2016-03-04', '11', '22', null, null, null, '33', '11', '2016-02-04 09:28:46', '0', null);
INSERT INTO `crm_first_visit` VALUES ('49', '394', '2016-02-04', '2016-02-25', '11', '22', null, null, null, '33', '11', '2016-02-04 09:50:27', '22', '2016-02-04 09:51:07');
INSERT INTO `crm_first_visit` VALUES ('50', '395', '2016-02-04', '2016-02-26', '11', '22', ',张宇', '2016-02-27 00:00:00', '2222222222222', '33', '11', '2016-02-04 09:57:13', '13', '2016-02-04 09:59:04');
INSERT INTO `crm_first_visit` VALUES ('51', '396', '2016-02-05', '2016-02-05', '11', '22', null, null, null, '333', '18', '2016-02-05 08:47:11', '0', null);
INSERT INTO `crm_first_visit` VALUES ('52', '397', '2016-02-05', '2016-02-04', '11', '2322', null, null, null, '333', '11', '2016-02-05 08:48:19', '0', null);
INSERT INTO `crm_first_visit` VALUES ('53', '398', '2016-02-05', '2016-02-20', '111111111', '222222222222', null, null, null, '333333333', '11', '2016-02-05 12:06:26', '0', null);
INSERT INTO `crm_first_visit` VALUES ('55', '251', '2016-03-23', '2016-03-23', '33333333', '33333333333333', null, null, null, '3333333333333', '11', '2016-03-23 06:50:47', '0', null);
INSERT INTO `crm_first_visit` VALUES ('57', '216', '2016-03-23', null, '11', '22', null, null, null, '33', '11', '2016-03-23 07:13:10', '0', null);
INSERT INTO `crm_first_visit` VALUES ('58', '182', '2016-03-23', '2016-03-23', '11', '22', null, null, null, '33', '11', '2016-03-23 07:22:53', '0', null);
INSERT INTO `crm_first_visit` VALUES ('59', '182', '2016-03-23', '2016-03-23', '11', '22', null, null, null, '33', '11', '2016-03-23 07:22:58', '0', null);
INSERT INTO `crm_first_visit` VALUES ('60', '182', '2016-03-23', '2016-03-23', '11', '22', null, null, null, '33', '11', '2016-03-23 07:23:48', '0', null);
INSERT INTO `crm_first_visit` VALUES ('61', '204', '2016-03-23', '2016-03-23', '11', '22', null, null, null, '33', '11', '2016-03-23 07:42:51', '0', null);
INSERT INTO `crm_first_visit` VALUES ('62', '204', '2016-03-23', '2016-03-23', '11', '22', null, null, null, '33', '11', '2016-03-23 07:42:58', '0', null);
INSERT INTO `crm_first_visit` VALUES ('63', null, '2016-03-23', null, null, null, null, null, null, null, '11', '2016-03-23 07:48:59', '0', null);
INSERT INTO `crm_first_visit` VALUES ('64', null, '2016-03-23', null, null, null, null, null, null, null, '11', '2016-03-23 07:49:09', '0', null);
INSERT INTO `crm_first_visit` VALUES ('65', null, '2016-03-23', null, null, null, null, null, null, null, '11', '2016-03-23 07:49:30', '0', null);
INSERT INTO `crm_first_visit` VALUES ('66', null, '2016-03-23', null, null, null, null, null, null, null, '11', '2016-03-23 07:50:15', '0', null);
INSERT INTO `crm_first_visit` VALUES ('67', null, '2016-03-23', null, null, null, null, null, null, null, '11', '2016-03-23 07:50:20', '0', null);
INSERT INTO `crm_first_visit` VALUES ('68', '424', '2016-03-24', '2016-03-24', '11', '22', null, null, null, '333', '11', '2016-03-24 06:51:14', '0', null);
INSERT INTO `crm_first_visit` VALUES ('69', '424', '2016-03-24', '2016-03-24', '1111', '2222', null, null, null, '333333', '11', '2016-03-24 06:51:25', '0', null);
INSERT INTO `crm_first_visit` VALUES ('70', '424', '2016-03-24', '2016-03-24', '111155', '222244', null, null, null, '33333355', '11', '2016-03-24 06:53:32', '0', null);
INSERT INTO `crm_first_visit` VALUES ('71', '424', '2016-03-24', '2016-03-24', '111155', '222244', null, null, null, '33333355', '11', '2016-03-24 07:09:32', '0', null);

-- ----------------------------
-- Table structure for `crm_flow_batch`
-- ----------------------------
DROP TABLE IF EXISTS `crm_flow_batch`;
CREATE TABLE `crm_flow_batch` (
  `batch_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '批次id',
  `batch_code` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '批次编号',
  `createBy` int(11) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建日期',
  `updateBy` int(11) DEFAULT NULL COMMENT '新更人',
  `updateDate` datetime DEFAULT NULL COMMENT '更新日期',
  `flowState` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '流程状态',
  `marketContractFlowState` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '市场部合同洽谈状态',
  PRIMARY KEY (`batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of crm_flow_batch
-- ----------------------------
INSERT INTO `crm_flow_batch` VALUES ('3', '20160120_002', '0', '2016-01-20 00:00:00', '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('4', '2016-01-24105619', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('5', '2016-01-24105913', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('6', '2016-01-24110357', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('7', '2016-01-24110613', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('8', '2016-01-24110928', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('9', '2016-01-24025731', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('10', '2016-01-28101751', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('11', '2016-01-28105106', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('12', '2016-01-28105754', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('13', '2016-01-29105333', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('14', '2016-01-29105421', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('15', '2016-01-29105536', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('16', '2016-01-30122056', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('17', '2016-01-30122130', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('18', '2016-01-30122213', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('19', '2016-01-30125529', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('20', '2016-01-30125545', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('21', '2016-01-30012820', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('22', '2016-01-30012839', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('23', '2016-01-30013704', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('24', '2016-01-30020355', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('25', '2016-01-30021042', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('26', '2016-01-30022124', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('27', '2016-01-30022858', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('28', '2016-01-30024148', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('29', '2016-01-30024810', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('30', '2016-01-30025742', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('31', '2016-01-30090138', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('32', '2016-01-30091059', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('33', '2016-01-30091647', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('34', '2016-01-30092250', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('35', '2016-01-30092859', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('36', '2016-01-30042344', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('37', '2016-01-30050008', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('38', '2016-01-30050028', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('39', '2016-01-30052222', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('40', '2016-01-30052222', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('41', '2016-01-30052222', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('42', '2016-01-30053747', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('43', '2016-01-30053805', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('44', '2016-01-30053817', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('45', '2016-01-30054237', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('46', '2016-01-30054608', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('47', '2016-01-30101059', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('48', '2016-01-30101207', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('49', '2016-02-01113548', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('50', '2016-02-01113741', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('51', '2016-02-01113845', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('52', '2016-02-01113914', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('53', '2016-02-01114223', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('54', '2016-02-01115108', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('55', '2016-02-01115952', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('56', '2016-02-01012202', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('57', '2016-02-01012218', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('58', '2016-02-01020522', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('59', '2016-02-01022224', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('60', '2016-02-01022248', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('61', '2016-02-01022314', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('62', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('63', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('64', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('65', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('66', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('67', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('68', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('69', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('70', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('71', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('72', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('73', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('74', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('75', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('76', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('77', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('78', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('79', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('80', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('81', '2016-02-01023244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('82', '2016-02-01025517', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('83', '2016-02-01025517', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('84', '2016-02-01025517', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('85', '2016-02-01025517', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('86', '2016-02-01025517', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('87', '2016-02-01025517', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('88', '2016-02-01025518', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('89', '2016-02-01025518', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('90', '2016-02-01025518', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('91', '2016-02-01025518', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('92', '2016-02-01025518', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('93', '2016-02-01025518', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('94', '2016-02-01025518', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('95', '2016-02-01025518', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('96', '2016-02-01025518', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('97', '2016-02-01025518', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('98', '2016-02-01025518', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('99', '2016-02-01025518', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('100', '2016-02-01025518', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('101', '2016-02-01025518', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('102', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('103', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('104', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('105', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('106', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('107', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('108', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('109', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('110', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('111', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('112', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('113', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('114', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('115', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('116', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('117', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('118', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('119', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('120', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('121', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('122', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('123', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('124', '2016-02-01025646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('125', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('126', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('127', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('128', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('129', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('130', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('131', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('132', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('133', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('134', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('135', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('136', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('137', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('138', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('139', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('140', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('141', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('142', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('143', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('144', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('145', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('146', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('147', '2016-02-01025855', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('148', '2016-02-01030151', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('149', '2016-02-01030251', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('150', '2016-02-01030417', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('151', '2016-02-01033348', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('152', '2016-02-01033355', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('153', '2016-02-01033428', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('154', '2016-02-01033504', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('155', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('156', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('157', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('158', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('159', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('160', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('161', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('162', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('163', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('164', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('165', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('166', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('167', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('168', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('169', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('170', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('171', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('172', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('173', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('174', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('175', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('176', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('177', '2016-02-01033841', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('178', '2016-02-02084757', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('179', '2016-02-02090318', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('180', '2016-02-02090318', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('181', '2016-02-02090318', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('182', '2016-02-02090318', '0', null, '0', null, 'S001', null);
INSERT INTO `crm_flow_batch` VALUES ('183', '2016-02-02090318', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('184', '2016-02-02090318', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('185', '2016-02-02090318', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('186', '2016-02-02090318', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('187', '2016-02-02090318', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('188', '2016-02-02090318', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('189', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('190', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('191', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('192', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('193', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('194', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('195', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('196', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('197', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('198', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('199', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('200', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('201', '2016-02-02090723', '0', null, '0', null, 'S001', null);
INSERT INTO `crm_flow_batch` VALUES ('202', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('203', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('204', '2016-02-02090723', '0', null, '0', null, 'S001', null);
INSERT INTO `crm_flow_batch` VALUES ('205', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('206', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('207', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('208', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('209', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('210', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('211', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('212', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('213', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('214', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('215', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('216', '2016-02-02090723', '0', null, '0', null, 'S001', null);
INSERT INTO `crm_flow_batch` VALUES ('217', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('218', '2016-02-02090723', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('219', '2016-02-02011206', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('220', '2016-02-02020336', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('221', '2016-02-02020336', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('222', '2016-02-02020336', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('223', '2016-02-02020336', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('224', '2016-02-02020336', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('225', '2016-02-02020336', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('226', '2016-02-02020336', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('227', '2016-02-02020336', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('228', '2016-02-02020336', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('229', '2016-02-02020336', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('230', '2016-02-02020336', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('231', '2016-02-02020336', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('232', '2016-02-02020336', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('233', '2016-02-02020336', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('234', '2016-02-02020336', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('235', '2016-02-02020336', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('236', '2016-02-02020336', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('237', '2016-02-02020336', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('238', '2016-02-02020337', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('239', '2016-02-02020337', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('240', '2016-02-02074600', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('241', '2016-02-02081403', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('242', '2016-02-02082515', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('243', '2016-02-02084824', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('244', '2016-02-02090202', '0', null, '0', null, '', null);
INSERT INTO `crm_flow_batch` VALUES ('245', '2016-02-02092310', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('246', '2016-02-02095651', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('247', '2016-02-02100722', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('248', '2016-02-02102659', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('249', '2016-02-02103649', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('250', '2016-02-02103754', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('251', '2016-02-02113402', '0', null, '0', null, 'S001', null);
INSERT INTO `crm_flow_batch` VALUES ('252', '2016-02-03095018', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('253', '2016-02-03095018', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('254', '2016-02-03095019', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('255', '2016-02-03095019', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('256', '2016-02-03095019', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('257', '2016-02-03095019', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('258', '2016-02-03095019', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('259', '2016-02-03095019', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('260', '2016-02-03095019', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('261', '2016-02-03095020', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('262', '2016-02-03095020', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('263', '2016-02-03095020', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('264', '2016-02-03095020', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('265', '2016-02-03095020', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('266', '2016-02-03095020', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('267', '2016-02-03095020', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('268', '2016-02-03095020', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('269', '2016-02-03095020', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('270', '2016-02-03095020', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('271', '2016-02-03095020', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('272', '2016-02-03095020', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('273', '2016-02-03095021', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('274', '2016-02-03095021', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('275', '2016-02-03095021', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('276', '2016-02-03095021', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('277', '2016-02-03095021', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('278', '2016-02-03105505', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('279', '2016-02-03105505', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('280', '2016-02-03105505', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('281', '2016-02-03105505', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('282', '2016-02-03105505', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('283', '2016-02-03105505', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('284', '2016-02-03105505', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('285', '2016-02-03105505', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('286', '2016-02-03105505', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('287', '2016-02-03105506', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('288', '2016-02-03105654', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('289', '2016-02-03105654', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('290', '2016-02-03105654', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('291', '2016-02-03105654', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('292', '2016-02-03105654', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('293', '2016-02-03105654', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('294', '2016-02-03105654', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('295', '2016-02-03105654', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('296', '2016-02-03105654', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('297', '2016-02-03105654', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('298', '2016-02-03111107', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('299', '2016-02-03111107', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('300', '2016-02-03111107', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('301', '2016-02-03111107', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('302', '2016-02-03111107', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('303', '2016-02-03111107', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('304', '2016-02-03111108', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('305', '2016-02-03111108', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('306', '2016-02-03111108', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('307', '2016-02-03111108', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('308', '2016-02-03012743', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('309', '2016-02-03012744', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('310', '2016-02-03012749', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('311', '2016-02-03012750', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('312', '2016-02-03012750', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('313', '2016-02-03012926', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('314', '2016-02-03012927', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('315', '2016-02-03012927', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('316', '2016-02-03012927', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('317', '2016-02-03012927', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('318', '2016-02-03020233', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('319', '2016-02-03020242', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('320', '2016-02-03020248', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('321', '2016-02-03020248', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('322', '2016-02-03020248', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('323', '2016-02-03020248', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('324', '2016-02-03020248', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('325', '2016-02-03020248', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('326', '2016-02-03020249', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('327', '2016-02-03020249', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('328', '2016-02-03020249', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('329', '2016-02-03023100', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('330', '2016-02-03023100', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('331', '2016-02-03023100', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('332', '2016-02-03023101', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('333', '2016-02-03023101', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('334', '2016-02-03023101', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('335', '2016-02-03023101', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('336', '2016-02-03023101', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('337', '2016-02-03023102', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('338', '2016-02-03023103', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('339', '2016-02-03023525', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('340', '2016-02-03023525', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('341', '2016-02-03023525', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('342', '2016-02-03023525', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('343', '2016-02-03023525', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('344', '2016-02-03023526', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('345', '2016-02-03023526', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('346', '2016-02-03023526', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('347', '2016-02-03023526', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('348', '2016-02-03023526', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('349', '2016-02-03071206', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('350', '2016-02-03073157', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('351', '2016-02-03073218', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('352', '2016-02-03080151', '0', null, '0', null, null, '');
INSERT INTO `crm_flow_batch` VALUES ('353', '2016-02-03082458', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('354', '2016-02-03082634', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('355', '2016-02-03084535', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('356', '2016-02-03091255', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('357', '2016-02-03092530', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('358', '2016-02-03103940', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('359', '2016-02-04075639', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('360', '2016-02-04100024', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('361', '2016-02-04100748', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('362', '2016-02-04104252', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('363', '2016-02-04105256', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('364', '2016-02-04110537', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('365', '2016-02-04110555', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('366', '2016-02-04110945', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('367', '2016-02-04111657', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('368', '2016-02-04113205', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('369', '2016-02-04114519', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('370', '2016-02-04115040', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('371', '2016-02-04121215', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('372', '2016-02-04122139', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('373', '2016-02-04123230', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('374', '2016-02-04124010', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('375', '2016-02-04024510', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('376', '2016-02-04024552', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('377', '2016-02-04025406', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('378', '2016-02-04025946', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('379', '2016-02-04034209', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('380', '2016-02-04040244', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('381', '2016-02-04040427', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('382', '2016-02-04040631', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('383', '2016-02-04043120', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('384', '2016-02-04043321', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('385', '2016-02-04043650', '0', null, '0', null, '', null);
INSERT INTO `crm_flow_batch` VALUES ('386', '2016-02-04051259', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('387', '2016-02-04055407', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('388', '2016-02-04055444', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('389', '2016-02-04060135', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('390', '2016-02-04092126', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('391', '2016-02-04092354', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('392', '2016-02-04092816', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('393', '2016-02-04093646', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('394', '2016-02-04095009', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('395', '2016-02-04095657', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('396', '2016-02-05084622', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('397', '2016-02-05084803', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('398', '2016-02-05120556', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('399', '2016-02-05123025', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('400', '2016-02-05123026', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('401', '2016-02-05123026', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('402', '2016-02-05123026', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('403', '2016-02-05123026', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('404', '2016-02-05123026', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('405', '2016-02-05123026', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('406', '2016-02-05123026', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('407', '2016-02-05123026', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('408', '2016-02-05123026', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('409', '2016-02-05123026', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('410', '2016-02-05123237', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('411', '2016-02-05123237', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('412', '2016-02-05123237', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('413', '2016-02-05123237', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('414', '2016-02-05123237', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('415', '2016-02-05123237', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('416', '2016-02-05123237', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('417', '2016-02-05123237', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('418', '2016-02-05123237', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('419', '2016-02-05123237', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('420', '2016-02-05123237', '0', null, '0', null, '', '');
INSERT INTO `crm_flow_batch` VALUES ('421', '2016-02-18074423', '0', null, '0', null, null, null);
INSERT INTO `crm_flow_batch` VALUES ('422', '2016-02-18091703', '0', null, '0', null, null, null);
INSERT INTO `crm_flow_batch` VALUES ('423', '2016-03-14071313', '0', null, '0', null, null, null);
INSERT INTO `crm_flow_batch` VALUES ('424', '2016-03-24065049', '0', null, '0', null, 'S001', null);
INSERT INTO `crm_flow_batch` VALUES ('425', '2016-03-24072433', '0', null, '0', null, null, null);

-- ----------------------------
-- Table structure for `crm_flow_node_config`
-- ----------------------------
DROP TABLE IF EXISTS `crm_flow_node_config`;
CREATE TABLE `crm_flow_node_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '节点id',
  `code` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '码编',
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '称名',
  `remark` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '述描',
  `nextCode` varchar(128) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '下一个节点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of crm_flow_node_config
-- ----------------------------
INSERT INTO `crm_flow_node_config` VALUES ('1', 'start', '开始节点', '开始节点', 'S001');
INSERT INTO `crm_flow_node_config` VALUES ('2', 'S001', '流程节点01', '流程节点01', 'S002');
INSERT INTO `crm_flow_node_config` VALUES ('3', 'S0002', 'S0002', 'S0002', 'S0002');

-- ----------------------------
-- Table structure for `crm_flow_order`
-- ----------------------------
DROP TABLE IF EXISTS `crm_flow_order`;
CREATE TABLE `crm_flow_order` (
  `flow_order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流单编号',
  `batch_id` int(11) DEFAULT NULL COMMENT '批次编号',
  `flow_order_time` date DEFAULT NULL COMMENT '流单时间',
  `qian_dan_dui_shou` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '签单对手',
  `dui_shou_yewu_jingli` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '对手业务经理',
  `sign_money` float DEFAULT NULL COMMENT '签单金额',
  `qian_dan_li_you` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户选择竞争',
  `create_By` int(11) DEFAULT '0' COMMENT '创建人',
  `create_Date` datetime DEFAULT NULL COMMENT '建创日期',
  `update_By` int(11) DEFAULT NULL COMMENT '新更人',
  `update_Date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`flow_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of crm_flow_order
-- ----------------------------
INSERT INTO `crm_flow_order` VALUES ('1', '10001', '2016-01-20', '对手01', '经理01', '50', '理由01', '0', '2016-01-23 00:00:00', '0', '2016-01-23 00:00:00');

-- ----------------------------
-- Table structure for `crm_lost_order`
-- ----------------------------
DROP TABLE IF EXISTS `crm_lost_order`;
CREATE TABLE `crm_lost_order` (
  `lost_order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流单编号',
  `batch_id` int(11) DEFAULT NULL COMMENT '批次编号',
  `lost_order_time` date DEFAULT NULL COMMENT '流单时间',
  `qian_dan_dui_shou` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '签单对手',
  `dui_shou_yewu_jingli` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '对手业务经理',
  `sign_money` float DEFAULT NULL COMMENT '签单金额',
  `qian_dan_li_you` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户选择竞争',
  `create_By` int(11) DEFAULT '0' COMMENT '创建人',
  `create_Date` datetime DEFAULT NULL COMMENT '建创日期',
  `update_By` int(11) DEFAULT NULL COMMENT '新更人',
  `update_Date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`lost_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of crm_lost_order
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_neiqin`
-- ----------------------------
DROP TABLE IF EXISTS `crm_neiqin`;
CREATE TABLE `crm_neiqin` (
  `nei_qin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内勤',
  `batch_id` int(11) DEFAULT NULL COMMENT '批次编号',
  `kaiPiao_info` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '票开信息',
  `jin_zhang_time` date DEFAULT NULL COMMENT '进账时间',
  `is_need_fa_piao` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发票',
  `kai_piao_time` date DEFAULT NULL COMMENT '开票时间',
  `createBy` int(11) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateBy` int(11) DEFAULT NULL COMMENT '新更人',
  `updateDate` datetime DEFAULT NULL COMMENT '新更时间',
  PRIMARY KEY (`nei_qin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of crm_neiqin
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_staff`
-- ----------------------------
DROP TABLE IF EXISTS `crm_staff`;
CREATE TABLE `crm_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthAddress` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_card_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `minzu` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_merry` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_pos` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dang_pai` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `join_work_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_start_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `health` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_address` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `merry_person_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `merry_person_work_address` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `merry_person_moible` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `merry_person_company_mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_school_and_time` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_edu` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_xue_zhi` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_xue_li` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_xue_wei` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `final_school_and_time` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `final_edu` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `final_xue_zhi` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `final_xue_li` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `final_xue_wei` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of crm_staff
-- ----------------------------
INSERT INTO `crm_staff` VALUES ('1', '用户01', '男', '1988-08-25', '河南郑州', '44444444444444444', '汉族', '是', '市场经理', '市场经理', '共产党', '2000-08', '2016-02-01', '正常', '15838023333', '郑州', '128398833333', '55555', '人员01', '地址012', '155555555555', '15555555555555', '郑州大学', '本科', '3年', '本科', '本科', '郑州大学', '本科', '本科', '本科', '本科');

-- ----------------------------
-- Table structure for `crm_todo`
-- ----------------------------
DROP TABLE IF EXISTS `crm_todo`;
CREATE TABLE `crm_todo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_Id` int(11) DEFAULT NULL COMMENT '批次ID',
  `subject` varchar(500) DEFAULT NULL COMMENT '代办主题',
  `receiver` varchar(255) DEFAULT NULL COMMENT '点半接收人',
  `sender` varchar(255) DEFAULT NULL COMMENT '代办发送人',
  `state` varchar(255) DEFAULT NULL COMMENT '状态：0代办 1已办',
  `createBy` int(11) DEFAULT '0' COMMENT '建创人',
  `createDate` datetime DEFAULT NULL COMMENT '建创日期',
  `updateBy` int(11) DEFAULT '0' COMMENT '新更人',
  `updateDate` int(11) DEFAULT NULL COMMENT '新更日期',
  `url` varchar(500) DEFAULT NULL COMMENT '代办对应处理的URL地址',
  `custName` varchar(200) DEFAULT NULL,
  `todoState` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=238 DEFAULT CHARSET=utf8 COMMENT='代办信息表';

-- ----------------------------
-- Records of crm_todo
-- ----------------------------
INSERT INTO `crm_todo` VALUES ('31', '38', '市场部合同洽谈单流程代办,代办批次id38', 'admin,', 'admin', '0', '0', null, '0', null, '/crm/jsp/contract/crmContractAction!input.action?batchId=38&nextState=SC002&currentState=SC002', null, null);
INSERT INTO `crm_todo` VALUES ('32', '38', '市场部合同洽谈单流程代办,代办批次id38', '', 'admin', '0', '0', null, '0', null, '/crm/jsp/contract/crmContractAction!input.action?batchId=38&nextState=SC004&currentState=SC004', null, null);
INSERT INTO `crm_todo` VALUES ('33', null, '市场部合同洽谈单流程代办,代办批次idnull', 'admin,', 'admin', '0', '0', null, '0', null, '/crm/jsp/contract/crmContractAction!input.action?batchId=null&nextState=SC002&currentState=SC002', null, null);
INSERT INTO `crm_todo` VALUES ('34', null, '市场部合同洽谈单流程代办,代办批次idnull', 'admin,', 'admin', '0', '0', null, '0', null, '/crm/jsp/contract/crmContractAction!input.action?batchId=null&nextState=SC002&currentState=SC002', null, null);
INSERT INTO `crm_todo` VALUES ('35', null, '市场部合同洽谈单流程代办,代办批次idnull', 'admin,', 'admin', '0', '0', null, '0', null, '/crm/jsp/contract/crmContractAction!input.action?batchId=null&nextState=SC002&currentState=SC002', null, null);
INSERT INTO `crm_todo` VALUES ('36', null, '市场部合同洽谈单流程代办,代办批次idnull', 'admin,', 'admin', '0', '0', null, '0', null, '/crm/jsp/contract/crmContractAction!input.action?batchId=null&nextState=SC002&currentState=SC002', null, null);
INSERT INTO `crm_todo` VALUES ('37', null, '市场部合同洽谈单流程代办,代办批次idnull', 'admin,', 'admin', '0', '0', null, '0', null, '/crm/jsp/contract/crmContractAction!input.action?batchId=null&nextState=SC002&currentState=SC002', null, null);
INSERT INTO `crm_todo` VALUES ('38', null, '市场部合同洽谈单流程代办,代办批次idnull', 'admin,', 'admin', '0', '0', null, '0', null, '/crm/jsp/contract/crmContractAction!input.action?batchId=null&nextState=SC002&currentState=SC002', null, null);
INSERT INTO `crm_todo` VALUES ('39', null, '市场部合同洽谈单流程代办,代办批次idnull', 'admin,', 'admin', '0', '0', null, '0', null, '/crm/jsp/contract/crmContractAction!input.action?batchId=null&nextState=SC002&currentState=SC002', null, null);
INSERT INTO `crm_todo` VALUES ('40', null, '市场部合同洽谈单流程代办,代办批次idnull', 'admin,', 'admin', '0', '0', null, '0', null, '/crm/jsp/contract/crmContractAction!input.action?batchId=null&nextState=SC002&currentState=SC002', null, null);
INSERT INTO `crm_todo` VALUES ('41', '34', '市场部合同洽谈单流程代办,代办批次id34', 'admin,', 'admin', '0', '0', null, '0', null, '/crm/jsp/contract/crmContractAction!input.action?batchId=34&nextState=SC002&currentState=SC002', null, null);
INSERT INTO `crm_todo` VALUES ('42', '28', '市场部初访单流程代办,代办批次id28', 'admin,', 'admin', '0', '0', null, '0', null, '/crm/jsp/vistor/crmFirstVisitAction!input.action?batchId=28&nextState=S002&currentState=S002', null, null);
INSERT INTO `crm_todo` VALUES ('43', '38', '市场部初访单流程代办,代办批次id38', 'admin,', 'admin', '0', '0', null, '0', null, '/crm/jsp/vistor/crmFirstVisitAction!input.action?batchId=38&nextState=S002&currentState=S002', null, null);
INSERT INTO `crm_todo` VALUES ('44', '38', '市场部合同洽谈单流程代办,代办批次id38', '', 'admin', '0', '0', null, '0', null, '/crm/jsp/vistor/crmFirstVisitAction!input.action?batchId=38&nextState=S003&currentState=S003', null, null);
INSERT INTO `crm_todo` VALUES ('45', '28', '市场部合同洽谈单流程代办,代办批次id28', 'admin,', 'admin', '0', '0', null, '0', null, '/crm/jsp/contract/crmContractAction!input.action?batchId=28&nextState=SC003&currentState=SC003', null, null);
INSERT INTO `crm_todo` VALUES ('46', '179', '市场部初访单流程代办,代办批次id179', 'admin,王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/vistor/crmFirstVisitAction!input.action?batchId=179&nextState=S003&currentState=S003', null, null);
INSERT INTO `crm_todo` VALUES ('47', '240', '市场部初访单流程代办,代办批次id240', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=240', null, null);
INSERT INTO `crm_todo` VALUES ('48', '241', '市场部初访单流程代办,代办批次id241', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=241', null, null);
INSERT INTO `crm_todo` VALUES ('49', '241', '市场部初访单流程代办,代办批次id241', '', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=241&approveState=0&isNeedAssisient=0', null, null);
INSERT INTO `crm_todo` VALUES ('50', '242', '市场部初访单流程代办,代办批次id242', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=242', null, null);
INSERT INTO `crm_todo` VALUES ('51', '242', '市场部初访单流程代办,代办批次id242', '王法宪,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=242&approveState=0&isNeedAssisient=0', null, null);
INSERT INTO `crm_todo` VALUES ('52', '242', '市场部初访单流程代办,代办批次id242', '张树志', 'wangfaxian', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=242&approveState=0&isNeedAssisient=0', null, null);
INSERT INTO `crm_todo` VALUES ('53', '242', '市场部初访单流程代办,代办批次id242', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=242&approveState=null&isNeedAssisient=null', null, null);
INSERT INTO `crm_todo` VALUES ('54', '243', '市场部初访单流程代办,代办批次id243', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=243', null, null);
INSERT INTO `crm_todo` VALUES ('55', '243', '市场部初访单流程代办,代办批次id243', '王法宪,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=243&approveState=0&isNeedAssisient=0', null, null);
INSERT INTO `crm_todo` VALUES ('56', '243', '市场部初访单流程代办,代办批次id243', '张树志', 'wangfaxian', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=243&approveState=0&isNeedAssisient=0', null, null);
INSERT INTO `crm_todo` VALUES ('57', '243', '市场部初访单流程代办,代办批次id243', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=243&approveState=null&isNeedAssisient=null', null, null);
INSERT INTO `crm_todo` VALUES ('58', '244', '市场部初访单流程代办,代办批次id244', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=244', null, null);
INSERT INTO `crm_todo` VALUES ('59', '244', '市场部初访单流程代办,代办批次id244', '王勇,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=244&approveState=0&isNeedAssisient=1', null, null);
INSERT INTO `crm_todo` VALUES ('60', '244', '市场部初访单流程代办,代办批次id244', '张树志', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=244&approveState=0&isNeedAssisient=1', null, null);
INSERT INTO `crm_todo` VALUES ('61', '245', '市场部初访单流程代办,代办批次id245', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=245', null, null);
INSERT INTO `crm_todo` VALUES ('62', '245', '市场部初访单流程代办,代办批次id245', '张树志', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=245&approveState=0&isNeedAssisient=1', null, null);
INSERT INTO `crm_todo` VALUES ('63', '245', '市场部初访单流程代办,代办批次id245', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=245&approveState=null&isNeedAssisient=null', null, null);
INSERT INTO `crm_todo` VALUES ('64', '246', '市场部合同洽谈单流程代办,代办批次id246', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/contract/crmContractAction!input.action?batchId=246&nextState=SC002&currentState=SC002', null, null);
INSERT INTO `crm_todo` VALUES ('65', '246', '市场部合同洽谈单流程代办,代办批次id246', '刘国义,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/contract/crmContractAction!input.action?batchId=246&nextState=SC004&currentState=SC004', null, null);
INSERT INTO `crm_todo` VALUES ('66', '246', '市场部合同洽谈单流程代办,代办批次id246', '刘国义,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/contract/crmContractAction!input.action?batchId=246&nextState=SC004&currentState=SC004', null, null);
INSERT INTO `crm_todo` VALUES ('67', '247', '市场部合同洽谈单流程代办,代办批次id247', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/contract/crmContractAction!input.action?batchId=247&nextState=SC002&currentState=SC002', null, null);
INSERT INTO `crm_todo` VALUES ('68', '247', '市场部合同洽谈单流程代办,代办批次id247', '刘国义,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/contract/crmContractAction!input.action?batchId=247&nextState=SC004&currentState=SC004', null, null);
INSERT INTO `crm_todo` VALUES ('69', '248', '市场部合同洽谈单流程代办,代办批次id248', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=248', null, null);
INSERT INTO `crm_todo` VALUES ('70', '248', '市场部合同洽谈单流程代办,代办批次id248', '王勇,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=248', null, null);
INSERT INTO `crm_todo` VALUES ('71', '250', '市场部合同洽谈单流程代办,代办批次id250', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=250', null, null);
INSERT INTO `crm_todo` VALUES ('72', '250', '市场部合同洽谈单流程代办,代办批次id250', '王勇,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=250', null, null);
INSERT INTO `crm_todo` VALUES ('73', '250', '市场部合同洽谈单流程代办,代办批次id250', '王勇,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=250', null, null);
INSERT INTO `crm_todo` VALUES ('74', '250', '市场部合同洽谈单流程代办,代办批次id250', '刘国义,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=250', null, null);
INSERT INTO `crm_todo` VALUES ('75', '250', '市场部合同洽谈单流程代办,代办批次id250', '刘国义,', 'liuguoyi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=250', null, null);
INSERT INTO `crm_todo` VALUES ('76', '250', '市场部合同洽谈单流程代办,代办批次id250', '', 'liuguoyi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=250', null, null);
INSERT INTO `crm_todo` VALUES ('77', '250', '市场部合同洽谈单流程代办,代办批次id250', '孙丽,admin,徐宁宁,', 'liuguoyi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=250', null, null);
INSERT INTO `crm_todo` VALUES ('78', '250', '市场部合同洽谈单流程代办,代办批次id250', '孙丽,admin,徐宁宁,', 'xuningning', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=250', null, null);
INSERT INTO `crm_todo` VALUES ('79', '349', '市场部初访单流程代办,代办批次id349', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=349', null, null);
INSERT INTO `crm_todo` VALUES ('80', '349', '市场部初访单流程代办,代办批次id349', '王法宪,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=349&approveState=0&isNeedAssisient=0', null, null);
INSERT INTO `crm_todo` VALUES ('81', '351', '市场部初访单流程代办,代办批次id351', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=351', null, null);
INSERT INTO `crm_todo` VALUES ('82', '351', '市场部初访单流程代办,代办批次id351', '王法宪,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=351&approveState=0&isNeedAssisient=0', null, null);
INSERT INTO `crm_todo` VALUES ('83', '351', '市场部初访单流程代办,代办批次id351', '张树志', 'wangfaxian', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=351&approveState=0&isNeedAssisient=0', null, null);
INSERT INTO `crm_todo` VALUES ('84', '352', '市场部初访单流程代办,代办批次id352', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=352', null, null);
INSERT INTO `crm_todo` VALUES ('85', '352', '市场部初访单流程代办,代办批次id352', '张树志', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=352&approveState=0&isNeedAssisient=1', null, null);
INSERT INTO `crm_todo` VALUES ('86', '352', '市场部初访单流程代办,代办批次id352', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=352&approveState=null&isNeedAssisient=null', null, null);
INSERT INTO `crm_todo` VALUES ('87', '354', '市场部初访单流程代办,代办批次id354', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=354', null, null);
INSERT INTO `crm_todo` VALUES ('88', '354', '市场部初访单流程代办,代办批次id354', '王法宪,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=354&approveState=0&isNeedAssisient=0', null, null);
INSERT INTO `crm_todo` VALUES ('89', '354', '市场部初访单流程代办,代办批次id354', '张树志', 'wangfaxian', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=354&approveState=0&isNeedAssisient=0', null, null);
INSERT INTO `crm_todo` VALUES ('90', '354', '市场部初访单流程代办,代办批次id354', '张树志', 'wangfaxian', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=354&approveState=0&isNeedAssisient=0', null, null);
INSERT INTO `crm_todo` VALUES ('91', '354', '市场部初访单流程代办,代办批次id354', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=354&approveState=null&isNeedAssisient=null', null, null);
INSERT INTO `crm_todo` VALUES ('92', '355', '市场部初访单流程代办,代办批次id355', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=355', null, null);
INSERT INTO `crm_todo` VALUES ('93', '355', '市场部初访单流程代办,代办批次id355', '王勇,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=355&approveState=1&isNeedAssisient=null', null, null);
INSERT INTO `crm_todo` VALUES ('94', '355', '市场部合同洽谈单流程代办,代办批次id355', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=355', null, null);
INSERT INTO `crm_todo` VALUES ('95', '355', '市场部合同洽谈单流程代办,代办批次id355', '刘国义,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=355', null, null);
INSERT INTO `crm_todo` VALUES ('96', '355', '市场部合同洽谈单流程代办,代办批次id355', '孙丽,admin,徐宁宁,', 'liuguoyi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=355', null, null);
INSERT INTO `crm_todo` VALUES ('97', '355', '市场部合同洽谈单流程代办,代办批次id355', '孙丽,admin,徐宁宁,', 'sunli', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=355', null, null);
INSERT INTO `crm_todo` VALUES ('98', '356', '市场部合同洽谈单流程代办,代办批次id356', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=356', null, null);
INSERT INTO `crm_todo` VALUES ('99', '356', '市场部合同洽谈单流程代办,代办批次id356', '刘国义,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=356', null, null);
INSERT INTO `crm_todo` VALUES ('100', '356', '市场部合同洽谈单流程代办,代办批次id356', '孙丽,admin,徐宁宁,', 'liuguoyi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=356', null, null);
INSERT INTO `crm_todo` VALUES ('101', '357', '市场部合同洽谈单流程代办,代办批次id357', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=357', null, null);
INSERT INTO `crm_todo` VALUES ('102', '357', '市场部合同洽谈单流程代办,代办批次id357', '刘国义,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=357', null, null);
INSERT INTO `crm_todo` VALUES ('103', '359', '市场部初访单流程代办,代办批次id359', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=359', null, null);
INSERT INTO `crm_todo` VALUES ('104', '359', '市场部初访单流程代办,代办批次id359', ',张宇', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=359&approveState=0&isNeedAssisient=1', null, null);
INSERT INTO `crm_todo` VALUES ('105', '359', '市场部初访单流程代办,代办批次id359', '王勇,', 'zhangyu', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=359&approveState=null&isNeedAssisient=null', null, null);
INSERT INTO `crm_todo` VALUES ('106', '360', '市场部初访单流程代办,代办批次id360', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=360', null, null);
INSERT INTO `crm_todo` VALUES ('107', '360', '市场部初访单流程代办,代办批次id360', ',张宇', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=360&approveState=0&isNeedAssisient=1', null, null);
INSERT INTO `crm_todo` VALUES ('108', '361', '市场部初访单流程代办,代办批次id361', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=361', null, null);
INSERT INTO `crm_todo` VALUES ('109', '361', '市场部初访单流程代办,代办批次id361', ',张宇', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=361&approveState=0&isNeedAssisient=1', null, null);
INSERT INTO `crm_todo` VALUES ('110', '361', '市场部初访单流程代办,代办批次id361', '王勇,', 'zhangyu', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=361&approveState=null&isNeedAssisient=null', null, null);
INSERT INTO `crm_todo` VALUES ('111', '362', '市场部初访单流程代办,代办批次id362', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=362', null, null);
INSERT INTO `crm_todo` VALUES ('112', '362', '市场部初访单流程代办,代办批次id362', ',张宇', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=362&approveState=0&isNeedAssisient=1', null, null);
INSERT INTO `crm_todo` VALUES ('113', '362', '市场部初访单流程代办,代办批次id362', '张树志', 'zhangyu', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=362&approveState=null&isNeedAssisient=null', null, null);
INSERT INTO `crm_todo` VALUES ('114', '363', '市场部初访单流程代办,代办批次id363', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=363', null, null);
INSERT INTO `crm_todo` VALUES ('115', '363', '市场部初访单流程代办,代办批次id363', '王法宪,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=363&approveState=0&isNeedAssisient=0', null, null);
INSERT INTO `crm_todo` VALUES ('116', '366', '市场部初访单流程代办,代办批次id366', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=366', null, null);
INSERT INTO `crm_todo` VALUES ('117', '366', '市场部初访单流程代办,代办批次id366', '王法宪,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=366&approveState=0&isNeedAssisient=0', null, null);
INSERT INTO `crm_todo` VALUES ('118', '366', '市场部初访单流程代办,代办批次id366', ',高利忠,杨勇辉', 'wangfaxian', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=366&approveState=0&isNeedAssisient=0', null, null);
INSERT INTO `crm_todo` VALUES ('119', '366', '市场部初访单流程代办,代办批次id366', '张树志', 'gaolizhong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=366&approveState=null&isNeedAssisient=null', null, null);
INSERT INTO `crm_todo` VALUES ('120', '367', '市场部初访单流程代办,代办批次id367', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=367', null, null);
INSERT INTO `crm_todo` VALUES ('121', '368', '市场部初访单流程代办,代办批次id368', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=368', null, null);
INSERT INTO `crm_todo` VALUES ('122', '368', '市场部初访单流程代办,代办批次id368', '张树志', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=368&approveState=1&isNeedAssisient=1', null, null);
INSERT INTO `crm_todo` VALUES ('123', '368', '市场部初访单流程代办,代办批次id368', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=368&approveState=null&isNeedAssisient=null', null, null);
INSERT INTO `crm_todo` VALUES ('124', '197', '市场部初访单流程代办,代办批次id197', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=197', null, null);
INSERT INTO `crm_todo` VALUES ('125', '197', '市场部初访单流程代办,代办批次id197', '张树志', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=197&approveState=1&isNeedAssisient=1', null, null);
INSERT INTO `crm_todo` VALUES ('126', '197', '市场部初访单流程代办,代办批次id197', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=197&approveState=null&isNeedAssisient=null', null, null);
INSERT INTO `crm_todo` VALUES ('127', '370', '市场部初访单流程代办,代办批次id370', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=370', null, null);
INSERT INTO `crm_todo` VALUES ('128', '370', '市场部初访单流程代办,代办批次id370', '张树志', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=370&approveState=1&isNeedAssisient=1', null, null);
INSERT INTO `crm_todo` VALUES ('129', '370', '市场部初访单流程代办,代办批次id370', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=370&approveState=null&isNeedAssisient=null', null, null);
INSERT INTO `crm_todo` VALUES ('130', '370', '市场部初访单流程代办,代办批次id370', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=370&approveState=null&isNeedAssisient=', null, null);
INSERT INTO `crm_todo` VALUES ('131', '371', '市场部初访单流程代办,代办批次id371', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=371', null, null);
INSERT INTO `crm_todo` VALUES ('132', '371', '市场部初访单流程代办,代办批次id371', '张树志', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=371&approveState=1&isNeedAssisient=1', null, null);
INSERT INTO `crm_todo` VALUES ('133', '371', '市场部初访单流程代办,代办批次id371', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=371&approveState=null&isNeedAssisient=', null, null);
INSERT INTO `crm_todo` VALUES ('134', '372', '市场部初访单流程代办,代办批次id372', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=372', null, null);
INSERT INTO `crm_todo` VALUES ('135', '372', '市场部初访单流程代办,代办批次id372', '张树志', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=372&approveState=1&isNeedAssisient=1', null, null);
INSERT INTO `crm_todo` VALUES ('136', '373', '市场部初访单流程代办,代办批次id373', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=373', null, null);
INSERT INTO `crm_todo` VALUES ('137', '373', '市场部初访单流程代办,代办批次id373', '张树志', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=373', null, null);
INSERT INTO `crm_todo` VALUES ('138', '374', '市场部初访单流程代办,代办批次id374', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=374', null, null);
INSERT INTO `crm_todo` VALUES ('139', '374', '市场部初访单流程代办,代办批次id374', '张树志', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=374', null, null);
INSERT INTO `crm_todo` VALUES ('140', '374', '市场部初访单流程代办,代办批次id374', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=374&approveState=null&isNeedAssisient=', null, null);
INSERT INTO `crm_todo` VALUES ('141', '374', '市场部初访单流程代办,代办批次id374', ',张宇', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=374&approveState=0&isNeedAssisient=1', null, null);
INSERT INTO `crm_todo` VALUES ('142', '378', '市场部合同洽谈单流程代办,代办批次id378', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=378', null, null);
INSERT INTO `crm_todo` VALUES ('143', '378', '市场部合同洽谈单流程代办,代办批次id378', '刘国义,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=378', null, null);
INSERT INTO `crm_todo` VALUES ('144', '378', '市场部合同洽谈单流程代办,代办批次id378', '孙丽,admin,徐宁宁,', 'liuguoyi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=378', null, null);
INSERT INTO `crm_todo` VALUES ('145', '378', '市场部合同洽谈单流程代办,代办批次id378', '孙丽,admin,徐宁宁,', 'sunli', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=378', null, null);
INSERT INTO `crm_todo` VALUES ('146', '379', '市场部合同洽谈单流程代办,代办批次id379', '王勇,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=379', null, null);
INSERT INTO `crm_todo` VALUES ('147', '380', '市场部合同洽谈单流程代办,代办批次id380', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=380', null, null);
INSERT INTO `crm_todo` VALUES ('148', '380', '市场部合同洽谈单流程代办,代办批次id380', '刘国义,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=380', null, null);
INSERT INTO `crm_todo` VALUES ('149', '381', '市场部合同洽谈单流程代办,代办批次id381', '王勇,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=381', null, null);
INSERT INTO `crm_todo` VALUES ('150', '381', '市场部合同洽谈单流程代办,代办批次id381', '王勇', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=381', null, null);
INSERT INTO `crm_todo` VALUES ('151', '382', '市场部合同洽谈单流程代办,代办批次id382', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=382', null, null);
INSERT INTO `crm_todo` VALUES ('152', '382', '市场部合同洽谈单流程代办,代办批次id382', '张树志', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=382', null, null);
INSERT INTO `crm_todo` VALUES ('153', '382', '市场部合同洽谈单流程代办,代办批次id382', '', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=382', null, null);
INSERT INTO `crm_todo` VALUES ('154', '382', '市场部合同洽谈单流程代办,代办批次id382', '刘国义,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=382', null, null);
INSERT INTO `crm_todo` VALUES ('155', '383', '市场部合同洽谈单流程代办,代办批次id383', '', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=383', null, null);
INSERT INTO `crm_todo` VALUES ('156', '384', '市场部合同洽谈单流程代办,代办批次id384', '', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=384', null, null);
INSERT INTO `crm_todo` VALUES ('157', '385', '市场部合同洽谈单流程代办,代办批次id385', '', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=385', null, null);
INSERT INTO `crm_todo` VALUES ('158', '386', '市场部合同洽谈单流程代办,代办批次id386', '', null, '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=386', null, null);
INSERT INTO `crm_todo` VALUES ('159', '388', '市场部合同洽谈单流程代办,代办批次id388', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=388', null, null);
INSERT INTO `crm_todo` VALUES ('160', '388', '市场部合同洽谈单流程代办,代办批次id388', '刘国义,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=388', null, null);
INSERT INTO `crm_todo` VALUES ('161', '388', '市场部合同洽谈单流程代办,代办批次id388', '王勇,', 'liuguoyi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=388', null, null);
INSERT INTO `crm_todo` VALUES ('162', '388', '市场部合同洽谈单流程代办,代办批次id388', '刘国义,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=388', null, null);
INSERT INTO `crm_todo` VALUES ('163', '390', '市场部初访单流程代办,代办批次id390', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=390', null, null);
INSERT INTO `crm_todo` VALUES ('164', '390', '市场部初访单流程代办,代办批次id390', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=390', null, null);
INSERT INTO `crm_todo` VALUES ('165', '391', '市场部初访单流程代办,代办批次id391', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=391', null, null);
INSERT INTO `crm_todo` VALUES ('166', '391', '市场部初访单流程代办,代办批次id391', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=391', null, null);
INSERT INTO `crm_todo` VALUES ('167', '392', '市场部初访单流程代办,代办批次id392', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=392', null, null);
INSERT INTO `crm_todo` VALUES ('168', '392', '市场部初访单流程代办,代办批次id392', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=392', null, null);
INSERT INTO `crm_todo` VALUES ('169', '392', '市场部初访单流程代办,代办批次id392', ',张宇', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=392&approveState=0&isNeedAssisient=1', null, null);
INSERT INTO `crm_todo` VALUES ('170', '392', '市场部初访单流程代办,代办批次id392', '张树志', 'zhangyu', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=392&approveState=null&isNeedAssisient=null', null, null);
INSERT INTO `crm_todo` VALUES ('171', '393', '市场部合同洽谈单流程代办,代办批次id393', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=393', null, null);
INSERT INTO `crm_todo` VALUES ('172', '393', '市场部合同洽谈单流程代办,代办批次id393', '刘国义,', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=393', null, null);
INSERT INTO `crm_todo` VALUES ('173', '393', '市场部合同洽谈单流程代办,代办批次id393', '孙丽,admin,徐宁宁,', 'liuguoyi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=393', null, null);
INSERT INTO `crm_todo` VALUES ('174', '393', '市场部合同洽谈单流程代办,代办批次id393', '孙丽,admin,徐宁宁,', 'sunli', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketContractAction!input.action?batchId=393', null, null);
INSERT INTO `crm_todo` VALUES ('175', '394', '市场部初访单流程代办,代办批次id394', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=394', null, null);
INSERT INTO `crm_todo` VALUES ('176', '394', '市场部初访单流程代办,代办批次id394', '', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=394&approveState=0&isNeedAssisient=1', null, null);
INSERT INTO `crm_todo` VALUES ('177', '395', '市场部初访单流程代办,代办批次id395', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=395', null, null);
INSERT INTO `crm_todo` VALUES ('178', '395', '市场部初访单流程代办,代办批次id395', ',张宇', 'wangyong', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=395&approveState=0&isNeedAssisient=1', null, null);
INSERT INTO `crm_todo` VALUES ('179', '395', '市场部初访单流程代办,代办批次id395', '张树志', 'zhangyu', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=395&approveState=null&isNeedAssisient=null', null, null);
INSERT INTO `crm_todo` VALUES ('180', '397', '市场部初访单流程代办,代办批次id397', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=397', null, null);
INSERT INTO `crm_todo` VALUES ('181', '398', '市场部初访单流程代办,代办批次id398', '王勇,', 'zhangshuzhi', '0', '0', null, '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=398', null, null);
INSERT INTO `crm_todo` VALUES ('182', '368', '二次报备', '王勇,', '张树志', '1', '0', '2016-03-12 05:19:14', '22', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=368&baoBeiId=6', '7788', 'SB001');
INSERT INTO `crm_todo` VALUES ('183', '368', '二次报备', '张树志', '王勇', '1', '0', '2016-03-12 05:22:06', '0', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=368&baoBeiId=6', '7788', '流程结束');
INSERT INTO `crm_todo` VALUES ('184', '180', '二次报备', '王勇,', '张树志', '0', '11', '2016-03-12 05:33:52', '0', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=180&baoBeiId=7', '武威市长江工程有限责任1', 'SB001');
INSERT INTO `crm_todo` VALUES ('185', '367', '二次报备', '王勇,', '张树志', '1', '0', '2016-03-12 06:21:08', '22', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=367&baoBeiId=8', '11111', 'SB001');
INSERT INTO `crm_todo` VALUES ('186', '367', '二次报备', '张树志', '王勇', '0', '22', '2016-03-12 06:22:54', '0', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=367&baoBeiId=8', '11111', '流程结束');
INSERT INTO `crm_todo` VALUES ('187', '243', '二次报备', '王勇,', '张树志', '1', '0', '2016-03-12 06:24:17', '22', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=243&baoBeiId=9', '555', 'SB001');
INSERT INTO `crm_todo` VALUES ('188', '243', '二次报备', '张树志', '王勇', '1', '0', '2016-03-12 06:24:47', '11', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=243&baoBeiId=9', '555', '提交报备');
INSERT INTO `crm_todo` VALUES ('189', '243', '二次报备', '张树志', '张树志', '0', '11', '2016-03-12 06:25:24', '0', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=243&baoBeiId=9', '555', '提交申请');
INSERT INTO `crm_todo` VALUES ('190', '250', '二次报备', '王勇,', '张树志', '1', '0', '2016-03-12 06:41:15', '22', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=250&baoBeiId=10', '6666666666', 'SB001');
INSERT INTO `crm_todo` VALUES ('191', '250', '二次报备', '张树志', '王勇', '1', '0', '2016-03-12 06:42:05', '11', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=250&baoBeiId=10', '6666666666', '提交报备');
INSERT INTO `crm_todo` VALUES ('192', '250', '二次报备', '张树志', '张树志', '0', '11', '2016-03-12 06:42:55', '0', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=250&baoBeiId=10', '6666666666', '提交申请');
INSERT INTO `crm_todo` VALUES ('193', '200', '二次报备', '王勇,', '张树志', '1', '0', '2016-03-12 06:54:52', '22', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=200&baoBeiId=11', '江西长河世纪新电源有限公司1', 'SB001');
INSERT INTO `crm_todo` VALUES ('194', '200', '二次报备', '王勇,', '王勇', '0', '22', '2016-03-12 06:55:30', '0', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=200&baoBeiId=11', '江西长河世纪新电源有限公司1', '提交报备');
INSERT INTO `crm_todo` VALUES ('195', '242', '二次报备', '王勇,', '张树志', '1', '0', '2016-03-12 06:58:23', '22', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=242&baoBeiId=12', '444', 'SB001');
INSERT INTO `crm_todo` VALUES ('196', '242', '二次报备', '王勇,', '王勇', '0', '22', '2016-03-12 07:01:10', '0', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=242&baoBeiId=12', '444', '提交报备');
INSERT INTO `crm_todo` VALUES ('197', '392', '二次报备', '王勇,', '张树志', '1', '0', '2016-03-12 07:07:31', '22', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=392&baoBeiId=13', 'hhh', 'SB001');
INSERT INTO `crm_todo` VALUES ('198', '392', '二次报备', '张树志', '王勇', '1', '0', '2016-03-12 07:08:18', '11', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=392&baoBeiId=13', 'hhh', '提交报备');
INSERT INTO `crm_todo` VALUES ('199', '392', '二次报备', '张树志', '张树志', '0', '11', '2016-03-12 07:08:45', '0', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=392&baoBeiId=13', 'hhh', '提交申请');
INSERT INTO `crm_todo` VALUES ('200', '206', '二次报备', '王勇,', '张树志', '1', '0', '2016-03-12 07:18:01', '22', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=206&baoBeiId=14', '襄阳二二有限公司1', 'SB001');
INSERT INTO `crm_todo` VALUES ('201', '206', '二次报备', '张树志', '王勇', '1', '0', '2016-03-12 07:18:40', '11', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=206&baoBeiId=14', '襄阳二二有限公司1', '提交报备');
INSERT INTO `crm_todo` VALUES ('202', '206', '二次报备', '张树志', '张树志', '1', '0', '2016-03-12 07:19:05', '11', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=206&baoBeiId=14', '襄阳二二有限公司1', '提交申请');
INSERT INTO `crm_todo` VALUES ('203', '206', '二次报备', '张树志', '张树志', '1', '0', '2016-03-12 07:22:36', '11', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=206&baoBeiId=14', '襄阳二二有限公司1', '提交申请');
INSERT INTO `crm_todo` VALUES ('204', '206', '二次报备', '张树志', '张树志', '1', '0', '2016-03-12 07:31:02', '11', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=206&baoBeiId=14', '襄阳二二有限公司1', '提交申请');
INSERT INTO `crm_todo` VALUES ('205', '206', '二次报备', '王勇,', '张树志', '0', '11', '2016-03-12 07:36:37', '0', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=206&baoBeiId=14', '襄阳二二有限公司1', '提交申请');
INSERT INTO `crm_todo` VALUES ('206', '206', '二次报备', '王勇,', '张树志', '0', '11', '2016-03-12 07:37:47', '0', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=206&baoBeiId=14', '襄阳二二有限公司1', '提交申请');
INSERT INTO `crm_todo` VALUES ('207', '393', '二次报备', '王勇,', '张树志', '1', '0', '2016-03-12 07:45:15', '22', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=393&baoBeiId=15', 'tg', 'SB001');
INSERT INTO `crm_todo` VALUES ('208', '393', '二次报备', '张树志', '王勇', '1', '0', '2016-03-12 07:46:25', '11', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=393&baoBeiId=15', 'tg', '提交报备');
INSERT INTO `crm_todo` VALUES ('209', '393', '二次报备', '王勇,', '张树志', '1', '0', '2016-03-12 07:46:54', '22', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=393&baoBeiId=15', 'tg', '提交申请');
INSERT INTO `crm_todo` VALUES ('210', '393', '二次报备', '张树志', '王勇', '0', '22', '2016-03-12 07:52:53', '0', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=393&baoBeiId=15', 'tg', '流程结束');
INSERT INTO `crm_todo` VALUES ('211', '217', '二次报备', '王勇,', '张树志', '0', '11', '2016-03-14 06:43:43', '0', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=217&baoBeiId=16', '江西省医学科学研究所1', 'SB001');
INSERT INTO `crm_todo` VALUES ('212', '217', '二次报备', '王勇,', '张树志', '0', '11', '2016-03-14 06:43:50', '0', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=217&baoBeiId=16', '江西省医学科学研究所1', '提交申请');
INSERT INTO `crm_todo` VALUES ('213', '218', '二次报备', '王勇,', '张树志', '0', '11', '2016-03-14 07:38:02', '0', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=218&baoBeiId=17', '南昌第一附属医院1', 'SB001');
INSERT INTO `crm_todo` VALUES ('214', '148', '二次报备', '王勇,', '张树志', '0', '11', '2016-03-14 07:39:31', '0', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=148&baoBeiId=18', '北京日月驰信息技术', 'SB001');
INSERT INTO `crm_todo` VALUES ('215', '148', '二次报备', '王勇,', '张树志', '0', '11', '2016-03-14 07:39:37', '0', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=148&baoBeiId=18', '北京日月驰信息技术', '提交申请');
INSERT INTO `crm_todo` VALUES ('216', '390', '二次报备', '王勇,', '张树志', '0', '11', '2016-03-14 07:40:35', '0', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=390&baoBeiId=19', 'ffff', 'SB001');
INSERT INTO `crm_todo` VALUES ('217', '390', '二次报备', '王勇,', '张树志', '0', '11', '2016-03-14 07:40:40', '0', null, '/crm/jsp/flow/crmFlowMarketBaoBei2Action!input.action?batchId=390&baoBeiId=19', 'ffff', '提交申请');
INSERT INTO `crm_todo` VALUES ('219', '244', '初访', '王勇,', '张树志', '0', '11', '2016-03-17 07:21:21', '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=244&approveState=null&isNeedAssisient=', '666', '市场经理初访审批');
INSERT INTO `crm_todo` VALUES ('221', '251', '初访', '王勇,', '张树志', '0', '11', '2016-03-23 06:50:48', '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=251', '5555555', '市场经理初访审批');
INSERT INTO `crm_todo` VALUES ('222', '201', '初访', '王勇,', '张树志', '0', '11', '2016-03-23 07:07:25', '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=201', '湖南长思食品有限公司1', '市场经理初访审批');
INSERT INTO `crm_todo` VALUES ('223', '216', '初访', '王勇,', '张树志', '0', '11', '2016-03-23 07:13:10', '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=216', '湖北康康药业有限公司1', '市场经理初访审批');
INSERT INTO `crm_todo` VALUES ('224', '182', '初访', '王勇,', '张树志', '0', '11', '2016-03-23 07:22:54', '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=182', '湖南思念食品有限公司1', '市场经理初访审批');
INSERT INTO `crm_todo` VALUES ('225', '182', '初访', '王勇,', '张树志', '0', '11', '2016-03-23 07:22:58', '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=182', '湖南思念食品有限公司1', '市场经理初访审批');
INSERT INTO `crm_todo` VALUES ('226', '182', '初访', '王勇,', '张树志', '0', '11', '2016-03-23 07:23:48', '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=182', '湖南思念食品有限公司1', '市场经理初访审批');
INSERT INTO `crm_todo` VALUES ('227', '204', '初访', '王勇,', '张树志', '0', '11', '2016-03-23 07:42:51', '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=204', '中国石化化工股份有限公司江宁分公司1', '市场经理初访审批');
INSERT INTO `crm_todo` VALUES ('228', '204', '初访', '王勇,', '张树志', '0', '11', '2016-03-23 07:42:58', '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=204', '中国石化化工股份有限公司江宁分公司1', '市场经理初访审批');
INSERT INTO `crm_todo` VALUES ('229', null, '初访', '王勇,', '张树志', '0', '11', '2016-03-23 07:49:01', '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=null', 'ztq', '销售人员提交初审');
INSERT INTO `crm_todo` VALUES ('230', null, '初访', '王勇,', '张树志', '0', '11', '2016-03-23 07:49:09', '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=null', 'ztq', '销售人员提交初审');
INSERT INTO `crm_todo` VALUES ('231', null, '初访', '王勇,', '张树志', '0', '11', '2016-03-23 07:49:30', '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=null', 'ztq', '销售人员提交初审');
INSERT INTO `crm_todo` VALUES ('232', null, '初访', '王勇,', '张树志', '0', '11', '2016-03-23 07:50:15', '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=null', 'ztq', '销售人员提交初审');
INSERT INTO `crm_todo` VALUES ('233', null, '初访', '王勇,', '张树志', '0', '11', '2016-03-23 07:50:20', '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=null', 'ztq', '销售人员提交初审');
INSERT INTO `crm_todo` VALUES ('234', '424', '初访', '王勇,', '张树志', '0', '11', '2016-03-24 06:51:15', '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=424', 'bbbccc', '市场经理初访审批');
INSERT INTO `crm_todo` VALUES ('235', '424', '初访', '王勇,', '张树志', '0', '11', '2016-03-24 06:51:25', '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=424', 'bbbccc', '市场经理初访审批');
INSERT INTO `crm_todo` VALUES ('236', '424', '初访', '王勇,', '张树志', '0', '11', '2016-03-24 06:53:32', '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=424', 'bbbccc', '市场经理初访审批');
INSERT INTO `crm_todo` VALUES ('237', '424', '初访', '王勇,', '张树志', '0', '11', '2016-03-24 07:09:37', '0', null, '/crm/jsp/flow/crmFlowMarketAction!input.action?batchId=424', 'bbbccc', '市场经理初访审批');

-- ----------------------------
-- Table structure for `crm_zixun_service`
-- ----------------------------
DROP TABLE IF EXISTS `crm_zixun_service`;
CREATE TABLE `crm_zixun_service` (
  `zixun_service_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '咨询服务编号',
  `batch_id` int(11) DEFAULT NULL COMMENT '批次编号',
  `xixunshi` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '咨询师',
  `diaoyang_wancheng_time` date DEFAULT NULL COMMENT '现场调研完成时间',
  `nengli_yanzheng_wancheng_time` date DEFAULT NULL COMMENT '能力验证完成时间',
  `shenqing_submit_time` date DEFAULT NULL COMMENT '申请材料提交时间',
  `xianchang_pingshen_time` date DEFAULT NULL COMMENT '现场评审时间',
  `file_send_wancheng_time` date DEFAULT NULL COMMENT '文件发布完成时间',
  `neishen_wancheng_time` date DEFAULT NULL COMMENT '内审完成时间',
  `wenshenchu_yijian_time` date DEFAULT NULL COMMENT '文审出意见时间',
  `xianchangpingshen_wancheng_time` date DEFAULT NULL COMMENT '现场评审通过时间',
  `xingneng_yanzheng_wancheng_time` date DEFAULT NULL COMMENT '性能验证完成时间',
  `guanshen_wancheng_time` date DEFAULT NULL COMMENT '管审完成时间',
  `wenshen_zhenggai_submit_time` date DEFAULT NULL COMMENT '文审整改提交时间',
  `createBy` int(11) DEFAULT '0' COMMENT '建创人',
  `createDate` datetime DEFAULT NULL COMMENT '建创日期',
  `updateBy` int(11) DEFAULT '0' COMMENT '新更人',
  `updateDate` int(11) DEFAULT NULL COMMENT '新更日期',
  PRIMARY KEY (`zixun_service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of crm_zixun_service
-- ----------------------------
INSERT INTO `crm_zixun_service` VALUES ('1', '1001', 'zixunshi01', '2016-01-01', '2016-01-01', '2016-01-01', '2016-01-01', '2016-01-01', '2016-01-01', '2016-01-01', '2016-01-01', '2016-01-01', '2016-01-01', '2016-01-01', '0', '2016-01-23 00:00:00', '0', null);

-- ----------------------------
-- Table structure for `flow_approve`
-- ----------------------------
DROP TABLE IF EXISTS `flow_approve`;
CREATE TABLE `flow_approve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `operator` varchar(200) DEFAULT NULL,
  `operate_Time` datetime DEFAULT NULL,
  `opt_result` varchar(200) DEFAULT NULL,
  `opt_content` varchar(2000) DEFAULT NULL,
  `task_Name` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_approve
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_ccorder`
-- ----------------------------
DROP TABLE IF EXISTS `flow_ccorder`;
CREATE TABLE `flow_ccorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT '流程实例编号',
  `actor_id` varchar(200) DEFAULT NULL COMMENT '执行人',
  `creator` varchar(200) DEFAULT NULL COMMENT '建创人',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `finishTime` datetime DEFAULT NULL COMMENT '完成时间',
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='流程抄送';

-- ----------------------------
-- Records of flow_ccorder
-- ----------------------------
INSERT INTO `flow_ccorder` VALUES ('1', '5', 'admin', 'sysadmin', '2017-03-11 13:01:55', null, '1');
INSERT INTO `flow_ccorder` VALUES ('2', '5', 'admin', 'sysadmin', '2017-03-11 13:02:00', null, '1');
INSERT INTO `flow_ccorder` VALUES ('3', '5', 'admin', 'sysadmin', '2017-03-11 13:02:01', null, '1');

-- ----------------------------
-- Table structure for `flow_leave_test`
-- ----------------------------
DROP TABLE IF EXISTS `flow_leave_test`;
CREATE TABLE `flow_leave_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_dates` int(11) DEFAULT NULL,
  `LEAVE_MEM` varchar(200) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_leave_test
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_order`
-- ----------------------------
DROP TABLE IF EXISTS `flow_order`;
CREATE TABLE `flow_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_NO` varchar(200) DEFAULT NULL,
  `ORDER_VERSION` int(11) DEFAULT NULL,
  `FLOW_PROCESS_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `parent_Node_Name` varchar(200) DEFAULT NULL,
  `expire_time` datetime DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `variable` varchar(3000) DEFAULT NULL,
  `create_By` int(11) DEFAULT NULL,
  `create_By_UName` varchar(200) DEFAULT NULL,
  `create_Date` datetime DEFAULT NULL,
  `update_By` int(11) DEFAULT NULL,
  `update_By_Uname` varchar(200) DEFAULT NULL,
  `update_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_order
-- ----------------------------
INSERT INTO `flow_order` VALUES ('5', '20170311-10:31:19-292-281', null, '11', null, null, null, null, '{\"taskId\":\"\",\"apply.operator\":\"sysadmin\",\"approveBoss.operator\":\"sysadmin\",\"approveDept.operator\":\"sysadmin\",\"submit\":\"提交\",\"processId\":\"11\",\"reason\":\"5r\",\"day\":5,\"orderId\":\"\"}', null, 'sysadmin', '2017-03-11 10:31:19', null, 'sysadmin', '2017-03-11 01:01:28');
INSERT INTO `flow_order` VALUES ('8', '20170315-09:03:58-980-94', null, '20', null, null, null, null, '{\"task1.operator\":[\"admin管理员\"]}', null, '2', '2017-03-15 09:03:58', null, null, null);
INSERT INTO `flow_order` VALUES ('9', '20170315-09:04:32-234-534', null, '22', null, null, null, null, '{\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 09:04:32', null, null, null);
INSERT INTO `flow_order` VALUES ('17', '20170315-09:32:54-589-581', null, '42', null, null, null, null, '{}', null, null, '2017-03-15 09:32:54', null, null, null);
INSERT INTO `flow_order` VALUES ('19', '20170315-09:33:48-015-636', null, '44', null, null, null, null, '{}', null, '2', '2017-03-15 09:33:48', null, null, null);
INSERT INTO `flow_order` VALUES ('20', '20170315-09:41:03-288-209', null, '53', null, null, null, null, '{\"task1.operator\":[\"role1\"]}', null, '2', '2017-03-15 09:41:03', null, null, null);
INSERT INTO `flow_order` VALUES ('21', '20170315-09:47:16-024-56', null, '54', null, null, null, null, '{\"task1.operator\":[\"role1\"]}', null, '2', '2017-03-15 09:47:16', null, null, null);
INSERT INTO `flow_order` VALUES ('23', '20170315-10:06:06-174-411', null, '57', null, null, null, null, '{\"task1.operator\":[\"role1\"]}', null, '2', '2017-03-15 10:06:06', null, null, null);
INSERT INTO `flow_order` VALUES ('24', '20170315-10:09:02-768-541', null, '58', null, null, null, null, '{\"task1.operator\":[\"role1\"]}', null, '2', '2017-03-15 10:09:02', null, null, null);
INSERT INTO `flow_order` VALUES ('26', '20170315-10:09:44-314-712', null, '60', null, null, null, null, '{\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 10:09:44', null, null, null);
INSERT INTO `flow_order` VALUES ('29', '20170315-11:47:50-455-681', null, '65', null, null, null, null, '{}', null, null, '2017-03-15 11:47:50', null, null, null);
INSERT INTO `flow_order` VALUES ('30', '20170315-11:48:17-419-45', null, '66', null, null, null, null, '{}', null, null, '2017-03-15 11:48:17', null, null, null);
INSERT INTO `flow_order` VALUES ('31', '20170315-11:48:35-324-262', null, '67', null, null, null, null, '{}', null, null, '2017-03-15 11:48:35', null, null, null);
INSERT INTO `flow_order` VALUES ('32', '20170315-11:59:09-541-110', null, '68', null, null, null, null, '{\"task1.expireTime\":null,\"task1.reminderTime\":null,\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 11:59:09', null, null, null);
INSERT INTO `flow_order` VALUES ('33', '20170315-12:54:43-580-478', null, '69', null, null, null, null, '{\"task1.expireTime\":null,\"task1.reminderTime\":null,\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 12:54:43', null, null, null);
INSERT INTO `flow_order` VALUES ('34', '20170315-12:55:28-648-351', null, '70', null, null, null, null, '{\"task1.expireTime\":null,\"task1.reminderTime\":null,\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 12:55:28', null, null, null);
INSERT INTO `flow_order` VALUES ('35', '20170315-12:59:32-653-766', null, '71', null, null, null, null, '{\"task1.expireTime\":null,\"task1.reminderTime\":null,\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 12:59:32', null, null, null);
INSERT INTO `flow_order` VALUES ('36', '20170315-13:06:40-187-350', null, '72', null, null, null, null, '{\"task1.expireTime\":null,\"task1.reminderTime\":null,\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 01:06:40', null, null, null);
INSERT INTO `flow_order` VALUES ('37', '20170315-13:17:41-749-429', null, '73', null, null, null, null, '{\"task1.expireTime\":null,\"task1.reminderTime\":null,\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 01:17:41', null, null, null);
INSERT INTO `flow_order` VALUES ('38', '20170315-13:18:37-945-225', null, '74', null, null, null, null, '{\"task1.expireTime\":\"2017-03-15 00:00:00\",\"task1.reminderTime\":\"2017-03-15 13:00:00\",\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 01:18:37', null, null, null);
INSERT INTO `flow_order` VALUES ('39', '20170315-13:20:25-980-63', null, '75', null, null, null, null, '{\"task1.expireTime\":\"2017-03-15 00:00:00\",\"task1.reminderTime\":\"2017-03-15 13:00:00\",\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 01:20:25', null, null, null);
INSERT INTO `flow_order` VALUES ('40', '20170315-13:21:18-956-444', null, '76', null, null, null, null, '{\"task1.expireTime\":\"2017-03-15 00:00:00\",\"task1.reminderTime\":\"2017-03-15 13:00:00\",\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 01:21:18', null, null, null);
INSERT INTO `flow_order` VALUES ('41', '20170315-13:24:07-089-588', null, '77', null, null, null, null, '{\"task1.expireTime\":\"2017-03-15 00:00:00\",\"task1.reminderTime\":\"2017-03-15 13:00:00\",\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 01:24:07', null, null, null);
INSERT INTO `flow_order` VALUES ('42', '20170315-13:27:23-090-492', null, '78', null, null, null, null, '{\"task1.expireTime\":{\"date\":15,\"day\":3,\"hours\":0,\"minutes\":0,\"month\":2,\"seconds\":0,\"time\":1489507200000,\"timezoneOffset\":-480,\"year\":117},\"task1.reminderTime\":{\"date\":15,\"day\":3,\"hours\":10,\"minutes\":0,\"month\":2,\"seconds\":0,\"time\":1489543200000,\"timezoneOffset\":-480,\"year\":117},\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 01:27:23', null, null, null);
INSERT INTO `flow_order` VALUES ('43', '20170315-13:29:05-286-294', null, '79', null, null, null, null, '{\"task1.expireTime\":{\"date\":15,\"day\":3,\"hours\":0,\"minutes\":0,\"month\":2,\"seconds\":0,\"time\":1489507200000,\"timezoneOffset\":-480,\"year\":117},\"task1.reminderTime\":{\"date\":15,\"day\":3,\"hours\":10,\"minutes\":0,\"month\":2,\"seconds\":0,\"time\":1489543200000,\"timezoneOffset\":-480,\"year\":117},\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 01:29:05', null, null, null);
INSERT INTO `flow_order` VALUES ('45', '20170315-13:30:46-467-597', null, '80', null, null, null, null, '{\"task1.operator\":[\"admin管理员\"]}', null, '2', '2017-03-15 01:30:46', null, null, null);
INSERT INTO `flow_order` VALUES ('46', '20170315-13:31:14-260-21', null, '80', null, null, null, null, '{\"task1.operator\":[\"admin管理员\"]}', null, '2', '2017-03-15 01:31:14', null, null, null);
INSERT INTO `flow_order` VALUES ('47', '20170315-13:32:00-456-342', null, '80', null, null, null, null, '{\"task1.operator\":[\"admin管理员\"]}', null, '2', '2017-03-15 01:32:00', null, null, null);
INSERT INTO `flow_order` VALUES ('48', '20170315-13:34:25-206-85', null, '86', null, null, null, null, '{\"task2.operator\":[\"1\"],\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 01:34:25', null, '1', '2017-03-15 01:34:25');
INSERT INTO `flow_order` VALUES ('52', '20170315-13:36:24-808-991', null, '91', null, null, null, null, '{\"content\":250,\"task2.operator\":[\"1\"],\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 01:36:24', null, null, null);
INSERT INTO `flow_order` VALUES ('53', '20170315-13:36:52-736-209', null, '92', null, null, null, null, '{\"content\":\"toTask2\",\"task2.operator\":[\"1\"]}', null, '2', '2017-03-15 01:36:52', null, null, null);
INSERT INTO `flow_order` VALUES ('54', '20170315-13:37:32-489-741', null, '93', null, null, null, null, '{\"content\":250,\"task2.operator\":[\"1\"],\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 01:37:32', null, null, null);
INSERT INTO `flow_order` VALUES ('55', '20170315-13:39:06-307-836', null, '94', null, null, null, null, '{\"content\":250,\"task2.operator\":[\"1\"],\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 01:39:06', null, null, null);
INSERT INTO `flow_order` VALUES ('56', '20170315-13:44:02-707-640', null, '95', null, null, null, null, '{\"content\":250,\"task2.operator\":[\"1\"],\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 01:44:02', null, null, null);
INSERT INTO `flow_order` VALUES ('57', '20170315-14:39:26-634-937', null, '96', null, null, null, null, '{\"content\":250,\"task2.operator\":[\"1\"],\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 02:39:26', null, null, null);
INSERT INTO `flow_order` VALUES ('58', '20170315-14:41:23-576-690', null, '97', null, null, null, null, '{\"content\":250,\"task2.operator\":[\"1\"],\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 02:41:23', null, null, null);
INSERT INTO `flow_order` VALUES ('59', '20170315-14:42:06-296-775', null, '98', null, null, null, null, '{\"content\":250,\"task2.operator\":[\"1\"],\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 02:42:06', null, null, null);
INSERT INTO `flow_order` VALUES ('60', '20170315-14:42:26-810-764', null, '99', null, null, null, null, '{\"content\":250,\"task2.operator\":[\"1\"],\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 02:42:26', null, null, null);
INSERT INTO `flow_order` VALUES ('61', '20170315-14:42:42-167-601', null, '100', null, null, null, null, '{\"content\":\"toTask2\",\"task2.operator\":[\"1\"]}', null, '2', '2017-03-15 02:42:42', null, null, null);
INSERT INTO `flow_order` VALUES ('62', '20170315-14:43:19-210-855', null, '101', null, null, null, null, '{\"content\":\"toTask2\",\"task2.operator\":[\"1\"]}', null, '2', '2017-03-15 02:43:19', null, null, null);
INSERT INTO `flow_order` VALUES ('63', '20170315-14:43:45-813-491', null, '102', null, null, null, null, '{\"content\":\"toTask2\",\"task2.operator\":[\"1\"]}', null, '2', '2017-03-15 02:43:45', null, null, null);
INSERT INTO `flow_order` VALUES ('64', '20170315-14:44:30-417-978', null, '103', null, null, null, null, '{\"content\":250,\"task2.operator\":[\"1\"],\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 02:44:30', null, null, null);
INSERT INTO `flow_order` VALUES ('65', '20170315-14:45:25-179-641', null, '104', null, null, null, null, '{\"content\":\"250\",\"task2.operator\":[\"1\"],\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 02:45:25', null, null, null);
INSERT INTO `flow_order` VALUES ('66', '20170315-14:47:33-573-829', null, '105', null, null, null, null, '{\"content\":\"toTask3\",\"task2.operator\":[\"1\"],\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 02:47:33', null, null, null);
INSERT INTO `flow_order` VALUES ('67', '20170315-14:48:02-907-583', null, '106', null, null, null, null, '{\"content\":\"toTask2\",\"task2.operator\":[\"1\"]}', null, '2', '2017-03-15 02:48:02', null, null, null);
INSERT INTO `flow_order` VALUES ('68', '20170315-14:48:09-901-572', null, '107', null, null, null, null, '{\"content\":250,\"task2.operator\":[\"1\"],\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 02:48:09', null, null, null);
INSERT INTO `flow_order` VALUES ('69', '20170315-14:48:22-658-966', null, '108', null, null, null, null, '{\"content\":\"toTask3\",\"task2.operator\":[\"1\"],\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 02:48:22', null, null, null);
INSERT INTO `flow_order` VALUES ('70', '20170315-14:48:44-380-493', null, '109', null, null, null, null, '{\"task1.expireTime\":{\"date\":15,\"day\":3,\"hours\":0,\"minutes\":0,\"month\":2,\"seconds\":0,\"time\":1489507200000,\"timezoneOffset\":-480,\"year\":117},\"task1.reminderTime\":{\"date\":15,\"day\":3,\"hours\":10,\"minutes\":0,\"month\":2,\"seconds\":0,\"time\":1489543200000,\"timezoneOffset\":-480,\"year\":117},\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 02:48:44', null, null, null);
INSERT INTO `flow_order` VALUES ('73', '20170315-14:49:35-142-694', null, '112', null, null, null, null, '{}', null, null, '2017-03-15 02:49:35', null, null, null);
INSERT INTO `flow_order` VALUES ('74', '20170315-14:50:53-582-384', null, '114', null, null, null, null, '{}', null, null, '2017-03-15 02:50:53', null, '1', '2017-03-15 02:50:53');
INSERT INTO `flow_order` VALUES ('76', '20170315-14:51:54-526-487', null, '116', null, null, null, null, '{}', null, '2', '2017-03-15 02:51:54', null, null, null);
INSERT INTO `flow_order` VALUES ('77', '20170315-14:52:31-531-984', null, '118', null, null, null, null, '{\"task1.operator\":[\"role1\"]}', null, '2', '2017-03-15 02:52:31', null, null, null);
INSERT INTO `flow_order` VALUES ('79', '20170315-14:53:18-750-613', null, '120', null, null, null, null, '{\"task1.operator\":[\"1\"]}', null, '2', '2017-03-15 02:53:18', null, null, null);
INSERT INTO `flow_order` VALUES ('80', 'f5830c1fd31a4b1aa799762e3ef5bc0b', null, '124', null, null, null, null, '{\"task1.operator\":[\"1\"]}', null, '2', '2017-03-16 09:44:36', null, null, null);
INSERT INTO `flow_order` VALUES ('81', '20170316-09:45:28-417-835', null, '120', null, null, null, null, '{\"task1.operator\":[\"1\"]}', null, '2', '2017-03-16 09:45:28', null, null, null);

-- ----------------------------
-- Table structure for `flow_order_hist`
-- ----------------------------
DROP TABLE IF EXISTS `flow_order_hist`;
CREATE TABLE `flow_order_hist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_NO` varchar(200) DEFAULT NULL,
  `ORDER_VERSION` int(11) DEFAULT NULL,
  `FLOW_PROCESS_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `parent_Node_Name` varchar(2000) DEFAULT NULL,
  `expire_time` datetime DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `variable` varchar(3000) DEFAULT NULL,
  `create_By` int(11) DEFAULT NULL,
  `create_By_UName` varchar(200) DEFAULT NULL,
  `create_Date` datetime DEFAULT NULL,
  `update_By` int(11) DEFAULT NULL,
  `update_By_Uname` varchar(200) DEFAULT NULL,
  `update_Date` datetime DEFAULT NULL,
  `end_Time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_order_hist
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_process`
-- ----------------------------
DROP TABLE IF EXISTS `flow_process`;
CREATE TABLE `flow_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `FLOW_NO` varchar(200) DEFAULT NULL,
  `FLOW_VERSION` int(11) DEFAULT NULL,
  `FLOW_NAME` varchar(200) DEFAULT NULL,
  `DISPLAY_NAME` varchar(200) DEFAULT NULL,
  `FLOW_TYPE` varchar(200) DEFAULT NULL,
  `FLOW_CONTENT` text,
  `create_By` int(11) DEFAULT NULL,
  `create_By_UName` varchar(200) DEFAULT NULL,
  `create_Date` datetime DEFAULT NULL,
  `update_By` int(11) DEFAULT NULL,
  `update_By_Uname` varchar(200) DEFAULT NULL,
  `update_Date` datetime DEFAULT NULL,
  `enable_Flag` varchar(20) DEFAULT NULL,
  `lock_Status` varchar(20) DEFAULT NULL,
  `instance_Url` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_process
-- ----------------------------
INSERT INTO `flow_process` VALUES ('11', '2aeacfb10f5c4438b85ae2c54ce6b10d', '5', 'leave', '请假流程测试', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<process name=\"leave\" displayName=\"请假流程测试\" instanceUrl=\"/jsp/flows/flowControllerAction!all.action\" >\n<start layout=\"24,124,50,50\" name=\"start1\" displayName=\"start1\" >\n<transition offset=\"0,0\" to=\"apply\" name=\"transition1\" />\n</start>\n<end layout=\"570,124,50,50\" name=\"end1\" displayName=\"end1\" >\n</end>\n<task layout=\"117,122,100,50\" name=\"apply\" displayName=\"请假申请\" form=\"/jsp/flowLeaveTest/flowLeaveTestAction!apply.action\" assignee=\"apply.operator\" taskType=\"Major\" performType=\"ANY\" >\n<transition offset=\"0,0\" to=\"approveDept\" name=\"transition2\" />\n</task>\n<task layout=\"272,122,100,50\" name=\"approveDept\" displayName=\"部门经理审批\" form=\"/jsp/flowLeaveTest/flowLeaveTestAction!approveDept.action\" assignee=\"approveDept.operator\" taskType=\"Major\" performType=\"ANY\" >\n<transition offset=\"0,0\" to=\"decision1\" name=\"transition3\" />\n</task>\n<decision layout=\"426,124,50,50\" name=\"decision1\" expr=\"#day &gt; 2 ? \'transition5\' : \'transition4\'\" displayName=\"decision1\" >\n<transition offset=\"0,0\" to=\"end1\" name=\"transition4\" displayName=\"&lt;=2天\" />\n<transition offset=\"0,0\" to=\"approveBoss\" name=\"transition5\" displayName=\"&gt;2天\" />\n</decision>\n<task layout=\"404,231,100,50\" name=\"approveBoss\" displayName=\"总经理审批\" form=\"/jsp/flowLeaveTest/flowLeaveTestAction!approveBoss.action\" assignee=\"approveBoss.operator\" taskType=\"Major\" performType=\"ANY\" >\n<transition offset=\"0,0\" to=\"end1\" name=\"transition6\" />\n</task>\n</process>', null, 'sysadmin', '2017-03-06 03:37:56', null, null, '2017-03-11 09:39:33', '', '1', '/jsp/flows/flowControllerAction!all.action');
INSERT INTO `flow_process` VALUES ('16', '76f701820b8443d987150a7e661705a9', '5', 'simple', '测试简单流程', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<process name=\"simple\" displayName=\"测试简单流程\" expireTime=\"2017-03-20\" instanceUrl=\"/jsp/flows/flowControllerAction!all.action\" >\n<start layout=\"64,83,50,50\" name=\"start1\" displayName=\"start1\" >\n<transition offset=\"0,0\" to=\"task1\" name=\"transition1\" />\n</start>\n<task layout=\"277,88,100,50\" name=\"task1\" displayName=\"task1\" form=\"http://www.baidu.com\" assignee=\"task1.operator\" taskType=\"Major\" performType=\"ANY\" >\n<transition offset=\"0,0\" to=\"end1\" name=\"transition2\" />\n</task>\n<end layout=\"585,89,50,50\" name=\"end1\" displayName=\"end1\" >\n</end>\n</process>', null, 'sysadmin', '2017-03-06 03:57:14', null, null, '2017-03-06 04:48:48', '', '1', '/jsp/flows/flowControllerAction!all.action');
INSERT INTO `flow_process` VALUES ('17', '1e4d1d17b2ed424aaecfa66d52970391', '2', 'test', 'test', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<process name=\"test\" displayName=\"test\" >\n<start layout=\"161,139,50,50\" name=\"start\" >\n<transition offset=\"0,-10\" to=\"rect3\" name=\"transaction1\" displayName=\"path4\" />\n</start>\n<end layout=\"132,376,50,50\" name=\"end\" >\n</end>\n<task layout=\"127,262,100,50\" name=\"rect3\" displayName=\"rect3\" >\n<transition offset=\"0,-10\" to=\"end\" name=\"transaction2\" displayName=\"path5\" />\n</task>\n</process>', null, 'sysadmin', '2017-03-06 05:24:28', null, null, '2017-03-11 09:40:43', '', '1', null);
INSERT INTO `flow_process` VALUES ('18', 'a38b65774aa84caa84db62e041d0eb19', '1', 'test2', '流程测试02', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<process name=\"test2\" displayName=\"流程测试02\" expireTime=\"2017-03-20\" >\n<start layout=\"168,85,50,50\" name=\"start\" >\n<transition offset=\"0,-10\" to=\"rect3\" name=\"path4\" displayName=\"path4\" />\n</start>\n<end layout=\"185,347,50,50\" name=\"end\" >\n</end>\n<task layout=\"145,207,100,50\" name=\"rect3\" displayName=\"rect3\" form=\"/form1/app1.test\" >\n<transition offset=\"0,-10\" to=\"end\" name=\"path5\" displayName=\"path5\" />\n</task>\n</process>', null, 'sysadmin', '2017-03-07 09:36:35', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('19', '2db207913a164d5a8c0274e53cc38a5a', '1', 'generator', '测试实例编号自定义', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试实例编号自定义\" instanceNoClass=\"com.lj.app.core.common.flows.CustomNoGenerator\" name=\"generator\">\r\n<start displayName=\"start1\" layout=\"86,143,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"463,143,-1,-1\" name=\"end1\"/>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"253,141,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 09:02:59', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('20', '100ff6c41ae343ae9257d823e46d2348', '6', 'simple', '测试简单流程', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试简单流程\" name=\"simple\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 09:03:43', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('21', 'd2afb891b71e48bba109ef65dd7525b1', '6', 'leave', '请假流程测试', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n\r\n<process displayName=\"请假流程测试\" instanceUrl=\"/jsp/flows/flowControllerAction!all.action\" name=\"leave\">\r\n<start displayName=\"start1\" layout=\"24,124,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"apply\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"570,124,-1,-1\" name=\"end1\"/>\r\n<task assignee=\"apply.operator\" displayName=\"请假申请\" form=\"/jsp/flowLeaveTest/flowLeaveTestAction!apply.action\" layout=\"117,122,-1,-1\" name=\"apply\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"approveDept\"/>\r\n</task>\r\n<task assignee=\"approveDept.operator\" displayName=\"部门经理审批\" form=\"/jsp/flowLeaveTest/flowLeaveTestAction!approveDept.action\" layout=\"272,122,-1,-1\" name=\"approveDept\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition3\" offset=\"0,0\" to=\"decision1\"/>\r\n</task>\r\n<decision displayName=\"decision1\" expr=\"#day &gt; 2 ? \'transition5\' : \'transition4\'\" layout=\"426,124,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"&lt;=2天\" g=\"\" name=\"transition4\" offset=\"0,0\" to=\"end1\"/>\r\n<transition displayName=\"&gt;2天\" g=\"\" name=\"transition5\" offset=\"0,0\" to=\"approveBoss\"/>\r\n</decision>\r\n<task assignee=\"approveBoss.operator\" displayName=\"总经理审批\" form=\"/jsp/flowLeaveTest/flowLeaveTestAction!approveBoss.action\" layout=\"404,231,-1,-1\" name=\"approveBoss\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>\r\n', null, null, '2017-03-15 09:03:58', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('22', '5be7d59ac8a84473a8ca155ba5e274da', '7', 'simple', '测试简单流程', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试简单流程\" name=\"simple\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 09:04:32', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('23', '8130dc59fed34b7aa63261d81c9c3091', '1', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 09:04:52', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('24', '343f4a22eaa24d3b9be7d53e87f067f4', '2', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 09:05:15', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('25', '3c7bd1d125fd47448386debcbce06433', '3', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 09:05:58', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('26', '11125e6bc2294f83a47765495e3926aa', '4', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 09:06:56', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('27', 'a6323959aaeb49fd852bdc6536422b4f', '5', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 09:07:48', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('28', '88904ffc60c34e4493b1602525705cb9', '6', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 09:08:52', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('29', 'bb4c60f3ca6c445ca96b3db11fd376da', '7', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 09:11:19', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('30', '1e10ac2b4f3448bc8ab8ef2fda2f15d5', '8', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 09:12:10', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('31', '39cb03ac4e614264bd2165f094dcc171', '9', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 09:13:27', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('32', '0d9ac83f67824194a0aea9f541a9687a', '10', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 09:13:44', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('33', 'afb3ababd29142338240f0c6ed89481d', '11', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 09:15:13', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('34', 'f017cea180c74619976d5c751631933d', '12', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 09:16:16', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('35', 'b5f3732d2c084ce291ac676f7e1462d4', '13', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 09:16:43', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('36', '5f736eef94db4d4399eb941253f7da0b', '14', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 09:17:21', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('37', '419c604ebacc45f99588292042ea58fc', '15', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 09:20:03', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('38', 'f57a1ff3cf8e4e31bafcb4a528ae3ae9', '16', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 09:22:07', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('39', 'aca4de24bf534116a50a2024be562b68', '17', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 09:22:21', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('40', 'a855e1dc03774b24a57c05672f7afdc4', '18', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 09:23:28', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('41', '22727cc8da314680b24f6470f7f923ce', '1', 'assignmenthandler', '测试编码设置参与者', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试编码设置参与者\" name=\"assignmenthandler\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignmentHandler=\"com.lj.app.core.common.flows.task.assignmenthandler.TaskAssign\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 09:31:29', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('42', '21723dd7861c4851b2ca97c51717456a', '2', 'assignmenthandler', '测试编码设置参与者', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试编码设置参与者\" name=\"assignmenthandler\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignmentHandler=\"com.lj.app.core.common.flows.task.assignmenthandler.TaskAssign\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 09:32:54', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('43', '033a01a0064240b286081b87195401a2', '3', 'assignmenthandler', '测试编码设置参与者', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试编码设置参与者\" name=\"assignmenthandler\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignmentHandler=\"com.lj.app.core.common.flows.task.assignmenthandler.TaskAssign\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 09:33:22', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('44', 'f17d1f65dffc499e93d21c70b70b6bc4', '1', 'config', '测试预配置参与者', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试预配置参与者\" name=\"config\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"aaaa,bbbb\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 09:33:47', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('45', '98e65ce80db54335b4fb3a423a72b04e', '1', 'field', '测试字段模型', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试字段模型\" name=\"field\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n    <field displayName=\"申请人\" layout=\"230,51,201,22\" name=\"applyUser\" type=\"String\">\r\n        <attr name=\"defaultValue\" value=\"\"/>\r\n        <attr name=\"controlType\" value=\"TextField\"/>\r\n        <attr name=\"lineBR\" value=\"false\"/>\r\n        <attr name=\"placeholder\" value=\"1\"/>\r\n        <attr name=\"isHref\" value=\"false\"/>\r\n        <attr name=\"readonly\" value=\"false\"/>\r\n        <attr name=\"isNeed\" value=\"false\"/>\r\n        <attr name=\"isKey\" value=\"false\"/>\r\n        <attr name=\"visible\" value=\"true\"/>\r\n    </field>\r\n    <transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 09:34:02', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('46', '0e290ae5e73e4cadae1462a4f796ba49', '1', 'group', '测试组参与者', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试组参与者\" name=\"group\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 09:34:23', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('47', '052b519b85684bbebfb3822ef55b16ef', '2', 'group', '测试组参与者', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试组参与者\" name=\"group\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 09:36:03', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('48', '853c2c67043443db8f2ee2ea0bd08760', '3', 'group', '测试组参与者', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试组参与者\" name=\"group\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 09:36:32', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('49', '06aaf7a90aa34b2592a057e4e202ecc9', '4', 'group', '测试组参与者', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试组参与者\" name=\"group\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 09:37:06', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('50', '7c4abfc7a73e4858bd5de10b2576c8f1', '5', 'group', '测试组参与者', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试组参与者\" name=\"group\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 09:37:56', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('51', '7ca4901c110a48229462e2843afd3e99', '6', 'group', '测试组参与者', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试组参与者\" name=\"group\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 09:39:37', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('52', '94a921dfcc4e4079b7e7015ec4ec5fbc', '7', 'group', '测试组参与者', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试组参与者\" name=\"group\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 09:40:19', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('53', 'ee96c3dc77a54b0fb02c8827902a9849', '8', 'group', '测试组参与者', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试组参与者\" name=\"group\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 09:40:46', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('54', '00753acb81e641c384ca0033190b2e70', '9', 'group', '测试组参与者', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试组参与者\" name=\"group\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 09:47:15', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('55', '0ec5efe70e2946caa1901e83d6f34117', '2', 'generator', '测试实例编号自定义', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试实例编号自定义\" instanceNoClass=\"com.lj.app.core.common.flows.CustomNoGenerator\" name=\"generator\">\r\n<start displayName=\"start1\" layout=\"86,143,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"463,143,-1,-1\" name=\"end1\"/>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"253,141,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 10:05:07', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('56', 'c6e05fa832d74fc9b78776a48940e8f8', '2', 'field', '测试字段模型', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试字段模型\" name=\"field\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n    <field displayName=\"申请人\" layout=\"230,51,201,22\" name=\"applyUser\" type=\"String\">\r\n        <attr name=\"defaultValue\" value=\"\"/>\r\n        <attr name=\"controlType\" value=\"TextField\"/>\r\n        <attr name=\"lineBR\" value=\"false\"/>\r\n        <attr name=\"placeholder\" value=\"1\"/>\r\n        <attr name=\"isHref\" value=\"false\"/>\r\n        <attr name=\"readonly\" value=\"false\"/>\r\n        <attr name=\"isNeed\" value=\"false\"/>\r\n        <attr name=\"isKey\" value=\"false\"/>\r\n        <attr name=\"visible\" value=\"true\"/>\r\n    </field>\r\n    <transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 10:05:47', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('57', '2b2e635ae3db44a29060042ea826a657', '10', 'group', '测试组参与者', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试组参与者\" name=\"group\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 10:06:06', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('58', '07160a9735e147a08a4a590a3c797623', '11', 'group', '测试组参与者', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试组参与者\" name=\"group\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 10:09:02', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('59', '14b0d50415f049a89f99d325cdfac0c6', '19', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 10:09:34', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('60', '572b9c37304a42308a5f9fe152e0427d', '8', 'simple', '测试简单流程', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试简单流程\" name=\"simple\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 10:09:44', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('61', '519104b579a0471a86cce7c8866ba7ee', '1', 'notallow', '测试无权执行流程', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试无权执行流程\" name=\"notallow\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 10:10:05', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('62', '29b00cc11f6d4ccd993b409f7866b045', '9', 'simple', '测试简单流程', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试简单流程\" name=\"simple\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 10:10:39', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('63', '7642828422504a0c9c522fff073e890d', '10', 'simple', '测试简单流程', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试简单流程\" name=\"simple\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 10:10:59', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('64', '508ee17f1f674491929756a2bf3c76f7', '11', 'simple', '测试简单流程', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试简单流程\" name=\"simple\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 11:44:23', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('65', 'c1bd8fe3a8824e2a8788c789c2bafcc1', '1', 'reject', '测试驳回', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试驳回\" name=\"reject\">\r\n<start displayName=\"start1\" layout=\"28,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"661,83,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"122,81,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"task2\"/>\r\n</task>\r\n<task displayName=\"task2\" layout=\"255,81,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition3\" offset=\"0,0\" to=\"decision1\"/>\r\n</task>\r\n<decision displayName=\"decision1\" layout=\"389,83,-1,-1\" name=\"decision1\">\r\n<transition expr=\"number == 1\" g=\"\" name=\"transition4\" offset=\"0,0\" to=\"task3\"/>\r\n<transition expr=\"number == 2\" g=\"\" name=\"transition6\" offset=\"0,0\" to=\"task4\"/>\r\n</decision>\r\n<task displayName=\"task3\" layout=\"491,81,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task displayName=\"task4\" layout=\"491,188,-1,-1\" name=\"task4\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 11:47:50', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('66', 'd81389d2e6eb44e08c32a0b4fb90f489', '2', 'reject', '测试驳回', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试驳回\" name=\"reject\">\r\n<start displayName=\"start1\" layout=\"28,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"661,83,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"122,81,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"task2\"/>\r\n</task>\r\n<task displayName=\"task2\" layout=\"255,81,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition3\" offset=\"0,0\" to=\"decision1\"/>\r\n</task>\r\n<decision displayName=\"decision1\" layout=\"389,83,-1,-1\" name=\"decision1\">\r\n<transition expr=\"number == 1\" g=\"\" name=\"transition4\" offset=\"0,0\" to=\"task3\"/>\r\n<transition expr=\"number == 2\" g=\"\" name=\"transition6\" offset=\"0,0\" to=\"task4\"/>\r\n</decision>\r\n<task displayName=\"task3\" layout=\"491,81,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task displayName=\"task4\" layout=\"491,188,-1,-1\" name=\"task4\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 11:48:17', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('67', 'f84b9f2bd2aa45cd914814a354df3e8a', '3', 'reject', '测试驳回', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试驳回\" name=\"reject\">\r\n<start displayName=\"start1\" layout=\"28,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"661,83,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"122,81,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"task2\"/>\r\n</task>\r\n<task displayName=\"task2\" layout=\"255,81,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition3\" offset=\"0,0\" to=\"decision1\"/>\r\n</task>\r\n<decision displayName=\"decision1\" layout=\"389,83,-1,-1\" name=\"decision1\">\r\n<transition expr=\"number == 1\" g=\"\" name=\"transition4\" offset=\"0,0\" to=\"task3\"/>\r\n<transition expr=\"number == 2\" g=\"\" name=\"transition6\" offset=\"0,0\" to=\"task4\"/>\r\n</decision>\r\n<task displayName=\"task3\" layout=\"491,81,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task displayName=\"task4\" layout=\"491,188,-1,-1\" name=\"task4\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 11:48:35', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('68', 'aaa5177f5775497196620414adf2482f', '1', 'expire', '测试时限控制', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试时限控制\" name=\"expire\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" autoExecute=\"Y\" callback=\"com.lj.app.core.common.flows.expire.TestCallback\" displayName=\"task1\" expireTime=\"task1.expireTime\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\" reminderRepeat=\"1\" reminderTime=\"task1.reminderTime\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 11:59:09', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('69', '01450bef5c2f46f19232e01a07caec84', '2', 'expire', '测试时限控制', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试时限控制\" name=\"expire\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" autoExecute=\"Y\" callback=\"com.lj.app.core.common.flows.expire.TestCallback\" displayName=\"task1\" expireTime=\"task1.expireTime\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\" reminderRepeat=\"1\" reminderTime=\"task1.reminderTime\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 12:54:43', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('70', '9269837298a74a8290aface10f428a71', '3', 'expire', '测试时限控制', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试时限控制\" name=\"expire\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" autoExecute=\"Y\" callback=\"com.lj.app.core.common.flows.expire.TestCallback\" displayName=\"task1\" expireTime=\"task1.expireTime\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\" reminderRepeat=\"1\" reminderTime=\"task1.reminderTime\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 12:55:28', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('71', '29bef2bd9f244c66aa4a12fda0c6815b', '4', 'expire', '测试时限控制', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试时限控制\" name=\"expire\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" autoExecute=\"Y\" callback=\"com.lj.app.core.common.flows.expire.TestCallback\" displayName=\"task1\" expireTime=\"task1.expireTime\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\" reminderRepeat=\"1\" reminderTime=\"task1.reminderTime\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 12:59:32', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('72', '64cae2474aba42f6b2171882c7ff89a6', '5', 'expire', '测试时限控制', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试时限控制\" name=\"expire\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" autoExecute=\"Y\" callback=\"com.lj.app.core.common.flows.expire.TestCallback\" displayName=\"task1\" expireTime=\"task1.expireTime\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\" reminderRepeat=\"1\" reminderTime=\"task1.reminderTime\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:06:40', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('73', '325a7e7c09b54f2999fae2517c7c6129', '6', 'expire', '测试时限控制', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试时限控制\" name=\"expire\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" autoExecute=\"Y\" callback=\"com.lj.app.core.common.flows.expire.TestCallback\" displayName=\"task1\" expireTime=\"task1.expireTime\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\" reminderRepeat=\"1\" reminderTime=\"task1.reminderTime\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:17:41', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('74', '2ba9131a28ae4203b4041850f5053290', '7', 'expire', '测试时限控制', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试时限控制\" name=\"expire\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" autoExecute=\"Y\" callback=\"com.lj.app.core.common.flows.expire.TestCallback\" displayName=\"task1\" expireTime=\"task1.expireTime\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\" reminderRepeat=\"1\" reminderTime=\"task1.reminderTime\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:18:37', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('75', '41b309905ddd49349174de716f28fbe4', '8', 'expire', '测试时限控制', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试时限控制\" name=\"expire\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" autoExecute=\"Y\" callback=\"com.lj.app.core.common.flows.expire.TestCallback\" displayName=\"task1\" expireTime=\"task1.expireTime\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\" reminderRepeat=\"1\" reminderTime=\"task1.reminderTime\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:20:25', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('76', 'b6959d3d8b5f4c6ca740b56ff65b5f3d', '9', 'expire', '测试时限控制', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试时限控制\" name=\"expire\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" autoExecute=\"Y\" callback=\"com.lj.app.core.common.flows.expire.TestCallback\" displayName=\"task1\" expireTime=\"task1.expireTime\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\" reminderRepeat=\"1\" reminderTime=\"task1.reminderTime\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:21:18', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('77', 'e2805fb6a334419ea9fc00c996be19ab', '10', 'expire', '测试时限控制', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试时限控制\" name=\"expire\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" autoExecute=\"Y\" callback=\"com.lj.app.core.common.flows.expire.TestCallback\" displayName=\"task1\" expireTime=\"task1.expireTime\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\" reminderRepeat=\"1\" reminderTime=\"task1.reminderTime\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:24:07', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('78', 'f66dc6ad278b41778d038e61d913c3fe', '11', 'expire', '测试时限控制', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试时限控制\" name=\"expire\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" autoExecute=\"Y\" callback=\"com.lj.app.core.common.flows.expire.TestCallback\" displayName=\"task1\" expireTime=\"task1.expireTime\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\" reminderRepeat=\"1\" reminderTime=\"task1.reminderTime\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:27:22', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('79', 'c92caa2bf5474437af1a5d3741b707b4', '12', 'expire', '测试时限控制', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试时限控制\" name=\"expire\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" autoExecute=\"Y\" callback=\"com.lj.app.core.common.flows.expire.TestCallback\" displayName=\"task1\" expireTime=\"task1.expireTime\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\" reminderRepeat=\"1\" reminderTime=\"task1.reminderTime\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:29:05', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('80', 'b022be404feb490bbdbeb0a773cbef20', '12', 'simple', '测试简单流程', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试简单流程\" name=\"simple\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:30:36', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('81', '976a1c535a2145578fd495b87825786d', '7', 'leave', '请假流程测试', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n\r\n<process displayName=\"请假流程测试\" instanceUrl=\"/jsp/flows/flowControllerAction!all.action\" name=\"leave\">\r\n<start displayName=\"start1\" layout=\"24,124,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"apply\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"570,124,-1,-1\" name=\"end1\"/>\r\n<task assignee=\"apply.operator\" displayName=\"请假申请\" form=\"/jsp/flowLeaveTest/flowLeaveTestAction!apply.action\" layout=\"117,122,-1,-1\" name=\"apply\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"approveDept\"/>\r\n</task>\r\n<task assignee=\"approveDept.operator\" displayName=\"部门经理审批\" form=\"/jsp/flowLeaveTest/flowLeaveTestAction!approveDept.action\" layout=\"272,122,-1,-1\" name=\"approveDept\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition3\" offset=\"0,0\" to=\"decision1\"/>\r\n</task>\r\n<decision displayName=\"decision1\" expr=\"#day &gt; 2 ? \'transition5\' : \'transition4\'\" layout=\"426,124,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"&lt;=2天\" g=\"\" name=\"transition4\" offset=\"0,0\" to=\"end1\"/>\r\n<transition displayName=\"&gt;2天\" g=\"\" name=\"transition5\" offset=\"0,0\" to=\"approveBoss\"/>\r\n</decision>\r\n<task assignee=\"approveBoss.operator\" displayName=\"总经理审批\" form=\"/jsp/flowLeaveTest/flowLeaveTestAction!approveBoss.action\" layout=\"404,231,-1,-1\" name=\"approveBoss\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>\r\n', null, null, '2017-03-15 01:30:46', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('82', '43dc7a10652e4e069570c1c9d6fd0342', '8', 'leave', '请假流程测试', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n\r\n<process displayName=\"请假流程测试\" instanceUrl=\"/jsp/flows/flowControllerAction!all.action\" name=\"leave\">\r\n<start displayName=\"start1\" layout=\"24,124,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"apply\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"570,124,-1,-1\" name=\"end1\"/>\r\n<task assignee=\"apply.operator\" displayName=\"请假申请\" form=\"/jsp/flowLeaveTest/flowLeaveTestAction!apply.action\" layout=\"117,122,-1,-1\" name=\"apply\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"approveDept\"/>\r\n</task>\r\n<task assignee=\"approveDept.operator\" displayName=\"部门经理审批\" form=\"/jsp/flowLeaveTest/flowLeaveTestAction!approveDept.action\" layout=\"272,122,-1,-1\" name=\"approveDept\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition3\" offset=\"0,0\" to=\"decision1\"/>\r\n</task>\r\n<decision displayName=\"decision1\" expr=\"#day &gt; 2 ? \'transition5\' : \'transition4\'\" layout=\"426,124,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"&lt;=2天\" g=\"\" name=\"transition4\" offset=\"0,0\" to=\"end1\"/>\r\n<transition displayName=\"&gt;2天\" g=\"\" name=\"transition5\" offset=\"0,0\" to=\"approveBoss\"/>\r\n</decision>\r\n<task assignee=\"approveBoss.operator\" displayName=\"总经理审批\" form=\"/jsp/flowLeaveTest/flowLeaveTestAction!approveBoss.action\" layout=\"404,231,-1,-1\" name=\"approveBoss\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>\r\n', null, null, '2017-03-15 01:31:14', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('83', '40c3f8bd2cdf4c198bd8aa9d0342c89a', '9', 'leave', '请假流程测试', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n\r\n<process displayName=\"请假流程测试\" instanceUrl=\"/jsp/flows/flowControllerAction!all.action\" name=\"leave\">\r\n<start displayName=\"start1\" layout=\"24,124,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"apply\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"570,124,-1,-1\" name=\"end1\"/>\r\n<task assignee=\"apply.operator\" displayName=\"请假申请\" form=\"/jsp/flowLeaveTest/flowLeaveTestAction!apply.action\" layout=\"117,122,-1,-1\" name=\"apply\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"approveDept\"/>\r\n</task>\r\n<task assignee=\"approveDept.operator\" displayName=\"部门经理审批\" form=\"/jsp/flowLeaveTest/flowLeaveTestAction!approveDept.action\" layout=\"272,122,-1,-1\" name=\"approveDept\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition3\" offset=\"0,0\" to=\"decision1\"/>\r\n</task>\r\n<decision displayName=\"decision1\" expr=\"#day &gt; 2 ? \'transition5\' : \'transition4\'\" layout=\"426,124,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"&lt;=2天\" g=\"\" name=\"transition4\" offset=\"0,0\" to=\"end1\"/>\r\n<transition displayName=\"&gt;2天\" g=\"\" name=\"transition5\" offset=\"0,0\" to=\"approveBoss\"/>\r\n</decision>\r\n<task assignee=\"approveBoss.operator\" displayName=\"总经理审批\" form=\"/jsp/flowLeaveTest/flowLeaveTestAction!approveBoss.action\" layout=\"404,231,-1,-1\" name=\"approveBoss\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>\r\n', null, null, '2017-03-15 01:32:00', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('84', '7b0d2fb815c14ef79dd726fa83e77292', '13', 'simple', '测试简单流程', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试简单流程\" name=\"simple\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:33:32', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('85', '648c405ddc4c4a5a84060cf41aab1834', '14', 'simple', '测试简单流程', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试简单流程\" name=\"simple\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:33:48', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('86', 'a83a718fe5804b06ae979e174bc8bb31', '1', 'forkjoin', '测试分支合并', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试分支合并\" name=\"forkjoin\">\r\n<start displayName=\"start1\" layout=\"40,146,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"fork1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"659,146,-1,-1\" name=\"end1\"/>\r\n<fork displayName=\"fork1\" layout=\"142,146,-1,-1\" name=\"fork1\">\r\n<transition g=\"165,66\" name=\"transition3\" offset=\"0,0\" to=\"task1\"/>\r\n<transition g=\"\" name=\"transition4\" offset=\"0,0\" to=\"task2\"/>\r\n<transition g=\"166,256\" name=\"transition5\" offset=\"0,0\" to=\"task3\"/>\r\n</fork>\r\n<join displayName=\"join1\" layout=\"566,146,-1,-1\" name=\"join1\">\r\n<transition g=\"\" name=\"transition2\" offset=\"1,-2\" to=\"end1\"/>\r\n</join>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"270,41,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"589,67\" name=\"transition6\" offset=\"0,0\" to=\"join1\"/>\r\n</task>\r\n<task assignee=\"task2.operator\" displayName=\"task2\" layout=\"270,144,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"434,169\" name=\"transition7\" offset=\"0,0\" to=\"join2\"/>\r\n</task>\r\n<task assignee=\"task3.operator\" displayName=\"task3\" layout=\"270,230,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"436,255\" name=\"transition8\" offset=\"0,0\" to=\"join2\"/>\r\n</task>\r\n<join displayName=\"join2\" layout=\"411,195,-1,-1\" name=\"join2\">\r\n<transition g=\"592,219\" name=\"transition9\" offset=\"0,0\" to=\"join1\"/>\r\n</join>\r\n</process>', null, null, '2017-03-15 01:34:25', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('87', '8eea92bb16a747a0bbc73139ff7c4589', '1', 'custom2', 'custom2', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"custom2\" name=\"custom2\">\r\n<start displayName=\"start1\" layout=\"70,121,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"CustomClass\"/>\r\n</start>\r\n<custom args=\"msg\" clazz=\"com.lj.app.core.common.flows.custom.CustomClass\" displayName=\"测试自定义节点2\" layout=\"222,119,-1,-1\" methodName=\"execute\" name=\"CustomClass\" var=\"returnValue\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</custom>\r\n<end displayName=\"end1\" layout=\"421,121,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:35:01', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('88', 'c5432248e9ca4c678014818b92e819b3', '1', 'custom1', '测试自定义节点1', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试自定义节点1\" name=\"custom1\">\r\n<custom clazz=\"com.lj.app.core.common.flows.custom.CustomHandler\" displayName=\"CustomHandler\" layout=\"197,118,113,52\" name=\"CustomHandler\" var=\"returnValue\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</custom>\r\n<start displayName=\"start1\" layout=\"52,120,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"CustomHandler\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"390,120,7,5\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:35:14', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('89', 'e2e589fd1b0843f58fd62be00b5ed289', '2', 'custom1', '测试自定义节点1', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试自定义节点1\" name=\"custom1\">\r\n<custom clazz=\"com.lj.app.core.common.flows.custom.CustomHandler\" displayName=\"CustomHandler\" layout=\"197,118,113,52\" name=\"CustomHandler\" var=\"returnValue\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</custom>\r\n<start displayName=\"start1\" layout=\"52,120,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"CustomHandler\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"390,120,7,5\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:35:51', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('90', '56f51e1721324ac3a7ed6301b384da36', '2', 'custom2', 'custom2', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"custom2\" name=\"custom2\">\r\n<start displayName=\"start1\" layout=\"70,121,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"CustomClass\"/>\r\n</start>\r\n<custom args=\"msg\" clazz=\"com.lj.app.core.common.flows.custom.CustomClass\" displayName=\"测试自定义节点2\" layout=\"222,119,-1,-1\" methodName=\"execute\" name=\"CustomClass\" var=\"returnValue\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</custom>\r\n<end displayName=\"end1\" layout=\"421,121,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:36:09', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('91', '2b3cf3db27b64132a84656ecf674f04a', '1', 'decision2', '测试分支流程2', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试分支流程2\" name=\"decision2\">\r\n<start displayName=\"start1\" layout=\"76,146,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"decision1\"/>\r\n</start>\r\n<decision displayName=\"decision1\" layout=\"179,146,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"to task2\" expr=\"${content == 200}\" g=\"\" name=\"toTask2\" offset=\"-4,-18\" to=\"task2\"/>\r\n<transition displayName=\"to task1\" expr=\"${content &gt; 200}\" g=\"202,86\" name=\"toTask1\" offset=\"-27,-23\" to=\"task1\"/>\r\n<transition displayName=\"to task3\" expr=\"${content &lt; 200}\" g=\"202,254\" name=\"toTask3\" offset=\"-26,14\" to=\"task3\"/>\r\n</decision>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"300,60,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task2.operator\" displayName=\"task2\" layout=\"300,144,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task3.operator\" displayName=\"task3\" layout=\"300,228,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"480,146,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:36:24', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('92', '65aaf9a66ec248ad9297dadb9d4603d5', '1', 'decision1', '测试分支流程1', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试分支流程1\" name=\"decision1\">\r\n<start displayName=\"start1\" layout=\"76,146,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"decision1\"/>\r\n</start>\r\n<decision displayName=\"decision1\" expr=\"${content}\" layout=\"179,146,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"to task2\" g=\"\" name=\"toTask2\" offset=\"-4,-18\" to=\"task2\"/>\r\n<transition displayName=\"to task1\" g=\"202,86\" name=\"toTask1\" offset=\"-27,-23\" to=\"task1\"/>\r\n<transition displayName=\"to task3\" g=\"202,254\" name=\"toTask3\" offset=\"-26,14\" to=\"task3\"/>\r\n</decision>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"300,60,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task2.operator\" displayName=\"task2\" layout=\"300,144,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task3.operator\" displayName=\"task3\" layout=\"300,228,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"480,146,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:36:52', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('93', '546e5fab4fe944ff9c146818b88db021', '1', 'decision3', '测试分支流程3', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试分支流程3\" name=\"decision3\">\r\n<start displayName=\"start1\" layout=\"76,146,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"decision1\"/>\r\n</start>\r\n<decision displayName=\"decision1\" handleClass=\"com.lj.app.core.common.flows.decision.handler.TaskHandler\" layout=\"179,146,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"to task2\" g=\"\" name=\"toTask2\" offset=\"-4,-18\" to=\"task2\"/>\r\n<transition displayName=\"to task1\" g=\"202,86\" name=\"toTask1\" offset=\"-27,-23\" to=\"task1\"/>\r\n<transition displayName=\"to task3\" g=\"202,254\" name=\"toTask3\" offset=\"-26,14\" to=\"task3\"/>\r\n</decision>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"300,60,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task2.operator\" displayName=\"task2\" layout=\"300,144,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task3.operator\" displayName=\"task3\" layout=\"300,228,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"480,146,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:37:32', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('94', '0d1613a4e56f4fe5bb5905ae010d91d4', '2', 'decision2', '测试分支流程2', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试分支流程2\" name=\"decision2\">\r\n<start displayName=\"start1\" layout=\"76,146,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"decision1\"/>\r\n</start>\r\n<decision displayName=\"decision1\" layout=\"179,146,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"to task2\" expr=\"${content == 200}\" g=\"\" name=\"toTask2\" offset=\"-4,-18\" to=\"task2\"/>\r\n<transition displayName=\"to task1\" expr=\"${content &gt; 200}\" g=\"202,86\" name=\"toTask1\" offset=\"-27,-23\" to=\"task1\"/>\r\n<transition displayName=\"to task3\" expr=\"${content &lt; 200}\" g=\"202,254\" name=\"toTask3\" offset=\"-26,14\" to=\"task3\"/>\r\n</decision>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"300,60,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task2.operator\" displayName=\"task2\" layout=\"300,144,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task3.operator\" displayName=\"task3\" layout=\"300,228,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"480,146,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:39:06', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('95', '0096ab7303114a5e871796d6004ea018', '3', 'decision2', '测试分支流程2', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试分支流程2\" name=\"decision2\">\r\n<start displayName=\"start1\" layout=\"76,146,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"decision1\"/>\r\n</start>\r\n<decision displayName=\"decision1\" layout=\"179,146,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"to task2\" expr=\"${content == 200}\" g=\"\" name=\"toTask2\" offset=\"-4,-18\" to=\"task2\"/>\r\n<transition displayName=\"to task1\" expr=\"${content &gt; 200}\" g=\"202,86\" name=\"toTask1\" offset=\"-27,-23\" to=\"task1\"/>\r\n<transition displayName=\"to task3\" expr=\"${content &lt; 200}\" g=\"202,254\" name=\"toTask3\" offset=\"-26,14\" to=\"task3\"/>\r\n</decision>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"300,60,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task2.operator\" displayName=\"task2\" layout=\"300,144,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task3.operator\" displayName=\"task3\" layout=\"300,228,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"480,146,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 01:44:02', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('96', 'afac7893ae554e70a0b5cf89dfe7bb72', '4', 'decision2', '测试分支流程2', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试分支流程2\" name=\"decision2\">\r\n<start displayName=\"start1\" layout=\"76,146,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"decision1\"/>\r\n</start>\r\n<decision displayName=\"decision1\" layout=\"179,146,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"to task2\" expr=\"#content == 200\" g=\"\" name=\"toTask2\" offset=\"-4,-18\" to=\"task2\"/>\r\n<transition displayName=\"to task1\" expr=\"#content &gt; 200\" g=\"202,86\" name=\"toTask1\" offset=\"-27,-23\" to=\"task1\"/>\r\n<transition displayName=\"to task3\" expr=\"#content &lt; 200\" g=\"202,254\" name=\"toTask3\" offset=\"-26,14\" to=\"task3\"/>\r\n</decision>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"300,60,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task2.operator\" displayName=\"task2\" layout=\"300,144,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task3.operator\" displayName=\"task3\" layout=\"300,228,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"480,146,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:39:26', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('97', 'f7e1813924934f4eb32db570dcec234a', '5', 'decision2', '测试分支流程2', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试分支流程2\" name=\"decision2\">\r\n<start displayName=\"start1\" layout=\"76,146,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"decision1\"/>\r\n</start>\r\n<decision displayName=\"decision1\" layout=\"179,146,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"to task2\" expr=\"#content == 200\" g=\"\" name=\"toTask2\" offset=\"-4,-18\" to=\"task2\"/>\r\n<transition displayName=\"to task1\" expr=\"#content &gt; 200\" g=\"202,86\" name=\"toTask1\" offset=\"-27,-23\" to=\"task1\"/>\r\n<transition displayName=\"to task3\" expr=\"#content &lt; 200\" g=\"202,254\" name=\"toTask3\" offset=\"-26,14\" to=\"task3\"/>\r\n</decision>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"300,60,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task2.operator\" displayName=\"task2\" layout=\"300,144,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task3.operator\" displayName=\"task3\" layout=\"300,228,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"480,146,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:41:23', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('98', '9c2f142f4737410dba4935a43049e650', '6', 'decision2', '测试分支流程2', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试分支流程2\" name=\"decision2\">\r\n<start displayName=\"start1\" layout=\"76,146,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"decision1\"/>\r\n</start>\r\n<decision displayName=\"decision1\" layout=\"179,146,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"to task2\" expr=\"#content == 200\" g=\"\" name=\"toTask2\" offset=\"-4,-18\" to=\"task2\"/>\r\n<transition displayName=\"to task1\" expr=\"#content &gt; 200\" g=\"202,86\" name=\"toTask1\" offset=\"-27,-23\" to=\"task1\"/>\r\n<transition displayName=\"to task3\" expr=\"#content &lt; 200\" g=\"202,254\" name=\"toTask3\" offset=\"-26,14\" to=\"task3\"/>\r\n</decision>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"300,60,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task2.operator\" displayName=\"task2\" layout=\"300,144,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task3.operator\" displayName=\"task3\" layout=\"300,228,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"480,146,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:42:06', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('99', '3d8fd68521034babbd7b1d71c21eabf2', '7', 'decision2', '测试分支流程2', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试分支流程2\" name=\"decision2\">\r\n<start displayName=\"start1\" layout=\"76,146,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"decision1\"/>\r\n</start>\r\n<decision displayName=\"decision1\" layout=\"179,146,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"to task2\" expr=\"#content == 200\" g=\"\" name=\"toTask2\" offset=\"-4,-18\" to=\"task2\"/>\r\n<transition displayName=\"to task1\" expr=\"#content &gt; 200\" g=\"202,86\" name=\"toTask1\" offset=\"-27,-23\" to=\"task1\"/>\r\n<transition displayName=\"to task3\" expr=\"#content &lt; 200\" g=\"202,254\" name=\"toTask3\" offset=\"-26,14\" to=\"task3\"/>\r\n</decision>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"300,60,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task2.operator\" displayName=\"task2\" layout=\"300,144,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task3.operator\" displayName=\"task3\" layout=\"300,228,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"480,146,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:42:26', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('100', 'b9fd61e9d12f414895fae814e43da857', '2', 'decision1', '测试分支流程1', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试分支流程1\" name=\"decision1\">\r\n<start displayName=\"start1\" layout=\"76,146,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"decision1\"/>\r\n</start>\r\n<decision displayName=\"decision1\" expr=\"${content}\" layout=\"179,146,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"to task2\" g=\"\" name=\"toTask2\" offset=\"-4,-18\" to=\"task2\"/>\r\n<transition displayName=\"to task1\" g=\"202,86\" name=\"toTask1\" offset=\"-27,-23\" to=\"task1\"/>\r\n<transition displayName=\"to task3\" g=\"202,254\" name=\"toTask3\" offset=\"-26,14\" to=\"task3\"/>\r\n</decision>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"300,60,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task2.operator\" displayName=\"task2\" layout=\"300,144,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task3.operator\" displayName=\"task3\" layout=\"300,228,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"480,146,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:42:42', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('101', 'ec1d1f7feb22420b81f967d4f8ec50e7', '3', 'decision1', '测试分支流程1', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试分支流程1\" name=\"decision1\">\r\n<start displayName=\"start1\" layout=\"76,146,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"decision1\"/>\r\n</start>\r\n<decision displayName=\"decision1\" expr=\"#content\" layout=\"179,146,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"to task2\" g=\"\" name=\"toTask2\" offset=\"-4,-18\" to=\"task2\"/>\r\n<transition displayName=\"to task1\" g=\"202,86\" name=\"toTask1\" offset=\"-27,-23\" to=\"task1\"/>\r\n<transition displayName=\"to task3\" g=\"202,254\" name=\"toTask3\" offset=\"-26,14\" to=\"task3\"/>\r\n</decision>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"300,60,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task2.operator\" displayName=\"task2\" layout=\"300,144,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task3.operator\" displayName=\"task3\" layout=\"300,228,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"480,146,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:43:19', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('102', '6f3276c610474b4487efb9e79cc9ebac', '4', 'decision1', '测试分支流程1', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试分支流程1\" name=\"decision1\">\r\n<start displayName=\"start1\" layout=\"76,146,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"decision1\"/>\r\n</start>\r\n<decision displayName=\"decision1\" expr=\"#content\" layout=\"179,146,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"to task2\" g=\"\" name=\"toTask2\" offset=\"-4,-18\" to=\"task2\"/>\r\n<transition displayName=\"to task1\" g=\"202,86\" name=\"toTask1\" offset=\"-27,-23\" to=\"task1\"/>\r\n<transition displayName=\"to task3\" g=\"202,254\" name=\"toTask3\" offset=\"-26,14\" to=\"task3\"/>\r\n</decision>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"300,60,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task2.operator\" displayName=\"task2\" layout=\"300,144,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task3.operator\" displayName=\"task3\" layout=\"300,228,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"480,146,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:43:45', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('103', '6499249da0e0452cb946a0d2ad38f930', '2', 'decision3', '测试分支流程3', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试分支流程3\" name=\"decision3\">\r\n<start displayName=\"start1\" layout=\"76,146,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"decision1\"/>\r\n</start>\r\n<decision displayName=\"decision1\" handleClass=\"com.lj.app.core.common.flows.decision.handler.TaskHandler\" layout=\"179,146,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"to task2\" g=\"\" name=\"toTask2\" offset=\"-4,-18\" to=\"task2\"/>\r\n<transition displayName=\"to task1\" g=\"202,86\" name=\"toTask1\" offset=\"-27,-23\" to=\"task1\"/>\r\n<transition displayName=\"to task3\" g=\"202,254\" name=\"toTask3\" offset=\"-26,14\" to=\"task3\"/>\r\n</decision>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"300,60,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task2.operator\" displayName=\"task2\" layout=\"300,144,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task3.operator\" displayName=\"task3\" layout=\"300,228,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"480,146,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:44:30', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('104', '063720d77ed845fba48252a25596c45e', '3', 'decision3', '测试分支流程3', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试分支流程3\" name=\"decision3\">\r\n<start displayName=\"start1\" layout=\"76,146,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"decision1\"/>\r\n</start>\r\n<decision displayName=\"decision1\" handleClass=\"com.lj.app.core.common.flows.decision.handler.TaskHandler\" layout=\"179,146,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"to task2\" g=\"\" name=\"toTask2\" offset=\"-4,-18\" to=\"task2\"/>\r\n<transition displayName=\"to task1\" g=\"202,86\" name=\"toTask1\" offset=\"-27,-23\" to=\"task1\"/>\r\n<transition displayName=\"to task3\" g=\"202,254\" name=\"toTask3\" offset=\"-26,14\" to=\"task3\"/>\r\n</decision>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"300,60,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task2.operator\" displayName=\"task2\" layout=\"300,144,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task3.operator\" displayName=\"task3\" layout=\"300,228,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"480,146,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:45:25', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('105', 'cf48cd6fb4a24b24ba9745fefe7508a3', '4', 'decision3', '测试分支流程3', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试分支流程3\" name=\"decision3\">\r\n<start displayName=\"start1\" layout=\"76,146,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"decision1\"/>\r\n</start>\r\n<decision displayName=\"decision1\" handleClass=\"com.lj.app.core.common.flows.decision.handler.TaskHandler\" layout=\"179,146,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"to task2\" g=\"\" name=\"toTask2\" offset=\"-4,-18\" to=\"task2\"/>\r\n<transition displayName=\"to task1\" g=\"202,86\" name=\"toTask1\" offset=\"-27,-23\" to=\"task1\"/>\r\n<transition displayName=\"to task3\" g=\"202,254\" name=\"toTask3\" offset=\"-26,14\" to=\"task3\"/>\r\n</decision>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"300,60,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task2.operator\" displayName=\"task2\" layout=\"300,144,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task3.operator\" displayName=\"task3\" layout=\"300,228,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"480,146,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:47:33', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('106', 'd9e27e74708f436987e7c5d171b2372d', '5', 'decision1', '测试分支流程1', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试分支流程1\" name=\"decision1\">\r\n<start displayName=\"start1\" layout=\"76,146,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"decision1\"/>\r\n</start>\r\n<decision displayName=\"decision1\" expr=\"#content\" layout=\"179,146,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"to task2\" g=\"\" name=\"toTask2\" offset=\"-4,-18\" to=\"task2\"/>\r\n<transition displayName=\"to task1\" g=\"202,86\" name=\"toTask1\" offset=\"-27,-23\" to=\"task1\"/>\r\n<transition displayName=\"to task3\" g=\"202,254\" name=\"toTask3\" offset=\"-26,14\" to=\"task3\"/>\r\n</decision>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"300,60,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task2.operator\" displayName=\"task2\" layout=\"300,144,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task3.operator\" displayName=\"task3\" layout=\"300,228,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"480,146,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:48:02', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('107', '6683524010384994a6cf8c8a89c48107', '8', 'decision2', '测试分支流程2', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试分支流程2\" name=\"decision2\">\r\n<start displayName=\"start1\" layout=\"76,146,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"decision1\"/>\r\n</start>\r\n<decision displayName=\"decision1\" layout=\"179,146,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"to task2\" expr=\"#content == 200\" g=\"\" name=\"toTask2\" offset=\"-4,-18\" to=\"task2\"/>\r\n<transition displayName=\"to task1\" expr=\"#content &gt; 200\" g=\"202,86\" name=\"toTask1\" offset=\"-27,-23\" to=\"task1\"/>\r\n<transition displayName=\"to task3\" expr=\"#content &lt; 200\" g=\"202,254\" name=\"toTask3\" offset=\"-26,14\" to=\"task3\"/>\r\n</decision>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"300,60,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task2.operator\" displayName=\"task2\" layout=\"300,144,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task3.operator\" displayName=\"task3\" layout=\"300,228,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"480,146,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:48:09', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('108', '71b8cd6be0bc4678b689a1ea3d50c0a4', '5', 'decision3', '测试分支流程3', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试分支流程3\" name=\"decision3\">\r\n<start displayName=\"start1\" layout=\"76,146,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"decision1\"/>\r\n</start>\r\n<decision displayName=\"decision1\" handleClass=\"com.lj.app.core.common.flows.decision.handler.TaskHandler\" layout=\"179,146,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"to task2\" g=\"\" name=\"toTask2\" offset=\"-4,-18\" to=\"task2\"/>\r\n<transition displayName=\"to task1\" g=\"202,86\" name=\"toTask1\" offset=\"-27,-23\" to=\"task1\"/>\r\n<transition displayName=\"to task3\" g=\"202,254\" name=\"toTask3\" offset=\"-26,14\" to=\"task3\"/>\r\n</decision>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"300,60,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task2.operator\" displayName=\"task2\" layout=\"300,144,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task assignee=\"task3.operator\" displayName=\"task3\" layout=\"300,228,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"480,146,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:48:22', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('109', '17bcb8f21d6e46768f4c8d3debc93432', '13', 'expire', '测试时限控制', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试时限控制\" name=\"expire\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" autoExecute=\"Y\" callback=\"com.lj.app.core.common.flows.expire.TestCallback\" displayName=\"task1\" expireTime=\"task1.expireTime\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\" reminderRepeat=\"1\" reminderTime=\"task1.reminderTime\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:48:44', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('110', '6613db79fdae444b9152eac7ae24f7fb', '3', 'custom2', 'custom2', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"custom2\" name=\"custom2\">\r\n<start displayName=\"start1\" layout=\"70,121,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"CustomClass\"/>\r\n</start>\r\n<custom args=\"msg\" clazz=\"com.lj.app.core.common.flows.custom.CustomClass\" displayName=\"测试自定义节点2\" layout=\"222,119,-1,-1\" methodName=\"execute\" name=\"CustomClass\" var=\"returnValue\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</custom>\r\n<end displayName=\"end1\" layout=\"421,121,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:49:06', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('111', '48e7fa41992e4440a5d07289f06743f1', '3', 'custom1', '测试自定义节点1', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试自定义节点1\" name=\"custom1\">\r\n<custom clazz=\"com.lj.app.core.common.flows.custom.CustomHandler\" displayName=\"CustomHandler\" layout=\"197,118,113,52\" name=\"CustomHandler\" var=\"returnValue\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</custom>\r\n<start displayName=\"start1\" layout=\"52,120,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"CustomHandler\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"390,120,7,5\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:49:19', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('112', '2f1a258e0dcd4489b42e205aca53d40e', '4', 'reject', '测试驳回', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试驳回\" name=\"reject\">\r\n<start displayName=\"start1\" layout=\"28,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"661,83,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"122,81,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"task2\"/>\r\n</task>\r\n<task displayName=\"task2\" layout=\"255,81,-1,-1\" name=\"task2\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition3\" offset=\"0,0\" to=\"decision1\"/>\r\n</task>\r\n<decision displayName=\"decision1\" layout=\"389,83,-1,-1\" name=\"decision1\">\r\n<transition expr=\"number == 1\" g=\"\" name=\"transition4\" offset=\"0,0\" to=\"task3\"/>\r\n<transition expr=\"number == 2\" g=\"\" name=\"transition6\" offset=\"0,0\" to=\"task4\"/>\r\n</decision>\r\n<task displayName=\"task3\" layout=\"491,81,-1,-1\" name=\"task3\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition5\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task displayName=\"task4\" layout=\"491,188,-1,-1\" name=\"task4\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition7\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 02:49:35', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('113', '2348482775e8489b9257b0ca797372ad', '1', 'aidant', '协办流程测试', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"协办流程测试\" name=\"aidant\">\r\n<start displayName=\"start1\" layout=\"54,128,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"486,128,-1,-1\" name=\"end1\"/>\r\n<task autoExecute=\"Y\" displayName=\"task1\" layout=\"173,126,-1,-1\" name=\"task1\" performType=\"ANY\" taskType=\"Major\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"task2\"/>\r\n<transition g=\"\" name=\"transition4\" offset=\"0,0\" to=\"task3\"/>\r\n</task>\r\n<task autoExecute=\"Y\" displayName=\"task2\" layout=\"311,126,-1,-1\" name=\"task2\" performType=\"ANY\" taskType=\"Major\">\r\n<transition g=\"\" name=\"transition3\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task autoExecute=\"Y\" displayName=\"task3\" layout=\"311,214,-1,-1\" name=\"task3\" performType=\"ANY\" taskType=\"Aidant\"/>\r\n</process>', null, null, '2017-03-15 02:50:32', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('114', '9aee6c48a82f4eb48c5285f61a203239', '2', 'aidant', '协办流程测试', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"协办流程测试\" name=\"aidant\">\r\n<start displayName=\"start1\" layout=\"54,128,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"486,128,-1,-1\" name=\"end1\"/>\r\n<task autoExecute=\"Y\" displayName=\"task1\" layout=\"173,126,-1,-1\" name=\"task1\" performType=\"ANY\" taskType=\"Major\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"task2\"/>\r\n<transition g=\"\" name=\"transition4\" offset=\"0,0\" to=\"task3\"/>\r\n</task>\r\n<task autoExecute=\"Y\" displayName=\"task2\" layout=\"311,126,-1,-1\" name=\"task2\" performType=\"ANY\" taskType=\"Major\">\r\n<transition g=\"\" name=\"transition3\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<task autoExecute=\"Y\" displayName=\"task3\" layout=\"311,214,-1,-1\" name=\"task3\" performType=\"ANY\" taskType=\"Aidant\"/>\r\n</process>', null, null, '2017-03-15 02:50:53', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('115', '4dae16a28665464b901ed7e71a709dea', '4', 'assignmenthandler', '测试编码设置参与者', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试编码设置参与者\" name=\"assignmenthandler\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignmentHandler=\"com.lj.app.core.common.flows.task.assignmenthandler.TaskAssign\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:51:08', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('116', '57aa6a877f944596acea9999824c3dc9', '2', 'config', '测试预配置参与者', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试预配置参与者\" name=\"config\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"aaaa,bbbb\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:51:54', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('117', '0a4010d58c4046b2bc7ab05841e2ab90', '3', 'field', '测试字段模型', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试字段模型\" name=\"field\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n    <field displayName=\"申请人\" layout=\"230,51,201,22\" name=\"applyUser\" type=\"String\">\r\n        <attr name=\"defaultValue\" value=\"\"/>\r\n        <attr name=\"controlType\" value=\"TextField\"/>\r\n        <attr name=\"lineBR\" value=\"false\"/>\r\n        <attr name=\"placeholder\" value=\"1\"/>\r\n        <attr name=\"isHref\" value=\"false\"/>\r\n        <attr name=\"readonly\" value=\"false\"/>\r\n        <attr name=\"isNeed\" value=\"false\"/>\r\n        <attr name=\"isKey\" value=\"false\"/>\r\n        <attr name=\"visible\" value=\"true\"/>\r\n    </field>\r\n    <transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:52:15', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('118', '2137ea6b7c0b488583726ef768c3acd1', '12', 'group', '测试组参与者', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试组参与者\" name=\"group\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:52:31', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('119', 'd738c999324846b1ac3801324ccc3c28', '20', 'interceptor', '测试局部拦截器', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试局部拦截器\" name=\"interceptor\">\r\n<start displayName=\"start1\" layout=\"61,157,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"474,157,-1,-1\" name=\"end1\"/>\r\n<task displayName=\"task1\" layout=\"244,155,-1,-1\" name=\"task1\" performType=\"ANY\" postInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\" preInterceptors=\"com.lj.app.core.common.flows.task.interceptor.LocalTaskInterceptor\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 02:53:03', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('120', '5aed7c57964144698565ab526c971af4', '15', 'simple', '测试简单流程', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试简单流程\" name=\"simple\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:53:18', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('121', '969d0cf31d534bbfaa307fdad0dd9788', '2', 'notallow', '测试无权执行流程', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试无权执行流程\" name=\"notallow\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:53:36', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('122', 'c5ba2638424a46edaa476b70b517df58', '1', 'take', '测试任务提取', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试任务提取\" name=\"take\">\r\n<start displayName=\"start1\" layout=\"64,83,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"213,80,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n<end displayName=\"end1\" layout=\"454,82,-1,-1\" name=\"end1\"/>\r\n</process>', null, null, '2017-03-15 02:53:58', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('123', '23251ac5f592451fac4a678c966f186e', '1', 'transfer', '转派任务测试', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"转派任务测试\" name=\"transfer\">\r\n<start displayName=\"start1\" layout=\"54,128,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"486,128,-1,-1\" name=\"end1\"/>\r\n<task autoExecute=\"Y\" displayName=\"task1\" layout=\"173,126,-1,-1\" name=\"task1\" performType=\"ANY\" taskType=\"Major\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"task2\"/>\r\n</task>\r\n<task autoExecute=\"Y\" displayName=\"task2\" layout=\"311,126,-1,-1\" name=\"task2\" performType=\"ANY\" taskType=\"Major\">\r\n<transition g=\"\" name=\"transition3\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-15 02:55:21', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('124', '7c2a6de8f6bd4977ab1e17bcff2fd8fe', '3', 'generator', '测试实例编号自定义', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n<process displayName=\"测试实例编号自定义\" instanceNoClass=\"com.lj.app.core.common.flows.CustomNoGenerator\" name=\"generator\">\r\n<start displayName=\"start1\" layout=\"86,143,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"task1\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"463,143,-1,-1\" name=\"end1\"/>\r\n<task assignee=\"task1.operator\" displayName=\"task1\" layout=\"253,141,-1,-1\" name=\"task1\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>', null, null, '2017-03-16 09:44:36', null, null, null, '', '1', null);
INSERT INTO `flow_process` VALUES ('125', '9e3999869487410a91082ed83aa609e0', '10', 'leave', '请假流程测试', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\r\n\r\n<process displayName=\"请假流程测试\" instanceUrl=\"/jsp/flows/flowControllerAction!all.action\" name=\"leave\">\r\n<start displayName=\"start1\" layout=\"24,124,-1,-1\" name=\"start1\">\r\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"apply\"/>\r\n</start>\r\n<end displayName=\"end1\" layout=\"570,124,-1,-1\" name=\"end1\"/>\r\n<task assignee=\"apply.operator\" displayName=\"请假申请\" form=\"/jsp/flowLeaveTest/flowLeaveTestAction!apply.action\" layout=\"117,122,-1,-1\" name=\"apply\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"approveDept\"/>\r\n</task>\r\n<task assignee=\"approveDept.operator\" displayName=\"部门经理审批\" form=\"/jsp/flowLeaveTest/flowLeaveTestAction!approveDept.action\" layout=\"272,122,-1,-1\" name=\"approveDept\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition3\" offset=\"0,0\" to=\"decision1\"/>\r\n</task>\r\n<decision displayName=\"decision1\" expr=\"#day &gt; 2 ? \'transition5\' : \'transition4\'\" layout=\"426,124,-1,-1\" name=\"decision1\">\r\n<transition displayName=\"&lt;=2天\" g=\"\" name=\"transition4\" offset=\"0,0\" to=\"end1\"/>\r\n<transition displayName=\"&gt;2天\" g=\"\" name=\"transition5\" offset=\"0,0\" to=\"approveBoss\"/>\r\n</decision>\r\n<task assignee=\"approveBoss.operator\" displayName=\"总经理审批\" form=\"/jsp/flowLeaveTest/flowLeaveTestAction!approveBoss.action\" layout=\"404,231,-1,-1\" name=\"approveBoss\" performType=\"ANY\">\r\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\r\n</task>\r\n</process>\r\n', null, null, '2017-03-16 09:45:28', null, null, null, '', '1', null);

-- ----------------------------
-- Table structure for `flow_task`
-- ----------------------------
DROP TABLE IF EXISTS `flow_task`;
CREATE TABLE `flow_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TASK_VEFRSION` int(11) DEFAULT NULL,
  `FLOW_ORDER_ID` int(11) DEFAULT NULL,
  `TASK_NAME` varchar(200) DEFAULT NULL,
  `display_Name` varchar(200) DEFAULT NULL,
  `perform_Type` int(11) DEFAULT NULL,
  `task_Type` int(11) DEFAULT NULL,
  `operator` varchar(200) DEFAULT NULL,
  `create_Time` datetime DEFAULT NULL,
  `finish_Time` datetime DEFAULT NULL,
  `expire_Time` datetime DEFAULT NULL,
  `expire_Date` datetime DEFAULT NULL,
  `remind_Date` datetime DEFAULT NULL,
  `action_Url` varchar(2000) DEFAULT NULL,
  `parent_Task_Id` int(11) DEFAULT NULL,
  `variable` varchar(2000) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_By_UName` varchar(200) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_By_Uname` varchar(200) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `FLOW_VERSION` int(11) DEFAULT NULL,
  `FLOW_NAME` varchar(200) DEFAULT NULL,
  `instance_Url` varchar(2000) DEFAULT NULL,
  `flow_Process_Id` varchar(2000) DEFAULT NULL,
  `actorIds` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_task
-- ----------------------------
INSERT INTO `flow_task` VALUES ('24', null, '5', 'approveBoss', '总经理审批', '0', '0', null, '2017-03-11 13:01:28', null, null, null, null, '/jsp/flowLeaveTest/flowLeaveTestAction!approveBoss.action', '23', '{\"taskId\":\"23\",\"approveBoss.operator\":\"sysadmin\",\"submit\":\"提交\",\"ccOperatorName\":\"\",\"reason\":\"5r\",\"processId\":\"11\",\"nextOperator\":\"\",\"S-ACTOR\":\"sysadmin\",\"apply.operator\":\"sysadmin\",\"approveDept.operator\":\"sysadmin\",\"ccOperator\":\"admin\",\"nextOperatorName\":\"\",\"method\":\"0\",\"day\":5,\"approveDept.suggest\":\"ddd\",\"orderId\":\"5\"}', null, null, '2017-03-11', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('27', null, '8', 'task1', 'task1', '0', '0', null, '2017-03-15 09:03:58', null, null, null, null, '', null, '{\"S-ACTOR\":\"admin管理员\",\"task1.operator\":[\"admin管理员\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('28', null, '9', 'task1', 'task1', '0', '0', null, '2017-03-15 09:04:32', null, null, null, null, '', null, '{\"S-ACTOR\":\"1\",\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('36', null, '17', 'task1', 'task1', '0', '0', null, '2017-03-15 09:32:54', null, null, null, null, '', null, '{\"S-ACTOR\":\"admin\"}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('38', null, '19', 'task1', 'task1', '0', '0', null, '2017-03-15 09:33:48', null, null, null, null, '', null, '{\"S-ACTOR\":\"aaaabbbb\"}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('39', null, '20', 'task1', 'task1', '0', '0', null, '2017-03-15 09:42:14', null, null, null, null, '', null, '{\"S-ACTOR\":\"role1\",\"task1.operator\":[\"role1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('40', null, '21', 'task1', 'task1', '0', '0', null, '2017-03-15 09:47:16', null, null, null, null, '', null, '{\"S-ACTOR\":\"role1\",\"task1.operator\":[\"role1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('42', null, '23', 'task1', 'task1', '0', '0', null, '2017-03-15 10:06:06', null, null, null, null, '', null, '{\"S-ACTOR\":\"role1\",\"task1.operator\":[\"role1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('43', null, '24', 'task1', 'task1', '0', '0', null, '2017-03-15 10:09:02', null, null, null, null, '', null, '{\"S-ACTOR\":\"role1\",\"task1.operator\":[\"role1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('45', null, '26', 'task1', 'task1', '0', '0', null, '2017-03-15 10:09:44', null, null, null, null, '', null, '{\"S-ACTOR\":\"1\",\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('48', null, '29', 'task1', 'task1', '0', '0', null, '2017-03-15 11:47:50', null, null, null, null, '', null, '{\"S-ACTOR\":\"\"}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('49', null, '30', 'task1', 'task1', '0', '0', null, '2017-03-15 11:48:17', null, null, null, null, '', null, '{\"S-ACTOR\":\"\"}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('50', null, '31', 'task1', 'task1', '0', '0', null, '2017-03-15 11:48:35', null, null, null, null, '', null, '{\"S-ACTOR\":\"\"}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('51', null, '32', 'task1', 'task1', '0', '0', null, '2017-03-15 11:59:09', null, null, null, null, '', null, '{\"task1.expireTime\":null,\"task1.reminderTime\":null,\"S-ACTOR\":\"1\",\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('52', null, '33', 'task1', 'task1', '0', '0', null, '2017-03-15 12:54:43', null, null, null, null, '', null, '{\"task1.expireTime\":null,\"task1.reminderTime\":null,\"S-ACTOR\":\"1\",\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('53', null, '34', 'task1', 'task1', '0', '0', null, '2017-03-15 12:55:28', null, null, null, null, '', null, '{\"task1.expireTime\":null,\"task1.reminderTime\":null,\"S-ACTOR\":\"1\",\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('54', null, '35', 'task1', 'task1', '0', '0', null, '2017-03-15 12:59:32', null, null, null, null, '', null, '{\"task1.expireTime\":null,\"task1.reminderTime\":null,\"S-ACTOR\":\"1\",\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('55', null, '36', 'task1', 'task1', '0', '0', null, '2017-03-15 13:06:40', null, null, null, null, '', null, '{\"task1.expireTime\":null,\"task1.reminderTime\":null,\"S-ACTOR\":\"1\",\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('56', null, '37', 'task1', 'task1', '0', '0', null, '2017-03-15 13:17:41', null, null, null, null, '', null, '{\"task1.expireTime\":null,\"task1.reminderTime\":null,\"S-ACTOR\":\"1\",\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('57', null, '38', 'task1', 'task1', '0', '0', null, '2017-03-15 13:18:37', null, null, null, null, '', null, '{\"task1.expireTime\":\"2017-03-15 00:00:00\",\"task1.reminderTime\":\"2017-03-15 13:00:00\",\"S-ACTOR\":\"1\",\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('58', null, '39', 'task1', 'task1', '0', '0', null, '2017-03-15 13:20:25', null, null, null, null, '', null, '{\"task1.expireTime\":\"2017-03-15 00:00:00\",\"task1.reminderTime\":\"2017-03-15 13:00:00\",\"S-ACTOR\":\"1\",\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('59', null, '40', 'task1', 'task1', '0', '0', null, '2017-03-15 13:21:18', null, null, null, null, '', null, '{\"task1.expireTime\":\"2017-03-15 00:00:00\",\"task1.reminderTime\":\"2017-03-15 13:00:00\",\"S-ACTOR\":\"1\",\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('60', null, '41', 'task1', 'task1', '0', '0', null, '2017-03-15 13:25:07', null, null, null, null, '', null, '{\"task1.expireTime\":\"2017-03-15 00:00:00\",\"task1.reminderTime\":\"2017-03-15 13:00:00\",\"S-ACTOR\":\"1\",\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('61', null, '42', 'task1', 'task1', '0', '0', null, '2017-03-15 13:27:32', null, '2017-03-15 00:00:00', '2017-03-15 00:00:00', null, '', null, '{\"task1.expireTime\":{\"date\":15,\"day\":3,\"hours\":0,\"minutes\":0,\"month\":2,\"seconds\":0,\"time\":1489507200000,\"timezoneOffset\":-480,\"year\":117},\"task1.reminderTime\":{\"date\":15,\"day\":3,\"hours\":10,\"minutes\":0,\"month\":2,\"seconds\":0,\"time\":1489543200000,\"timezoneOffset\":-480,\"year\":117},\"S-ACTOR\":\"1\",\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('62', null, '43', 'task1', 'task1', '0', '0', null, '2017-03-15 13:29:05', null, '2017-03-15 00:00:00', '2017-03-15 00:00:00', null, '', null, '{\"task1.expireTime\":{\"date\":15,\"day\":3,\"hours\":0,\"minutes\":0,\"month\":2,\"seconds\":0,\"time\":1489507200000,\"timezoneOffset\":-480,\"year\":117},\"task1.reminderTime\":{\"date\":15,\"day\":3,\"hours\":10,\"minutes\":0,\"month\":2,\"seconds\":0,\"time\":1489543200000,\"timezoneOffset\":-480,\"year\":117},\"S-ACTOR\":\"1\",\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('64', null, '45', 'task1', 'task1', '0', '0', null, '2017-03-15 13:30:46', null, null, null, null, '', null, '{\"S-ACTOR\":\"admin管理员\",\"task1.operator\":[\"admin管理员\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('65', null, '46', 'task1', 'task1', '0', '0', null, '2017-03-15 13:31:14', null, null, null, null, '', null, '{\"S-ACTOR\":\"admin管理员\",\"task1.operator\":[\"admin管理员\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('66', null, '47', 'task1', 'task1', '0', '0', null, '2017-03-15 13:32:00', null, null, null, null, '', null, '{\"S-ACTOR\":\"admin管理员\",\"task1.operator\":[\"admin管理员\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('68', null, '48', 'task2', 'task2', '0', '0', null, '2017-03-15 13:34:25', null, null, null, null, '', null, '{\"task2.operator\":[\"1\"],\"S-ACTOR\":\"1\",\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('69', null, '48', 'task3', 'task3', '0', '0', null, '2017-03-15 13:34:25', null, null, null, null, '', null, '{\"task2.operator\":[\"1\"],\"S-ACTOR\":\"1\",\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('70', null, '57', 'task1', 'task1', '0', '0', null, '2017-03-15 14:39:26', null, null, null, null, '', null, '{\"content\":250,\"task2.operator\":[\"1\"],\"S-ACTOR\":\"1\",\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('71', null, '58', 'task1', 'task1', '0', '0', null, '2017-03-15 14:41:23', null, null, null, null, '', null, '{\"content\":250,\"task2.operator\":[\"1\"],\"S-ACTOR\":\"1\",\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('72', null, '59', 'task1', 'task1', '0', '0', null, '2017-03-15 14:42:06', null, null, null, null, '', null, '{\"content\":250,\"task2.operator\":[\"1\"],\"S-ACTOR\":\"1\",\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('73', null, '60', 'task1', 'task1', '0', '0', null, '2017-03-15 14:42:26', null, null, null, null, '', null, '{\"content\":250,\"task2.operator\":[\"1\"],\"S-ACTOR\":\"1\",\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('74', null, '62', 'task2', 'task2', '0', '0', null, '2017-03-15 14:43:19', null, null, null, null, '', null, '{\"content\":\"toTask2\",\"task2.operator\":[\"1\"],\"S-ACTOR\":\"1\"}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('75', null, '63', 'task2', 'task2', '0', '0', null, '2017-03-15 14:43:45', null, null, null, null, '', null, '{\"content\":\"toTask2\",\"task2.operator\":[\"1\"],\"S-ACTOR\":\"1\"}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('76', null, '66', 'task3', 'task3', '0', '0', null, '2017-03-15 14:47:33', null, null, null, null, '', null, '{\"content\":\"toTask3\",\"task2.operator\":[\"1\"],\"S-ACTOR\":\"1\",\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('77', null, '67', 'task2', 'task2', '0', '0', null, '2017-03-15 14:48:02', null, null, null, null, '', null, '{\"content\":\"toTask2\",\"task2.operator\":[\"1\"],\"S-ACTOR\":\"1\"}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('78', null, '68', 'task1', 'task1', '0', '0', null, '2017-03-15 14:48:09', null, null, null, null, '', null, '{\"content\":250,\"task2.operator\":[\"1\"],\"S-ACTOR\":\"1\",\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('79', null, '69', 'task3', 'task3', '0', '0', null, '2017-03-15 14:48:22', null, null, null, null, '', null, '{\"content\":\"toTask3\",\"task2.operator\":[\"1\"],\"S-ACTOR\":\"1\",\"task3.operator\":[\"1\"],\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('80', null, '70', 'task1', 'task1', '0', '0', null, '2017-03-15 14:48:44', null, '2017-03-15 00:00:00', '2017-03-15 00:00:00', null, '', null, '{\"task1.expireTime\":{\"date\":15,\"day\":3,\"hours\":0,\"minutes\":0,\"month\":2,\"seconds\":0,\"time\":1489507200000,\"timezoneOffset\":-480,\"year\":117},\"task1.reminderTime\":{\"date\":15,\"day\":3,\"hours\":10,\"minutes\":0,\"month\":2,\"seconds\":0,\"time\":1489543200000,\"timezoneOffset\":-480,\"year\":117},\"S-ACTOR\":\"1\",\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('81', null, '73', 'task1', 'task1', '0', '0', null, '2017-03-15 14:49:35', null, null, null, null, '', null, '{\"S-ACTOR\":\"\"}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('83', null, '74', 'task2', 'task2', '0', '0', null, '2017-03-15 14:50:53', null, null, null, null, '', '82', '{\"S-ACTOR\":\"\"}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('84', null, '74', 'task3', 'task3', '0', '1', null, '2017-03-15 14:50:53', null, null, null, null, '', '82', '{\"S-ACTOR\":\"\"}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('86', null, '76', 'task1', 'task1', '0', '0', null, '2017-03-15 14:51:54', null, null, null, null, '', null, '{\"S-ACTOR\":\"aaaabbbb\"}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('87', null, '77', 'task1', 'task1', '0', '0', null, '2017-03-15 14:52:31', null, null, null, null, '', null, '{\"S-ACTOR\":\"role1\",\"task1.operator\":[\"role1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('89', null, '79', 'task1', 'task1', '0', '0', null, '2017-03-15 14:53:18', null, null, null, null, '', null, '{\"S-ACTOR\":\"1\",\"task1.operator\":[\"1\"]}', null, null, '2017-03-15', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('90', null, '80', 'task1', 'task1', '0', '0', null, '2017-03-16 09:44:36', null, null, null, null, '', null, '{\"S-ACTOR\":\"1\",\"task1.operator\":[\"1\"]}', null, null, '2017-03-16', null, null, null, null, null, null, null, null);
INSERT INTO `flow_task` VALUES ('91', null, '81', 'task1', 'task1', '0', '0', null, '2017-03-16 09:45:28', null, null, null, null, '', null, '{\"S-ACTOR\":\"1\",\"task1.operator\":[\"1\"]}', null, null, '2017-03-16', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `flow_task_actor`
-- ----------------------------
DROP TABLE IF EXISTS `flow_task_actor`;
CREATE TABLE `flow_task_actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TASK_ID` int(11) DEFAULT NULL,
  `ACTOR_ID` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_task_actor
-- ----------------------------
INSERT INTO `flow_task_actor` VALUES ('27', '12', 'sysadmin');
INSERT INTO `flow_task_actor` VALUES ('28', '13', 'sysadmin');
INSERT INTO `flow_task_actor` VALUES ('29', '14', 'sysadmin');
INSERT INTO `flow_task_actor` VALUES ('30', '15', 'sysadmin');
INSERT INTO `flow_task_actor` VALUES ('31', '16', 'sysadmin');
INSERT INTO `flow_task_actor` VALUES ('32', '17', 'sysadmin');
INSERT INTO `flow_task_actor` VALUES ('33', '18', 'sysadmin');
INSERT INTO `flow_task_actor` VALUES ('34', '19', 'sysadmin');
INSERT INTO `flow_task_actor` VALUES ('35', '20', 'sysadmin');
INSERT INTO `flow_task_actor` VALUES ('36', '21', 'sysadmin');
INSERT INTO `flow_task_actor` VALUES ('37', '22', 'sysadmin');
INSERT INTO `flow_task_actor` VALUES ('38', '23', 'sysadmin');
INSERT INTO `flow_task_actor` VALUES ('39', '24', 'sysadmin');
INSERT INTO `flow_task_actor` VALUES ('40', '25', '1');
INSERT INTO `flow_task_actor` VALUES ('41', '26', 'admin管理员');
INSERT INTO `flow_task_actor` VALUES ('42', '27', 'admin管理员');
INSERT INTO `flow_task_actor` VALUES ('43', '28', '1');
INSERT INTO `flow_task_actor` VALUES ('44', '36', 'admin');
INSERT INTO `flow_task_actor` VALUES ('45', '37', 'admin');
INSERT INTO `flow_task_actor` VALUES ('46', '38', 'aaaa');
INSERT INTO `flow_task_actor` VALUES ('47', '38', 'bbbb');
INSERT INTO `flow_task_actor` VALUES ('48', '39', 'role1');
INSERT INTO `flow_task_actor` VALUES ('49', '40', 'role1');
INSERT INTO `flow_task_actor` VALUES ('50', '41', '1');
INSERT INTO `flow_task_actor` VALUES ('51', '42', 'role1');
INSERT INTO `flow_task_actor` VALUES ('52', '43', 'role1');
INSERT INTO `flow_task_actor` VALUES ('53', '45', '1');
INSERT INTO `flow_task_actor` VALUES ('54', '46', '2');
INSERT INTO `flow_task_actor` VALUES ('55', '47', '1');
INSERT INTO `flow_task_actor` VALUES ('56', '51', '1');
INSERT INTO `flow_task_actor` VALUES ('57', '52', '1');
INSERT INTO `flow_task_actor` VALUES ('58', '53', '1');
INSERT INTO `flow_task_actor` VALUES ('59', '54', '1');
INSERT INTO `flow_task_actor` VALUES ('60', '55', '1');
INSERT INTO `flow_task_actor` VALUES ('61', '56', '1');
INSERT INTO `flow_task_actor` VALUES ('62', '57', '1');
INSERT INTO `flow_task_actor` VALUES ('63', '58', '1');
INSERT INTO `flow_task_actor` VALUES ('64', '59', '1');
INSERT INTO `flow_task_actor` VALUES ('65', '60', '1');
INSERT INTO `flow_task_actor` VALUES ('66', '61', '1');
INSERT INTO `flow_task_actor` VALUES ('67', '62', '1');
INSERT INTO `flow_task_actor` VALUES ('68', '63', 'admin管理员');
INSERT INTO `flow_task_actor` VALUES ('69', '64', 'admin管理员');
INSERT INTO `flow_task_actor` VALUES ('70', '65', 'admin管理员');
INSERT INTO `flow_task_actor` VALUES ('71', '66', 'admin管理员');
INSERT INTO `flow_task_actor` VALUES ('72', '67', '1');
INSERT INTO `flow_task_actor` VALUES ('73', '68', '1');
INSERT INTO `flow_task_actor` VALUES ('74', '69', '1');
INSERT INTO `flow_task_actor` VALUES ('75', '70', '1');
INSERT INTO `flow_task_actor` VALUES ('76', '71', '1');
INSERT INTO `flow_task_actor` VALUES ('77', '72', '1');
INSERT INTO `flow_task_actor` VALUES ('78', '73', '1');
INSERT INTO `flow_task_actor` VALUES ('79', '74', '1');
INSERT INTO `flow_task_actor` VALUES ('80', '75', '1');
INSERT INTO `flow_task_actor` VALUES ('81', '76', '1');
INSERT INTO `flow_task_actor` VALUES ('82', '77', '1');
INSERT INTO `flow_task_actor` VALUES ('83', '78', '1');
INSERT INTO `flow_task_actor` VALUES ('84', '79', '1');
INSERT INTO `flow_task_actor` VALUES ('85', '80', '1');
INSERT INTO `flow_task_actor` VALUES ('86', '85', 'admin');
INSERT INTO `flow_task_actor` VALUES ('87', '86', 'aaaa');
INSERT INTO `flow_task_actor` VALUES ('88', '86', 'bbbb');
INSERT INTO `flow_task_actor` VALUES ('89', '87', 'role1');
INSERT INTO `flow_task_actor` VALUES ('90', '89', '1');
INSERT INTO `flow_task_actor` VALUES ('91', '90', '2');
INSERT INTO `flow_task_actor` VALUES ('92', '91', '1');
INSERT INTO `flow_task_actor` VALUES ('93', '90', '1');
INSERT INTO `flow_task_actor` VALUES ('94', '91', '1');

-- ----------------------------
-- Table structure for `flow_task_hist`
-- ----------------------------
DROP TABLE IF EXISTS `flow_task_hist`;
CREATE TABLE `flow_task_hist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TASK_VEFRSION` int(11) DEFAULT NULL,
  `FLOW_ORDER_ID` int(11) DEFAULT NULL,
  `TASK_NAME` varchar(200) DEFAULT NULL,
  `display_Name` varchar(200) DEFAULT NULL,
  `perform_Type` int(11) DEFAULT NULL,
  `task_Type` int(11) DEFAULT NULL,
  `operator` varchar(200) DEFAULT NULL,
  `create_Time` datetime DEFAULT NULL,
  `finish_Time` datetime DEFAULT NULL,
  `expire_Time` datetime DEFAULT NULL,
  `expire_Date` datetime DEFAULT NULL,
  `remind_Date` datetime DEFAULT NULL,
  `action_Url` varchar(2000) DEFAULT NULL,
  `parent_Task_Id` int(11) DEFAULT NULL,
  `variable` varchar(3000) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_By_UName` varchar(200) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_By_Uname` varchar(200) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_task_hist
-- ----------------------------
INSERT INTO `flow_task_hist` VALUES ('11', null, '5', 'apply', '请假申请', '0', '0', 'sysadmin', '2017-03-11 10:31:19', '2017-03-11 10:31:19', null, null, null, '/jsp/flowLeaveTest/flowLeaveTestAction!apply.action', null, '{\"taskId\":\"\",\"S-ACTOR\":\"sysadmin\",\"apply.operator\":\"sysadmin\",\"approveBoss.operator\":\"sysadmin\",\"approveDept.operator\":\"sysadmin\",\"submit\":\"提交\",\"processId\":\"11\",\"reason\":\"5r\",\"day\":5,\"orderId\":\"\"}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('12', null, '5', 'approveDept', '部门经理审批', '0', '0', 'sysadmin', '2017-03-11 10:31:19', '2017-03-11 10:32:18', null, null, null, '/jsp/flowLeaveTest/flowLeaveTestAction!approveDept.action', '11', '{\"taskId\":\"12\",\"nextOperator\":\"\",\"ccOperatorName\":\"\",\"submit\":\"提交\",\"processId\":\"11\",\"ccOperator\":\"\",\"nextOperatorName\":\"\",\"method\":\"-1\",\"approveDept.suggest\":\"请假天数太多\",\"orderId\":\"5\"}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('13', null, '5', 'apply', '请假申请', '0', '0', 'sysadmin', '2017-03-11 10:32:18', '2017-03-11 12:57:52', null, null, null, '/jsp/flowLeaveTest/flowLeaveTestAction!apply.action', null, '{\"taskId\":\"13\",\"apply.operator\":\"sysadmin\",\"approveBoss.operator\":\"sysadmin\",\"approveDept.operator\":\"sysadmin\",\"submit\":\"提交\",\"processId\":\"11\",\"reason\":\"5\",\"day\":5,\"orderId\":\"5\"}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('14', null, '6', 'apply', '请假申请', '0', '0', 'sysadmin', '2017-03-11 10:38:28', '2017-03-11 10:38:28', null, null, null, '/jsp/flowLeaveTest/flowLeaveTestAction!apply.action', null, '{\"taskId\":\"\",\"S-ACTOR\":\"sysadmin\",\"apply.operator\":\"sysadmin\",\"approveBoss.operator\":\"sysadmin\",\"approveDept.operator\":\"sysadmin\",\"submit\":\"提交\",\"processId\":\"11\",\"reason\":\"6\",\"day\":6,\"orderId\":\"\"}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('15', null, '6', 'approveDept', '部门经理审批', '0', '0', 'sysadmin', '2017-03-11 10:38:28', '2017-03-11 10:38:55', null, null, null, '/jsp/flowLeaveTest/flowLeaveTestAction!approveDept.action', '14', '{\"taskId\":\"15\",\"nextOperator\":\"\",\"ccOperatorName\":\"\",\"submit\":\"提交\",\"processId\":\"11\",\"ccOperator\":\"\",\"nextOperatorName\":\"\",\"method\":\"-1\",\"approveDept.suggest\":\"666\",\"orderId\":\"6\"}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('16', null, '6', 'apply', '请假申请', '0', '0', 'sysadmin', '2017-03-11 10:39:27', '2017-03-11 11:00:31', null, null, null, '/jsp/flowLeaveTest/flowLeaveTestAction!apply.action', null, '{\"taskId\":\"16\",\"apply.operator\":\"sysadmin\",\"approveBoss.operator\":\"sysadmin\",\"approveDept.operator\":\"sysadmin\",\"submit\":\"提交\",\"processId\":\"11\",\"reason\":\"55\",\"day\":6,\"orderId\":\"6\"}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('17', null, '6', 'approveDept', '部门经理审批', '0', '0', 'sysadmin', '2017-03-11 11:00:31', '2017-03-11 11:01:41', null, null, null, '/jsp/flowLeaveTest/flowLeaveTestAction!approveDept.action', '16', '{\"taskId\":\"17\",\"nextOperator\":\"\",\"ccOperatorName\":\"\",\"submit\":\"提交\",\"processId\":\"11\",\"ccOperator\":\"\",\"nextOperatorName\":\"\",\"method\":\"0\",\"approveDept.suggest\":\"审批通过\",\"orderId\":\"6\"}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('18', null, '6', 'approveBoss', '总经理审批', '0', '0', 'sysadmin', '2017-03-11 11:01:41', '2017-03-11 11:02:30', null, null, null, '/jsp/flowLeaveTest/flowLeaveTestAction!approveBoss.action', '17', '{\"taskId\":\"18\",\"approveBoss.suggest\":\"驳回了\",\"submit\":\"提交\",\"processId\":\"11\",\"method\":\"-1\",\"orderId\":\"6\"}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('19', null, '6', 'approveDept', '部门经理审批', '0', '0', 'sysadmin', '2017-03-11 11:02:30', '2017-03-11 11:59:00', null, null, null, '/jsp/flowLeaveTest/flowLeaveTestAction!approveDept.action', '16', '{\"taskId\":\"19\",\"nextOperator\":\"\",\"ccOperatorName\":\"admin\",\"submit\":\"提交\",\"processId\":\"11\",\"ccOperator\":\"\",\"nextOperatorName\":\"\",\"method\":\"0\",\"approveDept.suggest\":\"\",\"orderId\":\"6\"}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('20', null, '6', 'approveBoss', '总经理审批', '0', '0', 'sysadmin', '2017-03-11 11:59:00', '2017-03-11 12:56:55', null, null, null, '/jsp/flowLeaveTest/flowLeaveTestAction!approveBoss.action', '19', '{\"taskId\":\"20\",\"approveBoss.suggest\":\"bbb\",\"submit\":\"提交\",\"processId\":\"11\",\"method\":\"0\",\"orderId\":\"6\"}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('21', null, '5', 'approveDept', '部门经理审批', '0', '0', 'sysadmin', '2017-03-11 12:57:52', '2017-03-11 12:58:48', null, null, null, '/jsp/flowLeaveTest/flowLeaveTestAction!approveDept.action', '13', '{\"taskId\":\"21\",\"nextOperator\":\"\",\"ccOperatorName\":\"admin\",\"submit\":\"提交\",\"processId\":\"11\",\"ccOperator\":\"\",\"nextOperatorName\":\"\",\"method\":\"0\",\"approveDept.suggest\":\"ddddd\",\"orderId\":\"5\"}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('22', null, '5', 'approveBoss', '总经理审批', '0', '0', 'sysadmin', '2017-03-11 12:58:48', '2017-03-11 12:59:44', null, null, null, '/jsp/flowLeaveTest/flowLeaveTestAction!approveBoss.action', '21', '{\"taskId\":\"22\",\"approveBoss.suggest\":\"nnnn\",\"submit\":\"提交\",\"processId\":\"11\",\"method\":\"-1\",\"orderId\":\"5\"}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('23', null, '5', 'approveDept', '部门经理审批', '0', '0', 'sysadmin', '2017-03-11 12:59:44', '2017-03-11 13:01:28', null, null, null, '/jsp/flowLeaveTest/flowLeaveTestAction!approveDept.action', '13', '{\"taskId\":\"23\",\"nextOperator\":\"\",\"ccOperatorName\":\"\",\"submit\":\"提交\",\"processId\":\"11\",\"ccOperator\":\"admin\",\"nextOperatorName\":\"\",\"method\":\"0\",\"approveDept.suggest\":\"ddd\",\"orderId\":\"5\"}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('25', null, '6', 'task1', 'task1', '0', '0', '1', '2017-03-15 09:02:59', '2017-03-15 09:02:59', null, null, null, '', null, '{}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('26', null, '7', 'task1', 'task1', '0', '0', 'admin管理员', '2017-03-15 09:03:43', '2017-03-15 09:03:43', null, null, null, '', null, '{\"S-ACTOR\":\"admin管理员\",\"task1.operator\":[\"admin管理员\"]}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('29', null, '10', 'task1', 'task1', '0', '0', '1', '2017-03-15 09:16:16', '2017-03-15 09:16:16', null, null, null, '', null, '{}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('30', null, '11', 'task1', 'task1', '0', '0', '1', '2017-03-15 09:16:49', '2017-03-15 09:16:49', null, null, null, '', null, '{}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('31', null, '12', 'task1', 'task1', '0', '0', '1', '2017-03-15 09:17:21', '2017-03-15 09:17:21', null, null, null, '', null, '{}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('32', null, '13', 'task1', 'task1', '0', '0', '1', '2017-03-15 09:20:03', '2017-03-15 09:20:03', null, null, null, '', null, '{}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('33', null, '14', 'task1', 'task1', '0', '0', null, '2017-03-15 09:22:07', '2017-03-15 09:22:07', null, null, null, '', null, '{}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('34', null, '15', 'task1', 'task1', '0', '0', null, '2017-03-15 09:22:21', '2017-03-15 09:22:21', null, null, null, '', null, '{}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('35', null, '16', 'task1', 'task1', '0', '0', null, '2017-03-15 09:23:28', '2017-03-15 09:23:31', null, null, null, '', null, '{}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('37', null, '18', 'task1', 'task1', '0', '0', 'admin', '2017-03-15 09:33:22', '2017-03-15 09:33:22', null, null, null, '', null, '{}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('41', null, '22', 'task1', 'task1', '0', '0', '1', '2017-03-15 10:05:13', '2017-03-15 10:05:13', null, null, null, '', null, '{}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('44', null, '25', 'task1', 'task1', '0', '0', null, '2017-03-15 10:09:34', '2017-03-15 10:09:34', null, null, null, '', null, '{}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('46', null, '27', 'task1', 'task1', '0', '0', 'snaker.admin', '2017-03-15 10:10:05', '2017-03-15 10:10:05', null, null, null, '', null, '{\"S-ACTOR\":\"2\",\"task1.operator\":[\"2\"]}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('47', null, '28', 'task1', 'task1', '0', '0', '1', '2017-03-15 10:10:59', '2017-03-15 10:10:59', null, null, null, '', null, '{\"S-ACTOR\":\"1\",\"task1.operator\":[\"1\"]}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('63', null, '44', 'task1', 'task1', '0', '0', 'admin管理员', '2017-03-15 13:30:36', '2017-03-15 13:30:36', null, null, null, '', null, '{\"S-ACTOR\":\"admin管理员\",\"task1.operator\":[\"admin管理员\"]}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('67', null, '48', 'task1', 'task1', '0', '0', '1', '2017-03-15 13:34:25', '2017-03-15 13:34:25', null, null, null, '', null, '{}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('82', null, '74', 'task1', 'task1', '0', '0', '1', '2017-03-15 14:50:53', '2017-03-15 14:50:53', null, null, null, '', null, '{}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('85', null, '75', 'task1', 'task1', '0', '0', 'admin', '2017-03-15 14:51:08', '2017-03-15 14:51:08', null, null, null, '', null, '{}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('88', null, '78', 'task1', 'task1', '0', '0', null, '2017-03-15 14:53:03', '2017-03-15 14:53:03', null, null, null, '', null, '{}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('90', null, '80', 'task1', 'task1', '0', '0', 'snaker.admin', '2017-03-15 14:53:36', '2017-03-15 14:53:36', null, null, null, '', null, '{\"S-ACTOR\":\"2\",\"task1.operator\":[\"2\"]}', null, null, null, null, null, null);
INSERT INTO `flow_task_hist` VALUES ('91', null, '81', 'task1', 'task1', '0', '0', '1', '2017-03-15 14:53:58', '2017-03-15 14:53:58', null, null, null, '', null, '{}', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `upm_app`
-- ----------------------------
DROP TABLE IF EXISTS `upm_app`;
CREATE TABLE `upm_app` (
  `app_id` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_code` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of upm_app
-- ----------------------------
INSERT INTO `upm_app` VALUES ('UPM', 'UPM', 'UPM用户权限账号管理系统', 'http://localhost:8080/upm/', '1');
INSERT INTO `upm_app` VALUES ('CRM', 'CRM_APP2', 'CRM_APP2', 'http://localhost:8080/crm', '10');
INSERT INTO `upm_app` VALUES ('3', 'bsweb-app-redis', 'bsweb-app-redis', 'http://localhost:8080/bsweb-app-redis/', '11');

-- ----------------------------
-- Table structure for `upm_configuration`
-- ----------------------------
DROP TABLE IF EXISTS `upm_configuration`;
CREATE TABLE `upm_configuration` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cfg_key` varchar(200) DEFAULT NULL COMMENT '置配项KEY',
  `cfg_value` varchar(400) DEFAULT NULL COMMENT '置配项值',
  `cfg_desc` varchar(1024) DEFAULT NULL COMMENT '置配项描述',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upm_configuration
-- ----------------------------
INSERT INTO `upm_configuration` VALUES ('2', '2', '2', '22');
INSERT INTO `upm_configuration` VALUES ('3', '1', '1', '描述信息');
INSERT INTO `upm_configuration` VALUES ('4', 'key4', 'Value41', 'value4Desc');

-- ----------------------------
-- Table structure for `upm_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `upm_dictionary`;
CREATE TABLE `upm_dictionary` (
  `type_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data_code` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data_desc` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sort_no` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL,
  `app_id` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of upm_dictionary
-- ----------------------------
INSERT INTO `upm_dictionary` VALUES ('A', 'A', '河南', '1', '20', '7', null);
INSERT INTO `upm_dictionary` VALUES ('B', 'B', '北京', '1', '21', '7', null);
INSERT INTO `upm_dictionary` VALUES ('A', 'A', '郑州', '1', '22', '8', null);
INSERT INTO `upm_dictionary` VALUES ('B', 'B', '洛阳', '2', '23', '8', null);
INSERT INTO `upm_dictionary` VALUES ('A', 'A ', 'A类', '1', '24', '5', null);
INSERT INTO `upm_dictionary` VALUES ('B', 'B', '包装/B类', '2', '25', '5', null);
INSERT INTO `upm_dictionary` VALUES ('C', 'C', 'C类', '3', '26', '5', null);
INSERT INTO `upm_dictionary` VALUES ('D', 'D', '电力、电线电缆、电梯、地矿、电子、吊具、地质/D类', '4', '27', '5', null);
INSERT INTO `upm_dictionary` VALUES ('E', 'E', '纺织/E类', '5', '28', '5', null);
INSERT INTO `upm_dictionary` VALUES ('F', 'F', '工程检测、钢铁、光伏/G类', '6', '29', '5', null);
INSERT INTO `upm_dictionary` VALUES ('H', 'H', '航天、环境/H类', '7', '30', '5', null);
INSERT INTO `upm_dictionary` VALUES ('I', 'I', 'I类', '8', '31', '5', null);
INSERT INTO `upm_dictionary` VALUES ('J', 'J', '酒、机械、军工电子、建材、金属材料/J类', '10', '32', '5', null);
INSERT INTO `upm_dictionary` VALUES ('K', 'K', '矿业/K类', '11', '33', '5', null);
INSERT INTO `upm_dictionary` VALUES ('L', 'L', 'L类', '12', '34', '5', null);
INSERT INTO `upm_dictionary` VALUES ('zjhd', 'zjhd', '自己获得', '1', '35', '3', null);
INSERT INTO `upm_dictionary` VALUES ('khjs', 'khjs', '客户介绍', '2', '36', '3', null);
INSERT INTO `upm_dictionary` VALUES ('ldzx', 'ldzx', '来电咨询', '3', '37', '3', null);
INSERT INTO `upm_dictionary` VALUES ('qt', 'qt', '其他', '99', '38', '3', null);
INSERT INTO `upm_dictionary` VALUES ('A', 'A', 'A类', '1', '39', '4', null);
INSERT INTO `upm_dictionary` VALUES ('B', 'B', 'B类', '2', '41', '4', null);
INSERT INTO `upm_dictionary` VALUES ('C', 'C', 'C类', '3', '42', '4', null);
INSERT INTO `upm_dictionary` VALUES ('D', 'D', 'D类', '4', '43', '4', null);
INSERT INTO `upm_dictionary` VALUES ('E', 'E', 'E类', '5', '44', '4', null);
INSERT INTO `upm_dictionary` VALUES ('qt', 'qt', '其他', '99', '46', '4', null);
INSERT INTO `upm_dictionary` VALUES ('qt', 'qt', '其他', '99', '47', '5', null);
INSERT INTO `upm_dictionary` VALUES ('rkzl1', 'rkzl1', '17025', '1', '48', '6', null);
INSERT INTO `upm_dictionary` VALUES ('rkzl2', 'rkzl2', '15189', '2', '49', '6', null);
INSERT INTO `upm_dictionary` VALUES ('rkzl3', 'rkzl3', '17020', '3', '50', '6', null);
INSERT INTO `upm_dictionary` VALUES ('rkzl4', 'rkzl4', 'DILAC', '4', '51', '6', null);
INSERT INTO `upm_dictionary` VALUES ('rkzl5', 'rkzl5', 'CMA', '5', '52', '6', null);
INSERT INTO `upm_dictionary` VALUES ('RKZL6', 'RKZL6', '17025&CMA', '6', '53', '6', null);
INSERT INTO `upm_dictionary` VALUES ('rkzl7', 'rkzl7', '17025%17020', '7', '54', '6', null);
INSERT INTO `upm_dictionary` VALUES ('rkzl8', 'rkzl8', '17025&17020&DILAC', '8', '55', '6', null);
INSERT INTO `upm_dictionary` VALUES ('rkzl7', 'rjzk7', '17020&CMA', '9', '56', '6', null);
INSERT INTO `upm_dictionary` VALUES ('rkzl9', 'rkzl9', 'JJG1069', '10', '58', '6', null);
INSERT INTO `upm_dictionary` VALUES ('yjrk10', 'yjrk10', 'JJF1033', '11', '59', '6', null);
INSERT INTO `upm_dictionary` VALUES ('rkzl12', 'rkzl12', '17025&JJF1033', '12', '60', '6', null);
INSERT INTO `upm_dictionary` VALUES ('rkzl13', 'rkzl13', '17025&2725A', '13', '61', '6', null);
INSERT INTO `upm_dictionary` VALUES ('qt', 'qt', '其他', '99', '62', '6', null);
INSERT INTO `upm_dictionary` VALUES ('DATA_HANGY', '零售行业', '零售行业', '1', '63', '9', null);
INSERT INTO `upm_dictionary` VALUES ('DATA_HANGY', '酒店', '酒店', '2', '64', '9', null);
INSERT INTO `upm_dictionary` VALUES ('powerState', 'powerState', '1', '1', '65', '10', null);
INSERT INTO `upm_dictionary` VALUES ('powerState', 'powerState', '2', '2', '66', '10', null);
INSERT INTO `upm_dictionary` VALUES ('PowerType', '1', '菜单', '1', '67', '11', null);
INSERT INTO `upm_dictionary` VALUES ('PowerType', '2', '按钮', '2', '68', '11', null);

-- ----------------------------
-- Table structure for `upm_dictionary_note`
-- ----------------------------
DROP TABLE IF EXISTS `upm_dictionary_note`;
CREATE TABLE `upm_dictionary_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_Code` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_Desc` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_id` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of upm_dictionary_note
-- ----------------------------
INSERT INTO `upm_dictionary_note` VALUES ('3', 'DATA_CUST_TYPE', '客户类型', null);
INSERT INTO `upm_dictionary_note` VALUES ('4', 'DATA_CUST_LEVEL', '客户分级', null);
INSERT INTO `upm_dictionary_note` VALUES ('5', 'DATA_CHECK_AREA', '检测/校准领域', null);
INSERT INTO `upm_dictionary_note` VALUES ('6', 'DATA_RENKEY_ZHONGLEI', '预计认可种类', null);
INSERT INTO `upm_dictionary_note` VALUES ('7', 'DATA_PROVENCE_NAME', '省份', null);
INSERT INTO `upm_dictionary_note` VALUES ('8', 'DATA_PRO_AREA', '地市', null);
INSERT INTO `upm_dictionary_note` VALUES ('9', 'DATA_HANGYE', '行业', null);
INSERT INTO `upm_dictionary_note` VALUES ('10', 'powerState', '权限状态', '');
INSERT INTO `upm_dictionary_note` VALUES ('11', 'PowerType', '权限类型', '');

-- ----------------------------
-- Table structure for `upm_file`
-- ----------------------------
DROP TABLE IF EXISTS `upm_file`;
CREATE TABLE `upm_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `relateId1` varchar(20) DEFAULT NULL COMMENT 'relateId1',
  `relateId2` varchar(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `optdate` datetime DEFAULT NULL COMMENT 'optdate',
  `operator` int(11) DEFAULT NULL COMMENT 'operator',
  `content` varchar(4000) DEFAULT NULL COMMENT 'content',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upm_file
-- ----------------------------

-- ----------------------------
-- Table structure for `upm_notice`
-- ----------------------------
DROP TABLE IF EXISTS `upm_notice`;
CREATE TABLE `upm_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `TYPE_ID` varchar(50) DEFAULT NULL COMMENT '类别ID',
  `content` varchar(4000) DEFAULT NULL COMMENT '内容',
  `paramA` varchar(200) DEFAULT NULL COMMENT 'paramA',
  `paramB` varchar(200) DEFAULT NULL,
  `send_Begin_Date` datetime DEFAULT NULL COMMENT '发送开始时间',
  `send_End_Date` datetime DEFAULT NULL COMMENT '发送结束日期',
  `createDate_Time` datetime DEFAULT NULL COMMENT '创建日期',
  `ext_Code` varchar(200) DEFAULT NULL COMMENT '扩展code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upm_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `upm_organization`
-- ----------------------------
DROP TABLE IF EXISTS `upm_organization`;
CREATE TABLE `upm_organization` (
  `org_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `org_name` varchar(500) DEFAULT NULL COMMENT '组织机构名称',
  `org_desc` varchar(1024) DEFAULT NULL COMMENT '组织机构描述',
  `sort_no` int(4) DEFAULT NULL COMMENT '排序编号',
  `org_level` int(11) DEFAULT NULL COMMENT '组织机构级别',
  `flag` int(11) DEFAULT NULL COMMENT '识标',
  `parent_id` int(11) DEFAULT NULL COMMENT '父ID',
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upm_organization
-- ----------------------------

-- ----------------------------
-- Table structure for `upm_permission`
-- ----------------------------
DROP TABLE IF EXISTS `upm_permission`;
CREATE TABLE `upm_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_Id` int(11) DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key_code` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortNo` int(11) DEFAULT NULL,
  `icon_Path` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_By` int(11) DEFAULT NULL,
  `create_Date` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `update_Date` datetime DEFAULT NULL,
  `enable_Flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lock_Status` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of upm_permission
-- ----------------------------
INSERT INTO `upm_permission` VALUES ('1', 'CRM', '0', 'CRM应用', 'APP', '', 'APP_02', '', '0', '', '1', '../images/image01.jpg', '2', '2016-01-02 00:00:00', '0', '2016-01-25 09:28:13', 'T', '0');
INSERT INTO `upm_permission` VALUES ('2', 'CRM', '1', '市场部流程', 'MENU', '', 'MARKET_FLOW_MENU', '', '0', '', '1', '', '2', '2016-01-12 00:00:00', '2', '2016-01-28 09:07:17', 'T', '0');
INSERT INTO `upm_permission` VALUES ('3', 'CRM', '2', '客户管理', 'MENU', '/loginAction!login.action', 'LOGIN_MENU', '', '0', '11', '1', '../images/image01.jpg', '2', '2016-01-05 00:00:00', '0', '2016-01-14 00:00:00', 'T', '0');
INSERT INTO `upm_permission` VALUES ('4', 'UPM', '0', 'UPM', 'APP', '', 'APP_01', '', '0', '', '1', '', '2', '2016-01-12 00:00:00', '0', '2016-01-14 00:00:00', 'T', '0');
INSERT INTO `upm_permission` VALUES ('6', 'CRM', '3', '新增', 'BUTTON', '', 'save', 'USER:SAVE', '0', '1', '1', '', '2', '2016-01-12 00:00:00', '0', '2016-01-14 00:00:00', 'T', '0');
INSERT INTO `upm_permission` VALUES ('7', 'CRM', '3', '修改', 'BUTTON', '', 'UPDATE', 'USER:UPDATE', '0', '', '2', '', '2', '2016-01-12 00:00:00', '0', '2016-01-14 00:00:00', 'T', '0');
INSERT INTO `upm_permission` VALUES ('8', 'CRM', '3', '删除', 'BUTTON', '', 'DEL', 'USER:DELETE', '0', '1', '3', '', '2', '2016-01-12 00:00:00', '0', '2016-01-14 00:00:00', 'T', '0');
INSERT INTO `upm_permission` VALUES ('9', 'CRM', '3', '查看', 'BUTTON', '', 'VIEW', 'USER:VIEW', '0', '', '3', '', '2', '2016-01-12 00:00:00', '0', '2016-01-14 00:00:00', 'T', '0');
INSERT INTO `upm_permission` VALUES ('10', 'CRM', '3', '初访', 'BUTTON', null, 'VISTI', 'markert:firtVist', '0', '1', '4', null, '2', '2016-01-25 21:40:14', '0', '2016-01-25 21:40:21', 'T', '0');
INSERT INTO `upm_permission` VALUES ('11', 'CRM', '3', '合同洽谈', 'BUTTON', null, 'CONSTRACT', 'market:constract', '0', '1', '5', null, '2', '2016-01-25 21:42:20', '0', '2016-01-25 21:42:26', 'T', '0');
INSERT INTO `upm_permission` VALUES ('12', 'CRM', '10', '初访申请', 'BUTTON', null, 'VIST_APPLY', 'market:vist_apply', '0', '1', '5', null, '2', '2016-01-25 21:47:15', '0', '2016-01-25 21:47:20', 'T', '0');
INSERT INTO `upm_permission` VALUES ('13', 'CRM', '10', '市场部审批', 'BUTTON', null, 'VIST_APPROVE_1', 'maket_vist_approve_1', '0', '1', '1', null, '2', '2016-01-25 21:48:40', '0', '2016-01-25 21:48:45', 'T', '0');
INSERT INTO `upm_permission` VALUES ('14', 'CRM', '10', '初访实施', 'BUTTON', null, 'VIST_do', 'market_vist_do', '0', '1', '1', null, '2', '2016-01-25 21:50:27', '0', '2016-01-25 21:50:35', 'T', '0');
INSERT INTO `upm_permission` VALUES ('15', 'CRM', '11', '市场部申请', 'BUTTON', '', 'MARKET_CONSTRACT_APPLY', 'MARKET_CONSTRACT_APPLY', '0', '1', '1', '', '2', '2016-01-25 21:53:40', '2', '2016-01-28 10:08:14', 'T', '0');
INSERT INTO `upm_permission` VALUES ('16', 'CRM', '11', '市场部经理审批', 'BUTTON', '', 'MARKET_CONSTRACT_APPROVE_1', 'MARKET_CONSTRACT_APPROVE_1', '0', '', '2', '', '2', '2016-01-25 21:55:17', '2', '2016-01-28 10:09:36', 'T', '0');
INSERT INTO `upm_permission` VALUES ('17', 'CRM', '11', '总经理审批', 'BUTTON', '', 'MARKET_CONSTRACT_APPROVE_2', 'MARKET_CONSTRACT_APPROVE_2', '0', '', '1', '', '2', '2016-01-25 21:56:22', '2', '2016-01-28 10:10:20', 'T', '0');
INSERT INTO `upm_permission` VALUES ('18', 'CRM', '11', '内勤上传附件', 'BUTTON', '', 'MARKET_CONSTRACT_NEIQIN', 'MARKET_CONSTRACT_NEIQIN', '0', '1', '1', '', '2', '2016-01-25 21:58:22', '2', '2016-01-28 10:11:04', 'T', '0');
INSERT INTO `upm_permission` VALUES ('19', 'CRM', '11', '合同流程查看', 'BUTTON', '', 'CONTRACT_MARKET_VIEW', 'CONTRACT_MARKET_VIEW', '0', '', '5', '', '2', '2016-01-28 10:06:46', '0', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('20', 'CRM', '1', '公共权限', 'MENU', null, 'COMMON_PERMISSION', 'COMMON_PERMISSION', '0', '1', '1', null, '2', '2016-02-01 20:31:18', '2', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('21', 'CRM', '20', '导入EXCEL', 'BUTTON', null, 'COMMON_IMPORT_EXCEL_BTN', 'COMMON_IMPORT_EXCEL_BTN', '0', '1', '1', null, '2', '2016-02-01 20:32:37', '2', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('22', 'CRM', '20', '导出EXCEL', 'BUTTON', null, 'COMMON_EXPORT_EXCEL_BTN', 'COMMON_EXPORT_EXCEL_BTN', '0', '1', '2', null, '2', '2016-02-01 20:33:53', '2', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('23', 'CRM', '20', '附件上传', 'BUTTON', null, 'COMMON_FILE_UPLOAD_BTN', 'COMMON_FILE_UPLOAD_BTN', '0', '1', '3', null, '2', '2016-02-01 20:35:02', '2', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('24', 'CRM', '20', '附件下载', 'BUTTON', null, 'COMMON_FILE_DOWNLOAD_BTN', 'COMMON_FILE_DOWNLOAD_BTN', '0', '1', '4', null, '2', '2016-02-01 20:35:55', '2', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('25', 'CRM', '20', '附件查看', 'BUTTON', null, 'COMMON_FILE_VIEW_BTN', 'COMMON_FILE_VIEW_BTN', '0', '1', '5', null, '2', '2016-02-01 20:36:57', '2', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('26', 'CRM', '10', '初访分派人员', 'BUTTON', null, 'VIST_SELECT', 'VIST_SELECT', '0', '1', '4', null, '2', '2016-02-01 20:59:40', '2', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('27', 'CRM', '3', '流单', 'BUTTON', null, 'LOST_ORDER_BTN', 'LOST_ORDER_BTN', '0', '1', '5', null, '2', '2016-02-01 21:04:24', '2', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('28', 'CRM', '3', '报备', 'BUTTON', null, 'BAO_BEI_BTN', 'BAO_BEI_BTN', '0', '1', '6', null, '2', '2016-02-01 21:05:39', '2', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('29', 'CRM', '1', '权限管理', 'MENU', null, 'UPM_MENUS', 'UPM_MENUS', '0', '1', '1', null, '2', '2016-02-01 21:41:55', null, null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('30', 'CRM', '29', '用户管理', 'MENU', 'http://localhost:8080/upm/jsp/user/upmUserList.jsp', 'UPM_USER_MANAGE_MENU', 'UPM_USER_MANAGE_MENU', '0', '1', '1', null, '2', null, '2', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('31', 'CRM', '29', '组织机构管理', 'MENU', 'http://localhost:8080/upm/jsp/user/upmUserGroupTreeList.jsp', 'UPM_USER_GROUP_MENU', 'UPM_USER_GROUP_MENU', '0', '1', '2', null, '2', null, '2', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('32', 'CRM', '29', '角色管理', 'MENU', 'http://localhost:8080/upm/jsp/role/upmRoleList.jsp', 'UPM_ROLE_MANAGE_MENU', 'UPM_ROLE_MANAGE_MENU', '0', '1', '3', null, '2', null, '2', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('33', 'CRM', '29', '权限管理', 'MENU', 'http://localhost:8080/upm/jsp/role/upmPermissionList.jsp', 'UPM_PERMISSION_MENU', 'UPM_PERMISSION_MENU', '0', '1', '4', null, '2', null, null, null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('34', 'CRM', '29', '权限树管理', 'MENU', 'http://localhost:8080/upm/jsp/role/upmPermissionTreeList.jsp', 'UPM_PERMISSION_TREE_MENU', 'UPM_PERMISSION_TREE_MENU', '0', null, '5', null, '2', null, null, null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('35', 'CRM', '29', '应用管理', 'MENU', 'http://localhost:8080/upm/jsp/upmApp/upmAppList.jsp', 'UPM_APP_MANAGE_MENU', 'UPM_APP_MANAGE_MENU', '0', null, '6', null, '2', null, null, null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('36', 'CRM', '29', '数据字典管理', 'MENU', 'http://localhost:8080/upm/jsp/dictionary/upmDictionaryNoteList.jsp', 'UPM_DICT_MENU', 'UPM_DICT_MENU', '0', null, '7', null, '2', null, null, null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('37', 'CRM', '3', '二次报备', 'BUTTON', '', 'BAO_BEI2_BTN', 'BAO_BEI2_BTN', '0', '', '8', '', '2', '2016-03-14 06:34:17', '0', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('38', 'CRM', '37', '二次报备申请', 'FLOW', '', 'MARKET_BAOBEI_APPLY', 'MARKET_BAOBEI_APPLY', '0', '', '1', '', '2', '2016-03-14 06:35:25', '0', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('39', 'CRM', '37', '二次报备审批', 'FLOW', '', 'MARKET_BAOBEI2_APPROVE_1', 'MARKET_BAOBEI2_APPROVE_1', '0', '', '2', '', '2', '2016-03-14 06:36:17', '0', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('40', 'CRM', '37', '二次报备查看', 'FLOW', '', 'CONTRACT_BAOBEI2_VIEW', 'CONTRACT_BAOBEI2_VIEW', '0', '', '3', '', '2', '2016-03-14 06:36:58', '0', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('41', 'CRM', '37', '二次报备清空', 'FLOW', '', 'CONTRACT_BAOBEI2_CLEAN', 'CONTRACT_BAOBEI2_CLEAN', '0', '', '99', '', '2', '2016-03-14 06:38:18', '0', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('42', 'CRM', '10', '初访删除', 'BUTTON', '', 'FIRST_VIST_CLEAN', 'FIRST_VIST_CLEAN', '0', '', '5', '', '2', '2016-03-17 07:01:57', '0', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('43', 'CRM', '3', '合同清空', 'BUTTON', '', 'CONTRACT_CLEAN', 'CONTRACT_CLEAN', '0', '', '1', '', '2', '2016-03-19 10:13:24', '0', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('46', 'CRM', '1', 'ggg', null, 'gg', 'gggg', null, '0', 'gg', '1', null, '2', '2016-04-19 08:09:00', '0', null, 'T', '0');
INSERT INTO `upm_permission` VALUES ('47', 'UPM', '0', '应用系统', 'APP', '', 'APP', '', '0', '', '1', '', '2', '2016-01-12 00:00:00', '0', '2016-01-14 00:00:00', 'T', '0');

-- ----------------------------
-- Table structure for `upm_role`
-- ----------------------------
DROP TABLE IF EXISTS `upm_role`;
CREATE TABLE `upm_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_id` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_By` int(11) DEFAULT NULL,
  `create_Date` datetime DEFAULT NULL,
  `update_By` int(11) DEFAULT NULL,
  `update_Date` datetime DEFAULT NULL,
  `enable_Flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lock_Status` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_desc` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of upm_role
-- ----------------------------
INSERT INTO `upm_role` VALUES ('4', 'MARKET_MANAGER', 'CRM', '市场部总经理', '0', '2016-01-10 00:00:00', '0', '2016-01-10 00:00:00', null, null, null);
INSERT INTO `upm_role` VALUES ('5', 'AREA_MANAGER', 'CRM', '市场部区域经理', '0', '2016-01-26 20:30:49', '0', '2016-01-26 20:33:17', null, null, null);
INSERT INTO `upm_role` VALUES ('6', 'SALE_MANAGER', 'CRM', '市场部销售经理', '0', '2016-01-26 20:31:36', '0', '2016-01-26 20:33:20', null, null, null);
INSERT INTO `upm_role` VALUES ('7', 'SALE_ASSISTANT', 'CRM', '销售助理', '0', '2016-01-26 20:32:15', '0', '2016-01-26 20:33:23', null, null, null);
INSERT INTO `upm_role` VALUES ('8', 'INTERNAL_OFFICE', 'CRM', '内勤', '0', '2016-01-26 20:36:25', '0', '2016-01-26 20:36:29', null, null, null);
INSERT INTO `upm_role` VALUES ('9', 'FINANCE', 'CRM', '财务', '0', '2016-01-26 20:38:05', '0', '2016-01-26 20:38:13', null, null, null);
INSERT INTO `upm_role` VALUES ('11', 'manager', 'CRM', '总经理', '2', '2016-02-01 10:47:29', '2', '2016-02-01 11:49:24', null, null, null);
INSERT INTO `upm_role` VALUES ('12', 'serviceper', 'CRM', '咨询部经理', '2', '2016-02-01 11:08:47', '2', '2016-02-01 01:25:21', null, null, null);
INSERT INTO `upm_role` VALUES ('13', 'customer', 'CRM', '客服部经理', '2', '2016-02-01 11:46:47', '2', '2016-02-01 01:25:49', null, null, null);
INSERT INTO `upm_role` VALUES ('14', 'sv-manager', 'CRM', '咨询师', '2', '2016-02-01 11:47:42', '2', '2016-02-01 01:26:10', null, null, null);
INSERT INTO `upm_role` VALUES ('15', 'kf-manager', 'CRM', '客服部助理', '2', '2016-02-01 11:48:08', '0', null, null, null, null);
INSERT INTO `upm_role` VALUES ('1000', 'UPM', 'CRM', 'UPM系统管理员', null, null, '34', '2017-03-07 05:33:09', '', '', '');
INSERT INTO `upm_role` VALUES ('2000', 'CRM', 'CRM', 'CRM系统管理员', '0', null, '2', '2016-06-20 07:56:29', 'T', '0', 'eeeee');

-- ----------------------------
-- Table structure for `upm_role_and_permission_rel`
-- ----------------------------
DROP TABLE IF EXISTS `upm_role_and_permission_rel`;
CREATE TABLE `upm_role_and_permission_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=477 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of upm_role_and_permission_rel
-- ----------------------------
INSERT INTO `upm_role_and_permission_rel` VALUES ('59', '2', '3');
INSERT INTO `upm_role_and_permission_rel` VALUES ('60', '2', '11');
INSERT INTO `upm_role_and_permission_rel` VALUES ('61', '2', '12');
INSERT INTO `upm_role_and_permission_rel` VALUES ('62', '2', '15');
INSERT INTO `upm_role_and_permission_rel` VALUES ('63', '2', '16');
INSERT INTO `upm_role_and_permission_rel` VALUES ('64', '2', '17');
INSERT INTO `upm_role_and_permission_rel` VALUES ('65', '2', '0');
INSERT INTO `upm_role_and_permission_rel` VALUES ('66', '2', '1');
INSERT INTO `upm_role_and_permission_rel` VALUES ('67', '2', '2');
INSERT INTO `upm_role_and_permission_rel` VALUES ('68', '2', '4');
INSERT INTO `upm_role_and_permission_rel` VALUES ('69', '2', '6');
INSERT INTO `upm_role_and_permission_rel` VALUES ('70', '2', '7');
INSERT INTO `upm_role_and_permission_rel` VALUES ('71', '2', '8');
INSERT INTO `upm_role_and_permission_rel` VALUES ('72', '2', '9');
INSERT INTO `upm_role_and_permission_rel` VALUES ('73', '2', '10');
INSERT INTO `upm_role_and_permission_rel` VALUES ('74', '2', '13');
INSERT INTO `upm_role_and_permission_rel` VALUES ('75', '2', '14');
INSERT INTO `upm_role_and_permission_rel` VALUES ('76', '2', '18');
INSERT INTO `upm_role_and_permission_rel` VALUES ('77', '2', '19');
INSERT INTO `upm_role_and_permission_rel` VALUES ('79', '5', '9');
INSERT INTO `upm_role_and_permission_rel` VALUES ('81', '5', '10');
INSERT INTO `upm_role_and_permission_rel` VALUES ('82', '5', '2');
INSERT INTO `upm_role_and_permission_rel` VALUES ('83', '4', '9');
INSERT INTO `upm_role_and_permission_rel` VALUES ('84', '4', '21');
INSERT INTO `upm_role_and_permission_rel` VALUES ('85', '4', '22');
INSERT INTO `upm_role_and_permission_rel` VALUES ('86', '4', '11');
INSERT INTO `upm_role_and_permission_rel` VALUES ('87', '4', '12');
INSERT INTO `upm_role_and_permission_rel` VALUES ('88', '4', '13');
INSERT INTO `upm_role_and_permission_rel` VALUES ('89', '4', '14');
INSERT INTO `upm_role_and_permission_rel` VALUES ('90', '4', '15');
INSERT INTO `upm_role_and_permission_rel` VALUES ('91', '6', '6');
INSERT INTO `upm_role_and_permission_rel` VALUES ('92', '6', '7');
INSERT INTO `upm_role_and_permission_rel` VALUES ('93', '6', '9');
INSERT INTO `upm_role_and_permission_rel` VALUES ('94', '6', '10');
INSERT INTO `upm_role_and_permission_rel` VALUES ('95', '6', '11');
INSERT INTO `upm_role_and_permission_rel` VALUES ('96', '6', '12');
INSERT INTO `upm_role_and_permission_rel` VALUES ('97', '6', '14');
INSERT INTO `upm_role_and_permission_rel` VALUES ('98', '7', '6');
INSERT INTO `upm_role_and_permission_rel` VALUES ('99', '7', '7');
INSERT INTO `upm_role_and_permission_rel` VALUES ('100', '7', '9');
INSERT INTO `upm_role_and_permission_rel` VALUES ('101', '7', '12');
INSERT INTO `upm_role_and_permission_rel` VALUES ('102', '7', '2');
INSERT INTO `upm_role_and_permission_rel` VALUES ('103', '6', '2');
INSERT INTO `upm_role_and_permission_rel` VALUES ('104', '4', '2');
INSERT INTO `upm_role_and_permission_rel` VALUES ('105', '11', '2');
INSERT INTO `upm_role_and_permission_rel` VALUES ('106', '11', '3');
INSERT INTO `upm_role_and_permission_rel` VALUES ('107', '11', '4');
INSERT INTO `upm_role_and_permission_rel` VALUES ('108', '11', '6');
INSERT INTO `upm_role_and_permission_rel` VALUES ('109', '11', '7');
INSERT INTO `upm_role_and_permission_rel` VALUES ('110', '11', '8');
INSERT INTO `upm_role_and_permission_rel` VALUES ('111', '11', '9');
INSERT INTO `upm_role_and_permission_rel` VALUES ('112', '11', '10');
INSERT INTO `upm_role_and_permission_rel` VALUES ('113', '11', '11');
INSERT INTO `upm_role_and_permission_rel` VALUES ('114', '11', '12');
INSERT INTO `upm_role_and_permission_rel` VALUES ('115', '11', '13');
INSERT INTO `upm_role_and_permission_rel` VALUES ('116', '11', '14');
INSERT INTO `upm_role_and_permission_rel` VALUES ('117', '11', '15');
INSERT INTO `upm_role_and_permission_rel` VALUES ('118', '11', '16');
INSERT INTO `upm_role_and_permission_rel` VALUES ('119', '11', '17');
INSERT INTO `upm_role_and_permission_rel` VALUES ('120', '11', '18');
INSERT INTO `upm_role_and_permission_rel` VALUES ('121', '11', '19');
INSERT INTO `upm_role_and_permission_rel` VALUES ('122', '11', '21');
INSERT INTO `upm_role_and_permission_rel` VALUES ('123', '11', '22');
INSERT INTO `upm_role_and_permission_rel` VALUES ('124', '8', '8');
INSERT INTO `upm_role_and_permission_rel` VALUES ('125', '8', '9');
INSERT INTO `upm_role_and_permission_rel` VALUES ('126', '9', '7');
INSERT INTO `upm_role_and_permission_rel` VALUES ('127', '9', '9');
INSERT INTO `upm_role_and_permission_rel` VALUES ('128', '12', '9');
INSERT INTO `upm_role_and_permission_rel` VALUES ('129', '12', '10');
INSERT INTO `upm_role_and_permission_rel` VALUES ('130', '12', '14');
INSERT INTO `upm_role_and_permission_rel` VALUES ('131', '12', '21');
INSERT INTO `upm_role_and_permission_rel` VALUES ('132', '12', '22');
INSERT INTO `upm_role_and_permission_rel` VALUES ('133', '8', '18');
INSERT INTO `upm_role_and_permission_rel` VALUES ('134', '13', '7');
INSERT INTO `upm_role_and_permission_rel` VALUES ('135', '13', '9');
INSERT INTO `upm_role_and_permission_rel` VALUES ('136', '13', '10');
INSERT INTO `upm_role_and_permission_rel` VALUES ('137', '13', '21');
INSERT INTO `upm_role_and_permission_rel` VALUES ('138', '13', '22');
INSERT INTO `upm_role_and_permission_rel` VALUES ('139', '14', '6');
INSERT INTO `upm_role_and_permission_rel` VALUES ('140', '14', '7');
INSERT INTO `upm_role_and_permission_rel` VALUES ('141', '14', '9');
INSERT INTO `upm_role_and_permission_rel` VALUES ('142', '14', '10');
INSERT INTO `upm_role_and_permission_rel` VALUES ('143', '14', '14');
INSERT INTO `upm_role_and_permission_rel` VALUES ('144', '15', '6');
INSERT INTO `upm_role_and_permission_rel` VALUES ('145', '15', '7');
INSERT INTO `upm_role_and_permission_rel` VALUES ('146', '15', '9');
INSERT INTO `upm_role_and_permission_rel` VALUES ('147', '15', '14');
INSERT INTO `upm_role_and_permission_rel` VALUES ('148', '5', '12');
INSERT INTO `upm_role_and_permission_rel` VALUES ('149', '5', '14');
INSERT INTO `upm_role_and_permission_rel` VALUES ('150', '6', '18');
INSERT INTO `upm_role_and_permission_rel` VALUES ('151', '9', '6');
INSERT INTO `upm_role_and_permission_rel` VALUES ('188', '12', '26');
INSERT INTO `upm_role_and_permission_rel` VALUES ('189', '6', '15');
INSERT INTO `upm_role_and_permission_rel` VALUES ('190', '4', '16');
INSERT INTO `upm_role_and_permission_rel` VALUES ('191', '14', '2');
INSERT INTO `upm_role_and_permission_rel` VALUES ('192', '14', '26');
INSERT INTO `upm_role_and_permission_rel` VALUES ('193', '6', '37');
INSERT INTO `upm_role_and_permission_rel` VALUES ('194', '6', '38');
INSERT INTO `upm_role_and_permission_rel` VALUES ('195', '6', '40');
INSERT INTO `upm_role_and_permission_rel` VALUES ('196', '4', '39');
INSERT INTO `upm_role_and_permission_rel` VALUES ('220', '23', '1');
INSERT INTO `upm_role_and_permission_rel` VALUES ('221', '23', '29');
INSERT INTO `upm_role_and_permission_rel` VALUES ('222', '23', '30');
INSERT INTO `upm_role_and_permission_rel` VALUES ('223', '23', '31');
INSERT INTO `upm_role_and_permission_rel` VALUES ('224', '23', '32');
INSERT INTO `upm_role_and_permission_rel` VALUES ('225', '23', '33');
INSERT INTO `upm_role_and_permission_rel` VALUES ('226', '23', '34');
INSERT INTO `upm_role_and_permission_rel` VALUES ('227', '23', '35');
INSERT INTO `upm_role_and_permission_rel` VALUES ('228', '23', '36');
INSERT INTO `upm_role_and_permission_rel` VALUES ('229', '24', '1');
INSERT INTO `upm_role_and_permission_rel` VALUES ('230', '24', '29');
INSERT INTO `upm_role_and_permission_rel` VALUES ('231', '24', '30');
INSERT INTO `upm_role_and_permission_rel` VALUES ('232', '24', '31');
INSERT INTO `upm_role_and_permission_rel` VALUES ('233', '24', '32');
INSERT INTO `upm_role_and_permission_rel` VALUES ('234', '24', '33');
INSERT INTO `upm_role_and_permission_rel` VALUES ('235', '24', '34');
INSERT INTO `upm_role_and_permission_rel` VALUES ('236', '24', '35');
INSERT INTO `upm_role_and_permission_rel` VALUES ('237', '24', '36');
INSERT INTO `upm_role_and_permission_rel` VALUES ('238', '25', '1');
INSERT INTO `upm_role_and_permission_rel` VALUES ('239', '25', '29');
INSERT INTO `upm_role_and_permission_rel` VALUES ('240', '25', '30');
INSERT INTO `upm_role_and_permission_rel` VALUES ('241', '25', '31');
INSERT INTO `upm_role_and_permission_rel` VALUES ('242', '25', '32');
INSERT INTO `upm_role_and_permission_rel` VALUES ('243', '25', '33');
INSERT INTO `upm_role_and_permission_rel` VALUES ('244', '25', '34');
INSERT INTO `upm_role_and_permission_rel` VALUES ('245', '25', '35');
INSERT INTO `upm_role_and_permission_rel` VALUES ('246', '25', '36');
INSERT INTO `upm_role_and_permission_rel` VALUES ('247', '26', '1');
INSERT INTO `upm_role_and_permission_rel` VALUES ('248', '26', '29');
INSERT INTO `upm_role_and_permission_rel` VALUES ('249', '26', '30');
INSERT INTO `upm_role_and_permission_rel` VALUES ('250', '26', '31');
INSERT INTO `upm_role_and_permission_rel` VALUES ('251', '26', '32');
INSERT INTO `upm_role_and_permission_rel` VALUES ('252', '26', '33');
INSERT INTO `upm_role_and_permission_rel` VALUES ('253', '26', '34');
INSERT INTO `upm_role_and_permission_rel` VALUES ('254', '26', '35');
INSERT INTO `upm_role_and_permission_rel` VALUES ('255', '26', '36');
INSERT INTO `upm_role_and_permission_rel` VALUES ('256', '27', '1');
INSERT INTO `upm_role_and_permission_rel` VALUES ('257', '27', '29');
INSERT INTO `upm_role_and_permission_rel` VALUES ('258', '27', '30');
INSERT INTO `upm_role_and_permission_rel` VALUES ('259', '27', '31');
INSERT INTO `upm_role_and_permission_rel` VALUES ('260', '27', '32');
INSERT INTO `upm_role_and_permission_rel` VALUES ('261', '27', '33');
INSERT INTO `upm_role_and_permission_rel` VALUES ('262', '27', '34');
INSERT INTO `upm_role_and_permission_rel` VALUES ('263', '27', '35');
INSERT INTO `upm_role_and_permission_rel` VALUES ('264', '27', '36');
INSERT INTO `upm_role_and_permission_rel` VALUES ('265', '28', '1');
INSERT INTO `upm_role_and_permission_rel` VALUES ('266', '28', '29');
INSERT INTO `upm_role_and_permission_rel` VALUES ('267', '28', '30');
INSERT INTO `upm_role_and_permission_rel` VALUES ('268', '28', '31');
INSERT INTO `upm_role_and_permission_rel` VALUES ('269', '28', '32');
INSERT INTO `upm_role_and_permission_rel` VALUES ('270', '28', '33');
INSERT INTO `upm_role_and_permission_rel` VALUES ('271', '28', '34');
INSERT INTO `upm_role_and_permission_rel` VALUES ('272', '28', '35');
INSERT INTO `upm_role_and_permission_rel` VALUES ('273', '28', '36');
INSERT INTO `upm_role_and_permission_rel` VALUES ('274', '29', '1');
INSERT INTO `upm_role_and_permission_rel` VALUES ('275', '29', '29');
INSERT INTO `upm_role_and_permission_rel` VALUES ('276', '29', '30');
INSERT INTO `upm_role_and_permission_rel` VALUES ('277', '29', '31');
INSERT INTO `upm_role_and_permission_rel` VALUES ('278', '29', '32');
INSERT INTO `upm_role_and_permission_rel` VALUES ('279', '29', '33');
INSERT INTO `upm_role_and_permission_rel` VALUES ('280', '29', '34');
INSERT INTO `upm_role_and_permission_rel` VALUES ('281', '29', '35');
INSERT INTO `upm_role_and_permission_rel` VALUES ('282', '29', '36');
INSERT INTO `upm_role_and_permission_rel` VALUES ('283', '26', '1');
INSERT INTO `upm_role_and_permission_rel` VALUES ('284', '26', '29');
INSERT INTO `upm_role_and_permission_rel` VALUES ('285', '26', '30');
INSERT INTO `upm_role_and_permission_rel` VALUES ('286', '26', '31');
INSERT INTO `upm_role_and_permission_rel` VALUES ('287', '26', '32');
INSERT INTO `upm_role_and_permission_rel` VALUES ('288', '26', '33');
INSERT INTO `upm_role_and_permission_rel` VALUES ('289', '26', '34');
INSERT INTO `upm_role_and_permission_rel` VALUES ('290', '26', '35');
INSERT INTO `upm_role_and_permission_rel` VALUES ('291', '26', '36');
INSERT INTO `upm_role_and_permission_rel` VALUES ('292', '30', '1');
INSERT INTO `upm_role_and_permission_rel` VALUES ('293', '30', '29');
INSERT INTO `upm_role_and_permission_rel` VALUES ('294', '30', '30');
INSERT INTO `upm_role_and_permission_rel` VALUES ('295', '30', '31');
INSERT INTO `upm_role_and_permission_rel` VALUES ('296', '30', '32');
INSERT INTO `upm_role_and_permission_rel` VALUES ('297', '30', '33');
INSERT INTO `upm_role_and_permission_rel` VALUES ('298', '30', '34');
INSERT INTO `upm_role_and_permission_rel` VALUES ('299', '30', '35');
INSERT INTO `upm_role_and_permission_rel` VALUES ('300', '30', '36');
INSERT INTO `upm_role_and_permission_rel` VALUES ('340', '31', '1');
INSERT INTO `upm_role_and_permission_rel` VALUES ('341', '31', '2');
INSERT INTO `upm_role_and_permission_rel` VALUES ('342', '31', '3');
INSERT INTO `upm_role_and_permission_rel` VALUES ('343', '31', '6');
INSERT INTO `upm_role_and_permission_rel` VALUES ('344', '31', '7');
INSERT INTO `upm_role_and_permission_rel` VALUES ('345', '31', '8');
INSERT INTO `upm_role_and_permission_rel` VALUES ('346', '31', '9');
INSERT INTO `upm_role_and_permission_rel` VALUES ('347', '31', '10');
INSERT INTO `upm_role_and_permission_rel` VALUES ('348', '31', '11');
INSERT INTO `upm_role_and_permission_rel` VALUES ('349', '31', '12');
INSERT INTO `upm_role_and_permission_rel` VALUES ('350', '31', '13');
INSERT INTO `upm_role_and_permission_rel` VALUES ('351', '31', '14');
INSERT INTO `upm_role_and_permission_rel` VALUES ('352', '31', '15');
INSERT INTO `upm_role_and_permission_rel` VALUES ('353', '31', '16');
INSERT INTO `upm_role_and_permission_rel` VALUES ('354', '31', '17');
INSERT INTO `upm_role_and_permission_rel` VALUES ('355', '31', '18');
INSERT INTO `upm_role_and_permission_rel` VALUES ('356', '31', '19');
INSERT INTO `upm_role_and_permission_rel` VALUES ('357', '31', '26');
INSERT INTO `upm_role_and_permission_rel` VALUES ('358', '31', '27');
INSERT INTO `upm_role_and_permission_rel` VALUES ('359', '31', '28');
INSERT INTO `upm_role_and_permission_rel` VALUES ('360', '31', '29');
INSERT INTO `upm_role_and_permission_rel` VALUES ('361', '31', '30');
INSERT INTO `upm_role_and_permission_rel` VALUES ('362', '31', '31');
INSERT INTO `upm_role_and_permission_rel` VALUES ('363', '31', '32');
INSERT INTO `upm_role_and_permission_rel` VALUES ('364', '31', '33');
INSERT INTO `upm_role_and_permission_rel` VALUES ('365', '31', '34');
INSERT INTO `upm_role_and_permission_rel` VALUES ('366', '31', '35');
INSERT INTO `upm_role_and_permission_rel` VALUES ('367', '31', '36');
INSERT INTO `upm_role_and_permission_rel` VALUES ('368', '31', '37');
INSERT INTO `upm_role_and_permission_rel` VALUES ('369', '31', '38');
INSERT INTO `upm_role_and_permission_rel` VALUES ('370', '31', '39');
INSERT INTO `upm_role_and_permission_rel` VALUES ('371', '31', '40');
INSERT INTO `upm_role_and_permission_rel` VALUES ('372', '31', '41');
INSERT INTO `upm_role_and_permission_rel` VALUES ('373', '31', '42');
INSERT INTO `upm_role_and_permission_rel` VALUES ('374', '31', '43');
INSERT INTO `upm_role_and_permission_rel` VALUES ('375', '32', '1');
INSERT INTO `upm_role_and_permission_rel` VALUES ('376', '32', '29');
INSERT INTO `upm_role_and_permission_rel` VALUES ('377', '32', '30');
INSERT INTO `upm_role_and_permission_rel` VALUES ('378', '32', '31');
INSERT INTO `upm_role_and_permission_rel` VALUES ('379', '32', '32');
INSERT INTO `upm_role_and_permission_rel` VALUES ('380', '32', '33');
INSERT INTO `upm_role_and_permission_rel` VALUES ('381', '32', '34');
INSERT INTO `upm_role_and_permission_rel` VALUES ('382', '32', '35');
INSERT INTO `upm_role_and_permission_rel` VALUES ('383', '32', '36');
INSERT INTO `upm_role_and_permission_rel` VALUES ('384', '18', '1');
INSERT INTO `upm_role_and_permission_rel` VALUES ('385', '18', '29');
INSERT INTO `upm_role_and_permission_rel` VALUES ('386', '18', '30');
INSERT INTO `upm_role_and_permission_rel` VALUES ('387', '18', '31');
INSERT INTO `upm_role_and_permission_rel` VALUES ('388', '18', '32');
INSERT INTO `upm_role_and_permission_rel` VALUES ('389', '18', '33');
INSERT INTO `upm_role_and_permission_rel` VALUES ('390', '18', '34');
INSERT INTO `upm_role_and_permission_rel` VALUES ('391', '18', '35');
INSERT INTO `upm_role_and_permission_rel` VALUES ('392', '18', '36');
INSERT INTO `upm_role_and_permission_rel` VALUES ('393', '19', '1');
INSERT INTO `upm_role_and_permission_rel` VALUES ('394', '19', '29');
INSERT INTO `upm_role_and_permission_rel` VALUES ('395', '19', '30');
INSERT INTO `upm_role_and_permission_rel` VALUES ('396', '19', '31');
INSERT INTO `upm_role_and_permission_rel` VALUES ('397', '19', '32');
INSERT INTO `upm_role_and_permission_rel` VALUES ('398', '19', '33');
INSERT INTO `upm_role_and_permission_rel` VALUES ('399', '19', '34');
INSERT INTO `upm_role_and_permission_rel` VALUES ('400', '19', '35');
INSERT INTO `upm_role_and_permission_rel` VALUES ('401', '19', '36');
INSERT INTO `upm_role_and_permission_rel` VALUES ('402', '20', '1');
INSERT INTO `upm_role_and_permission_rel` VALUES ('403', '20', '20');
INSERT INTO `upm_role_and_permission_rel` VALUES ('404', '20', '21');
INSERT INTO `upm_role_and_permission_rel` VALUES ('405', '20', '22');
INSERT INTO `upm_role_and_permission_rel` VALUES ('406', '20', '23');
INSERT INTO `upm_role_and_permission_rel` VALUES ('407', '20', '24');
INSERT INTO `upm_role_and_permission_rel` VALUES ('408', '20', '25');
INSERT INTO `upm_role_and_permission_rel` VALUES ('409', '21', '1');
INSERT INTO `upm_role_and_permission_rel` VALUES ('410', '21', '29');
INSERT INTO `upm_role_and_permission_rel` VALUES ('411', '21', '30');
INSERT INTO `upm_role_and_permission_rel` VALUES ('412', '21', '31');
INSERT INTO `upm_role_and_permission_rel` VALUES ('413', '21', '32');
INSERT INTO `upm_role_and_permission_rel` VALUES ('414', '21', '33');
INSERT INTO `upm_role_and_permission_rel` VALUES ('415', '21', '34');
INSERT INTO `upm_role_and_permission_rel` VALUES ('416', '21', '35');
INSERT INTO `upm_role_and_permission_rel` VALUES ('417', '21', '36');
INSERT INTO `upm_role_and_permission_rel` VALUES ('436', '20000', '46');
INSERT INTO `upm_role_and_permission_rel` VALUES ('439', '2000', '1');
INSERT INTO `upm_role_and_permission_rel` VALUES ('440', '2000', '46');
INSERT INTO `upm_role_and_permission_rel` VALUES ('441', '1000', '1');
INSERT INTO `upm_role_and_permission_rel` VALUES ('442', '1000', '2');
INSERT INTO `upm_role_and_permission_rel` VALUES ('443', '1000', '3');
INSERT INTO `upm_role_and_permission_rel` VALUES ('444', '1000', '6');
INSERT INTO `upm_role_and_permission_rel` VALUES ('445', '1000', '7');
INSERT INTO `upm_role_and_permission_rel` VALUES ('446', '1000', '8');
INSERT INTO `upm_role_and_permission_rel` VALUES ('447', '1000', '9');
INSERT INTO `upm_role_and_permission_rel` VALUES ('448', '1000', '10');
INSERT INTO `upm_role_and_permission_rel` VALUES ('449', '1000', '11');
INSERT INTO `upm_role_and_permission_rel` VALUES ('450', '1000', '12');
INSERT INTO `upm_role_and_permission_rel` VALUES ('451', '1000', '13');
INSERT INTO `upm_role_and_permission_rel` VALUES ('452', '1000', '14');
INSERT INTO `upm_role_and_permission_rel` VALUES ('453', '1000', '15');
INSERT INTO `upm_role_and_permission_rel` VALUES ('454', '1000', '16');
INSERT INTO `upm_role_and_permission_rel` VALUES ('455', '1000', '17');
INSERT INTO `upm_role_and_permission_rel` VALUES ('456', '1000', '18');
INSERT INTO `upm_role_and_permission_rel` VALUES ('457', '1000', '19');
INSERT INTO `upm_role_and_permission_rel` VALUES ('458', '1000', '20');
INSERT INTO `upm_role_and_permission_rel` VALUES ('459', '1000', '21');
INSERT INTO `upm_role_and_permission_rel` VALUES ('460', '1000', '22');
INSERT INTO `upm_role_and_permission_rel` VALUES ('461', '1000', '23');
INSERT INTO `upm_role_and_permission_rel` VALUES ('462', '1000', '24');
INSERT INTO `upm_role_and_permission_rel` VALUES ('463', '1000', '25');
INSERT INTO `upm_role_and_permission_rel` VALUES ('464', '1000', '26');
INSERT INTO `upm_role_and_permission_rel` VALUES ('465', '1000', '27');
INSERT INTO `upm_role_and_permission_rel` VALUES ('466', '1000', '28');
INSERT INTO `upm_role_and_permission_rel` VALUES ('467', '1000', '29');
INSERT INTO `upm_role_and_permission_rel` VALUES ('468', '1000', '35');
INSERT INTO `upm_role_and_permission_rel` VALUES ('469', '1000', '36');
INSERT INTO `upm_role_and_permission_rel` VALUES ('470', '1000', '37');
INSERT INTO `upm_role_and_permission_rel` VALUES ('471', '1000', '38');
INSERT INTO `upm_role_and_permission_rel` VALUES ('472', '1000', '39');
INSERT INTO `upm_role_and_permission_rel` VALUES ('473', '1000', '40');
INSERT INTO `upm_role_and_permission_rel` VALUES ('474', '1000', '41');
INSERT INTO `upm_role_and_permission_rel` VALUES ('475', '1000', '42');
INSERT INTO `upm_role_and_permission_rel` VALUES ('476', '1000', '43');

-- ----------------------------
-- Table structure for `upm_role_group`
-- ----------------------------
DROP TABLE IF EXISTS `upm_role_group`;
CREATE TABLE `upm_role_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_code` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_id` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_By` int(11) DEFAULT NULL,
  `create_Date` datetime DEFAULT NULL,
  `update_By` int(11) DEFAULT NULL,
  `update_Date` datetime DEFAULT NULL,
  `enable_Flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lock_Status` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of upm_role_group
-- ----------------------------
INSERT INTO `upm_role_group` VALUES ('1', 'G001', 'UPM', 'UPM', '0', null, null, null, null, null);
INSERT INTO `upm_role_group` VALUES ('2', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `upm_token`
-- ----------------------------
DROP TABLE IF EXISTS `upm_token`;
CREATE TABLE `upm_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tokenId` varchar(256) DEFAULT NULL COMMENT 'token',
  `resId` varchar(256) DEFAULT NULL COMMENT '源资id',
  `subAcctId` varchar(256) DEFAULT NULL COMMENT '从账号',
  `clientIp` varchar(256) DEFAULT NULL COMMENT '客户端IP',
  `createTime` datetime DEFAULT NULL COMMENT '建创时间',
  `mainAcctId` int(11) DEFAULT NULL COMMENT '主账号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=463 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upm_token
-- ----------------------------
INSERT INTO `upm_token` VALUES ('1', 'tokenId', '1', '1', null, '2016-02-18 16:51:49', '2');
INSERT INTO `upm_token` VALUES ('2', '2-1455787259287', '', '2', '', '2016-02-18 17:20:59', '2');
INSERT INTO `upm_token` VALUES ('3', '18-1455787314833', '', '18', '', '2016-02-18 17:21:54', '18');
INSERT INTO `upm_token` VALUES ('4', '18-1455788862256', '', '18', '', '2016-02-18 17:47:42', '18');
INSERT INTO `upm_token` VALUES ('5', '18-1455788991230', '', '18', '', '2016-02-18 17:49:51', '18');
INSERT INTO `upm_token` VALUES ('6', '18-1455789137077', '', '18', '', '2016-02-18 17:52:17', '18');
INSERT INTO `upm_token` VALUES ('7', '18-1455789433865', '', '18', '', '2016-02-18 17:57:13', '18');
INSERT INTO `upm_token` VALUES ('8', '18-1455789558942', '', '18', '', '2016-02-18 17:59:18', '18');
INSERT INTO `upm_token` VALUES ('9', '11-1455953301334', '', '11', '', '2016-02-20 15:28:21', '11');
INSERT INTO `upm_token` VALUES ('10', '18-1455953364545', '', '18', '', '2016-02-20 15:29:24', '18');
INSERT INTO `upm_token` VALUES ('11', '11-1455953871587', '', '11', '', '2016-02-20 15:37:51', '11');
INSERT INTO `upm_token` VALUES ('12', '11-1455954182187', '', '11', '', '2016-02-20 15:43:02', '11');
INSERT INTO `upm_token` VALUES ('13', '11-1455954198626', '', '11', '', '2016-02-20 15:43:18', '11');
INSERT INTO `upm_token` VALUES ('14', '11-1455954497779', '', '11', '', '2016-02-20 15:48:17', '11');
INSERT INTO `upm_token` VALUES ('15', '11-1455954726688', '', '11', '', '2016-02-20 15:52:06', '11');
INSERT INTO `upm_token` VALUES ('16', '22-1455954740177', '', '22', '', '2016-02-20 15:52:20', '22');
INSERT INTO `upm_token` VALUES ('17', '22-1455955161988', '', '22', '', '2016-02-20 15:59:21', '22');
INSERT INTO `upm_token` VALUES ('18', '18-1455955377240', '', '18', '', '2016-02-20 16:02:57', '18');
INSERT INTO `upm_token` VALUES ('19', '11-1455959116507', '', '11', '', '2016-02-20 17:05:16', '11');
INSERT INTO `upm_token` VALUES ('20', '11-1455959131805', '', '11', '', '2016-02-20 17:05:31', '11');
INSERT INTO `upm_token` VALUES ('21', '11-1455959183056', '', '11', '', '2016-02-20 17:06:23', '11');
INSERT INTO `upm_token` VALUES ('22', '11-1455959183350', '', '11', '', '2016-02-20 17:06:23', '11');
INSERT INTO `upm_token` VALUES ('23', '11-1455959183447', '', '11', '', '2016-02-20 17:06:23', '11');
INSERT INTO `upm_token` VALUES ('24', '18-1456535465048', '', '18', '', '2016-02-27 09:11:05', '18');
INSERT INTO `upm_token` VALUES ('25', '11-1456927439635', '', '11', '', '2016-03-02 22:03:59', '11');
INSERT INTO `upm_token` VALUES ('26', '11-1456929772245', '', '11', '', '2016-03-02 22:42:52', '11');
INSERT INTO `upm_token` VALUES ('27', '11-1457135611780', '', '11', '', '2016-03-05 07:53:31', '11');
INSERT INTO `upm_token` VALUES ('28', '11-1457764769816', '', '11', '', '2016-03-12 14:39:29', '11');
INSERT INTO `upm_token` VALUES ('29', '18-1457764850757', '', '18', '', '2016-03-12 14:40:50', '18');
INSERT INTO `upm_token` VALUES ('30', '11-1457772667424', '', '11', '', '2016-03-12 16:51:07', '11');
INSERT INTO `upm_token` VALUES ('31', '11-1457773312446', '', '11', '', '2016-03-12 17:01:52', '11');
INSERT INTO `upm_token` VALUES ('32', '11-1457773517089', '', '11', '', '2016-03-12 17:05:17', '11');
INSERT INTO `upm_token` VALUES ('33', '11-1457773798673', '', '11', '', '2016-03-12 17:09:58', '11');
INSERT INTO `upm_token` VALUES ('34', '11-1457774162486', '', '11', '', '2016-03-12 17:16:02', '11');
INSERT INTO `upm_token` VALUES ('35', '22-1457774374695', '', '22', '', '2016-03-12 17:19:34', '22');
INSERT INTO `upm_token` VALUES ('36', '11-1457775182162', '', '11', '', '2016-03-12 17:33:02', '11');
INSERT INTO `upm_token` VALUES ('37', '22-1457775378072', '', '22', '', '2016-03-12 17:36:18', '22');
INSERT INTO `upm_token` VALUES ('38', '11-1457777569610', '', '11', '', '2016-03-12 18:12:49', '11');
INSERT INTO `upm_token` VALUES ('39', '22-1457778086117', '', '22', '', '2016-03-12 18:21:26', '22');
INSERT INTO `upm_token` VALUES ('40', '11-1457778207554', '', '11', '', '2016-03-12 18:23:27', '11');
INSERT INTO `upm_token` VALUES ('41', '22-1457778272702', '', '22', '', '2016-03-12 18:24:32', '22');
INSERT INTO `upm_token` VALUES ('42', '11-1457778305829', '', '11', '', '2016-03-12 18:25:05', '11');
INSERT INTO `upm_token` VALUES ('43', '22-1457778343308', '', '22', '', '2016-03-12 18:25:43', '22');
INSERT INTO `upm_token` VALUES ('44', '11-1457778432222', '', '11', '', '2016-03-12 18:27:12', '11');
INSERT INTO `upm_token` VALUES ('45', '11-1457779252788', '', '11', '', '2016-03-12 18:40:52', '11');
INSERT INTO `upm_token` VALUES ('46', '22-1457779290909', '', '22', '', '2016-03-12 18:41:30', '22');
INSERT INTO `upm_token` VALUES ('47', '11-1457779338815', '', '11', '', '2016-03-12 18:42:18', '11');
INSERT INTO `upm_token` VALUES ('48', '22-1457779392707', '', '22', '', '2016-03-12 18:43:12', '22');
INSERT INTO `upm_token` VALUES ('49', '11-1457780069857', '', '11', '', '2016-03-12 18:54:29', '11');
INSERT INTO `upm_token` VALUES ('50', '22-1457780106165', '', '22', '', '2016-03-12 18:55:06', '22');
INSERT INTO `upm_token` VALUES ('51', '11-1457780150111', '', '11', '', '2016-03-12 18:55:50', '11');
INSERT INTO `upm_token` VALUES ('52', '22-1457780315556', '', '22', '', '2016-03-12 18:58:35', '22');
INSERT INTO `upm_token` VALUES ('53', '11-1457780827533', '', '11', '', '2016-03-12 19:07:07', '11');
INSERT INTO `upm_token` VALUES ('54', '22-1457780864769', '', '22', '', '2016-03-12 19:07:44', '22');
INSERT INTO `upm_token` VALUES ('55', '11-1457780912372', '', '11', '', '2016-03-12 19:08:32', '11');
INSERT INTO `upm_token` VALUES ('56', '22-1457780944836', '', '22', '', '2016-03-12 19:09:04', '22');
INSERT INTO `upm_token` VALUES ('57', '11-1457781457443', '', '11', '', '2016-03-12 19:17:37', '11');
INSERT INTO `upm_token` VALUES ('58', '22-1457781501632', '', '22', '', '2016-03-12 19:18:21', '22');
INSERT INTO `upm_token` VALUES ('59', '11-1457781532627', '', '11', '', '2016-03-12 19:18:52', '11');
INSERT INTO `upm_token` VALUES ('60', '11-1457781558772', '', '11', '', '2016-03-12 19:19:18', '11');
INSERT INTO `upm_token` VALUES ('61', '11-1457782244451', '', '11', '', '2016-03-12 19:30:44', '11');
INSERT INTO `upm_token` VALUES ('62', '11-1457782575521', '', '11', '', '2016-03-12 19:36:15', '11');
INSERT INTO `upm_token` VALUES ('63', '22-1457782712277', '', '22', '', '2016-03-12 19:38:32', '22');
INSERT INTO `upm_token` VALUES ('64', '11-1457783038674', '', '11', '', '2016-03-12 19:43:58', '11');
INSERT INTO `upm_token` VALUES ('65', '22-1457783127688', '', '22', '', '2016-03-12 19:45:27', '22');
INSERT INTO `upm_token` VALUES ('66', '11-1457783204931', '', '11', '', '2016-03-12 19:46:44', '11');
INSERT INTO `upm_token` VALUES ('67', '22-1457783237118', '', '22', '', '2016-03-12 19:47:17', '22');
INSERT INTO `upm_token` VALUES ('68', '22-1457783557751', '', '22', '', '2016-03-12 19:52:37', '22');
INSERT INTO `upm_token` VALUES ('69', '11-1457783590555', '', '11', '', '2016-03-12 19:53:10', '11');
INSERT INTO `upm_token` VALUES ('70', '11-1457951204908', '', '11', '', '2016-03-14 18:26:44', '11');
INSERT INTO `upm_token` VALUES ('71', '11-1457952201176', '', '11', '', '2016-03-14 18:43:21', '11');
INSERT INTO `upm_token` VALUES ('72', '18-1457953762354', '', '18', '', '2016-03-14 19:09:22', '18');
INSERT INTO `upm_token` VALUES ('73', '18-1457955124478', '', '18', '', '2016-03-14 19:32:04', '18');
INSERT INTO `upm_token` VALUES ('74', '11-1457955210015', '', '11', '', '2016-03-14 19:33:30', '11');
INSERT INTO `upm_token` VALUES ('75', '18-1458212560668', '', '18', '', '2016-03-17 19:02:40', '18');
INSERT INTO `upm_token` VALUES ('76', '11-1458212609945', '', '11', '', '2016-03-17 19:03:29', '11');
INSERT INTO `upm_token` VALUES ('77', '18-1458213029289', '', '18', '', '2016-03-17 19:10:29', '18');
INSERT INTO `upm_token` VALUES ('78', '11-1458213656831', '', '11', '', '2016-03-17 19:20:56', '11');
INSERT INTO `upm_token` VALUES ('79', '18-1458213707837', '', '18', '', '2016-03-17 19:21:47', '18');
INSERT INTO `upm_token` VALUES ('80', '18-1458213887796', '', '18', '', '2016-03-17 19:24:47', '18');
INSERT INTO `upm_token` VALUES ('81', '18-1458396840702', '', '18', '', '2016-03-19 22:14:00', '18');
INSERT INTO `upm_token` VALUES ('82', '11-1458396876861', '', '11', '', '2016-03-19 22:14:36', '11');
INSERT INTO `upm_token` VALUES ('83', '18-1458396906281', '', '18', '', '2016-03-19 22:15:06', '18');
INSERT INTO `upm_token` VALUES ('84', '11-1458728742588', '', '11', '', '2016-03-23 18:25:42', '11');
INSERT INTO `upm_token` VALUES ('85', '11-1458728827398', '', '11', '', '2016-03-23 18:27:07', '11');
INSERT INTO `upm_token` VALUES ('86', '11-1458729222199', '', '11', '', '2016-03-23 18:33:42', '11');
INSERT INTO `upm_token` VALUES ('87', '11-1458730210650', '', '11', '', '2016-03-23 18:50:10', '11');
INSERT INTO `upm_token` VALUES ('88', '11-1458731169924', '', '11', '', '2016-03-23 19:06:09', '11');
INSERT INTO `upm_token` VALUES ('89', '11-1458731554610', '', '11', '', '2016-03-23 19:12:34', '11');
INSERT INTO `upm_token` VALUES ('90', '11-1458732044497', '', '11', '', '2016-03-23 19:20:44', '11');
INSERT INTO `upm_token` VALUES ('91', '11-1458733268805', '', '11', '', '2016-03-23 19:41:08', '11');
INSERT INTO `upm_token` VALUES ('92', '11-1458733693331', '', '11', '', '2016-03-23 19:48:13', '11');
INSERT INTO `upm_token` VALUES ('93', '11-1458734421890', '', '11', '', '2016-03-23 20:00:21', '11');
INSERT INTO `upm_token` VALUES ('94', '11-1458816605452', '', '11', '', '2016-03-24 18:50:05', '11');
INSERT INTO `upm_token` VALUES ('95', '11-1458818624908', '', '11', '', '2016-03-24 19:23:44', '11');
INSERT INTO `upm_token` VALUES ('96', '-1463141357219', '', '', '', '2016-05-13 20:09:17', '2');
INSERT INTO `upm_token` VALUES ('97', '-1463141361230', '', '', '', '2016-05-13 20:09:21', '2');
INSERT INTO `upm_token` VALUES ('98', '-1463141362018', '', '', '', '2016-05-13 20:09:22', '2');
INSERT INTO `upm_token` VALUES ('99', '-1463141362943', '', '', '', '2016-05-13 20:09:22', '2');
INSERT INTO `upm_token` VALUES ('100', '-1463141364205', '', '', '', '2016-05-13 20:09:24', '2');
INSERT INTO `upm_token` VALUES ('101', '-1463141365115', '', '', '', '2016-05-13 20:09:25', '2');
INSERT INTO `upm_token` VALUES ('102', '-1463141366132', '', '', '', '2016-05-13 20:09:26', '2');
INSERT INTO `upm_token` VALUES ('103', '-1463141367620', '', '', '', '2016-05-13 20:09:27', '2');
INSERT INTO `upm_token` VALUES ('104', '-1463141368484', '', '', '', '2016-05-13 20:09:28', '2');
INSERT INTO `upm_token` VALUES ('105', '-1463141369286', '', '', '', '2016-05-13 20:09:29', '2');
INSERT INTO `upm_token` VALUES ('106', '-1463141387210', '', '', '', '2016-05-13 20:09:47', '2');
INSERT INTO `upm_token` VALUES ('107', '-1463141388500', '', '', '', '2016-05-13 20:09:48', '2');
INSERT INTO `upm_token` VALUES ('108', '-1463141389266', '', '', '', '2016-05-13 20:09:49', '2');
INSERT INTO `upm_token` VALUES ('109', '-1463141390057', '', '', '', '2016-05-13 20:09:50', '2');
INSERT INTO `upm_token` VALUES ('110', '-1463141390880', '', '', '', '2016-05-13 20:09:50', '2');
INSERT INTO `upm_token` VALUES ('111', '-1463141391661', '', '', '', '2016-05-13 20:09:51', '2');
INSERT INTO `upm_token` VALUES ('112', '-1463141392455', '', '', '', '2016-05-13 20:09:52', '2');
INSERT INTO `upm_token` VALUES ('113', '-1463141393270', '', '', '', '2016-05-13 20:09:53', '2');
INSERT INTO `upm_token` VALUES ('114', '-1463141394082', '', '', '', '2016-05-13 20:09:54', '2');
INSERT INTO `upm_token` VALUES ('115', '-1463141394868', '', '', '', '2016-05-13 20:09:54', '2');
INSERT INTO `upm_token` VALUES ('116', '-1463141453552', '', '', '', '2016-05-13 20:10:53', '2');
INSERT INTO `upm_token` VALUES ('117', '-1463141454608', '', '', '', '2016-05-13 20:10:54', '2');
INSERT INTO `upm_token` VALUES ('118', '-1463141455421', '', '', '', '2016-05-13 20:10:55', '2');
INSERT INTO `upm_token` VALUES ('119', '-1463141456271', '', '', '', '2016-05-13 20:10:56', '2');
INSERT INTO `upm_token` VALUES ('120', '-1463141457161', '', '', '', '2016-05-13 20:10:57', '2');
INSERT INTO `upm_token` VALUES ('121', '-1463141457958', '', '', '', '2016-05-13 20:10:57', '2');
INSERT INTO `upm_token` VALUES ('122', '-1463141458774', '', '', '', '2016-05-13 20:10:58', '2');
INSERT INTO `upm_token` VALUES ('123', '-1463141459567', '', '', '', '2016-05-13 20:10:59', '2');
INSERT INTO `upm_token` VALUES ('124', '-1463141460380', '', '', '', '2016-05-13 20:11:00', '2');
INSERT INTO `upm_token` VALUES ('125', '-1463141461343', '', '', '', '2016-05-13 20:11:01', '2');
INSERT INTO `upm_token` VALUES ('126', '-1463141538158', '', '', '', '2016-05-13 20:12:18', '2');
INSERT INTO `upm_token` VALUES ('127', '-1463141539365', '', '', '', '2016-05-13 20:12:19', '2');
INSERT INTO `upm_token` VALUES ('128', '-1463141540318', '', '', '', '2016-05-13 20:12:20', '2');
INSERT INTO `upm_token` VALUES ('129', '-1463141541215', '', '', '', '2016-05-13 20:12:21', '2');
INSERT INTO `upm_token` VALUES ('130', '-1463141542175', '', '', '', '2016-05-13 20:12:22', '2');
INSERT INTO `upm_token` VALUES ('131', '-1463141543141', '', '', '', '2016-05-13 20:12:23', '2');
INSERT INTO `upm_token` VALUES ('132', '-1463141544580', '', '', '', '2016-05-13 20:12:24', '2');
INSERT INTO `upm_token` VALUES ('133', '-1463141545486', '', '', '', '2016-05-13 20:12:25', '2');
INSERT INTO `upm_token` VALUES ('134', '-1463141546307', '', '', '', '2016-05-13 20:12:26', '2');
INSERT INTO `upm_token` VALUES ('135', '-1463143019369', 'UPM', '', '', '2016-05-13 20:36:59', '2');
INSERT INTO `upm_token` VALUES ('136', '-1463143020296', '', '', '', '2016-05-13 20:37:00', '2');
INSERT INTO `upm_token` VALUES ('137', '-1463143021083', '', '', '', '2016-05-13 20:37:01', '2');
INSERT INTO `upm_token` VALUES ('138', '-1463143022099', '', '', '', '2016-05-13 20:37:02', '2');
INSERT INTO `upm_token` VALUES ('139', '-1463143023058', '', '', '', '2016-05-13 20:37:03', '2');
INSERT INTO `upm_token` VALUES ('140', '-1463143023963', '', '', '', '2016-05-13 20:37:03', '2');
INSERT INTO `upm_token` VALUES ('141', '-1463143024760', '', '', '', '2016-05-13 20:37:04', '2');
INSERT INTO `upm_token` VALUES ('142', '-1463143025624', '', '', '', '2016-05-13 20:37:05', '2');
INSERT INTO `upm_token` VALUES ('143', '-1463143026527', '', '', '', '2016-05-13 20:37:06', '2');
INSERT INTO `upm_token` VALUES ('144', '-1463143050774', 'UPM', '', '', '2016-05-13 20:37:30', '2');
INSERT INTO `upm_token` VALUES ('145', '-1463143051895', '', '', '', '2016-05-13 20:37:31', '2');
INSERT INTO `upm_token` VALUES ('146', '-1463143052754', '', '', '', '2016-05-13 20:37:32', '2');
INSERT INTO `upm_token` VALUES ('147', '-1463143053555', '', '', '', '2016-05-13 20:37:33', '2');
INSERT INTO `upm_token` VALUES ('148', '-1463143054426', '', '', '', '2016-05-13 20:37:34', '2');
INSERT INTO `upm_token` VALUES ('149', '-1463143055223', '', '', '', '2016-05-13 20:37:35', '2');
INSERT INTO `upm_token` VALUES ('150', '-1463143056155', '', '', '', '2016-05-13 20:37:36', '2');
INSERT INTO `upm_token` VALUES ('151', '-1463143057124', '', '', '', '2016-05-13 20:37:37', '2');
INSERT INTO `upm_token` VALUES ('152', '-1463143057949', '', '', '', '2016-05-13 20:37:37', '2');
INSERT INTO `upm_token` VALUES ('153', '-1463193589809', 'UPM', '', '', '2016-05-14 10:39:49', '2');
INSERT INTO `upm_token` VALUES ('154', '-1463193590923', '', '', '', '2016-05-14 10:39:50', '2');
INSERT INTO `upm_token` VALUES ('155', '-1463193591998', '', '', '', '2016-05-14 10:39:51', '2');
INSERT INTO `upm_token` VALUES ('156', '-1463193593278', '', '', '', '2016-05-14 10:39:53', '2');
INSERT INTO `upm_token` VALUES ('157', '-1463193594750', '', '', '', '2016-05-14 10:39:54', '2');
INSERT INTO `upm_token` VALUES ('158', '-1463193596005', '', '', '', '2016-05-14 10:39:56', '2');
INSERT INTO `upm_token` VALUES ('159', '-1463193597336', '', '', '', '2016-05-14 10:39:57', '2');
INSERT INTO `upm_token` VALUES ('160', '-1463193598641', '', '', '', '2016-05-14 10:39:58', '2');
INSERT INTO `upm_token` VALUES ('161', '-1463193599563', '', '', '', '2016-05-14 10:39:59', '2');
INSERT INTO `upm_token` VALUES ('162', '-1463193668279', 'UPM', '', '', '2016-05-14 10:41:08', '2');
INSERT INTO `upm_token` VALUES ('163', '-1463193669233', '', '', '', '2016-05-14 10:41:09', '2');
INSERT INTO `upm_token` VALUES ('164', '-1463193670204', '', '', '', '2016-05-14 10:41:10', '2');
INSERT INTO `upm_token` VALUES ('165', '-1463193671371', '', '', '', '2016-05-14 10:41:11', '2');
INSERT INTO `upm_token` VALUES ('166', '-1463193672783', '', '', '', '2016-05-14 10:41:12', '2');
INSERT INTO `upm_token` VALUES ('167', '-1463193673971', '', '', '', '2016-05-14 10:41:13', '2');
INSERT INTO `upm_token` VALUES ('168', '-1463193675225', '', '', '', '2016-05-14 10:41:15', '2');
INSERT INTO `upm_token` VALUES ('169', '-1463193676892', '', '', '', '2016-05-14 10:41:16', '2');
INSERT INTO `upm_token` VALUES ('170', '-1463193677736', '', '', '', '2016-05-14 10:41:17', '2');
INSERT INTO `upm_token` VALUES ('171', '-1463193687321', 'UPM', '', '', '2016-05-14 10:41:27', '2');
INSERT INTO `upm_token` VALUES ('172', '-1463193688577', '', '', '', '2016-05-14 10:41:28', '2');
INSERT INTO `upm_token` VALUES ('173', '-1463193689849', '', '', '', '2016-05-14 10:41:29', '2');
INSERT INTO `upm_token` VALUES ('174', '-1463193690852', '', '', '', '2016-05-14 10:41:30', '2');
INSERT INTO `upm_token` VALUES ('175', '-1463193691976', '', '', '', '2016-05-14 10:41:31', '2');
INSERT INTO `upm_token` VALUES ('176', '-1463193693196', '', '', '', '2016-05-14 10:41:33', '2');
INSERT INTO `upm_token` VALUES ('177', '-1463193694531', '', '', '', '2016-05-14 10:41:34', '2');
INSERT INTO `upm_token` VALUES ('178', '-1463193695886', '', '', '', '2016-05-14 10:41:35', '2');
INSERT INTO `upm_token` VALUES ('179', '-1463193696776', '', '', '', '2016-05-14 10:41:36', '2');
INSERT INTO `upm_token` VALUES ('180', '-1463193715339', '', '', '', '2016-05-14 10:41:55', '2');
INSERT INTO `upm_token` VALUES ('181', '-1463193716450', '', '', '', '2016-05-14 10:41:56', '2');
INSERT INTO `upm_token` VALUES ('182', '-1463193717670', '', '', '', '2016-05-14 10:41:57', '2');
INSERT INTO `upm_token` VALUES ('183', '-1463193717951', '', '', '', '2016-05-14 10:41:57', '2');
INSERT INTO `upm_token` VALUES ('184', '-1463193719143', '', '', '', '2016-05-14 10:41:59', '2');
INSERT INTO `upm_token` VALUES ('185', '-1463193719752', '', '', '', '2016-05-14 10:41:59', '2');
INSERT INTO `upm_token` VALUES ('186', '-1463193720808', '', '', '', '2016-05-14 10:42:00', '2');
INSERT INTO `upm_token` VALUES ('187', '-1463193721474', '', '', '', '2016-05-14 10:42:01', '2');
INSERT INTO `upm_token` VALUES ('188', '-1463193722434', '', '', '', '2016-05-14 10:42:02', '2');
INSERT INTO `upm_token` VALUES ('189', '-1463193723153', '', '', '', '2016-05-14 10:42:03', '2');
INSERT INTO `upm_token` VALUES ('190', '-1463193724103', '', '', '', '2016-05-14 10:42:04', '2');
INSERT INTO `upm_token` VALUES ('191', '-1463193724830', '', '', '', '2016-05-14 10:42:04', '2');
INSERT INTO `upm_token` VALUES ('192', '-1463193725756', '', '', '', '2016-05-14 10:42:05', '2');
INSERT INTO `upm_token` VALUES ('193', '-1463193726721', '', '', '', '2016-05-14 10:42:06', '2');
INSERT INTO `upm_token` VALUES ('194', '-1463193727427', '', '', '', '2016-05-14 10:42:07', '2');
INSERT INTO `upm_token` VALUES ('195', '-1463193728689', '', '', '', '2016-05-14 10:42:08', '2');
INSERT INTO `upm_token` VALUES ('196', '-1463193729060', '', '', '', '2016-05-14 10:42:09', '2');
INSERT INTO `upm_token` VALUES ('197', '-1463193729391', '', '', '', '2016-05-14 10:42:09', '2');
INSERT INTO `upm_token` VALUES ('198', '-1463193731453', '', '', '', '2016-05-14 10:42:11', '2');
INSERT INTO `upm_token` VALUES ('199', '-1463193731672', '', '', '', '2016-05-14 10:42:11', '2');
INSERT INTO `upm_token` VALUES ('200', '-1463193731719', '', '', '', '2016-05-14 10:42:11', '2');
INSERT INTO `upm_token` VALUES ('201', '-1463193733961', '', '', '', '2016-05-14 10:42:13', '2');
INSERT INTO `upm_token` VALUES ('202', '-1463193734149', '', '', '', '2016-05-14 10:42:14', '2');
INSERT INTO `upm_token` VALUES ('203', '-1463193735457', '', '', '', '2016-05-14 10:42:15', '2');
INSERT INTO `upm_token` VALUES ('204', '-1463193736399', '', '', '', '2016-05-14 10:42:16', '2');
INSERT INTO `upm_token` VALUES ('205', '-1463193737466', '', '', '', '2016-05-14 10:42:17', '2');
INSERT INTO `upm_token` VALUES ('206', '-1463193738372', '', '', '', '2016-05-14 10:42:18', '2');
INSERT INTO `upm_token` VALUES ('207', '-1463193739235', '', '', '', '2016-05-14 10:42:19', '2');
INSERT INTO `upm_token` VALUES ('208', '-1463193739939', '', '', '', '2016-05-14 10:42:19', '2');
INSERT INTO `upm_token` VALUES ('209', '-1463193740548', '', '', '', '2016-05-14 10:42:20', '2');
INSERT INTO `upm_token` VALUES ('210', '-1463193789471', 'UPM', '', '', '2016-05-14 10:43:09', '2');
INSERT INTO `upm_token` VALUES ('211', '-1463193801183', '', '', '', '2016-05-14 10:43:21', '2');
INSERT INTO `upm_token` VALUES ('212', '-1463193949461', 'UPM', '', '', '2016-05-14 10:45:49', '2');
INSERT INTO `upm_token` VALUES ('213', '-1463193971698', '', '', '', '2016-05-14 10:46:11', '2');
INSERT INTO `upm_token` VALUES ('214', '-1463193974385', '', '', '', '2016-05-14 10:46:14', '2');
INSERT INTO `upm_token` VALUES ('215', '-1463194082255', '', '', '', '2016-05-14 10:48:02', '2');
INSERT INTO `upm_token` VALUES ('216', '-1463194085328', '', '', '', '2016-05-14 10:48:05', '2');
INSERT INTO `upm_token` VALUES ('217', '-1463194094892', '', '', '', '2016-05-14 10:48:14', '2');
INSERT INTO `upm_token` VALUES ('218', '-1463194095798', '', '', '', '2016-05-14 10:48:15', '2');
INSERT INTO `upm_token` VALUES ('219', '-1463194096618', '', '', '', '2016-05-14 10:48:16', '2');
INSERT INTO `upm_token` VALUES ('220', '-1463194097433', '', '', '', '2016-05-14 10:48:17', '2');
INSERT INTO `upm_token` VALUES ('221', '-1463194098221', '', '', '', '2016-05-14 10:48:18', '2');
INSERT INTO `upm_token` VALUES ('222', '-1463194239343', 'UPM', '', '', '2016-05-14 10:50:39', '2');
INSERT INTO `upm_token` VALUES ('223', '-1463194255684', '', '', '', '2016-05-14 10:50:55', '2');
INSERT INTO `upm_token` VALUES ('224', '-1463194256703', '', '', '', '2016-05-14 10:50:56', '2');
INSERT INTO `upm_token` VALUES ('225', '-1463194257834', '', '', '', '2016-05-14 10:50:57', '2');
INSERT INTO `upm_token` VALUES ('226', '-1463194259026', '', '', '', '2016-05-14 10:50:59', '2');
INSERT INTO `upm_token` VALUES ('227', '-1463194260570', '', '', '', '2016-05-14 10:51:00', '2');
INSERT INTO `upm_token` VALUES ('228', '-1463194262103', '', '', '', '2016-05-14 10:51:02', '2');
INSERT INTO `upm_token` VALUES ('229', '-1463194263609', '', '', '', '2016-05-14 10:51:03', '2');
INSERT INTO `upm_token` VALUES ('230', '-1463194264663', '', '', '', '2016-05-14 10:51:04', '2');
INSERT INTO `upm_token` VALUES ('231', '-1463194414577', 'UPM', '', '', '2016-05-14 10:53:34', '2');
INSERT INTO `upm_token` VALUES ('232', '-1463194415854', '', '', '', '2016-05-14 10:53:35', '2');
INSERT INTO `upm_token` VALUES ('233', '-1463194416808', '', '', '', '2016-05-14 10:53:36', '2');
INSERT INTO `upm_token` VALUES ('234', '-1463194417821', '', '', '', '2016-05-14 10:53:37', '2');
INSERT INTO `upm_token` VALUES ('235', '-1463194419067', '', '', '', '2016-05-14 10:53:39', '2');
INSERT INTO `upm_token` VALUES ('236', '-1463194420303', '', '', '', '2016-05-14 10:53:40', '2');
INSERT INTO `upm_token` VALUES ('237', '-1463194421314', '', '', '', '2016-05-14 10:53:41', '2');
INSERT INTO `upm_token` VALUES ('238', '-1463194422411', '', '', '', '2016-05-14 10:53:42', '2');
INSERT INTO `upm_token` VALUES ('239', '-1463194423478', '', '', '', '2016-05-14 10:53:43', '2');
INSERT INTO `upm_token` VALUES ('240', '-1463194471074', 'UPM', '', '', '2016-05-14 10:54:31', '2');
INSERT INTO `upm_token` VALUES ('241', '-1463194472257', '', '', '', '2016-05-14 10:54:32', '2');
INSERT INTO `upm_token` VALUES ('242', '-1463194473163', '', '', '', '2016-05-14 10:54:33', '2');
INSERT INTO `upm_token` VALUES ('243', '-1463194474121', '', '', '', '2016-05-14 10:54:34', '2');
INSERT INTO `upm_token` VALUES ('244', '-1463194475523', '', '', '', '2016-05-14 10:54:35', '2');
INSERT INTO `upm_token` VALUES ('245', '-1463194476529', '', '', '', '2016-05-14 10:54:36', '2');
INSERT INTO `upm_token` VALUES ('246', '-1463194477878', '', '', '', '2016-05-14 10:54:37', '2');
INSERT INTO `upm_token` VALUES ('247', '-1463194478925', '', '', '', '2016-05-14 10:54:38', '2');
INSERT INTO `upm_token` VALUES ('248', '-1463194479800', '', '', '', '2016-05-14 10:54:39', '2');
INSERT INTO `upm_token` VALUES ('249', '-1463194486659', '', '', '', '2016-05-14 10:54:46', '2');
INSERT INTO `upm_token` VALUES ('250', '-1463194487732', '', '', '', '2016-05-14 10:54:47', '2');
INSERT INTO `upm_token` VALUES ('251', '-1463194488607', '', '', '', '2016-05-14 10:54:48', '2');
INSERT INTO `upm_token` VALUES ('252', '-1463194489147', '', '', '', '2016-05-14 10:54:49', '2');
INSERT INTO `upm_token` VALUES ('253', '-1463194489584', '', '', '', '2016-05-14 10:54:49', '2');
INSERT INTO `upm_token` VALUES ('254', '-1463194491415', '', '', '', '2016-05-14 10:54:51', '2');
INSERT INTO `upm_token` VALUES ('255', '-1463194493505', '', '', '', '2016-05-14 10:54:53', '2');
INSERT INTO `upm_token` VALUES ('256', '-1463194493880', '', '', '', '2016-05-14 10:54:53', '2');
INSERT INTO `upm_token` VALUES ('257', '-1463194494955', '', '', '', '2016-05-14 10:54:54', '2');
INSERT INTO `upm_token` VALUES ('258', '-1463194496032', '', '', '', '2016-05-14 10:54:56', '2');
INSERT INTO `upm_token` VALUES ('259', '-1463194496142', '', '', '', '2016-05-14 10:54:56', '2');
INSERT INTO `upm_token` VALUES ('260', '-1463194497229', '', '', '', '2016-05-14 10:54:57', '2');
INSERT INTO `upm_token` VALUES ('261', '-1463194498288', '', '', '', '2016-05-14 10:54:58', '2');
INSERT INTO `upm_token` VALUES ('262', '-1463194498397', '', '', '', '2016-05-14 10:54:58', '2');
INSERT INTO `upm_token` VALUES ('263', '-1463194499813', '', '', '', '2016-05-14 10:54:59', '2');
INSERT INTO `upm_token` VALUES ('264', '-1463194501412', '', '', '', '2016-05-14 10:55:01', '2');
INSERT INTO `upm_token` VALUES ('265', '-1463194501443', '', '', '', '2016-05-14 10:55:01', '2');
INSERT INTO `upm_token` VALUES ('266', '-1463194502811', '', '', '', '2016-05-14 10:55:02', '2');
INSERT INTO `upm_token` VALUES ('267', '-1463194503976', '', '', '', '2016-05-14 10:55:03', '2');
INSERT INTO `upm_token` VALUES ('268', '-1463194504023', '', '', '', '2016-05-14 10:55:04', '2');
INSERT INTO `upm_token` VALUES ('269', '-1463194505584', '', '', '', '2016-05-14 10:55:05', '2');
INSERT INTO `upm_token` VALUES ('270', '-1463194506553', '', '', '', '2016-05-14 10:55:06', '2');
INSERT INTO `upm_token` VALUES ('271', '-1463194507401', '', '', '', '2016-05-14 10:55:07', '2');
INSERT INTO `upm_token` VALUES ('272', '-1463194508180', '', '', '', '2016-05-14 10:55:08', '2');
INSERT INTO `upm_token` VALUES ('273', '-1463194604171', 'UPM', '', '', '2016-05-14 10:56:44', '2');
INSERT INTO `upm_token` VALUES ('274', '-1463194606738', '', '', '', '2016-05-14 10:56:46', '2');
INSERT INTO `upm_token` VALUES ('275', '-1463194611164', '', '', '', '2016-05-14 10:56:51', '2');
INSERT INTO `upm_token` VALUES ('276', '-1463194611318', '', '', '', '2016-05-14 10:56:51', '2');
INSERT INTO `upm_token` VALUES ('277', '-1463194613932', '', '', '', '2016-05-14 10:56:53', '2');
INSERT INTO `upm_token` VALUES ('278', '-1463194614448', '', '', '', '2016-05-14 10:56:54', '2');
INSERT INTO `upm_token` VALUES ('279', '-1463194617627', '', '', '', '2016-05-14 10:56:57', '2');
INSERT INTO `upm_token` VALUES ('280', '-1463194617863', '', '', '', '2016-05-14 10:56:57', '2');
INSERT INTO `upm_token` VALUES ('281', '-1463194621349', '', '', '', '2016-05-14 10:57:01', '2');
INSERT INTO `upm_token` VALUES ('282', '-1463194621459', '', '', '', '2016-05-14 10:57:01', '2');
INSERT INTO `upm_token` VALUES ('283', '-1463194624192', '', '', '', '2016-05-14 10:57:04', '2');
INSERT INTO `upm_token` VALUES ('284', '-1463194624207', '', '', '', '2016-05-14 10:57:04', '2');
INSERT INTO `upm_token` VALUES ('285', '-1463194627195', '', '', '', '2016-05-14 10:57:07', '2');
INSERT INTO `upm_token` VALUES ('286', '-1463194627275', '', '', '', '2016-05-14 10:57:07', '2');
INSERT INTO `upm_token` VALUES ('287', '-1463194630024', '', '', '', '2016-05-14 10:57:10', '2');
INSERT INTO `upm_token` VALUES ('288', '-1463194630087', '', '', '', '2016-05-14 10:57:10', '2');
INSERT INTO `upm_token` VALUES ('289', '-1463194631977', '', '', '', '2016-05-14 10:57:11', '2');
INSERT INTO `upm_token` VALUES ('290', '-1463194639562', 'UPM', '', '', '2016-05-14 10:57:19', '2');
INSERT INTO `upm_token` VALUES ('291', '-1463194640884', '', '', '', '2016-05-14 10:57:20', '2');
INSERT INTO `upm_token` VALUES ('292', '-1463194642527', '', '', '', '2016-05-14 10:57:22', '2');
INSERT INTO `upm_token` VALUES ('293', '-1463194643583', '', '', '', '2016-05-14 10:57:23', '2');
INSERT INTO `upm_token` VALUES ('294', '-1463194645186', '', '', '', '2016-05-14 10:57:25', '2');
INSERT INTO `upm_token` VALUES ('295', '-1463194646757', '', '', '', '2016-05-14 10:57:26', '2');
INSERT INTO `upm_token` VALUES ('296', '-1463194647902', '', '', '', '2016-05-14 10:57:27', '2');
INSERT INTO `upm_token` VALUES ('297', '-1463194649334', '', '', '', '2016-05-14 10:57:29', '2');
INSERT INTO `upm_token` VALUES ('298', '-1463194651014', '', '', '', '2016-05-14 10:57:31', '2');
INSERT INTO `upm_token` VALUES ('299', '2-1463194995219', 'UPM', '2', '', '2016-05-14 11:03:15', '2');
INSERT INTO `upm_token` VALUES ('300', '2-1463194996751', '', '2', '', '2016-05-14 11:03:16', '2');
INSERT INTO `upm_token` VALUES ('301', '2-1463194997861', '', '2', '', '2016-05-14 11:03:17', '2');
INSERT INTO `upm_token` VALUES ('302', '2-1463194998887', '', '2', '', '2016-05-14 11:03:18', '2');
INSERT INTO `upm_token` VALUES ('303', '2-1463195000310', '', '2', '', '2016-05-14 11:03:20', '2');
INSERT INTO `upm_token` VALUES ('304', '2-1463195001473', '', '2', '', '2016-05-14 11:03:21', '2');
INSERT INTO `upm_token` VALUES ('305', '2-1463195002655', '', '2', '', '2016-05-14 11:03:22', '2');
INSERT INTO `upm_token` VALUES ('306', '2-1463195004027', '', '2', '', '2016-05-14 11:03:24', '2');
INSERT INTO `upm_token` VALUES ('307', '2-1463195005514', '', '2', '', '2016-05-14 11:03:25', '2');
INSERT INTO `upm_token` VALUES ('308', '2-1463195052475', '', '2', '', '2016-05-14 11:04:12', '2');
INSERT INTO `upm_token` VALUES ('309', '2-1463195057079', '', '2', '', '2016-05-14 11:04:17', '2');
INSERT INTO `upm_token` VALUES ('310', '2-1463195342479', '', '2', '', '2016-05-14 11:09:02', '2');
INSERT INTO `upm_token` VALUES ('311', '2-1463195343679', '', '2', '', '2016-05-14 11:09:03', '2');
INSERT INTO `upm_token` VALUES ('312', '2-1463195344751', '', '2', '', '2016-05-14 11:09:04', '2');
INSERT INTO `upm_token` VALUES ('313', '2-1463195345828', '', '2', '', '2016-05-14 11:09:05', '2');
INSERT INTO `upm_token` VALUES ('314', '2-1463195346986', '', '2', '', '2016-05-14 11:09:06', '2');
INSERT INTO `upm_token` VALUES ('315', '2-1463195348064', '', '2', '', '2016-05-14 11:09:08', '2');
INSERT INTO `upm_token` VALUES ('316', '2-1463195349227', '', '2', '', '2016-05-14 11:09:09', '2');
INSERT INTO `upm_token` VALUES ('317', '2-1463195350465', '', '2', '', '2016-05-14 11:09:10', '2');
INSERT INTO `upm_token` VALUES ('318', '2-1463195352510', '', '2', '', '2016-05-14 11:09:12', '2');
INSERT INTO `upm_token` VALUES ('319', '2-1463195353668', '', '2', '', '2016-05-14 11:09:13', '2');
INSERT INTO `upm_token` VALUES ('320', '2-1463195441146', '', '2', '', '2016-05-14 11:10:41', '2');
INSERT INTO `upm_token` VALUES ('321', '2-1463196279179', '', '2', '', '2016-05-14 11:24:39', '2');
INSERT INTO `upm_token` VALUES ('322', '2-1463196283133', '', '2', '', '2016-05-14 11:24:43', '2');
INSERT INTO `upm_token` VALUES ('323', '2-1463196285081', '', '2', '', '2016-05-14 11:24:45', '2');
INSERT INTO `upm_token` VALUES ('324', '2-1463196286955', '', '2', '', '2016-05-14 11:24:46', '2');
INSERT INTO `upm_token` VALUES ('325', '2-1463196288582', '', '2', '', '2016-05-14 11:24:48', '2');
INSERT INTO `upm_token` VALUES ('326', '2-1463196290621', '', '2', '', '2016-05-14 11:24:50', '2');
INSERT INTO `upm_token` VALUES ('327', '2-1463196293133', '', '2', '', '2016-05-14 11:24:53', '2');
INSERT INTO `upm_token` VALUES ('328', '2-1463196295676', '', '2', '', '2016-05-14 11:24:55', '2');
INSERT INTO `upm_token` VALUES ('329', '2-1463196334444', '', '2', '', '2016-05-14 11:25:34', '2');
INSERT INTO `upm_token` VALUES ('330', '2-1463196336862', '', '2', '', '2016-05-14 11:25:36', '2');
INSERT INTO `upm_token` VALUES ('331', '2-1463196455594', '', '2', '', '2016-05-14 11:27:35', '2');
INSERT INTO `upm_token` VALUES ('332', '2-1463196457649', '', '2', '', '2016-05-14 11:27:37', '2');
INSERT INTO `upm_token` VALUES ('333', '2-1463196482607', '', '2', '', '2016-05-14 11:28:02', '2');
INSERT INTO `upm_token` VALUES ('334', '2-1463196484832', '', '2', '', '2016-05-14 11:28:04', '2');
INSERT INTO `upm_token` VALUES ('335', '2-1463196604896', '', '2', '', '2016-05-14 11:30:04', '2');
INSERT INTO `upm_token` VALUES ('336', '2-1463196607351', '', '2', '', '2016-05-14 11:30:07', '2');
INSERT INTO `upm_token` VALUES ('337', '2-1463196608241', '', '2', '', '2016-05-14 11:30:08', '2');
INSERT INTO `upm_token` VALUES ('338', '2-1463196609474', '', '2', '', '2016-05-14 11:30:09', '2');
INSERT INTO `upm_token` VALUES ('339', '2-1463196610148', '', '2', '', '2016-05-14 11:30:10', '2');
INSERT INTO `upm_token` VALUES ('340', '2-1463196610523', '', '2', '', '2016-05-14 11:30:10', '2');
INSERT INTO `upm_token` VALUES ('341', '2-1463196613990', '', '2', '', '2016-05-14 11:30:13', '2');
INSERT INTO `upm_token` VALUES ('342', '2-1463196620619', '', '2', '', '2016-05-14 11:30:20', '2');
INSERT INTO `upm_token` VALUES ('343', '2-1463196623906', '', '2', '', '2016-05-14 11:30:23', '2');
INSERT INTO `upm_token` VALUES ('344', '2-1463196629132', '', '2', '', '2016-05-14 11:30:29', '2');
INSERT INTO `upm_token` VALUES ('345', '2-1463196809224', '', '2', '', '2016-05-14 11:33:29', '2');
INSERT INTO `upm_token` VALUES ('346', '2-1463196822243', '', '2', '', '2016-05-14 11:33:42', '2');
INSERT INTO `upm_token` VALUES ('347', '2-1463197008495', '', '2', '', '2016-05-14 11:36:48', '2');
INSERT INTO `upm_token` VALUES ('348', '2-1463197010914', '', '2', '', '2016-05-14 11:36:50', '2');
INSERT INTO `upm_token` VALUES ('349', '2-1463197013055', '', '2', '', '2016-05-14 11:36:53', '2');
INSERT INTO `upm_token` VALUES ('350', '2-1463197019236', '', '2', '', '2016-05-14 11:36:59', '2');
INSERT INTO `upm_token` VALUES ('351', '2-1463197082753', '', '2', '', '2016-05-14 11:38:02', '2');
INSERT INTO `upm_token` VALUES ('352', '2-1463197084605', '', '2', '', '2016-05-14 11:38:04', '2');
INSERT INTO `upm_token` VALUES ('353', '2-1463197086472', '', '2', '', '2016-05-14 11:38:06', '2');
INSERT INTO `upm_token` VALUES ('354', '2-1463197087129', '', '2', '', '2016-05-14 11:38:07', '2');
INSERT INTO `upm_token` VALUES ('355', '2-1463197088910', '', '2', '', '2016-05-14 11:38:08', '2');
INSERT INTO `upm_token` VALUES ('356', '2-1463197120294', '', '2', '', '2016-05-14 11:38:40', '2');
INSERT INTO `upm_token` VALUES ('357', '2-1463197125639', '', '2', '', '2016-05-14 11:38:45', '2');
INSERT INTO `upm_token` VALUES ('358', '2-1463197133409', '', '2', '', '2016-05-14 11:38:53', '2');
INSERT INTO `upm_token` VALUES ('359', '2-1463197134206', '', '2', '', '2016-05-14 11:38:54', '2');
INSERT INTO `upm_token` VALUES ('360', '2-1463197135479', '', '2', '', '2016-05-14 11:38:55', '2');
INSERT INTO `upm_token` VALUES ('361', '2-1463197136937', '', '2', '', '2016-05-14 11:38:56', '2');
INSERT INTO `upm_token` VALUES ('362', '2-1463197147065', '', '2', '', '2016-05-14 11:39:07', '2');
INSERT INTO `upm_token` VALUES ('363', '2-1463197176692', '', '2', '', '2016-05-14 11:39:36', '2');
INSERT INTO `upm_token` VALUES ('364', '2-1463197179077', '', '2', '', '2016-05-14 11:39:39', '2');
INSERT INTO `upm_token` VALUES ('365', '2-1463197181100', '', '2', '', '2016-05-14 11:39:41', '2');
INSERT INTO `upm_token` VALUES ('366', '2-1463197183409', '', '2', '', '2016-05-14 11:39:43', '2');
INSERT INTO `upm_token` VALUES ('367', '2-1463197186288', '', '2', '', '2016-05-14 11:39:46', '2');
INSERT INTO `upm_token` VALUES ('368', '2-1463197187131', '', '2', '', '2016-05-14 11:39:47', '2');
INSERT INTO `upm_token` VALUES ('369', '2-1463197188926', '', '2', '', '2016-05-14 11:39:48', '2');
INSERT INTO `upm_token` VALUES ('370', '2-1463197191299', '', '2', '', '2016-05-14 11:39:51', '2');
INSERT INTO `upm_token` VALUES ('371', '2-1463197192875', '', '2', '', '2016-05-14 11:39:52', '2');
INSERT INTO `upm_token` VALUES ('372', '2-1463197267681', '', '2', '', '2016-05-14 11:41:07', '2');
INSERT INTO `upm_token` VALUES ('373', '2-1463197305853', '', '2', '', '2016-05-14 11:41:45', '2');
INSERT INTO `upm_token` VALUES ('374', '2-1463197336123', '', '2', '', '2016-05-14 11:42:16', '2');
INSERT INTO `upm_token` VALUES ('375', '2-1463197367835', '', '2', '', '2016-05-14 11:42:47', '2');
INSERT INTO `upm_token` VALUES ('376', '2-1463197412654', '', '2', '', '2016-05-14 11:43:32', '2');
INSERT INTO `upm_token` VALUES ('377', '2-1463197416236', '', '2', '', '2016-05-14 11:43:36', '2');
INSERT INTO `upm_token` VALUES ('378', '2-1463197448107', '', '2', '', '2016-05-14 11:44:08', '2');
INSERT INTO `upm_token` VALUES ('379', '2-1463197639206', '', '2', '', '2016-05-14 11:47:19', '2');
INSERT INTO `upm_token` VALUES ('380', '2-1463197757410', '', '2', '', '2016-05-14 11:49:17', '2');
INSERT INTO `upm_token` VALUES ('381', '2-1463197919933', '', '2', '', '2016-05-14 11:51:59', '2');
INSERT INTO `upm_token` VALUES ('382', '2-1463197935179', '', '2', '', '2016-05-14 11:52:15', '2');
INSERT INTO `upm_token` VALUES ('383', '2-1463197941123', '', '2', '', '2016-05-14 11:52:21', '2');
INSERT INTO `upm_token` VALUES ('384', '2-1463197946868', '', '2', '', '2016-05-14 11:52:26', '2');
INSERT INTO `upm_token` VALUES ('385', '2-1463197953916', '', '2', '', '2016-05-14 11:52:33', '2');
INSERT INTO `upm_token` VALUES ('386', '2-1463197956262', '', '2', '', '2016-05-14 11:52:36', '2');
INSERT INTO `upm_token` VALUES ('387', '2-1463197957765', '', '2', '', '2016-05-14 11:52:37', '2');
INSERT INTO `upm_token` VALUES ('388', '2-1463197960145', '', '2', '', '2016-05-14 11:52:40', '2');
INSERT INTO `upm_token` VALUES ('389', '2-1463197962224', '', '2', '', '2016-05-14 11:52:42', '2');
INSERT INTO `upm_token` VALUES ('390', '2-1463197964755', '', '2', '', '2016-05-14 11:52:44', '2');
INSERT INTO `upm_token` VALUES ('391', '2-1463198124908', '', '2', '', '2016-05-14 11:55:24', '2');
INSERT INTO `upm_token` VALUES ('392', '2-1463198128899', '', '2', '', '2016-05-14 11:55:28', '2');
INSERT INTO `upm_token` VALUES ('393', '2-1463198135051', '', '2', '', '2016-05-14 11:55:35', '2');
INSERT INTO `upm_token` VALUES ('394', '2-1463198146759', '', '2', '', '2016-05-14 11:55:46', '2');
INSERT INTO `upm_token` VALUES ('395', '2-1463198198456', '', '2', '', '2016-05-14 11:56:38', '2');
INSERT INTO `upm_token` VALUES ('396', '2-1463198199344', '', '2', '', '2016-05-14 11:56:39', '2');
INSERT INTO `upm_token` VALUES ('397', '2-1463198199736', '', '2', '', '2016-05-14 11:56:39', '2');
INSERT INTO `upm_token` VALUES ('398', '2-1463198200330', '', '2', '', '2016-05-14 11:56:40', '2');
INSERT INTO `upm_token` VALUES ('399', '2-1463198200930', '', '2', '', '2016-05-14 11:56:40', '2');
INSERT INTO `upm_token` VALUES ('400', '2-1463198254370', '', '2', '', '2016-05-14 11:57:34', '2');
INSERT INTO `upm_token` VALUES ('401', '2-1463198254917', '', '2', '', '2016-05-14 11:57:34', '2');
INSERT INTO `upm_token` VALUES ('402', '2-1463198282913', '', '2', '', '2016-05-14 11:58:02', '2');
INSERT INTO `upm_token` VALUES ('403', '2-1463198284244', '', '2', '', '2016-05-14 11:58:04', '2');
INSERT INTO `upm_token` VALUES ('404', '2-1463198538541', '', '2', '', '2016-05-14 12:02:18', '2');
INSERT INTO `upm_token` VALUES ('405', '2-1463198540498', '', '2', '', '2016-05-14 12:02:20', '2');
INSERT INTO `upm_token` VALUES ('406', '2-1463198541749', '', '2', '', '2016-05-14 12:02:21', '2');
INSERT INTO `upm_token` VALUES ('407', '2-1463198543115', '', '2', '', '2016-05-14 12:02:23', '2');
INSERT INTO `upm_token` VALUES ('408', '2-1463198544564', '', '2', '', '2016-05-14 12:02:24', '2');
INSERT INTO `upm_token` VALUES ('409', '2-1463198546027', '', '2', '', '2016-05-14 12:02:26', '2');
INSERT INTO `upm_token` VALUES ('410', '2-1463198547302', '', '2', '', '2016-05-14 12:02:27', '2');
INSERT INTO `upm_token` VALUES ('411', '2-1463198548577', '', '2', '', '2016-05-14 12:02:28', '2');
INSERT INTO `upm_token` VALUES ('412', '2-1463198549825', '', '2', '', '2016-05-14 12:02:29', '2');
INSERT INTO `upm_token` VALUES ('413', '2-1463198550809', '', '2', '', '2016-05-14 12:02:30', '2');
INSERT INTO `upm_token` VALUES ('414', '2-1463198597585', '', '2', '', '2016-05-14 12:03:17', '2');
INSERT INTO `upm_token` VALUES ('415', '2-1463198598888', '', '2', '', '2016-05-14 12:03:18', '2');
INSERT INTO `upm_token` VALUES ('416', '2-1463198600010', '', '2', '', '2016-05-14 12:03:20', '2');
INSERT INTO `upm_token` VALUES ('417', '2-1463198601202', '', '2', '', '2016-05-14 12:03:21', '2');
INSERT INTO `upm_token` VALUES ('418', '2-1463198602344', '', '2', '', '2016-05-14 12:03:22', '2');
INSERT INTO `upm_token` VALUES ('419', '2-1463198603536', '', '2', '', '2016-05-14 12:03:23', '2');
INSERT INTO `upm_token` VALUES ('420', '2-1463198604789', '', '2', '', '2016-05-14 12:03:24', '2');
INSERT INTO `upm_token` VALUES ('421', '2-1463198606581', '', '2', '', '2016-05-14 12:03:26', '2');
INSERT INTO `upm_token` VALUES ('422', '2-1463198607808', '', '2', '', '2016-05-14 12:03:27', '2');
INSERT INTO `upm_token` VALUES ('423', '2-1463198609156', '', '2', '', '2016-05-14 12:03:29', '2');
INSERT INTO `upm_token` VALUES ('424', '2-1463199204149', '', '2', '', '2016-05-14 12:13:24', '2');
INSERT INTO `upm_token` VALUES ('425', '2-1463199207400', '', '2', '', '2016-05-14 12:13:27', '2');
INSERT INTO `upm_token` VALUES ('426', '2-1463199208884', '', '2', '', '2016-05-14 12:13:28', '2');
INSERT INTO `upm_token` VALUES ('427', '2-1463199211268', '', '2', '', '2016-05-14 12:13:31', '2');
INSERT INTO `upm_token` VALUES ('428', '2-1463199212903', '', '2', '', '2016-05-14 12:13:32', '2');
INSERT INTO `upm_token` VALUES ('429', '2-1463199216157', '', '2', '', '2016-05-14 12:13:36', '2');
INSERT INTO `upm_token` VALUES ('430', '2-1463199221345', '', '2', '', '2016-05-14 12:13:41', '2');
INSERT INTO `upm_token` VALUES ('431', '2-1463199223191', '', '2', '', '2016-05-14 12:13:43', '2');
INSERT INTO `upm_token` VALUES ('432', '2-1463199224632', '', '2', '', '2016-05-14 12:13:44', '2');
INSERT INTO `upm_token` VALUES ('433', '2-1463199225849', '', '2', '', '2016-05-14 12:13:45', '2');
INSERT INTO `upm_token` VALUES ('434', '2-1463199293712', '', '2', '', '2016-05-14 12:14:53', '2');
INSERT INTO `upm_token` VALUES ('435', '2-1463199301201', '', '2', '', '2016-05-14 12:15:01', '2');
INSERT INTO `upm_token` VALUES ('436', '2-1463199303008', '', '2', '', '2016-05-14 12:15:03', '2');
INSERT INTO `upm_token` VALUES ('437', '2-1463199317260', '', '2', '', '2016-05-14 12:15:17', '2');
INSERT INTO `upm_token` VALUES ('438', '2-1463199318345', '', '2', '', '2016-05-14 12:15:18', '2');
INSERT INTO `upm_token` VALUES ('439', '2-1463199321141', '', '2', '', '2016-05-14 12:15:21', '2');
INSERT INTO `upm_token` VALUES ('440', '2-1463199322664', '', '2', '', '2016-05-14 12:15:22', '2');
INSERT INTO `upm_token` VALUES ('441', '2-1463199351655', '', '2', '', '2016-05-14 12:15:51', '2');
INSERT INTO `upm_token` VALUES ('442', '2-1463199427139', '', '2', '', '2016-05-14 12:17:07', '2');
INSERT INTO `upm_token` VALUES ('443', '2-1463199456998', '', '2', '', '2016-05-14 12:17:36', '2');
INSERT INTO `upm_token` VALUES ('444', '2-1463199469265', '', '2', '', '2016-05-14 12:17:49', '2');
INSERT INTO `upm_token` VALUES ('445', '2-1463199472619', '', '2', '', '2016-05-14 12:17:52', '2');
INSERT INTO `upm_token` VALUES ('446', '2-1463199475940', '', '2', '', '2016-05-14 12:17:55', '2');
INSERT INTO `upm_token` VALUES ('447', '2-1463199476869', '', '2', '', '2016-05-14 12:17:56', '2');
INSERT INTO `upm_token` VALUES ('448', '2-1463199486578', '', '2', '', '2016-05-14 12:18:06', '2');
INSERT INTO `upm_token` VALUES ('449', '2-1463199529432', '', '2', '', '2016-05-14 12:18:49', '2');
INSERT INTO `upm_token` VALUES ('450', '2-1463199540697', '', '2', '', '2016-05-14 12:19:00', '2');
INSERT INTO `upm_token` VALUES ('451', '2-1463199580853', '', '2', '', '2016-05-14 12:19:40', '2');
INSERT INTO `upm_token` VALUES ('452', '2-1463199589874', '', '2', '', '2016-05-14 12:19:49', '2');
INSERT INTO `upm_token` VALUES ('453', '2-1463818953102', 'UPM', '2', '', '2016-05-21 16:22:33', '2');
INSERT INTO `upm_token` VALUES ('454', '2-1463818980358', 'UPM', '2', '', '2016-05-21 16:23:00', '2');
INSERT INTO `upm_token` VALUES ('455', '2-1463818983584', 'UPM', '2', '', '2016-05-21 16:23:03', '2');
INSERT INTO `upm_token` VALUES ('456', '2-1463818985626', 'UPM', '2', '', '2016-05-21 16:23:05', '2');
INSERT INTO `upm_token` VALUES ('457', '2-1463819108895', 'UPM', '2', '', '2016-05-21 16:25:08', '2');
INSERT INTO `upm_token` VALUES ('458', '2-1463819118866', 'UPM', '2', '', '2016-05-21 16:25:18', '2');
INSERT INTO `upm_token` VALUES ('459', '2-1463819141234', 'UPM', '2', '', '2016-05-21 16:25:41', '2');
INSERT INTO `upm_token` VALUES ('460', '2-1463819238309', 'UPM', '2', '', '2016-05-21 16:27:18', '2');
INSERT INTO `upm_token` VALUES ('461', '2-1463819306531', 'UPM', '2', '', '2016-05-21 16:28:26', '2');
INSERT INTO `upm_token` VALUES ('462', '2-1463819342008', 'UPM', '2', '', '2016-05-21 16:29:02', '2');

-- ----------------------------
-- Table structure for `upm_user`
-- ----------------------------
DROP TABLE IF EXISTS `upm_user`;
CREATE TABLE `upm_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_No` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pwd` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_By` int(11) DEFAULT NULL,
  `create_Date` datetime DEFAULT NULL,
  `update_By` int(11) DEFAULT NULL,
  `update_Date` datetime DEFAULT NULL,
  `enable_Flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lock_Status` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_desc` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of upm_user
-- ----------------------------
INSERT INTO `upm_user` VALUES ('2', 'admin', '123456', 'admin', null, '1111111111111', null, null, '34', '2017-03-07 05:20:40', '', '', '总公司', 'admin@163.com');
INSERT INTO `upm_user` VALUES ('10', 'sunli', 'slslsl', '孙丽', null, '111111111111', '2', '2016-01-26 09:51:27', '2', '2016-02-01 09:41:43', 'T', '0', '区域经理1', null);
INSERT INTO `upm_user` VALUES ('11', 'zhangshuzhi', 'zszzsz', '张树志', null, '111111111111111', '2', '2016-01-28 03:55:11', '2', '2016-01-30 07:47:25', 'T', '0', '销售经理1', null);
INSERT INTO `upm_user` VALUES ('12', 'xuningning', 'xnnxnn', '徐宁宁', null, '111111111111111', '10', '2016-01-28 07:09:19', '2', '2016-01-30 07:51:20', 'T', '0', '办公室内勤人员', null);
INSERT INTO `upm_user` VALUES ('13', 'zhangyu', 'zyzyzy', '张宇', null, '111111111111', '2', '2016-01-28 08:21:43', '2', '2016-01-30 07:47:59', 'T', '0', '销售经理2', null);
INSERT INTO `upm_user` VALUES ('14', 'lixiaoyong', 'lxylxy', '李小勇', null, '1111111111111', '2', '2016-01-28 08:22:16', '2', '2016-02-02 04:32:09', 'T', '0', '销售经理3', null);
INSERT INTO `upm_user` VALUES ('17', 'zhangchengfeng', 'zcfzcf', '张成凤', null, '12345678998', '2', '2016-01-30 05:25:50', '2', '2016-01-30 07:50:04', 'T', '0', '销售经理4', null);
INSERT INTO `upm_user` VALUES ('18', 'liuguoyi', 'liuguoyi', '刘国义', null, '13520406116', '2', '2016-01-30 07:15:47', '2', '2016-02-01 09:39:03', 'T', '0', '公司总经理', null);
INSERT INTO `upm_user` VALUES ('19', 'panmai', 'pmpmpm', '潘迈', null, '13520406116', '2', '2016-01-30 07:45:16', '0', null, 'T', '0', '客服部经理', null);
INSERT INTO `upm_user` VALUES ('20', 'xuweiwei', 'xwwxww', '徐威威', null, '13520406116', '2', '2016-01-30 07:46:43', '0', null, 'T', '0', '区域经理2', null);
INSERT INTO `upm_user` VALUES ('21', 'zhangwenhua', 'zwhzwh', '张文花', null, '13520406116', '2', '2016-01-30 07:49:17', '0', null, 'T', '0', '销售经理5', null);
INSERT INTO `upm_user` VALUES ('22', 'wangyong', 'wywywy', '王勇', null, '12345678911', '2', '2016-01-30 07:50:57', '0', null, 'T', '0', '市场部经理', null);
INSERT INTO `upm_user` VALUES ('23', 'miaolijuan', 'mljmlj', '苗丽娟', null, '13520406116', '2', '2016-01-30 07:56:08', '2', '2016-02-01 10:59:48', 'T', '0', '销售经理6', null);
INSERT INTO `upm_user` VALUES ('24', 'lihongyan', 'lhylhy', '李红艳', null, '13520406116', '2', '2016-01-30 07:56:52', '0', null, 'T', '0', '销售助理1', null);
INSERT INTO `upm_user` VALUES ('25', 'mengxuejiao', 'mxjmxj', '孟雪娇', null, '13520406116', '2', '2016-01-30 07:57:34', '0', null, 'T', '0', '销售助理2', null);
INSERT INTO `upm_user` VALUES ('26', 'gaolizhong', 'gaolizhong', '高利忠', null, '13683589361', '2', '2016-02-01 09:44:17', '0', null, 'T', '0', '咨询师01', null);
INSERT INTO `upm_user` VALUES ('27', 'yangyonghui', 'yangyonghui', '杨勇辉', null, '18228033913', '2', '2016-02-01 09:45:22', '0', null, 'T', '0', '咨询师02', null);
INSERT INTO `upm_user` VALUES ('28', 'wangfaxian', 'wangfaxian', '王法宪', null, '13661181883', '2', '2016-02-01 09:45:54', '0', null, 'T', '0', '咨询部经理', null);
INSERT INTO `upm_user` VALUES ('29', 'wangyan', 'wangyan', '王燕', null, '18501150269', '2', '2016-02-01 09:46:37', '0', null, 'T', '0', '咨询师03', null);
INSERT INTO `upm_user` VALUES ('30', 'tangyucai', 'tangyucai', '唐玉才', null, '17090115061', '2', '2016-02-01 10:26:46', '0', null, 'T', '0', '咨询师05', null);
INSERT INTO `upm_user` VALUES ('31', 'chendong', 'chendong', '陈栋', null, '15383864903', '2', '2016-02-01 10:32:26', '0', null, 'T', '0', '咨询师06', null);
INSERT INTO `upm_user` VALUES ('32', 'gehuanhuan', 'gehuanhuan', '葛欢欢', null, '18510714616', '2', '2016-02-01 10:34:02', '0', null, 'T', '0', '咨询师07', null);
INSERT INTO `upm_user` VALUES ('33', 'yufengnian', 'yufengnian', '于丰年', null, '18801301837', '2', '2016-02-01 10:35:04', '0', null, 'T', '0', '客服助理01', null);
INSERT INTO `upm_user` VALUES ('34', 'sysadmin', 'sysadmin', 'sysadmin', null, '13520406116', '2', '2016-02-01 01:55:31', '0', null, 'T', '0', '咨询师04', null);

-- ----------------------------
-- Table structure for `upm_user_and_user_group_rel`
-- ----------------------------
DROP TABLE IF EXISTS `upm_user_and_user_group_rel`;
CREATE TABLE `upm_user_and_user_group_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `create_By` int(11) DEFAULT NULL,
  `create_Date` datetime DEFAULT NULL,
  `update_By` int(11) DEFAULT NULL,
  `update_Date` datetime DEFAULT NULL,
  `enable_Flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lock_Status` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of upm_user_and_user_group_rel
-- ----------------------------
INSERT INTO `upm_user_and_user_group_rel` VALUES ('13', '3', '1', '0', '2016-01-09 00:00:00', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('14', '4', '1', '0', '2016-01-09 00:00:00', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('21', '2', '20', '0', '2016-01-10 00:00:00', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('22', '3', '20', '0', '2016-01-10 00:00:00', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('23', '5', '20', '0', '2016-01-10 00:00:00', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('26', '8', '20', '0', '2016-01-10 00:00:00', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('27', '9', '20', '0', '2016-01-10 00:00:00', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('29', '2', '29', '2', '2016-01-28 04:36:15', '0', '2016-01-28 04:36:46', 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('31', '11', '29', '2', '2016-01-28 04:36:16', '0', '2016-01-28 04:36:46', 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('32', '10', '11', '2', '2016-01-28 04:44:51', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('33', '2', '11', '2', '2016-01-28 04:46:03', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('37', '10', '30', '10', '2016-01-28 07:11:00', '0', '2016-01-28 09:46:23', 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('38', '12', '30', '10', '2016-01-28 07:11:01', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('39', '11', '32', '2', '2016-01-28 08:25:17', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('40', '14', '32', '2', '2016-01-28 08:25:17', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('42', '2', '30', '2', '2016-01-28 09:46:23', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('43', '13', '30', '2', '2016-01-28 09:46:35', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('46', '16', '1', '2', '2016-01-30 05:17:26', '0', '2016-01-30 05:19:44', 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('49', '22', '1', '2', '2016-01-30 10:01:44', '0', '2016-02-01 10:53:27', 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('50', '10', '2', '2', '2016-01-30 10:01:58', '0', '2016-02-01 04:54:36', 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('51', '20', '3', '2', '2016-01-30 10:02:15', '0', '2016-02-01 10:41:11', 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('52', '11', '5', '2', '2016-01-30 10:02:46', '0', '2016-02-01 10:41:58', 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('53', '13', '6', '2', '2016-01-30 10:02:57', '0', '2016-02-01 10:42:10', 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('57', '21', '39', '2', '2016-01-30 10:04:40', '0', '2016-02-01 10:43:38', 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('58', '23', '40', '2', '2016-01-30 10:04:52', '0', '2016-02-01 10:43:53', 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('60', '14', '36', '2', '2016-01-30 10:07:57', '0', '2016-02-01 10:42:38', 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('61', '24', '37', '2', '2016-01-30 10:08:19', '0', '2016-02-01 10:43:05', 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('62', '17', '38', '2', '2016-01-30 10:08:49', '0', '2016-02-01 10:43:20', 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('63', '25', '41', '2', '2016-01-30 10:09:08', '0', '2016-02-01 10:44:06', 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('64', '19', '21', '2', '2016-02-01 11:43:40', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('65', '28', '23', '2', '2016-02-01 11:43:55', '0', '2016-02-01 03:17:35', 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('66', '33', '22', '2', '2016-02-01 01:52:22', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('67', '26', '24', '2', '2016-02-01 01:53:08', '0', '2016-02-01 04:34:02', 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('68', '27', '33', '2', '2016-02-01 01:53:23', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('69', '29', '46', '2', '2016-02-01 01:53:37', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('70', '30', '47', '2', '2016-02-01 01:54:02', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('71', '34', '51', '2', '2016-02-01 01:55:54', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('72', '18', '0', '2', '2016-02-01 02:19:31', '0', '2016-02-02 04:16:10', 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('73', '27', '24', '2', '2016-02-01 04:34:15', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('74', '29', '24', '2', '2016-02-01 04:34:29', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('75', '30', '24', '2', '2016-02-01 04:34:39', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('76', '31', '24', '2', '2016-02-01 04:34:50', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('77', '32', '24', '2', '2016-02-01 04:34:59', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('78', '34', '24', '2', '2016-02-01 04:35:07', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('79', '12', '11', '2', '2016-02-01 04:35:31', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('80', '19', '12', '2', '2016-02-01 04:35:39', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('81', '18', '24', '2', '2016-02-01 04:37:36', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('82', '19', '24', '2', '2016-02-01 04:37:42', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('83', '28', '24', '2', '2016-02-01 04:37:53', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('84', '33', '24', '2', '2016-02-01 04:38:03', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('85', '19', '22', '2', '2016-02-01 04:38:16', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('86', '19', '10', '2', '2016-02-01 04:38:25', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('87', '10', '37', '2', '2016-02-01 05:01:13', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('88', '20', '58', '2', '2016-02-01 05:01:40', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('89', '22', '56', '2', '2016-02-01 06:49:20', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('90', '22', '59', '2', '2016-02-01 06:49:32', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('91', '10', '57', '2', '2016-02-02 04:35:36', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('92', '22', '60', '2', '2016-02-02 04:48:10', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('93', '22', '64', '2', '2016-02-02 04:54:39', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('94', '11', '7', '2', '2016-02-02 04:55:14', '0', null, 'T', '0');
INSERT INTO `upm_user_and_user_group_rel` VALUES ('95', '13', '7', '2', '2016-02-04 09:44:48', '0', null, 'T', '0');

-- ----------------------------
-- Table structure for `upm_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `upm_user_group`;
CREATE TABLE `upm_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_code` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group_name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `create_By` int(11) DEFAULT NULL,
  `create_Date` datetime DEFAULT NULL,
  `update_By` int(11) DEFAULT NULL,
  `update_Date` datetime DEFAULT NULL,
  `enable_Flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lock_Status` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bussiness_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of upm_user_group
-- ----------------------------
INSERT INTO `upm_user_group` VALUES ('0', 'MANAGERS', '总经理', '0', '0', null, '2', '2016-01-29 09:19:27', null, null, '00');
INSERT INTO `upm_user_group` VALUES ('1', 'MARKET_MANAGER', '市场部经理', '0', '0', null, '2', '2016-02-04 05:17:17', null, null, '0001');
INSERT INTO `upm_user_group` VALUES ('2', 'AREA_MANAGER', '区域经理', '1', '0', null, '2', '2016-01-29 09:21:11', null, null, '000101');
INSERT INTO `upm_user_group` VALUES ('3', 'AREA-MANAGER', '区域经理', '1', '0', null, '2', '2016-02-01 04:46:57', null, null, '000102');
INSERT INTO `upm_user_group` VALUES ('5', 'SALE_MANAGER', '销售经理', '2', '0', null, '2', '2016-01-29 09:22:02', null, null, '00010101');
INSERT INTO `upm_user_group` VALUES ('7', 'SALE_ASSISTANT', '销售助理', '5', '0', null, '2', '2016-01-29 09:22:45', null, null, '0001010101');
INSERT INTO `upm_user_group` VALUES ('8', 'SALE_ASSISTANT', '销售助理', '5', '0', null, '2', '2016-01-29 09:23:24', null, null, '0001010102');
INSERT INTO `upm_user_group` VALUES ('9', 'SALE_ASSISTANT', '销售助理', '5', '0', null, '2', '2016-01-29 09:24:11', null, null, '0001010103');
INSERT INTO `upm_user_group` VALUES ('10', 'office-director', '办公室主任', '0', '0', null, '2', '2016-02-01 04:06:11', null, null, '0002');
INSERT INTO `upm_user_group` VALUES ('11', 'INTERNAL_OFFICE', '内勤', '10', '0', null, '2', '2016-02-02 11:08:59', null, null, '000201');
INSERT INTO `upm_user_group` VALUES ('12', 'office-director', '财务', '10', '0', null, '2', '2016-02-01 04:09:30', null, null, '000202');
INSERT INTO `upm_user_group` VALUES ('21', 'customer-assistant', '客服部经理', '0', '0', null, '2', '2016-02-01 04:11:47', null, null, '0003');
INSERT INTO `upm_user_group` VALUES ('22', 'customer-assistant', '客服助理', '21', '0', null, '2', '2016-02-01 04:12:04', null, null, '000301');
INSERT INTO `upm_user_group` VALUES ('23', 'SERVICE_MANAGER', '咨询部经理', '0', '0', null, '2', '2016-02-02 04:40:09', null, null, '0004');
INSERT INTO `upm_user_group` VALUES ('24', 'SERVICE_PER', '咨询师', '23', '0', null, '2', '2016-02-04 08:09:28', null, null, '000401');
INSERT INTO `upm_user_group` VALUES ('32', 'TEST_03_01', '测试组织0301', '31', '2', '2016-01-28 08:24:50', '0', '2016-01-29 10:28:25', null, null, null);
INSERT INTO `upm_user_group` VALUES ('36', 'SALE_MANAGER', '销售经理', '2', '0', null, '2', '2016-02-01 03:57:34', null, null, '00010103');
INSERT INTO `upm_user_group` VALUES ('37', 'SALE_MANAGER', '销售经理', '2', '0', null, '2', '2016-02-01 03:58:00', null, null, '00010104');
INSERT INTO `upm_user_group` VALUES ('38', 'SALE_MANAGER', '销售经理', '3', '0', null, '2', '2016-02-01 03:58:54', null, null, '00010201');
INSERT INTO `upm_user_group` VALUES ('39', 'SALE_MANAGER', '销售经理', '3', '0', null, '2', '2016-02-01 03:59:02', null, null, '00010202');
INSERT INTO `upm_user_group` VALUES ('40', 'SALE_MANAGER', '销售经理', '3', '0', null, '2', '2016-02-01 03:59:13', null, null, '00010203');
INSERT INTO `upm_user_group` VALUES ('41', 'SALE_MANAGER', '销售经理', '3', '0', null, '2', '2016-02-01 03:59:20', null, null, '00010204');
INSERT INTO `upm_user_group` VALUES ('54', '', '', '37', '2', '2016-02-01 04:54:51', '0', null, null, null, '');
INSERT INTO `upm_user_group` VALUES ('55', '', '', '37', '2', '2016-02-01 04:55:17', '0', null, null, null, '');
INSERT INTO `upm_user_group` VALUES ('56', 'AREA-MANAGER', '区域经理', '1', '0', null, '2', '2016-02-01 06:47:52', null, null, '000103');
INSERT INTO `upm_user_group` VALUES ('57', 'SALE_MANAGER', '销售经理', '2', '0', null, '2', '2016-02-01 05:02:01', null, null, '00010105');
INSERT INTO `upm_user_group` VALUES ('58', 'SALE_MANAGER', '销售经理', '3', '0', null, '2', '2016-02-01 05:02:14', null, null, '00010205');
INSERT INTO `upm_user_group` VALUES ('60', 'SALE_MANAGER', '销售经理', '56', '0', null, '2', '2016-02-02 04:51:01', null, null, '00010301');
INSERT INTO `upm_user_group` VALUES ('63', '', '', '57', '2', '2016-02-02 04:52:28', '0', null, null, null, '');
INSERT INTO `upm_user_group` VALUES ('64', 'sale-assistant', '销售助理', '60', '0', null, '2', '2016-02-02 04:54:20', null, null, '0001030101');
INSERT INTO `upm_user_group` VALUES ('65', 'sale-assistant', '销售助理', '36', '0', null, '2', '2016-02-02 04:56:50', null, null, '0001030201');
INSERT INTO `upm_user_group` VALUES ('67', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `upm_user_group_and_role_rel`
-- ----------------------------
DROP TABLE IF EXISTS `upm_user_group_and_role_rel`;
CREATE TABLE `upm_user_group_and_role_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of upm_user_group_and_role_rel
-- ----------------------------
INSERT INTO `upm_user_group_and_role_rel` VALUES ('26', '1', '2');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('28', '1', '4');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('29', '2', '5');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('30', '5', '6');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('32', '6', '6');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('33', '7', '7');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('34', '8', '7');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('35', '9', '7');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('36', '36', '6');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('37', '37', '6');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('38', '3', '5');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('39', '38', '6');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('40', '39', '6');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('41', '40', '6');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('43', '41', '6');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('44', '2', '6');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('45', '2', '7');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('46', '3', '6');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('47', '3', '7');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('49', '24', '14');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('50', '33', '14');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('51', '46', '14');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('52', '47', '14');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('53', '48', '14');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('54', '49', '14');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('55', '50', '14');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('56', '51', '14');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('57', '21', '13');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('58', '22', '15');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('59', '42', '15');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('60', '52', '15');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('61', '53', '15');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('63', '0', '16');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('65', '57', '6');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('66', '0', '11');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('67', '60', '6');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('68', '11', '8');
INSERT INTO `upm_user_group_and_role_rel` VALUES ('69', '23', '14');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `loginNo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pwd` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cardNo` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `enableFlag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lockStatus` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'sysadmin', 'sysadmin', 'sysadmin', '1111111', '河南', '15833333', null, null, null, null, 'T', '0');
