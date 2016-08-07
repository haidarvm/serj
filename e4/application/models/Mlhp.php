<?php

/*
 * By Haidar Mar'ie Email = haidarvm@gmail.com MProduct
 */
class MLhp extends CI_Model {

	function __construct() {
		parent::__construct();
	}

	/**
	 *
	 * @param
	 *        	array post $data
	 */
	function insertLHP($data) {
		// $remove = ['tim', 'st_perpanjangan', 'tgl_st_perpanjangan','nomor_lhp'];
		$remove = array('tim');
		$clean = array_diff_key($data, array_flip($remove));
		$clean['tanggal_surat_tugas'] = sqlDateFormat($data['tanggal_surat_tugas']);
		$clean['hari_awal_penugasan'] = sqlDateFormat($data['hari_awal_penugasan']);
		$clean['hari_akhir_penugasan'] = sqlDateFormat($data['hari_akhir_penugasan']);
		$clean['skop_awal_penugasan'] = sqlDateFormat($data['skop_awal_penugasan']);
		$clean['skop_akhir_penugasan'] = sqlDateFormat($data['skop_akhir_penugasan']);
		$clean['tanggal_lhp'] = sqlDateFormat($data['tanggal_lhp']);
		$clean['tgl_st_perpanjangan'] = ! empty($clean['tgl_st_perpanjangan']) ? sqlDateFormat($data['tgl_st_perpanjangan']) : null;
		$clean['hari_awal_perpanjangan_penugasan'] = ! empty($clean['tgl_st_perpanjangan']) ? sqlDateFormat($data['hari_awal_perpanjangan_penugasan']) : null;
		$clean['hari_akhir_perpanjangan_penugasan'] = ! empty($clean['tgl_st_perpanjangan']) ? sqlDateFormat($data['hari_akhir_perpanjangan_penugasan']) : null;
		// debug(array_filter($clean));exit;
		$query = $this->db->insert('lhp', array_filter($clean));
		return $this->db->insert_id();
	}

	function insertKKLHP($data) {
		// debug($clean); exit;
		$query = $this->db->insert('kertas_kerja_temuan', $data);
		return $this->db->insert_id();
	}

	function insertRekomen($data) {
		// $remove = array('kode_rekomendasi_id','uraian_rekomendasi','kerugian_negara','nilai_rekomendasi');
		// $clean = array_diff_key($data, array_flip($remove));
		// debug($data);exit;
		// debug($this->cleanArray($clean)); exit;
		$query = $this->db->insert('rekomendasi', $data);
		return $this->db->insert_id();
	}

	function getLHP($lhp_id) {
		$this->db->select('*, lhp.lhp_id as lhp_id');
		$this->db->join('kertas_kerja_temuan', 'lhp.lhp_id= kertas_kerja_temuan.lhp_id', 'left');
		$query = $this->db->get_where("lhp", array('lhp.lhp_id' => $lhp_id));
		// echo $this->db->last_query(); exit;
		return checkRow($query);
	}

	function getLHPKK($lhp_id) {
		$this->db->select('*, lhp.lhp_id as lhp_id');
		$this->db->join('kertas_kerja_temuan', 'lhp.lhp_id= kertas_kerja_temuan.lhp_id', 'left');
		$query = $this->db->get_where("lhp", array('lhp.lhp_id' => $lhp_id));
		// echo $this->db->last_query(); exit;
		return checkRes($query);
	}

	/**
	 * Get All LHP
	 *
	 * @return boolean
	 */
	function getAllLHP() {
		$this->db->order_by('lhp.lhp_id', 'desc');
		$query = $this->db->get("lhp");
		return checkRes($query);
	}

	/**
	 * Get All LHP with klhp
	 *
	 * @return boolean
	 */
	function getAllLHPKK() {
		$this->db->select('*, lhp.lhp_id as lhp_id');
		$this->db->join('kertas_kerja_temuan', 'lhp.lhp_id= kertas_kerja_temuan.lhp_id', 'inner');
		$this->db->order_by('lhp.lhp_id', 'desc');
		$query = $this->db->get("lhp");
		return checkRes($query);
	}

	function getAllKKLHP($lhp_id, $jenis_temuan) {
		$query = $this->db->get_where("kertas_kerja_temuan", array("lhp_id" => $lhp_id, 'jenis_temuan' => $jenis_temuan));
		// echo $this->db->last_query(); exit;
		return checkRes($query);
	}

	function getAllRekomendasi($kertas_kerja_id) {
		$query = $this->db->get_where("rekomendasi", array("kertas_kerja_id" => $kertas_kerja_id));
		return checkRes($query);
	}

	function cleanArray($array) {
		return array_filter(array_map('array_filter', $array));
	}
	
	// function getAllLHP($atlet_id) {
	// $query = $this->db->get_where('lhp', array( 'tanggal_lhp' => $atlet_id ));
	// // echo $this->db->last_query(); exit;
	// return checkRes($query);
	// }
	
	/**
	 * For Datatable Only
	 *
	 * @param unknown $cond        	
	 * @param unknown $order_by        	
	 * @return unknown
	 */
	function getAllUserDt($cond = NULL, $order_by = NULL) {
		$cond = ! empty($cond) ? " WHERE 1=1  " . $cond : null;
		$sql = "SELECT * FROM {PRE}user u
    			left JOIN {PRE}user_level l ON l.user_level_id = u.user_level_id
    			left JOIN {PRE}unit_kerja uk ON uk.unit_kerja_id = u.unit_kerja_id
    			" . $cond . " " . $order_by;
		$query = $this->db->query($sql);
		// echo $this->db->last_query();
		return $query;
	}

	function getAllJenisTim() {
		$query = $this->db->get("tim");
		return checkRes($query);
	}

	function getAllJenisPengawasan() {
		$query = $this->db->get("jenis_pengawasan");
		return checkRes($query);
	}

	function dateSQLFormat($all_date) {
	}

	function checkSQLDate($date) {
		return $clean['tgl_st_perpanjangan'] = ! empty($clean['tgl_st_perpanjangan']) ? sqlDateFormat($data['tgl_st_perpanjangan']) : null;
	}



	//----------rudi----------
	
	
	// ----------rudi----------
	function getAllKodeSebab() {
		$query = $this->db->get("kode_sebab");
		return checkRes($query);
	}

	function getAllKodeRekomendasi() {
//		$this->db->select("kode_rekomendasi_id, kode_rekomendasi, uraian_rekomendasi");
		$query = $this->db->get("kode_rekomendasi");
		return checkRes($query);
	}

	function getAllKodeTemuan() {
		$query = $this->db->get("kode_temuan");
		return checkRes($query);
	}


	
// 	function updateTemuan($lhp_id, $jenis_temuan) {
// 		$this->db->where("lhp_id", $lhp_id);
// 		$this->db->where("jenis_temuan", $jenis_temuan);
// 		return $sql = $this->db->get("tlhp_kertas_kerja_temuan");
// 	}
	
// 	function updateTemuanRekomen($kertas_kerja, $jenis_temuan) {
		
// 	}

// 	function data_lhp() {
// 		$this->db->select("*");
// 		$this->db->from('tlhp_lhp');
// 		$this->db->where('lhp_id in(select lhp_id from tlhp_kertas_kerja_temuan)');
		
// 		$this->db->order_by("judul_lhp", "asc");
// 		return $sql = $this->db->get();
// 	}

// 	function data_temuan_update($lhp_id, $jenis_temuan) {
// 		$this->db->where("lhp_id", $lhp_id);
// 		$this->db->where("jenis_temuan", $jenis_temuan);
// 		return $sql = $this->db->get("tlhp_kertas_kerja_temuan");
// 	}

// 	function data_rekomen_update($kertas_kerja, $jenis_temuan) {
// 		$this->db->where("kertas_kerja_id", $kertas_kerja);
		
// 		return $sql = $this->db->get("tlhp_rekomendasi");
// 	}


//insert template laporan
	
	function updateKKLHP($kertas_kerja_id, $data) {
		$this->db->update('kertas_kerja_temuan', $data, array('kertas_kerja_id' => $kertas_kerja_id));
	}

	function updateRekomendasi($rekomendasi_id, $data) {
		$this->db->update('rekomendasi', $data, array('rekomendasi_id' => $rekomendasi_id));
	}

	function getMaxKK() {
		$query = $this->db->query("select max(kertas_kerja_id) as kertas_kerja_id from {PRE}kertas_kerja_temuan");
		// echo $this->db->last_query();exit;
		return checkRow($query);
	}

	function deleteKKKLHP($kertas_kerja_id) {
		$this->db->delete('kertas_kerja_temuan', array('kertas_kerja_id' => $kertas_kerja_id));

	}

	function deleteKKKLHPId($lhp_id) {
		$this->db->delete('kertas_kerja_temuan', array('lhp_id' => $lhp_id));
	}




	function deleteRekomendasi($kertas_kerja_id) {
		$this->db->delete('kertas_kerja_temuan', array('kertas_kerja_id' => $kertas_kerja_id));
	}

	function deleteRekomendasiLHPId($lhp_id) {
		$sql = "delete from {PRE}rekomendasi where kertas_kerja_id in(select kertas_kerja_id from {PRE}kertas_kerja_temuan where lhp_id='" . $lhp_id . "')";
		return $this->db->query($sql);
		/*
		 * DELETE posts
		 * FROM posts
		 * INNER JOIN projects ON projects.project_id = posts.project_id
		 * WHERE projects.client_id = $lhp_id
		 */
		// $this->db->delete('kertas_kerja_temuan', array('lhp_id' => $lhp_id));
	}
	

	// insert template laporan
	public function insert_templateLaporan($data) {
		unset($data['files']);
		unset($data['file']);
		$data['tanggal_laporan'] = sqlDateFormat($data['tanggal_laporan']);
		$query = $this->db->insert('template_laporan', $data);
		return $this->db->insert_id();
// 		echo $this->db->last_query();exit;
	}
	
	public function getAllTemplate($cond = NULL, $order_by = NULL){
		$cond = ! empty($cond) ? " WHERE 1=1  " . $cond : null;
		$sql = "SELECT *, tl.template_laporan_id as template_laporan_id, tl.create_date as create_date
				FROM {PRE}template_laporan tl
    			LEFT JOIN {PRE}upload_template_laporan utl ON utl.template_laporan_id = tl.template_laporan_id
    			" . $cond . " " . $order_by;
		$query = $this->db->query($sql);
// 		echo $this->db->last_query();exit;
		return $query;
	}
	
	public function getTemplate($id) {
		$query = $this->db->get_where('template_laporan', array('template_laporan_id' => $id));
// 		echo $this->db->last_query();exit;
		return checkRow($query);
	}
	

	public function updateTemplateLaporan($data,$template_laporan_id) {
		unset($data['file']);
		unset($data['files']);
		return $this->db->update('template_laporan', $data, array('template_laporan_id' => $template_laporan_id));
	}
	
	// function updateTemuan($lhp_id, $jenis_temuan) {
	// $this->db->where("lhp_id", $lhp_id);
	// $this->db->where("jenis_temuan", $jenis_temuan);
	// return $sql = $this->db->get("tlhp_kertas_kerja_temuan");
	// }
	
	// function updateTemuanRekomen($kertas_kerja, $jenis_temuan) {
	
	// }
	
	// function data_lhp() {
	// $this->db->select("*");
	// $this->db->from('tlhp_lhp');
	// $this->db->where('lhp_id in(select lhp_id from tlhp_kertas_kerja_temuan)');
	
	// $this->db->order_by("judul_lhp", "asc");
	// return $sql = $this->db->get();
	// }
	
	// function data_temuan_update($lhp_id, $jenis_temuan) {
	// $this->db->where("lhp_id", $lhp_id);
	// $this->db->where("jenis_temuan", $jenis_temuan);
	// return $sql = $this->db->get("tlhp_kertas_kerja_temuan");
	// }
	
	// function data_rekomen_update($kertas_kerja, $jenis_temuan) {
	// $this->db->where("kertas_kerja_id", $kertas_kerja);
	
	// return $sql = $this->db->get("tlhp_rekomendasi");
	// }
	// function updateTemuanRekomen($kertas_kerja, $jenis_temuan) {
	
	// }
	
	// function data_lhp() {
	// $this->db->select("*");
	// $this->db->from('tlhp_lhp');
	// $this->db->where('lhp_id in(select lhp_id from tlhp_kertas_kerja_temuan)');
	
	// $this->db->order_by("judul_lhp", "asc");
	// return $sql = $this->db->get();
	// }
	
	// function data_temuan_update($lhp_id, $jenis_temuan) {
	// $this->db->where("lhp_id", $lhp_id);
	// $this->db->where("jenis_temuan", $jenis_temuan);
	// return $sql = $this->db->get("tlhp_kertas_kerja_temuan");
	// }
	
	// function data_rekomen_update($kertas_kerja, $jenis_temuan) {
	// $this->db->where("kertas_kerja_id", $kertas_kerja);
	
	// return $sql = $this->db->get("tlhp_rekomendasi");
	// }
	
	public function findAllByYear($year) {
		$query = "SELECT lhp_id, judul_lhp FROM {PRE}lhp WHERE YEAR(tanggal_surat_tugas) = '".$year."'";
		return $this->db->query($query)->result();
	}
	
	public function insertBatchRekomendasi($arrRekomendasi) {
		$this->db->insert_batch("rekomendasi", $arrRekomendasi);
	}
	
	public function getbyid($lhp_id) {
		$this->db->where('lhp_id', $lhp_id);
		return $this->db->get('lhp')->row();
	}
	
	public function getAllKertasKerjaTemuan($lhp_id) {
		$query = "SELECT kkt.kertas_kerja_id, kkt.lhp_id, kkt.jenis_temuan, 
		kkt.kode_temuan_id, 
		kt.kode_temuan AS deskripsi_temuan,
		kt.kelompok AS kelompok_temuan,
		kt.sub_kelompok AS sub_kelompok_temuan,
		kt.jenis AS jenis_kelompok_temuan,
		kkt.uraian_temuan, 
		kkt.kode_sebab_id, ks.kode_sebab, ks.uraian_sebab, 
		kkt.nilai_temuan FROM {PRE}kertas_kerja_temuan AS kkt
		INNER JOIN {PRE}kode_temuan AS kt ON kkt.kode_temuan_id = kt.kode_temuan_id
		INNER JOIN {PRE}kode_sebab AS ks ON kkt.kode_sebab_id = ks.kode_sebab_id
		WHERE kkt.lhp_id = ".$lhp_id;
		return $this->db->query($query)->result();
	}
	
	public function getAllRekomendasiByKktIds($kktids){
		$reqIds = implode(", ", $kktids);
		$query = "SELECT rek.rekomendasi_id, rek.kertas_kerja_id, rek.kode_rekomendasi_id, 
		kode_rek.uraian_rekomendasi AS ori_uraian_rekomendasi,
		kode_rek.kode_rekomendasi,
		rek.uraian_rekomendasi, 
		rek.kerugian_negara, rek.nilai_rekomendasi 
		FROM {PRE}rekomendasi AS rek
		INNER JOIN {PRE}kode_rekomendasi AS kode_rek 
		ON rek.kode_rekomendasi_id = kode_rek.kode_rekomendasi_id 
		WHERE kertas_kerja_id IN (".$reqIds.")";
		return $this->db->query($query)->result();
	} 
	
	public function updateBatchKkt($arrKkt) {
		$this->db->update_batch("kertas_kerja_temuan", $arrKkt, "kertas_kerja_id");
	}
	
	public function insertBatchKkt($arrKkt) {
		$this->db->insert_batch("kertas_kerja_temuan", $arrKkt);
	}
	
	public function updateBatchRekomendasi($arrRekomendasi) {
		$this->db->update_batch("rekomendasi", $arrRekomendasi, "rekomendasi_id");
	}
	
	public function getKodeSebab($kodeSebabId) {
		$this->db->where("kode_sebab_id", $kodeSebabId);
		return $this->db->get("kode_sebab")->row();
	}
}