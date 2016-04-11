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
    	$this->db->insert("lomba_parenting",$data);
    	return $this->db->insert_id();
    }
    
    /** Update User Profile
     * @param unknown $data
     * @param unknown $user_id
     * @return unknown
     */
}