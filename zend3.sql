/*
Navicat MySQL Data Transfer

Source Server         : OPPO
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : zend3

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-10-19 14:20:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('20160924162137');
INSERT INTO `migrations` VALUES ('20161209132215');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'post.view', ' View any post.', '2018-07-18 15:16:55');
INSERT INTO `permission` VALUES ('2', 'post.edit', 'Edit any post.', '2018-07-18 15:17:17');
INSERT INTO `permission` VALUES ('3', 'post.own.edit', 'Edit only owned posts.', '2018-07-18 15:17:38');
INSERT INTO `permission` VALUES ('4', 'post.publish', 'Publish any post.', '2018-07-18 15:17:53');
INSERT INTO `permission` VALUES ('5', 'post.own.publish', 'Publish only owned post.', '2018-07-18 15:18:10');
INSERT INTO `permission` VALUES ('6', 'post.delete', 'Delete any post.', '2018-07-18 15:18:28');
INSERT INTO `permission` VALUES ('7', 'user.manage', 'Manage users (add/edit/delete).', '2018-07-18 15:28:49');
INSERT INTO `permission` VALUES ('8', 'role.manage', 'Manage roles (add/edit/delete).', '2018-07-18 15:29:05');
INSERT INTO `permission` VALUES ('9', 'permission.manage', 'Manage permissions (add/edit/delete).', '2018-07-18 15:29:22');
INSERT INTO `permission` VALUES ('10', 'profile.any.view', 'View any user profile in the system.', '2018-07-18 15:29:36');
INSERT INTO `permission` VALUES ('11', 'profile.own.view', 'View own profile.', '2018-07-18 15:29:51');
INSERT INTO `permission` VALUES ('13', 'index.manage', 'Manager Index controller', '2018-08-30 16:51:50');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'Viewer', 'Can read any post and can do nothing else.', '2018-07-18 15:12:05');
INSERT INTO `role` VALUES ('2', 'Author', 'Can view posts plus create a post, edit it and finally publish it.', '2018-07-18 15:12:23');
INSERT INTO `role` VALUES ('3', 'Editor', 'Can view posts plus edit and publish any post.', '2018-07-18 15:12:40');
INSERT INTO `role` VALUES ('4', 'Administrator', ' Can do anything a Viewer and Editor can do plus delete posts.', '2018-07-18 15:12:59');

-- ----------------------------
-- Table structure for role_hierarchy
-- ----------------------------
DROP TABLE IF EXISTS `role_hierarchy`;
CREATE TABLE `role_hierarchy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_role_id` int(11) NOT NULL,
  `child_role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AB8EFB72A44B56EA` (`parent_role_id`),
  KEY `IDX_AB8EFB72B4B76AB7` (`child_role_id`),
  CONSTRAINT `role_role_child_role_id_fk` FOREIGN KEY (`child_role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_role_parent_role_id_fk` FOREIGN KEY (`parent_role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_hierarchy
-- ----------------------------

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6F7DF886D60322AC` (`role_id`),
  KEY `IDX_6F7DF886FED90CCA` (`permission_id`),
  CONSTRAINT `role_permission_permission_id_fk` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permission_role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '4', '1');
INSERT INTO `role_permission` VALUES ('2', '4', '2');
INSERT INTO `role_permission` VALUES ('3', '4', '3');
INSERT INTO `role_permission` VALUES ('4', '4', '4');
INSERT INTO `role_permission` VALUES ('5', '4', '5');
INSERT INTO `role_permission` VALUES ('6', '4', '6');
INSERT INTO `role_permission` VALUES ('7', '4', '7');
INSERT INTO `role_permission` VALUES ('8', '4', '8');
INSERT INTO `role_permission` VALUES ('9', '4', '9');
INSERT INTO `role_permission` VALUES ('10', '4', '10');
INSERT INTO `role_permission` VALUES ('11', '4', '11');
INSERT INTO `role_permission` VALUES ('13', '4', '13');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `full_name` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `pwd_reset_token` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pwd_reset_token_creation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_idx` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', 'admin@example.com', 'Admin', '$2y$10$HFD0fS2gLPBBxoCgL0yBy.RJBpYOlUJkbgtLyDo/eOdLgO8U33WG2', '1', '2018-08-20 05:01:55', null, null);
INSERT INTO `user` VALUES ('3', 'theng@example.com', 'Theng', '$2y$10$HFD0fS2gLPBBxoCgL0yBy.RJBpYOlUJkbgtLyDo/eOdLgO8U33WG2', '1', '2018-08-25 16:24:49', null, null);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2DE8C6A3A76ED395` (`user_id`),
  KEY `IDX_2DE8C6A3D60322AC` (`role_id`),
  CONSTRAINT `user_role_role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('3', '2', '4');
INSERT INTO `user_role` VALUES ('4', '3', '1');
