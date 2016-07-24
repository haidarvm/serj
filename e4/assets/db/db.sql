CREATE TABLE `tlhp_user` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `full_name` varchar(200) DEFAULT NULL,
  `level_id` tinyint(2) DEFAULT NULL,
  `unit_kerja` tinyint(2) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `address2` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `zip_code` varchar(200) DEFAULT NULL,
  `other_phone` varchar(200) DEFAULT NULL,
  `active` varchar(200) DEFAULT NULL,
  `group` varchar(200) DEFAULT NULL,
  `activation_key` varchar(200) DEFAULT NULL,
  `last_visit` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;	

CREATE TABLE tlhp_lhp (	
lhp_id	int(11) unsigned NOT NULL AUTO_INCREMENT,
no_surat_tugas	varchar(1000) DEFAULT NULL,
tanggal_surat_tugas	varchar(200) DEFAULT NULL,
hari_awal_penugasan	date DEFAULT NULL,
hari_akhir_penugasan	date DEFAULT NULL,
skop_awal_penugasan	varchar(200) DEFAULT NULL,
skop_akhir_penugasan	varchar(200) DEFAULT NULL,
jenis_pengawasan_id	varchar(200) DEFAULT NULL,
objek_pengawasan	varchar(200) DEFAULT NULL,
judul_lhp	varchar(200) DEFAULT NULL,
nomor_lhp	varchar(200) DEFAULT NULL,
tanggal_lhp	date DEFAULT NULL,
nama_ppk	varchar(200) DEFAULT NULL,
penanggung_jawab_keg	varchar(200) DEFAULT NULL,
st_perpanjangan	varchar(200) DEFAULT NULL,
tgl_st_perpanjangan	date DEFAULT NULL,
hari_awal_perpanjangan_penugasan	date DEFAULT NULL,
hari_akhir_perpanjangan_penugasan	date DEFAULT NULL,
user_id	varchar(200) DEFAULT NULL,
create_date	timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
update_date	datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (lhp_id)	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;	

CREATE TABLE tlhp_tim_lhp (		
tim_lhp_id	int(11) unsigned NOT NULL AUTO_INCREMENT,	
lhp_id	int(11) NOT NULL,	
kategory_tim	enum('biasa', 'perpanjangan'),
tim_id	int(11) NOT NULL,	
nama_tim	varchar(500) DEFAULT NULL,	
create_date	timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,	
update_date	datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,	
PRIMARY KEY (tim_lhp_id)		
) ENGINE=InnoDB DEFAULT CHARSET=utf8;		

CREATE TABLE tlhp_tim (	
tim_id	int(11) unsigned NOT NULL AUTO_INCREMENT,
jenis_tim	varchar(500) DEFAULT NULL,
PRIMARY KEY (tim_id)	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;	

CREATE TABLE tlhp_jenis_pengawasan (	
jenis_pengawasan_id	int(11) unsigned NOT NULL AUTO_INCREMENT,
nama_jenis_penugasan	varchar(500) DEFAULT NULL,
PRIMARY KEY (jenis_pengawasan_id)	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;	

CREATE TABLE tlhp_upload_lhp (	
upload_laporan_id	int(10) unsigned NOT NULL AUTO_INCREMENT,
lhp_id	int(11) NOT NULL,
file_name	varchar(500) DEFAULT NULL,
ext	varchar(500) DEFAULT NULL,
width	int(11) NULL,
height	int(11) NULL,
size	int(11) NULL,
url	varchar(2000) DEFAULT NULL,
path	varchar(2000) DEFAULT NULL,
create_date	timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
update_date	datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (upload_laporan_id)	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;	

CREATE TABLE tlhp_kertas_kerja (		
kertas_kerja_id	int(10) unsigned NOT NULL AUTO_INCREMENT,	
lhp_id	int(11) NOT NULL,	
jenis_temuan	enum('sistem pengendalian internal', 'kepatuhan terhadap peraturan'),
no_temuan	varchar(500) DEFAULT NULL,	
kode_temuan_id	int(10) NOT NULL,	
uraian_temuan	varchar(500) DEFAULT NULL,	
kode_sebab	varchar(500) DEFAULT NULL,	
uraian_sebab	varchar(500) DEFAULT NULL,	
nilai_temuan	varchar(500) DEFAULT NULL,	
no_rekomendasi	varchar(500) DEFAULT NULL,	
kode_rekomendasi	varchar(500) DEFAULT NULL,	
uraian_rekomendasi	varchar(500) DEFAULT NULL,	
kerugian_negara	tinyint(1),
nilai_rekomendasi	double DEFAULT NULL,	
unit_kerja	varchar(500) DEFAULT NULL,	
nama_ppk	varchar(500) DEFAULT NULL,	
nama_pj_kegiatan	varchar(500) DEFAULT NULL,	
periode_tindak_lanjut	varchar(500) DEFAULT NULL,	
tindak_lanjut	varchar(500) DEFAULT NULL,	
dokumen_pendukung	varchar(500) DEFAULT NULL,	
jumlah_sesuai	varchar(500) DEFAULT NULL,	
nilai_sesuai	double DEFAULT NULL,	
jumlah_belum_sesuai	varchar(500) DEFAULT NULL,	
nilai_belum_sesuai	double DEFAULT NULL,	
jumlah_belum_tl	varchar(500) DEFAULT NULL,	
nilai_belum_tl	double DEFAULT NULL,	
jumlah_tidak_tl_alasan	varchar(500) DEFAULT NULL,	
nilai_tidak_tl_alasan	double DEFAULT NULL,	
user_id	int(11) NOT NULL,	
create_date	timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,	
update_date	datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,	
PRIMARY KEY (kertas_kerja_id)		
) ENGINE=InnoDB DEFAULT CHARSET=utf8;		

CREATE TABLE tlhp_tindak_lanjut (	
tindak_lanjut_id	int(10) unsigned NOT NULL AUTO_INCREMENT,
tindak_lanjut	varchar(500) DEFAULT NULL,
nilai	 double DEFAULT NULL,
user_id	 int(11) NOT NULL,
create_date	timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
update_date	datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (tindak_lanjut_id)	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;	

CREATE TABLE tlhp_unit_kerja (	
unit_kerja_id	int(10) unsigned NOT NULL AUTO_INCREMENT,
unit_kerja	varchar(255) DEFAULT NULL,
PRIMARY KEY (unit_kerja_id)	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;	

CREATE TABLE tlhp_upload_tl (	
upload_template_id	int(10) unsigned NOT NULL AUTO_INCREMENT,
tindak_lanjut_id  int(11) NOT NULL,	
file_name	varchar(500) DEFAULT NULL,
ext	varchar(500) DEFAULT NULL,
width	int(11) NULL,
height	int(11) NULL,
size	int(11) NULL,
url	varchar(2000) DEFAULT NULL,
path	varchar(2000) DEFAULT NULL,
create_date	timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
update_date	datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (upload_template_id)	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;	


CREATE TABLE tlhp_persetujuan_tl (		
persetujuan_tl_id	int(10) unsigned NOT NULL AUTO_INCREMENT,	
tindak_lanjut_id	int(11) NULL,	
disetujui		tinyint(1) DEFAULT NULL,
nilai_disetujui		double DEFAULT NULL,	
saldo_rekomendasi	double DEFAULT NULL,	
`status` tinyint(2) DEFAULT NULL,
komentar_inspektorat	text DEFAULT NULL,	
user_id		int(11) NOT NULL,
create_date	timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,	
update_date	datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,	
PRIMARY KEY (persetujuan_tl_id)		
) ENGINE=InnoDB DEFAULT CHARSET=utf8;		

CREATE TABLE tlhp_template_laporan (	
template_laporan_id	int(10) unsigned NOT NULL AUTO_INCREMENT,
judul_laporan	varchar(500) DEFAULT NULL,
nomor_laporan	varchar(500) DEFAULT NULL,
periode_laporan	varchar(500) DEFAULT NULL,
tanggal_laporan	date DEFAULT NULL,
kata_pengantar	text DEFAULT NULL,
daftar_isi	text DEFAULT NULL,
user_id	 int(11) NOT NULL,
create_date	timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
update_date	datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (template_laporan_id)	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;	

CREATE TABLE tlhp_upload_template_laporan (	
upload_template_id	int(10) unsigned NOT NULL AUTO_INCREMENT,
template_lap_id	int(11) NOT NULL,
file_name	varchar(500) DEFAULT NULL,
ext	varchar(500) DEFAULT NULL,
width	int(11) NULL,
height	int(11) NULL,
size	int(11) NULL,
url	varchar(2000) DEFAULT NULL,
path	varchar(2000) DEFAULT NULL,
create_date	timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
update_date	datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (upload_template_id)	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;	

CREATE TABLE tlhp_kode_temuan (	
kode_temuan_id	int(10) unsigned NOT NULL AUTO_INCREMENT,
kelompok	smallint(3) DEFAULT NULL,
sub_kelompok	smallint(3) DEFAULT NULL,
jenis	smallint(3) DEFAULT NULL,
deskripsi	varchar(500) DEFAULT NULL,
atl_rekom	varchar(500) DEFAULT NULL,
PRIMARY KEY (kode_temuan_id)	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;	

CREATE TABLE tlhp_kode_rekomendasi (	
kode_rekomendasi_id	int(10) unsigned NOT NULL AUTO_INCREMENT,
jenis	smallint(3) DEFAULT NULL,
deskripsi	varchar(500) DEFAULT NULL,
PRIMARY KEY (kode_rekomendasi_id)	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;	

CREATE TABLE tlhp_kode_sebab (	
kode_sebab_id	int(10) unsigned NOT NULL AUTO_INCREMENT,
jenis	smallint(3) DEFAULT NULL,
deskripsi	varchar(500) DEFAULT NULL,
PRIMARY KEY (kode_sebab_id)	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tlhp_user_history` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `login` datetime NOT NULL,
  `logout` datetime DEFAULT NULL,
  `total_use` time DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




