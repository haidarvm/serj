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
			$query = "SELECT COUNT(*) AS rowCount FROM {PRE}tindak_lanjut WHERE status_tl = ".$statusTl." AND approved_by IS NOT NULL  
			AND rekomendasi_id IN (".$rekIds.")";
			
			$result = $this->db->query($query)->row();
			
			return $result->rowCount;	
		} else {
			return 0;
		}
		
	}
	
	public function countFinishTl() {
		$query = "SELECT COUNT(*) AS rowCount FROM {PRE}tindak_lanjut WHERE 
		status_tl IS NOT NULL AND (approved_by OR rejected_by) IS NOT NULL";
		$result = $this->db->query($query)->row();
		return $result->rowCount;
	}
	
	/**
	 * atang: ane belum paham method ini
	 * Enter description here ...
	 */
	public function countBelumTL() {
		$query = "SELECT COUNT(*) AS rowCount FROM {PRE}rekomendasi rek
				  LEFT JOIN {PRE}tindak_lanjut tl ON rek.rekomendasi_id = tl.rekomendasi_id
				  WHERE tl.rekomendasi_id is NULL ";
		$result = $this->db->query($query)->row();
		return $result->rowCount;
	}
	
	public function countBelumTLByRekIds($rekomendasiIds) {
		$rekIds = implode(",", $rekomendasiIds);
		$query = "SELECT COUNT(*) AS rowCount FROM {PRE}tindak_lanjut
				  WHERE approved_by IS NULL 
				  AND rejected_by IS NULL 
				  AND status_tl IS NULL 
				  AND approval_status IS NULL
				  AND rekomendasi_id IN (". $rekIds .")";
		$result = $this->db->query($query)->row();
		
		return $result->rowCount;
	}
}     