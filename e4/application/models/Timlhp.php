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
}