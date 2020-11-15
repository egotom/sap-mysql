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
DROP DATABASE IF EXISTS `air_compressor`;
CREATE DATABASE IF NOT EXISTS `air_compressor` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `air_compressor`;

-- Dumping structure for table air_compressor.addr
DROP TABLE IF EXISTS `addr`;
CREATE TABLE IF NOT EXISTS `addr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '父级行政代码',
  `zip_code` mediumint(6) unsigned zerofill NOT NULL DEFAULT 000000 COMMENT '邮政编码',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '简称',
  `pinyin` varchar(30) NOT NULL DEFAULT '' COMMENT '拼音',
  `lng` decimal(10,6) NOT NULL DEFAULT 0.000000 COMMENT '经度',
  `lat` decimal(10,6) NOT NULL DEFAULT 0.000000 COMMENT '纬度',
  PRIMARY KEY (`id`),
  KEY `parent_code` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=783563 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table air_compressor.attribute_name
DROP TABLE IF EXISTS `attribute_name`;
CREATE TABLE IF NOT EXISTS `attribute_name` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table air_compressor.attribute_value
DROP TABLE IF EXISTS `attribute_value`;
CREATE TABLE IF NOT EXISTS `attribute_value` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nid` int(10) unsigned NOT NULL,
  `creator_id` int(10) unsigned NOT NULL DEFAULT 0,
  `val` varchar(200) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table air_compressor.catalog
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE IF NOT EXISTS `catalog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'public 公共目录=0。',
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `rank` int(10) unsigned NOT NULL DEFAULT 0,
  `container` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '是否包含内容',
  `name` varchar(50) NOT NULL DEFAULT '',
  `link` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table air_compressor.catalog_attribute
DROP TABLE IF EXISTS `catalog_attribute`;
CREATE TABLE IF NOT EXISTS `catalog_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned DEFAULT 0,
  `aid` int(10) unsigned DEFAULT 0,
  `rank` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table air_compressor.catalog_tag
DROP TABLE IF EXISTS `catalog_tag`;
CREATE TABLE IF NOT EXISTS `catalog_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL DEFAULT 0,
  `tid` int(10) unsigned NOT NULL DEFAULT 0,
  `rank` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table air_compressor.favorite
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE IF NOT EXISTS `favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) unsigned NOT NULL DEFAULT 0,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `archive` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `url` varchar(50) NOT NULL DEFAULT '',
  `update_at` timestamp NULL DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for procedure air_compressor.foo
DROP PROCEDURE IF EXISTS `foo`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `foo`()
BEGIN
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE _aid BIGINT UNSIGNED;
  DECLARE _rid BIGINT UNSIGNED;
  DECLARE cur CURSOR FOR SELECT a.id AS aid, r.id AS rid FROM addr r INNER JOIN addr a ON a.parent_code=r.area_code;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done := TRUE;
  OPEN cur;
  testLoop: LOOP
    FETCH cur INTO _aid,_rid;
    IF done THEN
      LEAVE testLoop;
    END IF;
    UPDATE addr SET parent_code=_rid WHERE id =_aid;
  END LOOP testLoop;
  CLOSE cur;
END//
DELIMITER ;

-- Dumping structure for table air_compressor.history
DROP TABLE IF EXISTS `history`;
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

-- Data exporting was unselected.
-- Dumping structure for table air_compressor.product
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) unsigned NOT NULL,
  `pub_catalog` int(10) unsigned NOT NULL,
  `prv_catalog` int(10) unsigned NOT NULL DEFAULT 0,
  `lat` decimal(10,6) DEFAULT NULL,
  `lng` decimal(10,6) DEFAULT NULL,
  `title` varchar(50) DEFAULT '',
  `html` text DEFAULT '',
  `update_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table air_compressor.product_attribute
DROP TABLE IF EXISTS `product_attribute`;
CREATE TABLE IF NOT EXISTS `product_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned DEFAULT 0,
  `vid` int(10) unsigned DEFAULT 0 COMMENT 'attribute_value.id',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table air_compressor.product_image
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE IF NOT EXISTS `product_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `path` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table air_compressor.product_tag
DROP TABLE IF EXISTS `product_tag`;
CREATE TABLE IF NOT EXISTS `product_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tid` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table air_compressor.res_addr
DROP TABLE IF EXISTS `res_addr`;
CREATE TABLE IF NOT EXISTS `res_addr` (
  `id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `level` tinyint(1) unsigned NOT NULL COMMENT '层级',
  `parent_code` bigint(14) unsigned NOT NULL DEFAULT 0 COMMENT '父级行政代码',
  `area_code` bigint(14) unsigned NOT NULL DEFAULT 0 COMMENT '行政代码',
  `zip_code` mediumint(6) unsigned zerofill NOT NULL DEFAULT 000000 COMMENT '邮政编码',
  `city_code` char(6) NOT NULL DEFAULT '' COMMENT '区号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `short_name` varchar(50) NOT NULL DEFAULT '' COMMENT '简称',
  `merger_name` varchar(50) NOT NULL DEFAULT '' COMMENT '组合名',
  `pinyin` varchar(30) NOT NULL DEFAULT '' COMMENT '拼音',
  `lng` decimal(10,6) NOT NULL DEFAULT 0.000000 COMMENT '经度',
  `lat` decimal(10,6) NOT NULL DEFAULT 0.000000 COMMENT '纬度',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`area_code`) USING BTREE,
  KEY `idx_parent_code` (`parent_code`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=783563 DEFAULT CHARSET=utf8 COMMENT='中国行政地区表';

-- Data exporting was unselected.
-- Dumping structure for table air_compressor.res_industry
DROP TABLE IF EXISTS `res_industry`;
CREATE TABLE IF NOT EXISTS `res_industry` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table air_compressor.res_job
DROP TABLE IF EXISTS `res_job`;
CREATE TABLE IF NOT EXISTS `res_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1407 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table air_compressor.tags
DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table air_compressor.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `passwd` varchar(200) NOT NULL DEFAULT '',
  `avatar` varchar(50) DEFAULT '',
  `addr` varchar(50) DEFAULT '',
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `lat` decimal(10,6) DEFAULT NULL,
  `lng` decimal(10,6) DEFAULT NULL,
  `login_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table air_compressor.user_tag
DROP TABLE IF EXISTS `user_tag`;
CREATE TABLE IF NOT EXISTS `user_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT 0,
  `tid` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
