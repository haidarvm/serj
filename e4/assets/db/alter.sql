ALTER TABLE `tlhp_kode_sebab` ADD `kode_sebab` VARCHAR(10) NULL AFTER `kode_sebab_id`;





# Done

UPDATE `tlhp_user` SET `username` = 'admin', `password` = MD5('admin') WHERE `tlhp_user`.`user_id` = 5;
ALTER TABLE `tlhp_user` CHANGE `jabatan_id` `jabatan` VARCHAR(255) NULL DEFAULT NULL;
