-- MySQL dump 10.13  Distrib 5.6.20, for Linux (x86_64)
--
-- Host: 192.168.30.81    Database: gatv_sys
-- ------------------------------------------------------
-- Server version	5.6.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sys_action`
--

DROP TABLE IF EXISTS `sys_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_action`
--

LOCK TABLES `sys_action` WRITE;
/*!40000 ALTER TABLE `sys_action` DISABLE KEYS */;
INSERT INTO `sys_action` VALUES (1,'user_login','用户登录','积分+10，每天一次','table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;','[user|get_nickname]在[time|time_format]登录了后台',1,1,1387181220),(2,'add_article','发布文章','积分+5，每天上限5次','table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5','',2,0,1380173180),(3,'review','评论','评论积分+1，无限制','table:member|field:score|condition:uid={$self}|rule:score+1','',2,1,1383285646),(4,'add_document','发表文档','积分+10，每天上限5次','table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5','[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。',2,0,1386139726),(5,'add_document_topic','发表讨论','积分+5，每天上限10次','table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10','',2,0,1383285551),(6,'update_config','更新配置','新增或修改或删除配置','','',1,1,1383294988),(7,'update_model','更新模型','新增或修改模型','','',1,1,1383295057),(8,'update_attribute','更新属性','新增或更新或删除属性','','',1,1,1383295963),(9,'update_channel','更新导航','新增或修改或删除导航','','',1,1,1383296301),(10,'update_menu','更新菜单','新增或修改或删除菜单','','',1,1,1383296392),(11,'update_category','更新分类','新增或修改或删除分类','','',1,1,1383296765);
/*!40000 ALTER TABLE `sys_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_action_log`
--

DROP TABLE IF EXISTS `sys_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_action_log`
--

LOCK TABLES `sys_action_log` WRITE;
/*!40000 ALTER TABLE `sys_action_log` DISABLE KEYS */;
INSERT INTO `sys_action_log` VALUES (1,1,1,2130706433,'member',1,'admin在2015-09-10 14:30登录了后台',1,1441866658),(2,1,1,2130706433,'member',1,'admin在2015-09-11 16:38登录了后台',1,1441960713),(3,9,1,2130706433,'channel',1,'操作url：/onethink/index.php?s=/admin/channel/edit.html',1,1441967157),(4,1,1,2130706433,'member',1,'admin在2015-09-13 08:59登录了后台',1,1442105982),(5,1,1,2130706433,'member',1,'admin在2015-09-13 09:00登录了后台',1,1442106005),(6,1,1,2130706433,'member',1,'admin在2015-09-14 11:32登录了后台',1,1442201555),(7,1,1,2130706433,'member',1,'admin在2015-09-15 22:29登录了后台',1,1442327386),(8,1,1,174338616,'member',1,'admin在2015-09-18 16:42登录了后台',1,1442565774),(9,10,1,174338616,'Menu',122,'操作url：/index.php?s=/Admin/Menu/add.html',1,1442566032),(10,10,1,174338616,'Menu',122,'操作url：/index.php?s=/Admin/Menu/edit.html',1,1442566065),(11,10,1,174338616,'Menu',122,'操作url：/index.php?s=/Admin/Menu/edit.html',1,1442566091),(12,10,1,174338616,'Menu',122,'操作url：/index.php?s=/Admin/Menu/edit.html',1,1442566120),(13,1,1,2130706433,'member',1,'admin在2015-09-19 22:04登录了后台',1,1442671446),(14,10,1,2130706433,'Menu',123,'操作url：/index.php?s=/Admin/Menu/add.html',1,1442671510),(15,10,1,2130706433,'Menu',123,'操作url：/index.php?s=/Admin/Menu/edit.html',1,1442671554),(16,10,1,2130706433,'Menu',123,'操作url：/index.php?s=/Admin/Menu/edit.html',1,1442671586),(17,10,1,2130706433,'Menu',124,'操作url：/index.php?s=/Admin/Menu/add.html',1,1442727107),(18,11,1,2130706433,'category',1,'操作url：/index.php?s=/Admin/Category/edit.html',1,1442743103),(19,10,1,2130706433,'Menu',125,'操作url：/index.php?s=/Admin/Menu/add.html',1,1442764483),(20,10,1,2130706433,'Menu',125,'操作url：/index.php?s=/Admin/Menu/edit.html',1,1442764542),(21,1,1,174338616,'member',1,'admin在2015-09-21 14:02登录了后台',1,1442815329),(22,10,1,174338616,'Menu',126,'操作url：/index.php?s=/Admin/Menu/add.html',1,1442815718),(23,10,1,174338616,'Menu',127,'操作url：/index.php?s=/Admin/Menu/add.html',1,1442815769),(24,10,1,174338616,'Menu',128,'操作url：/index.php?s=/Admin/Menu/add.html',1,1442815791),(25,10,1,174338616,'Menu',125,'操作url：/index.php?s=/Admin/Menu/edit.html',1,1442819081),(26,10,1,174338616,'Menu',129,'操作url：/index.php?s=/Admin/Menu/add.html',1,1442819171),(27,10,1,174338616,'Menu',130,'操作url：/index.php?s=/Admin/Menu/add.html',1,1442819240),(28,10,1,174338616,'Menu',129,'操作url：/index.php?s=/Admin/Menu/edit.html',1,1442819265),(29,10,1,174338616,'Menu',130,'操作url：/index.php?s=/Admin/Menu/edit.html',1,1442819276),(30,10,1,174338616,'Menu',130,'操作url：/index.php?s=/Admin/Menu/edit.html',1,1442819308),(31,10,1,174338616,'Menu',0,'操作url：/index.php?s=/Admin/Menu/del/id/130.html',1,1442825779),(32,10,1,174338616,'Menu',0,'操作url：/index.php?s=/Admin/Menu/del/id/129.html',1,1442825794),(33,10,1,174338616,'Menu',131,'操作url：/index.php?s=/Admin/Menu/add.html',1,1442825925),(34,1,1,174338617,'member',1,'admin在2015-09-22 09:27登录了后台',1,1442885231),(35,10,1,174338617,'Menu',132,'操作url：/index.php?s=/Admin/Menu/add.html',1,1442887978),(36,10,1,174338617,'Menu',122,'操作url：/index.php?s=/Admin/Menu/edit.html',1,1442888151),(37,10,1,174338617,'Menu',133,'操作url：/index.php?s=/Admin/Menu/add.html',1,1442901401),(38,10,1,174338617,'Menu',134,'操作url：/index.php?s=/Admin/Menu/add.html',1,1442901427),(39,1,1,2130706433,'member',1,'admin在2015-09-25 11:18登录了后台',1,1443151103),(40,1,1,174338624,'member',1,'admin在2015-09-25 14:53登录了后台',1,1443164028),(41,1,1,1996883838,'member',1,'admin在2015-09-25 17:57登录了后台',1,1443175041),(42,1,1,2130706433,'member',1,'admin在2015-09-29 23:25登录了后台',1,1443540300),(43,1,1,1996883838,'member',1,'admin在2015-10-08 09:20登录了后台',1,1444267241),(44,1,1,1996883838,'member',1,'admin在2015-10-14 13:52登录了后台',1,1444801947),(45,1,1,1996883838,'member',1,'admin在2015-10-14 15:37登录了后台',1,1444808225),(46,1,1,1996883838,'member',1,'admin在2015-10-15 09:08登录了后台',1,1444871280),(47,1,1,1996883838,'member',1,'admin在2015-10-15 10:25登录了后台',1,1444875958),(48,10,1,1996883838,'Menu',147,'操作url：/index.php?s=/Admin/Menu/add.html',1,1444876012),(49,10,1,1996883838,'Menu',147,'操作url：/index.php?s=/Admin/Menu/edit.html',1,1444876031),(50,1,1,1996883838,'member',1,'admin在2015-10-16 11:37登录了后台',1,1444966662),(51,1,1,1996883838,'member',1,'admin在2015-10-19 10:58登录了后台',1,1445223483),(52,1,1,1996883838,'member',1,'admin在2015-10-19 14:15登录了后台',1,1445235321),(53,1,1,1996883838,'member',1,'admin在2015-10-20 16:11登录了后台',1,1445328690),(54,1,1,1996883838,'member',1,'admin在2015-10-21 10:24登录了后台',1,1445394256),(55,1,1,1996883838,'member',1,'admin在2015-10-21 14:35登录了后台',1,1445409320),(56,1,1,1996883838,'member',1,'admin在2015-10-21 15:19登录了后台',1,1445411987),(57,1,1,1996883812,'member',1,'admin在2015-10-22 09:17登录了后台',1,1445476647),(58,1,1,1996883812,'member',1,'admin在2015-10-22 09:31登录了后台',1,1445477516),(59,1,1,1996883812,'member',1,'admin在2015-10-22 10:22登录了后台',1,1445480570),(60,1,1,1996883812,'member',1,'admin在2015-10-22 14:05登录了后台',1,1445493939),(61,1,2,1996883812,'member',2,'zhengwu01在2015-10-22 14:13登录了后台',1,1445494407),(62,1,3,1996883812,'member',3,'编辑部在2015-10-22 15:17登录了后台',1,1445498260),(63,1,1,1996883812,'member',1,'admin在2015-10-22 15:18登录了后台',1,1445498287),(64,1,3,1996883812,'member',3,'编辑部在2015-10-22 15:20登录了后台',1,1445498401),(65,1,3,1996883812,'member',3,'编辑部在2015-10-22 15:36登录了后台',1,1445499413),(66,1,1,1996883812,'member',1,'admin在2015-10-22 15:37登录了后台',1,1445499432),(67,1,1,1996883812,'member',1,'admin在2015-10-22 15:55登录了后台',1,1445500559),(68,1,1,3063324754,'member',1,'admin在2015-10-22 16:27登录了后台',1,1445502468),(69,1,1,1996883812,'member',1,'admin在2015-10-22 16:43登录了后台',1,1445503402),(70,1,3,1996883812,'member',3,'编辑部在2015-10-22 16:44登录了后台',1,1445503447),(71,1,1,1996883812,'member',1,'admin在2015-10-22 16:44登录了后台',1,1445503489),(72,1,3,1996883812,'member',3,'编辑部在2015-10-22 16:45登录了后台',1,1445503544),(73,1,1,1996883812,'member',1,'admin在2015-10-22 16:51登录了后台',1,1445503902),(74,1,3,1996883812,'member',3,'编辑部在2015-10-22 16:52登录了后台',1,1445503939),(75,1,1,1996883812,'member',1,'admin在2015-10-22 17:13登录了后台',1,1445505199),(76,1,3,1996816381,'member',3,'编辑部在2015-10-22 19:09登录了后台',1,1445512173),(77,1,1,1996883812,'member',1,'admin在2015-10-23 09:25登录了后台',1,1445563535),(78,1,1,1996883812,'member',1,'admin在2015-10-23 09:59登录了后台',1,1445565541),(79,1,1,1996883812,'member',1,'admin在2015-10-23 16:34登录了后台',1,1445589278),(80,1,4,1996883812,'member',4,'kanduyunying在2015-10-23 17:54登录了后台',1,1445594055),(81,1,1,1996883812,'member',1,'admin在2015-10-23 18:06登录了后台',1,1445594792),(82,1,1,1987067247,'member',1,'admin在2015-10-24 13:44登录了后台',1,1445665460),(83,1,1,2882876596,'member',1,'admin在2015-10-24 23:15登录了后台',1,1445699732),(84,1,1,1996883812,'member',1,'admin在2015-10-26 09:03登录了后台',1,1445821410),(85,1,1,1996883812,'member',1,'admin在2015-10-27 15:04登录了后台',1,1445929482),(86,1,1,2130706433,'member',1,'admin在2015-10-28 10:11登录了后台',1,1445998303),(87,1,1,2130706433,'member',1,'admin在2015-10-30 09:20登录了后台',1,1446168023),(88,1,1,2130706433,'member',1,'admin在2015-11-05 10:58登录了后台',1,1446692280),(89,1,1,2130706433,'member',1,'admin在2015-12-31 10:53登录了后台',1,1451530425),(90,1,1,2130706433,'member',1,'admin在2016-01-05 17:21登录了后台',1,1451985709),(91,1,1,1996883812,'member',1,'admin在2016-01-06 11:38登录了后台',1,1452051514),(92,10,1,1996883812,'Menu',135,'操作url：/v2/index.php?s=/Admin/Menu/edit.html',1,1452051566),(93,10,1,1996883812,'Menu',136,'操作url：/v2/index.php?s=/Admin/Menu/edit.html',1,1452051601),(94,10,1,1996883812,'Menu',147,'操作url：/v2/index.php?s=/Admin/Menu/edit.html',1,1452051608),(95,10,1,1996883812,'Menu',144,'操作url：/v2/index.php?s=/Admin/Menu/edit.html',1,1452051684),(96,1,1,1996883812,'member',1,'admin在2016-01-07 09:18登录了后台',1,1452129484),(97,1,1,1996883812,'member',1,'admin在2016-01-07 11:18登录了后台',1,1452136718),(98,1,1,1996883812,'member',1,'admin在2016-01-08 10:28登录了后台',1,1452220081),(99,1,5,1996883812,'member',5,'gabb在2016-01-08 10:31登录了后台',1,1452220297),(100,1,5,1996883812,'member',5,'gabb在2016-01-08 10:34登录了后台',1,1452220483),(101,1,5,1996883812,'member',5,'gabb在2016-01-08 12:58登录了后台',1,1452229090),(102,1,5,1996883812,'member',5,'gabb在2016-01-08 15:12登录了后台',1,1452237159),(103,1,5,2101482608,'member',5,'gabb在2016-01-11 11:05登录了后台',1,1452481509),(104,1,1,1996883812,'member',1,'admin在2016-01-11 15:34登录了后台',1,1452497648),(105,1,1,1996883812,'member',1,'admin在2016-01-14 10:40登录了后台',1,1452739204);
/*!40000 ALTER TABLE `sys_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_addons`
--

DROP TABLE IF EXISTS `sys_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='插件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_addons`
--

LOCK TABLES `sys_addons` WRITE;
/*!40000 ALTER TABLE `sys_addons` DISABLE KEYS */;
INSERT INTO `sys_addons` VALUES (15,'EditorForAdmin','后台编辑器','用于增强整站长文本的输入和显示',1,'{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}','thinkphp','0.1',1383126253,0),(2,'SiteStat','站点统计信息','统计站点的基础信息',1,'{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}','thinkphp','0.1',1379512015,0),(16,'DevTeam','开发团队信息','开发团队成员信息',1,'{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}','thinkphp','0.1',1442725444,0),(4,'SystemInfo','系统环境信息','用于显示一些服务器的信息',1,'{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}','thinkphp','0.1',1379512036,0),(5,'Editor','前台编辑器','用于增强整站长文本的输入和显示',1,'{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}','thinkphp','0.1',1379830910,0),(6,'Attachment','附件','用于文档模型上传附件',1,'null','thinkphp','0.1',1379842319,1),(9,'SocialComment','通用社交化评论','集成了各种社交化评论插件，轻松集成到系统中。',1,'{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}','thinkphp','0.1',1380273962,0);
/*!40000 ALTER TABLE `sys_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_app_block`
--

DROP TABLE IF EXISTS `sys_app_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_app_block` (
  `block_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '区块ID',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '区块名',
  PRIMARY KEY (`block_id`),
  KEY `block_id` (`block_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_app_block`
--

LOCK TABLES `sys_app_block` WRITE;
/*!40000 ALTER TABLE `sys_app_block` DISABLE KEYS */;
INSERT INTO `sys_app_block` VALUES (6,'政务区块');
/*!40000 ALTER TABLE `sys_app_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_app_menu`
--

DROP TABLE IF EXISTS `sys_app_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_app_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `name` varchar(45) NOT NULL DEFAULT '' COMMENT '菜单名',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单icon',
  `block_id` int(11) unsigned NOT NULL DEFAULT '0',
  `type_data` mediumtext NOT NULL COMMENT '类型值',
  `type_id` int(11) unsigned NOT NULL DEFAULT '0',
  `icon_selected` varchar(255) NOT NULL DEFAULT '',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`menu_id`),
  KEY `pid` (`pid`),
  KEY `block_id` (`block_id`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_app_menu`
--

LOCK TABLES `sys_app_menu` WRITE;
/*!40000 ALTER TABLE `sys_app_menu` DISABLE KEYS */;
INSERT INTO `sys_app_menu` VALUES (60,'企业信息查询','',0,'array (\n  \'url\' => \'http://www.cdgs.gov.cn/gsmh/qycx.jsp\',\n  \'target\' => \'1\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'login\' => \'0\',\n  \'type_id\' => \'7\',\n)',7,'',51,2),(61,'营业执照查询','',0,'array (\n  \'url\' => \'http://wsgs.cdgs.gov.cn:9991/businessQuery/index.jsp\',\n  \'target\' => \'1\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'login\' => \'0\',\n  \'type_id\' => \'7\',\n)',7,'',51,0),(62,'格式条款备案（四川省）','',0,'array (\n  \'url\' => \'http://118.112.181.186:7001/ht/display.do?method=hybaquery\',\n  \'target\' => \'1\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'login\' => \'0\',\n  \'type_id\' => \'7\',\n)',7,'',49,0),(63,'格式条款备案（成都市）','',0,'array (\n  \'url\' => \'http://www.cdgs.gov.cn/mhwz/jg_serch/jg_serch_list.go\',\n  \'target\' => \'1\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'login\' => \'0\',\n  \'type_id\' => \'7\',\n)',7,'',49,0),(68,'新增1','',0,'array (\n  \'type_id\' => \'7\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'url\' => \'\',\n  \'target\' => \'\',\n)',7,'',67,0),(69,'新增2','',0,'array (\n  \'type_id\' => \'7\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'url\' => \'\',\n  \'target\' => \'\',\n)',7,'',67,0),(71,'举报投诉','',0,'array (\n  \'type_id\' => \'7\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'url\' => \'http://www.ljcd.gov.cn/pages/rhjb/\',\n  \'target\' => \'1\',\n)',7,'',37,0),(72,'我要入党','',0,'array (\n  \'type_id\' => \'7\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'url\' => \'http://www.cd12371.com/website/DevelopPartys.html\',\n  \'target\' => \'1\',\n)',7,'',38,3),(73,'组织关系转接','',0,'array (\n  \'type_id\' => \'7\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'url\' => \'http://www.cd12371.com/website/OrganizeRelationSwitch.html\',\n  \'target\' => \'1\',\n)',7,'',38,2),(74,'流动党员找组织','',0,'array (\n  \'type_id\' => \'7\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'url\' => \'http://www.cd12371.com/website/FlowMemberOrganizeIndex.html\',\n  \'target\' => \'1\',\n)',7,'',38,1),(75,'网上办事','',0,'array (\n  \'type_id\' => \'7\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'url\' => \'http://www.cdmzj.gov.cn/cdmz/wsbs/\',\n  \'target\' => \'1\',\n)',7,'',39,3),(76,'投诉','',0,'array (\n  \'type_id\' => \'7\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'url\' => \'http://www.cdmzj.gov.cn/cdmz/zmhd/jdts/zmhd_ts/\',\n  \'target\' => \'1\',\n)',7,'',39,2),(77,'食药监网上预审','',0,'array (\n  \'type_id\' => \'7\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'url\' => \'http://125.70.9.207:8899/wsys/\',\n  \'target\' => \'1\',\n)',7,'',44,0),(79,'测试1','',0,'array (\n  \'type_id\' => \'16\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'230\',\n  \'id\' => \'772704\',\n)',16,'',47,0),(80,'测试直播','',0,'array (\n  \'type_id\' => \'17\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'192\',\n  \'id\' => \'1\',\n)',17,'',47,0),(81,'其他','',0,'array (\n  \'type_id\' => \'7\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'url\' => \'\',\n  \'target\' => \'\',\n)',7,'',47,0),(82,'测试图文','',0,'array (\n  \'type_id\' => \'19\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'311\',\n  \'id\' => \'774759\',\n)',19,'',81,0),(83,'小栏目','',0,'array (\n  \'type_id\' => \'14\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'311\',\n)',14,'',81,0),(84,'大栏目','',0,'array (\n  \'type_id\' => \'15\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'98\',\n)',15,'',81,0),(85,'拨号','',0,'array (\n  \'type_id\' => \'10\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'number\' => \'96110\',\n)',10,'',46,0),(86,'','',0,'array (\n  \'type_id\' => \'21\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'roomid\' => \'111\',\n)',21,'',46,0),(87,'测试','',0,'array (\n  \'type_id\' => \'13\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'1063\',\n)',13,'',46,0),(90,'市委','http://sys.gabb.gatv.com.cn/v2/Uploads/Picture/2016-01-08/568f25421a84a.png',6,'array (\n  \'type_id\' => \'14\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'133\',\n)',14,'',0,2),(91,'举报电话','',0,'array (\n  \'type_id\' => \'10\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'number\' => \'96110\',\n)',10,'',89,0),(95,'测试3','',0,'array (\n  \'type_id\' => \'10\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'number\' => \'96110\',\n)',10,'',94,0),(96,'测试4','',0,'array (\n  \'type_id\' => \'7\',\n  \'login\' => \'1\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'url\' => \'http://mob.gabb.gatv.com.cn/show-27-12381-1.html\',\n)',7,'',94,0);
/*!40000 ALTER TABLE `sys_app_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_app_os`
--

DROP TABLE IF EXISTS `sys_app_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_app_os` (
  `os_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  `is_update` tinyint(4) NOT NULL DEFAULT '0' COMMENT '强制升级',
  `update_version_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '升级版本',
  `download_url` varchar(255) NOT NULL DEFAULT '' COMMENT '下载地址',
  `is_update_notice` mediumtext NOT NULL COMMENT '强制更新提示',
  `is_update_version_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '强制更新版本',
  PRIMARY KEY (`os_id`),
  KEY `os_id` (`os_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_app_os`
--

LOCK TABLES `sys_app_os` WRITE;
/*!40000 ALTER TABLE `sys_app_os` DISABLE KEYS */;
INSERT INTO `sys_app_os` VALUES (1,'Android',0,1,'http://ads.cditv.tv/cdtvapk/cando_mobile_v6.4.apk','1、“政务中心”频道新增政务服务功能，纪检举报投诉、提交入党申请、企业年检等多项服务都可以在线快速办理。\r\n2、修复了一些问题，体验更流畅。',0),(2,'iPhone',0,3,'http://ads.cditv.tv/cdtvapk/cando_mobile_v6.4.apk','1、“政务中心”频道新增政务服务功能，纪检举报投诉、提交入党申请、企业年检等多项服务都可以在线快速办理。\r\n2、修复了一些问题，体验更流畅。',0);
/*!40000 ALTER TABLE `sys_app_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_app_rss`
--

DROP TABLE IF EXISTS `sys_app_rss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_app_rss` (
  `rss_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `name` varchar(45) NOT NULL DEFAULT '' COMMENT '菜单名',
  `type_data` mediumtext NOT NULL COMMENT '类型值',
  `isdefault` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认',
  `fixed` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否固定',
  `cate_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rss_id`),
  KEY `sort` (`sort`),
  KEY `cate_id` (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_app_rss`
--

LOCK TABLES `sys_app_rss` WRITE;
/*!40000 ALTER TABLE `sys_app_rss` DISABLE KEYS */;
INSERT INTO `sys_app_rss` VALUES (5,'要闻','array (\n  \'catid\' => 311,\n  \'banner_catid\' => 38,\n  \'type_id\' => 1,\n  \'auth\' => 0,\n  \'check\' => 0,\n  \'login\' => 0,\n)',1,1,1,100,12),(11,'成都','array (\n  \'type_id\' => \'12\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'1171\',\n  \'banner_catid\' => \'1376\',\n)',1,0,1,96,12),(12,'四川','array (\n  \'type_id\' => \'12\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'104\',\n  \'banner_catid\' => \'1380\',\n)',1,0,1,95,12),(13,'猜你喜欢','array (\n  \'type_id\' => \'8\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n)',1,0,1,93,8),(14,'国内','array (\n  \'type_id\' => \'12\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'105\',\n  \'banner_catid\' => \'1378\',\n)',1,0,1,94,12),(15,'西望成都','array (\n  \'type_id\' => \'12\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'1253\',\n  \'banner_catid\' => \'1594\',\n)',1,0,1,91,12),(16,'鲜橙汇','array (\n  \'catid\' => 1242,\n  \'banner_catid\' => 1377,\n  \'type_id\' => 1,\n  \'auth\' => 0,\n  \'check\' => 0,\n  \'login\' => 0,\n)',1,1,1,97,12),(17,'原创','array (\n  \'catid\' => 1386,\n  \'banner_catid\' => 0,\n  \'type_id\' => 1,\n  \'auth\' => 0,\n  \'check\' => 0,\n  \'login\' => 0,\n)',1,1,1,99,12),(18,'自媒体','array (\n  \'type_id\' => \'12\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'1494\',\n  \'banner_catid\' => \'1502\',\n)',0,0,1,96,12),(19,'娱乐','array (\n  \'catid\' => 1057,\n  \'banner_catid\' => 1381,\n  \'type_id\' => 1,\n  \'auth\' => 0,\n  \'check\' => 0,\n  \'login\' => 0,\n)',0,0,1,90,12),(21,'微评','array (\n  \'catid\' => 1140,\n  \'banner_catid\' => 1379,\n  \'type_id\' => 1,\n  \'auth\' => 0,\n  \'check\' => 0,\n  \'login\' => 0,\n)',0,0,1,89,12),(22,'话题','array (\n  \'catid\' => 973,\n  \'banner_catid\' => 1384,\n  \'type_id\' => 1,\n  \'auth\' => 0,\n  \'check\' => 0,\n  \'login\' => 0,\n)',0,0,1,88,12),(23,'专题','array (\n  \'catid\' => 1058,\n  \'banner_catid\' => 1383,\n  \'type_id\' => 1,\n  \'auth\' => 0,\n  \'check\' => 0,\n  \'login\' => 0,\n)',0,0,1,87,12),(26,'廉洁成都','array (\n  \'type_id\' => \'12\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'1440\',\n  \'banner_catid\' => \'0\',\n)',0,0,2,100,12),(27,'蓉城先锋','array (\n  \'type_id\' => \'12\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'1425\',\n  \'banner_catid\' => \'\',\n)',0,0,2,99,12),(33,'H5策划','array (\n  \'catid\' => 1651,\n  \'banner_catid\' => 0,\n  \'type_id\' => 1,\n  \'auth\' => 0,\n  \'check\' => 0,\n  \'login\' => 0,\n)',0,0,1,93,12),(41,'民政局','array (\n  \'type_id\' => \'12\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'1465\',\n  \'banner_catid\' => \'\',\n)',0,0,2,98,12),(42,'司法局','array (\n  \'type_id\' => \'12\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'1435\',\n  \'banner_catid\' => \'\',\n)',0,0,2,97,12),(43,'城管委','array (\n  \'type_id\' => \'12\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'1453\',\n  \'banner_catid\' => \'\',\n)',0,0,2,96,12),(44,'交委','array (\n  \'type_id\' => \'12\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'1460\',\n  \'banner_catid\' => \'\',\n)',0,0,2,95,12),(45,'商务委','array (\n  \'type_id\' => \'12\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'1456\',\n  \'banner_catid\' => \'\',\n)',0,0,2,94,12),(46,'文广新局','array (\n  \'type_id\' => \'12\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'1470\',\n  \'banner_catid\' => \'\',\n)',0,0,2,93,12),(47,'食药监局','array (\n  \'type_id\' => \'12\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'1448\',\n  \'banner_catid\' => \'\',\n)',0,0,2,92,12),(48,'体育局','array (\n  \'type_id\' => \'12\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'1463\',\n  \'banner_catid\' => \'\',\n)',0,0,2,91,12),(49,'市妇联','array (\n  \'type_id\' => \'12\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'1442\',\n  \'banner_catid\' => \'\',\n)',0,0,2,90,12),(50,'出入境管理局','array (\n  \'type_id\' => \'12\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'1477\',\n  \'banner_catid\' => \'\',\n)',0,0,2,89,12),(51,'交管局','array (\n  \'type_id\' => \'12\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'1473\',\n  \'banner_catid\' => \'\',\n)',0,0,2,88,12),(52,'成都工商','array (\n  \'type_id\' => \'12\',\n  \'login\' => \'0\',\n  \'auth\' => \'0\',\n  \'check\' => \'0\',\n  \'catid\' => \'1618\',\n  \'banner_catid\' => \'\',\n)',0,0,2,87,12);
/*!40000 ALTER TABLE `sys_app_rss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_app_rss_category`
--

DROP TABLE IF EXISTS `sys_app_rss_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_app_rss_category` (
  `cate_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '' COMMENT '分类名',
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_app_rss_category`
--

LOCK TABLES `sys_app_rss_category` WRITE;
/*!40000 ALTER TABLE `sys_app_rss_category` DISABLE KEYS */;
INSERT INTO `sys_app_rss_category` VALUES (1,'更多频道'),(2,'政务资讯');
/*!40000 ALTER TABLE `sys_app_rss_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_app_type`
--

DROP TABLE IF EXISTS `sys_app_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_app_type` (
  `type_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '类型ID',
  `name` varchar(45) NOT NULL DEFAULT '' COMMENT '类型名',
  `field` mediumtext NOT NULL COMMENT '类型字段定义',
  `desc` mediumtext NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_app_type`
--

LOCK TABLES `sys_app_type` WRITE;
/*!40000 ALTER TABLE `sys_app_type` DISABLE KEYS */;
INSERT INTO `sys_app_type` VALUES (7,'链接','    array (\r\n\r\n			array(\r\n						\"title\"=>\"链接地址\",\r\n						\"type\"=>\"string\",\r\n                   \"field\"=>\"url\",\r\n						\"require\"=>\"1\"\r\n				),\r\n\r\n       )',''),(9,'app下载','    array (\r\n\r\n			array(\r\n						\"title\"=>\"android下载地址\",\r\n						\"type\"=>\"string\",\r\n                   \"field\"=>\"url\",\r\n						\"require\"=>\"0\"\r\n				),\r\n\r\n\r\n			array(\r\n						\"title\"=>\"iphone下载地址\",\r\n						\"type\"=>\"string\",\r\n                   \"field\"=>\"ios_url\",\r\n						\"require\"=>\"0\"\r\n				)\r\n\r\n       )',''),(10,'拨号','   array (\r\n\r\n			array(\r\n						\"title\"=>\"拨号号码\",\r\n						\"type\"=>\"string\",\r\n                   \"field\"=>\"number\",\r\n						\"require\"=>\"1\"\r\n				),\r\n\r\n       )',''),(14,'幻灯+内容列表模板','		array(\r\n				\r\n			array(\r\n						\"title\"=>\"栏目ID\",\r\n						\"type\"=>\"number\",\r\n                   \"field\"=>\"catid\",\r\n						\"require\"=>\"1\"\r\n				)\r\n				\r\n		);',''),(15,'幻灯+多栏目内容列表模板','	array(\r\n			array(\r\n						\"title\"=>\"栏目ID\",\r\n						\"type\"=>\"number\",\r\n                   \"field\"=>\"catid\",\r\n						\"require\"=>\"1\"\r\n				)\r\n				\r\n		);','');
/*!40000 ALTER TABLE `sys_app_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_app_version`
--

DROP TABLE IF EXISTS `sys_app_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_app_version` (
  `version_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '版本ID',
  `version` varchar(45) NOT NULL DEFAULT '' COMMENT '版本号',
  `os_id` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '系统ID',
  `name` varchar(45) NOT NULL DEFAULT '' COMMENT '版本名',
  `desc` mediumtext NOT NULL COMMENT '更新描述',
  `versioncode` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安桌versioncode',
  PRIMARY KEY (`version_id`),
  KEY `os_id` (`os_id`),
  KEY `version` (`version`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_app_version`
--

LOCK TABLES `sys_app_version` WRITE;
/*!40000 ALTER TABLE `sys_app_version` DISABLE KEYS */;
INSERT INTO `sys_app_version` VALUES (1,'7.0.0',1,'看度7.0','1、“政务中心”频道新增政务服务功能，纪检举报投诉、提交入党申请、企业年检等多项服务都可以在线快速办理。\r\n2、修复了一些问题，体验更流畅。',42),(3,'7.0.0',2,'看度7.0','1、“政务中心”频道新增政务服务功能，纪检举报投诉、提交入党申请、企业年检等多项服务都可以在线快速办理。\r\n2、修复了一些问题，体验更流畅。',0);
/*!40000 ALTER TABLE `sys_app_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_attachment`
--

DROP TABLE IF EXISTS `sys_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_attachment`
--

LOCK TABLES `sys_attachment` WRITE;
/*!40000 ALTER TABLE `sys_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_attribute`
--

DROP TABLE IF EXISTS `sys_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='模型属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_attribute`
--

LOCK TABLES `sys_attribute` WRITE;
/*!40000 ALTER TABLE `sys_attribute` DISABLE KEYS */;
INSERT INTO `sys_attribute` VALUES (1,'uid','用户ID','int(10) unsigned NOT NULL ','num','0','',0,'',1,0,1,1384508362,1383891233,'',0,'','','',0,''),(2,'name','标识','char(40) NOT NULL ','string','','同一根节点下标识不重复',1,'',1,0,1,1383894743,1383891233,'',0,'','','',0,''),(3,'title','标题','char(80) NOT NULL ','string','','文档标题',1,'',1,0,1,1383894778,1383891233,'',0,'','','',0,''),(4,'category_id','所属分类','int(10) unsigned NOT NULL ','string','','',0,'',1,0,1,1384508336,1383891233,'',0,'','','',0,''),(5,'description','描述','char(140) NOT NULL ','textarea','','',1,'',1,0,1,1383894927,1383891233,'',0,'','','',0,''),(6,'root','根节点','int(10) unsigned NOT NULL ','num','0','该文档的顶级文档编号',0,'',1,0,1,1384508323,1383891233,'',0,'','','',0,''),(7,'pid','所属ID','int(10) unsigned NOT NULL ','num','0','父文档编号',0,'',1,0,1,1384508543,1383891233,'',0,'','','',0,''),(8,'model_id','内容模型ID','tinyint(3) unsigned NOT NULL ','num','0','该文档所对应的模型',0,'',1,0,1,1384508350,1383891233,'',0,'','','',0,''),(9,'type','内容类型','tinyint(3) unsigned NOT NULL ','select','2','',1,'1:目录\r\n2:主题\r\n3:段落',1,0,1,1384511157,1383891233,'',0,'','','',0,''),(10,'position','推荐位','smallint(5) unsigned NOT NULL ','checkbox','0','多个推荐则将其推荐值相加',1,'1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐',1,0,1,1383895640,1383891233,'',0,'','','',0,''),(11,'link_id','外链','int(10) unsigned NOT NULL ','num','0','0-非外链，大于0-外链ID,需要函数进行链接与编号的转换',1,'',1,0,1,1383895757,1383891233,'',0,'','','',0,''),(12,'cover_id','封面','int(10) unsigned NOT NULL ','picture','0','0-无封面，大于0-封面图片ID，需要函数处理',1,'',1,0,1,1384147827,1383891233,'',0,'','','',0,''),(13,'display','可见性','tinyint(3) unsigned NOT NULL ','radio','1','',1,'0:不可见\r\n1:所有人可见',1,0,1,1386662271,1383891233,'',0,'','regex','',0,'function'),(14,'deadline','截至时间','int(10) unsigned NOT NULL ','datetime','0','0-永久有效',1,'',1,0,1,1387163248,1383891233,'',0,'','regex','',0,'function'),(15,'attach','附件数量','tinyint(3) unsigned NOT NULL ','num','0','',0,'',1,0,1,1387260355,1383891233,'',0,'','regex','',0,'function'),(16,'view','浏览量','int(10) unsigned NOT NULL ','num','0','',1,'',1,0,1,1383895835,1383891233,'',0,'','','',0,''),(17,'comment','评论数','int(10) unsigned NOT NULL ','num','0','',1,'',1,0,1,1383895846,1383891233,'',0,'','','',0,''),(18,'extend','扩展统计字段','int(10) unsigned NOT NULL ','num','0','根据需求自行使用',0,'',1,0,1,1384508264,1383891233,'',0,'','','',0,''),(19,'level','优先级','int(10) unsigned NOT NULL ','num','0','越高排序越靠前',1,'',1,0,1,1383895894,1383891233,'',0,'','','',0,''),(20,'create_time','创建时间','int(10) unsigned NOT NULL ','datetime','0','',1,'',1,0,1,1383895903,1383891233,'',0,'','','',0,''),(21,'update_time','更新时间','int(10) unsigned NOT NULL ','datetime','0','',0,'',1,0,1,1384508277,1383891233,'',0,'','','',0,''),(22,'status','数据状态','tinyint(4) NOT NULL ','radio','0','',0,'-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿',1,0,1,1384508496,1383891233,'',0,'','','',0,''),(23,'parse','内容解析类型','tinyint(3) unsigned NOT NULL ','select','0','',0,'0:html\r\n1:ubb\r\n2:markdown',2,0,1,1384511049,1383891243,'',0,'','','',0,''),(24,'content','文章内容','text NOT NULL ','editor','','',1,'',2,0,1,1383896225,1383891243,'',0,'','','',0,''),(25,'template','详情页显示模板','varchar(100) NOT NULL ','string','','参照display方法参数的定义',1,'',2,0,1,1383896190,1383891243,'',0,'','','',0,''),(26,'bookmark','收藏数','int(10) unsigned NOT NULL ','num','0','',1,'',2,0,1,1383896103,1383891243,'',0,'','','',0,''),(27,'parse','内容解析类型','tinyint(3) unsigned NOT NULL ','select','0','',0,'0:html\r\n1:ubb\r\n2:markdown',3,0,1,1387260461,1383891252,'',0,'','regex','',0,'function'),(28,'content','下载详细描述','text NOT NULL ','editor','','',1,'',3,0,1,1383896438,1383891252,'',0,'','','',0,''),(29,'template','详情页显示模板','varchar(100) NOT NULL ','string','','',1,'',3,0,1,1383896429,1383891252,'',0,'','','',0,''),(30,'file_id','文件ID','int(10) unsigned NOT NULL ','file','0','需要函数处理',1,'',3,0,1,1383896415,1383891252,'',0,'','','',0,''),(31,'download','下载次数','int(10) unsigned NOT NULL ','num','0','',1,'',3,0,1,1383896380,1383891252,'',0,'','','',0,''),(32,'size','文件大小','bigint(20) unsigned NOT NULL ','num','0','单位bit',1,'',3,0,1,1383896371,1383891252,'',0,'','','',0,'');
/*!40000 ALTER TABLE `sys_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_auth_extend`
--

DROP TABLE IF EXISTS `sys_auth_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_auth_extend`
--

LOCK TABLES `sys_auth_extend` WRITE;
/*!40000 ALTER TABLE `sys_auth_extend` DISABLE KEYS */;
INSERT INTO `sys_auth_extend` VALUES (1,1,1),(1,1,2),(1,2,1),(1,2,2),(1,3,1),(1,3,2),(1,4,1),(1,37,1);
/*!40000 ALTER TABLE `sys_auth_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_auth_group`
--

DROP TABLE IF EXISTS `sys_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_auth_group`
--

LOCK TABLES `sys_auth_group` WRITE;
/*!40000 ALTER TABLE `sys_auth_group` DISABLE KEYS */;
INSERT INTO `sys_auth_group` VALUES (1,'admin',1,'默认用户组','',1,'1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106'),(2,'admin',1,'测试用户','测试用户',1,'1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195'),(3,'admin',1,'编辑部','',1,'1,225,226,227,228,241');
/*!40000 ALTER TABLE `sys_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_auth_group_access`
--

DROP TABLE IF EXISTS `sys_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_auth_group_access`
--

LOCK TABLES `sys_auth_group_access` WRITE;
/*!40000 ALTER TABLE `sys_auth_group_access` DISABLE KEYS */;
INSERT INTO `sys_auth_group_access` VALUES (5,3);
/*!40000 ALTER TABLE `sys_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_auth_rule`
--

DROP TABLE IF EXISTS `sys_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=242 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_auth_rule`
--

LOCK TABLES `sys_auth_rule` WRITE;
/*!40000 ALTER TABLE `sys_auth_rule` DISABLE KEYS */;
INSERT INTO `sys_auth_rule` VALUES (1,'admin',2,'Admin/Index/index','首页',1,''),(2,'admin',2,'Admin/Article/mydocument','内容',1,''),(3,'admin',2,'Admin/User/index','用户',1,''),(4,'admin',2,'Admin/Addons/index','扩展',1,''),(5,'admin',2,'Admin/Config/group','系统',1,''),(7,'admin',1,'Admin/article/add','新增',1,''),(8,'admin',1,'Admin/article/edit','编辑',1,''),(9,'admin',1,'Admin/article/setStatus','改变状态',1,''),(10,'admin',1,'Admin/article/update','保存',1,''),(11,'admin',1,'Admin/article/autoSave','保存草稿',1,''),(12,'admin',1,'Admin/article/move','移动',1,''),(13,'admin',1,'Admin/article/copy','复制',1,''),(14,'admin',1,'Admin/article/paste','粘贴',1,''),(15,'admin',1,'Admin/article/permit','还原',1,''),(16,'admin',1,'Admin/article/clear','清空',1,''),(17,'admin',1,'Admin/article/index','文档列表',1,''),(18,'admin',1,'Admin/article/recycle','回收站',1,''),(19,'admin',1,'Admin/User/addaction','新增用户行为',1,''),(20,'admin',1,'Admin/User/editaction','编辑用户行为',1,''),(21,'admin',1,'Admin/User/saveAction','保存用户行为',1,''),(22,'admin',1,'Admin/User/setStatus','变更行为状态',1,''),(23,'admin',1,'Admin/User/changeStatus?method=forbidUser','禁用会员',1,''),(24,'admin',1,'Admin/User/changeStatus?method=resumeUser','启用会员',1,''),(25,'admin',1,'Admin/User/changeStatus?method=deleteUser','删除会员',1,''),(26,'admin',1,'Admin/User/index','用户信息',1,''),(27,'admin',1,'Admin/User/action','用户行为',1,''),(28,'admin',1,'Admin/AuthManager/changeStatus?method=deleteGroup','删除',1,''),(29,'admin',1,'Admin/AuthManager/changeStatus?method=forbidGroup','禁用',1,''),(30,'admin',1,'Admin/AuthManager/changeStatus?method=resumeGroup','恢复',1,''),(31,'admin',1,'Admin/AuthManager/createGroup','新增',1,''),(32,'admin',1,'Admin/AuthManager/editGroup','编辑',1,''),(33,'admin',1,'Admin/AuthManager/writeGroup','保存用户组',1,''),(34,'admin',1,'Admin/AuthManager/group','授权',1,''),(35,'admin',1,'Admin/AuthManager/access','访问授权',1,''),(36,'admin',1,'Admin/AuthManager/user','成员授权',1,''),(37,'admin',1,'Admin/AuthManager/removeFromGroup','解除授权',1,''),(38,'admin',1,'Admin/AuthManager/addToGroup','保存成员授权',1,''),(39,'admin',1,'Admin/AuthManager/category','分类授权',1,''),(40,'admin',1,'Admin/AuthManager/addToCategory','保存分类授权',1,''),(41,'admin',1,'Admin/AuthManager/index','权限管理',1,''),(42,'admin',1,'Admin/Addons/create','创建',1,''),(43,'admin',1,'Admin/Addons/checkForm','检测创建',1,''),(44,'admin',1,'Admin/Addons/preview','预览',1,''),(45,'admin',1,'Admin/Addons/build','快速生成插件',1,''),(46,'admin',1,'Admin/Addons/config','设置',1,''),(47,'admin',1,'Admin/Addons/disable','禁用',1,''),(48,'admin',1,'Admin/Addons/enable','启用',1,''),(49,'admin',1,'Admin/Addons/install','安装',1,''),(50,'admin',1,'Admin/Addons/uninstall','卸载',1,''),(51,'admin',1,'Admin/Addons/saveconfig','更新配置',1,''),(52,'admin',1,'Admin/Addons/adminList','插件后台列表',1,''),(53,'admin',1,'Admin/Addons/execute','URL方式访问插件',1,''),(54,'admin',1,'Admin/Addons/index','插件管理',1,''),(55,'admin',1,'Admin/Addons/hooks','钩子管理',1,''),(56,'admin',1,'Admin/model/add','新增',1,''),(57,'admin',1,'Admin/model/edit','编辑',1,''),(58,'admin',1,'Admin/model/setStatus','改变状态',1,''),(59,'admin',1,'Admin/model/update','保存数据',1,''),(60,'admin',1,'Admin/Model/index','模型管理',1,''),(61,'admin',1,'Admin/Config/edit','编辑',1,''),(62,'admin',1,'Admin/Config/del','删除',1,''),(63,'admin',1,'Admin/Config/add','新增',1,''),(64,'admin',1,'Admin/Config/save','保存',1,''),(65,'admin',1,'Admin/Config/group','网站设置',1,''),(66,'admin',1,'Admin/Config/index','配置管理',1,''),(67,'admin',1,'Admin/Channel/add','新增',1,''),(68,'admin',1,'Admin/Channel/edit','编辑',1,''),(69,'admin',1,'Admin/Channel/del','删除',1,''),(70,'admin',1,'Admin/Channel/index','导航管理',1,''),(71,'admin',1,'Admin/Category/edit','编辑',1,''),(72,'admin',1,'Admin/Category/add','新增',1,''),(73,'admin',1,'Admin/Category/remove','删除',1,''),(74,'admin',1,'Admin/Category/index','分类管理',1,''),(75,'admin',1,'Admin/file/upload','上传控件',-1,''),(76,'admin',1,'Admin/file/uploadPicture','上传图片',-1,''),(77,'admin',1,'Admin/file/download','下载',-1,''),(94,'admin',1,'Admin/AuthManager/modelauth','模型授权',1,''),(79,'admin',1,'Admin/article/batchOperate','导入',1,''),(80,'admin',1,'Admin/Database/index?type=export','备份数据库',1,''),(81,'admin',1,'Admin/Database/index?type=import','还原数据库',1,''),(82,'admin',1,'Admin/Database/export','备份',1,''),(83,'admin',1,'Admin/Database/optimize','优化表',1,''),(84,'admin',1,'Admin/Database/repair','修复表',1,''),(86,'admin',1,'Admin/Database/import','恢复',1,''),(87,'admin',1,'Admin/Database/del','删除',1,''),(88,'admin',1,'Admin/User/add','新增用户',1,''),(89,'admin',1,'Admin/Attribute/index','属性管理',1,''),(90,'admin',1,'Admin/Attribute/add','新增',1,''),(91,'admin',1,'Admin/Attribute/edit','编辑',1,''),(92,'admin',1,'Admin/Attribute/setStatus','改变状态',1,''),(93,'admin',1,'Admin/Attribute/update','保存数据',1,''),(95,'admin',1,'Admin/AuthManager/addToModel','保存模型授权',1,''),(96,'admin',1,'Admin/Category/move','移动',-1,''),(97,'admin',1,'Admin/Category/merge','合并',-1,''),(98,'admin',1,'Admin/Config/menu','后台菜单管理',-1,''),(99,'admin',1,'Admin/Article/mydocument','内容',-1,''),(100,'admin',1,'Admin/Menu/index','菜单管理',1,''),(101,'admin',1,'Admin/other','其他',-1,''),(102,'admin',1,'Admin/Menu/add','新增',1,''),(103,'admin',1,'Admin/Menu/edit','编辑',1,''),(104,'admin',1,'Admin/Think/lists?model=article','文章管理',-1,''),(105,'admin',1,'Admin/Think/lists?model=download','下载管理',1,''),(106,'admin',1,'Admin/Think/lists?model=config','配置管理',1,''),(107,'admin',1,'Admin/Action/actionlog','行为日志',1,''),(108,'admin',1,'Admin/User/updatePassword','修改密码',1,''),(109,'admin',1,'Admin/User/updateNickname','修改昵称',1,''),(110,'admin',1,'Admin/action/edit','查看行为日志',1,''),(205,'admin',1,'Admin/think/add','新增数据',1,''),(111,'admin',2,'Admin/article/index','文档列表',-1,''),(112,'admin',2,'Admin/article/add','新增',-1,''),(113,'admin',2,'Admin/article/edit','编辑',-1,''),(114,'admin',2,'Admin/article/setStatus','改变状态',-1,''),(115,'admin',2,'Admin/article/update','保存',-1,''),(116,'admin',2,'Admin/article/autoSave','保存草稿',-1,''),(117,'admin',2,'Admin/article/move','移动',-1,''),(118,'admin',2,'Admin/article/copy','复制',-1,''),(119,'admin',2,'Admin/article/paste','粘贴',-1,''),(120,'admin',2,'Admin/article/batchOperate','导入',-1,''),(121,'admin',2,'Admin/article/recycle','回收站',-1,''),(122,'admin',2,'Admin/article/permit','还原',-1,''),(123,'admin',2,'Admin/article/clear','清空',-1,''),(124,'admin',2,'Admin/User/add','新增用户',-1,''),(125,'admin',2,'Admin/User/action','用户行为',-1,''),(126,'admin',2,'Admin/User/addAction','新增用户行为',-1,''),(127,'admin',2,'Admin/User/editAction','编辑用户行为',-1,''),(128,'admin',2,'Admin/User/saveAction','保存用户行为',-1,''),(129,'admin',2,'Admin/User/setStatus','变更行为状态',-1,''),(130,'admin',2,'Admin/User/changeStatus?method=forbidUser','禁用会员',-1,''),(131,'admin',2,'Admin/User/changeStatus?method=resumeUser','启用会员',-1,''),(132,'admin',2,'Admin/User/changeStatus?method=deleteUser','删除会员',-1,''),(133,'admin',2,'Admin/AuthManager/index','权限管理',-1,''),(134,'admin',2,'Admin/AuthManager/changeStatus?method=deleteGroup','删除',-1,''),(135,'admin',2,'Admin/AuthManager/changeStatus?method=forbidGroup','禁用',-1,''),(136,'admin',2,'Admin/AuthManager/changeStatus?method=resumeGroup','恢复',-1,''),(137,'admin',2,'Admin/AuthManager/createGroup','新增',-1,''),(138,'admin',2,'Admin/AuthManager/editGroup','编辑',-1,''),(139,'admin',2,'Admin/AuthManager/writeGroup','保存用户组',-1,''),(140,'admin',2,'Admin/AuthManager/group','授权',-1,''),(141,'admin',2,'Admin/AuthManager/access','访问授权',-1,''),(142,'admin',2,'Admin/AuthManager/user','成员授权',-1,''),(143,'admin',2,'Admin/AuthManager/removeFromGroup','解除授权',-1,''),(144,'admin',2,'Admin/AuthManager/addToGroup','保存成员授权',-1,''),(145,'admin',2,'Admin/AuthManager/category','分类授权',-1,''),(146,'admin',2,'Admin/AuthManager/addToCategory','保存分类授权',-1,''),(147,'admin',2,'Admin/AuthManager/modelauth','模型授权',-1,''),(148,'admin',2,'Admin/AuthManager/addToModel','保存模型授权',-1,''),(149,'admin',2,'Admin/Addons/create','创建',-1,''),(150,'admin',2,'Admin/Addons/checkForm','检测创建',-1,''),(151,'admin',2,'Admin/Addons/preview','预览',-1,''),(152,'admin',2,'Admin/Addons/build','快速生成插件',-1,''),(153,'admin',2,'Admin/Addons/config','设置',-1,''),(154,'admin',2,'Admin/Addons/disable','禁用',-1,''),(155,'admin',2,'Admin/Addons/enable','启用',-1,''),(156,'admin',2,'Admin/Addons/install','安装',-1,''),(157,'admin',2,'Admin/Addons/uninstall','卸载',-1,''),(158,'admin',2,'Admin/Addons/saveconfig','更新配置',-1,''),(159,'admin',2,'Admin/Addons/adminList','插件后台列表',-1,''),(160,'admin',2,'Admin/Addons/execute','URL方式访问插件',-1,''),(161,'admin',2,'Admin/Addons/hooks','钩子管理',-1,''),(162,'admin',2,'Admin/Model/index','模型管理',-1,''),(163,'admin',2,'Admin/model/add','新增',-1,''),(164,'admin',2,'Admin/model/edit','编辑',-1,''),(165,'admin',2,'Admin/model/setStatus','改变状态',-1,''),(166,'admin',2,'Admin/model/update','保存数据',-1,''),(167,'admin',2,'Admin/Attribute/index','属性管理',-1,''),(168,'admin',2,'Admin/Attribute/add','新增',-1,''),(169,'admin',2,'Admin/Attribute/edit','编辑',-1,''),(170,'admin',2,'Admin/Attribute/setStatus','改变状态',-1,''),(171,'admin',2,'Admin/Attribute/update','保存数据',-1,''),(172,'admin',2,'Admin/Config/index','配置管理',-1,''),(173,'admin',2,'Admin/Config/edit','编辑',-1,''),(174,'admin',2,'Admin/Config/del','删除',-1,''),(175,'admin',2,'Admin/Config/add','新增',-1,''),(176,'admin',2,'Admin/Config/save','保存',-1,''),(177,'admin',2,'Admin/Menu/index','菜单管理',-1,''),(178,'admin',2,'Admin/Channel/index','导航管理',-1,''),(179,'admin',2,'Admin/Channel/add','新增',-1,''),(180,'admin',2,'Admin/Channel/edit','编辑',-1,''),(181,'admin',2,'Admin/Channel/del','删除',-1,''),(182,'admin',2,'Admin/Category/index','分类管理',-1,''),(183,'admin',2,'Admin/Category/edit','编辑',-1,''),(184,'admin',2,'Admin/Category/add','新增',-1,''),(185,'admin',2,'Admin/Category/remove','删除',-1,''),(186,'admin',2,'Admin/Category/move','移动',-1,''),(187,'admin',2,'Admin/Category/merge','合并',-1,''),(188,'admin',2,'Admin/Database/index?type=export','备份数据库',-1,''),(189,'admin',2,'Admin/Database/export','备份',-1,''),(190,'admin',2,'Admin/Database/optimize','优化表',-1,''),(191,'admin',2,'Admin/Database/repair','修复表',-1,''),(192,'admin',2,'Admin/Database/index?type=import','还原数据库',-1,''),(193,'admin',2,'Admin/Database/import','恢复',-1,''),(194,'admin',2,'Admin/Database/del','删除',-1,''),(195,'admin',2,'Admin/other','其他',1,''),(196,'admin',2,'Admin/Menu/add','新增',-1,''),(197,'admin',2,'Admin/Menu/edit','编辑',-1,''),(198,'admin',2,'Admin/Think/lists?model=article','应用',-1,''),(199,'admin',2,'Admin/Think/lists?model=download','下载管理',-1,''),(200,'admin',2,'Admin/Think/lists?model=config','应用',-1,''),(201,'admin',2,'Admin/Action/actionlog','行为日志',-1,''),(202,'admin',2,'Admin/User/updatePassword','修改密码',-1,''),(203,'admin',2,'Admin/User/updateNickname','修改昵称',-1,''),(204,'admin',2,'Admin/action/edit','查看行为日志',-1,''),(206,'admin',1,'Admin/think/edit','编辑数据',1,''),(207,'admin',1,'Admin/Menu/import','导入',1,''),(208,'admin',1,'Admin/Model/generate','生成',1,''),(209,'admin',1,'Admin/Addons/addHook','新增钩子',1,''),(210,'admin',1,'Admin/Addons/edithook','编辑钩子',1,''),(211,'admin',1,'Admin/Article/sort','文档排序',1,''),(212,'admin',1,'Admin/Config/sort','排序',1,''),(213,'admin',1,'Admin/Menu/sort','排序',1,''),(214,'admin',1,'Admin/Channel/sort','排序',1,''),(215,'admin',1,'Admin/Category/operate/type/move','移动',1,''),(216,'admin',1,'Admin/Category/operate/type/merge','合并',1,''),(217,'admin',1,'Admin/AppBlock/index','区块管理',1,''),(218,'admin',1,'Admin/AppBlock/edit','修改',1,''),(219,'admin',1,'Admin/AppType/index','类型管理',1,''),(220,'admin',1,'Admin/AppType/edit','修改',1,''),(221,'admin',1,'Admin/AppBlock/add','新增',1,''),(222,'admin',1,'Admin/AppType/add','新增',1,''),(223,'admin',1,'Admin/AppVersion/index','版本管理',1,''),(224,'admin',2,'Admin/AppMenu/add','App',-1,''),(225,'admin',1,'Admin/AppMenu/add','新增',1,''),(226,'admin',1,'Admin/AppMenu/edit','修改',1,''),(227,'admin',1,'Admin/AppMenu/index','菜单管理',1,''),(228,'admin',2,'Admin/AppMenu/index','App',1,''),(229,'admin',1,'Admin/AppRss/index','订阅管理',1,''),(230,'admin',1,'Admin/AppRssCategory/index','分类管理',1,''),(231,'admin',1,'Admin/AppRss/add','新增',1,''),(232,'admin',1,'Admin/AppRss/edit','修改',1,''),(233,'admin',1,'Admin/AppRssCategory/add','新增',1,''),(234,'admin',1,'Admin/AppRssCategory/edit','修改',1,''),(235,'admin',1,'Admin/AppVersion/add','新增',1,''),(236,'admin',1,'Admin/AppVersion/edit','修改',1,''),(237,'admin',1,'Admin/AppOs/upload','上传',1,''),(238,'admin',1,'Admin/AppOs/index','OS管理',1,''),(239,'admin',1,'Admin/AppOs/edit','修改',1,''),(240,'admin',1,'Admin/AppRss/notify','上线通知',1,''),(241,'admin',1,'Admin/AppCache/clear','缓存更新',1,'');
/*!40000 ALTER TABLE `sys_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_category`
--

DROP TABLE IF EXISTS `sys_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_category`
--

LOCK TABLES `sys_category` WRITE;
/*!40000 ALTER TABLE `sys_category` DISABLE KEYS */;
INSERT INTO `sys_category` VALUES (1,'blog','博客',0,0,10,'','','','','','','','2','2,1',0,0,1,0,0,'1','',1379474947,1442743103,1,0),(2,'default_blog','默认分类',1,1,10,'','','','','','','','2','2,1,3',0,1,1,0,1,'1','',1379475028,1386839751,1,31);
/*!40000 ALTER TABLE `sys_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_channel`
--

DROP TABLE IF EXISTS `sys_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_channel`
--

LOCK TABLES `sys_channel` WRITE;
/*!40000 ALTER TABLE `sys_channel` DISABLE KEYS */;
INSERT INTO `sys_channel` VALUES (1,0,'首页','Index/index',1,1379475111,1441967157,1,0),(2,0,'博客','Article/index?category=blog',2,1379475131,1379483713,1,0),(3,0,'官网','http://www.onethink.cn',3,1379475154,1387163458,1,0);
/*!40000 ALTER TABLE `sys_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'WEB_SITE_TITLE',1,'网站标题',1,'','网站标题前台显示标题',1378898976,1379235274,1,'OneThink内容管理框架',0),(2,'WEB_SITE_DESCRIPTION',2,'网站描述',1,'','网站搜索引擎描述',1378898976,1379235841,1,'OneThink内容管理框架',1),(3,'WEB_SITE_KEYWORD',2,'网站关键字',1,'','网站搜索引擎关键字',1378898976,1381390100,1,'ThinkPHP,OneThink',8),(4,'WEB_SITE_CLOSE',4,'关闭站点',1,'0:关闭,1:开启','站点关闭后其他用户不能访问，管理员可以正常访问',1378898976,1379235296,1,'1',1),(9,'CONFIG_TYPE_LIST',3,'配置类型列表',4,'','主要用于数据解析和页面表单的生成',1378898976,1379235348,1,'0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举',2),(10,'WEB_SITE_ICP',1,'网站备案号',1,'','设置在网站底部显示的备案号，如“沪ICP备12007941号-2',1378900335,1379235859,1,'',9),(11,'DOCUMENT_POSITION',3,'文档推荐位',2,'','文档推荐位，推荐到多个位置KEY值相加即可',1379053380,1379235329,1,'1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐',3),(12,'DOCUMENT_DISPLAY',3,'文档可见性',2,'','文章可见性仅影响前台显示，后台不收影响',1379056370,1379235322,1,'0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见',4),(13,'COLOR_STYLE',4,'后台色系',1,'default_color:默认\r\nblue_color:紫罗兰','后台颜色风格',1379122533,1379235904,1,'default_color',10),(20,'CONFIG_GROUP_LIST',3,'配置分组',4,'','配置分组',1379228036,1384418383,1,'1:基本\r\n2:内容\r\n3:用户\r\n4:系统',4),(21,'HOOKS_TYPE',3,'钩子的类型',4,'','类型 1-用于扩展显示内容，2-用于扩展业务处理',1379313397,1379313407,1,'1:视图\r\n2:控制器',6),(22,'AUTH_CONFIG',3,'Auth配置',4,'','自定义Auth.class.php类配置',1379409310,1379409564,1,'AUTH_ON:1\r\nAUTH_TYPE:2',8),(23,'OPEN_DRAFTBOX',4,'是否开启草稿功能',2,'0:关闭草稿功能\r\n1:开启草稿功能\r\n','新增文章时的草稿功能配置',1379484332,1379484591,1,'1',1),(24,'DRAFT_AOTOSAVE_INTERVAL',0,'自动保存草稿时间',2,'','自动保存草稿的时间间隔，单位：秒',1379484574,1386143323,1,'60',2),(25,'LIST_ROWS',0,'后台每页记录数',2,'','后台数据每页显示记录数',1379503896,1380427745,1,'10',10),(26,'USER_ALLOW_REGISTER',4,'是否允许用户注册',3,'0:关闭注册\r\n1:允许注册','是否开放用户注册',1379504487,1379504580,1,'1',3),(27,'CODEMIRROR_THEME',4,'预览插件的CodeMirror主题',4,'3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight','详情见CodeMirror官网',1379814385,1384740813,1,'ambiance',3),(28,'DATA_BACKUP_PATH',1,'数据库备份根路径',4,'','路径必须以 / 结尾',1381482411,1381482411,1,'./Data/',5),(29,'DATA_BACKUP_PART_SIZE',0,'数据库备份卷大小',4,'','该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M',1381482488,1381729564,1,'20971520',7),(30,'DATA_BACKUP_COMPRESS',4,'数据库备份文件是否启用压缩',4,'0:不压缩\r\n1:启用压缩','压缩备份文件需要PHP环境支持gzopen,gzwrite函数',1381713345,1381729544,1,'1',9),(31,'DATA_BACKUP_COMPRESS_LEVEL',4,'数据库备份文件压缩级别',4,'1:普通\r\n4:一般\r\n9:最高','数据库备份文件的压缩级别，该配置在开启压缩时生效',1381713408,1381713408,1,'9',10),(32,'DEVELOP_MODE',4,'开启开发者模式',4,'0:关闭\r\n1:开启','是否开启开发者模式',1383105995,1383291877,1,'1',11),(33,'ALLOW_VISIT',3,'不受限控制器方法',0,'','',1386644047,1386644741,1,'0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture',0),(34,'DENY_VISIT',3,'超管专限控制器方法',0,'','仅超级管理员可访问的控制器方法',1386644141,1386644659,1,'0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree',0),(35,'REPLY_LIST_ROWS',0,'回复列表每页条数',2,'','',1386645376,1387178083,1,'10',0),(36,'ADMIN_ALLOW_IP',2,'后台允许访问IP',4,'','多个用逗号分隔，如果不配置表示不限制IP访问',1387165454,1387165553,1,'',12),(37,'SHOW_PAGE_TRACE',4,'是否显示页面Trace',4,'0:关闭\r\n1:开启','是否显示页面Trace信息',1387165685,1387165685,1,'0',1),(38,'RSS_LASTADD',0,'频道上线通知',0,'','',0,0,0,'1445589974',0);
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_document`
--

DROP TABLE IF EXISTS `sys_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_document`
--

LOCK TABLES `sys_document` WRITE;
/*!40000 ALTER TABLE `sys_document` DISABLE KEYS */;
INSERT INTO `sys_document` VALUES (1,1,'','OneThink1.0正式版发布',2,'大家期待的OneThink正式版发布',0,0,2,2,0,0,0,1,0,0,14,0,0,0,1387260660,1387263112,1),(2,1,'','123456',2,'',0,0,2,2,0,0,0,1,0,0,0,0,0,0,1441866701,1441866704,-1),(3,1,'','dsfasdf',2,'',0,0,2,2,0,0,0,1,0,0,8,0,0,0,1441967350,1441967350,1);
/*!40000 ALTER TABLE `sys_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_document_article`
--

DROP TABLE IF EXISTS `sys_document_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_document_article`
--

LOCK TABLES `sys_document_article` WRITE;
/*!40000 ALTER TABLE `sys_document_article` DISABLE KEYS */;
INSERT INTO `sys_document_article` VALUES (1,0,'<h1>\r\n	OneThink1.0正式版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013</strong> \r\n</p>','',0),(2,0,'fasdfsf','',0),(3,0,'sadfsdfasf','',0);
/*!40000 ALTER TABLE `sys_document_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_document_download`
--

DROP TABLE IF EXISTS `sys_document_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_document_download`
--

LOCK TABLES `sys_document_download` WRITE;
/*!40000 ALTER TABLE `sys_document_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_document_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_hooks`
--

DROP TABLE IF EXISTS `sys_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_hooks`
--

LOCK TABLES `sys_hooks` WRITE;
/*!40000 ALTER TABLE `sys_hooks` DISABLE KEYS */;
INSERT INTO `sys_hooks` VALUES (1,'pageHeader','页面header钩子，一般用于加载插件CSS文件和代码',1,0,''),(2,'pageFooter','页面footer钩子，一般用于加载插件JS文件和JS代码',1,0,'ReturnTop'),(3,'documentEditForm','添加编辑表单的 扩展内容钩子',1,0,'Attachment'),(4,'documentDetailAfter','文档末尾显示',1,0,'Attachment,SocialComment'),(5,'documentDetailBefore','页面内容前显示用钩子',1,0,''),(6,'documentSaveComplete','保存文档数据后的扩展钩子',2,0,'Attachment'),(7,'documentEditFormContent','添加编辑表单的内容显示钩子',1,0,'Editor'),(8,'adminArticleEdit','后台内容编辑页编辑器',1,1378982734,'EditorForAdmin'),(13,'AdminIndex','首页小格子个性化显示',1,1382596073,'SiteStat,SystemInfo,DevTeam'),(14,'topicComment','评论提交方式扩展钩子。',1,1380163518,'Editor'),(16,'app_begin','应用开始',2,1384481614,'');
/*!40000 ALTER TABLE `sys_hooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_member`
--

DROP TABLE IF EXISTS `sys_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_member`
--

LOCK TABLES `sys_member` WRITE;
/*!40000 ALTER TABLE `sys_member` DISABLE KEYS */;
INSERT INTO `sys_member` VALUES (1,'admin',0,'0000-00-00','',230,58,0,1441866638,1996883812,1452739204,1),(2,'zhengwu01',0,'0000-00-00','',10,1,0,0,1996883812,1445494407,1),(3,'编辑部',0,'0000-00-00','',10,7,0,0,1996816381,1445512173,1),(4,'kanduyunying',0,'0000-00-00','',10,1,0,0,1996883812,1445594055,1),(5,'gabb',0,'0000-00-00','',20,5,0,0,2101482608,1452481509,1);
/*!40000 ALTER TABLE `sys_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'首页',0,1,'Index/index',0,'','',0),(2,'内容',0,2,'Article/mydocument',0,'','',0),(3,'文档列表',2,0,'article/index',1,'','内容',0),(4,'新增',3,0,'article/add',0,'','',0),(5,'编辑',3,0,'article/edit',0,'','',0),(6,'改变状态',3,0,'article/setStatus',0,'','',0),(7,'保存',3,0,'article/update',0,'','',0),(8,'保存草稿',3,0,'article/autoSave',0,'','',0),(9,'移动',3,0,'article/move',0,'','',0),(10,'复制',3,0,'article/copy',0,'','',0),(11,'粘贴',3,0,'article/paste',0,'','',0),(12,'导入',3,0,'article/batchOperate',0,'','',0),(13,'回收站',2,0,'article/recycle',1,'','内容',0),(14,'还原',13,0,'article/permit',0,'','',0),(15,'清空',13,0,'article/clear',0,'','',0),(16,'用户',0,3,'User/index',0,'','',0),(17,'用户信息',16,0,'User/index',0,'','用户管理',0),(18,'新增用户',17,0,'User/add',0,'添加新用户','',0),(19,'用户行为',16,0,'User/action',0,'','行为管理',0),(20,'新增用户行为',19,0,'User/addaction',0,'','',0),(21,'编辑用户行为',19,0,'User/editaction',0,'','',0),(22,'保存用户行为',19,0,'User/saveAction',0,'\"用户->用户行为\"保存编辑和新增的用户行为','',0),(23,'变更行为状态',19,0,'User/setStatus',0,'\"用户->用户行为\"中的启用,禁用和删除权限','',0),(24,'禁用会员',19,0,'User/changeStatus?method=forbidUser',0,'\"用户->用户信息\"中的禁用','',0),(25,'启用会员',19,0,'User/changeStatus?method=resumeUser',0,'\"用户->用户信息\"中的启用','',0),(26,'删除会员',19,0,'User/changeStatus?method=deleteUser',0,'\"用户->用户信息\"中的删除','',0),(27,'权限管理',16,0,'AuthManager/index',0,'','用户管理',0),(28,'删除',27,0,'AuthManager/changeStatus?method=deleteGroup',0,'删除用户组','',0),(29,'禁用',27,0,'AuthManager/changeStatus?method=forbidGroup',0,'禁用用户组','',0),(30,'恢复',27,0,'AuthManager/changeStatus?method=resumeGroup',0,'恢复已禁用的用户组','',0),(31,'新增',27,0,'AuthManager/createGroup',0,'创建新的用户组','',0),(32,'编辑',27,0,'AuthManager/editGroup',0,'编辑用户组名称和描述','',0),(33,'保存用户组',27,0,'AuthManager/writeGroup',0,'新增和编辑用户组的\"保存\"按钮','',0),(34,'授权',27,0,'AuthManager/group',0,'\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组','',0),(35,'访问授权',27,0,'AuthManager/access',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮','',0),(36,'成员授权',27,0,'AuthManager/user',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮','',0),(37,'解除授权',27,0,'AuthManager/removeFromGroup',0,'\"成员授权\"列表页内的解除授权操作按钮','',0),(38,'保存成员授权',27,0,'AuthManager/addToGroup',0,'\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)','',0),(39,'分类授权',27,0,'AuthManager/category',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮','',0),(40,'保存分类授权',27,0,'AuthManager/addToCategory',0,'\"分类授权\"页面的\"保存\"按钮','',0),(41,'模型授权',27,0,'AuthManager/modelauth',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮','',0),(42,'保存模型授权',27,0,'AuthManager/addToModel',0,'\"分类授权\"页面的\"保存\"按钮','',0),(43,'扩展',0,7,'Addons/index',0,'','',0),(44,'插件管理',43,1,'Addons/index',0,'','扩展',0),(45,'创建',44,0,'Addons/create',0,'服务器上创建插件结构向导','',0),(46,'检测创建',44,0,'Addons/checkForm',0,'检测插件是否可以创建','',0),(47,'预览',44,0,'Addons/preview',0,'预览插件定义类文件','',0),(48,'快速生成插件',44,0,'Addons/build',0,'开始生成插件结构','',0),(49,'设置',44,0,'Addons/config',0,'设置插件配置','',0),(50,'禁用',44,0,'Addons/disable',0,'禁用插件','',0),(51,'启用',44,0,'Addons/enable',0,'启用插件','',0),(52,'安装',44,0,'Addons/install',0,'安装插件','',0),(53,'卸载',44,0,'Addons/uninstall',0,'卸载插件','',0),(54,'更新配置',44,0,'Addons/saveconfig',0,'更新插件配置处理','',0),(55,'插件后台列表',44,0,'Addons/adminList',0,'','',0),(56,'URL方式访问插件',44,0,'Addons/execute',0,'控制是否有权限通过url访问插件控制器方法','',0),(57,'钩子管理',43,2,'Addons/hooks',0,'','扩展',0),(58,'模型管理',68,3,'Model/index',0,'','系统设置',0),(59,'新增',58,0,'model/add',0,'','',0),(60,'编辑',58,0,'model/edit',0,'','',0),(61,'改变状态',58,0,'model/setStatus',0,'','',0),(62,'保存数据',58,0,'model/update',0,'','',0),(63,'属性管理',68,0,'Attribute/index',1,'网站属性配置。','',0),(64,'新增',63,0,'Attribute/add',0,'','',0),(65,'编辑',63,0,'Attribute/edit',0,'','',0),(66,'改变状态',63,0,'Attribute/setStatus',0,'','',0),(67,'保存数据',63,0,'Attribute/update',0,'','',0),(68,'系统',0,4,'Config/group',0,'','',0),(69,'网站设置',68,1,'Config/group',0,'','系统设置',0),(70,'配置管理',68,4,'Config/index',0,'','系统设置',0),(71,'编辑',70,0,'Config/edit',0,'新增编辑和保存配置','',0),(72,'删除',70,0,'Config/del',0,'删除配置','',0),(73,'新增',70,0,'Config/add',0,'新增配置','',0),(74,'保存',70,0,'Config/save',0,'保存配置','',0),(75,'菜单管理',68,5,'Menu/index',0,'','系统设置',0),(76,'导航管理',68,6,'Channel/index',0,'','系统设置',0),(77,'新增',76,0,'Channel/add',0,'','',0),(78,'编辑',76,0,'Channel/edit',0,'','',0),(79,'删除',76,0,'Channel/del',0,'','',0),(80,'分类管理',68,2,'Category/index',0,'','系统设置',0),(81,'编辑',80,0,'Category/edit',0,'编辑和保存栏目分类','',0),(82,'新增',80,0,'Category/add',0,'新增栏目分类','',0),(83,'删除',80,0,'Category/remove',0,'删除栏目分类','',0),(84,'移动',80,0,'Category/operate/type/move',0,'移动栏目分类','',0),(85,'合并',80,0,'Category/operate/type/merge',0,'合并栏目分类','',0),(86,'备份数据库',68,0,'Database/index?type=export',0,'','数据备份',0),(87,'备份',86,0,'Database/export',0,'备份数据库','',0),(88,'优化表',86,0,'Database/optimize',0,'优化数据表','',0),(89,'修复表',86,0,'Database/repair',0,'修复数据表','',0),(90,'还原数据库',68,0,'Database/index?type=import',0,'','数据备份',0),(91,'恢复',90,0,'Database/import',0,'数据库恢复','',0),(92,'删除',90,0,'Database/del',0,'删除备份文件','',0),(93,'其他',0,5,'other',1,'','',0),(96,'新增',75,0,'Menu/add',0,'','系统设置',0),(98,'编辑',75,0,'Menu/edit',0,'','',0),(104,'下载管理',102,0,'Think/lists?model=download',0,'','',0),(105,'配置管理',102,0,'Think/lists?model=config',0,'','',0),(106,'行为日志',16,0,'Action/actionlog',0,'','行为管理',0),(108,'修改密码',16,0,'User/updatePassword',1,'','',0),(109,'修改昵称',16,0,'User/updateNickname',1,'','',0),(110,'查看行为日志',106,0,'action/edit',1,'','',0),(112,'新增数据',58,0,'think/add',1,'','',0),(113,'编辑数据',58,0,'think/edit',1,'','',0),(114,'导入',75,0,'Menu/import',0,'','',0),(115,'生成',58,0,'Model/generate',0,'','',0),(116,'新增钩子',57,0,'Addons/addHook',0,'','',0),(117,'编辑钩子',57,0,'Addons/edithook',0,'','',0),(118,'文档排序',3,0,'Article/sort',1,'','',0),(119,'排序',70,0,'Config/sort',1,'','',0),(120,'排序',75,0,'Menu/sort',1,'','',0),(121,'排序',76,0,'Channel/sort',1,'','',0),(122,'App',0,45,'AppMenu/index',0,'','',0),(123,'区块管理',122,2,'AppBlock/index',0,'','默认',0),(124,'修改',123,0,'AppBlock/edit',0,'','',0),(125,'类型管理',122,3,'AppType/index',0,'','默认',0),(126,'修改',125,0,'AppType/edit',0,'','',0),(127,'新增',123,0,'AppBlock/add',0,'','',0),(128,'新增',125,0,'AppType/add',0,'','',0),(132,'菜单管理',122,1,'AppMenu/index',0,'','',0),(131,'版本管理',144,4,'AppVersion/index',0,'','',0),(133,'新增',132,0,'AppMenu/add',0,'','',0),(134,'修改',132,0,'AppMenu/edit',0,'','',0),(135,'订阅管理',122,0,'AppRss/index',1,'','订阅',0),(136,'分类管理',122,0,'AppRssCategory/index',1,'','订阅',0),(137,'新增',135,0,'AppRss/add',0,'','',0),(138,'修改',135,0,'AppRss/edit',0,'','',0),(139,'新增',136,0,'AppRssCategory/add',0,'','',0),(140,'修改',136,0,'AppRssCategory/edit',0,'','',0),(141,'新增',131,0,'AppVersion/add',0,'','',0),(142,'修改',131,0,'AppVersion/edit',0,'','',0),(146,'上传',144,0,'AppOs/upload',0,'','',0),(144,'OS管理',122,0,'AppOs/index',1,'','默认',0),(145,'修改',144,0,'AppOs/edit',0,'','',0),(147,'上线通知',122,0,'AppRss/notify',1,'','订阅',0),(148,'缓存更新',122,0,'AppCache/clear',0,'','默认',0);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_model`
--

DROP TABLE IF EXISTS `sys_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文档模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_model`
--

LOCK TABLES `sys_model` WRITE;
/*!40000 ALTER TABLE `sys_model` DISABLE KEYS */;
INSERT INTO `sys_model` VALUES (1,'document','基础文档',0,'',1,'{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}','1:基础','','','','','id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除',0,'','',1383891233,1384507827,1,'MyISAM'),(2,'article','文章',1,'',1,'{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}','1:基础,2:扩展','','','','','id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容',0,'','',1383891243,1387260622,1,'MyISAM'),(3,'download','下载',1,'',1,'{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}','1:基础,2:扩展','','','','','id:编号\r\ntitle:标题',0,'','',1383891252,1387260449,1,'MyISAM');
/*!40000 ALTER TABLE `sys_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_picture`
--

DROP TABLE IF EXISTS `sys_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_picture`
--

LOCK TABLES `sys_picture` WRITE;
/*!40000 ALTER TABLE `sys_picture` DISABLE KEYS */;
INSERT INTO `sys_picture` VALUES (1,'/Uploads/Picture/2015-10-14/561e033bb4f9d.png','','189d3cabb7abfdc3c6b30d33faa80093','93f457132df01aacf70be96d54081942fed149fd',1,1444807483),(2,'/Uploads/Picture/2015-10-16/56207507d24f0.png','','b6ea0c5e111bd477f006f16c59bb3456','ae0da659e767c342a798349adc93d9758599e05e',1,1444967687),(3,'/Uploads/Picture/2015-10-22/56289653b1ede.jpg','','993f57f445b1c375ea4aff7b69ac5c4f','daf8d078b45a5a36fa2363844acb080db8f71e8a',1,1445500499),(4,'/Uploads/Picture/2015-10-22/562896578a6f1.jpg','','bc030ab769c026ba24146dd0abc60aca','057754424ab915b65da3817614ec7d18787239c9',1,1445500503),(5,'/Uploads/Picture/2015-10-22/5628aca48b69c.png','','17f26f9259080df71a155894b857992c','20074b76f9ad3ebec3eee564731f7e73ee6f14ff',1,1445506212),(6,'/Uploads/Picture/2015-10-22/5628acb1af93e.png','','18835158e4eab0daf06650f6719bbdc3','2b8a53eb84b71e58cc5c366bc0e851f708463997',1,1445506225),(7,'/Uploads/Picture/2015-10-22/5628ace0b136c.png','','7bad89d5d4c38dbf6df0a981ec2c1ecc','3ed8c3fb37542337faf86a159fdb1520cba0a864',1,1445506272),(8,'/Uploads/Picture/2015-10-22/5628acfb2be3d.png','','c529a5d6f91dee98e50c53604cf6eb6f','409dd1a536b616aac4415200ec0042050da6ccbe',1,1445506299),(9,'/Uploads/Picture/2015-10-22/5628ad0c4050f.png','','27b2f03bb99b9f1b0d260a3d78c47451','8bc59c984c34457c7d22fafdefb76ed8eab97455',1,1445506316),(10,'/Uploads/Picture/2015-10-22/5628ada08deb7.png','','2a6520fc5089eade53f20641924df5d5','8924496e2c38328ee1bc9675c2bf8aec31b9ccc1',1,1445506464),(11,'/Uploads/Picture/2015-10-22/5628add0650c4.png','','40d90d09b603150347dad0596e6aa662','f6135ef07af0ca665efe8a16644d0f993a674508',1,1445506512),(12,'/Uploads/Picture/2015-10-22/5628ade8d3f73.png','','982c435d8dbecedd23939937bcaf6a65','3a5e9a15abfaf345645867be08471ce84feed0fc',1,1445506536),(13,'/Uploads/Picture/2015-10-22/5628ae26e893a.png','','5d98a6cbcd77168a890669a0be48bec2','4f52cea845b5fb425b3c6014046e866d27f29017',1,1445506598),(14,'/Uploads/Picture/2015-10-22/5628aea2da175.png','','16e04b5c94f981a7dd0b9fb33f18a6e7','bf40c929c4d567544ff8ab6f52f2708a5639cf0f',1,1445506722),(15,'/Uploads/Picture/2015-10-22/5628aec7c1ae8.png','','c3133bf2f077def768efc9f8284968ed','5bc6efb2be2ea41b8ae5f9d3908e137ee813cc6b',1,1445506759),(16,'/Uploads/Picture/2015-10-22/5628aefc4fb51.png','','b49eaeef71c84eec7ea6ce7926ab1cc2','536131f0daafca46542988037dec2336298624e5',1,1445506812),(17,'/Uploads/Picture/2015-10-22/5628af7748543.png','','79a4a8776d7e58806976df0be87ec626','1a56ed88ad71589b54b656ec8b5f8b9b18ea4e35',1,1445506935),(18,'/Uploads/Picture/2015-10-22/5628b1da73186.png','','4f1027c4cc675856e897d49382f82c69','2f29d434502f2bf308cd0124828fb97b4dd5682b',1,1445507546),(19,'/Uploads/Picture/2015-10-22/5628b31c4af1d.png','','7c0c447329a114699506514087f547b7','1aa430e075500818f58402a006aba5cdb48f14e5',1,1445507868),(20,'/Uploads/Picture/2015-10-22/5628b33405a09.png','','cddce9315d572f02b6cbde19fd62dc03','d6a01413671d1f5ef9e85fcf92c2a39c91d71269',1,1445507891),(21,'/Uploads/Picture/2015-10-22/5628b37685873.png','','8ddd9974252796fc28d65d810b6d6a05','d800944a30fdc2cd26bd197e07065ac0389b7c98',1,1445507958),(22,'/Uploads/Picture/2015-10-22/5628b3874e5b6.png','','707d9b1e849f35aeabe046167249970c','5927a0f2c9e56be9814a462630ec7234ef88f456',1,1445507975),(23,'/Uploads/Picture/2015-10-23/562a075f26d03.gif','','e97a67be5c58bf9e34cc8215b2fc372d','32f24a131b37ea5c5b86c2b2c618236a62aa32db',1,1445594975),(24,'/Uploads/Picture/2015-10-26/562d8d75831fd.png','','8d935c8bf256ed67de357c12fb1ff2e0','4fe153f7a6130643dd6d3c8350cc34b1621b1411',1,1445825909),(25,'/Uploads/Picture/2015-10-26/562d8de55b899.png','','bcb8bfcbe7d453988a23feb502af8035','35414c29b842cd2f97d062efa1b0add294bc9007',1,1445826021),(26,'/Uploads/Picture/2015-10-26/562d8df27beaa.png','','6db5faa30050c92a0064bc65ebf74ef8','be1d6af0cdf5d2e4feac7cbc55e64d9310badf85',1,1445826034),(27,'/Uploads/Picture/2015-10-26/562d8e07f2b10.png','','bf7096742cb7013ef2b61c6adedce201','d9abc5b4a66b2e4f7edd626853fd5ab6186318b7',1,1445826055),(28,'/Uploads/Picture/2015-10-26/562d8e278d9f7.png','','f5a1e43e81159cffa843d82ebb540043','d607ebaba564392e981192e674895cd684b11ab5',1,1445826087),(29,'/Uploads/Picture/2015-11-05/563ac5e02e25e.png','','15596893f2d943180819356ea7839045','dead83ddfe7529c15eda106dd3a329d027abe7cb',1,1446692320),(30,'/Uploads/Picture/2016-01-06/568ce56ea8f03.gif','','b3ca0de163287c6f373a3c3c61742a12','c78cb93332e2c8b9e1e2320c159d255644db3ef4',1,1452074350),(31,'/Uploads/Picture/2016-01-07/568dbf2c0aaf0.png','','abcdb8a26b6981ca5af8a7838ff78905','bf1ebe306f6e249fbb896b050e9bbda42fbea3c9',1,1452130092),(32,'/Uploads/Picture/2016-01-07/568dbf5d3e4c0.png','','aa48d12df8ef5d3ef600089ebb4528b4','337c86b732855e78189a24370ab6e1f4e23a684c',1,1452130141),(33,'/Uploads/Picture/2016-01-07/568e02a67e172.jpg','','7eadbb68ccb8908742c3f3059809edba','902272679d9c7b5dac2e575311bad5939b10fcdf',1,1452147366),(34,'/Uploads/Picture/2016-01-07/568e1abb8db09.png','','94cca1eaaa8526359dd6447d2fe5f488','1ee3b3df3901004237204b6e013722f2a67547c0',1,1452153531),(35,'/Uploads/Picture/2016-01-08/568f25421a84a.png','','627c12a652a76e6b1470a6a1bd3481f1','0793cc7c8b9e71286715c000ecb63286949263c6',1,1452221762);
/*!40000 ALTER TABLE `sys_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ucenter_admin`
--

DROP TABLE IF EXISTS `sys_ucenter_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ucenter_admin`
--

LOCK TABLES `sys_ucenter_admin` WRITE;
/*!40000 ALTER TABLE `sys_ucenter_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_ucenter_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ucenter_app`
--

DROP TABLE IF EXISTS `sys_ucenter_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ucenter_app`
--

LOCK TABLES `sys_ucenter_app` WRITE;
/*!40000 ALTER TABLE `sys_ucenter_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_ucenter_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ucenter_member`
--

DROP TABLE IF EXISTS `sys_ucenter_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ucenter_member`
--

LOCK TABLES `sys_ucenter_member` WRITE;
/*!40000 ALTER TABLE `sys_ucenter_member` DISABLE KEYS */;
INSERT INTO `sys_ucenter_member` VALUES (1,'admin','3b56f08fbaf5492a427d7486da949e1a','785444925@qq.com','',1452076078,1996883812,1452739204,1996883812,1452076078,1),(2,'zhengwu01','51089e08495309ebf97234ab0935d2a3','liaomanjin@cditv.tv','',1445494125,1996883812,1445494407,1996883812,1445494125,1),(3,'编辑部','81b15afe561054b3ca460c03d83d95e4','huangyuqi@cditv.tv','',1445498200,1996883812,1445512173,1996816381,1445498200,1),(4,'kanduyunying','81b15afe561054b3ca460c03d83d95e4','liushitao@cditv.tv','',1445591314,1996883812,1445594055,1996883812,1445591314,1),(5,'gabb','a6bcf76e7ca8af3dfc497990a00048f9','gabb@qq.com','',1452220118,1996883812,1452481509,2101482608,1452220118,1);
/*!40000 ALTER TABLE `sys_ucenter_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ucenter_setting`
--

DROP TABLE IF EXISTS `sys_ucenter_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ucenter_setting`
--

LOCK TABLES `sys_ucenter_setting` WRITE;
/*!40000 ALTER TABLE `sys_ucenter_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_ucenter_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_url`
--

DROP TABLE IF EXISTS `sys_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_url`
--

LOCK TABLES `sys_url` WRITE;
/*!40000 ALTER TABLE `sys_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_userdata`
--

DROP TABLE IF EXISTS `sys_userdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_userdata`
--

LOCK TABLES `sys_userdata` WRITE;
/*!40000 ALTER TABLE `sys_userdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_userdata` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-05  4:00:03
