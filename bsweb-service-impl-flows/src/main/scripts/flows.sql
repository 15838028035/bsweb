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

