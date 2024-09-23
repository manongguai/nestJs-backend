-- MySQL dump 10.13  Distrib 8.2.0, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: nest_rbac
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NOT NULL COMMENT '父级部门 id',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '部门状态，1-有效，0-禁用',
  `order_num` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门名称',
  `leader` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门负责人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (1,0,1,0,'2023-05-03 16:16:02.040115','总公司','K科技有限公司','kirk'),(2,1,1,0,'2023-05-03 16:16:46.557000','杭州分部','杭州技术部','nest_rbac');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单/按钮唯一标识，由前端路由name,用于控制菜单按钮显隐',
  `type` int NOT NULL COMMENT '菜单类型， 1-菜单/目录 2-tabs 3-按钮',
  `order_num` int NOT NULL DEFAULT '0' COMMENT '排序',
  `parent_id` bigint NOT NULL,
  `path` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单跳转路径，按钮可以选填',
  `icon` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'首页','home',1,0,0,'/home',''),(2,'权限管理','perm',1,1,0,'/perm',''),(3,'用户管理','perm_users',1,11,2,'/perm/users',''),(4,'角色管理','perm_roles',1,12,2,'/perm/roles',''),(5,'系统设置','system',1,2,0,'/system',''),(6,'菜单管理','system_menus',1,21,5,'/system/menus',''),(7,'文件列表','system_oss',1,22,5,'/system/oss',''),(8,'编辑','perm_users:edit',3,0,3,'',''),(9,'启用/禁用','perm_users:updateStatus',3,0,3,'',''),(10,'重置密码','perm_users:resetPw',3,0,3,'',''),(11,'批量导入','perm_users:createMultUser',3,0,3,'',''),(12,'新增','perm_roles:create',3,0,4,'',''),(13,'编辑','perm_roles:edit',3,0,4,'',''),(14,'删除','perm_roles:del',3,0,4,'',''),(15,'关联用户/解除关联','perm_roles:bind',3,0,4,'',''),(16,'添加','system_menus:create',3,0,6,'',''),(17,'编辑','system_menus:edit',3,0,6,'',''),(18,'删除','system_menus:del',3,0,6,'',''),(25,'部门管理','perm_depts',1,14,2,'/perm/depts',''),(26,'岗位管理','perm_posts',1,15,2,'/perm/posts',''),(27,'新增','perm_posts:create',3,0,26,'',''),(28,'编辑','perm_posts:edit',3,0,26,'',''),(29,'删除','perm_posts:del',3,0,26,'',''),(30,'删除','perm_depts:del',3,0,25,'',''),(31,'编辑','perm_depts:edit',3,0,25,'',''),(32,'新增','perm_depts:create',3,0,25,'',''),(37,'测试按钮','1122',3,16,2,'',''),(39,'通用组件','common',1,0,0,'common',''),(41,'常用图标','common:icons',1,0,39,'/common/icons','');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;

--
-- Table structure for table `sys_menu_perm`
--

DROP TABLE IF EXISTS `sys_menu_perm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu_perm` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `menu_id` bigint NOT NULL COMMENT '菜单id',
  `api_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '该菜单所能调用的 api 接口，必须是本应用的接口，否则设置了也不生效',
  `api_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '该菜单所能调用 api 接口的 method 方法',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu_perm`
--

/*!40000 ALTER TABLE `sys_menu_perm` DISABLE KEYS */;
INSERT INTO `sys_menu_perm` VALUES (10,8,'/api/user/one/:id','GET'),(11,8,'/api/user','PUT'),(12,9,'/api/user/status/change','PUT'),(13,10,'/api/user/password/reset/:userId','PUT'),(15,12,'/api/role','POST'),(16,13,'/api/role','PUT'),(17,14,'/api/role/:id','DELETE'),(18,15,'/api/user/role/update','POST'),(20,17,'/api/menu','PUT'),(21,16,'/api/menu','POST'),(22,18,'/api/menu/:id','DELETE'),(24,11,'/api/user/import','POST'),(32,29,'/api/post/:id','DELETE'),(36,27,'/api/post','POST'),(37,28,'/api/post/:id','GET'),(38,28,'/api/post','PUT'),(39,30,'/api/dept/:id','DELETE'),(40,31,'/api/dept','PUT'),(41,32,'/api/dept','POST'),(159,2,'/api/user','PUT'),(160,2,'/api/user','POST'),(161,2,'/api/user/:id','DELETE'),(162,2,'/api/user/status/change','PUT'),(163,2,'/api/user/password/reset/:userId','PUT'),(164,2,'/api/user/import','POST'),(165,2,'/api/perm/all','GET'),(166,2,'/api/perm/user','GET'),(167,2,'/api/perm/menu','GET'),(168,2,'/api/menu/all','GET'),(169,2,'/api/menu/one/:parentId/btns','GET'),(170,2,'/api/menu/one/:id/menu-perm','GET'),(171,2,'/api/role/list','GET'),(172,2,'/api/role/listAndCount','GET'),(173,2,'/api/role/one/:id/perms','GET'),(174,2,'/api/role','POST'),(175,2,'/api/role','PUT'),(176,2,'/api/role/:id','DELETE'),(177,2,'/api/dept','POST'),(178,2,'/api/dept','PUT'),(179,2,'/api/dept/list','GET'),(180,2,'/api/dept/:id','DELETE'),(181,2,'/api/post','POST'),(182,2,'/api/post','PUT'),(183,2,'/api/post/list','GET'),(184,2,'/api/post/:id','GET'),(185,2,'/api/post/:id','DELETE'),(186,2,'/api/user/:id/role','GET'),(187,2,'/api/user/role/update','POST'),(188,2,'/api/user/one/info','GET'),(189,2,'/api/user/list','GET'),(204,1,'/api/auth/register','POST'),(205,1,'/api/auth/login','POST'),(206,1,'/api/auth/update/token','POST'),(207,1,'/api/user/one/info','GET'),(208,1,'/api/user/:id/role','GET'),(209,1,'/api/perm/menu','GET'),(210,5,'/api/menu','POST'),(211,5,'/api/menu','PUT'),(212,5,'/api/menu/one/:id/menu-perm','GET'),(213,5,'/api/menu/one/:parentId/btns','GET'),(214,5,'/api/menu/all','GET'),(215,5,'/api/oss/upload','POST'),(216,5,'/api/oss/list','GET'),(217,3,'/api/user/list','GET'),(218,4,'/api/role/list','GET'),(219,4,'/api/role/one/:id/perms','GET'),(220,4,'/api/user/list','GET'),(221,25,'/api/dept/list','GET'),(222,26,'/api/post/list','GET'),(223,6,'/api/menu/all','GET'),(224,6,'/api/menu/one/:parentId/btns','GET'),(225,6,'/api/menu/one/:id/menu-perm','GET'),(226,7,'/api/oss/list','GET');
/*!40000 ALTER TABLE `sys_menu_perm` ENABLE KEYS */;

--
-- Table structure for table `sys_oss`
--

DROP TABLE IF EXISTS `sys_oss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oss` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件 url',
  `size` int NOT NULL COMMENT '文件size',
  `location` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件存放位置',
  `create_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `business` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务描述字段，可以字符串，也可以是 JSON 字符串',
  `user_id` bigint NOT NULL COMMENT '上传用户id',
  `user_account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '上传用户帐号',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件mimetype类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oss`
--

/*!40000 ALTER TABLE `sys_oss` DISABLE KEYS */;
INSERT INTO `sys_oss` VALUES (1,'http://localhost:8081/static/b37f8d762222ffbf280fa708b4b57f4a.jpg',59975,'D:\\programmeWork\\nest_rbac\\nest-admin\\upload\\347811e1f6da4221a09cee7f3c7b03ce.jpeg','2021-11-23 13:13:01.820103','头像',1,'admin','image/jpeg'),(2,'http://localhost:8081/static/67f57d2058984103afc54d164aff5648.jpeg',59767,'D:\\programmeWork\\nest_rbac\\nest-admin\\upload\\aa96fb05de9945f690e6d4b8a0f9b5e4.jpeg','2021-11-24 11:51:01.567326','头像',1,'admin','image/jpeg'),(3,'http://localhost:8081/static/59f38c077c758158297d70061431429b.jpg',59516,'D:\\programmeWork\\nest_rbac\\nest-admin\\upload\\67f57d2058984103afc54d164aff5648.jpeg','2021-11-24 12:31:04.633617','头像',1,'admin','image/jpeg'),(4,'http://localhost:8081/static/用户导入模板.xlsx',10956,'D:\\programmeWork\\nest_rbac\\nest-admin\\upload\\用户导入模板.xlsx','2023-04-24 15:48:09.000000','文档',1,'admin','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'),(6,'http://localhost:8081/static/ef1664409a984142a36be3153fd55164.jpeg',26311,'/Users/kirk/Desktop/project/node_project/im/apps/servers/upload/ef1664409a984142a36be3153fd55164.jpeg','2024-09-11 07:52:53.142184','',1,'admin','image/jpeg'),(7,'http://localhost:8081/static/96788156d43e425b94ce4b89953eb9c7.jpeg',26311,'/Users/kirk/Desktop/project/node_project/im/apps/servers/upload/96788156d43e425b94ce4b89953eb9c7.jpeg','2024-09-11 07:53:26.733524','',1,'admin','image/jpeg'),(8,'http://localhost:8081/static/ad541bc736634d5887f9f0e660ada3f0.jpeg',26311,'/Users/kirk/Desktop/project/node_project/im/apps/servers/upload/ad541bc736634d5887f9f0e660ada3f0.jpeg','2024-09-11 07:54:01.027260','',1,'admin','image/jpeg'),(9,'http://localhost:8081/static/dbdd4d953aee47f3aa99c23bb837a8c4.jpeg',26311,'/Users/kirk/Desktop/project/node_project/im/apps/servers/upload/dbdd4d953aee47f3aa99c23bb837a8c4.jpeg','2024-09-11 08:02:56.096313','',1,'admin','image/jpeg'),(10,'http://localhost:8081/static/51365c9c5b9d41c2a35643c845a4a2a9.jpeg',26311,'/Users/kirk/Desktop/project/node_project/im/apps/servers/upload/51365c9c5b9d41c2a35643c845a4a2a9.jpeg','2024-09-11 08:04:00.369282','',1,'admin','image/jpeg'),(11,'http://localhost:8081/static/e5fcfee25f18466e9d253843817c3cfe.jpeg',26311,'/Users/kirk/Desktop/project/node_project/im/apps/servers/upload/e5fcfee25f18466e9d253843817c3cfe.jpeg','2024-09-11 08:06:26.870203','',1,'admin','image/jpeg'),(12,'http://localhost:8081/static/a6f8842262204ae29df275ffeff54a95.jpeg',26311,'/Users/kirk/Desktop/project/node_project/im/apps/servers/upload/a6f8842262204ae29df275ffeff54a95.jpeg','2024-09-11 08:07:50.486453','',1,'admin','image/jpeg'),(13,'http://localhost:8081/static/30a47009082a465bbb1c94c75d72595f.jpeg',26311,'/Users/kirk/Desktop/project/node_project/im/apps/servers/upload/30a47009082a465bbb1c94c75d72595f.jpeg','2024-09-11 08:07:54.262656','',1,'admin','image/jpeg'),(14,'http://localhost:8081/static/c371131d55ef45868273c5676f562f1b.jpeg',26311,'/Users/kirk/Desktop/project/node_project/im/apps/servers/upload/c371131d55ef45868273c5676f562f1b.jpeg','2024-09-11 08:08:40.834864','',1,'admin','image/jpeg'),(15,'http://localhost:8081/static/fa99ece6a117496f91c0675f00d13fb3.jpeg',30970,'/Users/kirk/Desktop/project/node_project/im/apps/servers/upload/fa99ece6a117496f91c0675f00d13fb3.jpeg','2024-09-11 08:08:46.039169','',1,'admin','image/jpeg'),(16,'http://localhost:8081/static/0b6df6573670432bbb9ce70a15ae478e.webp',14832,'/Users/kirk/Desktop/project/node_project/im/apps/servers/upload/0b6df6573670432bbb9ce70a15ae478e.webp','2024-09-11 08:13:52.338504','',1,'admin','image/webp'),(17,'http://localhost:8081/static/214513869c03473d910bc5de1ca623a3.webp',14832,'/Users/kirk/Desktop/project/node_project/im/apps/servers/upload/214513869c03473d910bc5de1ca623a3.webp','2024-09-11 08:15:01.361528','',1,'admin','image/webp'),(18,'http://localhost:8081/static/d0ac0692051c4fdb906de364c590c1e3.jpeg',46011,'/Users/kirk/Desktop/project/node_project/im/apps/servers/upload/d0ac0692051c4fdb906de364c590c1e3.jpeg','2024-09-11 08:19:20.249363','',1,'admin','image/jpeg'),(19,'http://localhost:8081/static/7460252781da4c4d95626300f382d431.webp',14832,'/Users/kirk/Desktop/project/node_project/im/apps/servers/upload/7460252781da4c4d95626300f382d431.webp','2024-09-11 08:20:21.954107','',1,'admin','image/webp'),(20,'http://localhost:8081/static/d6268fb2517d4dfeb4fbb982325c6d78.mp4',15463646,'/Users/kirk/Desktop/project/node_project/im/apps/servers/upload/d6268fb2517d4dfeb4fbb982325c6d78.mp4','2024-09-11 08:25:02.265759','',1,'admin','video/mp4'),(21,'http://localhost:8081/static/47acf1c30a98446eab0363cfd926e848.jpeg',46011,'/Users/kirk/Desktop/project/node_project/im/apps/servers/upload/47acf1c30a98446eab0363cfd926e848.jpeg','2024-09-11 08:25:25.184769','',1,'admin','image/jpeg'),(22,'http://localhost:8081/static/de1dd9128cc3425bb262e28425a4f3a9.webp',10546,'/Users/kirk/Desktop/project/node_project/im/apps/servers/upload/de1dd9128cc3425bb262e28425a4f3a9.webp','2024-09-11 08:25:29.820361','',1,'admin','image/webp'),(23,'http://localhost:8081/static/70783bd5ed0343ebbae49b2dafcac555.jpeg',46011,'/Users/kirk/Desktop/project/node_project/im/apps/servers/upload/70783bd5ed0343ebbae49b2dafcac555.jpeg','2024-09-11 08:26:54.098199','',1,'admin','image/jpeg');
/*!40000 ALTER TABLE `sys_oss` ENABLE KEYS */;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '岗位状态，1-有效，0-禁用',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '备注',
  `order_num` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (2,'hr',1,'山东科技山东科技花生壳',1,'2022-01-06 12:32:01.513000','人事'),(3,'it',1,'写代码',0,'2022-01-05 20:32:56.250000','技术员');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色备注',
  `create_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'测试','测试橘色','2021-11-18 13:41:50.187783','2024-09-10 03:49:21.000000'),(2,'测试2','测试呀','2021-12-30 15:22:18.454332','2024-09-11 09:15:25.000000');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL COMMENT '角色 id',
  `menu_id` bigint NOT NULL COMMENT '菜单 id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=349 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (279,1,1),(280,1,2),(281,1,3),(282,1,8),(283,1,9),(284,1,10),(285,1,11),(286,1,4),(287,1,12),(288,1,13),(289,1,14),(290,1,15),(291,1,5),(292,1,6),(293,1,16),(294,1,17),(295,1,18),(296,1,7),(323,2,2),(324,2,4),(325,2,3),(326,2,1),(327,2,8),(328,2,9),(329,2,12),(330,2,13),(331,2,10),(332,2,11),(333,2,14),(334,2,25),(335,2,30),(336,2,31),(337,2,32),(338,2,26),(339,2,27),(340,2,28),(341,2,29),(342,2,37),(343,2,5),(344,2,6),(345,2,16),(346,2,17),(347,2,18),(348,2,7);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户登录密码',
  `salt` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '盐',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '所属状态: 1-有效，0-禁用',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '头像地址',
  `type` tinyint NOT NULL DEFAULT '1' COMMENT '帐号类型：0-超管， 1-普通用户',
  `create_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户登录账号',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户手机号码',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `deleted_at` timestamp(6) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'$2a$10$NSrq5H2chKrcMy/AeiHqK.C1ER40JmLWCh/OIpXkL/nZ4lHN/epse','$2a$10$JChCYKwJYbVV4ANalu2tBe',1,'http://localhost:8081/static/67f57d2058984103afc54d164aff5648.jpeg',0,'2021-11-15 08:09:23.000000','2024-08-14 09:16:23.909083','admin','15893608147','',NULL),(2,'$2a$10$NSrq5H2chKrcMy/AeiHqK.C1ER40JmLWCh/OIpXkL/nZ4lHN/epse','$2a$10$NSrq5H2chKrcMy/AeiHqK.',1,'http://localhost:8081/static/67f57d2058984103afc54d164aff5648.jpeg',1,'2021-12-30 07:25:47.000000','2024-08-14 09:16:23.912747','kirk','15893608148','',NULL),(3,'$2a$10$IMZSQBYgjLtKZVz9vZPD0OOWOTT1iYbaoFk9OvsvnIAIer9idCZs6','$2a$10$IMZSQBYgjLtKZVz9vZPD0O',1,'http://localhost:8081/static/b37f8d762222ffbf280fa708b4b57f4a.jpg',1,'2024-09-03 07:08:07.948646','2024-09-11 09:13:00.000000','kirk2','15893608149','jgbzql2@163.com','2024-09-11 09:13:00.000000'),(4,'$2a$10$uVOv.1K7sHoW9/AfRUTn0ODiPQMlr130CJG38ANwLnMSd0oKGxokq','$2a$10$uVOv.1K7sHoW9/AfRUTn0O',1,'http://localhost:8081/static/b37f8d762222ffbf280fa708b4b57f4a.jpg',1,'2024-09-03 07:10:00.779488','2024-09-11 09:12:57.000000','kirk4','15893608120','jgbzql@163.com','2024-09-11 09:12:57.000000'),(5,'$2a$10$miuxaU1nsJIEnf/AwQ8dbONw3HQdKyGCeYO.cd9WtS4YMxweKfap.','$2a$10$miuxaU1nsJIEnf/AwQ8dbO',1,'http://localhost:8081/static/b37f8d762222ffbf280fa708b4b57f4a.jpg',1,'2024-09-03 07:18:45.731857','2024-09-11 09:12:55.000000','kirk5','15893608111','admin.test@strapi.com','2024-09-11 09:12:55.000000'),(6,'$2a$10$CMd1MpezNnPv6rF/ktLWlOxv4lBnh935izg2k5KWqX/XsKkQBQeX6','$2a$10$CMd1MpezNnPv6rF/ktLWlO',1,'http://localhost:8081/static/b37f8d762222ffbf280fa708b4b57f4a.jpg',1,'2024-09-03 07:47:59.406891','2024-09-11 09:12:53.000000','kirk6','15893608122','jgbzql@162.com','2024-09-11 09:12:53.000000'),(7,'$2a$10$RK.qL94QMp5HQ13eBuNU8Old9CwIkJSDEO966gfuy72CDPXgeQMq6','$2a$10$RK.qL94QMp5HQ13eBuNU8O',1,'http://localhost:8081/static/b37f8d762222ffbf280fa708b4b57f4a.jpg',1,'2024-09-03 07:49:14.182858','2024-09-11 09:12:51.000000','kirk7','15893608199','jgbzql@1613.com','2024-09-11 09:12:51.000000'),(8,'$2a$10$cZVlXD4lKBlPqAqwo12hZeyz2nIoMfedOOh0/yFZYci6Uqt3cC6vC','$2a$10$cZVlXD4lKBlPqAqwo12hZe',1,'http://localhost:8081/static/b37f8d762222ffbf280fa708b4b57f4a.jpg',1,'2024-09-03 07:59:08.881633','2024-09-06 04:05:16.000000','kirk8','15893608123','2420958617@qq.com','2024-09-06 04:05:16.000000'),(9,'$2a$10$KezJXgZx6cFIb5XSSgcRGeWipJFBeGT6lzQ.rebY2k0xuVAZxpVkK','$2a$10$KezJXgZx6cFIb5XSSgcRGe',1,'http://localhost:8081/static/70783bd5ed0343ebbae49b2dafcac555.jpeg',1,'2024-09-03 08:06:57.659649','2024-09-11 09:12:49.000000','wenbo.wang','15893608142','jgbzql23@163.com','2024-09-11 09:12:49.000000'),(10,'$2a$10$Wh5CzTpBnTrCbydXCCvJruz1ill4qEcwGzf9VT5U3b8ZY/ZqES8ca','$2a$10$Wh5CzTpBnTrCbydXCCvJru',1,'http://localhost:8081/static/b37f8d762222ffbf280fa708b4b57f4a.jpg',1,'2024-09-06 09:54:31.962454','2024-09-06 09:54:40.000000','wenbo.wang2','15893601111','jgbzql22@163.com','2024-09-06 09:54:40.000000');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

--
-- Table structure for table `sys_user_dept`
--

DROP TABLE IF EXISTS `sys_user_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id',
  `dept_id` bigint NOT NULL COMMENT '部门id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_dept`
--

/*!40000 ALTER TABLE `sys_user_dept` DISABLE KEYS */;
INSERT INTO `sys_user_dept` VALUES (1,2,2);
/*!40000 ALTER TABLE `sys_user_dept` ENABLE KEYS */;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id',
  `post_id` bigint NOT NULL COMMENT '岗位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id',
  `role_id` bigint NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (33,2,2),(34,2,1);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;

--
-- Dumping routines for database 'nest_rbac'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-23 15:30:59
