UPDATE `tlhp_bpk_user` SET `active` = '1' ;
UPDATE `tlhp_bpkp_user` SET `active` = '1' ;
UPDATE `tlhp_ikp_user` SET `active` = '1' ;
UPDATE `tlhp_orix_user` SET `active` = '1' ;
ALTER TABLE `tlhp_bpk_user` CHANGE `active` `active` TINYINT(1) NOT NULL DEFAULT '1';
ALTER TABLE `tlhp_bpkp_user` CHANGE `active` `active` TINYINT(1) NOT NULL DEFAULT '1';
ALTER TABLE `tlhp_ikp_user` CHANGE `active` `active` TINYINT(1) NOT NULL DEFAULT '1';
ALTER TABLE `tlhp_orix_user` CHANGE `active` `active` TINYINT(1) NOT NULL DEFAULT '1';



