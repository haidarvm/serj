/*
Navicat MySQL Data Transfer

Source Server         : localMy
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : e4

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2016-08-02 07:33:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tlhp_bpk_jenis_pengawasan
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_jenis_pengawasan`;
CREATE TABLE `tlhp_bpk_jenis_pengawasan` (
  `jenis_pengawasan_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `jenis_pengawasan` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`jenis_pengawasan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_jenis_pengawasan
-- ----------------------------
INSERT INTO `tlhp_bpk_jenis_pengawasan` VALUES ('1', 'AUDIT');
INSERT INTO `tlhp_bpk_jenis_pengawasan` VALUES ('2', 'REVIU');
INSERT INTO `tlhp_bpk_jenis_pengawasan` VALUES ('3', 'EVALUASI');
INSERT INTO `tlhp_bpk_jenis_pengawasan` VALUES ('4', 'PEMANTAUAN');
INSERT INTO `tlhp_bpk_jenis_pengawasan` VALUES ('5', 'TINDAK LANJUT PENGADUAN');
INSERT INTO `tlhp_bpk_jenis_pengawasan` VALUES ('6', 'PENGAWASAN LAIN');

-- ----------------------------
-- Table structure for tlhp_bpk_kertas_kerja_temuan
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_kertas_kerja_temuan`;
CREATE TABLE `tlhp_bpk_kertas_kerja_temuan` (
  `kertas_kerja_id` int(10) NOT NULL AUTO_INCREMENT,
  `lhp_id` int(11) NOT NULL,
  `jenis_temuan` enum('a','b','c') NOT NULL,
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
  KEY `fk_bpk_kk_user` (`user_id`),
  KEY `fk_bpk_kk_lhp` (`lhp_id`),
  KEY `fk_bpk_kk_kode_temuan` (`kode_temuan_id`),
  KEY `fk_bpk_kk_kode_sebab_idx` (`kode_sebab_id`),
  CONSTRAINT `fk_bpk_kk_kode_sebab` FOREIGN KEY (`kode_sebab_id`) REFERENCES `tlhp_bpk_kode_sebab` (`kode_sebab_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bpk_kk_kode_temuan` FOREIGN KEY (`kode_temuan_id`) REFERENCES `tlhp_bpk_kode_temuan` (`kode_temuan_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_bpk_kk_lhp` FOREIGN KEY (`lhp_id`) REFERENCES `tlhp_bpk_lhp` (`lhp_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_bpk_kk_user` FOREIGN KEY (`user_id`) REFERENCES `tlhp_bpk_user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_kertas_kerja_temuan
-- ----------------------------
INSERT INTO `tlhp_bpk_kertas_kerja_temuan` VALUES ('2', '19', '', null, null, 'sdf', '4', 'sdf', '123', null, null, null, null, null, null, null, null, null, null, '5', '2016-07-30 00:39:10', '2016-08-02 02:45:33');
INSERT INTO `tlhp_bpk_kertas_kerja_temuan` VALUES ('3', '19', '', null, null, 'sdf', '4', 'sdf', '123', null, null, null, null, null, null, null, null, null, null, '5', '2016-07-30 00:42:11', '2016-08-02 02:45:34');
INSERT INTO `tlhp_bpk_kertas_kerja_temuan` VALUES ('8', '20', 'a', null, null, 'ssf', '4', 'ssfdsfdsf', '12313', null, null, null, null, null, null, null, null, null, null, '5', '2016-07-30 02:08:22', '2016-08-02 02:45:35');
INSERT INTO `tlhp_bpk_kertas_kerja_temuan` VALUES ('9', '20', 'a', null, null, 'ssf', '4', 'ssfdsfdsf', '12313', null, null, null, null, null, null, null, null, null, null, '5', '2016-07-30 02:08:22', '2016-08-02 02:45:35');
INSERT INTO `tlhp_bpk_kertas_kerja_temuan` VALUES ('13', '21', 'a', null, null, 'uraian temuan 1', '5', 'uraian sebab 1', '123', null, null, null, null, null, null, null, null, null, null, '5', '2016-07-30 02:14:41', '2016-08-02 02:45:36');
INSERT INTO `tlhp_bpk_kertas_kerja_temuan` VALUES ('14', '22', 'b', null, null, 'uraian temuan 1', '17', 'uraian sebab 2', '789', null, null, null, null, null, null, null, null, null, null, '5', '2016-07-30 02:19:27', '2016-08-02 02:45:36');
INSERT INTO `tlhp_bpk_kertas_kerja_temuan` VALUES ('16', '25', 'a', null, null, 'sdf', '5', 'sfd', '123', null, null, null, null, null, null, null, null, null, null, '5', '2016-07-30 02:30:44', '2016-08-02 02:45:38');

-- ----------------------------
-- Table structure for tlhp_bpk_kode_rekomendasi
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_kode_rekomendasi`;
CREATE TABLE `tlhp_bpk_kode_rekomendasi` (
  `kode_rekomendasi_id` int(10) NOT NULL AUTO_INCREMENT,
  `kode_rekomendasi` varchar(10) DEFAULT NULL,
  `uraian_rekomendasi` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`kode_rekomendasi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_kode_rekomendasi
-- ----------------------------
INSERT INTO `tlhp_bpk_kode_rekomendasi` VALUES ('6', '00', 'KODE REKOMENDASI');
INSERT INTO `tlhp_bpk_kode_rekomendasi` VALUES ('7', '01', 'Penyetoran ke kas negara/daerah, kas BUMN/D, dan masyararakat');
INSERT INTO `tlhp_bpk_kode_rekomendasi` VALUES ('8', '02', 'Pengembalian barang kepada negara, daerah, BUMN/D, dan masyarakat');
INSERT INTO `tlhp_bpk_kode_rekomendasi` VALUES ('9', '03', 'Perbaikan fisik barang/jasa dalam proses pembangunan atau penggantian barang/jasa oleh rekanan');
INSERT INTO `tlhp_bpk_kode_rekomendasi` VALUES ('10', '04', 'Penghapusan barang milik negara/daerah');
INSERT INTO `tlhp_bpk_kode_rekomendasi` VALUES ('11', '05', 'Pelaksanaan sanksi administrasi kepegawaian');
INSERT INTO `tlhp_bpk_kode_rekomendasi` VALUES ('12', '06', 'Perbaikan laporan dan penertiban administrasi/kelengkapan administrasi');
INSERT INTO `tlhp_bpk_kode_rekomendasi` VALUES ('13', '07', 'Perbaikan sistem dan prosedur akuntansi dan pelaporan');
INSERT INTO `tlhp_bpk_kode_rekomendasi` VALUES ('14', '08', 'Peningkatan kualitas dan kuantitas sumber daya manusia pendukung sistem pengendalian');
INSERT INTO `tlhp_bpk_kode_rekomendasi` VALUES ('15', '09', 'Perubahan atau perbaikan prosedur, peraturan dan kebijakan');
INSERT INTO `tlhp_bpk_kode_rekomendasi` VALUES ('16', '10', 'Perubahan atau perbaikan struktur organisasi');
INSERT INTO `tlhp_bpk_kode_rekomendasi` VALUES ('17', '11', 'Koordinasi antar instansi termasuk juga penyerahan penanganan kasus kepada instansi yang berwenang');
INSERT INTO `tlhp_bpk_kode_rekomendasi` VALUES ('18', '12', 'Pelaksanaan penelitian oleh tim khusus atau audit lanjutan oleh unit pengawas intern');
INSERT INTO `tlhp_bpk_kode_rekomendasi` VALUES ('19', '13', 'Pelaksanaan sosialisasi');
INSERT INTO `tlhp_bpk_kode_rekomendasi` VALUES ('20', '14', 'Lain-lain');

-- ----------------------------
-- Table structure for tlhp_bpk_kode_sebab
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_kode_sebab`;
CREATE TABLE `tlhp_bpk_kode_sebab` (
  `kode_sebab_id` int(10) NOT NULL AUTO_INCREMENT,
  `kode_sebab_group` tinyint(3) DEFAULT NULL,
  `kode_sebab` varchar(10) DEFAULT NULL,
  `uraian_sebab` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`kode_sebab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_kode_sebab
-- ----------------------------
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('2', '0', '0', 'Penyebab lain yang belum didefinisikan (nihil)');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('3', '1', '100', 'KELEMAHAN PENGAWASAN MELEKAT');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('4', '1', '101', 'Pembagian wewenang dalam organisasi belum cukup jauh sehingga masih terdapat transaksi atau kegiatan organisasi yang seluruh tahapnya dikuasai oleh satu orang');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('5', '1', '102', 'Pembagian wewenang dalam organisasi belum cukup jelas sehingga ada kegiatan atau kejadian dalam organisasi yang tidak jelas penanggungjawabnya');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('6', '1', '103', 'Dalam organisasi tidak ada pembagian wewenang dan tugas');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('7', '1', '104', 'Kelalaian pejabat yang berwenang');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('8', '1', '105', 'Kelemahan lain organisasi');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('9', '2', '200', 'KELEMAHAN DALAM KEBIJAKAN/ KEBIJAKSANAAN');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('10', '2', '201', 'Kebijakan yang berlaku tidak jelas bagi para bawahan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('11', '2', '202', 'Kebijakan yang berlaku tidak dapat menjadi pedoman yang pasti bagi para bawahan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('12', '2', '203', 'Kebijaksanaan yang berlaku tidak dikomunikasikan secara lisan maupun tertulis');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('13', '2', '204', 'Tidak ada kebijakan yang digariskan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('14', '2', '205', 'Kelemahan lain kebijakan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('15', '2', '206', 'Kebijakan tidak sejalan/bertentangan dengan ketentuan yang lebih tinggi');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('16', '3', '300', 'KELEMAHAN DALAM RENCANA');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('17', '3', '301', 'Rencana kerja yang disusun tidak cukup luas sehingga belum mencakup seluruh kegiatan yang perlu dilaksanakan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('18', '3', '302', 'Hubungan kerja di antara kegiatan-kegiatan yang direncanakan tidak jelas dirumuskan sehingga tidak ada koordinasi di antara kegiatan-kegiatan itu');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('19', '3', '303', 'Sasaran yang akan dicapai tidak cukup jelas dirumuskan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('20', '3', '304', 'Sasaran yang akan dicapai tidak cukup dikuantifikasikan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('21', '3', '305', 'Tidak dibuat anggaran yang merupakan kuantifikasi moneter rencana kegiatan dan sasaran yang akan dicapai');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('22', '3', '306', 'Tidak ada rencana kegiatan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('23', '3', '307', 'Rencana kegiatan tidak cukup realistis');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('24', '3', '308', 'Anggaran tidak cukup realistis');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('25', '3', '309', 'Kelemahan lain perencanaan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('26', '3', '310', 'Perencanaan tidak matang');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('27', '4', '400', 'KELEMAHAN DALAM PROSEDUR');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('28', '4', '401', 'Prosedur yang ada tidak konsisten dengan kebijaksanaan yang perlu dilaksanakan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('29', '4', '402', 'Prosedur yang berlaku disalahtafsirkan oleh pegawai sehingga menyimpang dari tujuannya');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('30', '4', '403', 'Prosedur yang berlaku tidak dimengerti sehingga tidak dilaksanakan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('31', '4', '404', 'Prosedur yang berlaku terlalu mahal dibandingkan dengan sesuatu yang harus dijaga sehingga tidak dilaksanakan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('32', '4', '405', 'Prosedur yang berlaku kurang terinci');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('33', '4', '406', 'Prosedur yang berlaku tidak dapat menjadi pegangan bawahan karena tidak tertulis');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('34', '4', '407', 'Prosedur yang berlaku tidak dikomunikasikan secara tertulis maupun lisan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('35', '4', '408', 'Tidak terdapat prosedur yang diperlukan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('36', '4', '409', 'Kelemahan lain prosedur');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('37', '5', '500', 'KELEMAHAN DALAM PENCATATAN DAN PELAPORAN');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('38', '5', '501', 'Pencatatan tidak diselenggarakan secara cermat sehingga kehilangan keadaannya');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('39', '5', '502', 'Pencatatan tidak dimutakhirkan sehingga kehilangan peranannya sebagai alat pengawasan/pengendalian');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('40', '5', '503', 'Pencatatan tidak memenuhi kebutuhan informasi untuk pengambilan keputusan sehari-hari');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('41', '5', '504', 'Tidak diselenggarakan pencatatan yang perlu');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('42', '5', '505', 'Pelaporan tidak tepat waktu');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('43', '5', '506', 'Pelaporan tidak disusun dengan cermat');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('44', '5', '507', 'Pelaporan tidak disusun memenuhi kebutuhan pimpinan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('45', '5', '508', 'Pelaporan disusun dengan biaya mahal');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('46', '5', '509', 'Pelaporan yang diperlukan tidak ada');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('47', '5', '510', 'Kelemahan lain pencatatan atau pelaporan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('48', '6', '600', 'KELEMAHAN DALAM PEMBINAAN PERSONIL');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('49', '6', '601', 'Pegawai kurang mendapatkan supervisi (pengawasan) yang diperlukan (termasuk tidak dilakukan pemeriksaan kas bendaharawan oleh atasan langsung dan pemeriksaan fisik atas inventaris atau pers');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('50', '6', '602', 'Supervisor tidak menyadari siapa yang harus diawasi dan apa yang harus diawasi');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('51', '6', '603', 'Penugasan/penempatan pegawai tidak tepat/sesuai dengan latar belakang pendidikan ');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('52', '6', '604', 'Kelemahan lain pembinaan personil');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('53', '7', '700', 'KELEMAHAN DALAM PENGAWASAN INTERN (INTERNAL REVIEW)');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('54', '7', '701', 'Tidak ada satuan kerja atau pejabat yang diberi tanggung jawab untuk mengecek jalannya sistem dan prosedur yang telah ditetapkan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('55', '7', '702', 'Satuan kerja atau pejabat yang diberi tanggung jawab menguji jalannya sistem dan prosedur tidak berfungsi dengan baik');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('56', '7', '703', 'Kelemahan lain pengkajian intern');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('57', '8', '800', 'KELEMAHAN PENGAWASAN TERHADAP REKANAN');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('58', '8', '801', 'Kelemahan Pengawasan Pemimpin Proyek');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('59', '8', '802', 'Kelemahan Pengawasan Pimpinan Satker');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('60', '9', '900', 'PENYEBAB EKSTERN HAMBATAN KELANCARAN PROYEK');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('61', '9', '901', 'Pekerjaan persiapan proyek dan perumusan proyek kurang mantap (survei dan disain tidak mantap)');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('62', '9', '902', 'DIP terlambat diterima proyek');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('63', '9', '903', 'Revisi DIP yang diajukan pemimpin proyek penyelesaiannya menjadi berlarut-larut');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('64', '9', '904', 'Tanah yang diperlukan proyek penyelesaiannya menjadi berlarut-larut');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('65', '9', '905', 'Tidak dapat diperoleh tanah yang diperlukan proyek karena dana tidak mencukupi atau tidak tersedia');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('66', '9', '906', 'Penetapan rekanan menjadi berlarut-larut');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('67', '9', '907', 'Perijinan atau persetujuan untuk memulai suatu kegiatan proyek menjadi berlarut-larut');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('68', '9', '908', 'Sarana komunikasi dan atau telekomunikasi tidak mendukung kelancaran proyek');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('69', '9', '909', 'Rekanan yang ditetapkan tidak mampu menyelesaikan tanggungjawabnya');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('70', '9', '910', 'Penyebab ekstern hambatan kelancaran proyek lainnya');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('71', '9', '911', 'Rekanan mempunyai itikad yang kurang baik');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('72', '10', '1000', 'PENYEBAB EKSTERN HAMBATAN KELANCARAN TUGAS POKOK INSTANSI');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('73', '10', '1001', 'Instansi lain yang terkait kurang responsif');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('74', '10', '1002', 'Sarana komunikasi dan atau telekomunikasi tidak mendukung kelancaran tugas instansi');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('75', '10', '1003', 'Revisi DIK yang diajukan pimpinan instansi penyelesaiannya berlarut-larut');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('76', '10', '1004', 'Rekanan yang telah ditetapkan tidak mampu menyelesaikan tanggungjawabnya');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('77', '10', '1005', 'Perijinan atau persetujuan untuk memulai suatu kegiatan instansi menjadi berlarut-larut');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('78', '10', '1006', 'Penyebab ekstern hambatan kelancaran tupoksi lainnya');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('79', '10', '1007', 'Pencairan dana pinjaman tidak tepat waktu atau tidak sesuai jadwal kebutuhan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('80', '11', '1100', 'PENYEBAB KETIDAKLANCARAN PELAYANAN APARATUR PEMERINTAHAN/  BUMN/BUMD KEPADA MASYARAKAT');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('81', '11', '1101', 'Prosedur yang ditetapkan belum sederhana');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('82', '11', '1102', 'Masyarakat buta terhadap persyaratan yang perlu dipenuhi dan prosedur yang harus ditempuh');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('83', '11', '1103', 'Tidak ada batas waktu maksimum penyelesaian pelayanan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('84', '11', '1104', 'Prosedur yang ditetapkan cukup banyak titik pertemuan pegawai dengan masyarakat sehingga membuka peluang pungutan liar');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('85', '11', '1105', 'Persyaratan yang ditetapkan berlebihan sehingga menyulitkan pemohonan pelayanan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('86', '11', '1106', 'Tidak ada koordinasi antar instansi sehingga jelas siapa yang berwenang mengambil keputusan');
INSERT INTO `tlhp_bpk_kode_sebab` VALUES ('87', '11', '1107', 'Penyebab lain ketidaklancaran pelayanan');

-- ----------------------------
-- Table structure for tlhp_bpk_kode_temuan
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_kode_temuan`;
CREATE TABLE `tlhp_bpk_kode_temuan` (
  `kode_temuan_id` int(10) NOT NULL AUTO_INCREMENT,
  `kelompok` smallint(3) DEFAULT NULL,
  `sub_kelompok` smallint(3) DEFAULT NULL,
  `jenis` smallint(3) DEFAULT NULL,
  `kode_temuan` varchar(1000) DEFAULT NULL,
  `alt_rekom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kode_temuan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_kode_temuan
-- ----------------------------
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('1', '1', '1', '1', 'Temuan Ketidakpatuhan Terhadap Peraturan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('2', '1', '1', null, 'Kerugian negara/daerah atau kerugian negara/daerah\r\nyang terjadi pada perusahaan milik negara/daerah', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('3', '1', '1', '1', 'Belanja dan/atau pengadaan barang/jasa fiktif', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('4', '1', '1', '2', 'Rekanan pengadaan barang/jasa tidak menyelesaikan\r\npekerjaan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('5', '1', '1', '3', 'Kekurangan volume pekerjaan dan/atau barang', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('6', '1', '1', '4', 'Kelebihan pembayaran selain kekurangan volume pekerjaan\r\ndan/atau barang', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('7', '1', '1', '5', 'Pemahalan harga (Mark up)', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('8', '1', '1', '6', 'Penggunaan uang/barang untuk kepentingan pribadi', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('9', '1', '1', '7', 'Pembayaran honorarium dan/atau biaya perjalanan dinas\r\nganda dan/atau melebihi standar yang ditetapkan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('10', '1', '1', '8', 'Spesifikasi barang/jasa yang diterima tidak sesuai dengan\r\nkontrak', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('11', '1', '1', '9', 'Belanja tidak sesuai atau melebihi ketentuan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('12', '1', '1', '10', 'Pengembalian pinjaman/piutang atau dana bergulir macet', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('13', '1', '1', '11', 'Kelebihan penetapan dan pembayaran restitusi pajak atau\r\npenetapan kompensasi kerugian', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('14', '1', '1', '12', 'Penjualan/pertukaran/penghapusan aset negara/daerah tidak\r\nsesuai ketentuan dan merugikan negara/daerah', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('15', '1', '1', '13', 'Pengenaan ganti kerugian negara belum/tidak dilaksanakan\r\nsesuai ketentuan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('16', '1', '1', '14', 'Entitas belum/tidak melaksanakan tuntutan perbendaharaan\r\n(TP) sesuai ketentuan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('17', '1', '1', '15', 'Penghapusan hak tagih tidak sesuai ketentuan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('18', '1', '1', '16', 'Pelanggaran ketentuan pemberian diskon penjualan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('19', '1', '1', '17', 'Penentuan HPP (harga pokok pembelian) terlalu rendah\r\nsehingga penentuan harga jual lebih rendah dari yang\r\nseharusnya', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('20', '1', '1', '18', 'Jaminan pelaksanaan dalam pelaksanaan pekerjaan,\r\npemanfaatan barang dan pemberian fasilitas tidak dapat\r\ndicairkan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('21', '1', '1', '19', 'Penyetoran penerimaan negara/daerah dengan bukti fiktif', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('22', '1', '2', null, 'Potensi kerugian negara/daerah atau kerugian\r\nnegara/daerah yang terjadi pada perusahaan milik\r\nnegara/daerah', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('23', '1', '2', '1', 'Kelebihan pembayaran dalam pengadaan barang/jasa tetapi\r\npembayaran pekerjaan belum dilakukan sebagian atau\r\nseluruhnya', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('24', '1', '2', '2', 'Rekanan belum melaksanakan kewajiban pemeliharaan\r\nbarang hasil pengadaan yang telah rusak selama masa\r\npemeliharaan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('25', '1', '2', '3', 'Aset dikuasai pihak lain', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('26', '1', '2', '4', 'Pembelian aset yang berstatus sengketa', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('27', '1', '2', '5', 'Aset tidak diketahui keberadaannya', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('28', '1', '2', '6', 'Pemberian jaminan pelaksanaan dalam pelaksanaan\r\npekerjaan, pemanfaatan barang dan pemberian fasilitas tidak\r\nsesuai ketentuan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('29', '1', '2', '7', 'Pihak ketiga belum melaksanakan kewajiban untuk\r\nmenyerahkan aset kepada negara/daerah', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('30', '1', '2', '8', 'Piutang/pinjaman atau dana bergulir yang berpotensi tidak\r\ntertagih', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('31', '1', '2', '9', 'Penghapusan piutang tidak sesuai ketentuan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('32', '1', '2', '10', 'Pencairan anggaran pada akhir tahun anggaran untuk\r\npekerjaan yang belum selesai', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('33', '1', '3', null, 'Kekurangan penerimaan negara/daerah atau perusahaan\r\nmilik negara/daerah', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('34', '1', '3', '1', 'Penerimaan negara/daerah atau denda keterlambatan\r\npekerjaan belum/tidak ditetapkan dipungut/diterima/disetor ke\r\nkas negara/daerah atau perusahaan milik negara/daerah', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('35', '1', '3', '2', 'Penggunaan langsung penerimaan negara/daerah', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('36', '1', '3', '3', 'Dana Perimbangan yang telah ditetapkan belum masuk ke\r\nkas daerah', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('37', '1', '3', '4', 'Penerimaan negara/daerah diterima atau digunakan oleh\r\ninstansi yang tidak berhak', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('38', '1', '3', '5', 'Pengenaan tarif pajak/PNBP lebih rendah dari ketentuan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('39', '1', '3', '6', 'Koreksi perhitungan bagi hasil dengan KKKS', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('40', '1', '3', '7', 'Kelebihan pembayaran subsidi oleh pemerintah', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('41', '1', '4', null, 'Administrasi', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('42', '1', '4', '1', 'Pertanggungjawaban tidak akuntabel (bukti tidak\r\nlengkap/tidak valid)', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('43', '1', '4', '2', 'Pekerjaan dilaksanakan mendahului kontrak atau penetapan\r\nanggaran', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('44', '1', '4', '3', 'Proses pengadaan barang/jasa tidak sesuai ketentuan (tidak\r\nmenimbulkan kerugian negara)', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('45', '1', '4', '4', 'Pemecahan kontrak untuk menghindari pelelangan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('46', '1', '4', '5', 'Pelaksanaan lelang secara performa', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('47', '1', '4', '6', 'Penyimpangan terhadap peraturan perundang-undangan\r\nbidang pengelolaan perlengkapan atau barang milik', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('48', '1', '4', '7', 'Penyimpangan terhadap peraturan perundang-undangan\r\nbidang tertentu lainnya seperti kehutanan, pertambangan,\r\nperpajakan, dll', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('49', '1', '4', '8', 'Koreksi perhitungan subsidi/kewajiban pelayanan umum', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('50', '1', '4', '9', 'Pembentukan cadangan piutang, perhitungan penyusutan\r\natau amortisasi tidak sesuai ketentuan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('51', '1', '4', '10', 'Penyetoran penerimaan negara/daerah atau kas di\r\nbendaharawan ke kas negara/daerah melebihi batas waktu\r\nyang ditentukan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('52', '1', '4', '11', 'Pertanggungjawaban/penyetoran uang persediaan melebihi\r\nbatas waktu yang ditentukan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('53', '1', '4', '12', 'Sisa kas di bendahara pengeluaran akhir tahun anggaran\r\nbelum/tidak disetor ke kas negara/daerah', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('54', '1', '4', '13', 'Pengeluaran investasi pemerintah tidak didukung bukti yang\r\nsah', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('55', '1', '4', '14', 'Kepemilikan aset tidak/belum didukung bukti yang sah', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('56', '1', '4', '15', 'Pengalihan anggaran antar MAK tidak sah', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('57', '1', '4', '16', 'Pelampauan pagu anggaran', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('58', '1', '5', null, 'Indikasi tindak pidana', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('59', '1', '5', '1', 'Indikasi tindak pidana korupsi', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('60', '1', '5', '2', 'Indikasi tindak pidana perbankan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('61', '1', '5', '3', 'Indikasi tindak pidana perpajakan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('62', '1', '5', '4', 'Indikasi tindak pidana kepabeanan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('63', '1', '5', '5', 'Indikasi tindak pidana kehutanan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('64', '1', '5', '6', 'Indikasi tindak pidana pasar modal', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('65', '1', '5', '7', 'Indikasi tindak pidana khusus lainnya', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('66', '2', null, null, 'Temuan kelemahan sistem pengendalian intern', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('67', '2', '1', null, 'Kelemahan sistem pengendalian akuntansi dan\r\npelaporan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('68', '2', '1', '1', 'Pencatatan tidak/belum dilakukan atau tidak akurat', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('69', '2', '1', '2', 'Proses penyusunan laporan tidak sesuai ketentuan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('70', '2', '1', '3', 'Entitas terlambat menyampaikan laporan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('71', '2', '1', '4', 'Sistem informasi akuntansi dan pelaporan tidak memadai', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('72', '2', '1', '5', 'Sistem informasi akuntansi dan pelaporan belum didukung\r\nSDM yang memadai', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('73', '2', '2', null, 'Kelemahan sistem pengendalian pelaksanaan anggaran\r\npendapatan dan belanja', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('74', '2', '2', '1', 'Perencanaan kegiatan tidak memadai', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('75', '2', '2', '2', 'Mekanisme pemungutan, penyetoran dan pelaporan serta\r\npenggunaan Penerimaan negara/daerah/perusahaan dan\r\nhibah tidak sesuai ketentuan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('76', '2', '2', '3', 'Penyimpangan terhadap peraturan perundang-undangan\r\nbidang teknis tertentu atau ketentuan intern organisasi yang\r\ndiperiksa tentang pendapatan dan belanja', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('77', '2', '2', '4', 'Pelaksanaan belanja di luar mekanisme APBN/APBD', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('78', '2', '2', '5', 'Penetapan/pelaksanaan kebijakan tidak tepat atau belum\r\ndilakukan berakibat hilangnya potensi\r\npenerimaan/pendapatan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('79', '2', '2', '6', 'Penetapan/pelaksanaan kebijakan tidak tepat atau belum\r\ndilakukan berakibat peningkatan biaya /belanja', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('80', '2', '2', '7', 'Kelemahan pengelolaan fisik aset', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('81', '2', '3', null, 'Kelemahan struktur pengendalian intern', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('82', '2', '3', '1', 'Entitas tidak memiliki SOP yang formal untuk suatu prosedur\r\natau keseluruhan prosedur', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('83', '2', '3', '2', 'SOP yang ada pada entitas tidak berjalan secara optimal\r\natau tidak ditaati', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('84', '2', '3', '3', 'Entitas tidak memiliki satuan pengawas intern', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('85', '2', '3', '4', 'Satuan pengawas intern yang ada tidak memadai atau tidak\r\nberjalan optimal', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('86', '2', '3', '5', 'Tidak ada pemisahan tugas dan fungsi yang memadai', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('87', '3', null, null, 'Temuan 3E', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('88', '3', '1', null, 'Ketidakhematan/pemborosan/ketidakekonomisan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('89', '3', '1', '1', 'Pengadaan barang/jasa melebihi kebutuhan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('90', '3', '1', '2', 'Penetapan kualitas dan kuantitas barang/jasa yang\r\ndigunakan tidak sesuai standar', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('91', '3', '1', '3', 'Pemborosan keuangan negara/daerah/perusahaan atau\r\nkemahalan harga', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('92', '3', '2', null, 'Ketidakefisienan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('93', '3', '2', '1', 'Penggunaan kuantitas input untuk satu satuan output lebih\r\nbesar/tinggi dari yang seharusnya', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('94', '3', '2', '2', 'Penggunaan kualitas input untuk satu satuan output lebih\r\ntinggi dari seharusnya', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('95', '3', '3', null, 'Ketidakefektifan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('96', '3', '3', '1', 'Penggunaan anggaran tidak tepat sasaran/tidak sesuai\r\nperuntukan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('97', '3', '3', '2', 'Pemanfaatan barang/jasa dilakukan tidak sesuai dengan\r\nrencana yang ditetapkan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('98', '3', '3', '3', 'Barang yang dibeli belum/tidak dapat dimanfaatkan', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('99', '3', '3', '4', 'Pemanfaatan barang/jasa tidak berdampak terhadap\r\npencapaian tujuan organisasi', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('100', '3', '3', '5', 'Pelaksanaan kegiatan terlambat/terhambat sehingga\r\nmempengaruhi pencapaian tujuan organisasi', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('101', '3', '3', '6', 'Pelayanan kepada masyarakat tidak optimal', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('102', '3', '3', '7', 'Fungsi atau tugas instansi yang diperiksa tidak\r\ndiselenggarakan dengan baik termasuk target penerimaan\r\ntidak tercapai', null);
INSERT INTO `tlhp_bpk_kode_temuan` VALUES ('103', '3', '3', '8', 'Penggunaan biaya promosi/pemasaran tidak efektif', null);

-- ----------------------------
-- Table structure for tlhp_bpk_lhp
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_lhp`;
CREATE TABLE `tlhp_bpk_lhp` (
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
  KEY `fk_bpk_lhp_user_id` (`user_id`),
  KEY `fk_bpk_lhp_jenis_pengawasan` (`jenis_pengawasan_id`),
  CONSTRAINT `fk_bpk_lhp_jenis_pengawasan` FOREIGN KEY (`jenis_pengawasan_id`) REFERENCES `tlhp_bpk_jenis_pengawasan` (`jenis_pengawasan_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_bpk_lhp_user_id` FOREIGN KEY (`user_id`) REFERENCES `tlhp_bpk_user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_lhp
-- ----------------------------
INSERT INTO `tlhp_bpk_lhp` VALUES ('4', 'sdf', null, null, null, null, null, '1', 'sdf', 'sdf', 'sdf', null, null, null, 'sdf', null, null, null, '4', '2016-07-26 10:41:37', '2016-07-26 10:45:53');
INSERT INTO `tlhp_bpk_lhp` VALUES ('5', 'asfas', '2016-07-07', '2016-07-07', '2016-07-07', '2016-07-07', '2016-07-07', '1', 'dfdasfsaf', 'asdf', 'asdfasdf', null, null, null, 'asf', '2016-07-07', '2016-07-07', '2016-07-07', '4', '2016-07-26 11:38:52', '2016-07-26 11:38:52');
INSERT INTO `tlhp_bpk_lhp` VALUES ('6', 'asdf', '2016-07-05', '2016-07-05', '2016-07-26', '2016-07-14', '2016-07-26', '1', null, 'sdfsdf', 'sdf', '2016-07-06', null, null, null, null, null, null, '4', '2016-07-26 12:08:40', '2016-07-26 12:08:40');
INSERT INTO `tlhp_bpk_lhp` VALUES ('7', 'TUGAS', '2016-07-07', '2016-07-12', '2016-07-12', '2016-07-12', '2016-07-25', '3', 'sdfPENGAWASAN', 'JUDUL', 'NOMOR', '2016-06-29', 'PPK', 'KEGIATAN', null, null, null, null, '4', '2016-07-26 12:12:15', '2016-07-26 12:12:15');
INSERT INTO `tlhp_bpk_lhp` VALUES ('8', 'TUGAS', '2016-07-07', '2016-07-12', '2016-07-12', '2016-07-12', '2016-07-25', '3', 'sdfPENGAWASAN', 'JUDUL', 'NOMOR', '2016-06-29', 'PPK', 'KEGIATAN', 'PERPANJANGAN', '2016-07-07', '2016-07-07', '2016-07-07', '4', '2016-07-26 12:12:46', '2016-07-26 12:12:46');
INSERT INTO `tlhp_bpk_lhp` VALUES ('9', 'TUGAS', '2016-07-07', '2016-07-12', '2016-07-12', '2016-07-12', '2016-07-25', '3', 'sdfPENGAWASAN', 'JUDUL', 'NOMOR', '2016-06-29', 'PPK', 'KEGIATAN', 'PERPANJANGAN', '2016-07-05', '2016-07-05', '2016-07-12', '4', '2016-07-26 12:14:33', '2016-07-26 12:14:33');
INSERT INTO `tlhp_bpk_lhp` VALUES ('10', 'TUGAS', '2016-07-07', '2016-07-12', '2016-07-12', '2016-07-12', '2016-07-25', '3', 'PENGAWASAN', 'JUDUL', 'NOMOR', '2016-06-29', 'PPK', 'KEGIATAN', 'PERPANJANGAN', '2016-07-07', '2016-07-07', '2016-07-07', '4', '2016-07-26 12:14:53', '2016-07-27 13:37:02');
INSERT INTO `tlhp_bpk_lhp` VALUES ('11', 'dsf', '2016-07-07', '2016-07-07', '2016-07-07', '2016-07-07', '2016-07-07', '1', null, 'sdfsdf', 'sdfsdf', '2016-06-27', null, null, null, null, null, null, '4', '2016-07-26 13:25:56', '2016-07-26 13:25:56');
INSERT INTO `tlhp_bpk_lhp` VALUES ('12', 'dsf', '2016-07-07', '2016-07-07', '2016-07-07', '2016-07-07', '2016-07-07', '2', null, 'hhgkihjkghjk', 'sdfsdf', '2016-06-27', null, null, null, null, null, null, '4', '2016-07-26 13:26:20', '2016-07-26 13:26:20');
INSERT INTO `tlhp_bpk_lhp` VALUES ('13', null, '2016-07-07', '2016-07-07', '2016-07-07', '2016-07-07', '2016-07-07', '1', null, 'sdfd', null, '2016-07-07', null, null, null, null, null, null, '4', '2016-07-26 13:28:30', '2016-07-26 13:28:30');
INSERT INTO `tlhp_bpk_lhp` VALUES ('14', 'sdfsdf', '2016-07-26', '2016-06-27', '2016-07-12', '2016-07-14', '2016-07-11', '1', 'sdfsdf', 'sdf', 'qwewqewqe', '2016-07-26', null, null, null, null, null, null, '4', '2016-07-26 14:32:23', '2016-07-26 14:32:23');
INSERT INTO `tlhp_bpk_lhp` VALUES ('15', 'sdfsd', '2016-07-26', '2016-07-26', '2016-07-26', '2016-07-26', '2016-07-26', '1', 'sd', 'sd', 'sdfs', '2016-07-26', 'sd', null, null, null, null, null, '4', '2016-07-26 14:42:01', '2016-07-26 14:42:01');
INSERT INTO `tlhp_bpk_lhp` VALUES ('16', 'sdfsd', '2016-07-26', '2016-07-26', '2016-07-26', '2016-07-26', '2016-07-26', '1', 'sd', 'sd', 'sdfs', '2016-07-26', 'sd', null, null, null, null, null, '4', '2016-07-26 14:42:50', '2016-07-26 14:42:50');
INSERT INTO `tlhp_bpk_lhp` VALUES ('17', 'sdfsdf', '2016-07-12', '2016-07-06', '2016-07-13', '2016-07-26', '2016-07-05', '1', 'kg', 'tdxghf', 'jhfhf', '2016-07-26', 'jkgj', 'h', null, null, null, null, '4', '2016-07-26 20:43:04', '2016-07-26 20:43:04');
INSERT INTO `tlhp_bpk_lhp` VALUES ('18', 'asdfsdf', '2016-07-15', '2016-07-12', '2016-07-11', '2016-07-12', '2016-07-12', '1', 'sdfsdf', 'judul haidar', 'sdfsdf', '2016-07-27', null, null, 'sdf', '2016-07-14', '2016-07-05', '2016-07-11', '4', '2016-07-29 18:27:36', '2016-07-29 18:27:36');
INSERT INTO `tlhp_bpk_lhp` VALUES ('19', 'sdfsf', '2016-07-12', '2016-07-19', '2016-07-20', '2016-07-14', '2016-07-18', '1', 'sdf', 'atang test', '23423424', '2016-07-29', null, null, 'sdfsdf', '2016-07-12', '2016-07-26', '2016-07-26', '4', '2016-07-29 20:48:52', '2016-07-29 20:48:52');
INSERT INTO `tlhp_bpk_lhp` VALUES ('20', 'sfdsf', '2016-07-15', '2016-07-06', '2016-07-12', '2016-07-06', '2016-07-21', '1', 'sdfsdf', 'bismillah haidar', 'sdfdsf', '2016-07-30', null, null, null, null, null, null, '4', '2016-07-30 00:58:57', '2016-07-30 00:58:57');
INSERT INTO `tlhp_bpk_lhp` VALUES ('21', '123', '2016-07-30', '2016-07-20', '2016-07-13', '2016-07-13', '2016-07-19', '1', 'sdfsdf', 'bismillah tim', 'sfdsdf', '2016-07-06', null, null, 'sdf', '2016-07-12', '2016-07-05', '2016-07-03', '4', '2016-07-30 02:09:30', '2016-07-30 02:09:30');
INSERT INTO `tlhp_bpk_lhp` VALUES ('22', 'dfgdfgdfg', '2016-07-30', '2016-07-13', '2016-07-26', '2016-06-29', '2016-06-27', '1', 'sdfsdf', 'bismilah ke 2', 'sdfsdfsf', '1970-01-01', null, null, null, null, null, null, '4', '2016-07-30 02:18:00', '2016-07-30 02:18:00');
INSERT INTO `tlhp_bpk_lhp` VALUES ('23', 'sf', '2016-07-30', '2016-07-30', '2016-07-30', '2016-07-30', '2016-07-30', '1', 'sdf', 'bismilah ke 3', '123', '2016-07-09', null, null, null, null, null, null, '4', '2016-07-30 02:21:06', '2016-07-30 02:21:06');
INSERT INTO `tlhp_bpk_lhp` VALUES ('24', 'sdfsdf', '2016-07-23', '2016-07-30', '2016-07-12', '2016-07-30', '2016-07-30', '1', 's', 'bismilah ke 4', '123', '2016-07-30', null, null, null, null, null, null, '4', '2016-07-30 02:27:01', '2016-07-30 02:27:01');
INSERT INTO `tlhp_bpk_lhp` VALUES ('25', 'sdfsdf', '2016-07-30', '2016-07-30', '2016-07-30', '2016-07-30', '2016-07-30', '1', 'vcb', 'bismilah ke 5', 'sfsf', '2016-07-30', null, null, null, null, null, null, '4', '2016-07-30 02:29:38', '2016-07-30 02:29:38');

-- ----------------------------
-- Table structure for tlhp_bpk_persetujuan_tl
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_persetujuan_tl`;
CREATE TABLE `tlhp_bpk_persetujuan_tl` (
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
  KEY `fk_bpk_persetujuan_tl` (`tindak_lanjut_id`),
  CONSTRAINT `fk_bpk_persetujuan_tl` FOREIGN KEY (`tindak_lanjut_id`) REFERENCES `tlhp_bpk_tindak_lanjut` (`tindak_lanjut_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_persetujuan_tl
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_bpk_rekomendasi
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_rekomendasi`;
CREATE TABLE `tlhp_bpk_rekomendasi` (
  `rekomendasi_id` int(11) NOT NULL AUTO_INCREMENT,
  `kertas_kerja_id` int(10) NOT NULL,
  `kode_rekomendasi_id` int(4) DEFAULT NULL,
  `uraian_rekomendasi` varchar(500) DEFAULT NULL,
  `kerugian_negara` tinyint(1) DEFAULT NULL,
  `nilai_rekomendasi` double DEFAULT NULL,
  PRIMARY KEY (`rekomendasi_id`),
  KEY `fk_bpk_kode_rekomen` (`kode_rekomendasi_id`),
  KEY `fk_bpk_rekomen_kk` (`kertas_kerja_id`),
  CONSTRAINT `fk_bpk_kode_rekomen` FOREIGN KEY (`kode_rekomendasi_id`) REFERENCES `tlhp_bpk_kode_rekomendasi` (`kode_rekomendasi_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_bpk_rekomen_kk` FOREIGN KEY (`kertas_kerja_id`) REFERENCES `tlhp_bpk_kertas_kerja_temuan` (`kertas_kerja_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_rekomendasi
-- ----------------------------
INSERT INTO `tlhp_bpk_rekomendasi` VALUES ('1', '3', '7', '123', '1', '123213');
INSERT INTO `tlhp_bpk_rekomendasi` VALUES ('2', '3', '7', '123', '1', '12312');
INSERT INTO `tlhp_bpk_rekomendasi` VALUES ('3', '3', '8', 'sdfsdf', '1', '12313');
INSERT INTO `tlhp_bpk_rekomendasi` VALUES ('9', '8', '6', 'uraian rek 1', '1', '22222');
INSERT INTO `tlhp_bpk_rekomendasi` VALUES ('15', '13', '6', 'uraian rek 1', '2', '456');
INSERT INTO `tlhp_bpk_rekomendasi` VALUES ('16', '13', '6', 'uraian rek 1', '1', '456');
INSERT INTO `tlhp_bpk_rekomendasi` VALUES ('17', '13', '7', 'uraian rek 2', '2', '0');
INSERT INTO `tlhp_bpk_rekomendasi` VALUES ('18', '14', '12', 'uraian rek 2-1', '1', '999');
INSERT INTO `tlhp_bpk_rekomendasi` VALUES ('19', '14', '8', 'sdf', '1', '0');
INSERT INTO `tlhp_bpk_rekomendasi` VALUES ('20', '14', '9', 'sdf', '1', '0');
INSERT INTO `tlhp_bpk_rekomendasi` VALUES ('21', '14', '8', 'sdf', '1', '123');
INSERT INTO `tlhp_bpk_rekomendasi` VALUES ('22', '14', '9', 'sdf', '1', '4545');
INSERT INTO `tlhp_bpk_rekomendasi` VALUES ('25', '16', '8', 'uraian rek 1', '2', '123');

-- ----------------------------
-- Table structure for tlhp_bpk_template_laporan
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_template_laporan`;
CREATE TABLE `tlhp_bpk_template_laporan` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_template_laporan
-- ----------------------------
INSERT INTO `tlhp_bpk_template_laporan` VALUES ('1', 'sdfsdf', 'sdf', 'sdfsdf', '0000-00-00', '<p>ssdfsd</p>', '<p>sdfsdf</p>', '0', '2016-07-30 02:50:15', '2016-07-30 02:50:15');
INSERT INTO `tlhp_bpk_template_laporan` VALUES ('2', 'sdfghjghjghjgjghjghj', 'bcvbcvb', 'cvbcvb', '2016-07-31', '\r\ndfgfdg\r\n\r\n', '\r\ndfgdfgdfgdfgdfgdfg\r\n\r\n', '5', '2016-07-31 16:50:28', '2016-07-31 16:50:28');
INSERT INTO `tlhp_bpk_template_laporan` VALUES ('3', 'vbnvbn', 'vbnvbnvb', 'bnvbnvbnvbn', '2016-08-02', '<p>vbnvbnvbngfhfghgfh</p>', '<p>bvnvbnvbngfhfghfgh</p>', '0', '2016-08-02 01:45:01', '2016-08-02 01:45:01');

-- ----------------------------
-- Table structure for tlhp_bpk_test
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_test`;
CREATE TABLE `tlhp_bpk_test` (
  `user_level_id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `user_level` varchar(200) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_test
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_bpk_tim
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_tim`;
CREATE TABLE `tlhp_bpk_tim` (
  `tim_id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_tim` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`tim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_tim
-- ----------------------------
INSERT INTO `tlhp_bpk_tim` VALUES ('1', 'PEMBANTU PJ');
INSERT INTO `tlhp_bpk_tim` VALUES ('2', 'PENGENDALI MUTU');
INSERT INTO `tlhp_bpk_tim` VALUES ('3', 'PENGENDALI TEKNIS');
INSERT INTO `tlhp_bpk_tim` VALUES ('4', 'KETUA TIM');
INSERT INTO `tlhp_bpk_tim` VALUES ('5', 'ANGGOTA');

-- ----------------------------
-- Table structure for tlhp_bpk_tim_lhp
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_tim_lhp`;
CREATE TABLE `tlhp_bpk_tim_lhp` (
  `tim_lhp_id` int(11) NOT NULL AUTO_INCREMENT,
  `lhp_id` int(11) NOT NULL,
  `kategory_tim` enum('biasa','perpanjangan') DEFAULT NULL,
  `tim_id` int(11) NOT NULL,
  `nama_tim` varchar(500) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tim_lhp_id`),
  KEY `fk_bpk_tim_id` (`tim_id`),
  KEY `fk_bpk_tim_lhp` (`lhp_id`),
  CONSTRAINT `fk_bpk_tim_id` FOREIGN KEY (`tim_id`) REFERENCES `tlhp_bpk_tim` (`tim_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_bpk_tim_lhp` FOREIGN KEY (`lhp_id`) REFERENCES `tlhp_bpk_lhp` (`lhp_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_tim_lhp
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_bpk_tindak_lanjut
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_tindak_lanjut`;
CREATE TABLE `tlhp_bpk_tindak_lanjut` (
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
  KEY `fk_bpk_tl_kk_idx` (`rekomendasi_id`),
  KEY `fk_bpk_tl_user` (`user_id`),
  CONSTRAINT `fk_bpk_tl_rekomen` FOREIGN KEY (`rekomendasi_id`) REFERENCES `tlhp_bpk_rekomendasi` (`rekomendasi_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_bpk_tl_user` FOREIGN KEY (`user_id`) REFERENCES `tlhp_bpk_user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_tindak_lanjut
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_bpk_unit_kerja
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_unit_kerja`;
CREATE TABLE `tlhp_bpk_unit_kerja` (
  `unit_kerja_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `unit_kerja` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`unit_kerja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_unit_kerja
-- ----------------------------
INSERT INTO `tlhp_bpk_unit_kerja` VALUES ('1', 'DEPUTI I');
INSERT INTO `tlhp_bpk_unit_kerja` VALUES ('2', 'DEPUTI II');
INSERT INTO `tlhp_bpk_unit_kerja` VALUES ('3', 'DEPUTI III');
INSERT INTO `tlhp_bpk_unit_kerja` VALUES ('4', 'DEPUTI IV');
INSERT INTO `tlhp_bpk_unit_kerja` VALUES ('5', 'STAF AHLI');
INSERT INTO `tlhp_bpk_unit_kerja` VALUES ('6', 'INSPEKTORAT');
INSERT INTO `tlhp_bpk_unit_kerja` VALUES ('7', 'BIRO SDMU');
INSERT INTO `tlhp_bpk_unit_kerja` VALUES ('8', 'BIRO HUKIP');
INSERT INTO `tlhp_bpk_unit_kerja` VALUES ('9', 'BIRO BKOK');
INSERT INTO `tlhp_bpk_unit_kerja` VALUES ('10', 'KASN');

-- ----------------------------
-- Table structure for tlhp_bpk_upload_lhp
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_upload_lhp`;
CREATE TABLE `tlhp_bpk_upload_lhp` (
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
  KEY `fk_bpk_upload_lhp` (`lhp_id`),
  CONSTRAINT `fk_bpk_upload_lhp` FOREIGN KEY (`lhp_id`) REFERENCES `tlhp_bpk_lhp` (`lhp_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_upload_lhp
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_bpk_upload_template_laporan
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_upload_template_laporan`;
CREATE TABLE `tlhp_bpk_upload_template_laporan` (
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
  KEY `fk_bpk_upload_template` (`template_laporan_id`),
  CONSTRAINT `fk_bpk_upload_template` FOREIGN KEY (`template_laporan_id`) REFERENCES `tlhp_bpk_template_laporan` (`template_laporan_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_upload_template_laporan
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_bpk_upload_tl
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_upload_tl`;
CREATE TABLE `tlhp_bpk_upload_tl` (
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
  KEY `fk_bpk_upload_tl` (`tindak_lanjut_id`),
  CONSTRAINT `fk_bpk_upload_tl` FOREIGN KEY (`tindak_lanjut_id`) REFERENCES `tlhp_bpk_tindak_lanjut` (`tindak_lanjut_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_upload_tl
-- ----------------------------

-- ----------------------------
-- Table structure for tlhp_bpk_user
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_user`;
CREATE TABLE `tlhp_bpk_user` (
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
  KEY `fk_bpk_user_level` (`user_level_id`),
  KEY `fk_bpk_user_unit_kerja` (`unit_kerja_id`),
  CONSTRAINT `fk_bpk_user_level` FOREIGN KEY (`user_level_id`) REFERENCES `tlhp_bpk_user_level` (`user_level_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bpk_user_unit_kerja` FOREIGN KEY (`unit_kerja_id`) REFERENCES `tlhp_bpk_unit_kerja` (`unit_kerja_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_user
-- ----------------------------
INSERT INTO `tlhp_bpk_user` VALUES ('4', 'asdf', 'asdfsdf', 'sadf', 'sadf', 'asdf', '1231231', '12', '2', '10', '', null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-24 19:40:42', '2016-07-31 18:28:28');
INSERT INTO `tlhp_bpk_user` VALUES ('5', 'admin', '1acf7bbc7ac25ef584552fdb1314ebda', 'cvbcvb', 'sdf', 'haidarvm', '324324', 'sdfsdfdsf', '1', '1', '', null, null, null, null, null, null, '343', null, null, null, null, null, '2016-07-24 19:41:06', '2016-08-02 03:30:42');
INSERT INTO `tlhp_bpk_user` VALUES ('7', 'agus', 'sadfdsf', null, null, 'agus', 'asdf', 'sfd', '3', '1', 'asdf', null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-27 10:21:39', '2016-07-27 10:42:26');
INSERT INTO `tlhp_bpk_user` VALUES ('8', 'dinijul', null, null, null, 'dini juliani', '2343', 'inspectorat', '1', '2', 'dini', null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-28 18:39:18', '2016-08-02 07:17:45');
INSERT INTO `tlhp_bpk_user` VALUES ('10', 'aldo', '9d1ec50ba9ceb580b76d015dbd49c17e', null, null, 'aldo siregar', '23422', 'UI developer', '3', '3', 'sdf', null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-28 21:05:39', '2016-08-01 17:07:46');
INSERT INTO `tlhp_bpk_user` VALUES ('11', 'rara', 'haitech', null, null, 'rara', '12312', '3sdfsdf', '3', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-31 20:17:24', '2016-07-31 20:17:24');
INSERT INTO `tlhp_bpk_user` VALUES ('12', 'vcbcvb', 'haidar', null, null, 'vcbvcbcvb', 'cvbcvb', 'cvcvbcvb', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-31 20:38:07', '2016-07-31 20:38:07');
INSERT INTO `tlhp_bpk_user` VALUES ('13', 'yuiuyiuyi', 'haidar', null, null, 'jkhjk', 'cvbcvb', 'cvcvbcvb', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-31 20:38:14', '2016-07-31 20:38:14');
INSERT INTO `tlhp_bpk_user` VALUES ('14', 'rt45', 'haidar', null, null, 'jkhjkh,.,m.', 'cvbcvb', 'cvcvbcvb', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-31 20:38:20', '2016-07-31 20:38:20');
INSERT INTO `tlhp_bpk_user` VALUES ('15', 'rt45', 'haidar', null, null, 'hjkjhkjhkh67', 'cvbcvb', 'cvcvbcvbgfhfgh', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-31 20:38:29', '2016-07-31 20:38:29');
INSERT INTO `tlhp_bpk_user` VALUES ('16', 'iniloh', null, null, null, 'iniloh', 'cvbcvbgh', 'bbnm', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-31 20:38:36', '2016-08-01 10:40:14');
INSERT INTO `tlhp_bpk_user` VALUES ('17', 'siapasih', null, null, null, 'siapa sih ?', 'cvbcvbgh', 'bbnm', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-31 20:38:55', '2016-08-01 10:35:21');
INSERT INTO `tlhp_bpk_user` VALUES ('18', 'haidartech', 'haidartech', null, null, 'haidartech', 'haidartech', 'haidartech', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-08-02 00:19:53', '2016-08-02 00:19:53');
INSERT INTO `tlhp_bpk_user` VALUES ('19', 'haidartech', 'haidartech', null, null, 'haidartech', 'haidartech', 'haidartech', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-08-02 00:19:53', '2016-08-02 00:19:53');
INSERT INTO `tlhp_bpk_user` VALUES ('37', 'cvbvcb', 'cvb', null, null, 'cvbvcb', 'cvb', 'vcbcv', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-08-02 02:47:50', '2016-08-02 02:47:50');
INSERT INTO `tlhp_bpk_user` VALUES ('38', 'dendi', 'dendi', null, null, 'dendi', 'dendi', 'dendi', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-08-02 02:48:12', '2016-08-02 02:48:12');
INSERT INTO `tlhp_bpk_user` VALUES ('39', 'ria', 'd42a9ad09e9778b177d409f5716ac621', null, null, 'ria', 'ria', 'ria', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-08-02 02:50:12', '2016-08-02 02:50:12');
INSERT INTO `tlhp_bpk_user` VALUES ('40', 'dony', '77ee6d05b23e742e2aca3fd602f4c599', null, null, 'dony', 'dony', 'dony', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-08-02 02:54:28', '2016-08-02 02:54:28');
INSERT INTO `tlhp_bpk_user` VALUES ('41', 'dony', '77ee6d05b23e742e2aca3fd602f4c599', null, null, 'dony', 'dony', 'dony', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-08-02 02:54:52', '2016-08-02 02:54:52');
INSERT INTO `tlhp_bpk_user` VALUES ('42', 'dony', '77ee6d05b23e742e2aca3fd602f4c599', null, null, 'dony', 'dony', 'dony', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-08-02 02:55:27', '2016-08-02 02:55:27');
INSERT INTO `tlhp_bpk_user` VALUES ('43', 'ruly', 'ee7ec63dd0e87cf4e43b288b306ca206', null, null, 'ruly', 'ruly', 'ruly', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-08-02 02:55:44', '2016-08-02 02:55:44');
INSERT INTO `tlhp_bpk_user` VALUES ('44', 'helmi', 'cf3750951241a8cf90e2a0fb0af63fe2', null, null, 'helmi', 'helmi', 'helmi', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-08-02 02:57:28', '2016-08-02 02:57:28');
INSERT INTO `tlhp_bpk_user` VALUES ('45', 'sdfsdf', 'd58e3582afa99040e27b92b13c8f2280', null, null, 'sdfsdf', 'sdfsdf', 'sdfsdf', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-08-02 02:58:55', '2016-08-02 02:58:55');
INSERT INTO `tlhp_bpk_user` VALUES ('46', 'sdfsdf', 'd58e3582afa99040e27b92b13c8f2280', null, null, 'sdfsdf', 'sdfsdf', 'sdfsdf', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-08-02 02:59:01', '2016-08-02 02:59:01');
INSERT INTO `tlhp_bpk_user` VALUES ('47', 'sdfsdf', 'd58e3582afa99040e27b92b13c8f2280', null, null, 'sdfsdf', 'sdfsdf', 'sdfsdf', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-08-02 02:59:03', '2016-08-02 02:59:03');
INSERT INTO `tlhp_bpk_user` VALUES ('48', 'sadf', 'c7d48bbf2b960adc10b0aba11bf336a5', null, null, 'fsafsad', 'sdfas', 'fas', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-08-02 02:59:47', '2016-08-02 02:59:47');

-- ----------------------------
-- Table structure for tlhp_bpk_user_history
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_user_history`;
CREATE TABLE `tlhp_bpk_user_history` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `login` datetime NOT NULL,
  `logout` datetime DEFAULT NULL,
  `total_use` time DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `fk_bpk_user_history` (`user_id`),
  CONSTRAINT `fk_bpk_user_history` FOREIGN KEY (`user_id`) REFERENCES `tlhp_bpk_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_user_history
-- ----------------------------
INSERT INTO `tlhp_bpk_user_history` VALUES ('1', '5', '2016-07-28 15:38:08', null, null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('2', '5', '2016-07-28 15:38:38', '2016-07-28 15:39:03', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('3', '5', '2016-07-28 15:41:37', '2016-07-28 15:43:23', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('4', '5', '2016-07-28 15:47:44', '2016-07-28 15:59:15', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('5', '5', '2016-07-28 16:03:44', '2016-07-28 16:03:49', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('6', '5', '2016-07-28 16:03:56', '2016-07-28 16:17:10', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('7', '8', '2016-07-28 16:17:24', '2016-07-28 16:18:10', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('8', '5', '2016-07-28 16:18:55', '2016-07-28 16:21:13', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('9', '8', '2016-07-28 16:21:19', '2016-07-28 16:22:26', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('10', '5', '2016-07-28 16:22:36', '2016-07-28 16:22:42', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('11', '5', '2016-07-28 16:22:48', '2016-07-28 17:18:50', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('12', '10', '2016-07-28 17:19:01', '2016-07-28 17:19:53', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('13', '5', '2016-07-28 17:28:11', '2016-07-28 17:28:46', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('14', '5', '2016-07-28 17:29:40', '2016-07-28 18:07:22', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('15', '5', '2016-07-28 18:37:08', null, null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('16', '5', '2016-07-29 00:50:27', '2016-07-29 00:51:51', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('17', '11', '2016-07-29 01:15:53', '2016-07-29 03:04:32', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('18', '5', '2016-07-29 03:04:37', '2016-07-29 13:07:12', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('19', '5', '2016-07-29 13:07:31', '2016-07-29 13:24:12', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('20', '5', '2016-07-29 13:37:24', null, null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('21', '41', '2016-07-30 02:35:23', null, null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('22', '5', '2016-07-31 17:02:22', '2016-07-31 18:03:19', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('23', '5', '2016-07-31 20:46:44', null, null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('24', '5', '2016-08-01 07:00:59', null, null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('25', '5', '2016-08-01 10:14:17', '2016-08-01 10:26:54', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('26', '5', '2016-08-01 10:26:59', '2016-08-01 10:39:57', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('27', '5', '2016-08-01 10:40:02', '2016-08-01 10:45:13', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('28', '14', '2016-08-01 11:48:30', '2016-08-01 11:50:54', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('29', '5', '2016-08-01 11:51:49', '2016-08-01 11:54:22', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('30', '5', '2016-08-01 11:54:30', '2016-08-01 12:00:51', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('31', '48', '2016-08-01 12:02:20', '2016-08-01 12:07:27', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('32', '5', '2016-08-01 12:08:25', '2016-08-01 12:08:55', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('33', '5', '2016-08-01 12:09:02', '2016-08-01 12:09:15', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('34', '11', '2016-08-01 12:11:08', '2016-08-01 17:07:08', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('35', '5', '2016-08-01 12:11:31', '2016-08-01 14:24:35', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('36', '5', '2016-08-01 12:12:30', '2016-08-01 12:12:49', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('37', '5', '2016-08-01 12:12:57', '2016-08-01 12:26:45', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('38', '10', '2016-08-01 17:07:52', '2016-08-01 19:07:15', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('39', '10', '2016-08-01 19:07:25', '2016-08-01 19:12:57', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('40', '5', '2016-08-01 23:10:37', '2016-08-01 23:38:00', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('41', '5', '2016-08-02 00:17:12', '2016-08-02 01:29:11', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('42', '5', '2016-08-02 01:29:19', '2016-08-02 02:27:49', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('43', '5', '2016-08-02 02:28:02', '2016-08-02 03:30:52', null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('44', '5', '2016-08-02 03:30:58', null, null);
INSERT INTO `tlhp_bpk_user_history` VALUES ('45', '5', '2016-08-02 06:24:58', null, null);

-- ----------------------------
-- Table structure for tlhp_bpk_user_level
-- ----------------------------
DROP TABLE IF EXISTS `tlhp_bpk_user_level`;
CREATE TABLE `tlhp_bpk_user_level` (
  `user_level_id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `user_level` varchar(200) NOT NULL,
  PRIMARY KEY (`user_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tlhp_bpk_user_level
-- ----------------------------
INSERT INTO `tlhp_bpk_user_level` VALUES ('1', 'super admin');
INSERT INTO `tlhp_bpk_user_level` VALUES ('2', 'admin');
INSERT INTO `tlhp_bpk_user_level` VALUES ('3', 'user');
