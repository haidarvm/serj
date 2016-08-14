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
}