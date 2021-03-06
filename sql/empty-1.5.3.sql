DROP TABLE IF EXISTS `glpi_plugin_compte`;
CREATE TABLE `glpi_plugin_compte` (
	`ID` int(11) NOT NULL auto_increment,
	`FK_entities` int(11) NOT NULL default '0',
	`recursive` tinyint(1) NOT NULL default '0',
	`name` varchar(255) collate utf8_unicode_ci NOT NULL default '',
	`login` varchar(50) collate utf8_unicode_ci NOT NULL default '',
	`mdp` varchar(255) collate utf8_unicode_ci NOT NULL default '',
	`others` varchar(100) collate utf8_unicode_ci NOT NULL default '',
	`type` tinyint(4) NOT NULL default '1',
	`status` tinyint(4) NOT NULL default '1',
	`creation_date` DATE NULL default NULL,
	`expiration_date` DATE NULL default NULL,
	`FK_users` int(4) NOT NULL default '0',
	`FK_groups` int(11) NOT NULL default '0',
	`helpdesk_visible` int(11) NOT NULL default '1',
	`date_mod` datetime default NULL,
	`comments` text,
	`notes` LONGTEXT,
	`deleted` smallint(6) NOT NULL default '0',
	PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_compte_device`;
CREATE TABLE `glpi_plugin_compte_device` (
	`ID` int(11) NOT NULL auto_increment,
	`FK_compte` int(11) NOT NULL default '0',
	`FK_device` int(11) NOT NULL default '0',
	`device_type` int(11) NOT NULL default '0',
	PRIMARY KEY  (`ID`),
	UNIQUE KEY `FK_compte` (`FK_compte`,`FK_device`,`device_type`),
	KEY `FK_compte_2` (`FK_compte`),
	KEY `FK_device` (`FK_device`,`device_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_dropdown_plugin_compte_type`;
CREATE TABLE `glpi_dropdown_plugin_compte_type` (
	`ID` int(11) NOT NULL auto_increment,
	`FK_entities` int(11) NOT NULL default '0',
	`name` varchar(255) collate utf8_unicode_ci NOT NULL default '',
	`comments` text,
	PRIMARY KEY  (`ID`),
	KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_dropdown_plugin_compte_status`;
CREATE TABLE `glpi_dropdown_plugin_compte_status` (
	`ID` int(11) NOT NULL auto_increment,
	`name` varchar(255) collate utf8_unicode_ci NOT NULL default '',
	`comments` text,
	PRIMARY KEY  (`ID`),
	KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_compte_profiles`;
CREATE TABLE `glpi_plugin_compte_profiles` (
`ID` int(11) NOT NULL auto_increment,
`name` varchar(255) collate utf8_unicode_ci default NULL,
`compte` char(1) collate utf8_unicode_ci default NULL,
`all_users` char(1) default NULL,
`my_groups` char(1) default NULL,
`open_ticket` char(1) default NULL,
PRIMARY KEY  (`ID`),
KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_compte_hash`;
CREATE TABLE `glpi_plugin_compte_hash` (
  `ID` int(11) NOT NULL auto_increment,
  `hash` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_compte_aeskey`;
CREATE TABLE `glpi_plugin_compte_aeskey` (
  `ID` int(11) NOT NULL auto_increment,
  `aeskey` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_compte_config`;
CREATE TABLE `glpi_plugin_compte_config` (
  `ID` int(11) NOT NULL auto_increment,
  `delay` varchar(50) collate utf8_unicode_ci NOT NULL default '30',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_compte_default`;
CREATE TABLE `glpi_plugin_compte_default` (
	`ID` INT( 11 ) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	`status` INT( 11 ) NOT NULL 
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_compte_mailing`;
CREATE TABLE `glpi_plugin_compte_mailing` (
  `ID` int(11) NOT NULL auto_increment,
  `type` varchar(255) collate utf8_unicode_ci default NULL,
  `FK_item` int(11) NOT NULL default '0',
  `item_type` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `mailings` (`type`,`FK_item`,`item_type`),
  KEY `type` (`type`),
  KEY `FK_item` (`FK_item`),
  KEY `item_type` (`item_type`),
  KEY `items` (`item_type`,`FK_item`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_plugin_compte_config` ( `ID` , `delay` ) VALUES (1, '30');

INSERT INTO `glpi_plugin_compte_hash` ( `ID` , `hash` ) VALUES (1, '');

INSERT INTO glpi_plugin_compte_mailing ( `ID` , `type` , `FK_item` , `item_type`) VALUES ('1','compte','1','1');
INSERT INTO glpi_plugin_compte_mailing ( `ID` , `type` , `FK_item` , `item_type`) VALUES ('2','alert','1','1');

INSERT INTO `glpi_display` ( `ID` , `type` , `num` , `rank` , `FK_users` ) VALUES (NULL,'1900','2','3','0');
INSERT INTO `glpi_display` ( `ID` , `type` , `num` , `rank` , `FK_users` ) VALUES (NULL,'1900','3','1','0');
INSERT INTO `glpi_display` ( `ID` , `type` , `num` , `rank` , `FK_users` ) VALUES (NULL,'1900','4','2','0');
INSERT INTO `glpi_display` ( `ID` , `type` , `num` , `rank` , `FK_users` ) VALUES (NULL,'1900','5','4','0');
INSERT INTO `glpi_display` ( `ID` , `type` , `num` , `rank` , `FK_users` ) VALUES (NULL,'1900','6','5','0');
INSERT INTO `glpi_display` ( `ID` , `type` , `num` , `rank` , `FK_users` ) VALUES (NULL,'1900','7','6','0');
INSERT INTO `glpi_display` ( `ID` , `type` , `num` , `rank` , `FK_users` ) VALUES (NULL,'1901','2','3','0');
INSERT INTO `glpi_display` ( `ID` , `type` , `num` , `rank` , `FK_users` ) VALUES (NULL,'1901','3','1','0');
INSERT INTO `glpi_display` ( `ID` , `type` , `num` , `rank` , `FK_users` ) VALUES (NULL,'1901','4','2','0');
INSERT INTO `glpi_display` ( `ID` , `type` , `num` , `rank` , `FK_users` ) VALUES (NULL,'1901','5','4','0');
INSERT INTO `glpi_display` ( `ID` , `type` , `num` , `rank` , `FK_users` ) VALUES (NULL,'1901','6','5','0');
INSERT INTO `glpi_display` ( `ID` , `type` , `num` , `rank` , `FK_users` ) VALUES (NULL,'1901','7','6','0');
INSERT INTO `glpi_display` ( `ID` , `type` , `num` , `rank` , `FK_users` ) VALUES (NULL,'1902','2','3','0');
INSERT INTO `glpi_display` ( `ID` , `type` , `num` , `rank` , `FK_users` ) VALUES (NULL,'1902','3','1','0');
INSERT INTO `glpi_display` ( `ID` , `type` , `num` , `rank` , `FK_users` ) VALUES (NULL,'1902','4','2','0');
INSERT INTO `glpi_display` ( `ID` , `type` , `num` , `rank` , `FK_users` ) VALUES (NULL,'1902','5','4','0');
INSERT INTO `glpi_display` ( `ID` , `type` , `num` , `rank` , `FK_users` ) VALUES (NULL,'1902','6','5','0');
INSERT INTO `glpi_display` ( `ID` , `type` , `num` , `rank` , `FK_users` ) VALUES (NULL,'1902','7','6','0');
INSERT INTO `glpi_display` ( `ID` , `type` , `num` , `rank` , `FK_users` ) VALUES (NULL,'1902','8','7','0');