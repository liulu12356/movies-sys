/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : movies

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 28/09/2022 19:35:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `state` int(0) NOT NULL COMMENT '0-有效，1-无效',
  `created_time` datetime(0) NOT NULL COMMENT '创建日期',
  `modified_time` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '爱情', '爱情大片', 1, '2022-09-14 15:16:12', '2022-09-22 09:00:12');
INSERT INTO `category` VALUES (2, '动作', '武打戏', 1, '2022-09-16 10:30:43', '2022-09-22 09:00:09');
INSERT INTO `category` VALUES (3, '喜剧', '让人开怀大笑', 1, '2022-09-16 21:31:43', '2022-09-21 10:07:51');
INSERT INTO `category` VALUES (4, '动作', '跌宕起伏', 0, '2022-09-17 14:19:04', '2022-09-23 16:42:26');
INSERT INTO `category` VALUES (5, '悬疑', '绞尽脑汁', 1, '2022-09-17 14:19:27', '2022-09-22 09:00:24');
INSERT INTO `category` VALUES (6, '纪录片', '玩的就是真实', 1, '2022-09-17 14:20:11', '2022-09-22 09:00:27');
INSERT INTO `category` VALUES (7, '恐怖', '吓人1', 1, '2022-09-21 10:00:41', '2022-09-21 10:08:21');
INSERT INTO `category` VALUES (8, '好莱坞', '好莱坞大片', 1, '2022-09-23 11:07:27', NULL);
INSERT INTO `category` VALUES (9, '漫威', '漫威系列电影', 1, '2022-09-23 11:07:39', NULL);

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简要描述',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '详情',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电影图片存储在服务器上的路径',
  `state` int(0) NULL DEFAULT NULL,
  `created_time` datetime(0) NOT NULL,
  `modified_time` datetime(0) NULL DEFAULT NULL,
  `status` int(0) NOT NULL COMMENT '0 - 未排期 1-排期中 2 - 排期完毕',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES (1, '《那些年》', '青春时期林更新和杨傲的爱恨情仇', '回忆那些青春期懵懂的爱恋44', '\\adminlte\\images\\01.jpg', 1, '2022-09-14 19:07:14', '2022-09-19 21:13:51', 1);
INSERT INTO `movie` VALUES (2, '《那些年2》', '青春时期傲神和坤坤的爱恨情仇', '回忆那些青春期畸形的爱恋1\n', '\\adminlte\\images\\01.jpg', 1, '2022-09-14 20:53:44', '2022-09-19 21:00:36', 2);
INSERT INTO `movie` VALUES (3, '222', '111', '2123', '\\adminlte\\images\\63787472329913.png', 1, '2022-09-16 20:21:28', '2022-09-23 16:48:15', 0);
INSERT INTO `movie` VALUES (4, '《夏洛特烦恼》', '爆火的喜剧片', '沈腾主演', '\\adminlte\\images\\02.jpg', 1, '2022-09-16 20:28:57', '2022-09-19 20:41:27', 0);
INSERT INTO `movie` VALUES (5, '《胡桃出击》', '胡桃率先出击', '胡桃大小姐', '\\adminlte\\images\\03.png', 1, '2022-09-16 20:32:30', NULL, 0);
INSERT INTO `movie` VALUES (7, '《傲神出击》', '强势的杨傲横扫一切', '全杀了', '\\adminlte\\images\\63783562766156.png', 1, '2022-09-16 20:41:46', NULL, 2);
INSERT INTO `movie` VALUES (8, '《神龙之帝》', '神龙无敌', '计算机视觉', '\\adminlte\\images\\63783562766156.png', 1, '2022-09-16 20:43:45', NULL, 2);
INSERT INTO `movie` VALUES (9, '121', 'E3WE', '2ED2E', '\\adminlte\\images\\Naraka 2022_2_25 21_14_36.png', 0, '2022-09-16 21:37:30', '2022-09-16 21:37:52', 0);
INSERT INTO `movie` VALUES (10, '打的', '深刻的', '上道了', '\\adminlte\\images\\63782897334342.png', 1, '2022-09-19 10:44:40', NULL, 2);
INSERT INTO `movie` VALUES (11, '333', '444', '555', '\\adminlte\\images\\狗狗头像.png', 1, '2022-09-19 20:15:58', NULL, 0);
INSERT INTO `movie` VALUES (15, '鸡哥那些年', '练习两年半', '唱跳rap', '\\adminlte\\images\\张伟么.jpg', 1, '2022-09-22 08:38:47', NULL, 1);
INSERT INTO `movie` VALUES (16, '《奇异博士》', '会魔法的超级英雄', '卷毛的超级魔法，地球的隐形守护者', '\\adminlte\\images\\奇异博士.jpg', 1, '2022-09-23 11:09:40', '2022-09-23 11:17:04', 0);

-- ----------------------------
-- Table structure for movie_category
-- ----------------------------
DROP TABLE IF EXISTS `movie_category`;
CREATE TABLE `movie_category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `movie_id` int(0) NOT NULL,
  `category_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie_category
-- ----------------------------
INSERT INTO `movie_category` VALUES (5, 5, 1);
INSERT INTO `movie_category` VALUES (6, 7, 1);
INSERT INTO `movie_category` VALUES (7, 10, 1);
INSERT INTO `movie_category` VALUES (8, 10, 2);
INSERT INTO `movie_category` VALUES (11, 11, 2);
INSERT INTO `movie_category` VALUES (12, 11, 3);
INSERT INTO `movie_category` VALUES (16, 4, 2);
INSERT INTO `movie_category` VALUES (17, 4, 3);
INSERT INTO `movie_category` VALUES (30, 2, 1);
INSERT INTO `movie_category` VALUES (31, 2, 2);
INSERT INTO `movie_category` VALUES (32, 1, 1);
INSERT INTO `movie_category` VALUES (33, 1, 2);
INSERT INTO `movie_category` VALUES (36, 13, 1);
INSERT INTO `movie_category` VALUES (39, 15, 1);
INSERT INTO `movie_category` VALUES (40, 15, 2);
INSERT INTO `movie_category` VALUES (51, 16, 8);
INSERT INTO `movie_category` VALUES (52, 16, 9);
INSERT INTO `movie_category` VALUES (53, 3, 1);
INSERT INTO `movie_category` VALUES (54, 3, 2);

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `movie_id` int(0) NOT NULL,
  `start` datetime(0) NOT NULL COMMENT '档期的起点',
  `end` datetime(0) NOT NULL COMMENT '档期的终点',
  `status` int(0) NOT NULL DEFAULT 0 COMMENT '0 - 未放票 1-放票完毕',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES (1, 2, '2022-09-20 00:29:00', '2022-09-20 02:29:00', 1);
INSERT INTO `schedule` VALUES (2, 2, '2022-09-20 05:26:00', '2022-09-20 07:26:00', 1);
INSERT INTO `schedule` VALUES (3, 7, '2022-09-20 03:06:00', '2022-09-20 05:06:00', 0);
INSERT INTO `schedule` VALUES (4, 7, '2022-09-20 07:38:00', '2022-09-20 09:40:00', 1);
INSERT INTO `schedule` VALUES (5, 8, '2022-09-20 16:00:00', '2022-09-20 18:00:00', 0);
INSERT INTO `schedule` VALUES (6, 8, '2022-09-20 22:00:00', '2022-09-21 00:00:00', 1);
INSERT INTO `schedule` VALUES (7, 8, '2022-09-21 04:00:00', '2022-09-21 06:00:00', 1);
INSERT INTO `schedule` VALUES (8, 7, '2022-09-21 23:45:00', '2022-09-22 01:45:00', 0);
INSERT INTO `schedule` VALUES (9, 15, '2022-09-22 17:00:00', '2022-09-22 19:00:00', 0);
INSERT INTO `schedule` VALUES (10, 10, '2022-09-23 06:33:00', '2022-09-23 07:35:00', 0);

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `tid` int(0) NOT NULL AUTO_INCREMENT,
  `movie_id` int(0) NOT NULL,
  `schedule_id` int(0) NOT NULL,
  `sequence_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` int(0) NOT NULL,
  `created_time` datetime(0) NOT NULL,
  `modified_time` datetime(0) NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL COMMENT '购买人id',
  `buy_time` datetime(0) NULL DEFAULT NULL COMMENT '购买时间',
  `version` int(0) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES (1, 2, 1, 'A0', 0, '2022-09-20 17:22:36', NULL, 8, '2022-09-22 21:31:31', 1);
INSERT INTO `ticket` VALUES (2, 2, 1, 'A1', 0, '2022-09-20 17:22:36', NULL, 8, '2022-09-22 21:31:31', 1);
INSERT INTO `ticket` VALUES (3, 2, 1, 'A2', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (4, 2, 1, 'A3', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (5, 2, 1, 'A4', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (6, 2, 1, 'A5', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (7, 2, 1, 'A6', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (8, 2, 1, 'A7', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (9, 2, 1, 'A8', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (10, 2, 1, 'A9', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (11, 2, 1, 'B0', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (12, 2, 1, 'B1', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (13, 2, 1, 'B2', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (14, 2, 1, 'B3', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (15, 2, 1, 'B4', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (16, 2, 1, 'B5', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (17, 2, 1, 'B6', 0, '2022-09-20 17:22:36', NULL, 8, '2022-09-22 21:31:31', 1);
INSERT INTO `ticket` VALUES (18, 2, 1, 'B7', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (19, 2, 1, 'B8', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (20, 2, 1, 'B9', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (21, 2, 1, 'C0', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (22, 2, 1, 'C1', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (23, 2, 1, 'C2', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (24, 2, 1, 'C3', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (25, 2, 1, 'C4', 0, '2022-09-20 17:22:36', NULL, 8, '2022-09-22 21:31:31', 1);
INSERT INTO `ticket` VALUES (26, 2, 1, 'C5', 0, '2022-09-20 17:22:36', NULL, 8, '2022-09-22 21:31:31', 1);
INSERT INTO `ticket` VALUES (27, 2, 1, 'C6', 0, '2022-09-20 17:22:36', NULL, 8, '2022-09-22 21:31:31', 1);
INSERT INTO `ticket` VALUES (28, 2, 1, 'C7', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (29, 2, 1, 'C8', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (30, 2, 1, 'C9', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (31, 2, 1, 'D0', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (32, 2, 1, 'D1', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (33, 2, 1, 'D2', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (34, 2, 1, 'D3', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (35, 2, 1, 'D4', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (36, 2, 1, 'D5', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (37, 2, 1, 'D6', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (38, 2, 1, 'D7', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (39, 2, 1, 'D8', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (40, 2, 1, 'D9', 1, '2022-09-20 17:22:36', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (41, 2, 2, 'A0', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (42, 2, 2, 'A1', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (43, 2, 2, 'A2', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (44, 2, 2, 'A3', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (45, 2, 2, 'A4', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (46, 2, 2, 'A5', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (47, 2, 2, 'A6', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (48, 2, 2, 'A7', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (49, 2, 2, 'A8', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (50, 2, 2, 'A9', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (51, 2, 2, 'B0', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (52, 2, 2, 'B1', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (53, 2, 2, 'B2', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (54, 2, 2, 'B3', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (55, 2, 2, 'B4', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (56, 2, 2, 'B5', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (57, 2, 2, 'B6', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (58, 2, 2, 'B7', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (59, 2, 2, 'B8', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (60, 2, 2, 'B9', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (61, 2, 2, 'C0', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (62, 2, 2, 'C1', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (63, 2, 2, 'C2', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (64, 2, 2, 'C3', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (65, 2, 2, 'C4', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (66, 2, 2, 'C5', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (67, 2, 2, 'C6', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (68, 2, 2, 'C7', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (69, 2, 2, 'C8', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (70, 2, 2, 'C9', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (71, 2, 2, 'D0', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (72, 2, 2, 'D1', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (73, 2, 2, 'D2', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (74, 2, 2, 'D3', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (75, 2, 2, 'D4', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (76, 2, 2, 'D5', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (77, 2, 2, 'D6', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (78, 2, 2, 'D7', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (79, 2, 2, 'D8', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (80, 2, 2, 'D9', 1, '2022-09-20 17:27:30', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (81, 8, 6, 'A0', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (82, 8, 6, 'A1', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (83, 8, 6, 'A2', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (84, 8, 6, 'A3', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (85, 8, 6, 'A4', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (86, 8, 6, 'A5', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (87, 8, 6, 'A6', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (88, 8, 6, 'A7', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (89, 8, 6, 'A8', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (90, 8, 6, 'A9', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (91, 8, 6, 'B0', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (92, 8, 6, 'B1', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (93, 8, 6, 'B2', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (94, 8, 6, 'B3', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (95, 8, 6, 'B4', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (96, 8, 6, 'B5', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (97, 8, 6, 'B6', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (98, 8, 6, 'B7', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (99, 8, 6, 'B8', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (100, 8, 6, 'B9', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (101, 8, 6, 'C0', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (102, 8, 6, 'C1', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (103, 8, 6, 'C2', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (104, 8, 6, 'C3', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (105, 8, 6, 'C4', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (106, 8, 6, 'C5', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (107, 8, 6, 'C6', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (108, 8, 6, 'C7', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (109, 8, 6, 'C8', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (110, 8, 6, 'C9', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (111, 8, 6, 'D0', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (112, 8, 6, 'D1', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (113, 8, 6, 'D2', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (114, 8, 6, 'D3', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (115, 8, 6, 'D4', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (116, 8, 6, 'D5', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (117, 8, 6, 'D6', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (118, 8, 6, 'D7', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (119, 8, 6, 'D8', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (120, 8, 6, 'D9', 1, '2022-09-20 17:29:23', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (121, 8, 7, 'A0', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (122, 8, 7, 'A1', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (123, 8, 7, 'A2', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (124, 8, 7, 'A3', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (125, 8, 7, 'A4', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (126, 8, 7, 'A5', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (127, 8, 7, 'A6', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (128, 8, 7, 'A7', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (129, 8, 7, 'A8', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (130, 8, 7, 'A9', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (131, 8, 7, 'B0', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (132, 8, 7, 'B1', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (133, 8, 7, 'B2', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (134, 8, 7, 'B3', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (135, 8, 7, 'B4', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (136, 8, 7, 'B5', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (137, 8, 7, 'B6', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (138, 8, 7, 'B7', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (139, 8, 7, 'B8', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (140, 8, 7, 'B9', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (141, 8, 7, 'C0', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (142, 8, 7, 'C1', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (143, 8, 7, 'C2', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (144, 8, 7, 'C3', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (145, 8, 7, 'C4', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (146, 8, 7, 'C5', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (147, 8, 7, 'C6', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (148, 8, 7, 'C7', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (149, 8, 7, 'C8', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (150, 8, 7, 'C9', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (151, 8, 7, 'D0', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (152, 8, 7, 'D1', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (153, 8, 7, 'D2', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (154, 8, 7, 'D3', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (155, 8, 7, 'D4', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (156, 8, 7, 'D5', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (157, 8, 7, 'D6', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (158, 8, 7, 'D7', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (159, 8, 7, 'D8', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (160, 8, 7, 'D9', 1, '2022-09-20 19:20:38', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (161, 7, 4, 'A0', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (162, 7, 4, 'A1', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (163, 7, 4, 'A2', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (164, 7, 4, 'A3', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (165, 7, 4, 'A4', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (166, 7, 4, 'A5', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (167, 7, 4, 'A6', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (168, 7, 4, 'A7', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (169, 7, 4, 'A8', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (170, 7, 4, 'A9', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (171, 7, 4, 'B0', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (172, 7, 4, 'B1', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (173, 7, 4, 'B2', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (174, 7, 4, 'B3', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (175, 7, 4, 'B4', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (176, 7, 4, 'B5', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (177, 7, 4, 'B6', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (178, 7, 4, 'B7', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (179, 7, 4, 'B8', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (180, 7, 4, 'B9', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (181, 7, 4, 'C0', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (182, 7, 4, 'C1', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (183, 7, 4, 'C2', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (184, 7, 4, 'C3', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (185, 7, 4, 'C4', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (186, 7, 4, 'C5', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (187, 7, 4, 'C6', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (188, 7, 4, 'C7', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (189, 7, 4, 'C8', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (190, 7, 4, 'C9', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (191, 7, 4, 'D0', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (192, 7, 4, 'D1', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (193, 7, 4, 'D2', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (194, 7, 4, 'D3', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (195, 7, 4, 'D4', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (196, 7, 4, 'D5', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (197, 7, 4, 'D6', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (198, 7, 4, 'D7', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (199, 7, 4, 'D8', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);
INSERT INTO `ticket` VALUES (200, 7, 4, 'D9', 1, '2022-09-22 21:32:01', NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `role` int(0) NOT NULL COMMENT '0为管理员，1为用户',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'cxk', '111', 0);
INSERT INTO `user` VALUES (2, '独秀', '111', 1);
INSERT INTO `user` VALUES (3, 'emp', '111', 0);
INSERT INTO `user` VALUES (4, 'duxiu', '111', 0);
INSERT INTO `user` VALUES (7, 'heiloo', '111', 0);
INSERT INTO `user` VALUES (8, 'user', 'user', 1);
INSERT INTO `user` VALUES (9, 'admin', 'admin', 0);

SET FOREIGN_KEY_CHECKS = 1;
