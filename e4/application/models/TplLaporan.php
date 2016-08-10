<?php
/**
 * 
 * @author omapslab
 *
 */
class TplLaporan extends CI_Model {
	
	function __construct() {
		parent::__construct();
	}
	

	public function insertMedia($data) {
		$this->db->insert_batch("upload_template_laporan", $data);
		return $this->db->insert_id();
	}
	
	public function insertTemplateLaporanMedia($data) {
		$this->db->insert_batch("template_laporan_media", $data);
		return $this->db->insert_id();
	}
}