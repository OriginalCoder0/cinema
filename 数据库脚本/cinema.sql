/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50550
 Source Host           : localhost:3306
 Source Schema         : cinema

 Target Server Type    : MySQL
 Target Server Version : 50550
 File Encoding         : 65001

 Date: 24/06/2021 08:16:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbadmin
-- ----------------------------
DROP TABLE IF EXISTS `tbadmin`;
CREATE TABLE `tbadmin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '123456' COMMENT '登录密码',
  `realname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `tel` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `status` int(11) NULL DEFAULT 0 COMMENT '账号状态（0-禁用  1-可用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbadmin
-- ----------------------------
INSERT INTO `tbadmin` VALUES (2, 'softeem', '123456', '软帝集团', '86639004', 0);
INSERT INTO `tbadmin` VALUES (3, 'admin', 'admin123', '狗蛋', '123456', 1);

-- ----------------------------
-- Table structure for tbhall
-- ----------------------------
DROP TABLE IF EXISTS `tbhall`;
CREATE TABLE `tbhall`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '影厅id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影厅名称',
  `halltype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影厅类型（IMAX厅,CGS中国巨幕厅,杜比全景声厅...）',
  `seatcount` int(11) NULL DEFAULT NULL COMMENT '影厅座位数',
  `seatinfo` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影厅座位布局信息',
  `status` int(1) NULL DEFAULT NULL COMMENT '影厅状态（0-未使用 1-使用中）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbmovies
-- ----------------------------
DROP TABLE IF EXISTS `tbmovies`;
CREATE TABLE `tbmovies`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '影片id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影名称',
  `img` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图片',
  `summary` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影简介',
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影类别',
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影片产地（国家）',
  `director` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导演',
  `actor` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主要演员',
  `publishtime` datetime NULL DEFAULT NULL COMMENT '上映时间',
  `rank` double(4, 1) NULL DEFAULT NULL COMMENT '电影评分',
  `status` int(1) NULL DEFAULT NULL COMMENT '影片状态 0-即将上映  1-正在热映',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbmovies
-- ----------------------------
INSERT INTO `tbmovies` VALUES (1, '了不起的老爸', 'http://qv23gzdbt.hn-bkt.clouddn.com/1.jpg', '一个患有罕见疾病却怀有“马拉松梦”的少年肖尔东（张宥浩 饰），一个固执逼迫儿子预习“盲人生活”的出租车司机父亲肖大明（王砚辉 饰），互不理解的父子俩，却在一场马拉松比赛中“互换身份”，并肩站在了起跑线上……影片通过对“命运”持有不同态度的一对单亲家庭父子，讲述了一个用爱向阳而生的故事。', '剧情,喜剧,运动', '中国大陆', '周青元', '王砚辉,张宥浩,龚蓓苾,李小胖\r\n李小胖', '2021-06-18 08:00:00', 9.3, 1);
INSERT INTO `tbmovies` VALUES (2, '守岛人', 'http://qv23gzdbt.hn-bkt.clouddn.com/2.jpg', '电影《守岛人》讲述了王继才（刘烨 饰）与其妻子王仕花（宫哲 饰）32年守护祖国边陲小岛开山岛的故事。王继才生前是江苏省灌云县开山岛民兵哨所所长，与妻子以岛为家，与海相伴，把美好的青春年华奉献给了祖国海防事业。影片选取王继才夫妇守岛生涯的经典片段和闪光瞬间，从不同侧面展现了王继才夫妇丰富的内心世界和“守岛就是守国”的家国情怀。该片不仅还原了王继才夫妇32年与恶劣自然环境顽强抗争的经历，更将主人公爱国奉献的价值追求贯穿影片始终，对于各行各业坚守平凡、创造非凡的人们，都深具心灵观照和精神滋养。', '剧情,传记', '中国大陆', '陈力', '刘烨,宫哲,侯勇,孙维民', '2021-06-18 00:00:00', 9.4, 1);
INSERT INTO `tbmovies` VALUES (3, '\r\n当男人恋爱时', 'http://qv23gzdbt.hn-bkt.clouddn.com/3.jpg', '当男人恋爱时会是什么样子？ 以讨债为生的小混混阿成（邱泽 饰）看似凶狠却本性善良，遇到了欠债人的女儿浩婷（许玮甯 饰）后，对浩婷一见钟情的阿成开始变得温柔又幼稚，笨拙地为浩婷打点一切。就在浩婷终于卸下防备接受追求的时候，他们之间却遭遇了接二连三的变故，阿成默默承受着一切。 阿成最终也没有忘记告诉浩婷那句藏在心底的表白：第一次见到你，我就喜欢你了。', '爱情,剧情', '中国台湾', '殷振豪', '邱泽,许玮甯,蔡振南,蓝苇华', '2021-06-11 16:00:00', 8.4, 1);
INSERT INTO `tbmovies` VALUES (4, '你好世界', 'http://qv23gzdbt.hn-bkt.clouddn.com/4.jpg', '在京都居住的内向男高中生直实（北村匠海 配音）的面前，突然出现从10年后穿越而来26岁的自己（松坂桃李 配音）。未来的直实告诉他，自己不久便会与琉璃（滨边美波 配音）相爱，可是之后烟花大会时她却会因为一场事故意外离世。为了拯救爱人，16岁的直实卷入了这场现实与虚拟的记忆世界，经历了一系列超乎想象的事情。即使世界毁灭，我也想再见你一面。', '爱情,奇幻,动画', '日本', '伊藤智彦', '北村匠海,松坂桃李,滨边美波,福原遥', '2021-06-11 00:00:00', 8.9, 1);
INSERT INTO `tbmovies` VALUES (5, '黑白魔女库伊拉', 'http://qv23gzdbt.hn-bkt.clouddn.com/5.jpg', '20世纪70年代朋克摇滚革命时期的伦敦，一个名叫艾丝黛拉（艾玛·斯通 饰）的年轻骗子是一个聪明又有创意的女孩，她决心用自己的设计让自己出名。她和一对欣赏她的恶作剧嗜好的小偷交上了朋友，并能够一起在伦敦的街道上建立自己的生活。有一天，艾丝黛拉的时尚品味吸引了冯 · 赫尔曼男爵夫人（艾玛·汤普森 饰）的眼球，她是一位时尚界的传奇人物，拥有毁灭性的时尚和可怕的高雅，但他们的关系引发了一系列事件，导致艾丝黛拉去拥抱她的邪恶一面,成为了兼具疯狂、时尚和报复心的库伊拉。', '喜剧,犯罪', '美国', '克雷格·吉勒斯佩', '艾玛·斯通,艾玛·汤普森,乔尔·弗莱,保罗·沃尔特·豪泽', '2021-06-06 00:00:00', 9.2, 1);
INSERT INTO `tbmovies` VALUES (6, '我没谈完的那场恋爱', 'http://qv23gzdbt.hn-bkt.clouddn.com/a.jpg', '本片讲述了两个千差万别却同样迷茫的年轻音乐人，一个是多年打拼,事业毫无起色,又屡遭生活暴击的和声歌手珊妮,一个是身患重病,隐姓埋名等待死亡降临的前摇滚乐手董东,对生命感到绝望的二人在自我了断时相遇......自杀计划流产,他们的生活也因彼此的出现发生改变。另外一个时空的故事,从珊妮意外发现的一本1970年代的日记中铺陈开来,一段没有下文的悲伤爱情竟然在珊妮的努力下尘埃落定。跟音乐、爱情和人生有关的种种,让珊妮与董东的相遇愈发神奇。千丝万缕中,是否每一种爱都能开花结果? 他们能否找到继续爱这个世界的理由?', '剧情,爱情,音乐', '中国大陆', '赵宇', '于文文,宋宁峰,刘琦,李博', '2021-06-25 08:00:00', NULL, 0);
INSERT INTO `tbmovies` VALUES (7, '完美受害人', 'http://qv23gzdbt.hn-bkt.clouddn.com/b.jpg', '看似毫无联系的两起自杀案件，却将所有的疑点指向了一位著名画家。而正当警方锁定杀人凶手时，却发现嫌疑人画家已经跳楼自杀。危机并没有结束。案件陷入了前所未有的困境，唯一的线索只剩下嫌疑人画家的前妻。死去的画家，隐藏幕后的凶手，陷入困局的警察，一个患有创伤后应激障碍的女人，一桩陈年旧事。一个巨大的秘密和一场骇人的罪恶逐渐露出水面。所以真相到底是什么？你看见的就一定是真相吗？', '悬疑,犯罪,剧情', '中国大陆', '杨泷杰', '李乃文,冯文娟,张峻宁,谭凯', '2021-06-25 00:00:00', NULL, 0);
INSERT INTO `tbmovies` VALUES (8, '寻人启示录', 'http://qv23gzdbt.hn-bkt.clouddn.com/c.jpg', '富商女儿姚瑶带着父亲的嘱托和500万现金来到一个以道德闻名的小镇，寻找当年帮助父亲的恩人，却一夜之间多人争相认领巨额奖金，到底谁才是她要寻找的人……', '剧情', '中国大陆', '秦凯', '李肖宁,苏娜,方越', '2021-06-25 00:00:00', NULL, 0);
INSERT INTO `tbmovies` VALUES (9, '\r\n李雷和韩梅梅——昨日重现', 'http://qv23gzdbt.hn-bkt.clouddn.com/d.jpg', '运动全能的中学⼥汉⼦韩梅梅，各项成绩尚可，但⼀提起英语就头疼得要命。在结束了快乐的初中⽣活后，韩梅梅和魏华、林涛等⼀起升上了⾼中，同时还有李雷。如今的李雷已是脱胎换⾻，从⼀个不起眼的⼩男⽣变成了⼜⾼⼜帅的男神，还有⼀⼝英伦范的纯正英语。韩梅梅也是不知不觉地喜欢上了李雷，却迟迟不敢开⼝，于是古灵精怪的她制定出各种作战计划，意图攻陷李雷。', '爱情,青春', '中国大陆', '杨永春', '张子枫,张逸杰,成梓宁,李砚', '2021-06-26 00:00:00', NULL, 0);
INSERT INTO `tbmovies` VALUES (10, '遇见喵星人', 'http://qv23gzdbt.hn-bkt.clouddn.com/e.jpg', '大四学生李玄武是个对数字不敏感的学生。这天，他在补考高数的考场做了一个梦， 梦里的世界大不同，穷同学秦隆变成了富二代，舅舅变成了一个骗吃骗喝的假道士，唯一不变的就是他的数学成绩依然很差，补考又没及格。天无绝人之路，空中飘来一张高数补习班的宣传单，上面还有美女讲师“小甜甜”的照片，李玄武决定去碰碰运气，偶遇美女老师朱怯怯。为了摆脱数字怪的控制，拯救小伙伴，李玄武痛定思痛，终于领悟到只有通过好好学习才能提升高数能力……', '喜剧,剧情', '中国大陆', '王佳伟', '艾伦,王智,程旭,宗一童', '2021-06-26 00:00:00', NULL, 0);

-- ----------------------------
-- Table structure for tborder
-- ----------------------------
DROP TABLE IF EXISTS `tborder`;
CREATE TABLE `tborder`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `orderno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `sid` int(11) NULL DEFAULT NULL COMMENT '排片id',
  `seatnums` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座位号（如：[[4,6],[0,0],[7,8]]）',
  `ordertime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `orderprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单价格',
  `status` int(1) NULL DEFAULT 0 COMMENT '订单状态（0-未支付 1-已支付）',
  `logicdel` int(1) NULL DEFAULT 0 COMMENT '是否删除(0-未删除 1-已删除：不在用户端显示)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_tborder_tbuser_1`(`uid`) USING BTREE,
  INDEX `fk_tborder_tbschedule_1`(`sid`) USING BTREE,
  CONSTRAINT `fk_tborder_tbschedule_1` FOREIGN KEY (`sid`) REFERENCES `tbschedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tborder_tbuser_1` FOREIGN KEY (`uid`) REFERENCES `tbuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbschedule
-- ----------------------------
DROP TABLE IF EXISTS `tbschedule`;
CREATE TABLE `tbschedule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '排片id',
  `mid` int(11) NULL DEFAULT NULL COMMENT '电影id',
  `hid` int(11) NULL DEFAULT NULL COMMENT '影厅id',
  `playtime` datetime NULL DEFAULT NULL COMMENT '放映时间',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '票价',
  `seatstatus` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影厅座位的最新状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_tbschedule_tbmovies_1`(`mid`) USING BTREE,
  INDEX `fk_tbschedule_tbhall_1`(`hid`) USING BTREE,
  CONSTRAINT `fk_tbschedule_tbhall_1` FOREIGN KEY (`hid`) REFERENCES `tbhall` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tbschedule_tbmovies_1` FOREIGN KEY (`mid`) REFERENCES `tbmovies` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbuser
-- ----------------------------
DROP TABLE IF EXISTS `tbuser`;
CREATE TABLE `tbuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `sex` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `img` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像的图片地址',
  `tel` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `status` int(1) NULL DEFAULT 0 COMMENT '账号状态（0-启用  1-禁用）',
  `money` double(10, 2) NULL DEFAULT 10000.00 COMMENT '余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
