<?php


class Mtindaklanjut extends CI_Model {
	
	function __construct() {
		parent::__construct();
	}
	
	public function insertAll($arrTindakLanjut) {
		$this->db->update_batch("tindak_lanjut", $arrTindakLanjut, 'tindak_lanjut_id');
	}
}