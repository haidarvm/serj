<?php

/**
 * 
 * Enter description here ...
 * @author atang sutisna
 * email: atang.sutisna.87@gmail.com
 *
 */
class Mkertaskerjatemuan extends CI_Model {
	
	function __construct() {
		parent::__construct();
	}
	
	public function countByLhpId($lhpId) {
		$query = "SELECT COUNT(*) AS totalTemuan FROM {PRE}kertas_kerja_temuan 
		WHERE lhp_id = ".$lhpId;
		
		$result = $this->db->query($query)->row();
		return $result->totalTemuan;
	}
	
	public function findAllByYear($year) {
		$query = "SELECT lhp_id, judul_lhp FROM {PRE}lhp WHERE YEAR(tanggal_surat_tugas) = '".$year."' ORDER BY lhp_id DESC";
		return $this->db->query($query)->result();
	}
	
	public function countByYear($year) {
		$query = "SELECT COUNT(*) AS countRow FROM {PRE}lhp WHERE YEAR(tanggal_surat_tugas) = '".$year."' ORDER BY lhp_id DESC";
		$result = $this->db->query($query)->row();
		
		return $result->countRow;
	}
}