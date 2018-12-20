/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_localhost
Source Server Version : 50621
Source Host           : 127.0.0.1:3306
Source Database       : homestead

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2018-12-20 14:30:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for issues
-- ----------------------------
DROP TABLE IF EXISTS `issues`;
CREATE TABLE `issues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `deadline` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `project_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `sprint_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `priority_order` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_prev` int(10) unsigned DEFAULT NULL,
  `sort_next` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issues_project_id_foreign` (`project_id`),
  KEY `issues_user_id_foreign` (`user_id`),
  KEY `issues_type_id_foreign` (`type_id`),
  KEY `issues_sprint_id_foreign` (`sprint_id`),
  KEY `issues_status_id_foreign` (`status_id`),
  CONSTRAINT `issues_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `issues_sprint_id_foreign` FOREIGN KEY (`sprint_id`) REFERENCES `sprints` (`id`),
  CONSTRAINT `issues_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `issue_statuses` (`id`),
  CONSTRAINT `issues_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `issue_types` (`id`),
  CONSTRAINT `issues_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of issues
-- ----------------------------
INSERT INTO `issues` VALUES ('1', '工作一', '这是我第一个工作计划', null, '2018-12-20 01:15:14', '2018-12-20 01:15:51', '1', '1', '2', '1', '2', '0', null, null);

-- ----------------------------
-- Table structure for issue_statuses
-- ----------------------------
DROP TABLE IF EXISTS `issue_statuses`;
CREATE TABLE `issue_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `machine_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `issue_statuses_machine_name_unique` (`machine_name`),
  UNIQUE KEY `issue_statuses_label_unique` (`label`),
  UNIQUE KEY `issue_statuses_sort_order_unique` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of issue_statuses
-- ----------------------------
INSERT INTO `issue_statuses` VALUES ('1', 'archive', 'Archive', '0');
INSERT INTO `issue_statuses` VALUES ('2', 'todo', 'To Do', '1');
INSERT INTO `issue_statuses` VALUES ('3', 'inprogress', 'In Progress', '2');
INSERT INTO `issue_statuses` VALUES ('4', 'complete', 'Complete', '3');

-- ----------------------------
-- Table structure for issue_types
-- ----------------------------
DROP TABLE IF EXISTS `issue_types`;
CREATE TABLE `issue_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `machine_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `issue_types_machine_name_unique` (`machine_name`),
  UNIQUE KEY `issue_types_label_unique` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of issue_types
-- ----------------------------
INSERT INTO `issue_types` VALUES ('1', 'bug', 'Bug');
INSERT INTO `issue_types` VALUES ('2', 'task', 'Task');
INSERT INTO `issue_types` VALUES ('3', 'story', 'Story');
INSERT INTO `issue_types` VALUES ('4', 'improvement', 'Improvement');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('2015_03_21_193347_created_projects_table', '1');
INSERT INTO `migrations` VALUES ('2015_03_23_002913_create_sprint_statuses_table', '1');
INSERT INTO `migrations` VALUES ('2015_03_23_002915_create_issue_types_table', '1');
INSERT INTO `migrations` VALUES ('2015_03_23_002916_create_sprints_table', '1');
INSERT INTO `migrations` VALUES ('2015_03_23_002917_create_issue_statuses_table', '1');
INSERT INTO `migrations` VALUES ('2015_03_23_002918_create_issues_table', '1');
INSERT INTO `migrations` VALUES ('2015_06_20_144945_add_sort_order_columns_issues_table', '1');
INSERT INTO `migrations` VALUES ('2016_10_17_091929_add_default_value_to_issues_description_field', '1');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `issue_prefix` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deadline` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `projects_name_unique` (`name`),
  UNIQUE KEY `projects_slug_unique` (`slug`),
  UNIQUE KEY `projects_issue_prefix_unique` (`issue_prefix`),
  KEY `projects_user_id_foreign` (`user_id`),
  CONSTRAINT `projects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of projects
-- ----------------------------
INSERT INTO `projects` VALUES ('1', '1', 'project1', 'head', 'qes', '2018-12-20 23:55:55', '2018-12-20 01:13:57', '2018-12-20 01:13:57');

-- ----------------------------
-- Table structure for sprints
-- ----------------------------
DROP TABLE IF EXISTS `sprints`;
CREATE TABLE `sprints` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `machine_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `from_date` timestamp NULL DEFAULT NULL,
  `to_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `project_id` int(10) unsigned NOT NULL,
  `sort_order` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sprints_machine_name_project_id_unique` (`machine_name`,`project_id`),
  UNIQUE KEY `sprints_sort_order_project_id_unique` (`sort_order`,`project_id`),
  KEY `sprints_status_id_foreign` (`status_id`),
  KEY `sprints_project_id_foreign` (`project_id`),
  KEY `sprints_name_index` (`name`),
  KEY `sprints_machine_name_index` (`machine_name`),
  KEY `sprints_sort_order_index` (`sort_order`),
  CONSTRAINT `sprints_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `sprints_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `sprint_statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sprints
-- ----------------------------
INSERT INTO `sprints` VALUES ('1', 'Backlog', 'backlog', null, null, '2018-12-20 01:13:57', '2018-12-20 01:13:57', '1', '0', '2');

-- ----------------------------
-- Table structure for sprint_statuses
-- ----------------------------
DROP TABLE IF EXISTS `sprint_statuses`;
CREATE TABLE `sprint_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `machine_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sprint_statuses_machine_name_unique` (`machine_name`),
  UNIQUE KEY `sprint_statuses_label_unique` (`label`),
  UNIQUE KEY `sprint_statuses_sort_order_unique` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sprint_statuses
-- ----------------------------
INSERT INTO `sprint_statuses` VALUES ('1', 'archive', 'Archive', '0');
INSERT INTO `sprint_statuses` VALUES ('2', 'inactive', 'Inactive', '1');
INSERT INTO `sprint_statuses` VALUES ('3', 'active', 'Active', '2');
INSERT INTO `sprint_statuses` VALUES ('4', 'complete', 'Complete', '3');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '1391930327@qq.com', '$2y$10$wPRohfwSGT3qW2JbvrKT8umIp3MqoHaYPMggYpmIsYwtb1pJx9c7m', 'MNEv5Qrrl5nI3kT0NXFAOVttpBzPCr64dh0yiLWMecHOiz5Y1Q50DXvJKdJr', '2018-12-20 01:12:15', '2018-12-20 01:17:12');
