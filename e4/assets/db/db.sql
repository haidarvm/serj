/*
Navicat MySQL Data Transfer

Source Server         : localMy
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : kemenpan

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-07-26 12:34:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tlhp_jenis_pengawasan
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_jenis_pengawasan`;
CREATE TABLE `tlhp_jenis_pengawasan` (
  `jenis_pengawasan_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `jenis_pengawasan` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`jenis_pengawasan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_jenis_pengawasan
-- ----------------------------
INSERT INTO `tlhp_jenis_pengawasan` VALUES ('1', 'AUDIT');
INSERT INTO `tlhp_jenis_pengawasan` VALUES ('2', 'REVIU');
INSERT INTO `tlhp_jenis_pengawasan` VALUES ('3', 'EVALUASI');
INSERT INTO `tlhp_jenis_pengawasan` VALUES ('4', 'PEMANTAUAN');
INSERT INTO `tlhp_jenis_pengawasan` VALUES ('5', 'TINDAK LANJUT PENGADUAN');
INSERT INTO `tlhp_jenis_pengawasan` VALUES ('6', 'PENGAWASAN LAIN');

-- ----------------------------
-- Table structure for tlhp_kertas_kerja_temuan
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_kertas_kerja_temuan`;
CREATE TABLE `tlhp_kertas_kerja_temuan` (
  `kertas_kerja_id` int(10) NOT NULL AUTO_INCREMENT,
  `lhp_id` int(11) NOT NULL,
  `jenis_temuan` enum('sistem pengendalian internal','kepatuhan terhadap peraturan') DEFAULT NULL,
  `no_temuan` varchar(500) DEFAULT NULL,
  `kode_temuan_id` int(10) DEFAULT NULL,
  `uraian_temuan` varchar(500) DEFAULT NULL,
  `kode_sebab_id` int(4) DEFAULT NULL,
  `uraian_sebab` varchar(500) DEFAULT NULL,
  `nilai_temuan` varchar(500) DEFAULT NULL,
  `nama_ppk` varchar(500) DEFAULT NULL,
  `nama_pj_kegiatan` varchar(500) DEFAULT NULL,
  `jumlah_sesuai` int(10) DEFAULT NULL,
  `nilai_sesuai` double DEFAULT NULL,
  `jumlah_belum_sesuai` int(10) DEFAULT NULL,
  `nilai_belum_sesuai` double DEFAULT NULL,
  `jumlah_belum_tl` int(10) DEFAULT NULL,
  `nilai_belum_tl` double DEFAULT NULL,
  `jumlah_tidak_tl_alasan` int(10) DEFAULT NULL,
  `nilai_tidak_tl_alasan` double DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kertas_kerja_id`),
  KEY `fk_kk_user` (`user_id`),
  KEY `fk_kk_lhp` (`lhp_id`),
  KEY `fk_kk_kode_temuan` (`kode_temuan_id`),
  KEY `fk_kk_kode_sebab_idx` (`kode_sebab_id`),
  CONSTRAINT `fk_kk_kode_sebab` FOREIGN KEY (`kode_sebab_id`) REFERENCES `tlhp_kode_sebab` (`kode_sebab_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_kk_kode_temuan` FOREIGN KEY (`kode_temuan_id`) REFERENCES `tlhp_kode_temuan` (`kode_temuan_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_kk_lhp` FOREIGN KEY (`lhp_id`) REFERENCES `tlhp_lhp` (`lhp_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_kk_user` FOREIGN KEY (`user_id`) REFERENCES `tlhp_user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_kertas_kerja_temuan
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_kode_rekomendasi
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_kode_rekomendasi`;
CREATE TABLE `tlhp_kode_rekomendasi` (
  `kode_rekomendasi_id` int(10) NOT NULL AUTO_INCREMENT,
  `jenis` smallint(3) DEFAULT NULL,
  `deskripsi` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`kode_rekomendasi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_kode_rekomendasi
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_kode_sebab
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_kode_sebab`;
CREATE TABLE `tlhp_kode_sebab` (
  `kode_sebab_id` int(10) NOT NULL AUTO_INCREMENT,
  `jenis` smallint(3) DEFAULT NULL,
  `deskripsi` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`kode_sebab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_kode_sebab
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_kode_temuan
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_kode_temuan`;
CREATE TABLE `tlhp_kode_temuan` (
  `kode_temuan_id` int(10) NOT NULL AUTO_INCREMENT,
  `kelompok` smallint(3) DEFAULT NULL,
  `sub_kelompok` smallint(3) DEFAULT NULL,
  `jenis` smallint(3) DEFAULT NULL,
  `deskripsi` varchar(500) DEFAULT NULL,
  `atl_rekom` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`kode_temuan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_kode_temuan
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_lhp
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_lhp`;
CREATE TABLE `tlhp_lhp` (
  `lhp_id` int(11) NOT NULL AUTO_INCREMENT,
  `no_surat_tugas` varchar(1000) DEFAULT NULL,
  `tanggal_surat_tugas` date DEFAULT NULL,
  `hari_awal_penugasan` date DEFAULT NULL,
  `hari_akhir_penugasan` date DEFAULT NULL,
  `skop_awal_penugasan` date DEFAULT NULL,
  `skop_akhir_penugasan` date DEFAULT NULL,
  `jenis_pengawasan_id` tinyint(3) DEFAULT NULL,
  `objek_pengawasan` varchar(200) DEFAULT NULL,
  `judul_lhp` varchar(200) DEFAULT NULL,
  `nomor_lhp` varchar(200) DEFAULT NULL,
  `tanggal_lhp` date DEFAULT NULL,
  `nama_ppk` varchar(200) DEFAULT NULL,
  `pj_kegiatan` varchar(200) DEFAULT NULL,
  `st_perpanjangan` varchar(200) DEFAULT NULL,
  `tgl_st_perpanjangan` date DEFAULT NULL,
  `hari_awal_perpanjangan_penugasan` date DEFAULT NULL,
  `hari_akhir_perpanjangan_penugasan` date DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lhp_id`),
  KEY `fk_lhp_user_id` (`user_id`),
  KEY `fk_lhp_jenis_pengawasan` (`jenis_pengawasan_id`),
  CONSTRAINT `fk_lhp_jenis_pengawasan` FOREIGN KEY (`jenis_pengawasan_id`) REFERENCES `tlhp_jenis_pengawasan` (`jenis_pengawasan_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_lhp_user_id` FOREIGN KEY (`user_id`) REFERENCES `tlhp_user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_lhp
-- ----------------------------
INSERT INTO `tlhp_lhp` VALUES ('4', 'sdf', null, null, null, null, null, '1', 'sdf', 'sdf', 'sdf', null, null, null, 'sdf', null, null, null, '4', '2016-07-26 10:41:37', '2016-07-26 10:45:53');
INSERT INTO `tlhp_lhp` VALUES ('5', 'asfas', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '1', 'dfdasfsaf', 'asdf', 'asdfasdf', null, null, null, 'asf', '0000-00-00', '0000-00-00', '0000-00-00', '4', '2016-07-26 11:38:52', '2016-07-26 11:38:52');
INSERT INTO `tlhp_lhp` VALUES ('6', 'asdf', '2016-07-05', '2016-07-05', '2016-07-26', '2016-07-14', '2016-07-26', '1', null, 'sdfsdf', 'sdf', '2016-07-06', null, null, null, null, null, null, '4', '2016-07-26 12:08:40', '2016-07-26 12:08:40');
INSERT INTO `tlhp_lhp` VALUES ('7', 'TUGAS', '2016-07-07', '2016-07-12', '2016-07-12', '2016-07-12', '2016-07-25', '3', 'sdfPENGAWASAN', 'JUDUL', 'NOMOR', '2016-06-29', 'PPK', 'KEGIATAN', null, null, null, null, '4', '2016-07-26 12:12:15', '2016-07-26 12:12:15');
INSERT INTO `tlhp_lhp` VALUES ('8', 'TUGAS', '2016-07-07', '2016-07-12', '2016-07-12', '2016-07-12', '2016-07-25', '3', 'sdfPENGAWASAN', 'JUDUL', 'NOMOR', '2016-06-29', 'PPK', 'KEGIATAN', 'PERPANJANGAN', '0000-00-00', '0000-00-00', '0000-00-00', '4', '2016-07-26 12:12:46', '2016-07-26 12:12:46');
INSERT INTO `tlhp_lhp` VALUES ('9', 'TUGAS', '2016-07-07', '2016-07-12', '2016-07-12', '2016-07-12', '2016-07-25', '3', 'sdfPENGAWASAN', 'JUDUL', 'NOMOR', '2016-06-29', 'PPK', 'KEGIATAN', 'PERPANJANGAN', '2016-07-05', '2016-07-05', '2016-07-12', '4', '2016-07-26 12:14:33', '2016-07-26 12:14:33');
INSERT INTO `tlhp_lhp` VALUES ('10', 'TUGAS', '2016-07-07', '2016-07-12', '2016-07-12', '2016-07-12', '2016-07-25', '3', 'sdfPENGAWASAN', 'JUDUL', 'NOMOR', '2016-06-29', 'PPK', 'KEGIATAN', 'PERPANJANGAN', '1970-01-01', '1970-01-01', '1970-01-01', '4', '2016-07-26 12:14:53', '2016-07-26 12:14:53');

-- ----------------------------
-- Table structure for tlhp_persetujuan_tl
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_persetujuan_tl`;
CREATE TABLE `tlhp_persetujuan_tl` (
  `persetujuan_tl_id` int(10) NOT NULL AUTO_INCREMENT,
  `tindak_lanjut_id` int(11) DEFAULT NULL,
  `disetujui` tinyint(1) DEFAULT NULL,
  `nilai_disetujui` double DEFAULT NULL,
  `saldo_rekomendasi` double DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `komentar_inspektorat` text,
  `user_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`persetujuan_tl_id`),
  KEY `fk_persetujuan_tl` (`tindak_lanjut_id`),
  CONSTRAINT `fk_persetujuan_tl` FOREIGN KEY (`tindak_lanjut_id`) REFERENCES `tlhp_tindak_lanjut` (`tindak_lanjut_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_persetujuan_tl
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_rekomendasi
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_rekomendasi`;
CREATE TABLE `tlhp_rekomendasi` (
  `rekomendasi_id` int(11) NOT NULL AUTO_INCREMENT,
  `kertas_kerja_id` int(10) NOT NULL,
  `kode_rekomendasi_id` int(4) DEFAULT NULL,
  `uraian_rekomendasi` varchar(500) DEFAULT NULL,
  `kerugian_negara` tinyint(1) DEFAULT NULL,
  `nilai_rekomendasi` double DEFAULT NULL,
  PRIMARY KEY (`rekomendasi_id`),
  KEY `fk_kode_rekomen` (`kode_rekomendasi_id`),
  KEY `fk_rekomen_kk` (`kertas_kerja_id`),
  CONSTRAINT `fk_kode_rekomen` FOREIGN KEY (`kode_rekomendasi_id`) REFERENCES `tlhp_kode_rekomendasi` (`kode_rekomendasi_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_rekomen_kk` FOREIGN KEY (`kertas_kerja_id`) REFERENCES `tlhp_kertas_kerja_temuan` (`kertas_kerja_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_rekomendasi
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_template_laporan
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_template_laporan`;
CREATE TABLE `tlhp_template_laporan` (
  `template_laporan_id` int(10) NOT NULL AUTO_INCREMENT,
  `judul_laporan` varchar(500) DEFAULT NULL,
  `nomor_laporan` varchar(500) DEFAULT NULL,
  `periode_laporan` varchar(500) DEFAULT NULL,
  `tanggal_laporan` date DEFAULT NULL,
  `kata_pengantar` text,
  `daftar_isi` text,
  `user_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`template_laporan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_template_laporan
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_tim
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_tim`;
CREATE TABLE `tlhp_tim` (
  `tim_id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_tim` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`tim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_tim
-- ----------------------------
INSERT INTO `tlhp_tim` VALUES ('1', 'PEMBANTU PJ');
INSERT INTO `tlhp_tim` VALUES ('2', 'PENGENDALI MUTU');
INSERT INTO `tlhp_tim` VALUES ('3', 'PENGENDALI TEKNIS');
INSERT INTO `tlhp_tim` VALUES ('4', 'KETUA TIM');

-- ----------------------------
-- Table structure for tlhp_tim_lhp
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_tim_lhp`;
CREATE TABLE `tlhp_tim_lhp` (
  `tim_lhp_id` int(11) NOT NULL AUTO_INCREMENT,
  `lhp_id` int(11) NOT NULL,
  `kategory_tim` enum('biasa','perpanjangan') DEFAULT NULL,
  `tim_id` int(11) NOT NULL,
  `nama_tim` varchar(500) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tim_lhp_id`),
  KEY `fk_tim_id` (`tim_id`),
  KEY `fk_tim_lhp` (`lhp_id`),
  CONSTRAINT `fk_tim_id` FOREIGN KEY (`tim_id`) REFERENCES `tlhp_tim` (`tim_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_tim_lhp` FOREIGN KEY (`lhp_id`) REFERENCES `tlhp_lhp` (`lhp_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_tim_lhp
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_tindak_lanjut
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_tindak_lanjut`;
CREATE TABLE `tlhp_tindak_lanjut` (
  `tindak_lanjut_id` int(10) NOT NULL AUTO_INCREMENT,
  `tindak_lanjut` varchar(500) DEFAULT NULL,
  `rekomendasi_id` int(11) NOT NULL,
  `nilai` double DEFAULT NULL,
  `tanggal_tl` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_ppk` varchar(500) DEFAULT NULL,
  `nama_pj_kegiatan` varchar(500) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tindak_lanjut_id`),
  KEY `fk_tl_kk_idx` (`rekomendasi_id`),
  KEY `fk_tl_user` (`user_id`),
  CONSTRAINT `fk_tl_rekomen` FOREIGN KEY (`rekomendasi_id`) REFERENCES `tlhp_rekomendasi` (`rekomendasi_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tl_user` FOREIGN KEY (`user_id`) REFERENCES `tlhp_user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_tindak_lanjut
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_unit_kerja
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_unit_kerja`;
CREATE TABLE `tlhp_unit_kerja` (
  `unit_kerja_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `unit_kerja` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`unit_kerja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_unit_kerja
-- ----------------------------
INSERT INTO `tlhp_unit_kerja` VALUES ('1', 'DEPUTI I');
INSERT INTO `tlhp_unit_kerja` VALUES ('2', 'DEPUTI II');
INSERT INTO `tlhp_unit_kerja` VALUES ('3', 'DEPUTI III');
INSERT INTO `tlhp_unit_kerja` VALUES ('4', 'DEPUTI IV');
INSERT INTO `tlhp_unit_kerja` VALUES ('5', 'STAF AHLI');
INSERT INTO `tlhp_unit_kerja` VALUES ('6', 'INSPEKTORAT');
INSERT INTO `tlhp_unit_kerja` VALUES ('7', 'BIRO SDMU');
INSERT INTO `tlhp_unit_kerja` VALUES ('8', 'BIRO HUKIP');
INSERT INTO `tlhp_unit_kerja` VALUES ('9', 'BIRO BMOK');
INSERT INTO `tlhp_unit_kerja` VALUES ('10', 'KASN');
INSERT INTO `tlhp_unit_kerja` VALUES ('11', 'ALL');

-- ----------------------------
-- Table structure for tlhp_upload_lhp
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_upload_lhp`;
CREATE TABLE `tlhp_upload_lhp` (
  `upload_laporan_id` int(10) NOT NULL AUTO_INCREMENT,
  `lhp_id` int(11) NOT NULL,
  `file_name` varchar(500) DEFAULT NULL,
  `ext` varchar(500) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `url` varchar(2000) DEFAULT NULL,
  `path` varchar(2000) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`upload_laporan_id`),
  KEY `fk_upload_lhp` (`lhp_id`),
  CONSTRAINT `fk_upload_lhp` FOREIGN KEY (`lhp_id`) REFERENCES `tlhp_lhp` (`lhp_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_upload_lhp
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_upload_template_laporan
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_upload_template_laporan`;
CREATE TABLE `tlhp_upload_template_laporan` (
  `upload_template_id` int(10) NOT NULL AUTO_INCREMENT,
  `template_laporan_id` int(11) NOT NULL,
  `file_name` varchar(500) DEFAULT NULL,
  `ext` varchar(500) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `url` varchar(2000) DEFAULT NULL,
  `path` varchar(2000) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`upload_template_id`),
  KEY `fk_upload_template` (`template_laporan_id`),
  CONSTRAINT `fk_upload_template` FOREIGN KEY (`template_laporan_id`) REFERENCES `tlhp_template_laporan` (`template_laporan_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_upload_template_laporan
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_upload_tl
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_upload_tl`;
CREATE TABLE `tlhp_upload_tl` (
  `upload_template_id` int(10) NOT NULL AUTO_INCREMENT,
  `tindak_lanjut_id` int(11) NOT NULL,
  `file_name` varchar(500) DEFAULT NULL,
  `ext` varchar(500) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `url` varchar(2000) DEFAULT NULL,
  `path` varchar(2000) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`upload_template_id`),
  KEY `fk_upload_tl` (`tindak_lanjut_id`),
  CONSTRAINT `fk_upload_tl` FOREIGN KEY (`tindak_lanjut_id`) REFERENCES `tlhp_tindak_lanjut` (`tindak_lanjut_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_upload_tl
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_user
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_user`;
CREATE TABLE `tlhp_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `full_name` varchar(200) DEFAULT NULL,
  `nip` varchar(255) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `user_level_id` tinyint(2) DEFAULT NULL,
  `unit_kerja_id` tinyint(3) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `address2` varchar(500) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `zip_code` varchar(200) DEFAULT NULL,
  `other_phone` varchar(200) DEFAULT NULL,
  `active` varchar(200) DEFAULT NULL,
  `activation_key` varchar(200) DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `fk_user_level` (`user_level_id`),
  KEY `fk_user_unit_kerja` (`unit_kerja_id`),
  CONSTRAINT `fk_user_level` FOREIGN KEY (`user_level_id`) REFERENCES `tlhp_user_level` (`user_level_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_user_unit_kerja` FOREIGN KEY (`unit_kerja_id`) REFERENCES `tlhp_unit_kerja` (`unit_kerja_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_user
-- ----------------------------
INSERT INTO `tlhp_user` VALUES ('4', 'asdf', 'sadf', 'sadf', 'asdf', '1231231', '12', '1', '11', 'asdfsdf', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-24 19:40:42', '2016-07-25 12:07:38');
INSERT INTO `tlhp_user` VALUES ('5', 'fdgdfg', 'cvbcvb', 'sdf', 'erwrw', '324324', '12', '1', '2', 'werwer', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-24 19:41:06', '2016-07-25 12:07:40');

-- ----------------------------
-- Table structure for tlhp_user_history
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_user_history`;
CREATE TABLE `tlhp_user_history` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `login` datetime NOT NULL,
  `logout` datetime DEFAULT NULL,
  `total_use` time DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `fk_user_history` (`user_id`),
  CONSTRAINT `fk_user_history` FOREIGN KEY (`user_id`) REFERENCES `tlhp_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_user_history
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_user_level
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_user_level`;
CREATE TABLE `tlhp_user_level` (
  `user_level_id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `user_level` varchar(200) NOT NULL,
  PRIMARY KEY (`user_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_user_level
-- ----------------------------
INSERT INTO `tlhp_user_level` VALUES ('1', 'super admin');
INSERT INTO `tlhp_user_level` VALUES ('2', 'admin');
INSERT INTO `tlhp_user_level` VALUES ('3', 'user');
SET FOREIGN_KEY_CHECKS=1;
