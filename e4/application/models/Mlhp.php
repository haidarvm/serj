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
	public function insert_templateLaporan($insert) {
		unset($insert['files']);
		$insert['tanggal_laporan'] = sqlDateFormat($insert['tanggal_laporan']);
		$query = $this->db->insert('template_laporan', $insert);
		return $this->db->insert_id();
// 		echo $this->db->last_query();exit;
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
	
	public function insert() {
//		$this->db->trans_start();
//		$this->db->trans_complete();
	}

}