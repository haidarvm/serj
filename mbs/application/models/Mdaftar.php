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
    
    function insertBakat($data) {
    	$this->db->insert("bakat",$data);
    	return $this->db->insert_id();
    }
    
    function insertLombaCover($data){
    	$this->db->insert("lomba_cover_lagu",$data);
    	return $this->db->insert_id();
    }
    
    function insertLombaFoto($data){
    	$this->db->insert("lomba_foto",$data);
    	return $this->db->insert_id();
    }
    
    function insertLombaGambar($data){
    	$this->db->insert("lomba_gambar",$data);
    	return $this->db->insert_id();
    }
    
    function insertLombaMewarnai($data){
    	$this->db->insert("lomba_mewarnai",$data);
    	return $this->db->insert_id();
    }
    
    function insertParenting($data){
    	$this->db->insert("parenting",$data);
    	return $this->db->insert_id();
    }
    
    function getAllDaftar() {
		$sql = "SELECT *, u.create_date as create_date FROM {PRE}user u
				LEFT JOIN {PRE}lomba_cover_lagu l ON l.user_id = u.user_id 
				LEFT JOIN {PRE}lomba_foto f ON f.user_id = u.user_id 
				LEFT JOIN {PRE}lomba_gambar g ON g.user_id = u.user_id 
				LEFT JOIN {PRE}lomba_mewarnai w ON w.user_id = u.user_id 
				LEFT JOIN {PRE}parenting p ON p.user_id = u.user_id 
				LEFT JOIN {PRE}bakat b ON b.user_id = u.user_id ";
		//$query = $this->db->get('user');
		/*
		 SELECT * FROM mbs_user u 
		 LEFT JOIN mbs_lomba_cover_lagu l ON l.user_id = u.user_id 
		 LEFT JOIN mbs_lomba_foto f ON f.user_id = u.user_id 
		 LEFT JOIN mbs_lomba_gambar g ON g.user_id = u.user_id 
		 LEFT JOIN mbs_lomba_mewarnai w ON w.user_id = u.user_id 
		 LEFT JOIN mbs_parenting p ON p.user_id = u.user_id 
		 LEFT JOIN mbs_bakat b ON b.user_id = u.user_id
		 */
		$query = $this->db->query($sql);
		//echo $this->db->last_query();
		return checkRes($query);
	}
	
	function getAllParenting() {
		
	}
	
	function getAllBakat() {
		
	}
	
	function getAllCover() {
		
	}
	
	function getAllFoto() {
		
	}
    
    /** Update User Profile
     * @param unknown $data
     * @param unknown $user_id
     * @return unknown
     */
}
