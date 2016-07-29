ALTER TABLE `tlhp_bpkp_kode_sebab` ADD `kode_sebab_group` TINYINT(3) NULL AFTER `kode_sebab_id`;
ALTER TABLE `tlhp_bpkp_kode_sebab` CHANGE `deskripsi` `uraian_sebab` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
ALTER TABLE `tlhp_bpkp_kode_sebab` DROP ` jenis `;
