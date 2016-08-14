<?php

/**
 * 
 * Enter description here ...
 * @author atang sutisna
 * email: atang.sutisna.87@gmail.com
 *
 */
class MRekomendasi extends CI_Model {
	
	function __construct() {
		parent::__construct();
	}
	
	public function countRekomendasiByLhpId($lhpId) {
		$query = "SELECT COUNT(*) as totalRekomendasi FROM {PRE}rekomendasi rek
				INNER JOIN {PRE}kertas_kerja_temuan kkt
				ON rek.kertas_kerja_id = kkt.kertas_kerja_id
				INNER JOIN {PRE}lhp lhp
				ON kkt.lhp_id = lhp.lhp_id
				WHERE lhp.lhp_id = ".$lhpId;
		$result = $this->db->query($query)->row();
		return $result->totalRekomendasi;
	}
	
	public function findAllRekomendasi($lhp_id) {
		$query = "select * from {PRE}rekomendasi rk
					INNER JOIN {PRE}kertas_kerja_temuan kkt
					ON rk.kertas_kerja_id = kkt.kertas_kerja_id
					INNER JOIN {PRE}lhp lhp
					ON kkt.lhp_id = lhp.lhp_id
					WHERE lhp.lhp_id = ".$lhp_id;
		$result = $this->db->query($query)->row();
		
		return $result->totalRekomendasi;
	}
}