-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2016 at 02:02 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e4`
--

-- --------------------------------------------------------

--
-- Table structure for table `tlhp_bpkp_kode_rekomendasi`
--

CREATE TABLE `tlhp_bpkp_kode_rekomendasi` (
  `kode_rekomendasi_id` int(10) NOT NULL,
  `kode_rekomendasi` varchar(10) DEFAULT NULL,
  `uraian_rekomendasi` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tlhp_bpkp_kode_rekomendasi`
--

INSERT INTO `tlhp_bpkp_kode_rekomendasi` (`kode_rekomendasi_id`, `kode_rekomendasi`, `uraian_rekomendasi`) VALUES
(6, '00', 'KODE REKOMENDASI'),
(7, '01', 'Penyetoran ke kas negara/daerah, kas BUMN/D, dan masyararakat'),
(8, '02', 'Pengembalian barang kepada negara, daerah, BUMN/D, dan masyarakat'),
(9, '03', 'Perbaikan fisik barang/jasa dalam proses pembangunan atau penggantian barang/jasa oleh rekanan'),
(10, '04', 'Penghapusan barang milik negara/daerah'),
(11, '05', 'Pelaksanaan sanksi administrasi kepegawaian'),
(12, '06', 'Perbaikan laporan dan penertiban administrasi/kelengkapan administrasi'),
(13, '07', 'Perbaikan sistem dan prosedur akuntansi dan pelaporan'),
(14, '08', 'Peningkatan kualitas dan kuantitas sumber daya manusia pendukung sistem pengendalian'),
(15, '09', 'Perubahan atau perbaikan prosedur, peraturan dan kebijakan'),
(16, '10', 'Perubahan atau perbaikan struktur organisasi'),
(17, '11', 'Koordinasi antar instansi termasuk juga penyerahan penanganan kasus kepada instansi yang berwenang'),
(18, '12', 'Pelaksanaan penelitian oleh tim khusus atau audit lanjutan oleh unit pengawas intern'),
(19, '13', 'Pelaksanaan sosialisasi'),
(20, '14', 'Lain-lain');

-- --------------------------------------------------------

--
-- Table structure for table `tlhp_bpkp_kode_sebab`
--

CREATE TABLE `tlhp_bpkp_kode_sebab` (
  `kode_sebab_id` int(10) NOT NULL,
  `kode_sebab_group` tinyint(3) DEFAULT NULL,
  `kode_sebab` varchar(10) DEFAULT NULL,
  `uraian_sebab` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tlhp_bpkp_kode_sebab`
--

INSERT INTO `tlhp_bpkp_kode_sebab` (`kode_sebab_id`, `kode_sebab_group`, `kode_sebab`, `uraian_sebab`) VALUES
(2, 0, '0', 'Penyebab lain yang belum didefinisikan (nihil)'),
(3, 1, '100', 'KELEMAHAN PENGAWASAN MELEKAT'),
(4, 1, '101', 'Pembagian wewenang dalam organisasi belum cukup jauh sehingga masih terdapat transaksi atau kegiatan organisasi yang seluruh tahapnya dikuasai oleh satu orang'),
(5, 1, '102', 'Pembagian wewenang dalam organisasi belum cukup jelas sehingga ada kegiatan atau kejadian dalam organisasi yang tidak jelas penanggungjawabnya'),
(6, 1, '103', 'Dalam organisasi tidak ada pembagian wewenang dan tugas'),
(7, 1, '104', 'Kelalaian pejabat yang berwenang'),
(8, 1, '105', 'Kelemahan lain organisasi'),
(9, 2, '200', 'KELEMAHAN DALAM KEBIJAKAN/ KEBIJAKSANAAN'),
(10, 2, '201', 'Kebijakan yang berlaku tidak jelas bagi para bawahan'),
(11, 2, '202', 'Kebijakan yang berlaku tidak dapat menjadi pedoman yang pasti bagi para bawahan'),
(12, 2, '203', 'Kebijaksanaan yang berlaku tidak dikomunikasikan secara lisan maupun tertulis'),
(13, 2, '204', 'Tidak ada kebijakan yang digariskan'),
(14, 2, '205', 'Kelemahan lain kebijakan'),
(15, 2, '206', 'Kebijakan tidak sejalan/bertentangan dengan ketentuan yang lebih tinggi'),
(16, 3, '300', 'KELEMAHAN DALAM RENCANA'),
(17, 3, '301', 'Rencana kerja yang disusun tidak cukup luas sehingga belum mencakup seluruh kegiatan yang perlu dilaksanakan'),
(18, 3, '302', 'Hubungan kerja di antara kegiatan-kegiatan yang direncanakan tidak jelas dirumuskan sehingga tidak ada koordinasi di antara kegiatan-kegiatan itu'),
(19, 3, '303', 'Sasaran yang akan dicapai tidak cukup jelas dirumuskan'),
(20, 3, '304', 'Sasaran yang akan dicapai tidak cukup dikuantifikasikan'),
(21, 3, '305', 'Tidak dibuat anggaran yang merupakan kuantifikasi moneter rencana kegiatan dan sasaran yang akan dicapai'),
(22, 3, '306', 'Tidak ada rencana kegiatan'),
(23, 3, '307', 'Rencana kegiatan tidak cukup realistis'),
(24, 3, '308', 'Anggaran tidak cukup realistis'),
(25, 3, '309', 'Kelemahan lain perencanaan'),
(26, 3, '310', 'Perencanaan tidak matang'),
(27, 4, '400', 'KELEMAHAN DALAM PROSEDUR'),
(28, 4, '401', 'Prosedur yang ada tidak konsisten dengan kebijaksanaan yang perlu dilaksanakan'),
(29, 4, '402', 'Prosedur yang berlaku disalahtafsirkan oleh pegawai sehingga menyimpang dari tujuannya'),
(30, 4, '403', 'Prosedur yang berlaku tidak dimengerti sehingga tidak dilaksanakan'),
(31, 4, '404', 'Prosedur yang berlaku terlalu mahal dibandingkan dengan sesuatu yang harus dijaga sehingga tidak dilaksanakan'),
(32, 4, '405', 'Prosedur yang berlaku kurang terinci'),
(33, 4, '406', 'Prosedur yang berlaku tidak dapat menjadi pegangan bawahan karena tidak tertulis'),
(34, 4, '407', 'Prosedur yang berlaku tidak dikomunikasikan secara tertulis maupun lisan'),
(35, 4, '408', 'Tidak terdapat prosedur yang diperlukan'),
(36, 4, '409', 'Kelemahan lain prosedur'),
(37, 5, '500', 'KELEMAHAN DALAM PENCATATAN DAN PELAPORAN'),
(38, 5, '501', 'Pencatatan tidak diselenggarakan secara cermat sehingga kehilangan keadaannya'),
(39, 5, '502', 'Pencatatan tidak dimutakhirkan sehingga kehilangan peranannya sebagai alat pengawasan/pengendalian'),
(40, 5, '503', 'Pencatatan tidak memenuhi kebutuhan informasi untuk pengambilan keputusan sehari-hari'),
(41, 5, '504', 'Tidak diselenggarakan pencatatan yang perlu'),
(42, 5, '505', 'Pelaporan tidak tepat waktu'),
(43, 5, '506', 'Pelaporan tidak disusun dengan cermat'),
(44, 5, '507', 'Pelaporan tidak disusun memenuhi kebutuhan pimpinan'),
(45, 5, '508', 'Pelaporan disusun dengan biaya mahal'),
(46, 5, '509', 'Pelaporan yang diperlukan tidak ada'),
(47, 5, '510', 'Kelemahan lain pencatatan atau pelaporan'),
(48, 6, '600', 'KELEMAHAN DALAM PEMBINAAN PERSONIL'),
(49, 6, '601', 'Pegawai kurang mendapatkan supervisi (pengawasan) yang diperlukan (termasuk tidak dilakukan pemeriksaan kas bendaharawan oleh atasan langsung dan pemeriksaan fisik atas inventaris atau pers'),
(50, 6, '602', 'Supervisor tidak menyadari siapa yang harus diawasi dan apa yang harus diawasi'),
(51, 6, '603', 'Penugasan/penempatan pegawai tidak tepat/sesuai dengan latar belakang pendidikan '),
(52, 6, '604', 'Kelemahan lain pembinaan personil'),
(53, 7, '700', 'KELEMAHAN DALAM PENGAWASAN INTERN (INTERNAL REVIEW)'),
(54, 7, '701', 'Tidak ada satuan kerja atau pejabat yang diberi tanggung jawab untuk mengecek jalannya sistem dan prosedur yang telah ditetapkan'),
(55, 7, '702', 'Satuan kerja atau pejabat yang diberi tanggung jawab menguji jalannya sistem dan prosedur tidak berfungsi dengan baik'),
(56, 7, '703', 'Kelemahan lain pengkajian intern'),
(57, 8, '800', 'KELEMAHAN PENGAWASAN TERHADAP REKANAN'),
(58, 8, '801', 'Kelemahan Pengawasan Pemimpin Proyek'),
(59, 8, '802', 'Kelemahan Pengawasan Pimpinan Satker'),
(60, 9, '900', 'PENYEBAB EKSTERN HAMBATAN KELANCARAN PROYEK'),
(61, 9, '901', 'Pekerjaan persiapan proyek dan perumusan proyek kurang mantap (survei dan disain tidak mantap)'),
(62, 9, '902', 'DIP terlambat diterima proyek'),
(63, 9, '903', 'Revisi DIP yang diajukan pemimpin proyek penyelesaiannya menjadi berlarut-larut'),
(64, 9, '904', 'Tanah yang diperlukan proyek penyelesaiannya menjadi berlarut-larut'),
(65, 9, '905', 'Tidak dapat diperoleh tanah yang diperlukan proyek karena dana tidak mencukupi atau tidak tersedia'),
(66, 9, '906', 'Penetapan rekanan menjadi berlarut-larut'),
(67, 9, '907', 'Perijinan atau persetujuan untuk memulai suatu kegiatan proyek menjadi berlarut-larut'),
(68, 9, '908', 'Sarana komunikasi dan atau telekomunikasi tidak mendukung kelancaran proyek'),
(69, 9, '909', 'Rekanan yang ditetapkan tidak mampu menyelesaikan tanggungjawabnya'),
(70, 9, '910', 'Penyebab ekstern hambatan kelancaran proyek lainnya'),
(71, 9, '911', 'Rekanan mempunyai itikad yang kurang baik'),
(72, 10, '1000', 'PENYEBAB EKSTERN HAMBATAN KELANCARAN TUGAS POKOK INSTANSI'),
(73, 10, '1001', 'Instansi lain yang terkait kurang responsif'),
(74, 10, '1002', 'Sarana komunikasi dan atau telekomunikasi tidak mendukung kelancaran tugas instansi'),
(75, 10, '1003', 'Revisi DIK yang diajukan pimpinan instansi penyelesaiannya berlarut-larut'),
(76, 10, '1004', 'Rekanan yang telah ditetapkan tidak mampu menyelesaikan tanggungjawabnya'),
(77, 10, '1005', 'Perijinan atau persetujuan untuk memulai suatu kegiatan instansi menjadi berlarut-larut'),
(78, 10, '1006', 'Penyebab ekstern hambatan kelancaran tupoksi lainnya'),
(79, 10, '1007', 'Pencairan dana pinjaman tidak tepat waktu atau tidak sesuai jadwal kebutuhan'),
(80, 11, '1100', 'PENYEBAB KETIDAKLANCARAN PELAYANAN APARATUR PEMERINTAHAN/  BUMN/BUMD KEPADA MASYARAKAT'),
(81, 11, '1101', 'Prosedur yang ditetapkan belum sederhana'),
(82, 11, '1102', 'Masyarakat buta terhadap persyaratan yang perlu dipenuhi dan prosedur yang harus ditempuh'),
(83, 11, '1103', 'Tidak ada batas waktu maksimum penyelesaian pelayanan'),
(84, 11, '1104', 'Prosedur yang ditetapkan cukup banyak titik pertemuan pegawai dengan masyarakat sehingga membuka peluang pungutan liar'),
(85, 11, '1105', 'Persyaratan yang ditetapkan berlebihan sehingga menyulitkan pemohonan pelayanan'),
(86, 11, '1106', 'Tidak ada koordinasi antar instansi sehingga jelas siapa yang berwenang mengambil keputusan'),
(87, 11, '1107', 'Penyebab lain ketidaklancaran pelayanan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tlhp_bpkp_kode_rekomendasi`
--
ALTER TABLE `tlhp_bpkp_kode_rekomendasi`
  ADD PRIMARY KEY (`kode_rekomendasi_id`);

--
-- Indexes for table `tlhp_bpkp_kode_sebab`
--
ALTER TABLE `tlhp_bpkp_kode_sebab`
  ADD PRIMARY KEY (`kode_sebab_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tlhp_bpkp_kode_rekomendasi`
--
ALTER TABLE `tlhp_bpkp_kode_rekomendasi`
  MODIFY `kode_rekomendasi_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tlhp_bpkp_kode_sebab`
--
ALTER TABLE `tlhp_bpkp_kode_sebab`
  MODIFY `kode_sebab_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
