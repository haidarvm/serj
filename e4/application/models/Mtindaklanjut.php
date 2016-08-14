<?php

/**
 * 
 * Enter description here ...
 * @author atang sutisna
 * email: atang.sutisna.87@gmail.com
 */
class Mtindaklanjut extends CI_Model {
	
	function __construct() {
		parent::__construct();
	}
	
	public function updateAll($arrTindakLanjut) {
		$this->db->update_batch("tindak_lanjut", $arrTindakLanjut, 'tindak_lanjut_id');
	}
	
	public function countAndSumStatusTl($rekomendasiIds, $statusTl) {
		$statusTl = $statusTl ? 1 : 0;
		$rekIds = implode(",", $rekomendasiIds);
		$query = "SELECT rekomendasi_id, COUNT(*) AS rowCount, SUM(nilai_disetujui) AS totalAmount 
		FROM {PRE}tindak_lanjut WHERE status_tl = ".$statusTl." AND  
		rekomendasi_id IN (".$rekIds.") GROUP BY rekomendasi_id";
		
		return $this->db->query($query)->result();
	}
	
	public function count($rekomendasiIds, $statusTl) {
		if (count($rekomendasiIds) > 0) {
			$statusTl = $statusTl ? 1 : 0;
			$rekIds = implode(",", $rekomendasiIds);
			$query = "SELECT COUNT(*) AS rowCount FROM {PRE}tindak_lanjut WHERE status_tl = ".$statusTl." AND  
			rekomendasi_id IN (".$rekIds.")";
			
			$result = $this->db->query($query)->row();
			
			return $result->rowCount;	
		} else {
			return 0;
		}
		
	}
}     