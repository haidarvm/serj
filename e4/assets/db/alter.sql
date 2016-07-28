UPDATE `tlhp_user` SET `username` = 'admin', `password` = MD5('admin') WHERE `tlhp_user`.`user_id` = 5;
ALTER TABLE `tlhp_user` CHANGE `jabatan_id` `jabatan` VARCHAR(255) NULL DEFAULT NULL;
