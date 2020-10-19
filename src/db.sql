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

-- Dumping structure for table air_compressor.catalog
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE IF NOT EXISTS `catalog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `rank` int(10) unsigned NOT NULL DEFAULT 0,
  `container` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否包含内容',
  `name` varchar(50) NOT NULL DEFAULT '',
  `link` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table air_compressor.catalog: ~10 rows (approximately)
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` (`id`, `parent_id`, `rank`, `container`, `name`, `link`) VALUES
	(1, 0, 2, 0, '热门', '.'),
	(2, 0, 1, 1, '招聘信息', 'recruit'),
	(3, 0, 1, 1, '求职信息', 'resume'),
	(4, 0, 1, 1, '出售', 'sale'),
	(5, 0, 1, 1, '求购', 'want'),
	(6, 0, 1, 1, '吃喝玩乐', 'nearby'),
	(7, 0, 0, 1, '其他', 'others'),
	(8, 0, 1, 1, '出租', 'rental'),
	(9, 2, 0, 1, '全职', 'full-time'),
	(10, 2, 0, 1, '兼职', 'part-time');
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;

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

-- Dumping data for table air_compressor.history: ~0 rows (approximately)
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;

-- Dumping structure for table air_compressor.posts
DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT '',
  `slug` varchar(50) DEFAULT '',
  `html` text DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table air_compressor.posts: ~4 rows (approximately)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `title`, `slug`, `html`) VALUES
	(1, 'How to use Sapper', 'how-to-use-sapper', '<h2>Step one</h2>\r\n			<p>Create a new project, using <a href=\'https://github.com/Rich-Harris/degit\'>degit</a>:</p>\r\n\r\n			<pre><code>npx degit "sveltejs/sapper-template#rollup" my-app\r\n			cd my-app\r\n			npm install # or yarn!\r\n			npm run dev\r\n			</code></pre>\r\n\r\n			<h2>Step two</h2>\r\n			<p>Go to <a href=\'http://localhost:3000\'>localhost:3000</a>. Open <code>my-app</code> in your editor. Edit the files in the <code>src/routes</code> directory or add new ones.</p>\r\n\r\n			<h2>Step three</h2>\r\n			<p>...</p>\r\n\r\n			<h2>Step four</h2>\r\n			<p>Resist overdone joke formats.</p>\r\n\r\n<p>Create a new project, using <a href=\'https://github.com/Rich-Harris/degit\'>degit</a>:</p>\r\n\r\n			<pre><code>npx degit "sveltejs/sapper-template#rollup" my-app\r\n			cd my-app\r\n			npm install # or yarn!\r\n			npm run dev\r\n			</code></pre>\r\n\r\n			<h2>Step two</h2>\r\n			<p>Go to <a href=\'http://localhost:3000\'>localhost:3000</a>. Open <code>my-app</code> in your editor. Edit the files in the <code>src/routes</code> directory or add new ones.</p>\r\n\r\n			<h2>Step three</h2>\r\n			<p>...</p>\r\n\r\n			<h2>Step four</h2>\r\n			<p>Resist overdone joke formats.</p>\r\n\r\n<p>Create a new project, using <a href=\'https://github.com/Rich-Harris/degit\'>degit</a>:</p>\r\n\r\n			<pre><code>npx degit "sveltejs/sapper-template#rollup" my-app\r\n			cd my-app\r\n			npm install # or yarn!\r\n			npm run dev\r\n			</code></pre>\r\n\r\n			<h2>Step two</h2>\r\n			<p>Go to <a href=\'http://localhost:3000\'>localhost:3000</a>. Open <code>my-app</code> in your editor. Edit the files in the <code>src/routes</code> directory or add new ones.</p>\r\n\r\n			<h2>Step three</h2>\r\n			<p>...</p>\r\n\r\n			<h2>Step four</h2>\r\n			<p>Resist overdone joke formats.</p>\r\n\r\n<p>Create a new project, using <a href=\'https://github.com/Rich-Harris/degit\'>degit</a>:</p>\r\n\r\n			<pre><code>npx degit "sveltejs/sapper-template#rollup" my-app\r\n			cd my-app\r\n			npm install # or yarn!\r\n			npm run dev\r\n			</code></pre>\r\n\r\n			<h2>Step two</h2>\r\n			<p>Go to <a href=\'http://localhost:3000\'>localhost:3000</a>. Open <code>my-app</code> in your editor. Edit the files in the <code>src/routes</code> directory or add new ones.</p>\r\n\r\n			<h2>Step three</h2>\r\n			<p>...</p>\r\n\r\n			<h2>Step four</h2>\r\n			<p>Resist overdone joke formats.</p>'),
	(2, 'What is Sapper?', 'what-is-sapper', '<p>First, you have to know what <a href=\'https://svelte.dev\'>Svelte</a> is. Svelte is a UI framework with a bold new idea: rather than providing a library that you write code with (like React or Vue, for example), it\'s a compiler that turns your components into highly optimized vanilla JavaScript. If you haven\'t already read the <a href=\'https://svelte.dev/blog/frameworks-without-the-framework\'>introductory blog post</a>, you should!</p>'),
	(3, 'Why the name?', 'why-the-name', '<p>In war, the soldiers who build bridges, repair roads, clear minefields and conduct demolitions — all under combat conditions — are known as <em>sappers</em>.</p>'),
	(4, 'How is Sapper different from Next.js?', 'how-is-sapper-different-from-next', '<p><a href=\'https://github.com/zeit/next.js\'>Next.js</a> is a React framework from <a href=\'https://vercel.com/\'>Vercel</a>, and is the inspiration for Sapper. There are a few notable differences, however:</p>'),
	(5, 'How can I get involved?', 'how-can-i-get-involved', '<p>We\'re so glad you asked! Come on over to the <a href=\'https://github.com/sveltejs/svelte\'>Svelte</a> and <a href=\'https://github.com/sveltejs/sapper\'>Sapper</a> repos, and join us in the <a href=\'https://svelte.dev/chat\'>Discord chatroom</a>. Everyone is welcome, especially you!</p>');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Dumping structure for table air_compressor.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `passwd` varchar(200) NOT NULL DEFAULT '',
  `avatar` varchar(50) DEFAULT '',
  `refresh_token` varchar(200) DEFAULT '',
  `active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `login_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- Dumping data for table air_compressor.user: ~4 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `email`, `passwd`, `avatar`, `refresh_token`, `active`, `login_at`, `update_at`, `create_at`) VALUES
	(1, 'egotom', 'egotom@gmail.com', '$2b$10$ieN1GUAwwPo9ha2GViRxFuP55t/qBaGhCnblQb2DZMbyaZkNyhHHu', 'avatar.jpg', '', 1, '2020-10-19 16:28:09', NULL, '2020-10-14 15:53:15'),
	(9, 'kk', 'kk@kk.com', '$2b$10$1vGcxLJqX37kHGFuUFFe..gMgOR4les3fQ2PLKFp7C2AGp58Ue.0O', 'avatar.jpg', '', 1, '2020-10-19 16:10:29', NULL, '2020-10-15 08:34:33'),
	(22, '123', '123@kk.com', '$2b$10$xokXbdErljQLIvhHaGdYmu/VRG3ks8wbEGejpDnsJd1.uQiu4GpPe', '', '', 0, NULL, NULL, '2020-10-15 08:51:47'),
	(25, 'dsdad', '12345678@ww.com', '$2b$10$lnNWCIBYc8kXnGsdYZ3OBuDEVyWFU51lhZGwfBoCEPtpp0qcAfg4u', '', '', 0, NULL, NULL, '2020-10-15 09:02:43');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
