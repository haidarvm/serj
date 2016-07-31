DROP TABLE IF EXISTS `tlhp_rekomendasi`;
CREATE TABLE `tlhp_rekomendasi` (
  `rekomendasi_id` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `kertas_kerja_id` int(10) NOT NULL AUTO_INCREMENT,
  `kode_rekomendasi_id` int(4) DEFAULT NULL,
  `uraian_rekomendasi` varchar(500) DEFAULT NULL,
  `kerugian_negara` tinyint(1) DEFAULT NULL,
  `nilai_rekomendasi` double DEFAULT NULL,
  PRIMARY KEY (`rekomendasi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;