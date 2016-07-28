/*
Navicat MySQL Data Transfer

Source Server         : localMy
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : kemenpan

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2016-07-28 23:53:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tlhp_jenis_pengawasan
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpkp_jenis_pengawasan`;
CREATE TABLE `tlhp_bpkp_jenis_pengawasan` (
  `jenis_pengawasan_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `jenis_pengawasan` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`jenis_pengawasan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_jenis_pengawasan
-- ----------------------------
INSERT INTO `tlhp_bpkp_jenis_pengawasan` VALUES ('1', 'AUDIT');
INSERT INTO `tlhp_bpkp_jenis_pengawasan` VALUES ('2', 'REVIU');
INSERT INTO `tlhp_bpkp_jenis_pengawasan` VALUES ('3', 'EVALUASI');
INSERT INTO `tlhp_bpkp_jenis_pengawasan` VALUES ('4', 'PEMANTAUAN');
INSERT INTO `tlhp_bpkp_jenis_pengawasan` VALUES ('5', 'TINDAK LANJUT PENGADUAN');
INSERT INTO `tlhp_bpkp_jenis_pengawasan` VALUES ('6', 'PENGAWASAN LAIN');

-- ----------------------------
-- Table structure for tlhp_kertas_kerja_temuan
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpkp_kertas_kerja_temuan`;
CREATE TABLE `tlhp_bpkp_kertas_kerja_temuan` (
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
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kertas_kerja_id`),
  KEY `fk_bpkp_kk_user` (`user_id`),
  KEY `fk_bpkp_kk_lhp` (`lhp_id`),
  KEY `fk_bpkp_kk_kode_temuan` (`kode_temuan_id`),
  KEY `fk_bpkp_kk_kode_sebab_idx` (`kode_sebab_id`),
  CONSTRAINT `fk_bpkp_kk_kode_sebab` FOREIGN KEY (`kode_sebab_id`) REFERENCES `tlhp_bpkp_kode_sebab` (`kode_sebab_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bpkp_kk_kode_temuan` FOREIGN KEY (`kode_temuan_id`) REFERENCES `tlhp_bpkp_kode_temuan` (`kode_temuan_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_bpkp_kk_lhp` FOREIGN KEY (`lhp_id`) REFERENCES `tlhp_bpkp_lhp` (`lhp_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_bpkp_kk_user` FOREIGN KEY (`user_id`) REFERENCES `tlhp_bpkp_user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_kertas_kerja_temuan
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_kode_rekomendasi
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpkp_kode_rekomendasi`;
CREATE TABLE `tlhp_bpkp_kode_rekomendasi` (
  `kode_rekomendasi_id` int(10) NOT NULL AUTO_INCREMENT,
  `kode_rekomendasi` varchar(10) DEFAULT NULL,
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
DROP TABLE IF EXISTS `tlhp_bpkp_kode_sebab`;
CREATE TABLE `tlhp_bpkp_kode_sebab` (
  `kode_sebab_id` int(10) NOT NULL AUTO_INCREMENT,
  `kode_sebab` varchar(10) DEFAULT NULL,
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
DROP TABLE IF EXISTS `tlhp_bpkp_kode_temuan`;
CREATE TABLE `tlhp_bpkp_kode_temuan` (
  `kode_temuan_id` int(10) NOT NULL AUTO_INCREMENT,
  `kode_temuan` varchar(10) DEFAULT NULL,
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
DROP TABLE IF EXISTS `tlhp_bpkp_lhp`;
CREATE TABLE `tlhp_bpkp_lhp` (
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
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lhp_id`),
  KEY `fk_bpkp_lhp_user_id` (`user_id`),
  KEY `fk_bpkp_lhp_jenis_pengawasan` (`jenis_pengawasan_id`),
  CONSTRAINT `fk_bpkp_lhp_jenis_pengawasan` FOREIGN KEY (`jenis_pengawasan_id`) REFERENCES `tlhp_bpkp_jenis_pengawasan` (`jenis_pengawasan_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_bpkp_lhp_user_id` FOREIGN KEY (`user_id`) REFERENCES `tlhp_bpkp_user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_lhp
-- ----------------------------
INSERT INTO `tlhp_bpkp_lhp` VALUES ('4', 'sdf', null, null, null, null, null, '1', 'sdf', 'sdf', 'sdf', null, null, null, 'sdf', null, null, null, '4', '2016-07-26 10:41:37', '2016-07-26 10:45:53');
INSERT INTO `tlhp_bpkp_lhp` VALUES ('5', 'asfas', '2016-07-07', '2016-07-07', '2016-07-07', '2016-07-07', '2016-07-07', '1', 'dfdasfsaf', 'asdf', 'asdfasdf', null, null, null, 'asf', '2016-07-07', '2016-07-07', '2016-07-07', '4', '2016-07-26 11:38:52', '2016-07-26 11:38:52');
INSERT INTO `tlhp_bpkp_lhp` VALUES ('6', 'asdf', '2016-07-05', '2016-07-05', '2016-07-26', '2016-07-14', '2016-07-26', '1', null, 'sdfsdf', 'sdf', '2016-07-06', null, null, null, null, null, null, '4', '2016-07-26 12:08:40', '2016-07-26 12:08:40');
INSERT INTO `tlhp_bpkp_lhp` VALUES ('7', 'TUGAS', '2016-07-07', '2016-07-12', '2016-07-12', '2016-07-12', '2016-07-25', '3', 'sdfPENGAWASAN', 'JUDUL', 'NOMOR', '2016-06-29', 'PPK', 'KEGIATAN', null, null, null, null, '4', '2016-07-26 12:12:15', '2016-07-26 12:12:15');
INSERT INTO `tlhp_bpkp_lhp` VALUES ('8', 'TUGAS', '2016-07-07', '2016-07-12', '2016-07-12', '2016-07-12', '2016-07-25', '3', 'sdfPENGAWASAN', 'JUDUL', 'NOMOR', '2016-06-29', 'PPK', 'KEGIATAN', 'PERPANJANGAN', '2016-07-07', '2016-07-07', '2016-07-07', '4', '2016-07-26 12:12:46', '2016-07-26 12:12:46');
INSERT INTO `tlhp_bpkp_lhp` VALUES ('9', 'TUGAS', '2016-07-07', '2016-07-12', '2016-07-12', '2016-07-12', '2016-07-25', '3', 'sdfPENGAWASAN', 'JUDUL', 'NOMOR', '2016-06-29', 'PPK', 'KEGIATAN', 'PERPANJANGAN', '2016-07-05', '2016-07-05', '2016-07-12', '4', '2016-07-26 12:14:33', '2016-07-26 12:14:33');
INSERT INTO `tlhp_bpkp_lhp` VALUES ('10', 'TUGAS', '2016-07-07', '2016-07-12', '2016-07-12', '2016-07-12', '2016-07-25', '3', 'PENGAWASAN', 'JUDUL', 'NOMOR', '2016-06-29', 'PPK', 'KEGIATAN', 'PERPANJANGAN', '2016-07-07', '2016-07-07', '2016-07-07', '4', '2016-07-26 12:14:53', '2016-07-27 13:37:02');
INSERT INTO `tlhp_bpkp_lhp` VALUES ('11', 'dsf', '2016-07-07', '2016-07-07', '2016-07-07', '2016-07-07', '2016-07-07', '1', null, 'sdfsdf', 'sdfsdf', '2016-06-27', null, null, null, null, null, null, '4', '2016-07-26 13:25:56', '2016-07-26 13:25:56');
INSERT INTO `tlhp_bpkp_lhp` VALUES ('12', 'dsf', '2016-07-07', '2016-07-07', '2016-07-07', '2016-07-07', '2016-07-07', '2', null, 'hhgkihjkghjk', 'sdfsdf', '2016-06-27', null, null, null, null, null, null, '4', '2016-07-26 13:26:20', '2016-07-26 13:26:20');
INSERT INTO `tlhp_bpkp_lhp` VALUES ('13', null, '2016-07-07', '2016-07-07', '2016-07-07', '2016-07-07', '2016-07-07', '1', null, 'sdfd', null, '2016-07-07', null, null, null, null, null, null, '4', '2016-07-26 13:28:30', '2016-07-26 13:28:30');
INSERT INTO `tlhp_bpkp_lhp` VALUES ('14', 'sdfsdf', '2016-07-26', '2016-06-27', '2016-07-12', '2016-07-14', '2016-07-11', '1', 'sdfsdf', 'sdf', 'qwewqewqe', '2016-07-26', null, null, null, null, null, null, '4', '2016-07-26 14:32:23', '2016-07-26 14:32:23');
INSERT INTO `tlhp_bpkp_lhp` VALUES ('15', 'sdfsd', '2016-07-26', '2016-07-26', '2016-07-26', '2016-07-26', '2016-07-26', '1', 'sd', 'sd', 'sdfs', '2016-07-26', 'sd', null, null, null, null, null, '4', '2016-07-26 14:42:01', '2016-07-26 14:42:01');
INSERT INTO `tlhp_bpkp_lhp` VALUES ('16', 'sdfsd', '2016-07-26', '2016-07-26', '2016-07-26', '2016-07-26', '2016-07-26', '1', 'sd', 'sd', 'sdfs', '2016-07-26', 'sd', null, null, null, null, null, '4', '2016-07-26 14:42:50', '2016-07-26 14:42:50');
INSERT INTO `tlhp_bpkp_lhp` VALUES ('17', 'sdfsdf', '2016-07-12', '2016-07-06', '2016-07-13', '2016-07-26', '2016-07-05', '1', 'kg', 'tdxghf', 'jhfhf', '2016-07-26', 'jkgj', 'h', null, null, null, null, '4', '2016-07-26 20:43:04', '2016-07-26 20:43:04');

-- ----------------------------
-- Table structure for tlhp_persetujuan_tl
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpkp_persetujuan_tl`;
CREATE TABLE `tlhp_bpkp_persetujuan_tl` (
  `persetujuan_tl_id` int(10) NOT NULL AUTO_INCREMENT,
  `tindak_lanjut_id` int(11) DEFAULT NULL,
  `disetujui` tinyint(1) DEFAULT NULL,
  `nilai_disetujui` double DEFAULT NULL,
  `saldo_rekomendasi` double DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `komentar_inspektorat` text,
  `user_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`persetujuan_tl_id`),
  KEY `fk_bpkp_persetujuan_tl` (`tindak_lanjut_id`),
  CONSTRAINT `fk_bpkp_persetujuan_tl` FOREIGN KEY (`tindak_lanjut_id`) REFERENCES `tlhp_bpkp_tindak_lanjut` (`tindak_lanjut_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_persetujuan_tl
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_rekomendasi
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpkp_rekomendasi`;
CREATE TABLE `tlhp_bpkp_rekomendasi` (
  `rekomendasi_id` int(11) NOT NULL AUTO_INCREMENT,
  `kertas_kerja_id` int(10) NOT NULL,
  `kode_rekomendasi_id` int(4) DEFAULT NULL,
  `uraian_rekomendasi` varchar(500) DEFAULT NULL,
  `kerugian_negara` tinyint(1) DEFAULT NULL,
  `nilai_rekomendasi` double DEFAULT NULL,
  PRIMARY KEY (`rekomendasi_id`),
  KEY `fk_bpkp_kode_rekomen` (`kode_rekomendasi_id`),
  KEY `fk_bpkp_rekomen_kk` (`kertas_kerja_id`),
  CONSTRAINT `fk_bpkp_kode_rekomen` FOREIGN KEY (`kode_rekomendasi_id`) REFERENCES `tlhp_bpkp_kode_rekomendasi` (`kode_rekomendasi_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_bpkp_rekomen_kk` FOREIGN KEY (`kertas_kerja_id`) REFERENCES `tlhp_bpkp_kertas_kerja_temuan` (`kertas_kerja_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_rekomendasi
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_template_laporan
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpkp_template_laporan`;
CREATE TABLE `tlhp_bpkp_template_laporan` (
  `template_laporan_id` int(10) NOT NULL AUTO_INCREMENT,
  `judul_laporan` varchar(500) DEFAULT NULL,
  `nomor_laporan` varchar(500) DEFAULT NULL,
  `periode_laporan` varchar(500) DEFAULT NULL,
  `tanggal_laporan` date DEFAULT NULL,
  `kata_pengantar` text,
  `daftar_isi` text,
  `user_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`template_laporan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_template_laporan
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_test
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpkp_test`;
CREATE TABLE `tlhp_bpkp_test` (
  `user_level_id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `user_level` varchar(200) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_test
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_tim
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpkp_tim`;
CREATE TABLE `tlhp_bpkp_tim` (
  `tim_id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_tim` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`tim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_tim
-- ----------------------------
INSERT INTO `tlhp_bpkp_tim` VALUES ('1', 'PEMBANTU PJ');
INSERT INTO `tlhp_bpkp_tim` VALUES ('2', 'PENGENDALI MUTU');
INSERT INTO `tlhp_bpkp_tim` VALUES ('3', 'PENGENDALI TEKNIS');
INSERT INTO `tlhp_bpkp_tim` VALUES ('4', 'KETUA TIM');

-- ----------------------------
-- Table structure for tlhp_tim_lhp
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpkp_tim_lhp`;
CREATE TABLE `tlhp_bpkp_tim_lhp` (
  `tim_lhp_id` int(11) NOT NULL AUTO_INCREMENT,
  `lhp_id` int(11) NOT NULL,
  `kategory_tim` enum('biasa','perpanjangan') DEFAULT NULL,
  `tim_id` int(11) NOT NULL,
  `nama_tim` varchar(500) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tim_lhp_id`),
  KEY `fk_bpkp_tim_id` (`tim_id`),
  KEY `fk_bpkp_tim_lhp` (`lhp_id`),
  CONSTRAINT `fk_bpkp_tim_id` FOREIGN KEY (`tim_id`) REFERENCES `tlhp_bpkp_tim` (`tim_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_bpkp_tim_lhp` FOREIGN KEY (`lhp_id`) REFERENCES `tlhp_bpkp_lhp` (`lhp_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_tim_lhp
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_tindak_lanjut
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpkp_tindak_lanjut`;
CREATE TABLE `tlhp_bpkp_tindak_lanjut` (
  `tindak_lanjut_id` int(10) NOT NULL AUTO_INCREMENT,
  `tindak_lanjut` varchar(500) DEFAULT NULL,
  `rekomendasi_id` int(11) NOT NULL,
  `nilai` double DEFAULT NULL,
  `tanggal_tl` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_ppk` varchar(500) DEFAULT NULL,
  `nama_pj_kegiatan` varchar(500) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tindak_lanjut_id`),
  KEY `fk_bpkp_tl_kk_idx` (`rekomendasi_id`),
  KEY `fk_bpkp_tl_user` (`user_id`),
  CONSTRAINT `fk_bpkp_tl_rekomen` FOREIGN KEY (`rekomendasi_id`) REFERENCES `tlhp_bpkp_rekomendasi` (`rekomendasi_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_bpkp_tl_user` FOREIGN KEY (`user_id`) REFERENCES `tlhp_bpkp_user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_tindak_lanjut
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_unit_kerja
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpkp_unit_kerja`;
CREATE TABLE `tlhp_bpkp_unit_kerja` (
  `unit_kerja_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `unit_kerja` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`unit_kerja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_unit_kerja
-- ----------------------------
INSERT INTO `tlhp_bpkp_unit_kerja` VALUES ('1', 'DEPUTI I');
INSERT INTO `tlhp_bpkp_unit_kerja` VALUES ('2', 'DEPUTI II');
INSERT INTO `tlhp_bpkp_unit_kerja` VALUES ('3', 'DEPUTI III');
INSERT INTO `tlhp_bpkp_unit_kerja` VALUES ('4', 'DEPUTI IV');
INSERT INTO `tlhp_bpkp_unit_kerja` VALUES ('5', 'STAF AHLI');
INSERT INTO `tlhp_bpkp_unit_kerja` VALUES ('6', 'INSPEKTORAT');
INSERT INTO `tlhp_bpkp_unit_kerja` VALUES ('7', 'BIRO SDMU');
INSERT INTO `tlhp_bpkp_unit_kerja` VALUES ('8', 'BIRO HUKIP');
INSERT INTO `tlhp_bpkp_unit_kerja` VALUES ('9', 'BIRO BMOK');
INSERT INTO `tlhp_bpkp_unit_kerja` VALUES ('10', 'KASN');
INSERT INTO `tlhp_bpkp_unit_kerja` VALUES ('11', 'ALL');

-- ----------------------------
-- Table structure for tlhp_upload_lhp
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpkp_upload_lhp`;
CREATE TABLE `tlhp_bpkp_upload_lhp` (
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
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`upload_laporan_id`),
  KEY `fk_bpkp_upload_lhp` (`lhp_id`),
  CONSTRAINT `fk_bpkp_upload_lhp` FOREIGN KEY (`lhp_id`) REFERENCES `tlhp_bpkp_lhp` (`lhp_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_upload_lhp
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_upload_template_laporan
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpkp_upload_template_laporan`;
CREATE TABLE `tlhp_bpkp_upload_template_laporan` (
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
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`upload_template_id`),
  KEY `fk_bpkp_upload_template` (`template_laporan_id`),
  CONSTRAINT `fk_bpkp_upload_template` FOREIGN KEY (`template_laporan_id`) REFERENCES `tlhp_bpkp_template_laporan` (`template_laporan_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_upload_template_laporan
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_upload_tl
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpkp_upload_tl`;
CREATE TABLE `tlhp_bpkp_upload_tl` (
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
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`upload_template_id`),
  KEY `fk_bpkp_upload_tl` (`tindak_lanjut_id`),
  CONSTRAINT `fk_bpkp_upload_tl` FOREIGN KEY (`tindak_lanjut_id`) REFERENCES `tlhp_bpkp_tindak_lanjut` (`tindak_lanjut_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_upload_tl
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_user
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpkp_user`;
CREATE TABLE `tlhp_bpkp_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `full_name` varchar(200) DEFAULT NULL,
  `nip` varchar(255) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `user_level_id` tinyint(2) DEFAULT NULL,
  `unit_kerja_id` tinyint(3) DEFAULT NULL,
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
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `fk_bpkp_user_level` (`user_level_id`),
  KEY `fk_bpkp_user_unit_kerja` (`unit_kerja_id`),
  CONSTRAINT `fk_bpkp_user_level` FOREIGN KEY (`user_level_id`) REFERENCES `tlhp_bpkp_user_level` (`user_level_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_bpkp_user_unit_kerja` FOREIGN KEY (`unit_kerja_id`) REFERENCES `tlhp_bpkp_unit_kerja` (`unit_kerja_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_user
-- ----------------------------
INSERT INTO `tlhp_bpkp_user` VALUES ('4', 'asdf', 'asdfsdf', 'sadf', 'sadf', 'asdf', '1231231', '12', '2', '11', '', null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-24 19:40:42', '2016-07-27 10:42:34');
INSERT INTO `tlhp_bpkp_user` VALUES ('5', 'admin', '1acf7bbc7ac25ef584552fdb1314ebda', 'cvbcvb', 'sdf', 'admin', '324324', 'sdfsdfdsf', '1', '2', '', null, null, null, null, null, null, '343', null, null, null, null, null, '2016-07-24 19:41:06', '2016-07-28 19:55:37');
INSERT INTO `tlhp_bpkp_user` VALUES ('7', 'agus', 'sadfdsf', null, null, 'agus', 'asdf', 'sfd', '3', '1', 'asdf', null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-27 10:21:39', '2016-07-27 10:42:26');
INSERT INTO `tlhp_bpkp_user` VALUES ('8', 'dini', '34453d44c276edf818ef00f97f91bbb8', null, null, 'dini juliani', '2343', 'inspectorat', '2', '6', 'dini', null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-28 18:39:18', '2016-07-28 19:55:13');
INSERT INTO `tlhp_bpkp_user` VALUES ('10', 'aldo', 'aldo123', null, null, 'aldo is', '23422', 'opera', '3', '1', 'sdf', null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-28 21:05:39', '2016-07-28 21:05:39');

-- ----------------------------
-- Table structure for tlhp_user_history
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpkp_user_history`;
CREATE TABLE `tlhp_bpkp_user_history` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `login` datetime NOT NULL,
  `logout` datetime DEFAULT NULL,
  `total_use` time DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `fk_bpkp_user_history` (`user_id`),
  CONSTRAINT `fk_bpkp_user_history` FOREIGN KEY (`user_id`) REFERENCES `tlhp_bpkp_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_user_history
-- ----------------------------
INSERT INTO `tlhp_bpkp_user_history` VALUES ('1', '5', '2016-07-28 15:38:08', null, null);
INSERT INTO `tlhp_bpkp_user_history` VALUES ('2', '5', '2016-07-28 15:38:38', '2016-07-28 15:39:03', null);
INSERT INTO `tlhp_bpkp_user_history` VALUES ('3', '5', '2016-07-28 15:41:37', '2016-07-28 15:43:23', null);
INSERT INTO `tlhp_bpkp_user_history` VALUES ('4', '5', '2016-07-28 15:47:44', '2016-07-28 15:59:15', null);
INSERT INTO `tlhp_bpkp_user_history` VALUES ('5', '5', '2016-07-28 16:03:44', '2016-07-28 16:03:49', null);
INSERT INTO `tlhp_bpkp_user_history` VALUES ('6', '5', '2016-07-28 16:03:56', '2016-07-28 16:17:10', null);
INSERT INTO `tlhp_bpkp_user_history` VALUES ('7', '5', '2016-07-28 16:17:24', '2016-07-28 16:18:10', null);
INSERT INTO `tlhp_bpkp_user_history` VALUES ('8', '5', '2016-07-28 16:18:55', '2016-07-28 16:21:13', null);
INSERT INTO `tlhp_bpkp_user_history` VALUES ('9', '5', '2016-07-28 16:21:19', '2016-07-28 16:22:26', null);
INSERT INTO `tlhp_bpkp_user_history` VALUES ('10', '5', '2016-07-28 16:22:36', '2016-07-28 16:22:42', null);
INSERT INTO `tlhp_bpkp_user_history` VALUES ('11', '5', '2016-07-28 16:22:48', '2016-07-28 17:18:50', null);
INSERT INTO `tlhp_bpkp_user_history` VALUES ('12', '5', '2016-07-28 17:19:01', '2016-07-28 17:19:53', null);
INSERT INTO `tlhp_bpkp_user_history` VALUES ('13', '5', '2016-07-28 17:28:11', '2016-07-28 17:28:46', null);
INSERT INTO `tlhp_bpkp_user_history` VALUES ('14', '5', '2016-07-28 17:29:40', '2016-07-28 18:07:22', null);
INSERT INTO `tlhp_bpkp_user_history` VALUES ('15', '5', '2016-07-28 18:37:08', null, null);

-- ----------------------------
-- Table structure for tlhp_user_level
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpkp_user_level`;
CREATE TABLE `tlhp_bpkp_user_level` (
  `user_level_id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `user_level` varchar(200) NOT NULL,
  PRIMARY KEY (`user_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_user_level
-- ----------------------------
INSERT INTO `tlhp_bpkp_user_level` VALUES ('1', 'super admin');
INSERT INTO `tlhp_bpkp_user_level` VALUES ('2', 'admin');
INSERT INTO `tlhp_bpkp_user_level` VALUES ('3', 'user');
SET FOREIGN_KEY_CHECKS=1;
