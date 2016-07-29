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
// 		debug(array_filter($clean));exit;
		$query = $this->db->insert('lhp', array_filter($clean));
		return $this->db->insert_id();
	}
	
	function insertKKLHP($data) {
		$remove = array('tim');
		$clean = array_diff_key($data, array_flip($remove));
// 		debug($data);exit;
		debug($this->cleanArray($clean));
		
		exit;
		$query = $this->db->insert('kertas_kerja_temuan', array_filter($clean));
		return $this->db->insert_id();
	}
	

	function getLHP($lhp_id) {
		$query = $this->db->get_where("lhp", array('lhp_id' => $lhp_id));
		return checkRow($query);
	}

	/**
	 * Get All LHP
	 *
	 * @return boolean
	 */
	function getAllLHP() {
		$query = $this->db->get("lhp");
		return checkRes($query);
	}
	
	function cleanArray($array){
		return  array_filter(array_map('array_filter', $array));
	}
	
// 	function getAllLHP($atlet_id) {
// 		$query = $this->db->get_where('lhp', array( 'tanggal_lhp' => $atlet_id ));
// 		// echo $this->db->last_query(); exit;
// 		return checkRes($query);
// 	}

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
	function getAllSebab()
	{
		$query=$this->db->get("kode_sebab");
		return checkRes($query);
	}

	function getAllRekomendasi()
	{
		$query=$this->db->get("kode_rekomendasi");
		return checkRes($query);
	}
}