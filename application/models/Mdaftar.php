<?php

/*
 * By Haidar Mar'ie Email = haidarvm@gmail.com MProduct
 */
class MDaftar extends CI_Model {

    function __construct() {
        parent::__construct();
    }
    
    /** Register User
     * @param unknown $data
     */
    function insertUser($data) {
    	$this->db->insert("user",$data);
    	return $this->db->insert_id();
    }
    
    /** Update User Profile
     * @param unknown $data
     * @param unknown $user_id
     * @return unknown
     */
}