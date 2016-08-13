<?php


class Mtindaklanjut extends CI_Model {
	
	function __construct() {
		parent::__construct();
	}
	
	public function insertAll($arrTindakLanjut) {
		$this->db->update_batch("tindak_lanjut", $arrTindakLanjut, 'tindak_lanjut_id');
	}
	
	public function countAndSumStatusTl($rekomendasiIds, $statusTl) {
		$rekIds = implode(",", $rekomendasiIds);
		$query = "SELECT rekomendasi_id, COUNT(*) AS rowCount, SUM(nilai_disetujui) AS totalAmount 
		FROM {PRE}tindak_lanjut WHERE rekomendasi_id IN (".$rekIds.") GROUP BY rekomendasi_id";
		
		return $this->db->query($query)->result();
	}
}