-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/01/2025 às 00:38
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pokedashpota`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `password` char(40) NOT NULL,
  `secret` char(16) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `premdays` int(11) NOT NULL DEFAULT 0,
  `lastday` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL DEFAULT '',
  `creation` int(11) NOT NULL DEFAULT 0,
  `premium_points` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `secret`, `type`, `premdays`, `lastday`, `email`, `creation`, `premium_points`) VALUES
(1, 'gm', 'c9e8fabd957e325872fc340c88f143e5f3290289', NULL, 6, 94, 1736364878, 'email@company.com', 1535900202, 7479);

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_bans`
--

CREATE TABLE `account_bans` (
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_ban_history`
--

CREATE TABLE `account_ban_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expired_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  `description` varchar(128) NOT NULL DEFAULT '',
  `icon` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `notify` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Acionadores `guilds`
--
DELIMITER $$
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('the Leader', 3, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('a Vice-Leader', 2, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('a Member', 1, NEW.`id`);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guildwar_kills`
--

CREATE TABLE `guildwar_kills` (
  `id` int(11) NOT NULL,
  `killer` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `killerguild` int(11) NOT NULL DEFAULT 0,
  `targetguild` int(11) NOT NULL DEFAULT 0,
  `warid` int(11) NOT NULL DEFAULT 0,
  `time` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `guild_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guild_membership`
--

CREATE TABLE `guild_membership` (
  `player_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `nick` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL COMMENT 'guild',
  `name` varchar(255) NOT NULL COMMENT 'rank name',
  `level` int(11) NOT NULL COMMENT 'rank level - leader, vice, member, maybe something else'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guild_wars`
--

CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL,
  `guild1` int(11) NOT NULL DEFAULT 0,
  `guild2` int(11) NOT NULL DEFAULT 0,
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `started` bigint(20) NOT NULL DEFAULT 0,
  `ended` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `paid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `warnings` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `rent` int(11) NOT NULL DEFAULT 0,
  `town_id` int(11) NOT NULL DEFAULT 0,
  `bid` int(11) NOT NULL DEFAULT 0,
  `bid_end` int(11) NOT NULL DEFAULT 0,
  `last_bid` int(11) NOT NULL DEFAULT 0,
  `highest_bidder` int(11) NOT NULL DEFAULT 0,
  `size` int(11) NOT NULL DEFAULT 0,
  `beds` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `house_items`
--

CREATE TABLE `house_items` (
  `house_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `z` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ip_bans`
--

CREATE TABLE `ip_bans` (
  `ip` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `market_history`
--

CREATE TABLE `market_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `expires_at` bigint(20) UNSIGNED NOT NULL,
  `inserted` bigint(20) UNSIGNED NOT NULL,
  `state` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `market_offers`
--

CREATE TABLE `market_offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `created` bigint(20) UNSIGNED NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT 0,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT 1,
  `account_id` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `vocation` int(11) NOT NULL DEFAULT 0,
  `health` int(11) NOT NULL DEFAULT 150,
  `healthmax` int(11) NOT NULL DEFAULT 150,
  `experience` bigint(20) NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `looktype` int(11) NOT NULL DEFAULT 136,
  `lookaddons` int(11) NOT NULL DEFAULT 0,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `mana` int(11) NOT NULL DEFAULT 0,
  `manamax` int(11) NOT NULL DEFAULT 0,
  `manaspent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `soul` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `town_id` int(11) NOT NULL DEFAULT 0,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT 0,
  `sex` int(11) NOT NULL DEFAULT 0,
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `save` tinyint(1) NOT NULL DEFAULT 1,
  `skull` tinyint(1) NOT NULL DEFAULT 0,
  `skulltime` int(11) NOT NULL DEFAULT 0,
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `blessings` tinyint(4) NOT NULL DEFAULT 0,
  `onlinetime` int(11) NOT NULL DEFAULT 0,
  `deletion` bigint(20) NOT NULL DEFAULT 0,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `offlinetraining_time` smallint(5) UNSIGNED NOT NULL DEFAULT 43200,
  `offlinetraining_skill` int(11) NOT NULL DEFAULT -1,
  `stamina` smallint(5) UNSIGNED NOT NULL DEFAULT 2520,
  `skill_fist` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_fist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_club` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_club_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_sword` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_sword_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_axe` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_axe_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_dist` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_dist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_shielding` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_shielding_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_fishing` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_fishing_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `players`
--

INSERT INTO `players` (`id`, `name`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `lastlogout`, `blessings`, `onlinetime`, `deletion`, `balance`, `offlinetraining_time`, `offlinetraining_skill`, `stamina`, `skill_fist`, `skill_fist_tries`, `skill_club`, `skill_club_tries`, `skill_sword`, `skill_sword_tries`, `skill_axe`, `skill_axe_tries`, `skill_dist`, `skill_dist_tries`, `skill_shielding`, `skill_shielding_tries`, `skill_fishing`, `skill_fishing_tries`) VALUES
(2998, 'Mahiey Of Carlin', 3, 1, 100, 6, 590, 590, 4200, 0, 0, 0, 0, 2222, 0, 0, 2147483647, 2147483647, 0, 100, 1, 16205, 16696, 6, '', 6, 1, 1736377453, 16777343, 1, 0, 0, 1736377776, 0, 1462, 0, 0, 43200, -1, 2520, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0);

--
-- Acionadores `players`
--
DELIMITER $$
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players` FOR EACH ROW BEGIN
    UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `players_online`
--

CREATE TABLE `players_online` (
  `player_id` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_deaths`
--

CREATE TABLE `player_deaths` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `killed_by` varchar(255) NOT NULL,
  `is_player` tinyint(1) NOT NULL DEFAULT 1,
  `mostdamage_by` varchar(100) NOT NULL,
  `mostdamage_is_player` tinyint(1) NOT NULL DEFAULT 0,
  `unjustified` tinyint(1) NOT NULL DEFAULT 0,
  `mostdamage_unjustified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` mediumint(9) NOT NULL,
  `count` smallint(6) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_inboxitems`
--

CREATE TABLE `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` mediumint(9) NOT NULL,
  `count` smallint(6) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_items`
--

CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL DEFAULT 0,
  `itemtype` mediumint(9) NOT NULL DEFAULT 0,
  `count` smallint(6) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `player_items`
--

INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`, `attributes`) VALUES
(2998, 1, 101, 2270, 1, ''),
(2998, 2, 102, 26820, 1, ''),
(2998, 3, 103, 26821, 1, ''),
(2998, 4, 104, 2263, 1, ''),
(2998, 6, 105, 8922, 1, ''),
(2998, 7, 106, 38681, 1, ''),
(2998, 8, 107, 38680, 1, ''),
(2998, 9, 108, 38682, 1, ''),
(2998, 107, 109, 38687, 1, ''),
(2998, 107, 110, 38686, 1, ''),
(2998, 107, 111, 38688, 1, ''),
(2998, 107, 112, 38684, 1, ''),
(2998, 107, 113, 38690, 1, ''),
(2998, 107, 114, 38685, 1, ''),
(2998, 107, 115, 38683, 1, ''),
(2998, 107, 116, 38689, 1, ''),
(2998, 107, 117, 26611, 1, ''),
(2998, 107, 118, 26610, 1, ''),
(2998, 107, 119, 26616, 1, ''),
(2998, 107, 120, 26613, 1, ''),
(2998, 107, 121, 26612, 1, ''),
(2998, 107, 122, 26615, 1, ''),
(2998, 107, 123, 26609, 1, ''),
(2998, 107, 124, 26614, 1, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `namelocked_at` bigint(20) NOT NULL,
  `namelocked_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_spells`
--

CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `key` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(2998, 5009, 1),
(2998, 30018, 1),
(2998, 92000, 0),
(2998, 92001, 0),
(2998, 92002, 0),
(2998, 92003, 0),
(2998, 92004, 0),
(2998, 92005, 0),
(2998, 92006, 0),
(2998, 92007, 0),
(2998, 92008, 0),
(2998, 92009, 0),
(2998, 92010, 0),
(2998, 92011, 0),
(2998, 92012, 0),
(2998, 92013, 0),
(2998, 92014, 0),
(2998, 92015, 0),
(2998, 1150001, 1736377457),
(2998, 10001001, 145031168),
(2998, 10001002, 145096704),
(2998, 10001003, 145489920),
(2998, 10001004, 145620992);

-- --------------------------------------------------------

--
-- Estrutura para tabela `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(50) NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `server_config`
--

INSERT INTO `server_config` (`config`, `value`) VALUES
('db_version', '19'),
('motd_hash', 'c29d64e09f912f3093b564a4203279f314a21154'),
('motd_num', '4'),
('players_record', '41');

-- --------------------------------------------------------

--
-- Estrutura para tabela `shop_history`
--

CREATE TABLE `shop_history` (
  `id` int(11) NOT NULL,
  `account` int(11) NOT NULL,
  `player` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `cost` int(11) NOT NULL,
  `details` text NOT NULL,
  `player_guid` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `shop_history`
--

INSERT INTO `shop_history` (`id`, `account`, `player`, `date`, `title`, `cost`, `details`, `player_guid`) VALUES
(63, 1, 2998, '2025-01-08 19:15:55', '1 Crystal coin', 1, '{\"item\":3043,\"cost\":1,\"itemId\":2160,\"title\":\"1 Crystal coin\",\"description\":\"description of cristal coin\",\"count\":1,\"type\":\"item\"}', 0),
(64, 1, 2998, '2025-01-08 19:21:42', 'Outfit Poliwag', 25, '{\"type\":\"outfit\",\"description\":\"description outfit\",\"cost\":25,\"outfit\":{\"rotating\":true,\"type\":2213},\"title\":\"Outfit Poliwag\"}', 0),
(65, 2767, 2999, '2025-01-08 19:39:10', 'Outfit Poliwag', 25, '{\"type\":\"outfit\",\"description\":\"description outfit\",\"cost\":25,\"outfit\":{\"rotating\":true,\"type\":2213},\"title\":\"Outfit Poliwag\"}', 0),
(66, 1, 2998, '2025-01-08 19:48:02', 'Outfit Zapdos', 25, '{\"cost\":25,\"outfit\":{\"type\":2214,\"rotating\":true},\"type\":\"outfit\",\"title\":\"Outfit Zapdos\",\"description\":\"description outfit\"}', 0),
(67, 1, 2998, '2025-01-08 19:48:16', 'Outfit Zapdos', 25, '{\"cost\":25,\"outfit\":{\"type\":2220,\"rotating\":true},\"type\":\"outfit\",\"title\":\"Outfit Zapdos\",\"description\":\"description outfit\"}', 0),
(68, 1, 2998, '2025-01-08 19:48:20', 'Outfit Zapdos', 25, '{\"cost\":25,\"outfit\":{\"type\":2220,\"rotating\":true},\"type\":\"outfit\",\"title\":\"Outfit Zapdos\",\"description\":\"description outfit\"}', 0),
(69, 1, 2998, '2025-01-08 19:51:10', 'Outfit Sonic', 25, '{\"outfit\":{\"type\":2222,\"rotating\":true,\"sex\":1},\"title\":\"Outfit Sonic\",\"type\":\"outfit\",\"cost\":25,\"description\":\"description outfit\"}', 0),
(70, 2767, 3001, '2025-01-08 19:52:18', 'Outfit Eevee', 25, '{\"outfit\":{\"type\":2220,\"rotating\":true,\"sex\":0},\"title\":\"Outfit Eevee\",\"type\":\"outfit\",\"cost\":25,\"description\":\"description outfit\"}', 0),
(71, 1, 2997, '2025-01-08 20:12:08', 'Vip 30 Dias', 1, '{\"item\":34096,\"cost\":1,\"itemId\":36513,\"title\":\"Vip 30 Dias\",\"count\":1,\"type\":\"item\"}', 0),
(72, 1, 2997, '2025-01-08 20:36:35', 'Vip 30 Days', 1, '{\"item\":34096,\"cost\":1,\"itemId\":36513,\"title\":\"Vip 30 Days\",\"count\":1,\"type\":\"item\"}', 0),
(73, 1, 2997, '2025-01-08 20:36:38', 'Bless Plus', 1, '{\"item\":34095,\"cost\":1,\"itemId\":36512,\"title\":\"Bless Plus\",\"count\":1,\"type\":\"item\"}', 0),
(74, 1, 2997, '2025-01-08 20:36:39', 'City Teleport', 1, '{\"item\":34097,\"cost\":1,\"itemId\":36514,\"title\":\"City Teleport\",\"count\":1,\"type\":\"item\"}', 0),
(75, 1, 2997, '2025-01-08 20:36:41', 'Change Sex', 1, '{\"item\":34098,\"cost\":1,\"itemId\":36515,\"title\":\"Change Sex\",\"count\":1,\"type\":\"item\"}', 0),
(76, 1, 2997, '2025-01-08 20:36:52', 'Shiny Ditto', 1, '{\"item\":25067,\"cost\":1,\"itemId\":27484,\"title\":\"Shiny Ditto\",\"count\":1,\"type\":\"item\"}', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tile_store`
--

CREATE TABLE `tile_store` (
  `house_id` int(11) NOT NULL,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote`
--

CREATE TABLE `znote` (
  `id` int(11) NOT NULL,
  `version` varchar(30) NOT NULL COMMENT 'Znote AAC version',
  `installed` int(11) NOT NULL,
  `cached` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `znote`
--

INSERT INTO `znote` (`id`, `version`, `installed`, `cached`) VALUES
(1, '1.5_SVN', 1535753961, 1540374381);

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_accounts`
--

CREATE TABLE `znote_accounts` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `ip` int(10) UNSIGNED NOT NULL,
  `created` int(11) NOT NULL,
  `points` int(11) DEFAULT 0,
  `cooldown` int(11) DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `activekey` int(11) NOT NULL DEFAULT 0,
  `flag` varchar(20) NOT NULL,
  `secret` char(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `znote_accounts`
--

INSERT INTO `znote_accounts` (`id`, `account_id`, `ip`, `created`, `points`, `cooldown`, `active`, `activekey`, `flag`, `secret`) VALUES
(2767, 2766, 0, 1736373572, 0, 0, 1, 623153192, 'br', NULL),
(2768, 2767, 0, 1736374948, 0, 0, 1, 210898685, 'br', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_changelog`
--

CREATE TABLE `znote_changelog` (
  `id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_deleted_characters`
--

CREATE TABLE `znote_deleted_characters` (
  `id` int(11) NOT NULL,
  `original_account_id` int(11) NOT NULL,
  `character_name` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `done` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_forum`
--

CREATE TABLE `znote_forum` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `access` tinyint(4) NOT NULL,
  `closed` tinyint(4) NOT NULL,
  `hidden` tinyint(4) NOT NULL,
  `guild_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_forum_posts`
--

CREATE TABLE `znote_forum_posts` (
  `id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `player_name` varchar(50) NOT NULL,
  `text` text NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_forum_threads`
--

CREATE TABLE `znote_forum_threads` (
  `id` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `player_name` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `text` text NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `sticky` tinyint(4) NOT NULL,
  `hidden` tinyint(4) NOT NULL,
  `closed` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_global_storage`
--

CREATE TABLE `znote_global_storage` (
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_guild_wars`
--

CREATE TABLE `znote_guild_wars` (
  `id` int(11) NOT NULL,
  `limit` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_images`
--

CREATE TABLE `znote_images` (
  `id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `desc` text NOT NULL,
  `date` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `image` varchar(30) NOT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_news`
--

CREATE TABLE `znote_news` (
  `id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `text` text NOT NULL,
  `date` int(11) NOT NULL,
  `pid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `znote_news`
--

INSERT INTO `znote_news` (`id`, `title`, `text`, `date`, `pid`) VALUES
(1, 'LanÃ§amento', '<font size=\"3\">Server oficialmente lanÃ§ado 02/09/2018!</font><div><font size=\"3\">Use o menu ao lado para criar sua conta!</font></div><div><font size=\"3\"><br></font></div><div><font size=\"3\">Staff PokeDash.</font></div>', 1535927918, 2),
(2, 'Mapa!', '<img src=\"https://i.imgur.com/8yU4sma.png\" width=\"692\"><br>', 1536787933, 2),
(3, 'Mapa Outland!', 'Saiu o Outland com 10 quests! Mapa:<div><img src=\"https://i.imgur.com/4Odljlk.png\" width=\"692\"><br></div>', 1537296243, 2),
(4, 'ATUALIZAÃ‡ÃƒO', '<div><span style=\"font-size: 15.36px;\"><b>O moveset (ataques) de todos os pokemons foram finalizados e balanceados, assim como cada um de seus moves. Em breve teremos a atualizaÃ§Ã£o para a implementaÃ§Ã£o das atualizaÃ§Ãµes.</b></span></div><div><span style=\"font-size: 15.36px;\"><br></span></div><div><span style=\"font-size: 15.36px;\"><b>OBS 1</b>: O cooldown de cada ataque Ã© padronizado, nÃ£o irÃ¡ ser alterado por hora.</span></div><div><span style=\"font-size: 15.36px;\"><br></span></div><div><span style=\"font-size: 15.36px;\"><b>OBS 2</b>: JÃ¡ estÃ¡ implementado o sistema de vantagem/fraqueza entre os tipos de pokemons.</span></div><div><span style=\"font-size: 15.36px;\"><br></span></div><div><span style=\"font-size: 15.36px;\"><b>OBS 3</b>: AlÃ©m do tipo elemental, os moves (ataques/spells) sÃ£o divididos em trÃªs categorias: FÃ­sico (physical), MÃ¡gico (magical), ou suporte (status). Por exemplo, um ataque fÃ­sico irÃ¡ levar em conta o Attack do pokemon atacante e a Defense do pokemon defensor. Analogamente, ataques mÃ¡gicos utilizarÃ£o para o cÃ¡lculo do dano o Magic Attack e Magic Defense.</span></div><div><span style=\"font-size: 15.36px;\"><br></span></div><div><span style=\"font-size: 15.36px;\"><b>OBS 4</b>: O level mÃ­nimo para usar um pokemon Ã©/serÃ¡ dado pelo seguinte cÃ¡lculo: Pokemon level + Boost level - 50 &lt; Player level. Por exemplo, um pokemon lvl 62+16 requer que o player tenha no mÃ­nimo level 62+16-50 = 28</span></div><div><span style=\"font-size: 15.36px;\"><br></span></div><div><span style=\"font-size: 15.36px;\"><b>CURIOSIDADE</b>: Foram necessÃ¡rio 4 semanas de trabalho intenso da equipe do Pokedash somente para a idealizaÃ§Ã£o, planejamento, produÃ§Ã£o, validaÃ§Ã£o e testes do moveset, portanto peÃ§o que compreendam que todo e qualquer tipo de melhoria no server requer bastante tempo dedicado e esforÃ§o por nossa parte.</span></div><div><span style=\"font-size: 15.36px;\"><br></span></div><div><span style=\"font-size: 15.36px;\"><b>Nossa motivaÃ§Ã£o Ã© ver o server crescer, entÃ£o divulguem e compartilhem.</b></span></div><div><span style=\"font-size: 15.36px;\"><b><br></b></span></div><div><span style=\"font-size: 15.36px;\"><b>Equipe Pokedash.</b></span></div>', 1539939122, 2),
(5, 'ATUALIZAÃ‡ÃƒO', '<font size=\"4\">O up de jogadores level baixo se tornou mais fÃ¡cil! O primeiro catch em pokemons recebeu um bÃ´nus considerÃ¡vel de experiÃªncia, assim como a primeira dex! Aproveitem!</font><br>', 1540290392, 2),
(6, '[UPDATE][ATUALIZAÃ‡ÃƒO]', '<div><font size=\"4\" face=\"arial\">Uma nova atualizaÃ§Ã£o acaba de ser aplicada em nosso server. Entre as mudanÃ§as, destacamos:<br></font></div><div><font size=\"4\" face=\"arial\"><br></font></div><div><font size=\"4\" face=\"arial\"><b>- ImplementaÃ§Ã£o de profissÃµes, sendo elas:</b></font></div><div><font size=\"4\" face=\"arial\">Catcher: 3.5% mais chance de capturar um Pokemon.</font></div><div><font size=\"4\" face=\"arial\">Hunter: 10% mais status de dano para o seu Pokemon (tanto magico quanto fisico).</font></div><div><font size=\"4\" face=\"arial\">Blocker: 25% mais vida para seus Pokemons.</font></div><div><font size=\"4\" face=\"arial\">Healer: 100% mais cura que aplica tanto em potions quando moves dos seus Pokemons.</font></div><div><font size=\"4\" face=\"arial\">Explorer: 15% mais experiencia para seu personagem durante a caÃ§a.</font></div><div><font size=\"4\" face=\"arial\"><br></font></div><div><font size=\"4\" face=\"arial\"><b>- LanÃ§amento do nosso blog com o intuito de ajudar os jogadores que buscam informaÃ§Ãµes sobre o jogo</b>. Atualmente, Ã© possÃ­vel encontrar dicas para as quests e uma pokedex que mostra o status/dificuldade de catch de todos os Pokemons do server. para acessar entre em: http://blog.pokedashgames.com/</font></div><div><font size=\"4\" face=\"arial\"><br></font></div><div><font size=\"4\" face=\"arial\"><b>- Tokens</b>. Uma nova moeda de troca foi implementada no server. Os tokens podem ser trocados por itens raros (dentre eles premier ball e bags personalizadas - veja figura) alÃ©m de pagar seu curso com o NPC Job Manager para aprender uma das profissÃµes acima. Uma das maneiras de conseguir tokens Ã© fazendo tasks diÃ¡rias na NPC Julie do CP de Saffron.</font></div><div><font size=\"4\" face=\"arial\"><br></font></div><div><font size=\"4\" face=\"arial\">- Ultimate potion teve sua cura reduzida de 1/2 da vida do Pokemon para 1/3.</font></div><div><font size=\"4\" face=\"arial\"><br></font></div><div><font size=\"4\" face=\"arial\">- CorreÃ§Ã£o nos efeitos de alguns moves/ bugs em geral</font></div><div><font size=\"4\" face=\"arial\"><br></font></div><div><font size=\"4\" face=\"arial\"><img src=\"https://i.imgur.com/tWbJqrq.png\" width=\"677\"><br></font></div><div><font size=\"4\" face=\"arial\"><br></font></div><div><font size=\"4\" face=\"arial\">Equipe Pokedash</font></div><div><br></div>', 1540686148, 2),
(7, '[HALLOWEEN POKEDASH]', '<div><font size=\"4\">O Halloween do Pokedash acaba de ser iniciado! De hoje atÃ© domingo zumbis e abÃ³boras estarÃ£o assombrando as cidades periodicamente!<br></font></div><div><font size=\"4\">Pokemons, outfits e itens exclusivos dessa Ã©poca serÃ£o as recompensas para aqueles que ajudarem a proteger nosso mundo!</font></div><div><br></div><div><font size=\"4\">Equipe Pokedash</font></div><div><font size=\"4\"><br></font></div><div><img src=\"https://i.imgur.com/4V40v80.png\" width=\"692\"><font size=\"4\"><br></font></div>', 1541045225, 2),
(8, '[UPDATE][ATUALIZAÃ‡ÃƒO]', '<div><span style=\"font-size: large;\">Boa tarde a todos, hoje temos mais uma atualizaÃ§Ã£o!!! As seguintes novidades serÃ£o incluidas no jogo:</span><br></div><div><font size=\"4\"><br></font></div><div><font size=\"4\">1. Finalmente os lÃ­deres de ginÃ¡sios chegaram as cidades. Eles possuem pokemons bem fortes em seu time, aconselho a cada um estudar o adversario antes de desafia-lo.</font></div><div><font size=\"4\"><br></font></div><div><font size=\"4\">2. A Liga Indigo pokemon foi formada, contando com a Victory Road antes da liga, a Elite Four e tambÃ©m o CampeÃ£o. Prove ser o mestre pokemon derrotando a Liga.</font></div><div><font size=\"4\"><br></font></div><div><font size=\"4\">3. Professor Oak retornou de sua jornada e agora encontra-se em Pallet, converse com ele para saber em que ele precisa da sua ajuda e lembre-se de tempo em tempo visitÃ¡-lo, ele pode lhe trazer surpresas.</font></div><div><font size=\"4\"><br></font></div><div><font size=\"4\">4. O ex-campeÃ£o da liga se perdeu em sua jornada, mostre sua empatia e ajude-o!</font></div><div><font size=\"4\"><br></font></div><div><font size=\"4\">5. Parece que um cidadÃ£o de muitos anos de idade em Kanto (continente principal) estÃ¡ prestes a desvendar o segredo sobre a forma ancestral/anciÃ£ dos pokemons, junte pistas e ajude-o vocÃª tambÃ©m.</font></div><div><font size=\"4\"><br></font></div><div><font size=\"4\">AtualizaÃ§Ãµes menores:</font></div><div><font size=\"4\"><br></font></div><div><font size=\"4\">- Novos respawns</font></div><div><font size=\"4\"><br></font></div><div><font size=\"4\">- Novas quests para level 125,150,175,200</font></div><div><font size=\"4\"><br></font></div><div><font size=\"4\">- IntroduÃ§Ã£o dos ancients.</font></div><div><font size=\"4\"><br></font></div><div><font size=\"4\">- Possibilidade de pescar shiny.</font></div><div><font size=\"4\"><br></font></div><div><font size=\"4\">- Inventario atualizado.</font></div><div><font size=\"4\"><br></font></div><div><font size=\"4\">Aproveitem!!</font></div><div><font size=\"4\"><br></font></div><div><font size=\"4\">Equipe Pokedash.</font></div>', 1541971747, 2),
(9, 'NOVA OUTLAND ANCIENTS', '<div><font size=\"4\">Adicionamos hoje no mapa um novo local de caÃ§a para treinadores level 175+. Trata-se de um local em Nostrus que possui apenas respawn de Ancients. O acesso Ã© feito pelos portais localizados em um prÃ©dio prÃ³ximo a saÃ­da leste de Nostrus!</font></div><div><font size=\"4\"><br></font></div><div><font size=\"4\">Equipe PokeDash</font></div><div><img src=\"https://i.imgur.com/4ksMJsF.jpg\" width=\"692\"><font size=\"4\"><br></font></div>', 1542538916, 2),
(10, ' [NEW CLIENT]', '<div><font size=\"4\">LanÃ§amos ontem nosso novo cliente! Ele possui uma Ã¡rea Ãºtil muito maior e janelas transparentes que podem ser organizadas como quiserem. Para jogar, todos devem baixÃ¡-lo.</font></div><br><div><img src=\"https://i.imgur.com/OIxD2Id.jpg\" width=\"692\"><span style=\"color: rgb(29, 33, 41); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"><br></span></div>', 1543617748, 2),
(11, '[POKES NATAL]', '<div><font size=\"4\">Confiram em primeira mÃ£o os pokes que estarÃ£o disponÃ­veis durante nosso evento de natal! Eles serÃ£o exclusivos e estarÃ£o disponÃ­veis para catch a partir da prÃ³xima atualizaÃ§Ã£o, com duraÃ§Ã£o atÃ© o inÃ­cio de janeiro.&nbsp;</font></div><div><font size=\"4\"><br></font></div><div><font size=\"4\">Aproveitem!</font><br></div><div><br></div><div><br></div><div><img src=\"https://i.imgur.com/KvlKmw3.jpg\" width=\"692\"><br></div>', 1544483144, 2),
(12, '[MOVE BAR]', '<div><font size=\"4\">Acabamos de adicionar a move bar ao cliente. Agora Ã© possivel soltar os moves de seus pokes e observar o cooldown diretamente nela.<br></font></div><div><font size=\"4\">Para que ela apareÃ§a, vocÃª deve baixar o novo cliente (v7).</font></div><div><font size=\"4\"><br></font></div><div><font size=\"4\">Equipe Pokedash</font></div><div><font size=\"4\"><br></font></div><div><img src=\"https://i.imgur.com/9cw3mD1.jpg\" width=\"692\"><font size=\"4\"><br></font></div>', 1544956988, 2),
(13, '[UPDATE]', '<div><font size=\"4\">No update de hoje:<br></font></div><div><font size=\"4\"><br></font></div><div><font size=\"4\">- O level mÃ¡ximo dos Pokemons passa a ser 200. O ganho de status por level foi levemente diminuido, mas mesmo assim um Pokemon level 200 serÃ¡ bem mais forte que um lvl 100 atual.</font></div><div><font size=\"4\">- A vida basica de todos os Pokemons foi aumentada.<br></font></div><div><font size=\"4\">- O bonus no status do Pokemon devido ao level do player foi diminuido.</font></div><div><font size=\"4\">- As magias ultimates (que tem um cooldown bem maior que as outras) receberam um buff consideravel.</font></div><div><font size=\"4\">- O status dos Pokemons, alÃ©m de estar presente na Pokedex, agora tambÃ©m pode ser consultado dando look neles.</font></div><div><font size=\"4\"><br></font></div><div><font size=\"4\">Para baixar o jogo/criar conta entra em:</font></div><div><font size=\"4\">www.pokedashgames.com</font></div>', 1544976459, 2),
(14, '[UPDATE]', '<div><span style=\"font-size: large;\">Algumas cidades foram reformuladas e foi adicionada a barra para trocar de poke com 1 click. AlÃ©m disso, diversas correÃ§Ãµes de bugs e uma diminuiÃ§Ã£o no intervalo das passivas.</span><br></div><div><span style=\"font-size: large;\"><br></span></div><div><img src=\"https://i.imgur.com/T3dB8Q1.jpg\" width=\"692\"><span style=\"font-size: large;\"><br></span></div>', 1548356321, 2),
(15, '[UPDATE]', 'GeraÃ§Ã£o 4 liberada!<div><br><div><img src=\"https://i.imgur.com/0NfcHNa.jpg\" width=\"692\"><br></div></div>', 1550177038, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_pagseguro`
--

CREATE TABLE `znote_pagseguro` (
  `id` int(11) NOT NULL,
  `transaction` varchar(36) NOT NULL,
  `account` int(11) NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `points` int(11) NOT NULL,
  `payment_status` tinyint(1) NOT NULL,
  `completed` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_pagseguro_notifications`
--

CREATE TABLE `znote_pagseguro_notifications` (
  `id` int(11) NOT NULL,
  `notification_code` varchar(40) NOT NULL,
  `details` text NOT NULL,
  `receive_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_paygol`
--

CREATE TABLE `znote_paygol` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `message_id` varchar(255) NOT NULL,
  `service_id` varchar(255) NOT NULL,
  `shortcode` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `operator` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_paypal`
--

CREATE TABLE `znote_paypal` (
  `id` int(11) NOT NULL,
  `txn_id` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `accid` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_players`
--

CREATE TABLE `znote_players` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `hide_char` tinyint(4) NOT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `znote_players`
--

INSERT INTO `znote_players` (`id`, `player_id`, `created`, `hide_char`, `comment`) VALUES
(2986, 2985, 1733416579, 0, ''),
(2987, 2986, 1733416731, 0, ''),
(2988, 2987, 1733416792, 0, ''),
(2989, 2988, 1733417013, 0, ''),
(2990, 2989, 1733417589, 0, ''),
(2991, 2990, 1733417718, 0, ''),
(2992, 2991, 1735861123, 0, ''),
(2993, 2992, 1735961302, 0, ''),
(2994, 2993, 1736009550, 0, ''),
(2995, 2994, 1736365373, 0, ''),
(2996, 2995, 1736371730, 0, ''),
(2997, 2996, 1736373582, 0, ''),
(2998, 2997, 1736374375, 0, ''),
(2999, 2998, 1736374541, 0, ''),
(3000, 2999, 1736374954, 0, ''),
(3001, 3000, 1736376688, 0, ''),
(3002, 3001, 1736376694, 0, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_player_reports`
--

CREATE TABLE `znote_player_reports` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `posx` int(11) NOT NULL,
  `posy` int(11) NOT NULL,
  `posz` int(11) NOT NULL,
  `report_description` varchar(255) NOT NULL,
  `date` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_shop`
--

CREATE TABLE `znote_shop` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `itemid` int(11) DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `description` varchar(255) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_shop_logs`
--

CREATE TABLE `znote_shop_logs` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_shop_orders`
--

CREATE TABLE `znote_shop_orders` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_tickets`
--

CREATE TABLE `znote_tickets` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `ip` bigint(20) NOT NULL,
  `creation` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_tickets_replies`
--

CREATE TABLE `znote_tickets_replies` (
  `id` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `message` text NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_visitors`
--

CREATE TABLE `znote_visitors` (
  `id` int(11) NOT NULL,
  `ip` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `znote_visitors_details`
--

CREATE TABLE `znote_visitors_details` (
  `id` int(11) NOT NULL,
  `ip` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `account_bans`
--
ALTER TABLE `account_bans`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Índices de tabela `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Índices de tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_player_index` (`account_id`,`player_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `ownerid` (`ownerid`);

--
-- Índices de tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warid` (`warid`);

--
-- Índices de tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD PRIMARY KEY (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices de tabela `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `rank_id` (`rank_id`);

--
-- Índices de tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices de tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild1` (`guild1`),
  ADD KEY `guild2` (`guild2`);

--
-- Índices de tabela `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `town_id` (`town_id`);

--
-- Índices de tabela `house_items`
--
ALTER TABLE `house_items`
  ADD PRIMARY KEY (`house_id`,`item_id`,`x`,`y`,`z`);

--
-- Índices de tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD KEY `house_id` (`house_id`);

--
-- Índices de tabela `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD PRIMARY KEY (`ip`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Índices de tabela `market_history`
--
ALTER TABLE `market_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`,`sale`);

--
-- Índices de tabela `market_offers`
--
ALTER TABLE `market_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale` (`sale`,`itemtype`),
  ADD KEY `created` (`created`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `vocation` (`vocation`);

--
-- Índices de tabela `players_online`
--
ALTER TABLE `players_online`
  ADD PRIMARY KEY (`player_id`);

--
-- Índices de tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `killed_by` (`killed_by`),
  ADD KEY `mostdamage_by` (`mostdamage_by`);

--
-- Índices de tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Índices de tabela `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Índices de tabela `player_items`
--
ALTER TABLE `player_items`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `sid` (`sid`);

--
-- Índices de tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `namelocked_by` (`namelocked_by`);

--
-- Índices de tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD PRIMARY KEY (`player_id`,`key`);

--
-- Índices de tabela `server_config`
--
ALTER TABLE `server_config`
  ADD PRIMARY KEY (`config`);

--
-- Índices de tabela `shop_history`
--
ALTER TABLE `shop_history`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD KEY `house_id` (`house_id`);

--
-- Índices de tabela `znote`
--
ALTER TABLE `znote`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_accounts`
--
ALTER TABLE `znote_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_changelog`
--
ALTER TABLE `znote_changelog`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_deleted_characters`
--
ALTER TABLE `znote_deleted_characters`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_forum`
--
ALTER TABLE `znote_forum`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_forum_posts`
--
ALTER TABLE `znote_forum_posts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_forum_threads`
--
ALTER TABLE `znote_forum_threads`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_global_storage`
--
ALTER TABLE `znote_global_storage`
  ADD UNIQUE KEY `key` (`key`);

--
-- Índices de tabela `znote_guild_wars`
--
ALTER TABLE `znote_guild_wars`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_images`
--
ALTER TABLE `znote_images`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_news`
--
ALTER TABLE `znote_news`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_pagseguro`
--
ALTER TABLE `znote_pagseguro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account` (`account`);

--
-- Índices de tabela `znote_pagseguro_notifications`
--
ALTER TABLE `znote_pagseguro_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_paygol`
--
ALTER TABLE `znote_paygol`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_paypal`
--
ALTER TABLE `znote_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_players`
--
ALTER TABLE `znote_players`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_player_reports`
--
ALTER TABLE `znote_player_reports`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_shop`
--
ALTER TABLE `znote_shop`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_shop_logs`
--
ALTER TABLE `znote_shop_logs`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_shop_orders`
--
ALTER TABLE `znote_shop_orders`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_tickets`
--
ALTER TABLE `znote_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_tickets_replies`
--
ALTER TABLE `znote_tickets_replies`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_visitors`
--
ALTER TABLE `znote_visitors`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `znote_visitors_details`
--
ALTER TABLE `znote_visitors_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2768;

--
-- AUTO_INCREMENT de tabela `account_ban_history`
--
ALTER TABLE `account_ban_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=541;

--
-- AUTO_INCREMENT de tabela `market_history`
--
ALTER TABLE `market_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1300;

--
-- AUTO_INCREMENT de tabela `market_offers`
--
ALTER TABLE `market_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=439;

--
-- AUTO_INCREMENT de tabela `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3002;

--
-- AUTO_INCREMENT de tabela `shop_history`
--
ALTER TABLE `shop_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de tabela `znote`
--
ALTER TABLE `znote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `znote_accounts`
--
ALTER TABLE `znote_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2769;

--
-- AUTO_INCREMENT de tabela `znote_changelog`
--
ALTER TABLE `znote_changelog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_deleted_characters`
--
ALTER TABLE `znote_deleted_characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de tabela `znote_forum`
--
ALTER TABLE `znote_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `znote_forum_posts`
--
ALTER TABLE `znote_forum_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `znote_forum_threads`
--
ALTER TABLE `znote_forum_threads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `znote_guild_wars`
--
ALTER TABLE `znote_guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_images`
--
ALTER TABLE `znote_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_news`
--
ALTER TABLE `znote_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `znote_pagseguro`
--
ALTER TABLE `znote_pagseguro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_pagseguro_notifications`
--
ALTER TABLE `znote_pagseguro_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `znote_paygol`
--
ALTER TABLE `znote_paygol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_paypal`
--
ALTER TABLE `znote_paypal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_players`
--
ALTER TABLE `znote_players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3003;

--
-- AUTO_INCREMENT de tabela `znote_player_reports`
--
ALTER TABLE `znote_player_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_shop`
--
ALTER TABLE `znote_shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_shop_logs`
--
ALTER TABLE `znote_shop_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_shop_orders`
--
ALTER TABLE `znote_shop_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_tickets`
--
ALTER TABLE `znote_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `znote_tickets_replies`
--
ALTER TABLE `znote_tickets_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `znote_visitors`
--
ALTER TABLE `znote_visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_visitors_details`
--
ALTER TABLE `znote_visitors_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `account_bans`
--
ALTER TABLE `account_bans`
  ADD CONSTRAINT `account_bans_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_bans_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD CONSTRAINT `account_ban_history_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `guilds`
--
ALTER TABLE `guilds`
  ADD CONSTRAINT `guilds_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD CONSTRAINT `guildwar_kills_ibfk_1` FOREIGN KEY (`warid`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD CONSTRAINT `guild_membership_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_3` FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD CONSTRAINT `ip_bans_ibfk_1` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `market_history`
--
ALTER TABLE `market_history`
  ADD CONSTRAINT `market_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `market_offers`
--
ALTER TABLE `market_offers`
  ADD CONSTRAINT `market_offers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD CONSTRAINT `player_inboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_namelocks_ibfk_2` FOREIGN KEY (`namelocked_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `znote_guild_wars`
--
ALTER TABLE `znote_guild_wars`
  ADD CONSTRAINT `znote_guild_wars_ibfk_1` FOREIGN KEY (`id`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
