-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- Server version:               10.5.3-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL 版本:                  10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for air_compressor
CREATE DATABASE IF NOT EXISTS `air_compressor` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `air_compressor`;

-- Dumping structure for table air_compressor.catalog
CREATE TABLE IF NOT EXISTS `catalog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'public 公共目录=0。',
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `rank` int(10) unsigned NOT NULL DEFAULT 0,
  `container` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '是否包含内容',
  `name` varchar(50) NOT NULL DEFAULT '',
  `link` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- Dumping data for table air_compressor.catalog: ~36 rows (approximately)
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` (`id`, `owner_id`, `parent_id`, `rank`, `container`, `name`, `link`) VALUES
	(2, 0, 0, 1, 1, '招聘信息', 'recruit'),
	(3, 0, 0, 1, 1, '求职信息', 'resume'),
	(4, 0, 0, 1, 1, '出售 | 服务', 'sale'),
	(5, 0, 0, 1, 1, '求购', 'want'),
	(6, 0, 0, 1, 1, '吃喝玩乐', 'nearby'),
	(7, 0, 0, 0, 1, '其他', 'others'),
	(8, 0, 0, 1, 1, '出租', 'rental'),
	(9, 0, 2, 0, 1, '全职', 'full-time'),
	(10, 0, 2, 0, 1, '兼职', 'part-time'),
	(11, 0, 4, 0, 1, '家政', 'household'),
	(12, 0, 4, 0, 1, '货运', 'cargo'),
	(13, 0, 4, 0, 1, '维修|装修', 'maintain'),
	(14, 0, 4, 0, 1, '二手市场', 'market'),
	(15, 0, 4, 0, 1, '商务服务', 'business'),
	(16, 0, 15, 0, 1, '批发采购', 'wholesale'),
	(17, 0, 15, 0, 1, '招商加盟', 'franchise'),
	(18, 0, 6, 0, 1, '健身|运动', 'gym'),
	(19, 0, 6, 0, 1, '旅游|户外', 'outdoor'),
	(20, 0, 6, 0, 1, '餐饮美食', 'catering'),
	(21, 0, 6, 0, 1, '丽人', 'beauty'),
	(22, 0, 6, 0, 1, '宠物|业余爱好', 'hobby'),
	(23, 0, 15, 0, 1, '广告', 'ad'),
	(24, 0, 8, 0, 1, '单间出租', 'single'),
	(25, 0, 8, 0, 1, '单间求租', 'single-rental'),
	(26, 0, 8, 0, 1, '整租', 'whole'),
	(27, 0, 8, 0, 1, '合租', 'flat'),
	(28, 0, 8, 0, 1, '商铺出租', 'shops'),
	(29, 0, 8, 0, 1, '办公室出租', 'office'),
	(30, 0, 8, 0, 1, '酒店|民宿', 'lodge'),
	(31, 0, 8, 0, 1, '厂房|仓库出租', 'plant'),
	(32, 0, 8, 0, 1, '设备出租', 'device'),
	(33, 0, 14, 0, 1, '家具|家电', 'domestic'),
	(34, 0, 14, 0, 1, '二手车', 'vehicle'),
	(35, 0, 14, 0, 1, '二手设备', 'facility'),
	(36, 0, 14, 0, 1, '二手房', 'apartment');
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;

-- Dumping structure for table air_compressor.history
CREATE TABLE IF NOT EXISTS `history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT 0,
  `user-agent` varchar(50) DEFAULT '',
  `ip` varchar(50) DEFAULT '',
  `url` varchar(200) NOT NULL DEFAULT '',
  `input` varchar(200) NOT NULL DEFAULT '',
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table air_compressor.history: ~0 rows (approximately)
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;

-- Dumping structure for table air_compressor.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) unsigned NOT NULL,
  `pub_catalog` int(10) unsigned NOT NULL,
  `prv_catalog` int(10) unsigned NOT NULL,
  `title` varchar(50) DEFAULT '',
  `slug` varchar(50) DEFAULT '',
  `html` text DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table air_compressor.product: ~0 rows (approximately)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table air_compressor.product_attribute_name
CREATE TABLE IF NOT EXISTS `product_attribute_name` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table air_compressor.product_attribute_name: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_attribute_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_attribute_name` ENABLE KEYS */;

-- Dumping structure for table air_compressor.product_attribute_value
CREATE TABLE IF NOT EXISTS `product_attribute_value` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_id` int(10) unsigned NOT NULL,
  `val` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table air_compressor.product_attribute_value: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_attribute_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_attribute_value` ENABLE KEYS */;

-- Dumping structure for table air_compressor.product_image
CREATE TABLE IF NOT EXISTS `product_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `path` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table air_compressor.product_image: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;

-- Dumping structure for table air_compressor.product_tag
CREATE TABLE IF NOT EXISTS `product_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table air_compressor.product_tag: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_tag` ENABLE KEYS */;

-- Dumping structure for table air_compressor.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `passwd` varchar(200) NOT NULL DEFAULT '',
  `avatar` varchar(50) DEFAULT '',
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `login_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- Dumping data for table air_compressor.user: ~4 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `email`, `passwd`, `avatar`, `active`, `login_at`, `update_at`, `create_at`) VALUES
	(1, 'egotom', 'egotom@gmail.com', '$2b$10$ieN1GUAwwPo9ha2GViRxFuP55t/qBaGhCnblQb2DZMbyaZkNyhHHu', 'avatar.jpg', 1, '2020-10-20 09:11:25', NULL, '2020-10-14 15:53:15'),
	(9, 'kk', 'kk@kk.com', '$2b$10$1vGcxLJqX37kHGFuUFFe..gMgOR4les3fQ2PLKFp7C2AGp58Ue.0O', 'avatar.jpg', 1, '2020-10-20 09:08:21', NULL, '2020-10-15 08:34:33'),
	(22, '123', '123@kk.com', '$2b$10$xokXbdErljQLIvhHaGdYmu/VRG3ks8wbEGejpDnsJd1.uQiu4GpPe', '', 0, NULL, NULL, '2020-10-15 08:51:47'),
	(25, 'dsdad', '12345678@ww.com', '$2b$10$lnNWCIBYc8kXnGsdYZ3OBuDEVyWFU51lhZGwfBoCEPtpp0qcAfg4u', '', 0, NULL, NULL, '2020-10-15 09:02:43');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
