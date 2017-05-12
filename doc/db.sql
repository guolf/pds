/*
 Navicat Premium Data Transfer

 Source Server         : 182.106.129.91
 Source Server Type    : MySQL
 Source Server Version : 50635
 Source Host           : 182.106.129.91
 Source Database       : jxtelecom

 Target Server Type    : MySQL
 Target Server Version : 50635
 File Encoding         : utf-8

 Date: 05/12/2017 14:03:57 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `jxtelecom_table`
-- ----------------------------
DROP TABLE IF EXISTS `jxtelecom_table`;
CREATE TABLE `jxtelecom_table` (
  `id` int(3) DEFAULT NULL,
  `name` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `jxtelecom_table`
-- ----------------------------
BEGIN;
INSERT INTO `jxtelecom_table` VALUES ('1', 'jxtlecom');
COMMIT;

-- ----------------------------
--  Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qrtz_cron_triggers`
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', '0 0 12 * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
--  Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qrtz_job_details`
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', null, 'com.jxtelecom.pds.utils.ScheduleJob', '0', '0', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000d4a4f425f504152414d5f4b45597400b17b226265616e4e616d65223a2267656e657261746552616e6b5461736b222c2263726561746554696d65223a313439343438333932303939322c2263726f6e45787072657373696f6e223a22302030203132202a202a203f222c226a6f624964223a322c226d6574686f644e616d65223a2267656e6572617465222c2272656d61726b223a22e5aea2e688b7e7bb8fe79086e68e92e5908de5ae9ae697b6e4bbbbe58aa1222c22737461747573223a307d7800);
COMMIT;

-- ----------------------------
--  Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qrtz_locks`
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS'), ('RenrenScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
--  Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qrtz_scheduler_state`
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'guolf.local1494568227901', '1494569036250', '15000'), ('RenrenScheduler', 'n-haocai031494567194818', '1494569033755', '15000'), ('RenrenScheduler', 'yll-PC1494554532239', '1494569020402', '15000');
COMMIT;

-- ----------------------------
--  Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qrtz_triggers`
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1494648000000', '-1', '5', 'WAITING', 'CRON', '1494483921000', '0', null, '2', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000d4a4f425f504152414d5f4b45597400b17b226265616e4e616d65223a2267656e657261746552616e6b5461736b222c2263726561746554696d65223a313439343438333932313030302c2263726f6e45787072657373696f6e223a22302030203132202a202a203f222c226a6f624964223a322c226d6574686f644e616d65223a2267656e6572617465222c2272656d61726b223a22e5aea2e688b7e7bb8fe79086e68e92e5908de5ae9ae697b6e4bbbbe58aa1222c22737461747573223a307d7800);
COMMIT;

-- ----------------------------
--  Table structure for `schedule_job`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
--  Records of `schedule_job`
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job` VALUES ('2', 'generateRankTask', 'generate', null, '0 0 12 * * ?', '0', '客户经理排名定时任务', '2017-05-11 14:25:21');
COMMIT;

-- ----------------------------
--  Table structure for `schedule_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
--  Records of `schedule_job_log`
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'test', null, '1', 'java.lang.NoSuchMethodException: com.jxtelecom.pds.task.TestTask.test()', '4', '2017-05-11 13:24:05'), ('2', '1', 'testTask', 'test2', null, '0', null, '1', '2017-05-11 13:24:38'), ('3', '1', 'testTask', 'test2', null, '0', null, '2', '2017-05-11 13:53:20'), ('4', '2', 'generateRankTask', 'generate', null, '0', null, '45', '2017-05-11 14:25:28'), ('5', '2', 'generateRankTask', 'generate', null, '0', null, '357', '2017-05-11 16:26:32'), ('6', '2', 'generateRankTask', 'generate', null, '0', null, '104', '2017-05-11 16:30:04'), ('7', '2', 'generateRankTask', 'generate', null, '0', null, '83', '2017-05-11 16:30:53'), ('8', '2', 'generateRankTask', 'generate', null, '0', null, '66', '2017-05-11 16:30:54'), ('9', '2', 'generateRankTask', 'generate', null, '0', null, '13', '2017-05-11 16:30:56'), ('10', '2', 'generateRankTask', 'generate', null, '0', null, '48', '2017-05-11 16:30:49'), ('11', '2', 'generateRankTask', 'generate', null, '1', 'java.util.concurrent.ExecutionException: com.jxtelecom.pds.utils.RRException: 执行定时任务失败', '177', '2017-05-11 16:43:24'), ('12', '2', 'generateRankTask', 'generate', null, '1', 'java.util.concurrent.ExecutionException: com.jxtelecom.pds.utils.RRException: 执行定时任务失败', '64', '2017-05-11 16:43:49'), ('13', '2', 'generateRankTask', 'generate', null, '1', 'java.util.concurrent.ExecutionException: com.jxtelecom.pds.utils.RRException: 执行定时任务失败', '66', '2017-05-11 16:45:33'), ('14', '2', 'generateRankTask', 'generate', null, '0', null, '87', '2017-05-11 17:02:34'), ('15', '2', 'generateRankTask', 'generate', null, '0', null, '81', '2017-05-11 20:25:09'), ('16', '2', 'generateRankTask', 'generate', null, '0', null, '64', '2017-05-11 21:14:23'), ('17', '2', 'generateRankTask', 'generate', null, '0', null, '113', '2017-05-11 21:39:11'), ('18', '2', 'generateRankTask', 'generate', null, '0', null, '132', '2017-05-11 21:39:32'), ('19', '2', 'generateRankTask', 'generate', null, '0', null, '15', '2017-05-11 23:04:28'), ('20', '2', 'generateRankTask', 'generate', null, '0', null, '185', '2017-05-12 11:24:59'), ('21', '2', 'generateRankTask', 'generate', null, '0', null, '15', '2017-05-12 11:29:21'), ('22', '2', 'generateRankTask', 'generate', null, '0', null, '8', '2017-05-12 12:00:00'), ('23', '2', 'generateRankTask', 'generate', null, '0', null, '367', '2017-05-12 13:39:32'), ('24', '2', 'generateRankTask', 'generate', null, '0', null, '799', '2017-05-12 14:00:11');
COMMIT;

-- ----------------------------
--  Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
--  Records of `sys_config`
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');
COMMIT;

-- ----------------------------
--  Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
--  Records of `sys_log`
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES ('1', 'admin', '保存角色', 'io.renren.controller.SysRoleController.save()', '{\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,28],\"roleName\":\"管理员\"}', '0:0:0:0:0:0:0:1', '2017-04-29 10:28:02'), ('2', 'admin', '修改菜单', 'io.renren.controller.SysMenuController.update()', '{\"icon\":\"fa fa-user\",\"menuId\":2,\"name\":\"用户列表\",\"orderNum\":1,\"parentId\":1,\"parentName\":\"系统管理\",\"type\":1,\"url\":\"sys/user.html\"}', '0:0:0:0:0:0:0:1', '2017-05-08 22:25:50'), ('3', 'admin', '保存角色', 'io.renren.controller.SysRoleController.save()', '{\"menuIdList\":[],\"roleName\":\"客户经理\"}', '0:0:0:0:0:0:0:1', '2017-05-08 22:26:11'), ('4', 'admin', '保存角色', 'io.renren.controller.SysRoleController.save()', '{\"menuIdList\":[],\"roleName\":\"业务主管\"}', '0:0:0:0:0:0:0:1', '2017-05-08 22:26:24'), ('5', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"icon\":\"fa fa-list-ol\",\"name\":\"任务管理\",\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2017-05-10 10:45:50'), ('6', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"欠费用户管理\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"chargeoverdue:list\",\"type\":1,\"url\":\"chargeoverdue/list\"}', '0:0:0:0:0:0:0:1', '2017-05-10 10:46:51'), ('7', 'admin', '修改菜单', 'com.jxtelecom.pds.admin.SysMenuController.update()', '{\"menuId\":32,\"name\":\"欠费用户管理\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"任务管理\",\"perms\":\"chargeoverdue:list\",\"type\":1,\"url\":\"charge/chargeoverdue.html\"}', '0:0:0:0:0:0:0:1', '2017-05-10 10:48:41'), ('8', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"新增\",\"orderNum\":0,\"parentId\":32,\"parentName\":\"欠费用户管理\",\"perms\":\"chargeoverdue:save\",\"type\":2}', '0:0:0:0:0:0:0:1', '2017-05-10 11:09:12'), ('9', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"修改\",\"orderNum\":0,\"parentId\":32,\"parentName\":\"欠费用户管理\",\"perms\":\"chargeoverdue:update\",\"type\":2}', '0:0:0:0:0:0:0:1', '2017-05-10 11:09:31'), ('10', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"删除\",\"orderNum\":0,\"parentId\":32,\"parentName\":\"欠费用户管理\",\"perms\":\"chargeoverdue:delete\",\"type\":2}', '0:0:0:0:0:0:0:1', '2017-05-10 11:09:56'), ('11', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"icon\":\"fa fa-list-ol\",\"name\":\"欠费任务管理\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"任务管理\",\"perms\":\"task:list\",\"type\":1,\"url\":\"task/task.html\"}', '0:0:0:0:0:0:0:1', '2017-05-10 15:42:59'), ('12', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"icon\":\"fa fa-address-book-o\",\"name\":\"客户经理管理\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"任务管理\",\"type\":1,\"url\":\"customerrela.html\"}', '0:0:0:0:0:0:0:1', '2017-05-10 16:26:03'), ('13', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"查看\",\"orderNum\":0,\"parentId\":40,\"parentName\":\"客户经理管理\",\"perms\":\"customerrela:list\",\"type\":2}', '0:0:0:0:0:0:0:1', '2017-05-10 16:26:23'), ('14', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"编辑\",\"orderNum\":0,\"parentId\":40,\"parentName\":\"客户经理管理\",\"perms\":\"customerrela:update\",\"type\":2}', '0:0:0:0:0:0:0:1', '2017-05-10 16:26:44'), ('15', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"上传\",\"orderNum\":0,\"parentId\":40,\"parentName\":\"客户经理管理\",\"perms\":\"chargeoverdue:upload\",\"type\":2}', '0:0:0:0:0:0:0:1', '2017-05-10 16:27:10'), ('16', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"删除\",\"orderNum\":0,\"parentId\":40,\"parentName\":\"客户经理管理\",\"perms\":\"customerrela:delete\",\"type\":2}', '0:0:0:0:0:0:0:1', '2017-05-10 16:27:31'), ('17', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"详细信息\",\"orderNum\":0,\"parentId\":40,\"parentName\":\"客户经理管理\",\"perms\":\"customerrela:info\",\"type\":2}', '0:0:0:0:0:0:0:1', '2017-05-10 16:28:06'), ('18', 'admin', '修改菜单', 'com.jxtelecom.pds.admin.SysMenuController.update()', '{\"icon\":\"fa fa-address-book-o\",\"menuId\":40,\"name\":\"客户经理管理\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"任务管理\",\"type\":1,\"url\":\"task/customerrela.html\"}', '0:0:0:0:0:0:0:1', '2017-05-10 16:31:21'), ('19', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"icon\":\"fa fa-tasks\",\"name\":\"APP任务列表H5\",\"orderNum\":3,\"parentId\":31,\"parentName\":\"任务管理\",\"perms\":\"user:list\",\"type\":1,\"url\":\"charge/chargemobileh5\"}', '0:0:0:0:0:0:0:1', '2017-05-10 17:06:06'), ('20', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"APP任务处理H5\",\"orderNum\":4,\"parentId\":31,\"parentName\":\"任务管理\",\"perms\":\"user:list,user.edit\",\"type\":1,\"url\":\"charge/chargehandleh5\"}', '0:0:0:0:0:0:0:1', '2017-05-10 17:07:25'), ('21', 'admin', '修改菜单', 'com.jxtelecom.pds.admin.SysMenuController.update()', '{\"icon\":\"fa fa-tasks\",\"menuId\":46,\"name\":\"APP任务列表H5\",\"orderNum\":3,\"parentId\":31,\"parentName\":\"任务管理\",\"perms\":\"user:list\",\"type\":1,\"url\":\"charge/chargemobileh5.html\"}', '0:0:0:0:0:0:0:1', '2017-05-10 17:09:42'), ('22', 'admin', '修改菜单', 'com.jxtelecom.pds.admin.SysMenuController.update()', '{\"menuId\":47,\"name\":\"APP任务处理H5\",\"orderNum\":4,\"parentId\":31,\"parentName\":\"任务管理\",\"perms\":\"user:list,user.edit\",\"type\":1,\"url\":\"charge/chargehandleh5.html\"}', '0:0:0:0:0:0:0:1', '2017-05-10 17:10:03'), ('23', 'admin', '保存用户', 'com.jxtelecom.pds.admin.SysUserController.save()', '{\"accountManagerNo\":\"469344\",\"email\":\"\",\"roleIdList\":[2],\"status\":1,\"username\":\"test1\"}', '0:0:0:0:0:0:0:1', '2017-05-10 17:43:53'), ('24', 'admin', '保存用户', 'com.jxtelecom.pds.admin.SysUserController.save()', '{\"accountManagerNo\":\"469344\",\"email\":\"18970026242@189.cn\",\"mobile\":\"18970026242\",\"roleIdList\":[2],\"status\":1,\"username\":\"test1\"}', '0:0:0:0:0:0:0:1', '2017-05-10 17:44:09'), ('25', 'admin', '修改用户', 'com.jxtelecom.pds.admin.SysUserController.update()', '{\"createTime\":1478833871000,\"email\":\"admin@jxtelecom.com\",\"mobile\":\"13612345678\",\"roleIdList\":[1],\"status\":1,\"userId\":1,\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2017-05-10 17:45:04'), ('26', 'admin', '修改菜单', 'com.jxtelecom.pds.admin.SysMenuController.update()', '{\"icon\":\"fa fa-list-ol\",\"menuId\":31,\"name\":\"派单管理\",\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2017-05-10 17:46:59'), ('27', 'admin', '修改用户', 'com.jxtelecom.pds.admin.SysUserController.update()', '{\"accountManagerName\":\"test\",\"accountManagerNo\":\"469344\",\"createTime\":1494409449000,\"createUserId\":1,\"email\":\"18970026242@189.cn\",\"mobile\":\"18970026242\",\"roleIdList\":[2],\"status\":1,\"userId\":2,\"username\":\"test1\"}', '0:0:0:0:0:0:0:1', '2017-05-10 19:26:27'), ('28', 'admin', '修改用户', 'com.jxtelecom.pds.admin.SysUserController.update()', '{\"accountManagerName\":\"test\",\"accountManagerNo\":\"469344\",\"createTime\":1494409449000,\"createUserId\":1,\"email\":\"18970026242@189.cn\",\"mobile\":\"18970026242\",\"roleIdList\":[2],\"status\":1,\"userId\":2,\"username\":\"test1\"}', '0:0:0:0:0:0:0:1', '2017-05-10 19:27:13'), ('29', 'admin', '修改用户', 'com.jxtelecom.pds.admin.SysUserController.update()', '{\"accountManagerName\":\"管理员\",\"accountManagerNo\":\"1\",\"createTime\":1478833871000,\"email\":\"admin@jxtele.com\",\"mobile\":\"13612345678\",\"roleIdList\":[1],\"status\":1,\"userId\":1,\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2017-05-10 19:29:41'), ('30', 'admin', '修改用户', 'com.jxtelecom.pds.admin.SysUserController.update()', '{\"accountManagerName\":\"管理员\",\"accountManagerNo\":\"1\",\"createTime\":1478833871000,\"email\":\"admin@jxtele.com\",\"mobile\":\"13612345678\",\"roleIdList\":[1],\"status\":1,\"userId\":1,\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2017-05-10 19:30:26'), ('31', 'admin', '修改用户', 'com.jxtelecom.pds.admin.SysUserController.update()', '{\"accountManagerName\":\"test1\",\"accountManagerNo\":\"469344\",\"createTime\":1494409449000,\"createUserId\":1,\"email\":\"18970026242@189.cn\",\"mobile\":\"18970026242\",\"roleIdList\":[2],\"status\":1,\"userId\":2,\"username\":\"test1\"}', '0:0:0:0:0:0:0:1', '2017-05-10 19:33:26'), ('32', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"查看\",\"orderNum\":0,\"parentId\":36,\"parentName\":\"欠费任务管理\",\"perms\":\"task:info\",\"type\":2}', '0:0:0:0:0:0:0:1', '2017-05-10 20:41:25'), ('33', 'admin', '修改密码', 'com.jxtelecom.pds.admin.SysUserController.password()', '\"\"', '0:0:0:0:0:0:0:1', '2017-05-10 22:23:15'), ('34', 'admin', '修改角色', 'com.jxtelecom.pds.admin.SysRoleController.update()', '{\"createTime\":1494253584000,\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,48,37,38,39,46],\"roleId\":3,\"roleName\":\"业务主管\"}', '0:0:0:0:0:0:0:1', '2017-05-11 09:23:52'), ('35', 'admin', '修改角色', 'com.jxtelecom.pds.admin.SysRoleController.update()', '{\"createTime\":1494253571000,\"createUserId\":1,\"menuIdList\":[31,46],\"roleId\":2,\"roleName\":\"客户经理\"}', '0:0:0:0:0:0:0:1', '2017-05-11 09:24:37'), ('36', 'admin', '修改角色', 'com.jxtelecom.pds.admin.SysRoleController.update()', '{\"createTime\":1494253584000,\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,48,37,38,39,40,41,42,43,44,45,46],\"roleId\":3,\"roleName\":\"业务主管\"}', '0:0:0:0:0:0:0:1', '2017-05-11 09:24:50'), ('37', 'admin', '修改用户', 'com.jxtelecom.pds.admin.SysUserController.update()', '{\"accountManagerName\":\"test1\",\"accountManagerNo\":\"469344\",\"createTime\":1494409449000,\"createUserId\":1,\"email\":\"18970026242@189.cn\",\"mobile\":\"18970026242\",\"roleIdList\":[2],\"status\":1,\"userId\":2,\"username\":\"test1\"}', '0:0:0:0:0:0:0:1', '2017-05-11 11:57:17'), ('38', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"查看\",\"open\":true,\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"task:list\",\"type\":2}', '0:0:0:0:0:0:0:1', '2017-05-11 11:58:58'), ('39', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"查看\",\"open\":true,\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"task:list\",\"type\":2}', '0:0:0:0:0:0:0:1', '2017-05-11 11:59:03'), ('40', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"查看\",\"open\":true,\"orderNum\":0,\"parentId\":46,\"parentName\":\"APP任务列表H5\",\"perms\":\"task:list\",\"type\":2}', '0:0:0:0:0:0:0:1', '2017-05-11 11:59:08'), ('41', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"信息\",\"open\":true,\"orderNum\":0,\"parentId\":46,\"parentName\":\"APP任务列表H5\",\"perms\":\"task:info\",\"type\":2}', '0:0:0:0:0:0:0:1', '2017-05-11 11:59:27'), ('42', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"保存\",\"open\":true,\"orderNum\":0,\"parentId\":46,\"parentName\":\"APP任务列表H5\",\"perms\":\"task:save\",\"type\":2}', '0:0:0:0:0:0:0:1', '2017-05-11 11:59:46'), ('43', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"保存\",\"open\":true,\"orderNum\":0,\"parentId\":46,\"parentName\":\"APP任务列表H5\",\"perms\":\"task:update\",\"type\":2}', '0:0:0:0:0:0:0:1', '2017-05-11 12:00:04'), ('44', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"删除\",\"open\":true,\"orderNum\":0,\"parentId\":46,\"parentName\":\"APP任务列表H5\",\"perms\":\"task:delete\",\"type\":2}', '0:0:0:0:0:0:0:1', '2017-05-11 12:00:21'), ('45', 'admin', '修改角色', 'com.jxtelecom.pds.admin.SysRoleController.update()', '{\"createTime\":1494253571000,\"createUserId\":1,\"menuIdList\":[31,46,49,50,51,52,53],\"roleId\":2,\"roleName\":\"客户经理\"}', '0:0:0:0:0:0:0:1', '2017-05-11 12:01:22'), ('46', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[1]', '0:0:0:0:0:0:0:1', '2017-05-11 13:16:49'), ('47', 'admin', '保存定时任务', 'com.jxtelecom.pds.admin.ScheduleJobController.save()', '{\"beanName\":\"testTask\",\"cronExpression\":\"0 0 12 * * ?\",\"methodName\":\"test\",\"remark\":\"测试\"}', '0:0:0:0:0:0:0:1', '2017-05-11 13:23:51'), ('48', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[1]', '0:0:0:0:0:0:0:1', '2017-05-11 13:24:02'), ('49', 'admin', '修改定时任务', 'com.jxtelecom.pds.admin.ScheduleJobController.update()', '{\"beanName\":\"testTask\",\"createTime\":1494480232000,\"cronExpression\":\"0 0 12 * * ?\",\"jobId\":1,\"methodName\":\"test2\",\"remark\":\"测试\",\"status\":0}', '0:0:0:0:0:0:0:1', '2017-05-11 13:24:28'), ('50', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[1]', '0:0:0:0:0:0:0:1', '2017-05-11 13:24:37'), ('51', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"统计报表\",\"open\":true,\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2017-05-11 13:50:40'), ('52', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"客户经理排名\",\"open\":true,\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"task/accountmanagerrank.html\"}', '0:0:0:0:0:0:0:1', '2017-05-11 13:51:18'), ('53', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"客户经理排名\",\"open\":true,\"orderNum\":0,\"parentId\":54,\"parentName\":\"统计报表\",\"type\":1,\"url\":\"task/accountmanagerrank.html\"}', '0:0:0:0:0:0:0:1', '2017-05-11 13:51:30'), ('54', 'admin', '修改菜单', 'com.jxtelecom.pds.admin.SysMenuController.update()', '{\"menuId\":54,\"name\":\"统计报表\",\"open\":true,\"orderNum\":3,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2017-05-11 13:52:16'), ('55', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[1]', '0:0:0:0:0:0:0:1', '2017-05-11 13:53:19'), ('56', 'admin', '删除菜单', 'com.jxtelecom.pds.admin.SysMenuController.delete()', '[55]', '0:0:0:0:0:0:0:1', '2017-05-11 13:54:42'), ('57', 'admin', '保存菜单', 'com.jxtelecom.pds.admin.SysMenuController.save()', '{\"name\":\"查看\",\"open\":true,\"orderNum\":0,\"parentId\":56,\"parentName\":\"客户经理排名\",\"perms\":\"accountmanagerrank:list\",\"type\":2}', '0:0:0:0:0:0:0:1', '2017-05-11 13:55:47'), ('58', 'admin', '保存定时任务', 'com.jxtelecom.pds.admin.ScheduleJobController.save()', '{\"beanName\":\"generateRankTask\",\"cronExpression\":\"0 0 12 * * ?\",\"methodName\":\"generate\",\"remark\":\"客户经理排名定时任务\"}', '0:0:0:0:0:0:0:1', '2017-05-11 14:25:21'), ('59', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '0:0:0:0:0:0:0:1', '2017-05-11 14:25:27'), ('60', 'admin', '修改菜单', 'com.jxtelecom.pds.admin.SysMenuController.update()', '{\"icon\":\"fa fa-bar-chart\",\"menuId\":54,\"name\":\"统计报表\",\"open\":true,\"orderNum\":3,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '0:0:0:0:0:0:0:1', '2017-05-11 15:04:24'), ('61', 'admin', '删除菜单', 'com.jxtelecom.pds.admin.SysMenuController.delete()', '[47]', '58.40.124.211', '2017-05-11 15:25:00'), ('62', 'admin', '删除菜单', 'com.jxtelecom.pds.admin.SysMenuController.delete()', '[47]', '58.40.124.211', '2017-05-11 15:25:49'), ('63', 'admin', '修改角色', 'com.jxtelecom.pds.admin.SysRoleController.update()', '{\"createTime\":1494253584000,\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,48,37,38,39,40,41,42,43,44,45],\"roleId\":3,\"roleName\":\"业务主管\"}', '58.40.124.211', '2017-05-11 15:27:03'), ('64', 'test1', '修改密码', 'com.jxtelecom.pds.admin.SysUserController.password()', '\"\"', '58.40.124.211', '2017-05-11 15:34:02'), ('65', 'test1', '修改密码', 'com.jxtelecom.pds.admin.SysUserController.password()', '\"\"', '58.40.124.211', '2017-05-11 15:34:12'), ('66', 'admin', '保存用户', 'com.jxtelecom.pds.admin.SysUserController.save()', '{\"accountManagerName\":\"李思\",\"accountManagerNo\":\"469888\",\"email\":\"200000@qq.com\",\"mobile\":\"18888888888\",\"roleIdList\":[2],\"status\":1,\"username\":\"test2\"}', '58.40.124.211', '2017-05-11 15:35:33'), ('67', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '58.40.124.211', '2017-05-11 16:23:19'), ('68', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '58.40.124.211', '2017-05-11 16:23:22'), ('69', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '58.40.124.211', '2017-05-11 16:23:26'), ('70', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '0:0:0:0:0:0:0:1', '2017-05-11 16:23:45'), ('71', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '0:0:0:0:0:0:0:1', '2017-05-11 16:23:48'), ('72', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '0:0:0:0:0:0:0:1', '2017-05-11 16:24:33'), ('73', 'admin', '修改用户', 'com.jxtelecom.pds.admin.SysUserController.update()', '{\"accountManagerName\":\"张飒\",\"accountManagerNo\":\"469344\",\"createTime\":1494409449000,\"createUserId\":1,\"email\":\"18970026242@189.cn\",\"mobile\":\"18970026242\",\"roleIdList\":[2],\"status\":1,\"userId\":2,\"username\":\"test1\"}', '0:0:0:0:0:0:0:1', '2017-05-11 16:36:49'), ('74', 'admin', '暂停定时任务', 'com.jxtelecom.pds.admin.ScheduleJobController.pause()', '[1]', '0:0:0:0:0:0:0:1', '2017-05-11 16:42:40'), ('75', 'admin', '暂停定时任务', 'com.jxtelecom.pds.admin.ScheduleJobController.pause()', '[2]', '0:0:0:0:0:0:0:1', '2017-05-11 16:42:44'), ('76', 'admin', '删除定时任务', 'com.jxtelecom.pds.admin.ScheduleJobController.delete()', '[1]', '0:0:0:0:0:0:0:1', '2017-05-11 16:42:49'), ('77', 'admin', '暂停定时任务', 'com.jxtelecom.pds.admin.ScheduleJobController.pause()', '[2]', '0:0:0:0:0:0:0:1', '2017-05-11 16:42:53'), ('78', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '0:0:0:0:0:0:0:1', '2017-05-11 16:43:23'), ('79', 'admin', '恢复定时任务', 'com.jxtelecom.pds.admin.ScheduleJobController.resume()', '[2]', '0:0:0:0:0:0:0:1', '2017-05-11 16:43:41'), ('80', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '0:0:0:0:0:0:0:1', '2017-05-11 16:43:48'), ('81', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '0:0:0:0:0:0:0:1', '2017-05-11 16:45:32'), ('82', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '0:0:0:0:0:0:0:1', '2017-05-11 17:02:33'), ('83', 'admin', '保存用户', 'com.jxtelecom.pds.admin.SysUserController.save()', '{\"accountManagerName\":\"张三\",\"accountManagerNo\":\"469887\",\"email\":\"2000@qq.com\",\"mobile\":\"18888888888\",\"roleIdList\":[2],\"status\":1,\"username\":\"test3\"}', '0:0:0:0:0:0:0:1', '2017-05-11 18:59:16'), ('84', 'admin', '保存用户', 'com.jxtelecom.pds.admin.SysUserController.save()', '{\"accountManagerName\":\"王五\",\"accountManagerNo\":\"469886\",\"email\":\"1000@qq.com\",\"mobile\":\"188888888888\",\"roleIdList\":[2],\"status\":1,\"username\":\"test4\"}', '0:0:0:0:0:0:0:1', '2017-05-11 18:59:51'), ('85', 'admin', '保存用户', 'com.jxtelecom.pds.admin.SysUserController.save()', '{\"accountManagerName\":\"毛六\",\"accountManagerNo\":\"469885\",\"email\":\"1000@qq.com\",\"mobile\":\"188888888888\",\"roleIdList\":[2],\"status\":1,\"username\":\"test5\"}', '0:0:0:0:0:0:0:1', '2017-05-11 19:00:24'), ('86', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '0:0:0:0:0:0:0:1', '2017-05-11 20:25:08'), ('87', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '0:0:0:0:0:0:0:1', '2017-05-11 21:14:22'), ('88', 'admin', '修改用户', 'com.jxtelecom.pds.admin.SysUserController.update()', '{\"accountManagerName\":\"张飒\",\"accountManagerNo\":\"469344\",\"createTime\":1494409449000,\"createUserId\":1,\"email\":\"18970026242@189.cn\",\"mobile\":\"18970026242\",\"roleIdList\":[2],\"status\":1,\"userId\":2,\"username\":\"test1\"}', '0:0:0:0:0:0:0:1', '2017-05-11 21:18:15'), ('89', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '0:0:0:0:0:0:0:1', '2017-05-11 21:39:10'), ('90', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '0:0:0:0:0:0:0:1', '2017-05-11 21:39:31'), ('91', 'admin', '删除用户', 'com.jxtelecom.pds.admin.SysUserController.delete()', '[6,5,4,3,2]', '58.40.124.211', '2017-05-11 21:54:14'), ('92', 'admin', '删除用户', 'com.jxtelecom.pds.admin.SysUserController.delete()', '[6]', '58.40.124.211', '2017-05-11 21:54:23'), ('93', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '58.40.124.211', '2017-05-11 23:04:11'), ('94', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '0:0:0:0:0:0:0:1', '2017-05-12 11:24:57'), ('95', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '58.40.124.211', '2017-05-12 11:29:21'), ('96', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '58.40.124.211', '2017-05-12 13:39:32'), ('97', 'admin', '立即执行任务', 'com.jxtelecom.pds.admin.ScheduleJobController.run()', '[2]', '0:0:0:0:0:0:0:1', '2017-05-12 14:00:10');
COMMIT;

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
--  Records of `sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '0'), ('2', '1', '用户列表', 'sys/user.html', null, '1', 'fa fa-user', '1'), ('3', '1', '角色管理', 'sys/role.html', null, '1', 'fa fa-user-secret', '2'), ('4', '1', '菜单管理', 'sys/menu.html', null, '1', 'fa fa-th-list', '3'), ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4'), ('6', '1', '定时任务', 'sys/schedule.html', null, '1', 'fa fa-tasks', '5'), ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0'), ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0'), ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0'), ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0'), ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0'), ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0'), ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0'), ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0'), ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0'), ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0'), ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0'), ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0'), ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0'), ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0'), ('21', '3', '修改', null, 'sys:role:update,sys:menu:perms', '2', null, '0'), ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0'), ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0'), ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0'), ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0'), ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0'), ('27', '1', '参数管理', 'sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6'), ('28', '1', '代码生成器', 'sys/generator.html', 'sys:generator:list,sys:generator:code', '1', 'fa fa-rocket', '8'), ('29', '1', '系统日志', 'sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7'), ('30', '1', '文件上传', 'sys/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6'), ('31', '0', '派单管理', null, null, '0', 'fa fa-list-ol', '2'), ('32', '31', '欠费用户管理', 'charge/chargeoverdue.html', 'chargeoverdue:list', '1', null, '0'), ('33', '32', '新增', null, 'chargeoverdue:save', '2', null, '0'), ('34', '32', '修改', null, 'chargeoverdue:update', '2', null, '0'), ('35', '32', '删除', null, 'chargeoverdue:delete', '2', null, '0'), ('36', '31', '欠费任务管理', 'task/task.html', 'task:list', '1', 'fa fa-list-ol', '0'), ('37', '36', '新增', null, 'task:save', '2', null, '6'), ('38', '36', '修改', null, 'task:update', '2', null, '6'), ('39', '36', '删除', null, 'task:delete', '2', null, '6'), ('40', '31', '客户经理管理', 'task/customerrela.html', null, '1', 'fa fa-address-book-o', '0'), ('41', '40', '查看', null, 'customerrela:list', '2', null, '0'), ('42', '40', '编辑', null, 'customerrela:update', '2', null, '0'), ('43', '40', '上传', null, 'chargeoverdue:upload', '2', null, '0'), ('44', '40', '删除', null, 'customerrela:delete', '2', null, '0'), ('45', '40', '详细信息', null, 'customerrela:info', '2', null, '0'), ('46', '31', 'APP任务列表H5', 'charge/chargemobileh5.html', 'user:list', '1', 'fa fa-tasks', '3'), ('48', '36', '查看', null, 'task:info', '2', null, '0'), ('49', '46', '查看', null, 'task:list', '2', null, '0'), ('50', '46', '信息', null, 'task:info', '2', null, '0'), ('51', '46', '保存', null, 'task:save', '2', null, '0'), ('52', '46', '保存', null, 'task:update', '2', null, '0'), ('53', '46', '删除', null, 'task:delete', '2', null, '0'), ('54', '0', '统计报表', null, null, '0', 'fa fa-bar-chart', '1'), ('56', '54', '客户经理排名', 'task/accountmanagerrank.html', null, '1', null, '0'), ('57', '56', '查看', null, 'accountmanagerrank:list', '2', null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_oss`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
--  Records of `sys_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1', '管理员', null, '1', '2017-04-29 10:28:02'), ('2', '客户经理', null, '1', '2017-05-08 22:26:11'), ('3', '业务主管', null, '1', '2017-05-08 22:26:24');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
--  Records of `sys_role_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES ('1', '1', '1'), ('2', '1', '2'), ('3', '1', '15'), ('4', '1', '16'), ('5', '1', '17'), ('6', '1', '18'), ('7', '1', '3'), ('8', '1', '19'), ('9', '1', '20'), ('10', '1', '21'), ('11', '1', '22'), ('12', '1', '4'), ('13', '1', '23'), ('14', '1', '24'), ('15', '1', '25'), ('16', '1', '26'), ('17', '1', '5'), ('18', '1', '6'), ('19', '1', '7'), ('20', '1', '8'), ('21', '1', '9'), ('22', '1', '10'), ('23', '1', '11'), ('24', '1', '12'), ('25', '1', '13'), ('26', '1', '14'), ('27', '1', '27'), ('28', '1', '30'), ('29', '1', '29'), ('30', '1', '28'), ('61', '2', '31'), ('62', '2', '46'), ('63', '2', '49'), ('64', '2', '50'), ('65', '2', '51'), ('66', '2', '52'), ('67', '2', '53'), ('68', '3', '31'), ('69', '3', '32'), ('70', '3', '33'), ('71', '3', '34'), ('72', '3', '35'), ('73', '3', '36'), ('74', '3', '48'), ('75', '3', '37'), ('76', '3', '38'), ('77', '3', '39'), ('78', '3', '40'), ('79', '3', '41'), ('80', '3', '42'), ('81', '3', '43'), ('82', '3', '44'), ('83', '3', '45');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `account_manager_no` varchar(10) DEFAULT NULL,
  `account_manager_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin@jxtele.com', '13612345678', '1', null, '2016-11-11 11:11:11', null, null), ('2', 'hjy10001', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '18970026242@189.cn', '18970908511', '1', '1', '2017-05-10 17:44:09', '10001', '胡精英'), ('3', 'xs10002', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '200000@qq.com', '18970908524', '1', '1', '2017-05-11 15:35:33', '10002', '谢珊'), ('4', 'tzj10003', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2000@qq.com', '18970908525', '1', '1', '2017-05-11 18:59:16', '10003', '谭智俊'), ('5', 'yll10004', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '1000@qq.com', '18970908526', '1', '1', '2017-05-11 18:59:51', '10004', '晏丽玲'), ('6', 'glf10005', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '1000@qq.com', '188888888888', '1', '1', '2017-05-11 19:00:24', '10005', '郭灵发');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
--  Records of `sys_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('5', '1', '1'), ('8', '3', '2'), ('10', '4', '2'), ('11', '5', '2'), ('12', '6', '2'), ('13', '2', '2');
COMMIT;

-- ----------------------------
--  Table structure for `tb_account_manager_rank`
-- ----------------------------
DROP TABLE IF EXISTS `tb_account_manager_rank`;
CREATE TABLE `tb_account_manager_rank` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_manager_id` bigint(20) DEFAULT NULL,
  `account_manager_name` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `task_num` int(11) DEFAULT NULL,
  `task_success_num` int(11) DEFAULT NULL,
  `task_success_ratio` float DEFAULT NULL,
  `task_fail_num` int(11) DEFAULT NULL,
  `task_fail_ratio` float DEFAULT NULL,
  `task_incomplete_num` int(11) DEFAULT NULL,
  `task_incomplete_ratio` float DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `account_day` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='客户经理排名表';

-- ----------------------------
--  Records of `tb_account_manager_rank`
-- ----------------------------
BEGIN;
INSERT INTO `tb_account_manager_rank` VALUES ('91', '2', '胡精英', '宜春', '9', '2', '0.2222', '1', '0.1111', '6', '0.6667', '2017-05-12 14:00:11', '2017-05-12'), ('92', '3', '谢珊', '抚州', '9', '1', '0.1111', '0', '0', '8', '0.8889', '2017-05-12 14:00:11', '2017-05-12'), ('93', '4', '谭智俊', '九江', '8', '0', '0', '0', '0', '8', '1', '2017-05-12 14:00:11', '2017-05-12'), ('94', '5', '晏丽玲', '上饶', '8', '0', '0', '0', '0', '8', '1', '2017-05-12 14:00:11', '2017-05-12'), ('95', '6', '郭灵发', '南昌', '9', '0', '0', '0', '0', '9', '1', '2017-05-12 14:00:11', '2017-05-12');
COMMIT;

-- ----------------------------
--  Table structure for `tb_charge_overdue`
-- ----------------------------
DROP TABLE IF EXISTS `tb_charge_overdue`;
CREATE TABLE `tb_charge_overdue` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `user_code` varchar(15) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `account_month` varchar(10) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=517 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tb_charge_overdue`
-- ----------------------------
BEGIN;
INSERT INTO `tb_charge_overdue` VALUES ('474', '测试', '18912341234', '江西南昌', '南昌', '1200', '201704', '2017-05-12 13:55:03', null), ('475', '何冰清', '13320012111', '南昌市青山', '南昌', '20', '201704', '2017-05-12 13:55:25', '1'), ('476', '袁小青', '13330109111', '南昌市西湖', '南昌', '20', '201704', '2017-05-12 13:55:26', '1'), ('477', '刘烁', '13330075111', '南昌市西湖', '南昌', '20', '201704', '2017-05-12 13:55:26', '1'), ('478', '丁伟', '13330080111', '南昌市青山', '南昌', '20', '201704', '2017-05-12 13:55:26', '1'), ('479', '杨洲', '18970935111', '南昌市东湖', '南昌', '20', '201704', '2017-05-12 13:55:26', '1'), ('480', '陈嫚', '18079136111', '南昌市西湖', '南昌', '20', '201704', '2017-05-12 13:55:26', '1'), ('481', '赵硕', '18970036111', '道418号', '南昌', '20', '201704', '2017-05-12 13:55:26', '1'), ('482', '邹蕙冰', '18070288111', '东湖', '南昌', '20', '201704', '2017-05-12 13:55:26', '1'), ('483', '杨鸿艺', '18070125111', '路轴承厂宿', '南昌', '20', '201704', '2017-05-12 13:55:26', '1'), ('484', '冯光', '18970199111', '抚州市临川', '九江', '30', '201704', '2017-05-12 13:55:26', '1'), ('485', '马永杰', '18970158111', '171号2', '九江', '30', '201704', '2017-05-12 13:55:27', '1'), ('486', '魏之川', '18007010111', '青山', '九江', '30', '201704', '2017-05-12 13:55:27', '1'), ('487', '王超然', '18970179111', '西湖', '九江', '30', '201704', '2017-05-12 13:55:27', '1'), ('488', '李高子', '18970166111', '路339号', '九江', '30', '201704', '2017-05-12 13:55:27', '1'), ('489', '石伟', '13307017111', '大道666', '九江', '30', '201704', '2017-05-12 13:55:27', '1'), ('490', '郭可立', '13340101111', '路74号1', '九江', '30', '201704', '2017-05-12 13:55:27', '1'), ('491', '何杰锋', '13307013111', '南昌市东湖', '九江', '30', '201704', '2017-05-12 13:55:27', '1'), ('492', '姜愫馨', '13317906111', '南昌市青山', '上饶', '10', '201704', '2017-05-12 13:55:27', '1'), ('493', '杨洋', '17779017111', '区14栋4', '上饶', '10', '201704', '2017-05-12 13:55:27', '1'), ('494', '任龙洋', '18079076111', '359号附', '上饶', '10', '201704', '2017-05-12 13:55:28', '1'), ('495', '李欣', '18007904111', '青山', '上饶', '10', '201704', '2017-05-12 13:55:28', '1'), ('496', '刘晓琳', '18979007111', '莲塘', '上饶', '10', '201704', '2017-05-12 13:55:28', '1'), ('497', '王宇', '13397906111', '区43栋3', '上饶', '10', '201704', '2017-05-12 13:55:28', '1'), ('498', '苏保涛', '13361702111', '路69号7', '上饶', '10', '201704', '2017-05-12 13:55:28', '1'), ('499', '蒋苇杭', '13397905111', '317号3', '上饶', '10', '201704', '2017-05-12 13:55:28', '1'), ('500', '万胜国', '18179866111', '大道412', '抚州', '10', '201704', '2017-05-12 13:55:28', '1'), ('501', '安幸', '18079862111', '大道788', '抚州', '40', '201704', '2017-05-12 13:55:28', '1'), ('502', '淡恒', '18079806111', '南昌市西湖', '抚州', '40', '201704', '2017-05-12 13:55:28', '1'), ('503', '李祥', '15307983111', '15号', '抚州', '40', '201704', '2017-05-12 13:55:29', '1'), ('504', '陈菲', '13319378111', '村28栋3', '抚州', '40', '201704', '2017-05-12 13:55:29', '1'), ('505', '刘佳渝', '13319381111', '南昌市青山', '抚州', '40', '201704', '2017-05-12 13:55:29', '1'), ('506', '苑景', '18979878111', '路25号1', '抚州', '40', '201704', '2017-05-12 13:55:29', '1'), ('507', '马茹', '18979807111', '业园区佛塔', '抚州', '40', '201704', '2017-05-12 13:55:29', '1'), ('508', '袁开智', '13397986111', '126号龙', '抚州', '40', '201704', '2017-05-12 13:55:29', '1'), ('509', '赵虎', '13320046111', '安义县石鼻', '宜春', '50', '201704', '2017-05-12 13:55:29', '1'), ('510', '魏随', '13340199111', '路287号', '宜春', '50', '201704', '2017-05-12 13:55:29', '1'), ('511', '吕晓霞', '13307042111', '宅区4栋2', '宜春', '50', '201704', '2017-05-12 13:55:29', '1'), ('512', '贺钟慧', '13307947111', '路1号2号', '宜春', '50', '201704', '2017-05-12 13:55:29', '1'), ('513', '李扬', '13367043111', '路339号', '宜春', '50', '201704', '2017-05-12 13:55:30', '1'), ('514', '查理', '15387882111', '南昌市东湖', '宜春', '50', '201704', '2017-05-12 13:55:30', '1'), ('515', '李文龙', '18907948111', '68号8栋', '宜春', '50', '201704', '2017-05-12 13:55:30', '1'), ('516', '张家铭', '13387948111', '巷43号', '宜春', '50', '201704', '2017-05-12 13:55:30', '1');
COMMIT;

-- ----------------------------
--  Table structure for `tb_customer_rela`
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_rela`;
CREATE TABLE `tb_customer_rela` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `cust_telnum` varchar(11) DEFAULT NULL COMMENT '客户号码',
  `cust_name` varchar(20) DEFAULT NULL COMMENT '客户姓名',
  `city` varchar(20) DEFAULT NULL COMMENT '地市',
  `account_manager_no` varchar(10) DEFAULT NULL COMMENT '客户经理工号',
  `account_manager_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=508 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tb_customer_rela`
-- ----------------------------
BEGIN;
INSERT INTO `tb_customer_rela` VALUES ('466', '13320012111', '何冰清', '南昌', '10005', '郭灵发'), ('467', '13330109111', '袁小青', '南昌', '10005', '郭灵发'), ('468', '13330075111', '刘烁', '南昌', '10005', '郭灵发'), ('469', '13330080111', '丁伟', '南昌', '10005', '郭灵发'), ('470', '18970935111', '杨洲', '南昌', '10005', '郭灵发'), ('471', '18079136111', '陈嫚', '南昌', '10005', '郭灵发'), ('472', '18970036111', '赵硕', '南昌', '10005', '郭灵发'), ('473', '18070288111', '邹蕙冰', '南昌', '10005', '郭灵发'), ('474', '18070125111', '杨鸿艺', '南昌', '10005', '郭灵发'), ('475', '18970199111', '冯光', '九江', '10003', '谭智俊'), ('476', '18970158111', '马永杰', '九江', '10003', '谭智俊'), ('477', '18007010111', '魏之川', '九江', '10003', '谭智俊'), ('478', '18970179111', '王超然', '九江', '10003', '谭智俊'), ('479', '18970166111', '李高子', '九江', '10003', '谭智俊'), ('480', '13307017111', '石伟', '九江', '10003', '谭智俊'), ('481', '13340101111', '郭可立', '九江', '10003', '谭智俊'), ('482', '13307013111', '何杰锋', '九江', '10003', '谭智俊'), ('483', '13317906111', '姜愫馨', '上饶', '10004', '晏丽玲'), ('484', '17779017111', '杨洋', '上饶', '10004', '晏丽玲'), ('485', '18079076111', '任龙洋', '上饶', '10004', '晏丽玲'), ('486', '18007904111', '李欣', '上饶', '10004', '晏丽玲'), ('487', '18979007111', '刘晓琳', '上饶', '10004', '晏丽玲'), ('488', '13397906111', '王宇', '上饶', '10004', '晏丽玲'), ('489', '13361702111', '苏保涛', '上饶', '10004', '晏丽玲'), ('490', '13397905111', '蒋苇杭', '上饶', '10004', '晏丽玲'), ('491', '18179866111', '万胜国', '抚州', '10002', '谢珊'), ('492', '18079862111', '安幸', '抚州', '10002', '谢珊'), ('493', '18079806111', '淡恒', '抚州', '10002', '谢珊'), ('494', '15307983111', '李祥', '抚州', '10002', '谢珊'), ('495', '13319378111', '陈菲', '抚州', '10002', '谢珊'), ('496', '13319381111', '刘佳渝', '抚州', '10002', '谢珊'), ('497', '18979878111', '苑景', '抚州', '10002', '谢珊'), ('498', '18979807111', '马茹', '抚州', '10002', '谢珊'), ('499', '13397986111', '袁开智', '抚州', '10002', '谢珊'), ('500', '13320046111', '赵虎', '宜春', '10001', '胡精英'), ('501', '13340199111', '魏随', '宜春', '10001', '胡精英'), ('502', '13307042111', '吕晓霞', '宜春', '10001', '胡精英'), ('503', '13307947111', '贺钟慧', '宜春', '10001', '胡精英'), ('504', '13367043111', '李扬', '宜春', '10001', '胡精英'), ('505', '15387882111', '查理', '宜春', '10001', '胡精英'), ('506', '18907948111', '李文龙', '宜春', '10001', '胡精英'), ('507', '13387948111', '张家铭', '宜春', '10001', '胡精英');
COMMIT;

-- ----------------------------
--  Table structure for `tb_task`
-- ----------------------------
DROP TABLE IF EXISTS `tb_task`;
CREATE TABLE `tb_task` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `create_user_id` bigint(20) DEFAULT NULL,
  `charge_id` bigint(20) DEFAULT NULL,
  `result` varchar(50) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `account_manager_no` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=515 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tb_task`
-- ----------------------------
BEGIN;
INSERT INTO `tb_task` VALUES ('472', '2017-05-12 13:55:03', '1', '474', '0', null, '10001'), ('473', '2017-05-12 13:55:26', '1', '475', '0', null, '10005'), ('474', '2017-05-12 13:55:26', '1', '476', '0', null, '10005'), ('475', '2017-05-12 13:55:26', '1', '477', '0', null, '10005'), ('476', '2017-05-12 13:55:26', '1', '478', '0', null, '10005'), ('477', '2017-05-12 13:55:26', '1', '479', '0', null, '10005'), ('478', '2017-05-12 13:55:26', '1', '480', '0', null, '10005'), ('479', '2017-05-12 13:55:26', '1', '481', '0', null, '10005'), ('480', '2017-05-12 13:55:26', '1', '482', '0', null, '10005'), ('481', '2017-05-12 13:55:26', '1', '483', '0', null, '10005'), ('482', '2017-05-12 13:55:27', '1', '484', '0', null, '10003'), ('483', '2017-05-12 13:55:27', '1', '485', '0', null, '10003'), ('484', '2017-05-12 13:55:27', '1', '486', '0', null, '10003'), ('485', '2017-05-12 13:55:27', '1', '487', '0', null, '10003'), ('486', '2017-05-12 13:55:27', '1', '488', '0', null, '10003'), ('487', '2017-05-12 13:55:27', '1', '489', '0', null, '10003'), ('488', '2017-05-12 13:55:27', '1', '490', '0', null, '10003'), ('489', '2017-05-12 13:55:27', '1', '491', '0', null, '10003'), ('490', '2017-05-12 13:55:27', '1', '492', '0', null, '10004'), ('491', '2017-05-12 13:55:28', '1', '493', '0', null, '10004'), ('492', '2017-05-12 13:55:28', '1', '494', '0', null, '10004'), ('493', '2017-05-12 13:55:28', '1', '495', '0', null, '10004'), ('494', '2017-05-12 13:55:28', '1', '496', '0', null, '10004'), ('495', '2017-05-12 13:55:28', '1', '497', '0', null, '10004'), ('496', '2017-05-12 13:55:28', '1', '498', '0', null, '10004'), ('497', '2017-05-12 13:55:28', '1', '499', '0', null, '10004'), ('498', '2017-05-12 13:55:28', '1', '500', '0', null, '10002'), ('499', '2017-05-12 13:55:28', '1', '501', '0', null, '10002'), ('500', '2017-05-12 13:55:28', '1', '502', '0', null, '10002'), ('501', '2017-05-12 13:55:29', '1', '503', '0', null, '10002'), ('502', '2017-05-12 13:55:29', '1', '504', '0', null, '10002'), ('503', '2017-05-12 13:55:29', '1', '505', '0', null, '10002'), ('504', '2017-05-12 13:55:29', '1', '506', '0', null, '10002'), ('505', '2017-05-12 13:55:29', '1', '507', '1', '111', '10002'), ('506', '2017-05-12 13:55:29', '1', '508', '0', null, '10002'), ('507', '2017-05-12 13:55:29', '1', '509', '0', null, '10001'), ('508', '2017-05-12 13:55:29', '1', '510', '1', '', '10001'), ('509', '2017-05-12 13:55:29', '1', '511', '0', null, '10001'), ('510', '2017-05-12 13:55:30', '1', '512', '2', 'ooo', '10001'), ('511', '2017-05-12 13:55:30', '1', '513', '0', null, '10001'), ('512', '2017-05-12 13:55:30', '1', '514', '1', 'ok', '10001'), ('513', '2017-05-12 13:55:30', '1', '515', '0', null, '10001'), ('514', '2017-05-12 13:55:30', '1', '516', '3', 'test', '10001');
COMMIT;

-- ----------------------------
--  Table structure for `tb_task_log`
-- ----------------------------
DROP TABLE IF EXISTS `tb_task_log`;
CREATE TABLE `tb_task_log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) DEFAULT NULL,
  `task_date` datetime DEFAULT NULL,
  `result` varchar(50) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tb_token`
-- ----------------------------
DROP TABLE IF EXISTS `tb_token`;
CREATE TABLE `tb_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户Token';

-- ----------------------------
--  Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
--  Records of `tb_user`
-- ----------------------------
BEGIN;
INSERT INTO `tb_user` VALUES ('1', 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
COMMIT;

-- ----------------------------
--  View structure for `view_account_manager_rank`
-- ----------------------------
DROP VIEW IF EXISTS `view_account_manager_rank`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_account_manager_rank` AS select `t`.`ID` AS `ID`,`t`.`account_manager_id` AS `account_manager_id`,`t`.`account_manager_name` AS `account_manager_name`,`t`.`city` AS `city`,`t`.`task_num` AS `task_num`,`t`.`task_success_num` AS `task_success_num`,`t`.`task_success_ratio` AS `task_success_ratio`,`t`.`task_fail_num` AS `task_fail_num`,`t`.`task_fail_ratio` AS `task_fail_ratio`,`t`.`task_incomplete_num` AS `task_incomplete_num`,`t`.`task_incomplete_ratio` AS `task_incomplete_ratio`,`t`.`create_date` AS `create_date`,`t`.`account_day` AS `account_day`,(select (count(`s`.`task_success_ratio`) + 1) from `tb_account_manager_rank` `s` where (`s`.`task_success_ratio` > `t`.`task_success_ratio`)) AS `rank` from `tb_account_manager_rank` `t` order by `t`.`task_success_num` desc;

SET FOREIGN_KEY_CHECKS = 1;
