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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (1,0,1,0,'2023-05-03 16:16:02.040115','总公司','K科技有限公司','nest_rbac'),(2,1,1,0,'2023-05-03 16:16:46.557000','杭州分部','杭州技术部','nest_rbac');
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'首页','dashboard',1,0,0),(2,'权限管理','perm',1,0,0),(3,'用户管理','perm_users',1,0,2),(4,'角色管理','perm_roles',1,0,2),(5,'系统设置','system',1,0,0),(6,'资源管理','system_menus',1,0,5),(7,'文件列表','system_oss',1,0,5),(8,'编辑','perm_users:edit',3,0,3),(9,'启用/禁用','perm_users:updateStatus',3,0,3),(10,'重置密码','perm_users:resetPw',3,0,3),(11,'批量导入','perm_users:createMultUser',3,0,3),(12,'新增','perm_roles:create',3,0,4),(13,'编辑','perm_roles:edit',3,0,4),(14,'删除','perm_roles:del',3,0,4),(15,'关联用户/解除关联','perm_roles:bind',3,0,4),(16,'添加','system_menus:create',3,0,6),(17,'编辑','system_menus:edit',3,0,6),(18,'删除','system_menus:del',3,0,6),(23,'测试按钮','123232',3,0,0),(25,'部门管理','perm_depts',1,0,2),(26,'岗位管理','perm_posts',1,0,2),(27,'新增','perm_posts:create',3,0,26),(28,'编辑','perm_posts:edit',3,0,26),(29,'删除','perm_posts:del',3,0,26),(30,'删除','perm_depts:del',3,0,25),(31,'编辑','perm_depts:edit',3,0,25),(32,'新增','perm_depts:create',3,0,25);
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu_perm`
--

/*!40000 ALTER TABLE `sys_menu_perm` DISABLE KEYS */;
INSERT INTO `sys_menu_perm` VALUES (2,3,'/api/user/list','GET'),(3,4,'/api/role/list','GET'),(4,4,'/api/role/one/:id/perms','GET'),(5,4,'/api/user/list','GET'),(6,6,'/api/menu/all','GET'),(7,6,'/api/menu/one/:parentId/btns','GET'),(8,6,'/api/menu/one/:id/menu-perm','GET'),(9,7,'/api/oss/list','GET'),(10,8,'/api/user/one/:id','GET'),(11,8,'/api/user','PUT'),(12,9,'/api/user/status/change','PUT'),(13,10,'/api/user/password/reset/:userId','PUT'),(15,12,'/api/role','POST'),(16,13,'/api/role','PUT'),(17,14,'/api/role/:id','DELETE'),(18,15,'/api/user/role/update','POST'),(20,17,'/api/menu','PUT'),(21,16,'/api/menu','POST'),(22,18,'/api/menu/:id','DELETE'),(24,11,'/api/user/import','POST'),(27,25,'/api/dept/list','GET'),(28,26,'/api/post/list','GET'),(32,29,'/api/post/:id','DELETE'),(36,27,'/api/post','POST'),(37,28,'/api/post/:id','GET'),(38,28,'/api/post','PUT'),(39,30,'/api/dept/:id','DELETE'),(40,31,'/api/dept','PUT'),(41,32,'/api/dept','POST');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oss`
--

/*!40000 ALTER TABLE `sys_oss` DISABLE KEYS */;
INSERT INTO `sys_oss` VALUES (1,'http://localhost:8081/static/b37f8d762222ffbf280fa708b4b57f4a.jpg',59975,'D:\\programmeWork\\nest_rbac\\nest-admin\\upload\\347811e1f6da4221a09cee7f3c7b03ce.jpeg','2021-11-23 13:13:01.820103','头像',1,'admin','image/jpeg'),(2,'http://localhost:8081/static/67f57d2058984103afc54d164aff5648.jpeg',59767,'D:\\programmeWork\\nest_rbac\\nest-admin\\upload\\aa96fb05de9945f690e6d4b8a0f9b5e4.jpeg','2021-11-24 11:51:01.567326','头像',1,'admin','image/jpeg'),(3,'http://localhost:8081/static/59f38c077c758158297d70061431429b.jpg',59516,'D:\\programmeWork\\nest_rbac\\nest-admin\\upload\\67f57d2058984103afc54d164aff5648.jpeg','2021-11-24 12:31:04.633617','头像',1,'admin','image/jpeg'),(4,'http://localhost:8081/static/用户导入模板.xlsx',10956,'D:\\programmeWork\\nest_rbac\\nest-admin\\upload\\用户导入模板.xlsx','2023-04-24 15:48:09.000000','文档',1,'admin','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
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
INSERT INTO `sys_post` VALUES (2,'hr',0,'山东科技山东科技花生壳',1,'2022-01-06 12:32:01.513000','人事'),(3,'it',1,'写代码',0,'2022-01-05 20:32:56.250000','技术员');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'测试','测试橘色','2021-11-18 13:41:50.187783','2021-11-18 13:41:50.187783'),(2,'测试22','测试呀','2021-12-30 15:22:18.454332','2023-06-22 17:46:20.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,8),(5,1,9),(6,1,10),(7,1,11),(8,1,4),(9,1,12),(10,1,13),(11,1,14),(12,1,15),(13,1,5),(14,1,6),(15,1,16),(16,1,17),(17,1,18),(18,1,7),(21,2,2),(22,2,4),(23,2,3),(24,2,1);
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
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '所属状态: 1-有效，0-禁用',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '头像地址',
  `type` tinyint NOT NULL DEFAULT '1' COMMENT '帐号类型：0-超管， 1-普通用户',
  `create_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户登录账号',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户手机号码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'$2a$10$NSrq5H2chKrcMy/AeiHqK.C1ER40JmLWCh/OIpXkL/nZ4lHN/epse','$2a$10$JChCYKwJYbVV4ANalu2tBe','123@qq.com',1,'http://localhost:8081/static/67f57d2058984103afc54d164aff5648.jpeg',0,'2021-11-15 08:09:23.000000','2024-08-14 07:52:22.043989','admin',''),(2,'$2a$10$NSrq5H2chKrcMy/AeiHqK.C1ER40JmLWCh/OIpXkL/nZ4lHN/epse','$2a$10$NSrq5H2chKrcMy/AeiHqK.','12345@qq.com',1,'http://localhost:8081/static/67f57d2058984103afc54d164aff5648.jpeg',1,'2021-12-30 07:25:47.000000','2024-08-14 02:15:52.767852','kirk','');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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

-- Dump completed on 2024-08-14 15:52:46
