<?php

/*
 * By Haidar Mar'ie Email = haidarvm@gmail.com MProduct
 */
class MUser extends CI_Model {

	function __construct() {
		parent::__construct();
	}

	/**
	 * Get All User
	 *
	 * @return boolean
	 */
	function getAllUser() {
		$query = $this->db->get("user");
		return checkRes($query);
	}

	/**
	 * For Datatable Only
	 *
	 * @param unknown $cond        	
	 * @param unknown $order_by        	
	 * @return unknown
	 */
	function getAllUserDt($cond = NULL, $order_by = NULL) {
		$cond = ! empty($cond) ? " AND 1=1  " . $cond : null;
		$sql = "SELECT * FROM {PRE}user u
    			left JOIN {PRE}user_level l ON l.user_level_id = u.user_level_id
    			left JOIN {PRE}unit_kerja uk ON uk.unit_kerja_id = u.unit_kerja_id
    			 WHERE active =1 " . $cond . " " . $order_by;
		$query = $this->db->query($sql);
// 		echo $this->db->last_query();
		return $query;
	}

	/**
	 * Get User Profile
	 *
	 * @param unknown $user_id        	
	 * @return boolean
	 */
	function getUser($user_id) {
		$query = $this->db->get_where("user", array('user_id' => $user_id));
		return checkRow($query);
	}

	function getAllLevel() {
		$query = $this->db->get("user_level");
		return checkRes($query);
	}

	function getAllUnitKerja() {
		$query = $this->db->get("unit_kerja");
		return checkRes($query);
	}

	function getUsername($username) {
		$query = $this->db->get_where("user", array('username' => $username));
		return checkRow($query);
	}

	function getEmail($email) {
		$query = $this->db->get_where("user", array('email' => $email));
		return checkRow($query);
	}

	/**
	 * Get User Profile by Order Id
	 *
	 * @param unknown $user_id        	
	 * @return boolean
	 */
	function getUserOrderId($order_id) {
		$this->db->join('user', 'order.user_id = user.user_id', 'inner');
		$query = $this->db->get_where("order", array('order.order_id' => $order_id));
		return checkRow($query);
	}

	/**
	 * Register User
	 *
	 * @param unknown $data        	
	 */
	function insertUser($data) {
		unset($data['user_id']);
		unset($data['description']);
		$this->db->insert("user", $data);
		return $this->db->insert_id();
	}

	/**
	 * Update User Profile
	 *
	 * @param unknown $data        	
	 * @param unknown $user_id        	
	 * @return unknown
	 */
	function updateUser($id, $data) {
		unset($data['user_id']);
		unset($data['description']);
		unset($data['re_password']);
		$query = $this->db->update('user', $data, array( 'user_id' => $id ));
	}
	
	// Will create for session
	function login($username, $password) {
		$this->db->select('username, user_id, full_name, {PRE}user.user_level_id as user_level_id, user_level,  email', 'image', FALSE);
		$this->db->join('user_level', 'user_level.user_level_id = user.user_level_id', 'left');
		$query = $this->db->get_where('user', array('username' => $username, 'password' => md5($password)));
// 		echo $this->db->last_query();exit;
		if ($query->num_rows() == 1) {
			$row = $query->row();
			$user_id = $row->user_id;
			$this->user_login($user_id);
			// echo $this->db->last_query();exit;
			return $query->row(); // if data is true
		} else {
			return false; // if data is wrong
		}
	}

	/**
	 * Check if user insert Address & others
	 *
	 * @param unknown $user_id        	
	 */
	function checkUserDetails($user_id) {
		$this->db->where('address is NOT NULL', null, false);
		$query = $this->db->get_where('user', array('user_id' => $user_id));
		if (checkRow($query)) {
			return checkRow($query);
		} else {
			return false;
		}
	}

	function user_login($user_id) {
		$data['user_id'] = $user_id;
		$data['login'] = date('Y-m-d H:i:s');
		$this->db->insert('user_history', $data);
		return $this->db->insert_id();
	}

	function user_logout($user_id) {
		$last = $this->check_last_login($user_id);
		$data['logout'] = date('Y-m-d H:i:s');
		$this->db->update('user_history', $data, array('user_id' => $user_id, 'login' => $last->login));
	}

	function check_last_login($user_id) {
		$this->db->order_by("log_id", "desc");
		$this->db->limit(1);
		$query = $this->db->get_where('user_history', array('user_id' => $user_id, 'logout' => NULL, 'DATE(login)' => date('Y-m-d')));
		$this->db->last_query();
		return $query->row();
	}

	function checkUserId($user_id) {
		$query = $this->db->get_where("user", array('user_id' => $user_id));
		// echo $this->db->last_query();
		return checkRow($query);
	}

	function delete($id) {
		// unset($data ['id']);
		$data['active'] = 0;
		$query = $this->db->update('user', $data, array( 'user_id' => $id ));
		//$this->db->delete('user', array('user_id' => $id));
	}
	
	function findOneByUserName($username) {
		$this->db->select('user_id, username, first_name, last_name, full_name, nip, jabatan, 
			user.unit_kerja_id, unit_kerja.unit_kerja, user.user_level_id, user_level.user_level');
		$this->db->join('unit_kerja', 'user.unit_kerja_id = unit_kerja.unit_kerja_id', 'inner');
		$this->db->join('user_level', 'user.user_level_id = user_level.user_level_id', 'inner');
		$this->db->where('username', $username);
		return $this->db->get('user')->row();
	}
	
	function add($data) {
//		$this->db->set('username', $data['username']);
//		$this->db->set('nip', $data['nip']);
//		$this->db->set('full_name', $data['full_name']);
//		$this->db->set('jabatan', $data['jabatan']);
//		$this->db->set('password', $data['password']);
//		$this->db->set('unit_kerja_id', $data['unit_kerja_id']);
//		$this->db->set('user_level_id', $data['user_level_id']);
//		$query = "INSERT INTO {PRE}user (full_name, jabatan, nip, password, unit_kerja_id, user_level_id, username) 
//		VALUES ('ali khanafi','manager','344555','pass123','1','1','ali')";
		$this->db->insert_batch("user", $data);
	}
	
	function getAllLogUser($cond = NULL, $order_by = NULL) {
		$cond = ! empty($cond) ? " WHERE 1=1  " . $cond : null;
		$sql = "SELECT * , TIMEDIFF(uh.logout, uh.login) as lama_penggunaan FROM {PRE}user u
				left JOIN {PRE}user_history uh ON uh.user_id = u.user_id
    			left JOIN {PRE}user_level l ON l.user_level_id = u.user_level_id
    			left JOIN {PRE}unit_kerja uk ON uk.unit_kerja_id = u.unit_kerja_id
    			" . $cond . " " . $order_by;
		return $this->db->query($sql);
	}
}
