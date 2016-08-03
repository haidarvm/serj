-- MySQL dump 10.13  Distrib 5.7.13, for Linux (x86_64)
--
-- Host: localhost    Database: e4
-- ------------------------------------------------------
-- Server version	5.7.13-0ubuntu0.16.04.2

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_kertas_kerja_temuan`
--

LOCK TABLES `tlhp_bpkp_kertas_kerja_temuan` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_kertas_kerja_temuan` DISABLE KEYS */;
INSERT INTO `tlhp_bpkp_kertas_kerja_temuan` VALUES (2,19,'',NULL,NULL,'sdf',4,'sdf','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-07-29 17:39:10','2016-08-01 19:45:33'),(3,19,'',NULL,NULL,'sdf',4,'sdf','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-07-29 17:42:11','2016-08-01 19:45:34'),(8,20,'a',NULL,NULL,'ssf',4,'ssfdsfdsf','12313',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-07-29 19:08:22','2016-08-01 19:45:35'),(9,20,'a',NULL,NULL,'ssf',4,'ssfdsfdsf','12313',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-07-29 19:08:22','2016-08-01 19:45:35'),(13,21,'a',NULL,NULL,'uraian temuan 1',5,'uraian sebab 1','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-07-29 19:14:41','2016-08-01 19:45:36'),(14,22,'b',NULL,NULL,'uraian temuan 1',17,'uraian sebab 2','789',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-07-29 19:19:27','2016-08-01 19:45:36'),(16,25,'a',NULL,NULL,'sdf',5,'sfd','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'2016-07-29 19:30:44','2016-08-01 19:45:38');
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
INSERT INTO `tlhp_bpkp_rekomendasi` VALUES (1,3,7,'123',1,123213),(2,3,7,'123',1,12312),(3,3,8,'sdfsdf',1,12313),(9,8,6,'uraian rek 1',1,22222),(15,13,6,'uraian rek 1',2,456),(16,13,6,'uraian rek 1',1,456),(17,13,7,'uraian rek 2',2,0),(18,14,12,'uraian rek 2-1',1,999),(19,14,8,'sdf',1,0),(20,14,9,'sdf',1,0),(21,14,8,'sdf',1,123),(22,14,9,'sdf',1,4545),(25,16,8,'uraian rek 1',2,123);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_template_laporan`
--

LOCK TABLES `tlhp_bpkp_template_laporan` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_template_laporan` DISABLE KEYS */;
INSERT INTO `tlhp_bpkp_template_laporan` VALUES (1,'sdfsdf','sdf','sdfsdf','0000-00-00','<p>ssdfsd</p>','<p>sdfsdf</p>',0,'2016-07-29 19:50:15','2016-07-29 19:50:15'),(2,'sdfghjghjghjgjghjghj','bcvbcvb','cvbcvb','2016-07-31','\r\ndfgfdg\r\n\r\n','\r\ndfgdfgdfgdfgdfgdfg\r\n\r\n',5,'2016-07-31 09:50:28','2016-07-31 09:50:28'),(3,'vbnvbn','vbnvbnvb','bnvbnvbnvbn','2016-08-02','<p>vbnvbnvbngfhfghgfh</p>','<p>bvnvbnvbngfhfghfgh</p>',0,'2016-08-01 18:45:01','2016-08-01 18:45:01');
/*!40000 ALTER TABLE `tlhp_bpkp_template_laporan` ENABLE KEYS */;
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
INSERT INTO `tlhp_bpkp_unit_kerja` VALUES (1,'DEPUTI I'),(2,'DEPUTI II'),(3,'DEPUTI III'),(4,'DEPUTI IV'),(5,'STAF AHLI'),(6,'INSPEKTORAT'),(7,'BIRO SDMU'),(8,'BIRO HUKIP'),(9,'BIRO BKOK'),(10,'KASN');
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_upload_template_laporan`
--

LOCK TABLES `tlhp_bpkp_upload_template_laporan` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_upload_template_laporan` DISABLE KEYS */;
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
  `active` varchar(200) DEFAULT NULL,
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
INSERT INTO `tlhp_bpkp_user` VALUES (4,'asdf','asdfsdf','sadf','sadf','asdf','1231231','12',2,10,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-24 12:40:42','2016-07-31 11:28:28'),(5,'admin','1acf7bbc7ac25ef584552fdb1314ebda','cvbcvb','sdf','haidarvm','324324','sdfsdfdsf',1,1,'',NULL,NULL,NULL,NULL,NULL,NULL,'343',NULL,NULL,NULL,NULL,NULL,'2016-07-24 12:41:06','2016-08-01 20:30:42'),(7,'agus','sadfdsf',NULL,NULL,'agus','asdf','sfd',3,1,'asdf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-27 03:21:39','2016-07-27 03:42:26'),(8,'dinijul',NULL,NULL,NULL,'dini juliani','2343','inspectorat',1,2,'dini',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-28 11:39:18','2016-08-02 00:17:45'),(10,'aldo','9d1ec50ba9ceb580b76d015dbd49c17e',NULL,NULL,'aldo siregar','23422','UI developer',3,3,'sdf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-28 14:05:39','2016-08-01 10:07:46'),(11,'rara','haitech',NULL,NULL,'rara','12312','3sdfsdf',3,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-31 13:17:24','2016-07-31 13:17:24'),(12,'vcbcvb','haidar',NULL,NULL,'vcbvcbcvb','cvbcvb','cvcvbcvb',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-31 13:38:07','2016-07-31 13:38:07'),(13,'yuiuyiuyi','haidar',NULL,NULL,'jkhjk','cvbcvb','cvcvbcvb',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-31 13:38:14','2016-07-31 13:38:14'),(14,'rt45','haidar',NULL,NULL,'jkhjkh,.,m.','cvbcvb','cvcvbcvb',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-31 13:38:20','2016-07-31 13:38:20'),(15,'rt45','haidar',NULL,NULL,'hjkjhkjhkh67','cvbcvb','cvcvbcvbgfhfgh',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-31 13:38:29','2016-07-31 13:38:29'),(16,'iniloh',NULL,NULL,NULL,'iniloh','cvbcvbgh','bbnm',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-31 13:38:36','2016-08-01 03:40:14'),(17,'siapasih',NULL,NULL,NULL,'siapa sih ?','cvbcvbgh','bbnm',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-31 13:38:55','2016-08-01 03:35:21'),(18,'haidartech','haidartech',NULL,NULL,'haidartech','haidartech','haidartech',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-01 17:19:53','2016-08-01 17:19:53'),(19,'haidartech','haidartech',NULL,NULL,'haidartech','haidartech','haidartech',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-01 17:19:53','2016-08-01 17:19:53'),(37,'cvbvcb','cvb',NULL,NULL,'cvbvcb','cvb','vcbcv',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-01 19:47:50','2016-08-01 19:47:50'),(38,'dendi','dendi',NULL,NULL,'dendi','dendi','dendi',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-01 19:48:12','2016-08-01 19:48:12'),(39,'ria','d42a9ad09e9778b177d409f5716ac621',NULL,NULL,'ria','ria','ria',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-01 19:50:12','2016-08-01 19:50:12'),(40,'dony','77ee6d05b23e742e2aca3fd602f4c599',NULL,NULL,'dony','dony','dony',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-01 19:54:28','2016-08-01 19:54:28'),(41,'dony','77ee6d05b23e742e2aca3fd602f4c599',NULL,NULL,'dony','dony','dony',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-01 19:54:52','2016-08-01 19:54:52'),(42,'dony','77ee6d05b23e742e2aca3fd602f4c599',NULL,NULL,'dony','dony','dony',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-01 19:55:27','2016-08-01 19:55:27'),(43,'ruly','ee7ec63dd0e87cf4e43b288b306ca206',NULL,NULL,'ruly','ruly','ruly',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-01 19:55:44','2016-08-01 19:55:44'),(44,'helmi','cf3750951241a8cf90e2a0fb0af63fe2',NULL,NULL,'helmi','helmi','helmi',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-01 19:57:28','2016-08-01 19:57:28'),(45,'sdfsdf','d58e3582afa99040e27b92b13c8f2280',NULL,NULL,'sdfsdf','sdfsdf','sdfsdf',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-01 19:58:55','2016-08-01 19:58:55'),(46,'sdfsdf','d58e3582afa99040e27b92b13c8f2280',NULL,NULL,'sdfsdf','sdfsdf','sdfsdf',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-01 19:59:01','2016-08-01 19:59:01'),(47,'sdfsdf','d58e3582afa99040e27b92b13c8f2280',NULL,NULL,'sdfsdf','sdfsdf','sdfsdf',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-01 19:59:03','2016-08-01 19:59:03'),(48,'sadf','c7d48bbf2b960adc10b0aba11bf336a5',NULL,NULL,'fsafsad','sdfas','fas',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-01 19:59:47','2016-08-01 19:59:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlhp_bpkp_user_history`
--

LOCK TABLES `tlhp_bpkp_user_history` WRITE;
/*!40000 ALTER TABLE `tlhp_bpkp_user_history` DISABLE KEYS */;
INSERT INTO `tlhp_bpkp_user_history` VALUES (1,5,'2016-07-28 15:38:08',NULL,NULL),(2,5,'2016-07-28 15:38:38','2016-07-28 15:39:03',NULL),(3,5,'2016-07-28 15:41:37','2016-07-28 15:43:23',NULL),(4,5,'2016-07-28 15:47:44','2016-07-28 15:59:15',NULL),(5,5,'2016-07-28 16:03:44','2016-07-28 16:03:49',NULL),(6,5,'2016-07-28 16:03:56','2016-07-28 16:17:10',NULL),(7,8,'2016-07-28 16:17:24','2016-07-28 16:18:10',NULL),(8,5,'2016-07-28 16:18:55','2016-07-28 16:21:13',NULL),(9,8,'2016-07-28 16:21:19','2016-07-28 16:22:26',NULL),(10,5,'2016-07-28 16:22:36','2016-07-28 16:22:42',NULL),(11,5,'2016-07-28 16:22:48','2016-07-28 17:18:50',NULL),(12,10,'2016-07-28 17:19:01','2016-07-28 17:19:53',NULL),(13,5,'2016-07-28 17:28:11','2016-07-28 17:28:46',NULL),(14,5,'2016-07-28 17:29:40','2016-07-28 18:07:22',NULL),(15,5,'2016-07-28 18:37:08',NULL,NULL),(16,5,'2016-07-29 00:50:27','2016-07-29 00:51:51',NULL),(17,11,'2016-07-29 01:15:53','2016-07-29 03:04:32',NULL),(18,5,'2016-07-29 03:04:37','2016-07-29 13:07:12',NULL),(19,5,'2016-07-29 13:07:31','2016-07-29 13:24:12',NULL),(20,5,'2016-07-29 13:37:24',NULL,NULL),(21,41,'2016-07-30 02:35:23',NULL,NULL),(22,5,'2016-07-31 17:02:22','2016-07-31 18:03:19',NULL),(23,5,'2016-07-31 20:46:44',NULL,NULL),(24,5,'2016-08-01 07:00:59',NULL,NULL),(25,5,'2016-08-01 10:14:17','2016-08-01 10:26:54',NULL),(26,5,'2016-08-01 10:26:59','2016-08-01 10:39:57',NULL),(27,5,'2016-08-01 10:40:02','2016-08-01 10:45:13',NULL),(28,14,'2016-08-01 11:48:30','2016-08-01 11:50:54',NULL),(29,5,'2016-08-01 11:51:49','2016-08-01 11:54:22',NULL),(30,5,'2016-08-01 11:54:30','2016-08-01 12:00:51',NULL),(31,48,'2016-08-01 12:02:20','2016-08-01 12:07:27',NULL),(32,5,'2016-08-01 12:08:25','2016-08-01 12:08:55',NULL),(33,5,'2016-08-01 12:09:02','2016-08-01 12:09:15',NULL),(34,11,'2016-08-01 12:11:08','2016-08-01 17:07:08',NULL),(35,5,'2016-08-01 12:11:31','2016-08-01 14:24:35',NULL),(36,5,'2016-08-01 12:12:30','2016-08-01 12:12:49',NULL),(37,5,'2016-08-01 12:12:57','2016-08-01 12:26:45',NULL),(38,10,'2016-08-01 17:07:52','2016-08-01 19:07:15',NULL),(39,10,'2016-08-01 19:07:25','2016-08-01 19:12:57',NULL),(40,5,'2016-08-01 23:10:37','2016-08-01 23:38:00',NULL),(41,5,'2016-08-02 00:17:12','2016-08-02 01:29:11',NULL),(42,5,'2016-08-02 01:29:19','2016-08-02 02:27:49',NULL),(43,5,'2016-08-02 02:28:02','2016-08-02 03:30:52',NULL),(44,5,'2016-08-02 03:30:58',NULL,NULL),(45,5,'2016-08-02 06:24:58',NULL,NULL);
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
