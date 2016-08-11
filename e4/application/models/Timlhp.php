<?php
/**
 * @author: Atang Sutisna
 * email: atang.sutisna.87@gmail.com
 * 
 */
class Timlhp extends CI_Model {
	
	function __construct() {
		parent::__construct();
	}
	
	/**
	 * 
	 * Enter description here ...
	 * @param List of team lhp $teamLhp
	 */
	public function insert_batch($teamLhp) {
		$this->db->insert_batch("tim_lhp", $teamLhp);
	}
	
	public function get_tim($lhp_id) {
		$query = "SELECT tl.kategory_tim AS kategori_tim, tl.tim_id, tm.jenis_tim, tl.nama_tim 
				FROM {PRE}tim_lhp AS tl  
				INNER JOIN {PRE}tim AS tm 
				ON tl.tim_id = tm.tim_id 
				WHERE tl.lhp_id = ".$lhp_id;
		return $this->db->query($query)->result();
	}
}