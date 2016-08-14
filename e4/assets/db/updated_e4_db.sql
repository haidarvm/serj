-- MySQL dump 10.13  Distrib 5.6.31, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: e4_db
-- ------------------------------------------------------
-- Server version	5.6.31-0ubuntu0.14.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tlhp_bpk_jenis_pengawasan`
--

DROP TABLE IF EXISTS `tlhp_bpk_jenis_pengawasan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpk_jenis_pengawasan` (
  `jenis_pengawasan_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `jenis_pengawasan` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`jenis_pengawasan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_jenis_pengawasan`
--

LOCK TABLES `tlhp_bpk_jenis_pengawasan` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_jenis_pengawasan` DISABLE KEYS */;
INSERT INTO `tlhp_bpk_jenis_pengawasan` VALUES (1,'AUDIT'),(2,'REVIU'),(3,'EVALUASI'),(4,'PEMANTAUAN'),(5,'TINDAK LANJUT PENGADUAN'),(6,'PENGAWASAN LAIN');
/*!40000 ALTER TABLE `tlhp_bpk_jenis_pengawasan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpk_kertas_kerja_temuan`
--

DROP TABLE IF EXISTS `tlhp_bpk_kertas_kerja_temuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_kertas_kerja_temuan`
--

LOCK TABLES `tlhp_bpk_kertas_kerja_temuan` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_kertas_kerja_temuan` DISABLE KEYS */;
INSERT INTO `tlhp_bpk_kertas_kerja_temuan` VALUES (2,19,'',NULL,NULL,'sdf',4,'sdf','123',5,'2016-07-29 17:39:10','2016-08-01 19:45:33'),(3,19,'',NULL,NULL,'sdf',4,'sdf','123',5,'2016-07-29 17:42:11','2016-08-01 19:45:34'),(8,20,'a',NULL,NULL,'ssf',4,'ssfdsfdsf','12313',5,'2016-07-29 19:08:22','2016-08-01 19:45:35'),(9,20,'a',NULL,NULL,'ssf',4,'ssfdsfdsf','12313',5,'2016-07-29 19:08:22','2016-08-01 19:45:35'),(13,21,'a',NULL,NULL,'uraian temuan 1',5,'uraian sebab 1','123',5,'2016-07-29 19:14:41','2016-08-01 19:45:36'),(14,22,'b',NULL,NULL,'uraian temuan 1',17,'uraian sebab 2','789',5,'2016-07-29 19:19:27','2016-08-01 19:45:36'),(16,25,'a',NULL,NULL,'sdf',5,'sfd','123',5,'2016-07-29 19:30:44','2016-08-01 19:45:38'),(17,26,'a',NULL,3,'URAIAN TEMUAN	1 bpk',3,'KELEMAHAN PENGAWASAN MELEKAT','1000000',5,'2016-08-07 22:07:19','2016-08-07 22:07:19'),(18,26,'a',NULL,3,'URAIAN TEMUAN	1 bpk',3,'KELEMAHAN PENGAWASAN MELEKAT','1000000',5,'2016-08-07 22:07:33','2016-08-07 22:07:33'),(19,26,'a',NULL,3,'URAIAN TEMUAN	1 bpk',3,'KELEMAHAN PENGAWASAN MELEKAT','1000000',5,'2016-08-07 22:07:41','2016-08-07 22:07:41'),(20,26,'a',NULL,3,'URAIAN TEMUAN	1 bpk',3,'KELEMAHAN PENGAWASAN MELEKAT','1000000',5,'2016-08-07 22:08:08','2016-08-07 22:08:08'),(21,27,'a',NULL,3,'URAIAN TEMUANastagfirullah 111',5,'Pembagian wewenang dalam organisasi belum cukup jelas sehingga ada kegiatan atau kejadian dalam organisasi yang tidak jelas penanggungjawabnya','1000',5,'2016-08-07 22:33:59','2016-08-11 12:31:41'),(22,19,'a',NULL,11,'hoho sudah saat nya',3,'KELEMAHAN PENGAWASAN MELEKAT','50000',5,'2016-08-10 17:14:46','2016-08-11 12:30:39'),(23,12,'a',NULL,11,'haduh cangkel tonggong',3,'KELEMAHAN PENGAWASAN MELEKAT','30000',5,'2016-08-10 17:20:37','2016-08-10 17:20:37'),(24,12,'b',NULL,1,'aku tambah temuan lagi yahhhhhh',18,'Hubungan kerja di antara kegiatan-kegiatan yang direncanakan tidak jelas dirumuskan sehingga tidak ada koordinasi di antara kegiatan-kegiatan itu','400000',5,'2016-08-11 12:09:22','2016-08-11 12:12:49'),(25,5,'a',NULL,2,'uraian temuan 11111',2,'Penyebab lain yang belum didefinisikan (nihil)','90000',5,'2016-08-11 12:13:58','2016-08-11 12:14:48'),(26,19,'a',NULL,11,'hoho sudah saat nyaaa',3,'KELEMAHAN PENGAWASAN MELEKAT','50000',5,'2016-08-11 12:32:43','2016-08-11 12:32:43'),(27,19,'a',NULL,11,'hoho sudah saat nya',3,'KELEMAHAN PENGAWASAN MELEKAT','50000',5,'2016-08-11 17:21:50','2016-08-11 17:21:50'),(28,19,'a',NULL,11,'hoho sudah saat nyaaa',3,'KELEMAHAN PENGAWASAN MELEKAT','50000',5,'2016-08-11 17:21:50','2016-08-11 17:21:50'),(29,19,'a',NULL,2,'tambah lagi ahhh',3,'KELEMAHAN PENGAWASAN MELEKAT','300000',5,'2016-08-11 17:21:50','2016-08-11 17:21:50'),(30,25,'a',NULL,2,'uraian temuan line 1',14,'Kelemahan lain kebijakan','190000',5,'2016-08-12 00:27:38','2016-08-12 00:27:38'),(31,24,'a',NULL,1,'tai ucing nyongclo update teu nya',3,'KELEMAHAN PENGAWASAN MELEKAT','80000',5,'2016-08-12 00:38:13','2016-08-13 09:02:17');
/*!40000 ALTER TABLE `tlhp_bpk_kertas_kerja_temuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpk_kode_rekomendasi`
--

DROP TABLE IF EXISTS `tlhp_bpk_kode_rekomendasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpk_kode_rekomendasi` (
  `kode_rekomendasi_id` int(10) NOT NULL AUTO_INCREMENT,
  `kode_rekomendasi` varchar(10) DEFAULT NULL,
  `uraian_rekomendasi` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`kode_rekomendasi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_kode_rekomendasi`
--

LOCK TABLES `tlhp_bpk_kode_rekomendasi` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_kode_rekomendasi` DISABLE KEYS */;
INSERT INTO `tlhp_bpk_kode_rekomendasi` VALUES (6,'00','KODE REKOMENDASI'),(7,'01','Penyetoran ke kas negara/daerah, kas BUMN/D, dan masyararakat'),(8,'02','Pengembalian barang kepada negara, daerah, BUMN/D, dan masyarakat'),(9,'03','Perbaikan fisik barang/jasa dalam proses pembangunan atau penggantian barang/jasa oleh rekanan'),(10,'04','Penghapusan barang milik negara/daerah'),(11,'05','Pelaksanaan sanksi administrasi kepegawaian'),(12,'06','Perbaikan laporan dan penertiban administrasi/kelengkapan administrasi'),(13,'07','Perbaikan sistem dan prosedur akuntansi dan pelaporan'),(14,'08','Peningkatan kualitas dan kuantitas sumber daya manusia pendukung sistem pengendalian'),(15,'09','Perubahan atau perbaikan prosedur, peraturan dan kebijakan'),(16,'10','Perubahan atau perbaikan struktur organisasi'),(17,'11','Koordinasi antar instansi termasuk juga penyerahan penanganan kasus kepada instansi yang berwenang'),(18,'12','Pelaksanaan penelitian oleh tim khusus atau audit lanjutan oleh unit pengawas intern'),(19,'13','Pelaksanaan sosialisasi'),(20,'14','Lain-lain');
/*!40000 ALTER TABLE `tlhp_bpk_kode_rekomendasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpk_kode_sebab`
--

DROP TABLE IF EXISTS `tlhp_bpk_kode_sebab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpk_kode_sebab` (
  `kode_sebab_id` int(10) NOT NULL AUTO_INCREMENT,
  `kode_sebab_group` tinyint(3) DEFAULT NULL,
  `kode_sebab` varchar(10) DEFAULT NULL,
  `uraian_sebab` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`kode_sebab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_kode_sebab`
--

LOCK TABLES `tlhp_bpk_kode_sebab` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_kode_sebab` DISABLE KEYS */;
INSERT INTO `tlhp_bpk_kode_sebab` VALUES (2,0,'0','Penyebab lain yang belum didefinisikan (nihil)'),(3,1,'100','KELEMAHAN PENGAWASAN MELEKAT'),(4,1,'101','Pembagian wewenang dalam organisasi belum cukup jauh sehingga masih terdapat transaksi atau kegiatan organisasi yang seluruh tahapnya dikuasai oleh satu orang'),(5,1,'102','Pembagian wewenang dalam organisasi belum cukup jelas sehingga ada kegiatan atau kejadian dalam organisasi yang tidak jelas penanggungjawabnya'),(6,1,'103','Dalam organisasi tidak ada pembagian wewenang dan tugas'),(7,1,'104','Kelalaian pejabat yang berwenang'),(8,1,'105','Kelemahan lain organisasi'),(9,2,'200','KELEMAHAN DALAM KEBIJAKAN/ KEBIJAKSANAAN'),(10,2,'201','Kebijakan yang berlaku tidak jelas bagi para bawahan'),(11,2,'202','Kebijakan yang berlaku tidak dapat menjadi pedoman yang pasti bagi para bawahan'),(12,2,'203','Kebijaksanaan yang berlaku tidak dikomunikasikan secara lisan maupun tertulis'),(13,2,'204','Tidak ada kebijakan yang digariskan'),(14,2,'205','Kelemahan lain kebijakan'),(15,2,'206','Kebijakan tidak sejalan/bertentangan dengan ketentuan yang lebih tinggi'),(16,3,'300','KELEMAHAN DALAM RENCANA'),(17,3,'301','Rencana kerja yang disusun tidak cukup luas sehingga belum mencakup seluruh kegiatan yang perlu dilaksanakan'),(18,3,'302','Hubungan kerja di antara kegiatan-kegiatan yang direncanakan tidak jelas dirumuskan sehingga tidak ada koordinasi di antara kegiatan-kegiatan itu'),(19,3,'303','Sasaran yang akan dicapai tidak cukup jelas dirumuskan'),(20,3,'304','Sasaran yang akan dicapai tidak cukup dikuantifikasikan'),(21,3,'305','Tidak dibuat anggaran yang merupakan kuantifikasi moneter rencana kegiatan dan sasaran yang akan dicapai'),(22,3,'306','Tidak ada rencana kegiatan'),(23,3,'307','Rencana kegiatan tidak cukup realistis'),(24,3,'308','Anggaran tidak cukup realistis'),(25,3,'309','Kelemahan lain perencanaan'),(26,3,'310','Perencanaan tidak matang'),(27,4,'400','KELEMAHAN DALAM PROSEDUR'),(28,4,'401','Prosedur yang ada tidak konsisten dengan kebijaksanaan yang perlu dilaksanakan'),(29,4,'402','Prosedur yang berlaku disalahtafsirkan oleh pegawai sehingga menyimpang dari tujuannya'),(30,4,'403','Prosedur yang berlaku tidak dimengerti sehingga tidak dilaksanakan'),(31,4,'404','Prosedur yang berlaku terlalu mahal dibandingkan dengan sesuatu yang harus dijaga sehingga tidak dilaksanakan'),(32,4,'405','Prosedur yang berlaku kurang terinci'),(33,4,'406','Prosedur yang berlaku tidak dapat menjadi pegangan bawahan karena tidak tertulis'),(34,4,'407','Prosedur yang berlaku tidak dikomunikasikan secara tertulis maupun lisan'),(35,4,'408','Tidak terdapat prosedur yang diperlukan'),(36,4,'409','Kelemahan lain prosedur'),(37,5,'500','KELEMAHAN DALAM PENCATATAN DAN PELAPORAN'),(38,5,'501','Pencatatan tidak diselenggarakan secara cermat sehingga kehilangan keadaannya'),(39,5,'502','Pencatatan tidak dimutakhirkan sehingga kehilangan peranannya sebagai alat pengawasan/pengendalian'),(40,5,'503','Pencatatan tidak memenuhi kebutuhan informasi untuk pengambilan keputusan sehari-hari'),(41,5,'504','Tidak diselenggarakan pencatatan yang perlu'),(42,5,'505','Pelaporan tidak tepat waktu'),(43,5,'506','Pelaporan tidak disusun dengan cermat'),(44,5,'507','Pelaporan tidak disusun memenuhi kebutuhan pimpinan'),(45,5,'508','Pelaporan disusun dengan biaya mahal'),(46,5,'509','Pelaporan yang diperlukan tidak ada'),(47,5,'510','Kelemahan lain pencatatan atau pelaporan'),(48,6,'600','KELEMAHAN DALAM PEMBINAAN PERSONIL'),(49,6,'601','Pegawai kurang mendapatkan supervisi (pengawasan) yang diperlukan (termasuk tidak dilakukan pemeriksaan kas bendaharawan oleh atasan langsung dan pemeriksaan fisik atas inventaris atau pers'),(50,6,'602','Supervisor tidak menyadari siapa yang harus diawasi dan apa yang harus diawasi'),(51,6,'603','Penugasan/penempatan pegawai tidak tepat/sesuai dengan latar belakang pendidikan '),(52,6,'604','Kelemahan lain pembinaan personil'),(53,7,'700','KELEMAHAN DALAM PENGAWASAN INTERN (INTERNAL REVIEW)'),(54,7,'701','Tidak ada satuan kerja atau pejabat yang diberi tanggung jawab untuk mengecek jalannya sistem dan prosedur yang telah ditetapkan'),(55,7,'702','Satuan kerja atau pejabat yang diberi tanggung jawab menguji jalannya sistem dan prosedur tidak berfungsi dengan baik'),(56,7,'703','Kelemahan lain pengkajian intern'),(57,8,'800','KELEMAHAN PENGAWASAN TERHADAP REKANAN'),(58,8,'801','Kelemahan Pengawasan Pemimpin Proyek'),(59,8,'802','Kelemahan Pengawasan Pimpinan Satker'),(60,9,'900','PENYEBAB EKSTERN HAMBATAN KELANCARAN PROYEK'),(61,9,'901','Pekerjaan persiapan proyek dan perumusan proyek kurang mantap (survei dan disain tidak mantap)'),(62,9,'902','DIP terlambat diterima proyek'),(63,9,'903','Revisi DIP yang diajukan pemimpin proyek penyelesaiannya menjadi berlarut-larut'),(64,9,'904','Tanah yang diperlukan proyek penyelesaiannya menjadi berlarut-larut'),(65,9,'905','Tidak dapat diperoleh tanah yang diperlukan proyek karena dana tidak mencukupi atau tidak tersedia'),(66,9,'906','Penetapan rekanan menjadi berlarut-larut'),(67,9,'907','Perijinan atau persetujuan untuk memulai suatu kegiatan proyek menjadi berlarut-larut'),(68,9,'908','Sarana komunikasi dan atau telekomunikasi tidak mendukung kelancaran proyek'),(69,9,'909','Rekanan yang ditetapkan tidak mampu menyelesaikan tanggungjawabnya'),(70,9,'910','Penyebab ekstern hambatan kelancaran proyek lainnya'),(71,9,'911','Rekanan mempunyai itikad yang kurang baik'),(72,10,'1000','PENYEBAB EKSTERN HAMBATAN KELANCARAN TUGAS POKOK INSTANSI'),(73,10,'1001','Instansi lain yang terkait kurang responsif'),(74,10,'1002','Sarana komunikasi dan atau telekomunikasi tidak mendukung kelancaran tugas instansi'),(75,10,'1003','Revisi DIK yang diajukan pimpinan instansi penyelesaiannya berlarut-larut'),(76,10,'1004','Rekanan yang telah ditetapkan tidak mampu menyelesaikan tanggungjawabnya'),(77,10,'1005','Perijinan atau persetujuan untuk memulai suatu kegiatan instansi menjadi berlarut-larut'),(78,10,'1006','Penyebab ekstern hambatan kelancaran tupoksi lainnya'),(79,10,'1007','Pencairan dana pinjaman tidak tepat waktu atau tidak sesuai jadwal kebutuhan'),(80,11,'1100','PENYEBAB KETIDAKLANCARAN PELAYANAN APARATUR PEMERINTAHAN/  BUMN/BUMD KEPADA MASYARAKAT'),(81,11,'1101','Prosedur yang ditetapkan belum sederhana'),(82,11,'1102','Masyarakat buta terhadap persyaratan yang perlu dipenuhi dan prosedur yang harus ditempuh'),(83,11,'1103','Tidak ada batas waktu maksimum penyelesaian pelayanan'),(84,11,'1104','Prosedur yang ditetapkan cukup banyak titik pertemuan pegawai dengan masyarakat sehingga membuka peluang pungutan liar'),(85,11,'1105','Persyaratan yang ditetapkan berlebihan sehingga menyulitkan pemohonan pelayanan'),(86,11,'1106','Tidak ada koordinasi antar instansi sehingga jelas siapa yang berwenang mengambil keputusan'),(87,11,'1107','Penyebab lain ketidaklancaran pelayanan');
/*!40000 ALTER TABLE `tlhp_bpk_kode_sebab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpk_kode_temuan`
--

DROP TABLE IF EXISTS `tlhp_bpk_kode_temuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpk_kode_temuan` (
  `kode_temuan_id` int(10) NOT NULL AUTO_INCREMENT,
  `kelompok` smallint(3) DEFAULT NULL,
  `sub_kelompok` smallint(3) DEFAULT NULL,
  `jenis` smallint(3) DEFAULT NULL,
  `kode_temuan` varchar(1000) DEFAULT NULL,
  `alt_rekom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kode_temuan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_kode_temuan`
--

LOCK TABLES `tlhp_bpk_kode_temuan` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_kode_temuan` DISABLE KEYS */;
INSERT INTO `tlhp_bpk_kode_temuan` VALUES (1,1,1,1,'Temuan Ketidakpatuhan Terhadap Peraturan',NULL),(2,1,1,NULL,'Kerugian negara/daerah atau kerugian negara/daerah\r\nyang terjadi pada perusahaan milik negara/daerah',NULL),(3,1,1,1,'Belanja dan/atau pengadaan barang/jasa fiktif',NULL),(4,1,1,2,'Rekanan pengadaan barang/jasa tidak menyelesaikan\r\npekerjaan',NULL),(5,1,1,3,'Kekurangan volume pekerjaan dan/atau barang',NULL),(6,1,1,4,'Kelebihan pembayaran selain kekurangan volume pekerjaan\r\ndan/atau barang',NULL),(7,1,1,5,'Pemahalan harga (Mark up)',NULL),(8,1,1,6,'Penggunaan uang/barang untuk kepentingan pribadi',NULL),(9,1,1,7,'Pembayaran honorarium dan/atau biaya perjalanan dinas\r\nganda dan/atau melebihi standar yang ditetapkan',NULL),(10,1,1,8,'Spesifikasi barang/jasa yang diterima tidak sesuai dengan\r\nkontrak',NULL),(11,1,1,9,'Belanja tidak sesuai atau melebihi ketentuan',NULL),(12,1,1,10,'Pengembalian pinjaman/piutang atau dana bergulir macet',NULL),(13,1,1,11,'Kelebihan penetapan dan pembayaran restitusi pajak atau\r\npenetapan kompensasi kerugian',NULL),(14,1,1,12,'Penjualan/pertukaran/penghapusan aset negara/daerah tidak\r\nsesuai ketentuan dan merugikan negara/daerah',NULL),(15,1,1,13,'Pengenaan ganti kerugian negara belum/tidak dilaksanakan\r\nsesuai ketentuan',NULL),(16,1,1,14,'Entitas belum/tidak melaksanakan tuntutan perbendaharaan\r\n(TP) sesuai ketentuan',NULL),(17,1,1,15,'Penghapusan hak tagih tidak sesuai ketentuan',NULL),(18,1,1,16,'Pelanggaran ketentuan pemberian diskon penjualan',NULL),(19,1,1,17,'Penentuan HPP (harga pokok pembelian) terlalu rendah\r\nsehingga penentuan harga jual lebih rendah dari yang\r\nseharusnya',NULL),(20,1,1,18,'Jaminan pelaksanaan dalam pelaksanaan pekerjaan,\r\npemanfaatan barang dan pemberian fasilitas tidak dapat\r\ndicairkan',NULL),(21,1,1,19,'Penyetoran penerimaan negara/daerah dengan bukti fiktif',NULL),(22,1,2,NULL,'Potensi kerugian negara/daerah atau kerugian\r\nnegara/daerah yang terjadi pada perusahaan milik\r\nnegara/daerah',NULL),(23,1,2,1,'Kelebihan pembayaran dalam pengadaan barang/jasa tetapi\r\npembayaran pekerjaan belum dilakukan sebagian atau\r\nseluruhnya',NULL),(24,1,2,2,'Rekanan belum melaksanakan kewajiban pemeliharaan\r\nbarang hasil pengadaan yang telah rusak selama masa\r\npemeliharaan',NULL),(25,1,2,3,'Aset dikuasai pihak lain',NULL),(26,1,2,4,'Pembelian aset yang berstatus sengketa',NULL),(27,1,2,5,'Aset tidak diketahui keberadaannya',NULL),(28,1,2,6,'Pemberian jaminan pelaksanaan dalam pelaksanaan\r\npekerjaan, pemanfaatan barang dan pemberian fasilitas tidak\r\nsesuai ketentuan',NULL),(29,1,2,7,'Pihak ketiga belum melaksanakan kewajiban untuk\r\nmenyerahkan aset kepada negara/daerah',NULL),(30,1,2,8,'Piutang/pinjaman atau dana bergulir yang berpotensi tidak\r\ntertagih',NULL),(31,1,2,9,'Penghapusan piutang tidak sesuai ketentuan',NULL),(32,1,2,10,'Pencairan anggaran pada akhir tahun anggaran untuk\r\npekerjaan yang belum selesai',NULL),(33,1,3,NULL,'Kekurangan penerimaan negara/daerah atau perusahaan\r\nmilik negara/daerah',NULL),(34,1,3,1,'Penerimaan negara/daerah atau denda keterlambatan\r\npekerjaan belum/tidak ditetapkan dipungut/diterima/disetor ke\r\nkas negara/daerah atau perusahaan milik negara/daerah',NULL),(35,1,3,2,'Penggunaan langsung penerimaan negara/daerah',NULL),(36,1,3,3,'Dana Perimbangan yang telah ditetapkan belum masuk ke\r\nkas daerah',NULL),(37,1,3,4,'Penerimaan negara/daerah diterima atau digunakan oleh\r\ninstansi yang tidak berhak',NULL),(38,1,3,5,'Pengenaan tarif pajak/PNBP lebih rendah dari ketentuan',NULL),(39,1,3,6,'Koreksi perhitungan bagi hasil dengan KKKS',NULL),(40,1,3,7,'Kelebihan pembayaran subsidi oleh pemerintah',NULL),(41,1,4,NULL,'Administrasi',NULL),(42,1,4,1,'Pertanggungjawaban tidak akuntabel (bukti tidak\r\nlengkap/tidak valid)',NULL),(43,1,4,2,'Pekerjaan dilaksanakan mendahului kontrak atau penetapan\r\nanggaran',NULL),(44,1,4,3,'Proses pengadaan barang/jasa tidak sesuai ketentuan (tidak\r\nmenimbulkan kerugian negara)',NULL),(45,1,4,4,'Pemecahan kontrak untuk menghindari pelelangan',NULL),(46,1,4,5,'Pelaksanaan lelang secara performa',NULL),(47,1,4,6,'Penyimpangan terhadap peraturan perundang-undangan\r\nbidang pengelolaan perlengkapan atau barang milik',NULL),(48,1,4,7,'Penyimpangan terhadap peraturan perundang-undangan\r\nbidang tertentu lainnya seperti kehutanan, pertambangan,\r\nperpajakan, dll',NULL),(49,1,4,8,'Koreksi perhitungan subsidi/kewajiban pelayanan umum',NULL),(50,1,4,9,'Pembentukan cadangan piutang, perhitungan penyusutan\r\natau amortisasi tidak sesuai ketentuan',NULL),(51,1,4,10,'Penyetoran penerimaan negara/daerah atau kas di\r\nbendaharawan ke kas negara/daerah melebihi batas waktu\r\nyang ditentukan',NULL),(52,1,4,11,'Pertanggungjawaban/penyetoran uang persediaan melebihi\r\nbatas waktu yang ditentukan',NULL),(53,1,4,12,'Sisa kas di bendahara pengeluaran akhir tahun anggaran\r\nbelum/tidak disetor ke kas negara/daerah',NULL),(54,1,4,13,'Pengeluaran investasi pemerintah tidak didukung bukti yang\r\nsah',NULL),(55,1,4,14,'Kepemilikan aset tidak/belum didukung bukti yang sah',NULL),(56,1,4,15,'Pengalihan anggaran antar MAK tidak sah',NULL),(57,1,4,16,'Pelampauan pagu anggaran',NULL),(58,1,5,NULL,'Indikasi tindak pidana',NULL),(59,1,5,1,'Indikasi tindak pidana korupsi',NULL),(60,1,5,2,'Indikasi tindak pidana perbankan',NULL),(61,1,5,3,'Indikasi tindak pidana perpajakan',NULL),(62,1,5,4,'Indikasi tindak pidana kepabeanan',NULL),(63,1,5,5,'Indikasi tindak pidana kehutanan',NULL),(64,1,5,6,'Indikasi tindak pidana pasar modal',NULL),(65,1,5,7,'Indikasi tindak pidana khusus lainnya',NULL),(66,2,NULL,NULL,'Temuan kelemahan sistem pengendalian intern',NULL),(67,2,1,NULL,'Kelemahan sistem pengendalian akuntansi dan\r\npelaporan',NULL),(68,2,1,1,'Pencatatan tidak/belum dilakukan atau tidak akurat',NULL),(69,2,1,2,'Proses penyusunan laporan tidak sesuai ketentuan',NULL),(70,2,1,3,'Entitas terlambat menyampaikan laporan',NULL),(71,2,1,4,'Sistem informasi akuntansi dan pelaporan tidak memadai',NULL),(72,2,1,5,'Sistem informasi akuntansi dan pelaporan belum didukung\r\nSDM yang memadai',NULL),(73,2,2,NULL,'Kelemahan sistem pengendalian pelaksanaan anggaran\r\npendapatan dan belanja',NULL),(74,2,2,1,'Perencanaan kegiatan tidak memadai',NULL),(75,2,2,2,'Mekanisme pemungutan, penyetoran dan pelaporan serta\r\npenggunaan Penerimaan negara/daerah/perusahaan dan\r\nhibah tidak sesuai ketentuan',NULL),(76,2,2,3,'Penyimpangan terhadap peraturan perundang-undangan\r\nbidang teknis tertentu atau ketentuan intern organisasi yang\r\ndiperiksa tentang pendapatan dan belanja',NULL),(77,2,2,4,'Pelaksanaan belanja di luar mekanisme APBN/APBD',NULL),(78,2,2,5,'Penetapan/pelaksanaan kebijakan tidak tepat atau belum\r\ndilakukan berakibat hilangnya potensi\r\npenerimaan/pendapatan',NULL),(79,2,2,6,'Penetapan/pelaksanaan kebijakan tidak tepat atau belum\r\ndilakukan berakibat peningkatan biaya /belanja',NULL),(80,2,2,7,'Kelemahan pengelolaan fisik aset',NULL),(81,2,3,NULL,'Kelemahan struktur pengendalian intern',NULL),(82,2,3,1,'Entitas tidak memiliki SOP yang formal untuk suatu prosedur\r\natau keseluruhan prosedur',NULL),(83,2,3,2,'SOP yang ada pada entitas tidak berjalan secara optimal\r\natau tidak ditaati',NULL),(84,2,3,3,'Entitas tidak memiliki satuan pengawas intern',NULL),(85,2,3,4,'Satuan pengawas intern yang ada tidak memadai atau tidak\r\nberjalan optimal',NULL),(86,2,3,5,'Tidak ada pemisahan tugas dan fungsi yang memadai',NULL),(87,3,NULL,NULL,'Temuan 3E',NULL),(88,3,1,NULL,'Ketidakhematan/pemborosan/ketidakekonomisan',NULL),(89,3,1,1,'Pengadaan barang/jasa melebihi kebutuhan',NULL),(90,3,1,2,'Penetapan kualitas dan kuantitas barang/jasa yang\r\ndigunakan tidak sesuai standar',NULL),(91,3,1,3,'Pemborosan keuangan negara/daerah/perusahaan atau\r\nkemahalan harga',NULL),(92,3,2,NULL,'Ketidakefisienan',NULL),(93,3,2,1,'Penggunaan kuantitas input untuk satu satuan output lebih\r\nbesar/tinggi dari yang seharusnya',NULL),(94,3,2,2,'Penggunaan kualitas input untuk satu satuan output lebih\r\ntinggi dari seharusnya',NULL),(95,3,3,NULL,'Ketidakefektifan',NULL),(96,3,3,1,'Penggunaan anggaran tidak tepat sasaran/tidak sesuai\r\nperuntukan',NULL),(97,3,3,2,'Pemanfaatan barang/jasa dilakukan tidak sesuai dengan\r\nrencana yang ditetapkan',NULL),(98,3,3,3,'Barang yang dibeli belum/tidak dapat dimanfaatkan',NULL),(99,3,3,4,'Pemanfaatan barang/jasa tidak berdampak terhadap\r\npencapaian tujuan organisasi',NULL),(100,3,3,5,'Pelaksanaan kegiatan terlambat/terhambat sehingga\r\nmempengaruhi pencapaian tujuan organisasi',NULL),(101,3,3,6,'Pelayanan kepada masyarakat tidak optimal',NULL),(102,3,3,7,'Fungsi atau tugas instansi yang diperiksa tidak\r\ndiselenggarakan dengan baik termasuk target penerimaan\r\ntidak tercapai',NULL),(103,3,3,8,'Penggunaan biaya promosi/pemasaran tidak efektif',NULL);
/*!40000 ALTER TABLE `tlhp_bpk_kode_temuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpk_lhp`
--

DROP TABLE IF EXISTS `tlhp_bpk_lhp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_lhp`
--

LOCK TABLES `tlhp_bpk_lhp` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_lhp` DISABLE KEYS */;
INSERT INTO `tlhp_bpk_lhp` VALUES (4,'sdf',NULL,NULL,NULL,NULL,NULL,1,'sdf','sdf','sdf',NULL,NULL,NULL,'sdf',NULL,NULL,NULL,4,'2016-07-26 03:41:37','2016-07-26 03:45:53'),(5,'R0000111','2016-07-07','2016-07-07','2016-07-07','2016-07-07','2016-07-07',1,'dfdasfsaf','Dugaan Suap Rumah Sakit Sumber Waras','asdfasdf','1970-01-01',NULL,NULL,'asf','2016-07-07','2016-07-07','2016-07-07',5,'2016-07-26 04:38:52','2016-08-11 14:08:54'),(6,'asdf','2016-07-05','2016-07-05','2016-07-26','2016-07-14','2016-07-26',1,NULL,'sdfsdf','sdf','2016-07-06',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 05:08:40','2016-07-26 05:08:40'),(7,'TUGAS','2016-07-07','2016-07-12','2016-07-12','2016-07-12','2016-07-25',3,'sdfPENGAWASAN','JUDUL','NOMOR','2016-06-29','PPK','KEGIATAN',NULL,NULL,NULL,NULL,4,'2016-07-26 05:12:15','2016-07-26 05:12:15'),(8,'TUGAS','2016-07-07','2016-07-12','2016-07-12','2016-07-12','2016-07-25',3,'sdfPENGAWASAN','JUDUL','NOMOR','2016-06-29','PPK','KEGIATAN','PERPANJANGAN','2016-07-07','2016-07-07','2016-07-07',4,'2016-07-26 05:12:46','2016-07-26 05:12:46'),(9,'TUGAS','2016-07-07','2016-07-12','2016-07-12','2016-07-12','2016-07-25',3,'sdfPENGAWASAN','JUDUL','NOMOR','2016-06-29','PPK','KEGIATAN','PERPANJANGAN','2016-07-05','2016-07-05','2016-07-12',4,'2016-07-26 05:14:33','2016-07-26 05:14:33'),(10,'TUGAS','2016-07-07','2016-07-12','2016-07-12','2016-07-12','2016-07-25',3,'PENGAWASAN','JUDUL','NOMOR','2016-06-29','PPK','KEGIATAN','PERPANJANGAN','2016-07-07','2016-07-07','2016-07-07',4,'2016-07-26 05:14:53','2016-07-27 06:37:02'),(11,'dsf','2016-07-07','2016-07-07','2016-07-07','2016-07-07','2016-07-07',1,NULL,'sdfsdf','sdfsdf','2016-06-27',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 06:25:56','2016-07-26 06:25:56'),(12,'dsf','2016-07-07','2016-07-07','2016-07-07','2016-07-07','2016-07-07',2,NULL,'hhgkihjkghjk','sdfsdf','2016-06-27',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 06:26:20','2016-07-26 06:26:20'),(13,NULL,'2016-07-07','2016-07-07','2016-07-07','2016-07-07','2016-07-07',1,NULL,'sdfd',NULL,'2016-07-07',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 06:28:30','2016-07-26 06:28:30'),(14,'sdfsdf','2016-07-26','2016-06-27','2016-07-12','2016-07-14','2016-07-11',1,'sdfsdf','sdf','qwewqewqe','2016-07-26',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 07:32:23','2016-07-26 07:32:23'),(15,'sdfsd','2016-07-26','2016-07-26','2016-07-26','2016-07-26','2016-07-26',1,'sd','sd','sdfs','2016-07-26','sd',NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 07:42:01','2016-07-26 07:42:01'),(16,'sdfsd','2016-07-26','2016-07-26','2016-07-26','2016-07-26','2016-07-26',1,'sd','sd','sdfs','2016-07-26','sd',NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 07:42:50','2016-07-26 07:42:50'),(17,'sdfsdf','2016-07-12','2016-07-06','2016-07-13','2016-07-26','2016-07-05',1,'kg','tdxghf','jhfhf','2016-07-26','jkgj','h',NULL,NULL,NULL,NULL,4,'2016-07-26 13:43:04','2016-07-26 13:43:04'),(18,'asdfsdf','2016-07-15','2016-07-12','2016-07-11','2016-07-12','2016-07-12',1,'sdfsdf','judul haidar','sdfsdf','2016-07-27',NULL,NULL,'sdf','2016-07-14','2016-07-05','2016-07-11',4,'2016-07-29 11:27:36','2016-07-29 11:27:36'),(19,'RC70000','2016-07-12','2016-07-19','2016-07-20','2016-07-14','2016-07-18',1,'Dugaan Suap Kasus Cilenyi','atang test','23423424','2016-07-29',NULL,NULL,'sdfsdf','2016-07-12','2016-07-26','2016-07-26',5,'2016-07-29 13:48:52','2016-08-11 17:58:59'),(20,'sfdsf','2016-07-15','2016-07-06','2016-07-12','2016-07-06','2016-07-21',1,'sdfsdf','bismillah haidar','sdfdsf','2016-07-30',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 17:58:57','2016-07-29 17:58:57'),(21,'123','2016-07-30','2016-07-20','2016-07-13','2016-07-13','2016-07-19',1,'sdfsdf','bismillah tim','sfdsdf','2016-07-06',NULL,NULL,'sdf','2016-07-12','2016-07-05','2016-07-03',4,'2016-07-29 19:09:30','2016-07-29 19:09:30'),(22,'dfgdfgdfg','2016-07-30','2016-07-13','2016-07-26','2016-06-29','2016-06-27',1,'sdfsdf','bismilah ke 2','sdfsdfsf','1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 19:18:00','2016-07-29 19:18:00'),(23,'sf','2016-07-30','2016-07-30','2016-07-30','2016-07-30','2016-07-30',1,'sdf','bismilah ke 3','123','2016-07-09',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 19:21:06','2016-07-29 19:21:06'),(24,'sdfsdf','2016-07-23','2016-07-30','2016-07-12','2016-07-30','2016-07-30',1,'s','bismilah ke 4','123','2016-07-30',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 19:27:01','2016-07-29 19:27:01'),(25,'sdfsdf','2016-07-30','2016-07-30','2016-07-30','2016-07-30','2016-07-30',1,'vcb','bismilah ke 5','sfsf','2016-07-30',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 19:29:38','2016-07-29 19:29:38'),(26,'NOMOR SURAT BPK','2016-08-08','2016-08-01','2016-08-05','2016-08-02','2016-08-03',1,'PENGAWASAN','JUDUL BPK','NOMOR BPK','2016-08-01',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-07 22:06:33','2016-08-07 22:06:33'),(27,'astagfirullah','2016-08-08','2016-08-08','2016-08-08','2016-08-08','2016-08-08',1,'astagfirullah PENGAWASAN','astagfirullah JUDUL','astagfirullah NOMOR','2016-08-08',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-07 22:22:07','2016-08-07 22:22:07'),(28,'T099999','2016-08-13','2016-08-13','2016-08-13','2016-08-13','2016-08-13',1,'awas euy','judul lhp tea euy','NoO90000','2016-08-13',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-13 08:42:18','2016-08-13 08:42:18');
/*!40000 ALTER TABLE `tlhp_bpk_lhp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpk_persetujuan_tl`
--

DROP TABLE IF EXISTS `tlhp_bpk_persetujuan_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_persetujuan_tl`
--

LOCK TABLES `tlhp_bpk_persetujuan_tl` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_persetujuan_tl` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_bpk_persetujuan_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpk_rekomendasi`
--

DROP TABLE IF EXISTS `tlhp_bpk_rekomendasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpk_rekomendasi` (
  `rekomendasi_id` int(11) NOT NULL AUTO_INCREMENT,
  `kertas_kerja_id` int(10) NOT NULL,
  `kode_rekomendasi_id` int(4) DEFAULT NULL,
  `uraian_rekomendasi` varchar(500) DEFAULT NULL,
  `kerugian_negara` tinyint(1) DEFAULT NULL,
  `nilai_rekomendasi` double DEFAULT NULL,
  `unit_kerja_id` mediumint(3) NOT NULL,
  `nama_ppk` varchar(500) DEFAULT NULL,
  `nama_pj` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`rekomendasi_id`),
  KEY `fk_bpk_kode_rekomen` (`kode_rekomendasi_id`),
  KEY `fk_bpk_rekomen_kk` (`kertas_kerja_id`),
  CONSTRAINT `fk_bpk_kode_rekomen` FOREIGN KEY (`kode_rekomendasi_id`) REFERENCES `tlhp_bpk_kode_rekomendasi` (`kode_rekomendasi_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_bpk_rekomen_kk` FOREIGN KEY (`kertas_kerja_id`) REFERENCES `tlhp_bpk_kertas_kerja_temuan` (`kertas_kerja_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_rekomendasi`
--

LOCK TABLES `tlhp_bpk_rekomendasi` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_rekomendasi` DISABLE KEYS */;
INSERT INTO `tlhp_bpk_rekomendasi` VALUES (1,3,7,'123',1,123213,0,NULL,NULL),(2,3,7,'123',1,12312,0,NULL,NULL),(3,3,8,'sdfsdf',1,12313,0,NULL,NULL),(9,8,6,'uraian rek 1',1,22222,0,NULL,NULL),(15,13,6,'uraian rek 1',2,456,0,NULL,NULL),(16,13,6,'uraian rek 1',1,456,0,NULL,NULL),(17,13,7,'uraian rek 2',2,0,0,NULL,NULL),(18,14,12,'uraian rek 2-1',1,999,0,NULL,NULL),(19,14,8,'sdf',1,0,0,NULL,NULL),(20,14,9,'sdf',1,0,0,NULL,NULL),(21,14,8,'sdf',1,123,0,NULL,NULL),(22,14,9,'sdf',1,4545,0,NULL,NULL),(25,16,8,'uraian rek 1',2,123,0,NULL,NULL),(26,17,8,'URAIAN REKOMENDASI	',0,NULL,0,NULL,NULL),(27,18,8,'URAIAN REKOMENDASI	',0,NULL,0,NULL,NULL),(28,19,8,'URAIAN REKOMENDASI	',0,NULL,0,NULL,NULL),(29,20,8,'URAIAN REKOMENDASI	',1,14,0,NULL,NULL),(30,21,10,'URAIAN REKOMENDASI	 astagfirulah 1',1,1000,0,NULL,NULL),(31,22,7,'uraian rekomendasi',1,40000,0,NULL,NULL),(32,23,7,'uraian rekomenasi tahap 1',1,50000,5,'igor','kapalera'),(33,22,7,'uraian rekomendasi line 1',1,300000,7,'sinto','gendeng'),(34,22,7,'urdfad asdf ',1,2300000,5,'chandara utama','arif budiman'),(35,24,10,'uraian rekomendasi 2',0,0,6,'atang','sutisna'),(36,25,6,'rekomendasi tahap 1',1,10000,2,'arol','noah'),(37,26,7,'uraian rekomendasi line 1',1,300000,7,'sinto','gendeng'),(38,26,7,'urdfad asdf ',1,2300000,5,'chandara utama','arif budiman'),(39,21,7,'urairaian rekomendasi line 1',1,240000,2,'hendrix','jampang'),(40,27,7,'uraian rekomendasi line 1',1,300000,7,'sinto','gendeng'),(41,27,7,'urdfad asdf ',1,2300000,5,'chandara utama','arif budiman'),(42,28,7,'uraian rekomendasi line 1',1,300000,7,'sinto','gendeng'),(43,28,7,'urdfad asdf ',1,2300000,5,'chandara utama','arif budiman'),(44,29,9,'tambah rekomendasi',1,1000000,9,'irawan','hentianty'),(45,30,7,'uraian rekomendasi line 1',1,800000,9,'tew','tow'),(46,30,9,'uraian rekomendasi line 2',0,0,4,'tralala','trilili'),(47,31,7,'fasd fasf asdf',1,90000,3,'testing ','testong'),(48,31,9,'line 2',1,1500000,6,'atang ','koil');
/*!40000 ALTER TABLE `tlhp_bpk_rekomendasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpk_template_laporan`
--

DROP TABLE IF EXISTS `tlhp_bpk_template_laporan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_template_laporan`
--

LOCK TABLES `tlhp_bpk_template_laporan` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_template_laporan` DISABLE KEYS */;
INSERT INTO `tlhp_bpk_template_laporan` VALUES (1,'sdfsdf','sdf','sdfsdf','0000-00-00','<p>ssdfsd</p>','<p>sdfsdf</p>',0,'2016-07-29 19:50:15','2016-07-29 19:50:15'),(2,'sdfghjghjghjgjghjghj','bcvbcvb','cvbcvb','2016-07-31','\r\ndfgfdg\r\n\r\n','\r\ndfgdfgdfgdfgdfgdfg\r\n\r\n',5,'2016-07-31 09:50:28','2016-07-31 09:50:28'),(3,'vbnvbn','vbnvbnvb','bnvbnvbnvbn','2016-08-02','<p>vbnvbnvbngfhfghgfh</p>','<p>bvnvbnvbngfhfghfgh</p>',0,'2016-08-01 18:45:01','2016-08-01 18:45:01'),(4,'haidar laporan','no lap 123123','semester 3','2016-08-01','<p><span style=\"font-family: Muli, Helvetica, Arial, sans-serif; line-height: 22.4px;\">test aja deh</span><br></p>','<p>test aja deh</p>',5,'2016-08-02 00:56:47','2016-08-02 00:56:47');
/*!40000 ALTER TABLE `tlhp_bpk_template_laporan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpk_template_laporan_media`
--

DROP TABLE IF EXISTS `tlhp_bpk_template_laporan_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpk_template_laporan_media` (
  `id_template_laporan_media` int(11) NOT NULL AUTO_INCREMENT,
  `template_laporan_id` int(11) DEFAULT NULL,
  `upload_template_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_template_laporan_media`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_template_laporan_media`
--

LOCK TABLES `tlhp_bpk_template_laporan_media` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_template_laporan_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_bpk_template_laporan_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpk_tim`
--

DROP TABLE IF EXISTS `tlhp_bpk_tim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpk_tim` (
  `tim_id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_tim` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`tim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_tim`
--

LOCK TABLES `tlhp_bpk_tim` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_tim` DISABLE KEYS */;
INSERT INTO `tlhp_bpk_tim` VALUES (1,'PEMBANTU PJ'),(2,'PENGENDALI MUTU'),(3,'PENGENDALI TEKNIS'),(4,'KETUA TIM'),(5,'ANGGOTA');
/*!40000 ALTER TABLE `tlhp_bpk_tim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpk_tim_lhp`
--

DROP TABLE IF EXISTS `tlhp_bpk_tim_lhp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_tim_lhp`
--

LOCK TABLES `tlhp_bpk_tim_lhp` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_tim_lhp` DISABLE KEYS */;
INSERT INTO `tlhp_bpk_tim_lhp` VALUES (1,5,'biasa',4,'user 1','2016-08-11 14:11:08','2016-08-11 14:11:08'),(2,5,'biasa',5,'user 2','2016-08-11 14:11:08','2016-08-11 14:11:08'),(3,5,'biasa',5,'user 3','2016-08-11 14:11:08','2016-08-11 14:11:08');
/*!40000 ALTER TABLE `tlhp_bpk_tim_lhp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpk_tindak_lanjut`
--

DROP TABLE IF EXISTS `tlhp_bpk_tindak_lanjut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpk_tindak_lanjut` (
  `tindak_lanjut_id` int(10) NOT NULL AUTO_INCREMENT,
  `tindak_lanjut` varchar(500) DEFAULT NULL,
  `rekomendasi_id` int(11) NOT NULL,
  `nilai` double DEFAULT NULL,
  `nilai_disetujui` double DEFAULT NULL,
  `saldo_rekomendasi` double DEFAULT NULL,
  `approval_status` enum('approved','rejected') DEFAULT NULL,
  `status_tl` tinyint(1) DEFAULT NULL,
  `tanggal_tl` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `rejected_by` int(11) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tindak_lanjut_id`),
  KEY `fk_bpk_tl_kk_idx` (`rekomendasi_id`),
  KEY `fk_bpk_tl_user` (`created_by`),
  CONSTRAINT `fk_bpk_tl_rekomen` FOREIGN KEY (`rekomendasi_id`) REFERENCES `tlhp_bpk_rekomendasi` (`rekomendasi_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_bpk_tl_user` FOREIGN KEY (`created_by`) REFERENCES `tlhp_bpk_user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_tindak_lanjut`
--

LOCK TABLES `tlhp_bpk_tindak_lanjut` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_tindak_lanjut` DISABLE KEYS */;
INSERT INTO `tlhp_bpk_tindak_lanjut` VALUES (4,'tindak lanjut line 1',33,1000000,NULL,NULL,NULL,NULL,'0000-00-00',5,NULL,NULL,'2016-08-11 02:04:04','2016-08-11 02:04:04'),(5,'tindak lanjut line 2',34,10000000,NULL,NULL,NULL,NULL,'0000-00-00',5,NULL,NULL,'2016-08-11 02:07:26','2016-08-11 02:07:26'),(6,'fasdf asdf ',45,800000,NULL,NULL,NULL,NULL,'0000-00-00',5,NULL,NULL,'2016-08-12 00:34:31','2016-08-12 00:34:31'),(7,'testing testin tindak lanjut',46,9000000,NULL,NULL,NULL,NULL,'0000-00-00',5,NULL,NULL,'2016-08-12 00:34:31','2016-08-12 00:34:31'),(8,'asf asf',47,89000,0,90000,'rejected',1,'0000-00-00',5,NULL,5,'2016-08-12 00:41:58','2016-08-14 06:54:54'),(9,'asf asf',47,89000,0,90000,'rejected',1,'1970-01-01',5,NULL,5,'2016-08-12 01:03:54','2016-08-14 06:54:54'),(10,'asf asf',47,89000,0,90000,'rejected',1,'1970-01-01',5,NULL,5,'2016-08-12 01:04:14','2016-08-14 06:54:54'),(11,'asf asf',47,89000,0,90000,'rejected',1,'1970-01-01',5,NULL,5,'2016-08-12 01:04:59','2016-08-14 06:54:54'),(12,'tindak anfad ',48,900000,5000000,1500000,'approved',1,'2016-08-12',5,5,NULL,'2016-08-12 01:04:59','2016-08-13 19:57:19'),(13,'asf asf',47,89000,0,90000,'rejected',1,'1970-01-01',5,NULL,5,'2016-08-13 09:02:17','2016-08-14 06:54:54'),(14,'tindak anfad ',48,900000,20000,1500000,'rejected',0,'2016-08-12',5,NULL,5,'2016-08-13 09:02:17','2016-08-13 19:57:19'),(15,'ganti deh tindak lanjutnya',33,3000000,NULL,NULL,NULL,NULL,'2016-08-10',5,NULL,NULL,'2016-08-13 10:45:12','2016-08-13 10:45:12'),(16,'gak ada tinggal nya ',34,800000,NULL,NULL,NULL,NULL,'2016-08-12',5,NULL,NULL,'2016-08-13 10:45:12','2016-08-13 10:45:12'),(17,NULL,37,NULL,NULL,NULL,NULL,NULL,'1970-01-01',5,NULL,NULL,'2016-08-13 10:45:12','2016-08-13 10:45:12'),(18,NULL,38,NULL,NULL,NULL,NULL,NULL,'1970-01-01',5,NULL,NULL,'2016-08-13 10:45:12','2016-08-13 10:45:12'),(19,NULL,40,NULL,NULL,NULL,NULL,NULL,'1970-01-01',5,NULL,NULL,'2016-08-13 10:45:12','2016-08-13 10:45:12'),(20,NULL,41,NULL,NULL,NULL,NULL,NULL,'1970-01-01',5,NULL,NULL,'2016-08-13 10:45:12','2016-08-13 10:45:12'),(21,NULL,42,NULL,NULL,NULL,NULL,NULL,'1970-01-01',5,NULL,NULL,'2016-08-13 10:45:12','2016-08-13 10:45:12'),(22,NULL,43,NULL,NULL,NULL,NULL,NULL,'1970-01-01',5,NULL,NULL,'2016-08-13 10:45:12','2016-08-13 10:45:12'),(23,'tindak lanjut terakhir ',44,1000000,NULL,NULL,NULL,NULL,'2016-08-09',5,NULL,NULL,'2016-08-13 10:45:12','2016-08-13 10:45:12'),(24,'tab',47,3500000,0,90000,'rejected',1,'2016-08-10',5,NULL,5,'2016-08-13 10:49:34','2016-08-14 06:54:54'),(25,'rada aneh ya',48,40000,10000,1500000,'approved',1,'2016-08-09',5,5,NULL,'2016-08-13 10:49:34','2016-08-13 19:57:19');
/*!40000 ALTER TABLE `tlhp_bpk_tindak_lanjut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpk_unit_kerja`
--

DROP TABLE IF EXISTS `tlhp_bpk_unit_kerja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpk_unit_kerja` (
  `unit_kerja_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `unit_kerja` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`unit_kerja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_unit_kerja`
--

LOCK TABLES `tlhp_bpk_unit_kerja` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_unit_kerja` DISABLE KEYS */;
INSERT INTO `tlhp_bpk_unit_kerja` VALUES (1,'DEPUTI I'),(2,'DEPUTI II'),(3,'DEPUTI III'),(4,'DEPUTI IV'),(5,'STAF AHLI'),(6,'INSPEKTORAT'),(7,'BIRO SDMU'),(8,'BIRO HUKIP'),(9,'BIRO MKOK'),(10,'KASN');
/*!40000 ALTER TABLE `tlhp_bpk_unit_kerja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpk_upload_lhp`
--

DROP TABLE IF EXISTS `tlhp_bpk_upload_lhp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `fk_bpk_upload_lhp` (`lhp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_upload_lhp`
--

LOCK TABLES `tlhp_bpk_upload_lhp` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_upload_lhp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_bpk_upload_lhp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpk_upload_template_laporan`
--

DROP TABLE IF EXISTS `tlhp_bpk_upload_template_laporan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `fk_bpk_upload_template` (`template_laporan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_upload_template_laporan`
--

LOCK TABLES `tlhp_bpk_upload_template_laporan` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_upload_template_laporan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_bpk_upload_template_laporan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpk_upload_tl`
--

DROP TABLE IF EXISTS `tlhp_bpk_upload_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `fk_bpk_upload_tl` (`tindak_lanjut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_upload_tl`
--

LOCK TABLES `tlhp_bpk_upload_tl` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_upload_tl` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_bpk_upload_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpk_user`
--

DROP TABLE IF EXISTS `tlhp_bpk_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `active` tinyint(1) NOT NULL DEFAULT '1',
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_user`
--

LOCK TABLES `tlhp_bpk_user` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_user` DISABLE KEYS */;
INSERT INTO `tlhp_bpk_user` VALUES (4,'asdf','asdfsdf','sadf','sadf','asdf','1231231','12',2,10,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-24 12:40:42','2016-08-02 01:53:55'),(5,'admin','1acf7bbc7ac25ef584552fdb1314ebda','cvbcvb','sdf','haidarvm','324324','sdfsdfdsf',1,1,'',NULL,NULL,NULL,NULL,NULL,NULL,'343',NULL,1,NULL,NULL,NULL,'2016-07-24 12:41:06','2016-08-02 01:54:29'),(7,'agus','sadfdsf',NULL,NULL,'agus','asdf','sfd',3,1,'asdf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-27 03:21:39','2016-08-02 01:54:29'),(8,'dinijul',NULL,NULL,NULL,'dini juliani','2343','inspectorat',1,2,'dini',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-28 11:39:18','2016-08-02 01:54:29'),(10,'aldo','9d1ec50ba9ceb580b76d015dbd49c17e',NULL,NULL,'aldo siregar','23422','UI developer',3,3,'sdf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-28 14:05:39','2016-08-02 01:54:29'),(11,'rara','haitech',NULL,NULL,'rara','12312','3sdfsdf',3,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:17:24','2016-08-02 01:54:29'),(12,'vcbcvb','haidar',NULL,NULL,'vcbvcbcvb','cvbcvb','cvcvbcvb',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:07','2016-08-02 03:33:17'),(13,'yuiuyiuyi','haidar',NULL,NULL,'jkhjk','cvbcvb','cvcvbcvb',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:14','2016-08-02 01:54:29'),(14,'rt45','haidar',NULL,NULL,'jkhjkh,.,m.','cvbcvb','cvcvbcvb',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:20','2016-08-02 03:33:17'),(15,'rt45','haidar',NULL,NULL,'hjkjhkjhkh67','cvbcvb','cvcvbcvbgfhfgh',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:29','2016-08-02 03:33:17'),(16,'iniloh',NULL,NULL,NULL,'iniloh','cvbcvbgh','bbnm',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:36','2016-08-02 01:54:29'),(17,'siapasih',NULL,NULL,NULL,'siapa sih ?','cvbcvbgh','bbnm',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:55','2016-08-02 03:33:17'),(18,'haidartech','haidartech',NULL,NULL,'haidartech','haidartech','haidartech',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 17:19:53','2016-08-02 03:33:17'),(19,'haidartech','haidartech',NULL,NULL,'haidartech','haidartech','haidartech',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 17:19:53','2016-08-02 03:33:17'),(37,'cvbvcb','cvb',NULL,NULL,'cvbvcb','cvb','vcbcv',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:47:50','2016-08-02 03:33:17'),(38,'dendi','dendi',NULL,NULL,'dendi','dendi','dendi',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:48:12','2016-08-02 01:54:29'),(39,'ria','d42a9ad09e9778b177d409f5716ac621',NULL,NULL,'ria','ria','ria',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:50:12','2016-08-02 01:54:29'),(40,'dony','77ee6d05b23e742e2aca3fd602f4c599',NULL,NULL,'dony','dony','dony',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:54:28','2016-08-02 01:54:29'),(41,'dony','77ee6d05b23e742e2aca3fd602f4c599',NULL,NULL,'dony','dony','dony',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:54:52','2016-08-02 03:33:17'),(42,'dony','77ee6d05b23e742e2aca3fd602f4c599',NULL,NULL,'dony','dony','dony',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:55:27','2016-08-02 01:54:29'),(43,'ruly','ee7ec63dd0e87cf4e43b288b306ca206',NULL,NULL,'ruly','ruly','ruly',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:55:44','2016-08-02 01:54:29'),(44,'helmi','cf3750951241a8cf90e2a0fb0af63fe2',NULL,NULL,'helmi','helmi','helmi',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:57:28','2016-08-02 01:54:29'),(45,'sdfsdf','d58e3582afa99040e27b92b13c8f2280',NULL,NULL,'sdfsdf','sdfsdf','sdfsdf',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2016-08-01 19:58:55','2016-08-02 04:50:46'),(46,'sdfsdf','d58e3582afa99040e27b92b13c8f2280',NULL,NULL,'sdfsdf','sdfsdf','sdfsdf',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2016-08-01 19:59:01','2016-08-02 04:50:44'),(49,'mansur','af0ba11942d932e2dcfe5aee0857f775',NULL,NULL,'mansur','123123','bos',1,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-02 02:07:31','2016-08-02 02:07:31');
/*!40000 ALTER TABLE `tlhp_bpk_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpk_user_history`
--

DROP TABLE IF EXISTS `tlhp_bpk_user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpk_user_history` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `login` datetime NOT NULL,
  `logout` datetime DEFAULT NULL,
  `total_use` time DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `fk_bpk_user_history` (`user_id`),
  CONSTRAINT `fk_bpk_user_history` FOREIGN KEY (`user_id`) REFERENCES `tlhp_bpk_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_user_history`
--

LOCK TABLES `tlhp_bpk_user_history` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_user_history` DISABLE KEYS */;
INSERT INTO `tlhp_bpk_user_history` VALUES (1,5,'2016-07-28 15:38:08',NULL,NULL),(2,5,'2016-07-28 15:38:38','2016-07-28 15:39:03',NULL),(3,5,'2016-07-28 15:41:37','2016-07-28 15:43:23',NULL),(4,5,'2016-07-28 15:47:44','2016-07-28 15:59:15',NULL),(5,5,'2016-07-28 16:03:44','2016-07-28 16:03:49',NULL),(6,5,'2016-07-28 16:03:56','2016-07-28 16:17:10',NULL),(7,8,'2016-07-28 16:17:24','2016-07-28 16:18:10',NULL),(8,5,'2016-07-28 16:18:55','2016-07-28 16:21:13',NULL),(9,8,'2016-07-28 16:21:19','2016-07-28 16:22:26',NULL),(10,5,'2016-07-28 16:22:36','2016-07-28 16:22:42',NULL),(11,5,'2016-07-28 16:22:48','2016-07-28 17:18:50',NULL),(12,10,'2016-07-28 17:19:01','2016-07-28 17:19:53',NULL),(13,5,'2016-07-28 17:28:11','2016-07-28 17:28:46',NULL),(14,5,'2016-07-28 17:29:40','2016-07-28 18:07:22',NULL),(15,5,'2016-07-28 18:37:08',NULL,NULL),(16,5,'2016-07-29 00:50:27','2016-07-29 00:51:51',NULL),(17,11,'2016-07-29 01:15:53','2016-07-29 03:04:32',NULL),(18,5,'2016-07-29 03:04:37','2016-07-29 13:07:12',NULL),(19,5,'2016-07-29 13:07:31','2016-07-29 13:24:12',NULL),(20,5,'2016-07-29 13:37:24',NULL,NULL),(21,41,'2016-07-30 02:35:23',NULL,NULL),(22,5,'2016-07-31 17:02:22','2016-07-31 18:03:19',NULL),(23,5,'2016-07-31 20:46:44',NULL,NULL),(24,5,'2016-08-01 07:00:59',NULL,NULL),(25,5,'2016-08-01 10:14:17','2016-08-01 10:26:54',NULL),(26,5,'2016-08-01 10:26:59','2016-08-01 10:39:57',NULL),(27,5,'2016-08-01 10:40:02','2016-08-01 10:45:13',NULL),(28,14,'2016-08-01 11:48:30','2016-08-01 11:50:54',NULL),(29,5,'2016-08-01 11:51:49','2016-08-01 11:54:22',NULL),(30,5,'2016-08-01 11:54:30','2016-08-01 12:00:51',NULL),(32,5,'2016-08-01 12:08:25','2016-08-01 12:08:55',NULL),(33,5,'2016-08-01 12:09:02','2016-08-01 12:09:15',NULL),(34,11,'2016-08-01 12:11:08','2016-08-01 17:07:08',NULL),(35,5,'2016-08-01 12:11:31','2016-08-01 14:24:35',NULL),(36,5,'2016-08-01 12:12:30','2016-08-01 12:12:49',NULL),(37,5,'2016-08-01 12:12:57','2016-08-01 12:26:45',NULL),(38,10,'2016-08-01 17:07:52','2016-08-01 19:07:15',NULL),(39,10,'2016-08-01 19:07:25','2016-08-01 19:12:57',NULL),(40,5,'2016-08-01 23:10:37','2016-08-01 23:38:00',NULL),(41,5,'2016-08-02 00:17:12','2016-08-02 01:29:11',NULL),(42,5,'2016-08-02 01:29:19','2016-08-02 02:27:49',NULL),(43,5,'2016-08-02 02:28:02','2016-08-02 03:30:52',NULL),(44,5,'2016-08-02 03:30:58',NULL,NULL),(45,5,'2016-08-02 06:24:58','2016-08-02 07:50:33',NULL),(46,5,'2016-08-02 07:50:37','2016-08-02 07:50:57',NULL),(47,5,'2016-08-02 07:51:00','2016-08-02 08:20:36',NULL),(48,5,'2016-08-02 08:20:39','2016-08-02 09:05:58',NULL),(49,5,'2016-08-02 09:06:02','2016-08-02 09:07:37',NULL),(50,49,'2016-08-02 09:07:46','2016-08-02 10:21:45',NULL),(51,5,'2016-08-02 10:21:49','2016-08-02 11:51:14',NULL),(52,5,'2016-08-02 12:07:20',NULL,NULL),(53,5,'2016-08-07 09:49:32',NULL,NULL),(54,5,'2016-08-07 15:39:09',NULL,NULL),(55,5,'2016-08-08 09:42:06',NULL,NULL),(56,5,'2016-08-08 14:44:01',NULL,NULL),(57,5,'2016-08-10 13:57:06','2016-08-10 13:57:17',NULL),(58,5,'2016-08-10 13:58:56',NULL,NULL),(59,5,'2016-08-11 07:24:23',NULL,NULL),(60,5,'2016-08-11 14:26:28',NULL,NULL),(61,5,'2016-08-11 19:03:24',NULL,NULL),(62,5,'2016-08-12 05:50:09',NULL,NULL),(63,5,'2016-08-13 09:31:02',NULL,NULL),(64,5,'2016-08-13 12:42:48',NULL,NULL),(65,5,'2016-08-13 15:41:31',NULL,NULL),(66,5,'2016-08-13 23:46:46',NULL,NULL),(67,5,'2016-08-14 01:14:33','2016-08-14 01:24:00',NULL),(68,5,'2016-08-14 01:24:08',NULL,NULL),(69,5,'2016-08-14 13:47:31',NULL,NULL),(70,5,'2016-08-14 15:06:43',NULL,NULL);
/*!40000 ALTER TABLE `tlhp_bpk_user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpk_user_level`
--

DROP TABLE IF EXISTS `tlhp_bpk_user_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpk_user_level` (
  `user_level_id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `user_level` varchar(200) NOT NULL,
  PRIMARY KEY (`user_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpk_user_level`
--

LOCK TABLES `tlhp_bpk_user_level` WRITE;
/*!40000 ALTER TABLE `tlhp_bpk_user_level` DISABLE KEYS */;
INSERT INTO `tlhp_bpk_user_level` VALUES (1,'super admin'),(2,'admin'),(3,'user');
/*!40000 ALTER TABLE `tlhp_bpk_user_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_jenis_pengawasan`
--

DROP TABLE IF EXISTS `tlhp_bpkp_jenis_pengawasan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpkp_jenis_pengawasan` (
  `jenis_pengawasan_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `jenis_pengawasan` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`jenis_pengawasan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_jenis_pengawasan`
--

LOCK TABLES `tlhp_bpkp_jenis_pengawasan` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_jenis_pengawasan` DISABLE KEYS */;
INSERT INTO `tlhp_bpkp_jenis_pengawasan` VALUES (1,'AUDIT'),(2,'REVIU'),(3,'EVALUASI'),(4,'PEMANTAUAN'),(5,'TINDAK LANJUT PENGADUAN'),(6,'PENGAWASAN LAIN');
/*!40000 ALTER TABLE `tlhp_bpkp_jenis_pengawasan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_kertas_kerja_temuan`
--

DROP TABLE IF EXISTS `tlhp_bpkp_kertas_kerja_temuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpkp_kertas_kerja_temuan` (
  `kertas_kerja_id` int(10) NOT NULL AUTO_INCREMENT,
  `lhp_id` int(11) NOT NULL,
  `jenis_temuan` enum('a','b','c') NOT NULL,
  `no_temuan` varchar(500) DEFAULT NULL,
  `kode_temuan_id` int(10) DEFAULT NULL,
  `uraian_temuan` varchar(500) DEFAULT NULL,
  `kode_sebab_id` int(4) DEFAULT NULL,
  `uraian_sebab` varchar(500) DEFAULT NULL,
  `nilai_temuan` varchar(500) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_kertas_kerja_temuan`
--

LOCK TABLES `tlhp_bpkp_kertas_kerja_temuan` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_kertas_kerja_temuan` DISABLE KEYS */;
INSERT INTO `tlhp_bpkp_kertas_kerja_temuan` VALUES (2,19,'',NULL,NULL,'sdf',4,'sdf','123',5,'2016-07-29 17:39:10','2016-08-01 19:45:33'),(3,19,'',NULL,NULL,'sdf',4,'sdf','123',5,'2016-07-29 17:42:11','2016-08-01 19:45:34'),(8,20,'a',NULL,NULL,'ssf',4,'ssfdsfdsf','12313',5,'2016-07-29 19:08:22','2016-08-01 19:45:35'),(9,20,'a',NULL,NULL,'ssf',4,'ssfdsfdsf','12313',5,'2016-07-29 19:08:22','2016-08-01 19:45:35'),(13,21,'a',NULL,NULL,'uraian temuan 1',5,'uraian sebab 1','123',5,'2016-07-29 19:14:41','2016-08-01 19:45:36'),(14,22,'b',NULL,NULL,'uraian temuan 1',17,'uraian sebab 2','789',5,'2016-07-29 19:19:27','2016-08-01 19:45:36'),(16,25,'a',NULL,NULL,'sdf',5,'sfd','123',5,'2016-07-29 19:30:44','2016-08-01 19:45:38');
/*!40000 ALTER TABLE `tlhp_bpkp_kertas_kerja_temuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_kode_rekomendasi`
--

DROP TABLE IF EXISTS `tlhp_bpkp_kode_rekomendasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpkp_kode_rekomendasi` (
  `kode_rekomendasi_id` int(10) NOT NULL AUTO_INCREMENT,
  `kode_rekomendasi` varchar(10) DEFAULT NULL,
  `uraian_rekomendasi` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`kode_rekomendasi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_kode_rekomendasi`
--

LOCK TABLES `tlhp_bpkp_kode_rekomendasi` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_kode_rekomendasi` DISABLE KEYS */;
INSERT INTO `tlhp_bpkp_kode_rekomendasi` VALUES (6,'00','KODE REKOMENDASI'),(7,'01','Penyetoran ke kas negara/daerah, kas BUMN/D, dan masyararakat'),(8,'02','Pengembalian barang kepada negara, daerah, BUMN/D, dan masyarakat'),(9,'03','Perbaikan fisik barang/jasa dalam proses pembangunan atau penggantian barang/jasa oleh rekanan'),(10,'04','Penghapusan barang milik negara/daerah'),(11,'05','Pelaksanaan sanksi administrasi kepegawaian'),(12,'06','Perbaikan laporan dan penertiban administrasi/kelengkapan administrasi'),(13,'07','Perbaikan sistem dan prosedur akuntansi dan pelaporan'),(14,'08','Peningkatan kualitas dan kuantitas sumber daya manusia pendukung sistem pengendalian'),(15,'09','Perubahan atau perbaikan prosedur, peraturan dan kebijakan'),(16,'10','Perubahan atau perbaikan struktur organisasi'),(17,'11','Koordinasi antar instansi termasuk juga penyerahan penanganan kasus kepada instansi yang berwenang'),(18,'12','Pelaksanaan penelitian oleh tim khusus atau audit lanjutan oleh unit pengawas intern'),(19,'13','Pelaksanaan sosialisasi'),(20,'14','Lain-lain');
/*!40000 ALTER TABLE `tlhp_bpkp_kode_rekomendasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_kode_sebab`
--

DROP TABLE IF EXISTS `tlhp_bpkp_kode_sebab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpkp_kode_sebab` (
  `kode_sebab_id` int(10) NOT NULL AUTO_INCREMENT,
  `kode_sebab_group` tinyint(3) DEFAULT NULL,
  `kode_sebab` varchar(10) DEFAULT NULL,
  `uraian_sebab` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`kode_sebab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_kode_sebab`
--

LOCK TABLES `tlhp_bpkp_kode_sebab` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_kode_sebab` DISABLE KEYS */;
INSERT INTO `tlhp_bpkp_kode_sebab` VALUES (2,0,'0','Penyebab lain yang belum didefinisikan (nihil)'),(3,1,'100','KELEMAHAN PENGAWASAN MELEKAT'),(4,1,'101','Pembagian wewenang dalam organisasi belum cukup jauh sehingga masih terdapat transaksi atau kegiatan organisasi yang seluruh tahapnya dikuasai oleh satu orang'),(5,1,'102','Pembagian wewenang dalam organisasi belum cukup jelas sehingga ada kegiatan atau kejadian dalam organisasi yang tidak jelas penanggungjawabnya'),(6,1,'103','Dalam organisasi tidak ada pembagian wewenang dan tugas'),(7,1,'104','Kelalaian pejabat yang berwenang'),(8,1,'105','Kelemahan lain organisasi'),(9,2,'200','KELEMAHAN DALAM KEBIJAKAN/ KEBIJAKSANAAN'),(10,2,'201','Kebijakan yang berlaku tidak jelas bagi para bawahan'),(11,2,'202','Kebijakan yang berlaku tidak dapat menjadi pedoman yang pasti bagi para bawahan'),(12,2,'203','Kebijaksanaan yang berlaku tidak dikomunikasikan secara lisan maupun tertulis'),(13,2,'204','Tidak ada kebijakan yang digariskan'),(14,2,'205','Kelemahan lain kebijakan'),(15,2,'206','Kebijakan tidak sejalan/bertentangan dengan ketentuan yang lebih tinggi'),(16,3,'300','KELEMAHAN DALAM RENCANA'),(17,3,'301','Rencana kerja yang disusun tidak cukup luas sehingga belum mencakup seluruh kegiatan yang perlu dilaksanakan'),(18,3,'302','Hubungan kerja di antara kegiatan-kegiatan yang direncanakan tidak jelas dirumuskan sehingga tidak ada koordinasi di antara kegiatan-kegiatan itu'),(19,3,'303','Sasaran yang akan dicapai tidak cukup jelas dirumuskan'),(20,3,'304','Sasaran yang akan dicapai tidak cukup dikuantifikasikan'),(21,3,'305','Tidak dibuat anggaran yang merupakan kuantifikasi moneter rencana kegiatan dan sasaran yang akan dicapai'),(22,3,'306','Tidak ada rencana kegiatan'),(23,3,'307','Rencana kegiatan tidak cukup realistis'),(24,3,'308','Anggaran tidak cukup realistis'),(25,3,'309','Kelemahan lain perencanaan'),(26,3,'310','Perencanaan tidak matang'),(27,4,'400','KELEMAHAN DALAM PROSEDUR'),(28,4,'401','Prosedur yang ada tidak konsisten dengan kebijaksanaan yang perlu dilaksanakan'),(29,4,'402','Prosedur yang berlaku disalahtafsirkan oleh pegawai sehingga menyimpang dari tujuannya'),(30,4,'403','Prosedur yang berlaku tidak dimengerti sehingga tidak dilaksanakan'),(31,4,'404','Prosedur yang berlaku terlalu mahal dibandingkan dengan sesuatu yang harus dijaga sehingga tidak dilaksanakan'),(32,4,'405','Prosedur yang berlaku kurang terinci'),(33,4,'406','Prosedur yang berlaku tidak dapat menjadi pegangan bawahan karena tidak tertulis'),(34,4,'407','Prosedur yang berlaku tidak dikomunikasikan secara tertulis maupun lisan'),(35,4,'408','Tidak terdapat prosedur yang diperlukan'),(36,4,'409','Kelemahan lain prosedur'),(37,5,'500','KELEMAHAN DALAM PENCATATAN DAN PELAPORAN'),(38,5,'501','Pencatatan tidak diselenggarakan secara cermat sehingga kehilangan keadaannya'),(39,5,'502','Pencatatan tidak dimutakhirkan sehingga kehilangan peranannya sebagai alat pengawasan/pengendalian'),(40,5,'503','Pencatatan tidak memenuhi kebutuhan informasi untuk pengambilan keputusan sehari-hari'),(41,5,'504','Tidak diselenggarakan pencatatan yang perlu'),(42,5,'505','Pelaporan tidak tepat waktu'),(43,5,'506','Pelaporan tidak disusun dengan cermat'),(44,5,'507','Pelaporan tidak disusun memenuhi kebutuhan pimpinan'),(45,5,'508','Pelaporan disusun dengan biaya mahal'),(46,5,'509','Pelaporan yang diperlukan tidak ada'),(47,5,'510','Kelemahan lain pencatatan atau pelaporan'),(48,6,'600','KELEMAHAN DALAM PEMBINAAN PERSONIL'),(49,6,'601','Pegawai kurang mendapatkan supervisi (pengawasan) yang diperlukan (termasuk tidak dilakukan pemeriksaan kas bendaharawan oleh atasan langsung dan pemeriksaan fisik atas inventaris atau pers'),(50,6,'602','Supervisor tidak menyadari siapa yang harus diawasi dan apa yang harus diawasi'),(51,6,'603','Penugasan/penempatan pegawai tidak tepat/sesuai dengan latar belakang pendidikan '),(52,6,'604','Kelemahan lain pembinaan personil'),(53,7,'700','KELEMAHAN DALAM PENGAWASAN INTERN (INTERNAL REVIEW)'),(54,7,'701','Tidak ada satuan kerja atau pejabat yang diberi tanggung jawab untuk mengecek jalannya sistem dan prosedur yang telah ditetapkan'),(55,7,'702','Satuan kerja atau pejabat yang diberi tanggung jawab menguji jalannya sistem dan prosedur tidak berfungsi dengan baik'),(56,7,'703','Kelemahan lain pengkajian intern'),(57,8,'800','KELEMAHAN PENGAWASAN TERHADAP REKANAN'),(58,8,'801','Kelemahan Pengawasan Pemimpin Proyek'),(59,8,'802','Kelemahan Pengawasan Pimpinan Satker'),(60,9,'900','PENYEBAB EKSTERN HAMBATAN KELANCARAN PROYEK'),(61,9,'901','Pekerjaan persiapan proyek dan perumusan proyek kurang mantap (survei dan disain tidak mantap)'),(62,9,'902','DIP terlambat diterima proyek'),(63,9,'903','Revisi DIP yang diajukan pemimpin proyek penyelesaiannya menjadi berlarut-larut'),(64,9,'904','Tanah yang diperlukan proyek penyelesaiannya menjadi berlarut-larut'),(65,9,'905','Tidak dapat diperoleh tanah yang diperlukan proyek karena dana tidak mencukupi atau tidak tersedia'),(66,9,'906','Penetapan rekanan menjadi berlarut-larut'),(67,9,'907','Perijinan atau persetujuan untuk memulai suatu kegiatan proyek menjadi berlarut-larut'),(68,9,'908','Sarana komunikasi dan atau telekomunikasi tidak mendukung kelancaran proyek'),(69,9,'909','Rekanan yang ditetapkan tidak mampu menyelesaikan tanggungjawabnya'),(70,9,'910','Penyebab ekstern hambatan kelancaran proyek lainnya'),(71,9,'911','Rekanan mempunyai itikad yang kurang baik'),(72,10,'1000','PENYEBAB EKSTERN HAMBATAN KELANCARAN TUGAS POKOK INSTANSI'),(73,10,'1001','Instansi lain yang terkait kurang responsif'),(74,10,'1002','Sarana komunikasi dan atau telekomunikasi tidak mendukung kelancaran tugas instansi'),(75,10,'1003','Revisi DIK yang diajukan pimpinan instansi penyelesaiannya berlarut-larut'),(76,10,'1004','Rekanan yang telah ditetapkan tidak mampu menyelesaikan tanggungjawabnya'),(77,10,'1005','Perijinan atau persetujuan untuk memulai suatu kegiatan instansi menjadi berlarut-larut'),(78,10,'1006','Penyebab ekstern hambatan kelancaran tupoksi lainnya'),(79,10,'1007','Pencairan dana pinjaman tidak tepat waktu atau tidak sesuai jadwal kebutuhan'),(80,11,'1100','PENYEBAB KETIDAKLANCARAN PELAYANAN APARATUR PEMERINTAHAN/  BUMN/BUMD KEPADA MASYARAKAT'),(81,11,'1101','Prosedur yang ditetapkan belum sederhana'),(82,11,'1102','Masyarakat buta terhadap persyaratan yang perlu dipenuhi dan prosedur yang harus ditempuh'),(83,11,'1103','Tidak ada batas waktu maksimum penyelesaian pelayanan'),(84,11,'1104','Prosedur yang ditetapkan cukup banyak titik pertemuan pegawai dengan masyarakat sehingga membuka peluang pungutan liar'),(85,11,'1105','Persyaratan yang ditetapkan berlebihan sehingga menyulitkan pemohonan pelayanan'),(86,11,'1106','Tidak ada koordinasi antar instansi sehingga jelas siapa yang berwenang mengambil keputusan'),(87,11,'1107','Penyebab lain ketidaklancaran pelayanan');
/*!40000 ALTER TABLE `tlhp_bpkp_kode_sebab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_kode_temuan`
--

DROP TABLE IF EXISTS `tlhp_bpkp_kode_temuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpkp_kode_temuan` (
  `kode_temuan_id` int(10) NOT NULL AUTO_INCREMENT,
  `kelompok` smallint(3) DEFAULT NULL,
  `sub_kelompok` smallint(3) DEFAULT NULL,
  `jenis` smallint(3) DEFAULT NULL,
  `kode_temuan` varchar(1000) DEFAULT NULL,
  `alt_rekom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kode_temuan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_kode_temuan`
--

LOCK TABLES `tlhp_bpkp_kode_temuan` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_kode_temuan` DISABLE KEYS */;
INSERT INTO `tlhp_bpkp_kode_temuan` VALUES (1,1,1,1,'Temuan Ketidakpatuhan Terhadap Peraturan',NULL),(2,1,1,NULL,'Kerugian negara/daerah atau kerugian negara/daerah\r\nyang terjadi pada perusahaan milik negara/daerah',NULL),(3,1,1,1,'Belanja dan/atau pengadaan barang/jasa fiktif',NULL),(4,1,1,2,'Rekanan pengadaan barang/jasa tidak menyelesaikan\r\npekerjaan',NULL),(5,1,1,3,'Kekurangan volume pekerjaan dan/atau barang',NULL),(6,1,1,4,'Kelebihan pembayaran selain kekurangan volume pekerjaan\r\ndan/atau barang',NULL),(7,1,1,5,'Pemahalan harga (Mark up)',NULL),(8,1,1,6,'Penggunaan uang/barang untuk kepentingan pribadi',NULL),(9,1,1,7,'Pembayaran honorarium dan/atau biaya perjalanan dinas\r\nganda dan/atau melebihi standar yang ditetapkan',NULL),(10,1,1,8,'Spesifikasi barang/jasa yang diterima tidak sesuai dengan\r\nkontrak',NULL),(11,1,1,9,'Belanja tidak sesuai atau melebihi ketentuan',NULL),(12,1,1,10,'Pengembalian pinjaman/piutang atau dana bergulir macet',NULL),(13,1,1,11,'Kelebihan penetapan dan pembayaran restitusi pajak atau\r\npenetapan kompensasi kerugian',NULL),(14,1,1,12,'Penjualan/pertukaran/penghapusan aset negara/daerah tidak\r\nsesuai ketentuan dan merugikan negara/daerah',NULL),(15,1,1,13,'Pengenaan ganti kerugian negara belum/tidak dilaksanakan\r\nsesuai ketentuan',NULL),(16,1,1,14,'Entitas belum/tidak melaksanakan tuntutan perbendaharaan\r\n(TP) sesuai ketentuan',NULL),(17,1,1,15,'Penghapusan hak tagih tidak sesuai ketentuan',NULL),(18,1,1,16,'Pelanggaran ketentuan pemberian diskon penjualan',NULL),(19,1,1,17,'Penentuan HPP (harga pokok pembelian) terlalu rendah\r\nsehingga penentuan harga jual lebih rendah dari yang\r\nseharusnya',NULL),(20,1,1,18,'Jaminan pelaksanaan dalam pelaksanaan pekerjaan,\r\npemanfaatan barang dan pemberian fasilitas tidak dapat\r\ndicairkan',NULL),(21,1,1,19,'Penyetoran penerimaan negara/daerah dengan bukti fiktif',NULL),(22,1,2,NULL,'Potensi kerugian negara/daerah atau kerugian\r\nnegara/daerah yang terjadi pada perusahaan milik\r\nnegara/daerah',NULL),(23,1,2,1,'Kelebihan pembayaran dalam pengadaan barang/jasa tetapi\r\npembayaran pekerjaan belum dilakukan sebagian atau\r\nseluruhnya',NULL),(24,1,2,2,'Rekanan belum melaksanakan kewajiban pemeliharaan\r\nbarang hasil pengadaan yang telah rusak selama masa\r\npemeliharaan',NULL),(25,1,2,3,'Aset dikuasai pihak lain',NULL),(26,1,2,4,'Pembelian aset yang berstatus sengketa',NULL),(27,1,2,5,'Aset tidak diketahui keberadaannya',NULL),(28,1,2,6,'Pemberian jaminan pelaksanaan dalam pelaksanaan\r\npekerjaan, pemanfaatan barang dan pemberian fasilitas tidak\r\nsesuai ketentuan',NULL),(29,1,2,7,'Pihak ketiga belum melaksanakan kewajiban untuk\r\nmenyerahkan aset kepada negara/daerah',NULL),(30,1,2,8,'Piutang/pinjaman atau dana bergulir yang berpotensi tidak\r\ntertagih',NULL),(31,1,2,9,'Penghapusan piutang tidak sesuai ketentuan',NULL),(32,1,2,10,'Pencairan anggaran pada akhir tahun anggaran untuk\r\npekerjaan yang belum selesai',NULL),(33,1,3,NULL,'Kekurangan penerimaan negara/daerah atau perusahaan\r\nmilik negara/daerah',NULL),(34,1,3,1,'Penerimaan negara/daerah atau denda keterlambatan\r\npekerjaan belum/tidak ditetapkan dipungut/diterima/disetor ke\r\nkas negara/daerah atau perusahaan milik negara/daerah',NULL),(35,1,3,2,'Penggunaan langsung penerimaan negara/daerah',NULL),(36,1,3,3,'Dana Perimbangan yang telah ditetapkan belum masuk ke\r\nkas daerah',NULL),(37,1,3,4,'Penerimaan negara/daerah diterima atau digunakan oleh\r\ninstansi yang tidak berhak',NULL),(38,1,3,5,'Pengenaan tarif pajak/PNBP lebih rendah dari ketentuan',NULL),(39,1,3,6,'Koreksi perhitungan bagi hasil dengan KKKS',NULL),(40,1,3,7,'Kelebihan pembayaran subsidi oleh pemerintah',NULL),(41,1,4,NULL,'Administrasi',NULL),(42,1,4,1,'Pertanggungjawaban tidak akuntabel (bukti tidak\r\nlengkap/tidak valid)',NULL),(43,1,4,2,'Pekerjaan dilaksanakan mendahului kontrak atau penetapan\r\nanggaran',NULL),(44,1,4,3,'Proses pengadaan barang/jasa tidak sesuai ketentuan (tidak\r\nmenimbulkan kerugian negara)',NULL),(45,1,4,4,'Pemecahan kontrak untuk menghindari pelelangan',NULL),(46,1,4,5,'Pelaksanaan lelang secara performa',NULL),(47,1,4,6,'Penyimpangan terhadap peraturan perundang-undangan\r\nbidang pengelolaan perlengkapan atau barang milik',NULL),(48,1,4,7,'Penyimpangan terhadap peraturan perundang-undangan\r\nbidang tertentu lainnya seperti kehutanan, pertambangan,\r\nperpajakan, dll',NULL),(49,1,4,8,'Koreksi perhitungan subsidi/kewajiban pelayanan umum',NULL),(50,1,4,9,'Pembentukan cadangan piutang, perhitungan penyusutan\r\natau amortisasi tidak sesuai ketentuan',NULL),(51,1,4,10,'Penyetoran penerimaan negara/daerah atau kas di\r\nbendaharawan ke kas negara/daerah melebihi batas waktu\r\nyang ditentukan',NULL),(52,1,4,11,'Pertanggungjawaban/penyetoran uang persediaan melebihi\r\nbatas waktu yang ditentukan',NULL),(53,1,4,12,'Sisa kas di bendahara pengeluaran akhir tahun anggaran\r\nbelum/tidak disetor ke kas negara/daerah',NULL),(54,1,4,13,'Pengeluaran investasi pemerintah tidak didukung bukti yang\r\nsah',NULL),(55,1,4,14,'Kepemilikan aset tidak/belum didukung bukti yang sah',NULL),(56,1,4,15,'Pengalihan anggaran antar MAK tidak sah',NULL),(57,1,4,16,'Pelampauan pagu anggaran',NULL),(58,1,5,NULL,'Indikasi tindak pidana',NULL),(59,1,5,1,'Indikasi tindak pidana korupsi',NULL),(60,1,5,2,'Indikasi tindak pidana perbankan',NULL),(61,1,5,3,'Indikasi tindak pidana perpajakan',NULL),(62,1,5,4,'Indikasi tindak pidana kepabeanan',NULL),(63,1,5,5,'Indikasi tindak pidana kehutanan',NULL),(64,1,5,6,'Indikasi tindak pidana pasar modal',NULL),(65,1,5,7,'Indikasi tindak pidana khusus lainnya',NULL),(66,2,NULL,NULL,'Temuan kelemahan sistem pengendalian intern',NULL),(67,2,1,NULL,'Kelemahan sistem pengendalian akuntansi dan\r\npelaporan',NULL),(68,2,1,1,'Pencatatan tidak/belum dilakukan atau tidak akurat',NULL),(69,2,1,2,'Proses penyusunan laporan tidak sesuai ketentuan',NULL),(70,2,1,3,'Entitas terlambat menyampaikan laporan',NULL),(71,2,1,4,'Sistem informasi akuntansi dan pelaporan tidak memadai',NULL),(72,2,1,5,'Sistem informasi akuntansi dan pelaporan belum didukung\r\nSDM yang memadai',NULL),(73,2,2,NULL,'Kelemahan sistem pengendalian pelaksanaan anggaran\r\npendapatan dan belanja',NULL),(74,2,2,1,'Perencanaan kegiatan tidak memadai',NULL),(75,2,2,2,'Mekanisme pemungutan, penyetoran dan pelaporan serta\r\npenggunaan Penerimaan negara/daerah/perusahaan dan\r\nhibah tidak sesuai ketentuan',NULL),(76,2,2,3,'Penyimpangan terhadap peraturan perundang-undangan\r\nbidang teknis tertentu atau ketentuan intern organisasi yang\r\ndiperiksa tentang pendapatan dan belanja',NULL),(77,2,2,4,'Pelaksanaan belanja di luar mekanisme APBN/APBD',NULL),(78,2,2,5,'Penetapan/pelaksanaan kebijakan tidak tepat atau belum\r\ndilakukan berakibat hilangnya potensi\r\npenerimaan/pendapatan',NULL),(79,2,2,6,'Penetapan/pelaksanaan kebijakan tidak tepat atau belum\r\ndilakukan berakibat peningkatan biaya /belanja',NULL),(80,2,2,7,'Kelemahan pengelolaan fisik aset',NULL),(81,2,3,NULL,'Kelemahan struktur pengendalian intern',NULL),(82,2,3,1,'Entitas tidak memiliki SOP yang formal untuk suatu prosedur\r\natau keseluruhan prosedur',NULL),(83,2,3,2,'SOP yang ada pada entitas tidak berjalan secara optimal\r\natau tidak ditaati',NULL),(84,2,3,3,'Entitas tidak memiliki satuan pengawas intern',NULL),(85,2,3,4,'Satuan pengawas intern yang ada tidak memadai atau tidak\r\nberjalan optimal',NULL),(86,2,3,5,'Tidak ada pemisahan tugas dan fungsi yang memadai',NULL),(87,3,NULL,NULL,'Temuan 3E',NULL),(88,3,1,NULL,'Ketidakhematan/pemborosan/ketidakekonomisan',NULL),(89,3,1,1,'Pengadaan barang/jasa melebihi kebutuhan',NULL),(90,3,1,2,'Penetapan kualitas dan kuantitas barang/jasa yang\r\ndigunakan tidak sesuai standar',NULL),(91,3,1,3,'Pemborosan keuangan negara/daerah/perusahaan atau\r\nkemahalan harga',NULL),(92,3,2,NULL,'Ketidakefisienan',NULL),(93,3,2,1,'Penggunaan kuantitas input untuk satu satuan output lebih\r\nbesar/tinggi dari yang seharusnya',NULL),(94,3,2,2,'Penggunaan kualitas input untuk satu satuan output lebih\r\ntinggi dari seharusnya',NULL),(95,3,3,NULL,'Ketidakefektifan',NULL),(96,3,3,1,'Penggunaan anggaran tidak tepat sasaran/tidak sesuai\r\nperuntukan',NULL),(97,3,3,2,'Pemanfaatan barang/jasa dilakukan tidak sesuai dengan\r\nrencana yang ditetapkan',NULL),(98,3,3,3,'Barang yang dibeli belum/tidak dapat dimanfaatkan',NULL),(99,3,3,4,'Pemanfaatan barang/jasa tidak berdampak terhadap\r\npencapaian tujuan organisasi',NULL),(100,3,3,5,'Pelaksanaan kegiatan terlambat/terhambat sehingga\r\nmempengaruhi pencapaian tujuan organisasi',NULL),(101,3,3,6,'Pelayanan kepada masyarakat tidak optimal',NULL),(102,3,3,7,'Fungsi atau tugas instansi yang diperiksa tidak\r\ndiselenggarakan dengan baik termasuk target penerimaan\r\ntidak tercapai',NULL),(103,3,3,8,'Penggunaan biaya promosi/pemasaran tidak efektif',NULL);
/*!40000 ALTER TABLE `tlhp_bpkp_kode_temuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_lhp`
--

DROP TABLE IF EXISTS `tlhp_bpkp_lhp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_lhp`
--

LOCK TABLES `tlhp_bpkp_lhp` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_lhp` DISABLE KEYS */;
INSERT INTO `tlhp_bpkp_lhp` VALUES (4,'sdf',NULL,NULL,NULL,NULL,NULL,1,'sdf','sdf','sdf',NULL,NULL,NULL,'sdf',NULL,NULL,NULL,4,'2016-07-26 03:41:37','2016-07-26 03:45:53'),(5,'asfas','2016-07-07','2016-07-07','2016-07-07','2016-07-07','2016-07-07',1,'dfdasfsaf','asdf','asdfasdf',NULL,NULL,NULL,'asf','2016-07-07','2016-07-07','2016-07-07',4,'2016-07-26 04:38:52','2016-07-26 04:38:52'),(6,'asdf','2016-07-05','2016-07-05','2016-07-26','2016-07-14','2016-07-26',1,NULL,'sdfsdf','sdf','2016-07-06',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 05:08:40','2016-07-26 05:08:40'),(7,'TUGAS','2016-07-07','2016-07-12','2016-07-12','2016-07-12','2016-07-25',3,'sdfPENGAWASAN','JUDUL','NOMOR','2016-06-29','PPK','KEGIATAN',NULL,NULL,NULL,NULL,4,'2016-07-26 05:12:15','2016-07-26 05:12:15'),(8,'TUGAS','2016-07-07','2016-07-12','2016-07-12','2016-07-12','2016-07-25',3,'sdfPENGAWASAN','JUDUL','NOMOR','2016-06-29','PPK','KEGIATAN','PERPANJANGAN','2016-07-07','2016-07-07','2016-07-07',4,'2016-07-26 05:12:46','2016-07-26 05:12:46'),(9,'TUGAS','2016-07-07','2016-07-12','2016-07-12','2016-07-12','2016-07-25',3,'sdfPENGAWASAN','JUDUL','NOMOR','2016-06-29','PPK','KEGIATAN','PERPANJANGAN','2016-07-05','2016-07-05','2016-07-12',4,'2016-07-26 05:14:33','2016-07-26 05:14:33'),(10,'TUGAS','2016-07-07','2016-07-12','2016-07-12','2016-07-12','2016-07-25',3,'PENGAWASAN','JUDUL','NOMOR','2016-06-29','PPK','KEGIATAN','PERPANJANGAN','2016-07-07','2016-07-07','2016-07-07',4,'2016-07-26 05:14:53','2016-07-27 06:37:02'),(11,'dsf','2016-07-07','2016-07-07','2016-07-07','2016-07-07','2016-07-07',1,NULL,'sdfsdf','sdfsdf','2016-06-27',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 06:25:56','2016-07-26 06:25:56'),(12,'dsf','2016-07-07','2016-07-07','2016-07-07','2016-07-07','2016-07-07',2,NULL,'hhgkihjkghjk','sdfsdf','2016-06-27',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 06:26:20','2016-07-26 06:26:20'),(13,NULL,'2016-07-07','2016-07-07','2016-07-07','2016-07-07','2016-07-07',1,NULL,'sdfd',NULL,'2016-07-07',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 06:28:30','2016-07-26 06:28:30'),(14,'sdfsdf','2016-07-26','2016-06-27','2016-07-12','2016-07-14','2016-07-11',1,'sdfsdf','sdf','qwewqewqe','2016-07-26',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 07:32:23','2016-07-26 07:32:23'),(15,'sdfsd','2016-07-26','2016-07-26','2016-07-26','2016-07-26','2016-07-26',1,'sd','sd','sdfs','2016-07-26','sd',NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 07:42:01','2016-07-26 07:42:01'),(16,'sdfsd','2016-07-26','2016-07-26','2016-07-26','2016-07-26','2016-07-26',1,'sd','sd','sdfs','2016-07-26','sd',NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 07:42:50','2016-07-26 07:42:50'),(17,'sdfsdf','2016-07-12','2016-07-06','2016-07-13','2016-07-26','2016-07-05',1,'kg','tdxghf','jhfhf','2016-07-26','jkgj','h',NULL,NULL,NULL,NULL,4,'2016-07-26 13:43:04','2016-07-26 13:43:04'),(18,'asdfsdf','2016-07-15','2016-07-12','2016-07-11','2016-07-12','2016-07-12',1,'sdfsdf','judul haidar','sdfsdf','2016-07-27',NULL,NULL,'sdf','2016-07-14','2016-07-05','2016-07-11',4,'2016-07-29 11:27:36','2016-07-29 11:27:36'),(19,'sdfsf','2016-07-12','2016-07-19','2016-07-20','2016-07-14','2016-07-18',1,'sdf','atang test','23423424','2016-07-29',NULL,NULL,'sdfsdf','2016-07-12','2016-07-26','2016-07-26',4,'2016-07-29 13:48:52','2016-07-29 13:48:52'),(20,'sfdsf','2016-07-15','2016-07-06','2016-07-12','2016-07-06','2016-07-21',1,'sdfsdf','bismillah haidar','sdfdsf','2016-07-30',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 17:58:57','2016-07-29 17:58:57'),(21,'123','2016-07-30','2016-07-20','2016-07-13','2016-07-13','2016-07-19',1,'sdfsdf','bismillah tim','sfdsdf','2016-07-06',NULL,NULL,'sdf','2016-07-12','2016-07-05','2016-07-03',4,'2016-07-29 19:09:30','2016-07-29 19:09:30'),(22,'dfgdfgdfg','2016-07-30','2016-07-13','2016-07-26','2016-06-29','2016-06-27',1,'sdfsdf','bismilah ke 2','sdfsdfsf','1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 19:18:00','2016-07-29 19:18:00'),(23,'sf','2016-07-30','2016-07-30','2016-07-30','2016-07-30','2016-07-30',1,'sdf','bismilah ke 3','123','2016-07-09',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 19:21:06','2016-07-29 19:21:06'),(24,'sdfsdf','2016-07-23','2016-07-30','2016-07-12','2016-07-30','2016-07-30',1,'s','bismilah ke 4','123','2016-07-30',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 19:27:01','2016-07-29 19:27:01'),(25,'sdfsdf','2016-07-30','2016-07-30','2016-07-30','2016-07-30','2016-07-30',1,'vcb','bismilah ke 5','sfsf','2016-07-30',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 19:29:38','2016-07-29 19:29:38');
/*!40000 ALTER TABLE `tlhp_bpkp_lhp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_persetujuan_tl`
--

DROP TABLE IF EXISTS `tlhp_bpkp_persetujuan_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_persetujuan_tl`
--

LOCK TABLES `tlhp_bpkp_persetujuan_tl` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_persetujuan_tl` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_bpkp_persetujuan_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_rekomendasi`
--

DROP TABLE IF EXISTS `tlhp_bpkp_rekomendasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpkp_rekomendasi` (
  `rekomendasi_id` int(11) NOT NULL AUTO_INCREMENT,
  `kertas_kerja_id` int(10) NOT NULL,
  `kode_rekomendasi_id` int(4) DEFAULT NULL,
  `uraian_rekomendasi` varchar(500) DEFAULT NULL,
  `kerugian_negara` tinyint(1) DEFAULT NULL,
  `nilai_rekomendasi` double DEFAULT NULL,
  `unit_kerja_id` mediumint(3) NOT NULL,
  `nama_ppk` varchar(500) DEFAULT NULL,
  `nama_pj` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`rekomendasi_id`),
  KEY `fk_bpkp_kode_rekomen` (`kode_rekomendasi_id`),
  KEY `fk_bpkp_rekomen_kk` (`kertas_kerja_id`),
  CONSTRAINT `fk_bpkp_kode_rekomen` FOREIGN KEY (`kode_rekomendasi_id`) REFERENCES `tlhp_bpkp_kode_rekomendasi` (`kode_rekomendasi_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_bpkp_rekomen_kk` FOREIGN KEY (`kertas_kerja_id`) REFERENCES `tlhp_bpkp_kertas_kerja_temuan` (`kertas_kerja_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_rekomendasi`
--

LOCK TABLES `tlhp_bpkp_rekomendasi` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_rekomendasi` DISABLE KEYS */;
INSERT INTO `tlhp_bpkp_rekomendasi` VALUES (1,3,7,'123',1,123213,0,NULL,NULL),(2,3,7,'123',1,12312,0,NULL,NULL),(3,3,8,'sdfsdf',1,12313,0,NULL,NULL),(9,8,6,'uraian rek 1',1,22222,0,NULL,NULL),(15,13,6,'uraian rek 1',2,456,0,NULL,NULL),(16,13,6,'uraian rek 1',1,456,0,NULL,NULL),(17,13,7,'uraian rek 2',2,0,0,NULL,NULL),(18,14,12,'uraian rek 2-1',1,999,0,NULL,NULL),(19,14,8,'sdf',1,0,0,NULL,NULL),(20,14,9,'sdf',1,0,0,NULL,NULL),(21,14,8,'sdf',1,123,0,NULL,NULL),(22,14,9,'sdf',1,4545,0,NULL,NULL),(25,16,8,'uraian rek 1',2,123,0,NULL,NULL);
/*!40000 ALTER TABLE `tlhp_bpkp_rekomendasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_template_laporan`
--

DROP TABLE IF EXISTS `tlhp_bpkp_template_laporan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_template_laporan`
--

LOCK TABLES `tlhp_bpkp_template_laporan` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_template_laporan` DISABLE KEYS */;
INSERT INTO `tlhp_bpkp_template_laporan` VALUES (1,'sdfsdf','sdf','sdfsdf','0000-00-00','<p>ssdfsd</p>','<p>sdfsdf</p>',0,'2016-07-29 19:50:15','2016-07-29 19:50:15'),(2,'sdfghjghjghjgjghjghj','bcvbcvb','cvbcvb','2016-07-31','\r\ndfgfdg\r\n\r\n','\r\ndfgdfgdfgdfgdfgdfg\r\n\r\n',5,'2016-07-31 09:50:28','2016-07-31 09:50:28'),(3,'vbnvbn','vbnvbnvb','bnvbnvbnvbn','2016-08-02','<p>vbnvbnvbngfhfghgfh</p>','<p>bvnvbnvbngfhfghfgh</p>',0,'2016-08-01 18:45:01','2016-08-01 18:45:01'),(4,'judul laporan bpkp','Nomor  laporan bpkp','Nomor  laporan bpkp','2016-08-10','<p>sadfsfsdfsdfsdfsdfsdf</p>',NULL,5,'2016-08-10 07:14:29','2016-08-10 07:14:29'),(5,'judul laporan bpkp','Nomor  laporan bpkp','Nomor  laporan bpkp','2016-08-10','<p>sadfsfsdfsdfsdfsdfsdf</p>',NULL,5,'2016-08-10 07:23:08','2016-08-10 07:23:08');
/*!40000 ALTER TABLE `tlhp_bpkp_template_laporan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_template_laporan_media`
--

DROP TABLE IF EXISTS `tlhp_bpkp_template_laporan_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpkp_template_laporan_media` (
  `id_template_laporan_media` int(11) NOT NULL AUTO_INCREMENT,
  `template_laporan_id` int(11) DEFAULT NULL,
  `upload_template_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_template_laporan_media`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_template_laporan_media`
--

LOCK TABLES `tlhp_bpkp_template_laporan_media` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_template_laporan_media` DISABLE KEYS */;
INSERT INTO `tlhp_bpkp_template_laporan_media` VALUES (1,5,5);
/*!40000 ALTER TABLE `tlhp_bpkp_template_laporan_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_tim`
--

DROP TABLE IF EXISTS `tlhp_bpkp_tim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpkp_tim` (
  `tim_id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_tim` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`tim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_tim`
--

LOCK TABLES `tlhp_bpkp_tim` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_tim` DISABLE KEYS */;
INSERT INTO `tlhp_bpkp_tim` VALUES (1,'PEMBANTU PJ'),(2,'PENGENDALI MUTU'),(3,'PENGENDALI TEKNIS'),(4,'KETUA TIM'),(5,'ANGGOTA');
/*!40000 ALTER TABLE `tlhp_bpkp_tim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_tim_lhp`
--

DROP TABLE IF EXISTS `tlhp_bpkp_tim_lhp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_tim_lhp`
--

LOCK TABLES `tlhp_bpkp_tim_lhp` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_tim_lhp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_bpkp_tim_lhp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_tindak_lanjut`
--

DROP TABLE IF EXISTS `tlhp_bpkp_tindak_lanjut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpkp_tindak_lanjut` (
  `tindak_lanjut_id` int(10) NOT NULL AUTO_INCREMENT,
  `tindak_lanjut` varchar(500) DEFAULT NULL,
  `rekomendasi_id` int(11) NOT NULL,
  `nilai` double DEFAULT NULL,
  `tanggal_tl` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tindak_lanjut_id`),
  KEY `fk_bpkp_tl_kk_idx` (`rekomendasi_id`),
  KEY `fk_bpkp_tl_user` (`user_id`),
  CONSTRAINT `fk_bpkp_tl_rekomen` FOREIGN KEY (`rekomendasi_id`) REFERENCES `tlhp_bpkp_rekomendasi` (`rekomendasi_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_bpkp_tl_user` FOREIGN KEY (`user_id`) REFERENCES `tlhp_bpkp_user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_tindak_lanjut`
--

LOCK TABLES `tlhp_bpkp_tindak_lanjut` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_tindak_lanjut` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_bpkp_tindak_lanjut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_unit_kerja`
--

DROP TABLE IF EXISTS `tlhp_bpkp_unit_kerja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpkp_unit_kerja` (
  `unit_kerja_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `unit_kerja` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`unit_kerja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_unit_kerja`
--

LOCK TABLES `tlhp_bpkp_unit_kerja` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_unit_kerja` DISABLE KEYS */;
INSERT INTO `tlhp_bpkp_unit_kerja` VALUES (1,'DEPUTI I'),(2,'DEPUTI II'),(3,'DEPUTI III'),(4,'DEPUTI IV'),(5,'STAF AHLI'),(6,'INSPEKTORAT'),(7,'BIRO SDMU'),(8,'BIRO HUKIP'),(9,'BIRO MKOK'),(10,'KASN');
/*!40000 ALTER TABLE `tlhp_bpkp_unit_kerja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_upload_lhp`
--

DROP TABLE IF EXISTS `tlhp_bpkp_upload_lhp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_upload_lhp`
--

LOCK TABLES `tlhp_bpkp_upload_lhp` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_upload_lhp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_bpkp_upload_lhp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_upload_template_laporan`
--

DROP TABLE IF EXISTS `tlhp_bpkp_upload_template_laporan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpkp_upload_template_laporan` (
  `upload_template_id` int(10) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(500) DEFAULT NULL,
  `ext` varchar(500) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `url` varchar(2000) DEFAULT NULL,
  `path` varchar(2000) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`upload_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_upload_template_laporan`
--

LOCK TABLES `tlhp_bpkp_upload_template_laporan` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_upload_template_laporan` DISABLE KEYS */;
INSERT INTO `tlhp_bpkp_upload_template_laporan` VALUES (3,'kemenpanTOR (2).docx','application/wps-office.docx',NULL,NULL,18816,'http://e4.dev/assets/media/kemenpanTOR (2).docx','assets/media/kemenpanTOR (2).docx','2016-08-10 07:12:24','2016-08-10 07:12:24'),(4,'Pendukung Power Point(1).xlsx','application/wps-office.xlsx',NULL,NULL,72843,'http://e4.dev/assets/media/Pendukung Power Point(1).xlsx','assets/media/Pendukung Power Point(1).xlsx','2016-08-10 07:12:29','2016-08-10 07:12:29'),(5,'Rekapitulasi TL (LENGKAP).xlsx','application/wps-office.xlsx',NULL,NULL,136532,'http://e4.dev/assets/media/Rekapitulasi TL (LENGKAP).xlsx','assets/media/Rekapitulasi TL (LENGKAP).xlsx','2016-08-10 07:14:02','2016-08-10 07:14:02');
/*!40000 ALTER TABLE `tlhp_bpkp_upload_template_laporan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_upload_tl`
--

DROP TABLE IF EXISTS `tlhp_bpkp_upload_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_upload_tl`
--

LOCK TABLES `tlhp_bpkp_upload_tl` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_upload_tl` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_bpkp_upload_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_user`
--

DROP TABLE IF EXISTS `tlhp_bpkp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `activation_key` varchar(200) DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `fk_bpkp_user_level` (`user_level_id`),
  KEY `fk_bpkp_user_unit_kerja` (`unit_kerja_id`),
  CONSTRAINT `fk_bpkp_user_level` FOREIGN KEY (`user_level_id`) REFERENCES `tlhp_bpkp_user_level` (`user_level_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bpkp_user_unit_kerja` FOREIGN KEY (`unit_kerja_id`) REFERENCES `tlhp_bpkp_unit_kerja` (`unit_kerja_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_user`
--

LOCK TABLES `tlhp_bpkp_user` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_user` DISABLE KEYS */;
INSERT INTO `tlhp_bpkp_user` VALUES (4,'asdf','asdfsdf','sadf','sadf','asdf','1231231','12',2,10,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-24 12:40:42','2016-08-02 03:33:17'),(5,'admin','1acf7bbc7ac25ef584552fdb1314ebda','cvbcvb','sdf','haidarvm','324324','sdfsdfdsf',1,1,'',NULL,NULL,NULL,NULL,NULL,NULL,'343',NULL,1,NULL,NULL,NULL,'2016-07-24 12:41:06','2016-08-02 03:33:17'),(7,'agus','sadfdsf',NULL,NULL,'agus','asdf','sfd',3,1,'asdf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-27 03:21:39','2016-08-02 03:33:17'),(8,'dinijul',NULL,NULL,NULL,'dini juliani','2343','inspectorat',1,2,'dini',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-28 11:39:18','2016-08-02 03:33:17'),(10,'aldo','9d1ec50ba9ceb580b76d015dbd49c17e',NULL,NULL,'aldo siregar','23422','UI developer',3,3,'sdf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-28 14:05:39','2016-08-02 03:33:17'),(11,'rara','haitech',NULL,NULL,'rara','12312','3sdfsdf',3,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:17:24','2016-08-02 03:33:17'),(12,'vcbcvb','haidar',NULL,NULL,'vcbvcbcvb','cvbcvb','cvcvbcvb',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:07','2016-08-02 03:33:17'),(13,'yuiuyiuyi','haidar',NULL,NULL,'jkhjk','cvbcvb','cvcvbcvb',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:14','2016-08-02 03:33:17'),(14,'rt45','haidar',NULL,NULL,'jkhjkh,.,m.','cvbcvb','cvcvbcvb',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:20','2016-08-02 03:33:17'),(15,'rt45','haidar',NULL,NULL,'hjkjhkjhkh67','cvbcvb','cvcvbcvbgfhfgh',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:29','2016-08-02 03:33:17'),(16,'iniloh',NULL,NULL,NULL,'iniloh','cvbcvbgh','bbnm',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:36','2016-08-02 03:33:17'),(17,'siapasih',NULL,NULL,NULL,'siapa sih ?','cvbcvbgh','bbnm',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:55','2016-08-02 03:33:17'),(18,'haidartech','haidartech',NULL,NULL,'haidartech','haidartech','haidartech',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 17:19:53','2016-08-02 03:33:17'),(19,'haidartech','haidartech',NULL,NULL,'haidartech','haidartech','haidartech',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 17:19:53','2016-08-02 03:33:17'),(37,'cvbvcb','cvb',NULL,NULL,'cvbvcb','cvb','vcbcv',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:47:50','2016-08-02 03:33:17'),(38,'dendi','dendi',NULL,NULL,'dendi','dendi','dendi',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:48:12','2016-08-02 03:33:17'),(39,'ria','d42a9ad09e9778b177d409f5716ac621',NULL,NULL,'ria','ria','ria',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:50:12','2016-08-02 03:33:17'),(40,'dony','77ee6d05b23e742e2aca3fd602f4c599',NULL,NULL,'dony','dony','dony',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:54:28','2016-08-02 03:33:17'),(41,'dony','77ee6d05b23e742e2aca3fd602f4c599',NULL,NULL,'dony','dony','dony',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:54:52','2016-08-02 03:33:17'),(42,'dony','77ee6d05b23e742e2aca3fd602f4c599',NULL,NULL,'dony','dony','dony',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:55:27','2016-08-02 03:33:17'),(43,'ruly','ee7ec63dd0e87cf4e43b288b306ca206',NULL,NULL,'ruly','ruly','ruly',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:55:44','2016-08-02 03:33:17'),(44,'helmi','cf3750951241a8cf90e2a0fb0af63fe2',NULL,NULL,'helmi','helmi','helmi',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:57:28','2016-08-02 03:33:17'),(45,'sdfsdf','d58e3582afa99040e27b92b13c8f2280',NULL,NULL,'sdfsdf','sdfsdf','sdfsdf',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:58:55','2016-08-02 03:33:17'),(46,'sdfsdf','d58e3582afa99040e27b92b13c8f2280',NULL,NULL,'sdfsdf','sdfsdf','sdfsdf',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:59:01','2016-08-02 03:33:17'),(47,'sdfsdf','d58e3582afa99040e27b92b13c8f2280',NULL,NULL,'sdfsdf','sdfsdf','sdfsdf',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:59:03','2016-08-02 03:33:17'),(48,'sadf','c7d48bbf2b960adc10b0aba11bf336a5',NULL,NULL,'fsafsad','sdfas','fas',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:59:47','2016-08-02 03:33:17');
/*!40000 ALTER TABLE `tlhp_bpkp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_user_history`
--

DROP TABLE IF EXISTS `tlhp_bpkp_user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpkp_user_history` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `login` datetime NOT NULL,
  `logout` datetime DEFAULT NULL,
  `total_use` time DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `fk_bpkp_user_history` (`user_id`),
  CONSTRAINT `fk_bpkp_user_history` FOREIGN KEY (`user_id`) REFERENCES `tlhp_bpkp_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_user_history`
--

LOCK TABLES `tlhp_bpkp_user_history` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_user_history` DISABLE KEYS */;
INSERT INTO `tlhp_bpkp_user_history` VALUES (1,5,'2016-07-28 15:38:08',NULL,NULL),(2,5,'2016-07-28 15:38:38','2016-07-28 15:39:03',NULL),(3,5,'2016-07-28 15:41:37','2016-07-28 15:43:23',NULL),(4,5,'2016-07-28 15:47:44','2016-07-28 15:59:15',NULL),(5,5,'2016-07-28 16:03:44','2016-07-28 16:03:49',NULL),(6,5,'2016-07-28 16:03:56','2016-07-28 16:17:10',NULL),(7,8,'2016-07-28 16:17:24','2016-07-28 16:18:10',NULL),(8,5,'2016-07-28 16:18:55','2016-07-28 16:21:13',NULL),(9,8,'2016-07-28 16:21:19','2016-07-28 16:22:26',NULL),(10,5,'2016-07-28 16:22:36','2016-07-28 16:22:42',NULL),(11,5,'2016-07-28 16:22:48','2016-07-28 17:18:50',NULL),(12,10,'2016-07-28 17:19:01','2016-07-28 17:19:53',NULL),(13,5,'2016-07-28 17:28:11','2016-07-28 17:28:46',NULL),(14,5,'2016-07-28 17:29:40','2016-07-28 18:07:22',NULL),(15,5,'2016-07-28 18:37:08',NULL,NULL),(16,5,'2016-07-29 00:50:27','2016-07-29 00:51:51',NULL),(17,11,'2016-07-29 01:15:53','2016-07-29 03:04:32',NULL),(18,5,'2016-07-29 03:04:37','2016-07-29 13:07:12',NULL),(19,5,'2016-07-29 13:07:31','2016-07-29 13:24:12',NULL),(20,5,'2016-07-29 13:37:24',NULL,NULL),(21,41,'2016-07-30 02:35:23',NULL,NULL),(22,5,'2016-07-31 17:02:22','2016-07-31 18:03:19',NULL),(23,5,'2016-07-31 20:46:44',NULL,NULL),(24,5,'2016-08-01 07:00:59',NULL,NULL),(25,5,'2016-08-01 10:14:17','2016-08-01 10:26:54',NULL),(26,5,'2016-08-01 10:26:59','2016-08-01 10:39:57',NULL),(27,5,'2016-08-01 10:40:02','2016-08-01 10:45:13',NULL),(28,14,'2016-08-01 11:48:30','2016-08-01 11:50:54',NULL),(29,5,'2016-08-01 11:51:49','2016-08-01 11:54:22',NULL),(30,5,'2016-08-01 11:54:30','2016-08-01 12:00:51',NULL),(31,48,'2016-08-01 12:02:20','2016-08-01 12:07:27',NULL),(32,5,'2016-08-01 12:08:25','2016-08-01 12:08:55',NULL),(33,5,'2016-08-01 12:09:02','2016-08-01 12:09:15',NULL),(34,11,'2016-08-01 12:11:08','2016-08-01 17:07:08',NULL),(35,5,'2016-08-01 12:11:31','2016-08-01 14:24:35',NULL),(36,5,'2016-08-01 12:12:30','2016-08-01 12:12:49',NULL),(37,5,'2016-08-01 12:12:57','2016-08-01 12:26:45',NULL),(38,10,'2016-08-01 17:07:52','2016-08-01 19:07:15',NULL),(39,10,'2016-08-01 19:07:25','2016-08-01 19:12:57',NULL),(40,5,'2016-08-01 23:10:37','2016-08-01 23:38:00',NULL),(41,5,'2016-08-02 00:17:12','2016-08-02 01:29:11',NULL),(42,5,'2016-08-02 01:29:19','2016-08-02 02:27:49',NULL),(43,5,'2016-08-02 02:28:02','2016-08-02 03:30:52',NULL),(44,5,'2016-08-02 03:30:58',NULL,NULL),(45,5,'2016-08-02 06:24:58','2016-08-02 07:52:50',NULL),(46,5,'2016-08-02 07:56:02','2016-08-02 08:20:54',NULL),(47,5,'2016-08-02 08:25:04','2016-08-02 12:07:23',NULL),(48,5,'2016-08-02 12:09:29',NULL,NULL);
/*!40000 ALTER TABLE `tlhp_bpkp_user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_bpkp_user_level`
--

DROP TABLE IF EXISTS `tlhp_bpkp_user_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_bpkp_user_level` (
  `user_level_id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `user_level` varchar(200) NOT NULL,
  PRIMARY KEY (`user_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_user_level`
--

LOCK TABLES `tlhp_bpkp_user_level` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_user_level` DISABLE KEYS */;
INSERT INTO `tlhp_bpkp_user_level` VALUES (1,'super admin'),(2,'admin'),(3,'user');
/*!40000 ALTER TABLE `tlhp_bpkp_user_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_jenis_pengawasan`
--

DROP TABLE IF EXISTS `tlhp_ikp_jenis_pengawasan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_jenis_pengawasan` (
  `jenis_pengawasan_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `jenis_pengawasan` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`jenis_pengawasan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_jenis_pengawasan`
--

LOCK TABLES `tlhp_ikp_jenis_pengawasan` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_jenis_pengawasan` DISABLE KEYS */;
INSERT INTO `tlhp_ikp_jenis_pengawasan` VALUES (1,'AUDIT'),(2,'REVIU'),(3,'EVALUASI'),(4,'PEMANTAUAN'),(5,'TINDAK LANJUT PENGADUAN'),(6,'PENGAWASAN LAIN');
/*!40000 ALTER TABLE `tlhp_ikp_jenis_pengawasan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_kertas_kerja_temuan`
--

DROP TABLE IF EXISTS `tlhp_ikp_kertas_kerja_temuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_kertas_kerja_temuan` (
  `kertas_kerja_id` int(10) NOT NULL AUTO_INCREMENT,
  `lhp_id` int(11) NOT NULL,
  `jenis_temuan` enum('a','b','c') NOT NULL,
  `no_temuan` varchar(500) DEFAULT NULL,
  `kode_temuan_id` int(10) DEFAULT NULL,
  `uraian_temuan` varchar(500) DEFAULT NULL,
  `kode_sebab_id` int(4) DEFAULT NULL,
  `uraian_sebab` varchar(500) DEFAULT NULL,
  `nilai_temuan` varchar(500) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kertas_kerja_id`),
  KEY `fk_ikp_kk_user` (`user_id`),
  KEY `fk_ikp_kk_lhp` (`lhp_id`),
  KEY `fk_ikp_kk_kode_temuan` (`kode_temuan_id`),
  KEY `fk_ikp_kk_kode_sebab_idx` (`kode_sebab_id`),
  CONSTRAINT `fk_ikp_kk_kode_sebab` FOREIGN KEY (`kode_sebab_id`) REFERENCES `tlhp_ikp_kode_sebab` (`kode_sebab_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ikp_kk_kode_temuan` FOREIGN KEY (`kode_temuan_id`) REFERENCES `tlhp_ikp_kode_temuan` (`kode_temuan_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_ikp_kk_lhp` FOREIGN KEY (`lhp_id`) REFERENCES `tlhp_ikp_lhp` (`lhp_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_ikp_kk_user` FOREIGN KEY (`user_id`) REFERENCES `tlhp_ikp_user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_kertas_kerja_temuan`
--

LOCK TABLES `tlhp_ikp_kertas_kerja_temuan` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_kertas_kerja_temuan` DISABLE KEYS */;
INSERT INTO `tlhp_ikp_kertas_kerja_temuan` VALUES (2,19,'',NULL,NULL,'sdf',4,'sdf','123',5,'2016-07-29 17:39:10','2016-08-01 19:45:33'),(3,19,'',NULL,NULL,'sdf',4,'sdf','123',5,'2016-07-29 17:42:11','2016-08-01 19:45:34'),(8,20,'a',NULL,NULL,'ssf',4,'ssfdsfdsf','12313',5,'2016-07-29 19:08:22','2016-08-01 19:45:35'),(9,20,'a',NULL,NULL,'ssf',4,'ssfdsfdsf','12313',5,'2016-07-29 19:08:22','2016-08-01 19:45:35'),(13,21,'a',NULL,NULL,'uraian temuan 1',5,'uraian sebab 1','123',5,'2016-07-29 19:14:41','2016-08-01 19:45:36'),(14,22,'b',NULL,NULL,'uraian temuan 1',17,'uraian sebab 2','789',5,'2016-07-29 19:19:27','2016-08-01 19:45:36'),(16,25,'a',NULL,NULL,'sdf',5,'sfd','123',5,'2016-07-29 19:30:44','2016-08-01 19:45:38'),(17,35,'a',NULL,1,'URAIAN TEMUAN	1',2,'URAIAN SEBAB	1','-1',5,'2016-08-06 22:57:42','2016-08-06 22:57:42'),(18,36,'a',NULL,2,'URAIAN TEMUAN	 1',3,'URAIAN SEBAB	1','10001',5,'2016-08-06 23:22:54','2016-08-06 23:22:54'),(19,36,'b',NULL,10,'URAIAN TEMUAN	 2',13,'URAIAN SEBAB	2','5005',5,'2016-08-06 23:22:54','2016-08-06 23:22:54'),(20,36,'b',NULL,12,'URAIAN TEMUAN	 4',15,'URAIAN SEBAB	3','5006',5,'2016-08-06 23:22:54','2016-08-06 23:22:54'),(21,37,'a',NULL,2,'URAIAN TEMUAN	1',6,'URAIAN SEBAB	1','10000',5,'2016-08-06 23:47:44','2016-08-06 23:47:44'),(22,37,'a',NULL,2,'URAIAN TEMUAN	2',6,'URAIAN SEBAB	2','60600',5,'2016-08-06 23:47:44','2016-08-06 23:47:44'),(23,37,'b',NULL,6,'URAIAN TEMUAN	3',5,'URAIAN SEBAB	2','20000',5,'2016-08-06 23:47:44','2016-08-06 23:47:44'),(24,37,'b',NULL,7,'URAIAN TEMUAN	4',4,'URAIAN SEBAB	3','30000',5,'2016-08-06 23:47:44','2016-08-06 23:47:44'),(25,37,'a',NULL,2,'URAIAN TEMUAN	1',6,'URAIAN SEBAB	1','10000',5,'2016-08-06 23:47:59','2016-08-06 23:47:59'),(26,37,'a',NULL,2,'URAIAN TEMUAN	2',6,'URAIAN SEBAB	2','60600',5,'2016-08-06 23:47:59','2016-08-06 23:47:59'),(27,37,'b',NULL,6,'URAIAN TEMUAN	3',5,'URAIAN SEBAB	2','20000',5,'2016-08-06 23:47:59','2016-08-06 23:47:59'),(28,37,'b',NULL,7,'URAIAN TEMUAN	4',4,'URAIAN SEBAB	3','30000',5,'2016-08-06 23:47:59','2016-08-06 23:47:59'),(29,38,'a',NULL,1,'uraian reko lin 1',3,'urai\\an sebab li 1','39000',5,'2016-08-07 00:19:52','2016-08-07 00:19:52'),(30,39,'a',NULL,4,'URAIAN TEMUAN	1',3,'URAIAN SEBAB	1','2000',5,'2016-08-07 02:54:49','2016-08-07 02:54:49'),(31,39,'b',NULL,1,'sfsdfsd ',5,'URAIAN SEBAB	2','3000',5,'2016-08-07 02:54:49','2016-08-07 02:54:49'),(32,39,'a',NULL,4,'URAIAN TEMUAN	1',3,'URAIAN SEBAB	1','2000',5,'2016-08-07 02:56:49','2016-08-07 02:56:49'),(33,39,'b',NULL,1,'sfsdfsd ',5,'URAIAN SEBAB	2','3000',5,'2016-08-07 02:56:49','2016-08-07 02:56:49'),(34,39,'a',NULL,4,'URAIAN TEMUAN	1',3,'URAIAN SEBAB	1','2000',5,'2016-08-07 02:57:36','2016-08-07 02:57:36'),(35,39,'b',NULL,1,'sfsdfsd ',5,'URAIAN SEBAB	2','3000',5,'2016-08-07 02:57:36','2016-08-07 02:57:36'),(36,41,'a',NULL,8,'URAIAN TEMUAN	1 edit',5,'Pembagian wewenang dalam organisasi belum cukup jelas sehingga ada kegiatan atau kejadian dalam organisasi yang tidak jelas penanggungjawabnya','1000',5,'2016-08-07 03:07:53','2016-08-07 03:27:11'),(37,41,'b',NULL,1,'URAIAN TEMUAN	2 edit',4,'Pembagian wewenang dalam organisasi belum cukup jauh sehingga masih terdapat transaksi atau kegiatan organisasi yang seluruh tahapnya dikuasai oleh satu orang','20003',5,'2016-08-07 03:07:53','2016-08-07 03:27:11'),(38,42,'a',NULL,2,'sdfsdfsd',3,'KELEMAHAN PENGAWASAN MELEKAT','12231123',5,'2016-08-07 05:51:09','2016-08-07 05:51:47'),(39,43,'a',NULL,4,'URAIAN TEMUAN	1',2,'Penyebab lain yang belum didefinisikan (nihil)','4',5,'2016-08-07 05:53:15','2016-08-07 05:53:38'),(40,45,'a',NULL,3,'sdfsd',14,'Kelemahan lain kebijakan','6999',5,'2016-08-07 08:53:45','2016-08-07 20:09:09'),(41,45,'b',NULL,8,'URAIAN TEMUAN	2',13,'Tidak ada kebijakan yang digariskan','7000',5,'2016-08-07 19:35:48','2016-08-07 20:09:09'),(42,45,'b',NULL,4,'URAIAN TEMUAN	3',12,'Kebijaksanaan yang berlaku tidak dikomunikasikan secara lisan maupun tertulis','8000',5,'2016-08-08 19:02:44','2016-08-08 19:02:44'),(43,45,'b',NULL,13,'URAIAN TEMUAN	4',24,'Anggaran tidak cukup realistis','9000',5,'2016-08-08 19:10:00','2016-08-08 19:10:00'),(44,45,'b',NULL,8,'urian temuan 5',23,'Rencana kegiatan tidak cukup realistis','10000',5,'2016-08-10 05:14:04','2016-08-10 05:14:04');
/*!40000 ALTER TABLE `tlhp_ikp_kertas_kerja_temuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_kode_rekomendasi`
--

DROP TABLE IF EXISTS `tlhp_ikp_kode_rekomendasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_kode_rekomendasi` (
  `kode_rekomendasi_id` int(10) NOT NULL AUTO_INCREMENT,
  `kode_rekomendasi` varchar(10) DEFAULT NULL,
  `uraian_rekomendasi` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`kode_rekomendasi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_kode_rekomendasi`
--

LOCK TABLES `tlhp_ikp_kode_rekomendasi` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_kode_rekomendasi` DISABLE KEYS */;
INSERT INTO `tlhp_ikp_kode_rekomendasi` VALUES (6,'00','KODE REKOMENDASI'),(7,'01','Penyetoran ke kas negara/daerah, kas BUMN/D, dan masyararakat'),(8,'02','Pengembalian barang kepada negara, daerah, BUMN/D, dan masyarakat'),(9,'03','Perbaikan fisik barang/jasa dalam proses pembangunan atau penggantian barang/jasa oleh rekanan'),(10,'04','Penghapusan barang milik negara/daerah'),(11,'05','Pelaksanaan sanksi administrasi kepegawaian'),(12,'06','Perbaikan laporan dan penertiban administrasi/kelengkapan administrasi'),(13,'07','Perbaikan sistem dan prosedur akuntansi dan pelaporan'),(14,'08','Peningkatan kualitas dan kuantitas sumber daya manusia pendukung sistem pengendalian'),(15,'09','Perubahan atau perbaikan prosedur, peraturan dan kebijakan'),(16,'10','Perubahan atau perbaikan struktur organisasi'),(17,'11','Koordinasi antar instansi termasuk juga penyerahan penanganan kasus kepada instansi yang berwenang'),(18,'12','Pelaksanaan penelitian oleh tim khusus atau audit lanjutan oleh unit pengawas intern'),(19,'13','Pelaksanaan sosialisasi'),(20,'14','Lain-lain');
/*!40000 ALTER TABLE `tlhp_ikp_kode_rekomendasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_kode_sebab`
--

DROP TABLE IF EXISTS `tlhp_ikp_kode_sebab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_kode_sebab` (
  `kode_sebab_id` int(10) NOT NULL AUTO_INCREMENT,
  `kode_sebab_group` tinyint(3) DEFAULT NULL,
  `kode_sebab` varchar(10) DEFAULT NULL,
  `uraian_sebab` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`kode_sebab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_kode_sebab`
--

LOCK TABLES `tlhp_ikp_kode_sebab` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_kode_sebab` DISABLE KEYS */;
INSERT INTO `tlhp_ikp_kode_sebab` VALUES (2,0,'0','Penyebab lain yang belum didefinisikan (nihil)'),(3,1,'100','KELEMAHAN PENGAWASAN MELEKAT'),(4,1,'101','Pembagian wewenang dalam organisasi belum cukup jauh sehingga masih terdapat transaksi atau kegiatan organisasi yang seluruh tahapnya dikuasai oleh satu orang'),(5,1,'102','Pembagian wewenang dalam organisasi belum cukup jelas sehingga ada kegiatan atau kejadian dalam organisasi yang tidak jelas penanggungjawabnya'),(6,1,'103','Dalam organisasi tidak ada pembagian wewenang dan tugas'),(7,1,'104','Kelalaian pejabat yang berwenang'),(8,1,'105','Kelemahan lain organisasi'),(9,2,'200','KELEMAHAN DALAM KEBIJAKAN/ KEBIJAKSANAAN'),(10,2,'201','Kebijakan yang berlaku tidak jelas bagi para bawahan'),(11,2,'202','Kebijakan yang berlaku tidak dapat menjadi pedoman yang pasti bagi para bawahan'),(12,2,'203','Kebijaksanaan yang berlaku tidak dikomunikasikan secara lisan maupun tertulis'),(13,2,'204','Tidak ada kebijakan yang digariskan'),(14,2,'205','Kelemahan lain kebijakan'),(15,2,'206','Kebijakan tidak sejalan/bertentangan dengan ketentuan yang lebih tinggi'),(16,3,'300','KELEMAHAN DALAM RENCANA'),(17,3,'301','Rencana kerja yang disusun tidak cukup luas sehingga belum mencakup seluruh kegiatan yang perlu dilaksanakan'),(18,3,'302','Hubungan kerja di antara kegiatan-kegiatan yang direncanakan tidak jelas dirumuskan sehingga tidak ada koordinasi di antara kegiatan-kegiatan itu'),(19,3,'303','Sasaran yang akan dicapai tidak cukup jelas dirumuskan'),(20,3,'304','Sasaran yang akan dicapai tidak cukup dikuantifikasikan'),(21,3,'305','Tidak dibuat anggaran yang merupakan kuantifikasi moneter rencana kegiatan dan sasaran yang akan dicapai'),(22,3,'306','Tidak ada rencana kegiatan'),(23,3,'307','Rencana kegiatan tidak cukup realistis'),(24,3,'308','Anggaran tidak cukup realistis'),(25,3,'309','Kelemahan lain perencanaan'),(26,3,'310','Perencanaan tidak matang'),(27,4,'400','KELEMAHAN DALAM PROSEDUR'),(28,4,'401','Prosedur yang ada tidak konsisten dengan kebijaksanaan yang perlu dilaksanakan'),(29,4,'402','Prosedur yang berlaku disalahtafsirkan oleh pegawai sehingga menyimpang dari tujuannya'),(30,4,'403','Prosedur yang berlaku tidak dimengerti sehingga tidak dilaksanakan'),(31,4,'404','Prosedur yang berlaku terlalu mahal dibandingkan dengan sesuatu yang harus dijaga sehingga tidak dilaksanakan'),(32,4,'405','Prosedur yang berlaku kurang terinci'),(33,4,'406','Prosedur yang berlaku tidak dapat menjadi pegangan bawahan karena tidak tertulis'),(34,4,'407','Prosedur yang berlaku tidak dikomunikasikan secara tertulis maupun lisan'),(35,4,'408','Tidak terdapat prosedur yang diperlukan'),(36,4,'409','Kelemahan lain prosedur'),(37,5,'500','KELEMAHAN DALAM PENCATATAN DAN PELAPORAN'),(38,5,'501','Pencatatan tidak diselenggarakan secara cermat sehingga kehilangan keadaannya'),(39,5,'502','Pencatatan tidak dimutakhirkan sehingga kehilangan peranannya sebagai alat pengawasan/pengendalian'),(40,5,'503','Pencatatan tidak memenuhi kebutuhan informasi untuk pengambilan keputusan sehari-hari'),(41,5,'504','Tidak diselenggarakan pencatatan yang perlu'),(42,5,'505','Pelaporan tidak tepat waktu'),(43,5,'506','Pelaporan tidak disusun dengan cermat'),(44,5,'507','Pelaporan tidak disusun memenuhi kebutuhan pimpinan'),(45,5,'508','Pelaporan disusun dengan biaya mahal'),(46,5,'509','Pelaporan yang diperlukan tidak ada'),(47,5,'510','Kelemahan lain pencatatan atau pelaporan'),(48,6,'600','KELEMAHAN DALAM PEMBINAAN PERSONIL'),(49,6,'601','Pegawai kurang mendapatkan supervisi (pengawasan) yang diperlukan (termasuk tidak dilakukan pemeriksaan kas bendaharawan oleh atasan langsung dan pemeriksaan fisik atas inventaris atau pers'),(50,6,'602','Supervisor tidak menyadari siapa yang harus diawasi dan apa yang harus diawasi'),(51,6,'603','Penugasan/penempatan pegawai tidak tepat/sesuai dengan latar belakang pendidikan '),(52,6,'604','Kelemahan lain pembinaan personil'),(53,7,'700','KELEMAHAN DALAM PENGAWASAN INTERN (INTERNAL REVIEW)'),(54,7,'701','Tidak ada satuan kerja atau pejabat yang diberi tanggung jawab untuk mengecek jalannya sistem dan prosedur yang telah ditetapkan'),(55,7,'702','Satuan kerja atau pejabat yang diberi tanggung jawab menguji jalannya sistem dan prosedur tidak berfungsi dengan baik'),(56,7,'703','Kelemahan lain pengkajian intern'),(57,8,'800','KELEMAHAN PENGAWASAN TERHADAP REKANAN'),(58,8,'801','Kelemahan Pengawasan Pemimpin Proyek'),(59,8,'802','Kelemahan Pengawasan Pimpinan Satker'),(60,9,'900','PENYEBAB EKSTERN HAMBATAN KELANCARAN PROYEK'),(61,9,'901','Pekerjaan persiapan proyek dan perumusan proyek kurang mantap (survei dan disain tidak mantap)'),(62,9,'902','DIP terlambat diterima proyek'),(63,9,'903','Revisi DIP yang diajukan pemimpin proyek penyelesaiannya menjadi berlarut-larut'),(64,9,'904','Tanah yang diperlukan proyek penyelesaiannya menjadi berlarut-larut'),(65,9,'905','Tidak dapat diperoleh tanah yang diperlukan proyek karena dana tidak mencukupi atau tidak tersedia'),(66,9,'906','Penetapan rekanan menjadi berlarut-larut'),(67,9,'907','Perijinan atau persetujuan untuk memulai suatu kegiatan proyek menjadi berlarut-larut'),(68,9,'908','Sarana komunikasi dan atau telekomunikasi tidak mendukung kelancaran proyek'),(69,9,'909','Rekanan yang ditetapkan tidak mampu menyelesaikan tanggungjawabnya'),(70,9,'910','Penyebab ekstern hambatan kelancaran proyek lainnya'),(71,9,'911','Rekanan mempunyai itikad yang kurang baik'),(72,10,'1000','PENYEBAB EKSTERN HAMBATAN KELANCARAN TUGAS POKOK INSTANSI'),(73,10,'1001','Instansi lain yang terkait kurang responsif'),(74,10,'1002','Sarana komunikasi dan atau telekomunikasi tidak mendukung kelancaran tugas instansi'),(75,10,'1003','Revisi DIK yang diajukan pimpinan instansi penyelesaiannya berlarut-larut'),(76,10,'1004','Rekanan yang telah ditetapkan tidak mampu menyelesaikan tanggungjawabnya'),(77,10,'1005','Perijinan atau persetujuan untuk memulai suatu kegiatan instansi menjadi berlarut-larut'),(78,10,'1006','Penyebab ekstern hambatan kelancaran tupoksi lainnya'),(79,10,'1007','Pencairan dana pinjaman tidak tepat waktu atau tidak sesuai jadwal kebutuhan'),(80,11,'1100','PENYEBAB KETIDAKLANCARAN PELAYANAN APARATUR PEMERINTAHAN/  BUMN/BUMD KEPADA MASYARAKAT'),(81,11,'1101','Prosedur yang ditetapkan belum sederhana'),(82,11,'1102','Masyarakat buta terhadap persyaratan yang perlu dipenuhi dan prosedur yang harus ditempuh'),(83,11,'1103','Tidak ada batas waktu maksimum penyelesaian pelayanan'),(84,11,'1104','Prosedur yang ditetapkan cukup banyak titik pertemuan pegawai dengan masyarakat sehingga membuka peluang pungutan liar'),(85,11,'1105','Persyaratan yang ditetapkan berlebihan sehingga menyulitkan pemohonan pelayanan'),(86,11,'1106','Tidak ada koordinasi antar instansi sehingga jelas siapa yang berwenang mengambil keputusan'),(87,11,'1107','Penyebab lain ketidaklancaran pelayanan');
/*!40000 ALTER TABLE `tlhp_ikp_kode_sebab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_kode_temuan`
--

DROP TABLE IF EXISTS `tlhp_ikp_kode_temuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_kode_temuan` (
  `kode_temuan_id` int(10) NOT NULL AUTO_INCREMENT,
  `kelompok` smallint(3) DEFAULT NULL,
  `sub_kelompok` smallint(3) DEFAULT NULL,
  `jenis` smallint(3) DEFAULT NULL,
  `kode_temuan` varchar(1000) DEFAULT NULL,
  `alt_rekom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kode_temuan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_kode_temuan`
--

LOCK TABLES `tlhp_ikp_kode_temuan` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_kode_temuan` DISABLE KEYS */;
INSERT INTO `tlhp_ikp_kode_temuan` VALUES (1,1,1,1,'Temuan Ketidakpatuhan Terhadap Peraturan',NULL),(2,1,1,NULL,'Kerugian negara/daerah atau kerugian negara/daerah\r\nyang terjadi pada perusahaan milik negara/daerah',NULL),(3,1,1,1,'Belanja dan/atau pengadaan barang/jasa fiktif',NULL),(4,1,1,2,'Rekanan pengadaan barang/jasa tidak menyelesaikan\r\npekerjaan',NULL),(5,1,1,3,'Kekurangan volume pekerjaan dan/atau barang',NULL),(6,1,1,4,'Kelebihan pembayaran selain kekurangan volume pekerjaan\r\ndan/atau barang',NULL),(7,1,1,5,'Pemahalan harga (Mark up)',NULL),(8,1,1,6,'Penggunaan uang/barang untuk kepentingan pribadi',NULL),(9,1,1,7,'Pembayaran honorarium dan/atau biaya perjalanan dinas\r\nganda dan/atau melebihi standar yang ditetapkan',NULL),(10,1,1,8,'Spesifikasi barang/jasa yang diterima tidak sesuai dengan\r\nkontrak',NULL),(11,1,1,9,'Belanja tidak sesuai atau melebihi ketentuan',NULL),(12,1,1,10,'Pengembalian pinjaman/piutang atau dana bergulir macet',NULL),(13,1,1,11,'Kelebihan penetapan dan pembayaran restitusi pajak atau\r\npenetapan kompensasi kerugian',NULL),(14,1,1,12,'Penjualan/pertukaran/penghapusan aset negara/daerah tidak\r\nsesuai ketentuan dan merugikan negara/daerah',NULL),(15,1,1,13,'Pengenaan ganti kerugian negara belum/tidak dilaksanakan\r\nsesuai ketentuan',NULL),(16,1,1,14,'Entitas belum/tidak melaksanakan tuntutan perbendaharaan\r\n(TP) sesuai ketentuan',NULL),(17,1,1,15,'Penghapusan hak tagih tidak sesuai ketentuan',NULL),(18,1,1,16,'Pelanggaran ketentuan pemberian diskon penjualan',NULL),(19,1,1,17,'Penentuan HPP (harga pokok pembelian) terlalu rendah\r\nsehingga penentuan harga jual lebih rendah dari yang\r\nseharusnya',NULL),(20,1,1,18,'Jaminan pelaksanaan dalam pelaksanaan pekerjaan,\r\npemanfaatan barang dan pemberian fasilitas tidak dapat\r\ndicairkan',NULL),(21,1,1,19,'Penyetoran penerimaan negara/daerah dengan bukti fiktif',NULL),(22,1,2,NULL,'Potensi kerugian negara/daerah atau kerugian\r\nnegara/daerah yang terjadi pada perusahaan milik\r\nnegara/daerah',NULL),(23,1,2,1,'Kelebihan pembayaran dalam pengadaan barang/jasa tetapi\r\npembayaran pekerjaan belum dilakukan sebagian atau\r\nseluruhnya',NULL),(24,1,2,2,'Rekanan belum melaksanakan kewajiban pemeliharaan\r\nbarang hasil pengadaan yang telah rusak selama masa\r\npemeliharaan',NULL),(25,1,2,3,'Aset dikuasai pihak lain',NULL),(26,1,2,4,'Pembelian aset yang berstatus sengketa',NULL),(27,1,2,5,'Aset tidak diketahui keberadaannya',NULL),(28,1,2,6,'Pemberian jaminan pelaksanaan dalam pelaksanaan\r\npekerjaan, pemanfaatan barang dan pemberian fasilitas tidak\r\nsesuai ketentuan',NULL),(29,1,2,7,'Pihak ketiga belum melaksanakan kewajiban untuk\r\nmenyerahkan aset kepada negara/daerah',NULL),(30,1,2,8,'Piutang/pinjaman atau dana bergulir yang berpotensi tidak\r\ntertagih',NULL),(31,1,2,9,'Penghapusan piutang tidak sesuai ketentuan',NULL),(32,1,2,10,'Pencairan anggaran pada akhir tahun anggaran untuk\r\npekerjaan yang belum selesai',NULL),(33,1,3,NULL,'Kekurangan penerimaan negara/daerah atau perusahaan\r\nmilik negara/daerah',NULL),(34,1,3,1,'Penerimaan negara/daerah atau denda keterlambatan\r\npekerjaan belum/tidak ditetapkan dipungut/diterima/disetor ke\r\nkas negara/daerah atau perusahaan milik negara/daerah',NULL),(35,1,3,2,'Penggunaan langsung penerimaan negara/daerah',NULL),(36,1,3,3,'Dana Perimbangan yang telah ditetapkan belum masuk ke\r\nkas daerah',NULL),(37,1,3,4,'Penerimaan negara/daerah diterima atau digunakan oleh\r\ninstansi yang tidak berhak',NULL),(38,1,3,5,'Pengenaan tarif pajak/PNBP lebih rendah dari ketentuan',NULL),(39,1,3,6,'Koreksi perhitungan bagi hasil dengan KKKS',NULL),(40,1,3,7,'Kelebihan pembayaran subsidi oleh pemerintah',NULL),(41,1,4,NULL,'Administrasi',NULL),(42,1,4,1,'Pertanggungjawaban tidak akuntabel (bukti tidak\r\nlengkap/tidak valid)',NULL),(43,1,4,2,'Pekerjaan dilaksanakan mendahului kontrak atau penetapan\r\nanggaran',NULL),(44,1,4,3,'Proses pengadaan barang/jasa tidak sesuai ketentuan (tidak\r\nmenimbulkan kerugian negara)',NULL),(45,1,4,4,'Pemecahan kontrak untuk menghindari pelelangan',NULL),(46,1,4,5,'Pelaksanaan lelang secara performa',NULL),(47,1,4,6,'Penyimpangan terhadap peraturan perundang-undangan\r\nbidang pengelolaan perlengkapan atau barang milik',NULL),(48,1,4,7,'Penyimpangan terhadap peraturan perundang-undangan\r\nbidang tertentu lainnya seperti kehutanan, pertambangan,\r\nperpajakan, dll',NULL),(49,1,4,8,'Koreksi perhitungan subsidi/kewajiban pelayanan umum',NULL),(50,1,4,9,'Pembentukan cadangan piutang, perhitungan penyusutan\r\natau amortisasi tidak sesuai ketentuan',NULL),(51,1,4,10,'Penyetoran penerimaan negara/daerah atau kas di\r\nbendaharawan ke kas negara/daerah melebihi batas waktu\r\nyang ditentukan',NULL),(52,1,4,11,'Pertanggungjawaban/penyetoran uang persediaan melebihi\r\nbatas waktu yang ditentukan',NULL),(53,1,4,12,'Sisa kas di bendahara pengeluaran akhir tahun anggaran\r\nbelum/tidak disetor ke kas negara/daerah',NULL),(54,1,4,13,'Pengeluaran investasi pemerintah tidak didukung bukti yang\r\nsah',NULL),(55,1,4,14,'Kepemilikan aset tidak/belum didukung bukti yang sah',NULL),(56,1,4,15,'Pengalihan anggaran antar MAK tidak sah',NULL),(57,1,4,16,'Pelampauan pagu anggaran',NULL),(58,1,5,NULL,'Indikasi tindak pidana',NULL),(59,1,5,1,'Indikasi tindak pidana korupsi',NULL),(60,1,5,2,'Indikasi tindak pidana perbankan',NULL),(61,1,5,3,'Indikasi tindak pidana perpajakan',NULL),(62,1,5,4,'Indikasi tindak pidana kepabeanan',NULL),(63,1,5,5,'Indikasi tindak pidana kehutanan',NULL),(64,1,5,6,'Indikasi tindak pidana pasar modal',NULL),(65,1,5,7,'Indikasi tindak pidana khusus lainnya',NULL),(66,2,NULL,NULL,'Temuan kelemahan sistem pengendalian intern',NULL),(67,2,1,NULL,'Kelemahan sistem pengendalian akuntansi dan\r\npelaporan',NULL),(68,2,1,1,'Pencatatan tidak/belum dilakukan atau tidak akurat',NULL),(69,2,1,2,'Proses penyusunan laporan tidak sesuai ketentuan',NULL),(70,2,1,3,'Entitas terlambat menyampaikan laporan',NULL),(71,2,1,4,'Sistem informasi akuntansi dan pelaporan tidak memadai',NULL),(72,2,1,5,'Sistem informasi akuntansi dan pelaporan belum didukung\r\nSDM yang memadai',NULL),(73,2,2,NULL,'Kelemahan sistem pengendalian pelaksanaan anggaran\r\npendapatan dan belanja',NULL),(74,2,2,1,'Perencanaan kegiatan tidak memadai',NULL),(75,2,2,2,'Mekanisme pemungutan, penyetoran dan pelaporan serta\r\npenggunaan Penerimaan negara/daerah/perusahaan dan\r\nhibah tidak sesuai ketentuan',NULL),(76,2,2,3,'Penyimpangan terhadap peraturan perundang-undangan\r\nbidang teknis tertentu atau ketentuan intern organisasi yang\r\ndiperiksa tentang pendapatan dan belanja',NULL),(77,2,2,4,'Pelaksanaan belanja di luar mekanisme APBN/APBD',NULL),(78,2,2,5,'Penetapan/pelaksanaan kebijakan tidak tepat atau belum\r\ndilakukan berakibat hilangnya potensi\r\npenerimaan/pendapatan',NULL),(79,2,2,6,'Penetapan/pelaksanaan kebijakan tidak tepat atau belum\r\ndilakukan berakibat peningkatan biaya /belanja',NULL),(80,2,2,7,'Kelemahan pengelolaan fisik aset',NULL),(81,2,3,NULL,'Kelemahan struktur pengendalian intern',NULL),(82,2,3,1,'Entitas tidak memiliki SOP yang formal untuk suatu prosedur\r\natau keseluruhan prosedur',NULL),(83,2,3,2,'SOP yang ada pada entitas tidak berjalan secara optimal\r\natau tidak ditaati',NULL),(84,2,3,3,'Entitas tidak memiliki satuan pengawas intern',NULL),(85,2,3,4,'Satuan pengawas intern yang ada tidak memadai atau tidak\r\nberjalan optimal',NULL),(86,2,3,5,'Tidak ada pemisahan tugas dan fungsi yang memadai',NULL),(87,3,NULL,NULL,'Temuan 3E',NULL),(88,3,1,NULL,'Ketidakhematan/pemborosan/ketidakekonomisan',NULL),(89,3,1,1,'Pengadaan barang/jasa melebihi kebutuhan',NULL),(90,3,1,2,'Penetapan kualitas dan kuantitas barang/jasa yang\r\ndigunakan tidak sesuai standar',NULL),(91,3,1,3,'Pemborosan keuangan negara/daerah/perusahaan atau\r\nkemahalan harga',NULL),(92,3,2,NULL,'Ketidakefisienan',NULL),(93,3,2,1,'Penggunaan kuantitas input untuk satu satuan output lebih\r\nbesar/tinggi dari yang seharusnya',NULL),(94,3,2,2,'Penggunaan kualitas input untuk satu satuan output lebih\r\ntinggi dari seharusnya',NULL),(95,3,3,NULL,'Ketidakefektifan',NULL),(96,3,3,1,'Penggunaan anggaran tidak tepat sasaran/tidak sesuai\r\nperuntukan',NULL),(97,3,3,2,'Pemanfaatan barang/jasa dilakukan tidak sesuai dengan\r\nrencana yang ditetapkan',NULL),(98,3,3,3,'Barang yang dibeli belum/tidak dapat dimanfaatkan',NULL),(99,3,3,4,'Pemanfaatan barang/jasa tidak berdampak terhadap\r\npencapaian tujuan organisasi',NULL),(100,3,3,5,'Pelaksanaan kegiatan terlambat/terhambat sehingga\r\nmempengaruhi pencapaian tujuan organisasi',NULL),(101,3,3,6,'Pelayanan kepada masyarakat tidak optimal',NULL),(102,3,3,7,'Fungsi atau tugas instansi yang diperiksa tidak\r\ndiselenggarakan dengan baik termasuk target penerimaan\r\ntidak tercapai',NULL),(103,3,3,8,'Penggunaan biaya promosi/pemasaran tidak efektif',NULL);
/*!40000 ALTER TABLE `tlhp_ikp_kode_temuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_lhp`
--

DROP TABLE IF EXISTS `tlhp_ikp_lhp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_lhp` (
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
  KEY `fk_ikp_lhp_user_id` (`user_id`),
  KEY `fk_ikp_lhp_jenis_pengawasan` (`jenis_pengawasan_id`),
  CONSTRAINT `fk_ikp_lhp_jenis_pengawasan` FOREIGN KEY (`jenis_pengawasan_id`) REFERENCES `tlhp_ikp_jenis_pengawasan` (`jenis_pengawasan_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_ikp_lhp_user_id` FOREIGN KEY (`user_id`) REFERENCES `tlhp_ikp_user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_lhp`
--

LOCK TABLES `tlhp_ikp_lhp` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_lhp` DISABLE KEYS */;
INSERT INTO `tlhp_ikp_lhp` VALUES (4,'sdf',NULL,NULL,NULL,NULL,NULL,1,'sdf','sdf','sdf',NULL,NULL,NULL,'sdf',NULL,NULL,NULL,4,'2016-07-26 03:41:37','2016-07-26 03:45:53'),(5,'asfas','2016-07-07','2016-07-07','2016-07-07','2016-07-07','2016-07-07',1,'dfdasfsaf','asdf','asdfasdf',NULL,NULL,NULL,'asf','2016-07-07','2016-07-07','2016-07-07',4,'2016-07-26 04:38:52','2016-07-26 04:38:52'),(6,'asdf','2016-07-05','2016-07-05','2016-07-26','2016-07-14','2016-07-26',1,NULL,'sdfsdf','sdf','2016-07-06',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 05:08:40','2016-07-26 05:08:40'),(7,'TUGAS','2016-07-07','2016-07-12','2016-07-12','2016-07-12','2016-07-25',3,'sdfPENGAWASAN','JUDUL','NOMOR','2016-06-29','PPK','KEGIATAN',NULL,NULL,NULL,NULL,4,'2016-07-26 05:12:15','2016-07-26 05:12:15'),(8,'TUGAS','2016-07-07','2016-07-12','2016-07-12','2016-07-12','2016-07-25',3,'sdfPENGAWASAN','JUDUL','NOMOR','2016-06-29','PPK','KEGIATAN','PERPANJANGAN','2016-07-07','2016-07-07','2016-07-07',4,'2016-07-26 05:12:46','2016-07-26 05:12:46'),(9,'TUGAS','2016-07-07','2016-07-12','2016-07-12','2016-07-12','2016-07-25',3,'sdfPENGAWASAN','JUDUL','NOMOR','2016-06-29','PPK','KEGIATAN','PERPANJANGAN','2016-07-05','2016-07-05','2016-07-12',4,'2016-07-26 05:14:33','2016-07-26 05:14:33'),(10,'TUGAS','2016-07-07','2016-07-12','2016-07-12','2016-07-12','2016-07-25',3,'PENGAWASAN','JUDUL','NOMOR','2016-06-29','PPK','KEGIATAN','PERPANJANGAN','2016-07-07','2016-07-07','2016-07-07',4,'2016-07-26 05:14:53','2016-07-27 06:37:02'),(11,'dsf','2016-07-07','2016-07-07','2016-07-07','2016-07-07','2016-07-07',1,NULL,'sdfsdf','sdfsdf','2016-06-27',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 06:25:56','2016-07-26 06:25:56'),(12,'dsf','2016-07-07','2016-07-07','2016-07-07','2016-07-07','2016-07-07',2,NULL,'hhgkihjkghjk','sdfsdf','2016-06-27',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 06:26:20','2016-07-26 06:26:20'),(13,NULL,'2016-07-07','2016-07-07','2016-07-07','2016-07-07','2016-07-07',1,NULL,'sdfd',NULL,'2016-07-07',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 06:28:30','2016-07-26 06:28:30'),(14,'sdfsdf','2016-07-26','2016-06-27','2016-07-12','2016-07-14','2016-07-11',1,'sdfsdf','sdf','qwewqewqe','2016-07-26',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 07:32:23','2016-07-26 07:32:23'),(15,'sdfsd','2016-07-26','2016-07-26','2016-07-26','2016-07-26','2016-07-26',1,'sd','sd','sdfs','2016-07-26','sd',NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 07:42:01','2016-07-26 07:42:01'),(16,'sdfsd','2016-07-26','2016-07-26','2016-07-26','2016-07-26','2016-07-26',1,'sd','sd','sdfs','2016-07-26','sd',NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 07:42:50','2016-07-26 07:42:50'),(17,'sdfsdf','2016-07-12','2016-07-06','2016-07-13','2016-07-26','2016-07-05',1,'kg','tdxghf','jhfhf','2016-07-26','jkgj','h',NULL,NULL,NULL,NULL,4,'2016-07-26 13:43:04','2016-07-26 13:43:04'),(18,'asdfsdf','2016-07-15','2016-07-12','2016-07-11','2016-07-12','2016-07-12',1,'sdfsdf','judul haidar','sdfsdf','2016-07-27',NULL,NULL,'sdf','2016-07-14','2016-07-05','2016-07-11',4,'2016-07-29 11:27:36','2016-07-29 11:27:36'),(19,'sdfsf','2016-07-12','2016-07-19','2016-07-20','2016-07-14','2016-07-18',1,'sdf','atang test','23423424','2016-07-29',NULL,NULL,'sdfsdf','2016-07-12','2016-07-26','2016-07-26',4,'2016-07-29 13:48:52','2016-07-29 13:48:52'),(20,'sfdsf','2016-07-15','2016-07-06','2016-07-12','2016-07-06','2016-07-21',1,'sdfsdf','bismillah haidar','sdfdsf','2016-07-30',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 17:58:57','2016-07-29 17:58:57'),(21,'123','2016-07-30','2016-07-20','2016-07-13','2016-07-13','2016-07-19',1,'sdfsdf','bismillah tim','sfdsdf','2016-07-06',NULL,NULL,'sdf','2016-07-12','2016-07-05','2016-07-03',4,'2016-07-29 19:09:30','2016-07-29 19:09:30'),(22,'dfgdfgdfg','2016-07-30','2016-07-13','2016-07-26','2016-06-29','2016-06-27',1,'sdfsdf','bismilah ke 2','sdfsdfsf','1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 19:18:00','2016-07-29 19:18:00'),(23,'sf','2016-07-30','2016-07-30','2016-07-30','2016-07-30','2016-07-30',1,'sdf','bismilah ke 3','123','2016-07-09',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 19:21:06','2016-07-29 19:21:06'),(24,'sdfsdf','2016-07-23','2016-07-30','2016-07-12','2016-07-30','2016-07-30',1,'s','bismilah ke 4','123','2016-07-30',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 19:27:01','2016-07-29 19:27:01'),(25,'sdfsdf','2016-07-30','2016-07-30','2016-07-30','2016-07-30','2016-07-30',1,'vcb','bismilah ke 5','sfsf','2016-07-30',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 19:29:38','2016-07-29 19:29:38'),(26,NULL,'2016-08-01','2016-08-01','2016-08-02','1970-01-01','1970-01-01',1,'PENGAWASAN','JUDUL Bismillah Atang ','NOMOR 123123','1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-02 03:23:32','2016-08-02 03:23:32'),(27,NULL,'2016-08-01','2016-08-01','2016-08-02','1970-01-01','1970-01-01',1,'PENGAWASAN','JUDUL Bismillah Atang ','NOMOR 123123','1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-02 03:23:33','2016-08-02 03:23:33'),(28,NULL,'2016-08-01','2016-08-01','2016-08-02','1970-01-01','1970-01-01',1,'PENGAWASAN','JUDUL Bismillah Atang ','NOMOR 123123','1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-02 03:23:33','2016-08-02 03:23:33'),(29,NULL,'2016-08-01','2016-08-01','2016-08-02','1970-01-01','1970-01-01',1,'PENGAWASAN','JUDUL Bismillah Atang ','NOMOR 123123','1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-02 03:23:36','2016-08-02 03:23:36'),(30,NULL,'2016-08-01','2016-08-01','2016-08-02','1970-01-01','1970-01-01',1,'PENGAWASAN','JUDUL Bismillah Atang ','NOMOR 123123','1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-02 03:23:39','2016-08-02 03:23:39'),(31,'sdf','2016-08-07','2016-08-07','2016-08-07','2016-08-07','2016-08-07',2,'sdfsf','sdfsdf','sdfs','2016-08-07',NULL,NULL,'1231','2016-10-07','2016-08-07','2016-08-07',5,'2016-08-06 19:35:47','2016-08-06 19:35:47'),(32,'TUGAS','1970-01-01','1970-01-01','1970-01-01','1970-01-01','1970-01-01',2,'PENGAWASAN','12313','LHP','1970-01-01',NULL,NULL,'PERPANJANGAN',NULL,NULL,NULL,5,'2016-08-06 19:38:37','2016-08-06 19:38:37'),(33,'biiznillah 1','2016-08-07','2016-08-07','2016-08-07','2016-08-07','2016-08-07',1,'biiznillah 1','biiznillah 1','biiznillah 1','2016-08-07',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-06 19:40:08','2016-08-06 19:40:08'),(34,'SURAT','2016-08-07','2016-08-07','2016-08-07','2016-08-07','2016-08-07',1,'PENGAWASAN','JUDUL 123','NOMOR','2016-08-07',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-06 19:41:06','2016-08-06 19:41:06'),(35,'Biznillah','2016-08-07','2016-08-07','2016-08-07','2016-08-07','2016-08-07',1,'PENGAWASAN','JUDUL Biznillah','NOMOR Biznillah','2016-08-07',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-06 22:55:51','2016-08-06 22:55:51'),(36,'allah is great','2016-08-07','2016-08-07','2016-08-07','2016-08-07','2016-08-07',1,'PENGAWASAN great','greatest job ever','123 nomor','2016-08-07',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-06 23:20:13','2016-08-06 23:20:13'),(37,'muhammad saw TUGAS','2016-08-07','2016-08-07','2016-08-07','2016-08-07','2016-08-07',1,'PENGAWASAN 1','muhammad saw JUDUL','muhammad saw NOMOR','2016-08-07',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-06 23:45:14','2016-08-06 23:45:14'),(38,'R001','2016-08-07','2016-08-07','2016-08-07','2016-08-07','2016-08-07',1,'obj audit','judul lhp','R0002','2016-08-07',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-07 00:18:48','2016-08-07 00:18:48'),(39,'NOMOR 1234','2016-08-07','2016-08-06','2016-08-01','2016-08-07','2016-08-07',1,'PENGAWASAN 123','JUDUL 123','NOMOR LHP','2016-08-05',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-07 02:51:17','2016-08-07 02:51:17'),(40,NULL,'1970-01-01','1970-01-01','1970-01-01','1970-01-01','1970-01-01',1,NULL,NULL,NULL,'1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-07 02:53:40','2016-08-07 02:53:40'),(41,'NOMOR 12','2016-08-07','2016-08-06','2016-08-01','2016-08-02','2016-08-01',1,'PENGAWASAN 123','JUDUL 123','NOMOR 123','2016-08-07',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-07 03:05:45','2016-08-07 03:05:45'),(42,'NOMOR 1234','2016-08-07','2016-08-06','2016-08-02','2016-08-07','2016-08-07',1,'PENGAWASAN 123','JUDUL 123','NOMOR 123','2016-08-07',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-07 05:50:47','2016-08-07 05:50:47'),(43,'sf','2016-08-07','2016-08-07','2016-08-07','2016-08-07','2016-08-07',1,'PENGAWASAN 123','atanghaidar','NOMOR 123','2016-08-07',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-07 05:52:42','2016-08-07 05:52:42'),(44,'mam','2016-08-07','2016-08-07','2016-08-07','2016-08-01','2016-08-03',1,'Mam PENGAWASAN','Mam JUDUL','Mam NOMOR','2016-08-07',NULL,NULL,NULL,NULL,NULL,NULL,44,'2016-08-07 08:17:21','2016-08-07 08:17:21'),(45,'sdf','2016-08-07','2016-08-07','2016-08-07','2016-08-07','2016-08-07',1,'PENGAWASAN','JUDUL fdgfdgvfdg','JUDUL dfgdf','2016-08-07',NULL,NULL,NULL,NULL,NULL,NULL,44,'2016-08-07 08:23:26','2016-08-07 08:23:26'),(46,'no tugas sabar','2016-08-10','2016-08-10','2016-08-10','2016-08-10','2016-08-10',1,'objek tugas sabar','judul lhp sabar','nomor lhp sabar','2016-08-10',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-10 05:53:47','2016-08-10 05:53:47'),(47,'no tugas sabar','2016-08-10','2016-08-10','2016-08-10','2016-08-10','2016-08-10',1,'objek tugas sabar','judul lhp sabar','nomor lhp sabar','2016-08-10',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-10 05:53:54','2016-08-10 05:53:54');
/*!40000 ALTER TABLE `tlhp_ikp_lhp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_persetujuan_tl`
--

DROP TABLE IF EXISTS `tlhp_ikp_persetujuan_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_persetujuan_tl` (
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
  KEY `fk_ikp_persetujuan_tl` (`tindak_lanjut_id`),
  CONSTRAINT `fk_ikp_persetujuan_tl` FOREIGN KEY (`tindak_lanjut_id`) REFERENCES `tlhp_ikp_tindak_lanjut` (`tindak_lanjut_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_persetujuan_tl`
--

LOCK TABLES `tlhp_ikp_persetujuan_tl` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_persetujuan_tl` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_ikp_persetujuan_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_rekomendasi`
--

DROP TABLE IF EXISTS `tlhp_ikp_rekomendasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_rekomendasi` (
  `rekomendasi_id` int(11) NOT NULL AUTO_INCREMENT,
  `kertas_kerja_id` int(10) NOT NULL,
  `kode_rekomendasi_id` int(4) DEFAULT NULL,
  `uraian_rekomendasi` varchar(500) DEFAULT NULL,
  `kerugian_negara` tinyint(1) DEFAULT NULL,
  `nilai_rekomendasi` double DEFAULT NULL,
  `unit_kerja_id` mediumint(3) NOT NULL,
  `nama_ppk` varchar(500) DEFAULT NULL,
  `nama_pj` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`rekomendasi_id`),
  KEY `fk_ikp_kode_rekomen` (`kode_rekomendasi_id`),
  KEY `fk_ikp_rekomen_kk` (`kertas_kerja_id`),
  CONSTRAINT `fk_ikp_kode_rekomen` FOREIGN KEY (`kode_rekomendasi_id`) REFERENCES `tlhp_ikp_kode_rekomendasi` (`kode_rekomendasi_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ikp_rekomen_kk` FOREIGN KEY (`kertas_kerja_id`) REFERENCES `tlhp_ikp_kertas_kerja_temuan` (`kertas_kerja_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_rekomendasi`
--

LOCK TABLES `tlhp_ikp_rekomendasi` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_rekomendasi` DISABLE KEYS */;
INSERT INTO `tlhp_ikp_rekomendasi` VALUES (1,3,7,'123',1,123213,0,NULL,NULL),(2,3,7,'123',1,12312,0,NULL,NULL),(3,3,8,'sdfsdf',1,12313,0,NULL,NULL),(9,8,6,'uraian rek 1',1,22222,0,NULL,NULL),(15,13,6,'uraian rek 1',2,456,0,NULL,NULL),(16,13,6,'uraian rek 1',1,456,0,NULL,NULL),(17,13,7,'uraian rek 2',2,0,0,NULL,NULL),(18,14,12,'uraian rek 2-1',1,999,0,NULL,NULL),(19,14,8,'sdf',1,0,0,NULL,NULL),(20,14,9,'sdf',1,0,0,NULL,NULL),(21,14,8,'sdf',1,123,0,NULL,NULL),(22,14,9,'sdf',1,4545,0,NULL,NULL),(25,16,8,'uraian rek 1',2,123,0,NULL,NULL),(26,17,7,'URAIAN REKOMENDASI	 1',1,1000,0,NULL,NULL),(27,17,14,'URAIAN REKOMENDASI	 2',0,NULL,0,NULL,NULL),(28,18,7,'URAIAN REKOMENDASI	1',1,1234,0,NULL,NULL),(29,18,16,'URAIAN REKOMENDASI	2',1,4560,0,NULL,NULL),(30,19,14,'URAIAN REKOMENDASI	3',0,NULL,0,NULL,NULL),(31,19,7,'URAIAN REKOMENDASI	4',0,NULL,0,NULL,NULL),(32,20,17,'URAIAN REKOMENDASI	5',1,60000,0,NULL,NULL),(33,21,12,'URAIAN REKOMENDASI	 1',1,200000,0,NULL,NULL),(34,22,14,'URAIAN REKOMENDASI	 2',1,300000,0,NULL,NULL),(35,23,10,'URAIAN REKOMENDASI	 3',1,2000,0,NULL,NULL),(36,24,11,'URAIAN REKOMENDASI	 4',0,NULL,0,NULL,NULL),(37,25,12,'URAIAN REKOMENDASI	 1',1,200000,0,NULL,NULL),(38,26,14,'URAIAN REKOMENDASI	 2',1,300000,0,NULL,NULL),(39,27,10,'URAIAN REKOMENDASI	 3',1,2000,0,NULL,NULL),(40,28,11,'URAIAN REKOMENDASI	 4',0,NULL,0,NULL,NULL),(41,29,7,'uraian rekok 1',1,13000,0,NULL,NULL),(42,29,7,'uraian rekok 2',1,12000,0,NULL,NULL),(43,30,12,'URAIAN REKOMENDASI	1',1,1000,0,NULL,NULL),(44,30,12,'URAIAN REKOMENDASI	2',0,NULL,0,NULL,NULL),(45,31,13,'URAIAN REKOMENDASI	3',1,1000,0,NULL,NULL),(46,31,14,'URAIAN REKOMENDASI	4',1,20,0,NULL,NULL),(47,32,12,'URAIAN REKOMENDASI	1',1,1000,0,NULL,NULL),(48,32,12,'URAIAN REKOMENDASI	2',0,NULL,0,NULL,NULL),(49,33,13,'URAIAN REKOMENDASI	3',1,1000,0,NULL,NULL),(50,33,14,'URAIAN REKOMENDASI	4',1,20,0,NULL,NULL),(51,34,12,'URAIAN REKOMENDASI	1',1,1000,0,NULL,NULL),(52,34,12,'URAIAN REKOMENDASI	2',0,1500,0,NULL,NULL),(53,35,13,'URAIAN REKOMENDASI	3',1,1000,0,NULL,NULL),(54,35,14,'URAIAN REKOMENDASI	4',1,20,0,NULL,NULL),(55,36,12,'URAIAN REKOMENDASI	1',1,10000,0,NULL,NULL),(56,36,14,'URAIAN REKOMENDASI	2',1,2000,0,NULL,NULL),(57,36,11,'URAIAN REKOMENDASI	3',1,3000,0,NULL,NULL),(58,37,7,'URAIAN REKOMENDASI	4',1,50003,0,NULL,NULL),(59,37,11,'URAIAN REKOMENDASI	5',1,60003,0,NULL,NULL),(60,38,7,'URAIAN REKOMENDASI	 1',0,NULL,0,NULL,NULL),(61,38,NULL,NULL,0,NULL,0,NULL,NULL),(62,38,NULL,NULL,0,NULL,0,NULL,NULL),(63,39,9,'URAIAN REKOMENDASI	 1',1,10000,0,NULL,NULL),(64,39,NULL,NULL,0,NULL,0,NULL,NULL),(65,40,7,'sdfsdfsf',0,0,0,NULL,NULL),(66,40,7,'vcbvcbcvbcvb',0,0,0,NULL,NULL),(67,41,8,'URAIAN REKOMENDASI	 1',NULL,0,0,NULL,NULL),(68,41,NULL,'URAIAN REKOMENDASI	 2',0,0,0,NULL,NULL),(69,41,8,'URAIAN REKOMENDASI	 2',0,0,0,NULL,NULL),(70,41,9,'URAIAN REKOMENDASI	 3',0,0,0,NULL,NULL),(71,41,8,'URAIAN REKOMENDASI	 4',0,0,0,NULL,NULL),(72,41,9,'URAIAN REKOMENDASI	 5',0,0,0,NULL,NULL),(73,41,9,'URAIAN REKOMENDASI	 6',0,0,0,NULL,NULL),(74,42,8,'URAIAN REKOMENDASI	 7',0,0,0,NULL,NULL),(75,43,14,'URAIAN REKOMENDASI	 8',0,0,0,NULL,NULL),(76,44,10,'URAIAN REKOMENDASI	 9',1,10000,0,NULL,NULL);
/*!40000 ALTER TABLE `tlhp_ikp_rekomendasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_template_laporan`
--

DROP TABLE IF EXISTS `tlhp_ikp_template_laporan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_template_laporan` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_template_laporan`
--

LOCK TABLES `tlhp_ikp_template_laporan` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_template_laporan` DISABLE KEYS */;
INSERT INTO `tlhp_ikp_template_laporan` VALUES (1,'sdfsdf','sdf','sdfsdf','0000-00-00','<p>ssdfsd</p>','<p>sdfsdf</p>',0,'2016-07-29 19:50:15','2016-07-29 19:50:15'),(2,'sdfghjghjghjgjghjghj','bcvbcvb','cvbcvb','2016-07-31','\r\ndfgfdg\r\n\r\n','\r\ndfgdfgdfgdfgdfgdfg\r\n\r\n',5,'2016-07-31 09:50:28','2016-07-31 09:50:28'),(3,'vbnvbn','vbnvbnvb','bnvbnvbnvbn','2016-08-02','<p>vbnvbnvbngfhfghgfh</p>','<p>bvnvbnvbngfhfghfgh</p>',0,'2016-08-01 18:45:01','2016-08-01 18:45:01'),(4,'good tim 7','vbbvcbcv','bewrwe','2016-08-10','<p>vbvnbvnbvnvbnvbnbvn</p>',NULL,5,'2016-08-10 08:13:51','2016-08-10 08:13:51');
/*!40000 ALTER TABLE `tlhp_ikp_template_laporan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_template_laporan_media`
--

DROP TABLE IF EXISTS `tlhp_ikp_template_laporan_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_template_laporan_media` (
  `id_template_laporan_media` int(11) NOT NULL AUTO_INCREMENT,
  `template_laporan_id` int(11) DEFAULT NULL,
  `upload_template_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_template_laporan_media`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_template_laporan_media`
--

LOCK TABLES `tlhp_ikp_template_laporan_media` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_template_laporan_media` DISABLE KEYS */;
INSERT INTO `tlhp_ikp_template_laporan_media` VALUES (1,4,2);
/*!40000 ALTER TABLE `tlhp_ikp_template_laporan_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_tim`
--

DROP TABLE IF EXISTS `tlhp_ikp_tim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_tim` (
  `tim_id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_tim` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`tim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_tim`
--

LOCK TABLES `tlhp_ikp_tim` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_tim` DISABLE KEYS */;
INSERT INTO `tlhp_ikp_tim` VALUES (1,'PEMBANTU PJ'),(2,'PENGENDALI MUTU'),(3,'PENGENDALI TEKNIS'),(4,'KETUA TIM'),(5,'ANGGOTA');
/*!40000 ALTER TABLE `tlhp_ikp_tim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_tim_lhp`
--

DROP TABLE IF EXISTS `tlhp_ikp_tim_lhp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_tim_lhp` (
  `tim_lhp_id` int(11) NOT NULL AUTO_INCREMENT,
  `lhp_id` int(11) NOT NULL,
  `kategory_tim` enum('biasa','perpanjangan') DEFAULT NULL,
  `tim_id` int(11) NOT NULL,
  `nama_tim` varchar(500) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tim_lhp_id`),
  KEY `fk_ikp_tim_id` (`tim_id`),
  KEY `fk_ikp_tim_lhp` (`lhp_id`),
  CONSTRAINT `fk_ikp_tim_id` FOREIGN KEY (`tim_id`) REFERENCES `tlhp_ikp_tim` (`tim_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_ikp_tim_lhp` FOREIGN KEY (`lhp_id`) REFERENCES `tlhp_ikp_lhp` (`lhp_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_tim_lhp`
--

LOCK TABLES `tlhp_ikp_tim_lhp` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_tim_lhp` DISABLE KEYS */;
INSERT INTO `tlhp_ikp_tim_lhp` VALUES (1,38,'biasa',1,'orang 1','2016-08-07 00:18:48','2016-08-07 00:18:48'),(2,38,'biasa',1,'orang 2','2016-08-07 00:18:48','2016-08-07 00:18:48'),(3,39,'biasa',1,'123','2016-08-07 02:51:17','2016-08-07 02:51:17'),(4,46,'biasa',1,NULL,'2016-08-10 05:53:47','2016-08-10 05:53:47'),(5,47,'biasa',1,'sdfsdfsdf','2016-08-10 05:53:54','2016-08-10 05:53:54');
/*!40000 ALTER TABLE `tlhp_ikp_tim_lhp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_tindak_lanjut`
--

DROP TABLE IF EXISTS `tlhp_ikp_tindak_lanjut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_tindak_lanjut` (
  `tindak_lanjut_id` int(10) NOT NULL AUTO_INCREMENT,
  `tindak_lanjut` varchar(500) DEFAULT NULL,
  `rekomendasi_id` int(11) NOT NULL,
  `nilai` double DEFAULT NULL,
  `tanggal_tl` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tindak_lanjut_id`),
  KEY `fk_ikp_tl_kk_idx` (`rekomendasi_id`),
  KEY `fk_ikp_tl_user` (`user_id`),
  CONSTRAINT `fk_ikp_tl_rekomen` FOREIGN KEY (`rekomendasi_id`) REFERENCES `tlhp_ikp_rekomendasi` (`rekomendasi_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ikp_tl_user` FOREIGN KEY (`user_id`) REFERENCES `tlhp_ikp_user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_tindak_lanjut`
--

LOCK TABLES `tlhp_ikp_tindak_lanjut` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_tindak_lanjut` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_ikp_tindak_lanjut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_unit_kerja`
--

DROP TABLE IF EXISTS `tlhp_ikp_unit_kerja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_unit_kerja` (
  `unit_kerja_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `unit_kerja` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`unit_kerja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_unit_kerja`
--

LOCK TABLES `tlhp_ikp_unit_kerja` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_unit_kerja` DISABLE KEYS */;
INSERT INTO `tlhp_ikp_unit_kerja` VALUES (1,'DEPUTI I'),(2,'DEPUTI II'),(3,'DEPUTI III'),(4,'DEPUTI IV'),(5,'STAF AHLI'),(6,'INSPEKTORAT'),(7,'BIRO SDMU'),(8,'BIRO HUKIP'),(9,'BIRO MKOK'),(10,'KASN');
/*!40000 ALTER TABLE `tlhp_ikp_unit_kerja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_upload_lhp`
--

DROP TABLE IF EXISTS `tlhp_ikp_upload_lhp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_upload_lhp` (
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
  KEY `fk_ikp_upload_lhp` (`lhp_id`),
  CONSTRAINT `fk_ikp_upload_lhp` FOREIGN KEY (`lhp_id`) REFERENCES `tlhp_ikp_lhp` (`lhp_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_upload_lhp`
--

LOCK TABLES `tlhp_ikp_upload_lhp` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_upload_lhp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_ikp_upload_lhp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_upload_template_laporan`
--

DROP TABLE IF EXISTS `tlhp_ikp_upload_template_laporan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_upload_template_laporan` (
  `upload_template_id` int(10) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(500) DEFAULT NULL,
  `ext` varchar(500) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `url` varchar(2000) DEFAULT NULL,
  `path` varchar(2000) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`upload_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_upload_template_laporan`
--

LOCK TABLES `tlhp_ikp_upload_template_laporan` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_upload_template_laporan` DISABLE KEYS */;
INSERT INTO `tlhp_ikp_upload_template_laporan` VALUES (1,'kemenpanTOR (3).docx','application/wps-office.docx',NULL,NULL,18816,'http://www.e4.dev/assets/media/kemenpanTOR (3).docx','assets/media/kemenpanTOR (3).docx','2016-08-10 07:50:48','2016-08-10 07:50:48'),(2,'kemenpanTOR (4).docx','application/wps-office.docx',NULL,NULL,18816,'http://www.e4.dev/assets/media/kemenpanTOR (4).docx','assets/media/kemenpanTOR (4).docx','2016-08-10 08:13:41','2016-08-10 08:13:41'),(3,'kemenpanTOR (5).docx','application/wps-office.docx',NULL,NULL,18816,'http://www.e4.dev/assets/media/kemenpanTOR (5).docx','assets/media/kemenpanTOR (5).docx','2016-08-10 08:24:53','2016-08-10 08:24:53');
/*!40000 ALTER TABLE `tlhp_ikp_upload_template_laporan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_upload_tl`
--

DROP TABLE IF EXISTS `tlhp_ikp_upload_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_upload_tl` (
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
  KEY `fk_ikp_upload_tl` (`tindak_lanjut_id`),
  CONSTRAINT `fk_ikp_upload_tl` FOREIGN KEY (`tindak_lanjut_id`) REFERENCES `tlhp_ikp_tindak_lanjut` (`tindak_lanjut_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_upload_tl`
--

LOCK TABLES `tlhp_ikp_upload_tl` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_upload_tl` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_ikp_upload_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_user`
--

DROP TABLE IF EXISTS `tlhp_ikp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_user` (
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
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `activation_key` varchar(200) DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `fk_ikp_user_level` (`user_level_id`),
  KEY `fk_ikp_user_unit_kerja` (`unit_kerja_id`),
  CONSTRAINT `fk_ikp_user_level` FOREIGN KEY (`user_level_id`) REFERENCES `tlhp_ikp_user_level` (`user_level_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ikp_user_unit_kerja` FOREIGN KEY (`unit_kerja_id`) REFERENCES `tlhp_ikp_unit_kerja` (`unit_kerja_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_user`
--

LOCK TABLES `tlhp_ikp_user` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_user` DISABLE KEYS */;
INSERT INTO `tlhp_ikp_user` VALUES (4,'asdf','asdfsdf','sadf','sadf','asdf','1231231','12',2,10,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-24 12:40:42','2016-08-02 03:33:17'),(5,'admin','1acf7bbc7ac25ef584552fdb1314ebda','cvbcvb','sdf','Haidar Mansur Mar\'ie','324324','sdfsdfdsf',1,1,'',NULL,NULL,NULL,NULL,NULL,NULL,'343',NULL,1,NULL,NULL,NULL,'2016-07-24 12:41:06','2016-08-08 15:44:05'),(7,'agus','sadfdsf',NULL,NULL,'agus','asdf','sfd',3,1,'asdf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-27 03:21:39','2016-08-02 03:33:17'),(8,'dinijul',NULL,NULL,NULL,'dini juliani','2343','inspectorat',1,2,'dini',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-28 11:39:18','2016-08-02 03:33:17'),(10,'aldo','9d1ec50ba9ceb580b76d015dbd49c17e',NULL,NULL,'aldo siregar','23422','UI developer',3,3,'sdf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-28 14:05:39','2016-08-02 03:33:17'),(11,'rara','haitech',NULL,NULL,'rara','12312','3sdfsdf',3,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:17:24','2016-08-02 03:33:17'),(12,'vcbcvb','haidar',NULL,NULL,'vcbvcbcvb','cvbcvb','cvcvbcvb',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:07','2016-08-02 03:33:17'),(13,'yuiuyiuyi','haidar',NULL,NULL,'jkhjk','cvbcvb','cvcvbcvb',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:14','2016-08-02 03:33:17'),(14,'rt45','haidar',NULL,NULL,'jkhjkh,.,m.','cvbcvb','cvcvbcvb',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:20','2016-08-02 03:33:17'),(15,'rt45','haidar',NULL,NULL,'hjkjhkjhkh67','cvbcvb','cvcvbcvbgfhfgh',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:29','2016-08-02 03:33:17'),(16,'iniloh',NULL,NULL,NULL,'iniloh','cvbcvbgh','bbnm',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:36','2016-08-02 03:33:17'),(17,'siapasih',NULL,NULL,NULL,'siapa sih ?','cvbcvbgh','bbnm',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:55','2016-08-02 03:33:17'),(18,'haidartech','haidartech',NULL,NULL,'haidartech','haidartech','haidartech',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 17:19:53','2016-08-02 03:33:17'),(19,'haidartech','haidartech',NULL,NULL,'haidartech','haidartech','haidartech',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 17:19:53','2016-08-02 03:33:17'),(37,'cvbvcb','cvb',NULL,NULL,'cvbvcb','cvb','vcbcv',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:47:50','2016-08-02 03:33:17'),(38,'dendi','dendi',NULL,NULL,'dendi','dendi','dendi',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:48:12','2016-08-02 03:33:17'),(39,'ria','d42a9ad09e9778b177d409f5716ac621',NULL,NULL,'ria','ria','ria',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:50:12','2016-08-02 03:33:17'),(40,'dony','77ee6d05b23e742e2aca3fd602f4c599',NULL,NULL,'dony','dony','dony',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:54:28','2016-08-02 03:33:17'),(41,'dony','77ee6d05b23e742e2aca3fd602f4c599',NULL,NULL,'dony','dony','dony',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:54:52','2016-08-02 03:33:17'),(42,'dony','77ee6d05b23e742e2aca3fd602f4c599',NULL,NULL,'dony','dony','dony',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:55:27','2016-08-02 03:33:17'),(43,'ruly','ee7ec63dd0e87cf4e43b288b306ca206',NULL,NULL,'ruly','ruly','ruly',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:55:44','2016-08-02 03:33:17'),(44,'helmi','cf3750951241a8cf90e2a0fb0af63fe2',NULL,NULL,'helmi mansur','helmi','helmi',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:57:28','2016-08-07 08:03:49'),(45,'sdfsdf','d58e3582afa99040e27b92b13c8f2280',NULL,NULL,'sdfsdf','sdfsdf','sdfsdf',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:58:55','2016-08-02 03:33:17'),(46,'sdfsdf','d58e3582afa99040e27b92b13c8f2280',NULL,NULL,'sdfsdf','sdfsdf','sdfsdf',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:59:01','2016-08-02 03:33:17'),(47,'sdfsdf','d58e3582afa99040e27b92b13c8f2280',NULL,NULL,'sdfsdf','sdfsdf','sdfsdf',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:59:03','2016-08-02 03:33:17'),(48,'sadf','c7d48bbf2b960adc10b0aba11bf336a5',NULL,NULL,'fsafsad','sdfas','fas',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:59:47','2016-08-02 03:33:17'),(49,'atanggreat','12e333512696dcac787c2f16d479c610',NULL,NULL,'atanggreat','1231','sdfsdf',3,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-07 19:31:22','2016-08-07 19:31:37'),(50,'basirgreat','12e333512696dcac787c2f16d479c610',NULL,NULL,'basirgreat','1231123','jabatan',2,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-07 19:32:28','2016-08-07 19:32:28');
/*!40000 ALTER TABLE `tlhp_ikp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_user_history`
--

DROP TABLE IF EXISTS `tlhp_ikp_user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_user_history` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `login` datetime NOT NULL,
  `logout` datetime DEFAULT NULL,
  `total_use` time DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `fk_ikp_user_history` (`user_id`),
  CONSTRAINT `fk_ikp_user_history` FOREIGN KEY (`user_id`) REFERENCES `tlhp_ikp_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_user_history`
--

LOCK TABLES `tlhp_ikp_user_history` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_user_history` DISABLE KEYS */;
INSERT INTO `tlhp_ikp_user_history` VALUES (1,5,'2016-07-28 15:38:08',NULL,NULL),(2,5,'2016-07-28 15:38:38','2016-07-28 15:39:03',NULL),(3,5,'2016-07-28 15:41:37','2016-07-28 15:43:23',NULL),(4,5,'2016-07-28 15:47:44','2016-07-28 15:59:15',NULL),(5,5,'2016-07-28 16:03:44','2016-07-28 16:03:49',NULL),(6,5,'2016-07-28 16:03:56','2016-07-28 16:17:10',NULL),(7,8,'2016-07-28 16:17:24','2016-07-28 16:18:10',NULL),(8,5,'2016-07-28 16:18:55','2016-07-28 16:21:13',NULL),(9,8,'2016-07-28 16:21:19','2016-07-28 16:22:26',NULL),(10,5,'2016-07-28 16:22:36','2016-07-28 16:22:42',NULL),(11,5,'2016-07-28 16:22:48','2016-07-28 17:18:50',NULL),(12,10,'2016-07-28 17:19:01','2016-07-28 17:19:53',NULL),(13,5,'2016-07-28 17:28:11','2016-07-28 17:28:46',NULL),(14,5,'2016-07-28 17:29:40','2016-07-28 18:07:22',NULL),(15,5,'2016-07-28 18:37:08',NULL,NULL),(16,5,'2016-07-29 00:50:27','2016-07-29 00:51:51',NULL),(17,11,'2016-07-29 01:15:53','2016-07-29 03:04:32',NULL),(18,5,'2016-07-29 03:04:37','2016-07-29 13:07:12',NULL),(19,5,'2016-07-29 13:07:31','2016-07-29 13:24:12',NULL),(20,5,'2016-07-29 13:37:24',NULL,NULL),(21,41,'2016-07-30 02:35:23',NULL,NULL),(22,5,'2016-07-31 17:02:22','2016-07-31 18:03:19',NULL),(23,5,'2016-07-31 20:46:44',NULL,NULL),(24,5,'2016-08-01 07:00:59',NULL,NULL),(25,5,'2016-08-01 10:14:17','2016-08-01 10:26:54',NULL),(26,5,'2016-08-01 10:26:59','2016-08-01 10:39:57',NULL),(27,5,'2016-08-01 10:40:02','2016-08-01 10:45:13',NULL),(28,14,'2016-08-01 11:48:30','2016-08-01 11:50:54',NULL),(29,5,'2016-08-01 11:51:49','2016-08-01 11:54:22',NULL),(30,5,'2016-08-01 11:54:30','2016-08-01 12:00:51',NULL),(31,48,'2016-08-01 12:02:20','2016-08-01 12:07:27',NULL),(32,5,'2016-08-01 12:08:25','2016-08-01 12:08:55',NULL),(33,5,'2016-08-01 12:09:02','2016-08-01 12:09:15',NULL),(34,11,'2016-08-01 12:11:08','2016-08-01 17:07:08',NULL),(35,5,'2016-08-01 12:11:31','2016-08-01 14:24:35',NULL),(36,5,'2016-08-01 12:12:30','2016-08-01 12:12:49',NULL),(37,5,'2016-08-01 12:12:57','2016-08-01 12:26:45',NULL),(38,10,'2016-08-01 17:07:52','2016-08-01 19:07:15',NULL),(39,10,'2016-08-01 19:07:25','2016-08-01 19:12:57',NULL),(40,5,'2016-08-01 23:10:37','2016-08-01 23:38:00',NULL),(41,5,'2016-08-02 00:17:12','2016-08-02 01:29:11',NULL),(42,5,'2016-08-02 01:29:19','2016-08-02 02:27:49',NULL),(43,5,'2016-08-02 02:28:02','2016-08-02 03:30:52',NULL),(44,5,'2016-08-02 03:30:58',NULL,NULL),(45,5,'2016-08-02 06:24:58','2016-08-02 07:50:45',NULL),(46,5,'2016-08-02 07:50:49','2016-08-02 07:52:42',NULL),(47,5,'2016-08-02 07:52:46','2016-08-02 10:34:21',NULL),(48,5,'2016-08-02 10:36:01',NULL,NULL),(49,5,'2016-08-07 05:52:24','2016-08-07 07:29:07',NULL),(50,5,'2016-08-07 07:31:37',NULL,NULL),(51,5,'2016-08-07 12:50:05','2016-08-07 15:03:24',NULL),(52,5,'2016-08-07 15:03:34','2016-08-07 15:03:51',NULL),(53,44,'2016-08-07 15:03:57',NULL,NULL),(54,5,'2016-08-08 01:05:12',NULL,NULL),(55,5,'2016-08-08 02:14:53',NULL,NULL),(56,5,'2016-08-08 05:05:50',NULL,NULL),(57,5,'2016-08-08 21:10:03',NULL,NULL),(58,5,'2016-08-10 05:30:31',NULL,NULL),(59,5,'2016-08-10 09:57:07',NULL,NULL),(60,5,'2016-08-10 11:09:53',NULL,NULL),(61,5,'2016-08-10 13:37:10',NULL,NULL),(62,5,'2016-08-11 19:21:58',NULL,NULL);
/*!40000 ALTER TABLE `tlhp_ikp_user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_ikp_user_level`
--

DROP TABLE IF EXISTS `tlhp_ikp_user_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_ikp_user_level` (
  `user_level_id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `user_level` varchar(200) NOT NULL,
  PRIMARY KEY (`user_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_ikp_user_level`
--

LOCK TABLES `tlhp_ikp_user_level` WRITE;
/*!40000 ALTER TABLE `tlhp_ikp_user_level` DISABLE KEYS */;
INSERT INTO `tlhp_ikp_user_level` VALUES (1,'super admin'),(2,'admin'),(3,'user');
/*!40000 ALTER TABLE `tlhp_ikp_user_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_jenis_pengawasan`
--

DROP TABLE IF EXISTS `tlhp_orix_jenis_pengawasan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_jenis_pengawasan` (
  `jenis_pengawasan_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `jenis_pengawasan` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`jenis_pengawasan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_jenis_pengawasan`
--

LOCK TABLES `tlhp_orix_jenis_pengawasan` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_jenis_pengawasan` DISABLE KEYS */;
INSERT INTO `tlhp_orix_jenis_pengawasan` VALUES (1,'AUDIT'),(2,'REVIU'),(3,'EVALUASI'),(4,'PEMANTAUAN'),(5,'TINDAK LANJUT PENGADUAN'),(6,'PENGAWASAN LAIN');
/*!40000 ALTER TABLE `tlhp_orix_jenis_pengawasan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_kertas_kerja_temuan`
--

DROP TABLE IF EXISTS `tlhp_orix_kertas_kerja_temuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_kertas_kerja_temuan` (
  `kertas_kerja_id` int(10) NOT NULL AUTO_INCREMENT,
  `lhp_id` int(11) NOT NULL,
  `jenis_temuan` enum('a','b','c') NOT NULL,
  `no_temuan` varchar(500) DEFAULT NULL,
  `kode_temuan_id` int(10) DEFAULT NULL,
  `uraian_temuan` varchar(500) DEFAULT NULL,
  `kode_sebab_id` int(4) DEFAULT NULL,
  `uraian_sebab` varchar(500) DEFAULT NULL,
  `nilai_temuan` varchar(500) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kertas_kerja_id`),
  KEY `fk_orix_kk_user` (`user_id`),
  KEY `fk_orix_kk_lhp` (`lhp_id`),
  KEY `fk_orix_kk_kode_temuan` (`kode_temuan_id`),
  KEY `fk_orix_kk_kode_sebab_idx` (`kode_sebab_id`),
  CONSTRAINT `fk_orix_kk_kode_sebab` FOREIGN KEY (`kode_sebab_id`) REFERENCES `tlhp_orix_kode_sebab` (`kode_sebab_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orix_kk_kode_temuan` FOREIGN KEY (`kode_temuan_id`) REFERENCES `tlhp_orix_kode_temuan` (`kode_temuan_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_orix_kk_lhp` FOREIGN KEY (`lhp_id`) REFERENCES `tlhp_orix_lhp` (`lhp_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_orix_kk_user` FOREIGN KEY (`user_id`) REFERENCES `tlhp_orix_user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_kertas_kerja_temuan`
--

LOCK TABLES `tlhp_orix_kertas_kerja_temuan` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_kertas_kerja_temuan` DISABLE KEYS */;
INSERT INTO `tlhp_orix_kertas_kerja_temuan` VALUES (2,19,'',NULL,NULL,'sdf',4,'sdf','123',5,'2016-07-29 17:39:10','2016-08-01 19:45:33'),(3,19,'',NULL,NULL,'sdf',4,'sdf','123',5,'2016-07-29 17:42:11','2016-08-01 19:45:34'),(8,20,'a',NULL,NULL,'ssf',4,'ssfdsfdsf','12313',5,'2016-07-29 19:08:22','2016-08-01 19:45:35'),(9,20,'a',NULL,NULL,'ssf',4,'ssfdsfdsf','12313',5,'2016-07-29 19:08:22','2016-08-01 19:45:35'),(13,21,'a',NULL,NULL,'uraian temuan 1',5,'uraian sebab 1','123',5,'2016-07-29 19:14:41','2016-08-01 19:45:36'),(14,22,'b',NULL,NULL,'uraian temuan 1',17,'uraian sebab 2','789',5,'2016-07-29 19:19:27','2016-08-01 19:45:36'),(16,25,'a',NULL,NULL,'sdf',5,'sfd','123',5,'2016-07-29 19:30:44','2016-08-01 19:45:38');
/*!40000 ALTER TABLE `tlhp_orix_kertas_kerja_temuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_kode_rekomendasi`
--

DROP TABLE IF EXISTS `tlhp_orix_kode_rekomendasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_kode_rekomendasi` (
  `kode_rekomendasi_id` int(10) NOT NULL AUTO_INCREMENT,
  `kode_rekomendasi` varchar(10) DEFAULT NULL,
  `uraian_rekomendasi` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`kode_rekomendasi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_kode_rekomendasi`
--

LOCK TABLES `tlhp_orix_kode_rekomendasi` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_kode_rekomendasi` DISABLE KEYS */;
INSERT INTO `tlhp_orix_kode_rekomendasi` VALUES (6,'00','KODE REKOMENDASI'),(7,'01','Penyetoran ke kas negara/daerah, kas BUMN/D, dan masyararakat'),(8,'02','Pengembalian barang kepada negara, daerah, BUMN/D, dan masyarakat'),(9,'03','Perbaikan fisik barang/jasa dalam proses pembangunan atau penggantian barang/jasa oleh rekanan'),(10,'04','Penghapusan barang milik negara/daerah'),(11,'05','Pelaksanaan sanksi administrasi kepegawaian'),(12,'06','Perbaikan laporan dan penertiban administrasi/kelengkapan administrasi'),(13,'07','Perbaikan sistem dan prosedur akuntansi dan pelaporan'),(14,'08','Peningkatan kualitas dan kuantitas sumber daya manusia pendukung sistem pengendalian'),(15,'09','Perubahan atau perbaikan prosedur, peraturan dan kebijakan'),(16,'10','Perubahan atau perbaikan struktur organisasi'),(17,'11','Koordinasi antar instansi termasuk juga penyerahan penanganan kasus kepada instansi yang berwenang'),(18,'12','Pelaksanaan penelitian oleh tim khusus atau audit lanjutan oleh unit pengawas intern'),(19,'13','Pelaksanaan sosialisasi'),(20,'14','Lain-lain');
/*!40000 ALTER TABLE `tlhp_orix_kode_rekomendasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_kode_sebab`
--

DROP TABLE IF EXISTS `tlhp_orix_kode_sebab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_kode_sebab` (
  `kode_sebab_id` int(10) NOT NULL AUTO_INCREMENT,
  `kode_sebab_group` tinyint(3) DEFAULT NULL,
  `kode_sebab` varchar(10) DEFAULT NULL,
  `uraian_sebab` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`kode_sebab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_kode_sebab`
--

LOCK TABLES `tlhp_orix_kode_sebab` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_kode_sebab` DISABLE KEYS */;
INSERT INTO `tlhp_orix_kode_sebab` VALUES (2,0,'0','Penyebab lain yang belum didefinisikan (nihil)'),(3,1,'100','KELEMAHAN PENGAWASAN MELEKAT'),(4,1,'101','Pembagian wewenang dalam organisasi belum cukup jauh sehingga masih terdapat transaksi atau kegiatan organisasi yang seluruh tahapnya dikuasai oleh satu orang'),(5,1,'102','Pembagian wewenang dalam organisasi belum cukup jelas sehingga ada kegiatan atau kejadian dalam organisasi yang tidak jelas penanggungjawabnya'),(6,1,'103','Dalam organisasi tidak ada pembagian wewenang dan tugas'),(7,1,'104','Kelalaian pejabat yang berwenang'),(8,1,'105','Kelemahan lain organisasi'),(9,2,'200','KELEMAHAN DALAM KEBIJAKAN/ KEBIJAKSANAAN'),(10,2,'201','Kebijakan yang berlaku tidak jelas bagi para bawahan'),(11,2,'202','Kebijakan yang berlaku tidak dapat menjadi pedoman yang pasti bagi para bawahan'),(12,2,'203','Kebijaksanaan yang berlaku tidak dikomunikasikan secara lisan maupun tertulis'),(13,2,'204','Tidak ada kebijakan yang digariskan'),(14,2,'205','Kelemahan lain kebijakan'),(15,2,'206','Kebijakan tidak sejalan/bertentangan dengan ketentuan yang lebih tinggi'),(16,3,'300','KELEMAHAN DALAM RENCANA'),(17,3,'301','Rencana kerja yang disusun tidak cukup luas sehingga belum mencakup seluruh kegiatan yang perlu dilaksanakan'),(18,3,'302','Hubungan kerja di antara kegiatan-kegiatan yang direncanakan tidak jelas dirumuskan sehingga tidak ada koordinasi di antara kegiatan-kegiatan itu'),(19,3,'303','Sasaran yang akan dicapai tidak cukup jelas dirumuskan'),(20,3,'304','Sasaran yang akan dicapai tidak cukup dikuantifikasikan'),(21,3,'305','Tidak dibuat anggaran yang merupakan kuantifikasi moneter rencana kegiatan dan sasaran yang akan dicapai'),(22,3,'306','Tidak ada rencana kegiatan'),(23,3,'307','Rencana kegiatan tidak cukup realistis'),(24,3,'308','Anggaran tidak cukup realistis'),(25,3,'309','Kelemahan lain perencanaan'),(26,3,'310','Perencanaan tidak matang'),(27,4,'400','KELEMAHAN DALAM PROSEDUR'),(28,4,'401','Prosedur yang ada tidak konsisten dengan kebijaksanaan yang perlu dilaksanakan'),(29,4,'402','Prosedur yang berlaku disalahtafsirkan oleh pegawai sehingga menyimpang dari tujuannya'),(30,4,'403','Prosedur yang berlaku tidak dimengerti sehingga tidak dilaksanakan'),(31,4,'404','Prosedur yang berlaku terlalu mahal dibandingkan dengan sesuatu yang harus dijaga sehingga tidak dilaksanakan'),(32,4,'405','Prosedur yang berlaku kurang terinci'),(33,4,'406','Prosedur yang berlaku tidak dapat menjadi pegangan bawahan karena tidak tertulis'),(34,4,'407','Prosedur yang berlaku tidak dikomunikasikan secara tertulis maupun lisan'),(35,4,'408','Tidak terdapat prosedur yang diperlukan'),(36,4,'409','Kelemahan lain prosedur'),(37,5,'500','KELEMAHAN DALAM PENCATATAN DAN PELAPORAN'),(38,5,'501','Pencatatan tidak diselenggarakan secara cermat sehingga kehilangan keadaannya'),(39,5,'502','Pencatatan tidak dimutakhirkan sehingga kehilangan peranannya sebagai alat pengawasan/pengendalian'),(40,5,'503','Pencatatan tidak memenuhi kebutuhan informasi untuk pengambilan keputusan sehari-hari'),(41,5,'504','Tidak diselenggarakan pencatatan yang perlu'),(42,5,'505','Pelaporan tidak tepat waktu'),(43,5,'506','Pelaporan tidak disusun dengan cermat'),(44,5,'507','Pelaporan tidak disusun memenuhi kebutuhan pimpinan'),(45,5,'508','Pelaporan disusun dengan biaya mahal'),(46,5,'509','Pelaporan yang diperlukan tidak ada'),(47,5,'510','Kelemahan lain pencatatan atau pelaporan'),(48,6,'600','KELEMAHAN DALAM PEMBINAAN PERSONIL'),(49,6,'601','Pegawai kurang mendapatkan supervisi (pengawasan) yang diperlukan (termasuk tidak dilakukan pemeriksaan kas bendaharawan oleh atasan langsung dan pemeriksaan fisik atas inventaris atau pers'),(50,6,'602','Supervisor tidak menyadari siapa yang harus diawasi dan apa yang harus diawasi'),(51,6,'603','Penugasan/penempatan pegawai tidak tepat/sesuai dengan latar belakang pendidikan '),(52,6,'604','Kelemahan lain pembinaan personil'),(53,7,'700','KELEMAHAN DALAM PENGAWASAN INTERN (INTERNAL REVIEW)'),(54,7,'701','Tidak ada satuan kerja atau pejabat yang diberi tanggung jawab untuk mengecek jalannya sistem dan prosedur yang telah ditetapkan'),(55,7,'702','Satuan kerja atau pejabat yang diberi tanggung jawab menguji jalannya sistem dan prosedur tidak berfungsi dengan baik'),(56,7,'703','Kelemahan lain pengkajian intern'),(57,8,'800','KELEMAHAN PENGAWASAN TERHADAP REKANAN'),(58,8,'801','Kelemahan Pengawasan Pemimpin Proyek'),(59,8,'802','Kelemahan Pengawasan Pimpinan Satker'),(60,9,'900','PENYEBAB EKSTERN HAMBATAN KELANCARAN PROYEK'),(61,9,'901','Pekerjaan persiapan proyek dan perumusan proyek kurang mantap (survei dan disain tidak mantap)'),(62,9,'902','DIP terlambat diterima proyek'),(63,9,'903','Revisi DIP yang diajukan pemimpin proyek penyelesaiannya menjadi berlarut-larut'),(64,9,'904','Tanah yang diperlukan proyek penyelesaiannya menjadi berlarut-larut'),(65,9,'905','Tidak dapat diperoleh tanah yang diperlukan proyek karena dana tidak mencukupi atau tidak tersedia'),(66,9,'906','Penetapan rekanan menjadi berlarut-larut'),(67,9,'907','Perijinan atau persetujuan untuk memulai suatu kegiatan proyek menjadi berlarut-larut'),(68,9,'908','Sarana komunikasi dan atau telekomunikasi tidak mendukung kelancaran proyek'),(69,9,'909','Rekanan yang ditetapkan tidak mampu menyelesaikan tanggungjawabnya'),(70,9,'910','Penyebab ekstern hambatan kelancaran proyek lainnya'),(71,9,'911','Rekanan mempunyai itikad yang kurang baik'),(72,10,'1000','PENYEBAB EKSTERN HAMBATAN KELANCARAN TUGAS POKOK INSTANSI'),(73,10,'1001','Instansi lain yang terkait kurang responsif'),(74,10,'1002','Sarana komunikasi dan atau telekomunikasi tidak mendukung kelancaran tugas instansi'),(75,10,'1003','Revisi DIK yang diajukan pimpinan instansi penyelesaiannya berlarut-larut'),(76,10,'1004','Rekanan yang telah ditetapkan tidak mampu menyelesaikan tanggungjawabnya'),(77,10,'1005','Perijinan atau persetujuan untuk memulai suatu kegiatan instansi menjadi berlarut-larut'),(78,10,'1006','Penyebab ekstern hambatan kelancaran tupoksi lainnya'),(79,10,'1007','Pencairan dana pinjaman tidak tepat waktu atau tidak sesuai jadwal kebutuhan'),(80,11,'1100','PENYEBAB KETIDAKLANCARAN PELAYANAN APARATUR PEMERINTAHAN/  BUMN/BUMD KEPADA MASYARAKAT'),(81,11,'1101','Prosedur yang ditetapkan belum sederhana'),(82,11,'1102','Masyarakat buta terhadap persyaratan yang perlu dipenuhi dan prosedur yang harus ditempuh'),(83,11,'1103','Tidak ada batas waktu maksimum penyelesaian pelayanan'),(84,11,'1104','Prosedur yang ditetapkan cukup banyak titik pertemuan pegawai dengan masyarakat sehingga membuka peluang pungutan liar'),(85,11,'1105','Persyaratan yang ditetapkan berlebihan sehingga menyulitkan pemohonan pelayanan'),(86,11,'1106','Tidak ada koordinasi antar instansi sehingga jelas siapa yang berwenang mengambil keputusan'),(87,11,'1107','Penyebab lain ketidaklancaran pelayanan');
/*!40000 ALTER TABLE `tlhp_orix_kode_sebab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_kode_temuan`
--

DROP TABLE IF EXISTS `tlhp_orix_kode_temuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_kode_temuan` (
  `kode_temuan_id` int(10) NOT NULL AUTO_INCREMENT,
  `kelompok` smallint(3) DEFAULT NULL,
  `sub_kelompok` smallint(3) DEFAULT NULL,
  `jenis` smallint(3) DEFAULT NULL,
  `kode_temuan` varchar(1000) DEFAULT NULL,
  `alt_rekom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kode_temuan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_kode_temuan`
--

LOCK TABLES `tlhp_orix_kode_temuan` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_kode_temuan` DISABLE KEYS */;
INSERT INTO `tlhp_orix_kode_temuan` VALUES (1,1,1,1,'Temuan Ketidakpatuhan Terhadap Peraturan',NULL),(2,1,1,NULL,'Kerugian negara/daerah atau kerugian negara/daerah\r\nyang terjadi pada perusahaan milik negara/daerah',NULL),(3,1,1,1,'Belanja dan/atau pengadaan barang/jasa fiktif',NULL),(4,1,1,2,'Rekanan pengadaan barang/jasa tidak menyelesaikan\r\npekerjaan',NULL),(5,1,1,3,'Kekurangan volume pekerjaan dan/atau barang',NULL),(6,1,1,4,'Kelebihan pembayaran selain kekurangan volume pekerjaan\r\ndan/atau barang',NULL),(7,1,1,5,'Pemahalan harga (Mark up)',NULL),(8,1,1,6,'Penggunaan uang/barang untuk kepentingan pribadi',NULL),(9,1,1,7,'Pembayaran honorarium dan/atau biaya perjalanan dinas\r\nganda dan/atau melebihi standar yang ditetapkan',NULL),(10,1,1,8,'Spesifikasi barang/jasa yang diterima tidak sesuai dengan\r\nkontrak',NULL),(11,1,1,9,'Belanja tidak sesuai atau melebihi ketentuan',NULL),(12,1,1,10,'Pengembalian pinjaman/piutang atau dana bergulir macet',NULL),(13,1,1,11,'Kelebihan penetapan dan pembayaran restitusi pajak atau\r\npenetapan kompensasi kerugian',NULL),(14,1,1,12,'Penjualan/pertukaran/penghapusan aset negara/daerah tidak\r\nsesuai ketentuan dan merugikan negara/daerah',NULL),(15,1,1,13,'Pengenaan ganti kerugian negara belum/tidak dilaksanakan\r\nsesuai ketentuan',NULL),(16,1,1,14,'Entitas belum/tidak melaksanakan tuntutan perbendaharaan\r\n(TP) sesuai ketentuan',NULL),(17,1,1,15,'Penghapusan hak tagih tidak sesuai ketentuan',NULL),(18,1,1,16,'Pelanggaran ketentuan pemberian diskon penjualan',NULL),(19,1,1,17,'Penentuan HPP (harga pokok pembelian) terlalu rendah\r\nsehingga penentuan harga jual lebih rendah dari yang\r\nseharusnya',NULL),(20,1,1,18,'Jaminan pelaksanaan dalam pelaksanaan pekerjaan,\r\npemanfaatan barang dan pemberian fasilitas tidak dapat\r\ndicairkan',NULL),(21,1,1,19,'Penyetoran penerimaan negara/daerah dengan bukti fiktif',NULL),(22,1,2,NULL,'Potensi kerugian negara/daerah atau kerugian\r\nnegara/daerah yang terjadi pada perusahaan milik\r\nnegara/daerah',NULL),(23,1,2,1,'Kelebihan pembayaran dalam pengadaan barang/jasa tetapi\r\npembayaran pekerjaan belum dilakukan sebagian atau\r\nseluruhnya',NULL),(24,1,2,2,'Rekanan belum melaksanakan kewajiban pemeliharaan\r\nbarang hasil pengadaan yang telah rusak selama masa\r\npemeliharaan',NULL),(25,1,2,3,'Aset dikuasai pihak lain',NULL),(26,1,2,4,'Pembelian aset yang berstatus sengketa',NULL),(27,1,2,5,'Aset tidak diketahui keberadaannya',NULL),(28,1,2,6,'Pemberian jaminan pelaksanaan dalam pelaksanaan\r\npekerjaan, pemanfaatan barang dan pemberian fasilitas tidak\r\nsesuai ketentuan',NULL),(29,1,2,7,'Pihak ketiga belum melaksanakan kewajiban untuk\r\nmenyerahkan aset kepada negara/daerah',NULL),(30,1,2,8,'Piutang/pinjaman atau dana bergulir yang berpotensi tidak\r\ntertagih',NULL),(31,1,2,9,'Penghapusan piutang tidak sesuai ketentuan',NULL),(32,1,2,10,'Pencairan anggaran pada akhir tahun anggaran untuk\r\npekerjaan yang belum selesai',NULL),(33,1,3,NULL,'Kekurangan penerimaan negara/daerah atau perusahaan\r\nmilik negara/daerah',NULL),(34,1,3,1,'Penerimaan negara/daerah atau denda keterlambatan\r\npekerjaan belum/tidak ditetapkan dipungut/diterima/disetor ke\r\nkas negara/daerah atau perusahaan milik negara/daerah',NULL),(35,1,3,2,'Penggunaan langsung penerimaan negara/daerah',NULL),(36,1,3,3,'Dana Perimbangan yang telah ditetapkan belum masuk ke\r\nkas daerah',NULL),(37,1,3,4,'Penerimaan negara/daerah diterima atau digunakan oleh\r\ninstansi yang tidak berhak',NULL),(38,1,3,5,'Pengenaan tarif pajak/PNBP lebih rendah dari ketentuan',NULL),(39,1,3,6,'Koreksi perhitungan bagi hasil dengan KKKS',NULL),(40,1,3,7,'Kelebihan pembayaran subsidi oleh pemerintah',NULL),(41,1,4,NULL,'Administrasi',NULL),(42,1,4,1,'Pertanggungjawaban tidak akuntabel (bukti tidak\r\nlengkap/tidak valid)',NULL),(43,1,4,2,'Pekerjaan dilaksanakan mendahului kontrak atau penetapan\r\nanggaran',NULL),(44,1,4,3,'Proses pengadaan barang/jasa tidak sesuai ketentuan (tidak\r\nmenimbulkan kerugian negara)',NULL),(45,1,4,4,'Pemecahan kontrak untuk menghindari pelelangan',NULL),(46,1,4,5,'Pelaksanaan lelang secara performa',NULL),(47,1,4,6,'Penyimpangan terhadap peraturan perundang-undangan\r\nbidang pengelolaan perlengkapan atau barang milik',NULL),(48,1,4,7,'Penyimpangan terhadap peraturan perundang-undangan\r\nbidang tertentu lainnya seperti kehutanan, pertambangan,\r\nperpajakan, dll',NULL),(49,1,4,8,'Koreksi perhitungan subsidi/kewajiban pelayanan umum',NULL),(50,1,4,9,'Pembentukan cadangan piutang, perhitungan penyusutan\r\natau amortisasi tidak sesuai ketentuan',NULL),(51,1,4,10,'Penyetoran penerimaan negara/daerah atau kas di\r\nbendaharawan ke kas negara/daerah melebihi batas waktu\r\nyang ditentukan',NULL),(52,1,4,11,'Pertanggungjawaban/penyetoran uang persediaan melebihi\r\nbatas waktu yang ditentukan',NULL),(53,1,4,12,'Sisa kas di bendahara pengeluaran akhir tahun anggaran\r\nbelum/tidak disetor ke kas negara/daerah',NULL),(54,1,4,13,'Pengeluaran investasi pemerintah tidak didukung bukti yang\r\nsah',NULL),(55,1,4,14,'Kepemilikan aset tidak/belum didukung bukti yang sah',NULL),(56,1,4,15,'Pengalihan anggaran antar MAK tidak sah',NULL),(57,1,4,16,'Pelampauan pagu anggaran',NULL),(58,1,5,NULL,'Indikasi tindak pidana',NULL),(59,1,5,1,'Indikasi tindak pidana korupsi',NULL),(60,1,5,2,'Indikasi tindak pidana perbankan',NULL),(61,1,5,3,'Indikasi tindak pidana perpajakan',NULL),(62,1,5,4,'Indikasi tindak pidana kepabeanan',NULL),(63,1,5,5,'Indikasi tindak pidana kehutanan',NULL),(64,1,5,6,'Indikasi tindak pidana pasar modal',NULL),(65,1,5,7,'Indikasi tindak pidana khusus lainnya',NULL),(66,2,NULL,NULL,'Temuan kelemahan sistem pengendalian intern',NULL),(67,2,1,NULL,'Kelemahan sistem pengendalian akuntansi dan\r\npelaporan',NULL),(68,2,1,1,'Pencatatan tidak/belum dilakukan atau tidak akurat',NULL),(69,2,1,2,'Proses penyusunan laporan tidak sesuai ketentuan',NULL),(70,2,1,3,'Entitas terlambat menyampaikan laporan',NULL),(71,2,1,4,'Sistem informasi akuntansi dan pelaporan tidak memadai',NULL),(72,2,1,5,'Sistem informasi akuntansi dan pelaporan belum didukung\r\nSDM yang memadai',NULL),(73,2,2,NULL,'Kelemahan sistem pengendalian pelaksanaan anggaran\r\npendapatan dan belanja',NULL),(74,2,2,1,'Perencanaan kegiatan tidak memadai',NULL),(75,2,2,2,'Mekanisme pemungutan, penyetoran dan pelaporan serta\r\npenggunaan Penerimaan negara/daerah/perusahaan dan\r\nhibah tidak sesuai ketentuan',NULL),(76,2,2,3,'Penyimpangan terhadap peraturan perundang-undangan\r\nbidang teknis tertentu atau ketentuan intern organisasi yang\r\ndiperiksa tentang pendapatan dan belanja',NULL),(77,2,2,4,'Pelaksanaan belanja di luar mekanisme APBN/APBD',NULL),(78,2,2,5,'Penetapan/pelaksanaan kebijakan tidak tepat atau belum\r\ndilakukan berakibat hilangnya potensi\r\npenerimaan/pendapatan',NULL),(79,2,2,6,'Penetapan/pelaksanaan kebijakan tidak tepat atau belum\r\ndilakukan berakibat peningkatan biaya /belanja',NULL),(80,2,2,7,'Kelemahan pengelolaan fisik aset',NULL),(81,2,3,NULL,'Kelemahan struktur pengendalian intern',NULL),(82,2,3,1,'Entitas tidak memiliki SOP yang formal untuk suatu prosedur\r\natau keseluruhan prosedur',NULL),(83,2,3,2,'SOP yang ada pada entitas tidak berjalan secara optimal\r\natau tidak ditaati',NULL),(84,2,3,3,'Entitas tidak memiliki satuan pengawas intern',NULL),(85,2,3,4,'Satuan pengawas intern yang ada tidak memadai atau tidak\r\nberjalan optimal',NULL),(86,2,3,5,'Tidak ada pemisahan tugas dan fungsi yang memadai',NULL),(87,3,NULL,NULL,'Temuan 3E',NULL),(88,3,1,NULL,'Ketidakhematan/pemborosan/ketidakekonomisan',NULL),(89,3,1,1,'Pengadaan barang/jasa melebihi kebutuhan',NULL),(90,3,1,2,'Penetapan kualitas dan kuantitas barang/jasa yang\r\ndigunakan tidak sesuai standar',NULL),(91,3,1,3,'Pemborosan keuangan negara/daerah/perusahaan atau\r\nkemahalan harga',NULL),(92,3,2,NULL,'Ketidakefisienan',NULL),(93,3,2,1,'Penggunaan kuantitas input untuk satu satuan output lebih\r\nbesar/tinggi dari yang seharusnya',NULL),(94,3,2,2,'Penggunaan kualitas input untuk satu satuan output lebih\r\ntinggi dari seharusnya',NULL),(95,3,3,NULL,'Ketidakefektifan',NULL),(96,3,3,1,'Penggunaan anggaran tidak tepat sasaran/tidak sesuai\r\nperuntukan',NULL),(97,3,3,2,'Pemanfaatan barang/jasa dilakukan tidak sesuai dengan\r\nrencana yang ditetapkan',NULL),(98,3,3,3,'Barang yang dibeli belum/tidak dapat dimanfaatkan',NULL),(99,3,3,4,'Pemanfaatan barang/jasa tidak berdampak terhadap\r\npencapaian tujuan organisasi',NULL),(100,3,3,5,'Pelaksanaan kegiatan terlambat/terhambat sehingga\r\nmempengaruhi pencapaian tujuan organisasi',NULL),(101,3,3,6,'Pelayanan kepada masyarakat tidak optimal',NULL),(102,3,3,7,'Fungsi atau tugas instansi yang diperiksa tidak\r\ndiselenggarakan dengan baik termasuk target penerimaan\r\ntidak tercapai',NULL),(103,3,3,8,'Penggunaan biaya promosi/pemasaran tidak efektif',NULL);
/*!40000 ALTER TABLE `tlhp_orix_kode_temuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_lhp`
--

DROP TABLE IF EXISTS `tlhp_orix_lhp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_lhp` (
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
  KEY `fk_orix_lhp_user_id` (`user_id`),
  KEY `fk_orix_lhp_jenis_pengawasan` (`jenis_pengawasan_id`),
  CONSTRAINT `fk_orix_lhp_jenis_pengawasan` FOREIGN KEY (`jenis_pengawasan_id`) REFERENCES `tlhp_orix_jenis_pengawasan` (`jenis_pengawasan_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_orix_lhp_user_id` FOREIGN KEY (`user_id`) REFERENCES `tlhp_orix_user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_lhp`
--

LOCK TABLES `tlhp_orix_lhp` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_lhp` DISABLE KEYS */;
INSERT INTO `tlhp_orix_lhp` VALUES (4,'sdf',NULL,NULL,NULL,NULL,NULL,1,'sdf','sdf','sdf',NULL,NULL,NULL,'sdf',NULL,NULL,NULL,4,'2016-07-26 03:41:37','2016-07-26 03:45:53'),(5,'asfas','2016-07-07','2016-07-07','2016-07-07','2016-07-07','2016-07-07',1,'dfdasfsaf','asdf','asdfasdf',NULL,NULL,NULL,'asf','2016-07-07','2016-07-07','2016-07-07',4,'2016-07-26 04:38:52','2016-07-26 04:38:52'),(6,'asdf','2016-07-05','2016-07-05','2016-07-26','2016-07-14','2016-07-26',1,NULL,'sdfsdf','sdf','2016-07-06',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 05:08:40','2016-07-26 05:08:40'),(7,'TUGAS','2016-07-07','2016-07-12','2016-07-12','2016-07-12','2016-07-25',3,'sdfPENGAWASAN','JUDUL','NOMOR','2016-06-29','PPK','KEGIATAN',NULL,NULL,NULL,NULL,4,'2016-07-26 05:12:15','2016-07-26 05:12:15'),(8,'TUGAS','2016-07-07','2016-07-12','2016-07-12','2016-07-12','2016-07-25',3,'sdfPENGAWASAN','JUDUL','NOMOR','2016-06-29','PPK','KEGIATAN','PERPANJANGAN','2016-07-07','2016-07-07','2016-07-07',4,'2016-07-26 05:12:46','2016-07-26 05:12:46'),(9,'TUGAS','2016-07-07','2016-07-12','2016-07-12','2016-07-12','2016-07-25',3,'sdfPENGAWASAN','JUDUL','NOMOR','2016-06-29','PPK','KEGIATAN','PERPANJANGAN','2016-07-05','2016-07-05','2016-07-12',4,'2016-07-26 05:14:33','2016-07-26 05:14:33'),(10,'TUGAS','2016-07-07','2016-07-12','2016-07-12','2016-07-12','2016-07-25',3,'PENGAWASAN','JUDUL','NOMOR','2016-06-29','PPK','KEGIATAN','PERPANJANGAN','2016-07-07','2016-07-07','2016-07-07',4,'2016-07-26 05:14:53','2016-07-27 06:37:02'),(11,'dsf','2016-07-07','2016-07-07','2016-07-07','2016-07-07','2016-07-07',1,NULL,'sdfsdf','sdfsdf','2016-06-27',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 06:25:56','2016-07-26 06:25:56'),(12,'dsf','2016-07-07','2016-07-07','2016-07-07','2016-07-07','2016-07-07',2,NULL,'hhgkihjkghjk','sdfsdf','2016-06-27',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 06:26:20','2016-07-26 06:26:20'),(13,NULL,'2016-07-07','2016-07-07','2016-07-07','2016-07-07','2016-07-07',1,NULL,'sdfd',NULL,'2016-07-07',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 06:28:30','2016-07-26 06:28:30'),(14,'sdfsdf','2016-07-26','2016-06-27','2016-07-12','2016-07-14','2016-07-11',1,'sdfsdf','sdf','qwewqewqe','2016-07-26',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 07:32:23','2016-07-26 07:32:23'),(15,'sdfsd','2016-07-26','2016-07-26','2016-07-26','2016-07-26','2016-07-26',1,'sd','sd','sdfs','2016-07-26','sd',NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 07:42:01','2016-07-26 07:42:01'),(16,'sdfsd','2016-07-26','2016-07-26','2016-07-26','2016-07-26','2016-07-26',1,'sd','sd','sdfs','2016-07-26','sd',NULL,NULL,NULL,NULL,NULL,4,'2016-07-26 07:42:50','2016-07-26 07:42:50'),(17,'sdfsdf','2016-07-12','2016-07-06','2016-07-13','2016-07-26','2016-07-05',1,'kg','tdxghf','jhfhf','2016-07-26','jkgj','h',NULL,NULL,NULL,NULL,4,'2016-07-26 13:43:04','2016-07-26 13:43:04'),(18,'asdfsdf','2016-07-15','2016-07-12','2016-07-11','2016-07-12','2016-07-12',1,'sdfsdf','judul haidar','sdfsdf','2016-07-27',NULL,NULL,'sdf','2016-07-14','2016-07-05','2016-07-11',4,'2016-07-29 11:27:36','2016-07-29 11:27:36'),(19,'sdfsf','2016-07-12','2016-07-19','2016-07-20','2016-07-14','2016-07-18',1,'sdf','atang test','23423424','2016-07-29',NULL,NULL,'sdfsdf','2016-07-12','2016-07-26','2016-07-26',4,'2016-07-29 13:48:52','2016-07-29 13:48:52'),(20,'sfdsf','2016-07-15','2016-07-06','2016-07-12','2016-07-06','2016-07-21',1,'sdfsdf','bismillah haidar','sdfdsf','2016-07-30',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 17:58:57','2016-07-29 17:58:57'),(21,'123','2016-07-30','2016-07-20','2016-07-13','2016-07-13','2016-07-19',1,'sdfsdf','bismillah tim','sfdsdf','2016-07-06',NULL,NULL,'sdf','2016-07-12','2016-07-05','2016-07-03',4,'2016-07-29 19:09:30','2016-07-29 19:09:30'),(22,'dfgdfgdfg','2016-07-30','2016-07-13','2016-07-26','2016-06-29','2016-06-27',1,'sdfsdf','bismilah ke 2','sdfsdfsf','1970-01-01',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 19:18:00','2016-07-29 19:18:00'),(23,'sf','2016-07-30','2016-07-30','2016-07-30','2016-07-30','2016-07-30',1,'sdf','bismilah ke 3','123','2016-07-09',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 19:21:06','2016-07-29 19:21:06'),(24,'sdfsdf','2016-07-23','2016-07-30','2016-07-12','2016-07-30','2016-07-30',1,'s','bismilah ke 4','123','2016-07-30',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 19:27:01','2016-07-29 19:27:01'),(25,'sdfsdf','2016-07-30','2016-07-30','2016-07-30','2016-07-30','2016-07-30',1,'vcb','bismilah ke 5','sfsf','2016-07-30',NULL,NULL,NULL,NULL,NULL,NULL,4,'2016-07-29 19:29:38','2016-07-29 19:29:38'),(26,'NOMOR SURAT TUGAS*','2016-08-02','2016-08-02','2016-08-02','2016-08-02','2016-08-02',3,'PENGAWASAN','JUDUL LHP haidar','123123132','2016-08-13',NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-08-02 04:05:36','2016-08-02 04:05:36');
/*!40000 ALTER TABLE `tlhp_orix_lhp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_persetujuan_tl`
--

DROP TABLE IF EXISTS `tlhp_orix_persetujuan_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_persetujuan_tl` (
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
  KEY `fk_orix_persetujuan_tl` (`tindak_lanjut_id`),
  CONSTRAINT `fk_orix_persetujuan_tl` FOREIGN KEY (`tindak_lanjut_id`) REFERENCES `tlhp_orix_tindak_lanjut` (`tindak_lanjut_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_persetujuan_tl`
--

LOCK TABLES `tlhp_orix_persetujuan_tl` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_persetujuan_tl` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_orix_persetujuan_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_rekomendasi`
--

DROP TABLE IF EXISTS `tlhp_orix_rekomendasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_rekomendasi` (
  `rekomendasi_id` int(11) NOT NULL AUTO_INCREMENT,
  `kertas_kerja_id` int(10) NOT NULL,
  `kode_rekomendasi_id` int(4) DEFAULT NULL,
  `uraian_rekomendasi` varchar(500) DEFAULT NULL,
  `kerugian_negara` tinyint(1) DEFAULT NULL,
  `nilai_rekomendasi` double DEFAULT NULL,
  `unit_kerja_id` mediumint(3) NOT NULL,
  `nama_ppk` varchar(500) DEFAULT NULL,
  `nama_pj` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`rekomendasi_id`),
  KEY `fk_orix_kode_rekomen` (`kode_rekomendasi_id`),
  KEY `fk_orix_rekomen_kk` (`kertas_kerja_id`),
  CONSTRAINT `fk_orix_kode_rekomen` FOREIGN KEY (`kode_rekomendasi_id`) REFERENCES `tlhp_orix_kode_rekomendasi` (`kode_rekomendasi_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_orix_rekomen_kk` FOREIGN KEY (`kertas_kerja_id`) REFERENCES `tlhp_orix_kertas_kerja_temuan` (`kertas_kerja_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_rekomendasi`
--

LOCK TABLES `tlhp_orix_rekomendasi` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_rekomendasi` DISABLE KEYS */;
INSERT INTO `tlhp_orix_rekomendasi` VALUES (1,3,7,'123',1,123213,0,NULL,NULL),(2,3,7,'123',1,12312,0,NULL,NULL),(3,3,8,'sdfsdf',1,12313,0,NULL,NULL),(9,8,6,'uraian rek 1',1,22222,0,NULL,NULL),(15,13,6,'uraian rek 1',2,456,0,NULL,NULL),(16,13,6,'uraian rek 1',1,456,0,NULL,NULL),(17,13,7,'uraian rek 2',2,0,0,NULL,NULL),(18,14,12,'uraian rek 2-1',1,999,0,NULL,NULL),(19,14,8,'sdf',1,0,0,NULL,NULL),(20,14,9,'sdf',1,0,0,NULL,NULL),(21,14,8,'sdf',1,123,0,NULL,NULL),(22,14,9,'sdf',1,4545,0,NULL,NULL),(25,16,8,'uraian rek 1',2,123,0,NULL,NULL);
/*!40000 ALTER TABLE `tlhp_orix_rekomendasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_template_laporan`
--

DROP TABLE IF EXISTS `tlhp_orix_template_laporan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_template_laporan` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_template_laporan`
--

LOCK TABLES `tlhp_orix_template_laporan` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_template_laporan` DISABLE KEYS */;
INSERT INTO `tlhp_orix_template_laporan` VALUES (1,'sdfsdf','sdf','sdfsdf','0000-00-00','<p>ssdfsd</p>','<p>sdfsdf</p>',0,'2016-07-29 19:50:15','2016-07-29 19:50:15'),(2,'sdfghjghjghjgjghjghj','bcvbcvb','cvbcvb','2016-07-31','\r\ndfgfdg\r\n\r\n','\r\ndfgdfgdfgdfgdfgdfg\r\n\r\n',5,'2016-07-31 09:50:28','2016-07-31 09:50:28'),(3,'vbnvbn','vbnvbnvb','bnvbnvbnvbn','2016-08-02','<p>vbnvbnvbngfhfghgfh</p>','<p>bvnvbnvbngfhfghfgh</p>',0,'2016-08-01 18:45:01','2016-08-01 18:45:01');
/*!40000 ALTER TABLE `tlhp_orix_template_laporan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_template_laporan_media`
--

DROP TABLE IF EXISTS `tlhp_orix_template_laporan_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_template_laporan_media` (
  `id_template_laporan_media` int(11) NOT NULL AUTO_INCREMENT,
  `template_laporan_id` int(11) DEFAULT NULL,
  `upload_template_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_template_laporan_media`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_template_laporan_media`
--

LOCK TABLES `tlhp_orix_template_laporan_media` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_template_laporan_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_orix_template_laporan_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_tim`
--

DROP TABLE IF EXISTS `tlhp_orix_tim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_tim` (
  `tim_id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_tim` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`tim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_tim`
--

LOCK TABLES `tlhp_orix_tim` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_tim` DISABLE KEYS */;
INSERT INTO `tlhp_orix_tim` VALUES (1,'PEMBANTU PJ'),(2,'PENGENDALI MUTU'),(3,'PENGENDALI TEKNIS'),(4,'KETUA TIM'),(5,'ANGGOTA');
/*!40000 ALTER TABLE `tlhp_orix_tim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_tim_lhp`
--

DROP TABLE IF EXISTS `tlhp_orix_tim_lhp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_tim_lhp` (
  `tim_lhp_id` int(11) NOT NULL AUTO_INCREMENT,
  `lhp_id` int(11) NOT NULL,
  `kategory_tim` enum('biasa','perpanjangan') DEFAULT NULL,
  `tim_id` int(11) NOT NULL,
  `nama_tim` varchar(500) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tim_lhp_id`),
  KEY `fk_orix_tim_id` (`tim_id`),
  KEY `fk_orix_tim_lhp` (`lhp_id`),
  CONSTRAINT `fk_orix_tim_id` FOREIGN KEY (`tim_id`) REFERENCES `tlhp_orix_tim` (`tim_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_orix_tim_lhp` FOREIGN KEY (`lhp_id`) REFERENCES `tlhp_orix_lhp` (`lhp_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_tim_lhp`
--

LOCK TABLES `tlhp_orix_tim_lhp` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_tim_lhp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_orix_tim_lhp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_tindak_lanjut`
--

DROP TABLE IF EXISTS `tlhp_orix_tindak_lanjut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_tindak_lanjut` (
  `tindak_lanjut_id` int(10) NOT NULL AUTO_INCREMENT,
  `tindak_lanjut` varchar(500) DEFAULT NULL,
  `rekomendasi_id` int(11) NOT NULL,
  `nilai` double DEFAULT NULL,
  `nilai_disetujui` double DEFAULT NULL,
  `saldo_rekomendasi` double DEFAULT NULL,
  `approval_status` enum('approved','rejected') DEFAULT NULL,
  `status_tl` tinyint(1) DEFAULT NULL,
  `tanggal_tl` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `rejected_by` int(11) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tindak_lanjut_id`),
  KEY `fk_orix_tl_kk_idx` (`rekomendasi_id`),
  KEY `fk_orix_tl_user` (`created_by`),
  CONSTRAINT `fk_orix_tl_rekomen` FOREIGN KEY (`rekomendasi_id`) REFERENCES `tlhp_orix_rekomendasi` (`rekomendasi_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_orix_tl_user` FOREIGN KEY (`created_by`) REFERENCES `tlhp_orix_user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_tindak_lanjut`
--

LOCK TABLES `tlhp_orix_tindak_lanjut` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_tindak_lanjut` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_orix_tindak_lanjut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_unit_kerja`
--

DROP TABLE IF EXISTS `tlhp_orix_unit_kerja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_unit_kerja` (
  `unit_kerja_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `unit_kerja` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`unit_kerja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_unit_kerja`
--

LOCK TABLES `tlhp_orix_unit_kerja` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_unit_kerja` DISABLE KEYS */;
INSERT INTO `tlhp_orix_unit_kerja` VALUES (1,'DEPUTI I'),(2,'DEPUTI II'),(3,'DEPUTI III'),(4,'DEPUTI IV'),(5,'STAF AHLI'),(6,'INSPEKTORAT'),(7,'BIRO SDMU'),(8,'BIRO HUKIP'),(9,'BIRO MKOK'),(10,'KASN');
/*!40000 ALTER TABLE `tlhp_orix_unit_kerja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_upload_lhp`
--

DROP TABLE IF EXISTS `tlhp_orix_upload_lhp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_upload_lhp` (
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
  KEY `fk_orix_upload_lhp` (`lhp_id`),
  CONSTRAINT `fk_orix_upload_lhp` FOREIGN KEY (`lhp_id`) REFERENCES `tlhp_orix_lhp` (`lhp_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_upload_lhp`
--

LOCK TABLES `tlhp_orix_upload_lhp` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_upload_lhp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_orix_upload_lhp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_upload_template_laporan`
--

DROP TABLE IF EXISTS `tlhp_orix_upload_template_laporan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_upload_template_laporan` (
  `upload_template_id` int(10) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(500) DEFAULT NULL,
  `ext` varchar(500) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `url` varchar(2000) DEFAULT NULL,
  `path` varchar(2000) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`upload_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_upload_template_laporan`
--

LOCK TABLES `tlhp_orix_upload_template_laporan` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_upload_template_laporan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_orix_upload_template_laporan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_upload_tl`
--

DROP TABLE IF EXISTS `tlhp_orix_upload_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_upload_tl` (
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
  KEY `fk_orix_upload_tl` (`tindak_lanjut_id`),
  CONSTRAINT `fk_orix_upload_tl` FOREIGN KEY (`tindak_lanjut_id`) REFERENCES `tlhp_orix_tindak_lanjut` (`tindak_lanjut_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_upload_tl`
--

LOCK TABLES `tlhp_orix_upload_tl` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_upload_tl` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlhp_orix_upload_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_user`
--

DROP TABLE IF EXISTS `tlhp_orix_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_user` (
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
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `activation_key` varchar(200) DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `fk_orix_user_level` (`user_level_id`),
  KEY `fk_orix_user_unit_kerja` (`unit_kerja_id`),
  CONSTRAINT `fk_orix_user_level` FOREIGN KEY (`user_level_id`) REFERENCES `tlhp_orix_user_level` (`user_level_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orix_user_unit_kerja` FOREIGN KEY (`unit_kerja_id`) REFERENCES `tlhp_orix_unit_kerja` (`unit_kerja_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_user`
--

LOCK TABLES `tlhp_orix_user` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_user` DISABLE KEYS */;
INSERT INTO `tlhp_orix_user` VALUES (4,'asdf','asdfsdf','sadf','sadf','asdf','1231231','12',2,10,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-24 12:40:42','2016-08-02 03:33:17'),(5,'admin','1acf7bbc7ac25ef584552fdb1314ebda','cvbcvb','sdf','haidarvm','324324','sdfsdfdsf',1,1,'',NULL,NULL,NULL,NULL,NULL,NULL,'343',NULL,1,NULL,NULL,NULL,'2016-07-24 12:41:06','2016-08-02 03:33:17'),(7,'agus','sadfdsf',NULL,NULL,'agus','asdf','sfd',3,1,'asdf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-27 03:21:39','2016-08-02 03:33:17'),(8,'dinijul',NULL,NULL,NULL,'dini juliani','2343','inspectorat',1,2,'dini',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-28 11:39:18','2016-08-02 03:33:17'),(10,'aldo','9d1ec50ba9ceb580b76d015dbd49c17e',NULL,NULL,'aldo siregar','23422','UI developer',3,3,'sdf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-28 14:05:39','2016-08-02 03:33:17'),(11,'rara','haitech',NULL,NULL,'rara','12312','3sdfsdf',3,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:17:24','2016-08-02 03:33:17'),(12,'vcbcvb','haidar',NULL,NULL,'vcbvcbcvb','cvbcvb','cvcvbcvb',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:07','2016-08-02 03:33:17'),(13,'yuiuyiuyi','haidar',NULL,NULL,'jkhjk','cvbcvb','cvcvbcvb',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:14','2016-08-02 03:33:17'),(14,'rt45','haidar',NULL,NULL,'jkhjkh,.,m.','cvbcvb','cvcvbcvb',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:20','2016-08-02 03:33:17'),(15,'rt45','haidar',NULL,NULL,'hjkjhkjhkh67','cvbcvb','cvcvbcvbgfhfgh',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:29','2016-08-02 03:33:17'),(16,'iniloh',NULL,NULL,NULL,'iniloh','cvbcvbgh','bbnm',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:36','2016-08-02 03:33:17'),(17,'siapasih',NULL,NULL,NULL,'siapa sih ?','cvbcvbgh','bbnm',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-07-31 13:38:55','2016-08-02 03:33:17'),(18,'haidartech','haidartech',NULL,NULL,'haidartech','haidartech','haidartech',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 17:19:53','2016-08-02 03:33:17'),(19,'haidartech','haidartech',NULL,NULL,'haidartech','haidartech','haidartech',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 17:19:53','2016-08-02 03:33:17'),(37,'cvbvcb','cvb',NULL,NULL,'cvbvcb','cvb','vcbcv',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:47:50','2016-08-02 03:33:17'),(38,'dendi','dendi',NULL,NULL,'dendi','dendi','dendi',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:48:12','2016-08-02 03:33:17'),(39,'ria','d42a9ad09e9778b177d409f5716ac621',NULL,NULL,'ria','ria','ria',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:50:12','2016-08-02 03:33:17'),(40,'dony','77ee6d05b23e742e2aca3fd602f4c599',NULL,NULL,'dony','dony','dony',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:54:28','2016-08-02 03:33:17'),(41,'dony','77ee6d05b23e742e2aca3fd602f4c599',NULL,NULL,'dony','dony','dony',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:54:52','2016-08-02 03:33:17'),(42,'dony','77ee6d05b23e742e2aca3fd602f4c599',NULL,NULL,'dony','dony','dony',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:55:27','2016-08-02 03:33:17'),(43,'ruly','ee7ec63dd0e87cf4e43b288b306ca206',NULL,NULL,'ruly','ruly','ruly',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:55:44','2016-08-02 03:33:17'),(44,'helmi','cf3750951241a8cf90e2a0fb0af63fe2',NULL,NULL,'helmi','helmi','helmi',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:57:28','2016-08-02 03:33:17'),(45,'sdfsdf','d58e3582afa99040e27b92b13c8f2280',NULL,NULL,'sdfsdf','sdfsdf','sdfsdf',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:58:55','2016-08-02 03:33:17'),(46,'sdfsdf','d58e3582afa99040e27b92b13c8f2280',NULL,NULL,'sdfsdf','sdfsdf','sdfsdf',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:59:01','2016-08-02 03:33:17'),(47,'sdfsdf','d58e3582afa99040e27b92b13c8f2280',NULL,NULL,'sdfsdf','sdfsdf','sdfsdf',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:59:03','2016-08-02 03:33:17'),(48,'sadf','c7d48bbf2b960adc10b0aba11bf336a5',NULL,NULL,'fsafsad','sdfas','fas',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2016-08-01 19:59:47','2016-08-02 03:33:17');
/*!40000 ALTER TABLE `tlhp_orix_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_user_history`
--

DROP TABLE IF EXISTS `tlhp_orix_user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_user_history` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `login` datetime NOT NULL,
  `logout` datetime DEFAULT NULL,
  `total_use` time DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `fk_orix_user_history` (`user_id`),
  CONSTRAINT `fk_orix_user_history` FOREIGN KEY (`user_id`) REFERENCES `tlhp_orix_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_user_history`
--

LOCK TABLES `tlhp_orix_user_history` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_user_history` DISABLE KEYS */;
INSERT INTO `tlhp_orix_user_history` VALUES (1,5,'2016-07-28 15:38:08',NULL,NULL),(2,5,'2016-07-28 15:38:38','2016-07-28 15:39:03',NULL),(3,5,'2016-07-28 15:41:37','2016-07-28 15:43:23',NULL),(4,5,'2016-07-28 15:47:44','2016-07-28 15:59:15',NULL),(5,5,'2016-07-28 16:03:44','2016-07-28 16:03:49',NULL),(6,5,'2016-07-28 16:03:56','2016-07-28 16:17:10',NULL),(7,8,'2016-07-28 16:17:24','2016-07-28 16:18:10',NULL),(8,5,'2016-07-28 16:18:55','2016-07-28 16:21:13',NULL),(9,8,'2016-07-28 16:21:19','2016-07-28 16:22:26',NULL),(10,5,'2016-07-28 16:22:36','2016-07-28 16:22:42',NULL),(11,5,'2016-07-28 16:22:48','2016-07-28 17:18:50',NULL),(12,10,'2016-07-28 17:19:01','2016-07-28 17:19:53',NULL),(13,5,'2016-07-28 17:28:11','2016-07-28 17:28:46',NULL),(14,5,'2016-07-28 17:29:40','2016-07-28 18:07:22',NULL),(15,5,'2016-07-28 18:37:08',NULL,NULL),(16,5,'2016-07-29 00:50:27','2016-07-29 00:51:51',NULL),(17,11,'2016-07-29 01:15:53','2016-07-29 03:04:32',NULL),(18,5,'2016-07-29 03:04:37','2016-07-29 13:07:12',NULL),(19,5,'2016-07-29 13:07:31','2016-07-29 13:24:12',NULL),(20,5,'2016-07-29 13:37:24',NULL,NULL),(21,41,'2016-07-30 02:35:23',NULL,NULL),(22,5,'2016-07-31 17:02:22','2016-07-31 18:03:19',NULL),(23,5,'2016-07-31 20:46:44',NULL,NULL),(24,5,'2016-08-01 07:00:59',NULL,NULL),(25,5,'2016-08-01 10:14:17','2016-08-01 10:26:54',NULL),(26,5,'2016-08-01 10:26:59','2016-08-01 10:39:57',NULL),(27,5,'2016-08-01 10:40:02','2016-08-01 10:45:13',NULL),(28,14,'2016-08-01 11:48:30','2016-08-01 11:50:54',NULL),(29,5,'2016-08-01 11:51:49','2016-08-01 11:54:22',NULL),(30,5,'2016-08-01 11:54:30','2016-08-01 12:00:51',NULL),(31,48,'2016-08-01 12:02:20','2016-08-01 12:07:27',NULL),(32,5,'2016-08-01 12:08:25','2016-08-01 12:08:55',NULL),(33,5,'2016-08-01 12:09:02','2016-08-01 12:09:15',NULL),(34,11,'2016-08-01 12:11:08','2016-08-01 17:07:08',NULL),(35,5,'2016-08-01 12:11:31','2016-08-01 14:24:35',NULL),(36,5,'2016-08-01 12:12:30','2016-08-01 12:12:49',NULL),(37,5,'2016-08-01 12:12:57','2016-08-01 12:26:45',NULL),(38,10,'2016-08-01 17:07:52','2016-08-01 19:07:15',NULL),(39,10,'2016-08-01 19:07:25','2016-08-01 19:12:57',NULL),(40,5,'2016-08-01 23:10:37','2016-08-01 23:38:00',NULL),(41,5,'2016-08-02 00:17:12','2016-08-02 01:29:11',NULL),(42,5,'2016-08-02 01:29:19','2016-08-02 02:27:49',NULL),(43,5,'2016-08-02 02:28:02','2016-08-02 03:30:52',NULL),(44,5,'2016-08-02 03:30:58',NULL,NULL),(45,5,'2016-08-02 06:24:58','2016-08-02 07:51:05',NULL),(46,5,'2016-08-02 07:52:36','2016-08-02 08:20:45',NULL),(47,5,'2016-08-02 08:20:50','2016-08-02 11:41:34',NULL),(48,5,'2016-08-02 11:41:40',NULL,NULL);
/*!40000 ALTER TABLE `tlhp_orix_user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlhp_orix_user_level`
--

DROP TABLE IF EXISTS `tlhp_orix_user_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlhp_orix_user_level` (
  `user_level_id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `user_level` varchar(200) NOT NULL,
  PRIMARY KEY (`user_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_orix_user_level`
--

LOCK TABLES `tlhp_orix_user_level` WRITE;
/*!40000 ALTER TABLE `tlhp_orix_user_level` DISABLE KEYS */;
INSERT INTO `tlhp_orix_user_level` VALUES (1,'super admin'),(2,'admin'),(3,'user');
/*!40000 ALTER TABLE `tlhp_orix_user_level` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-14 18:58:26
