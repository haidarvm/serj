<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Loghistory extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->muser = new MUser();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$data['title'] = "LOG HISTORY USER";
		
		//$data['getAll'] = $this->muser->getAllUser();
		$this->load->tlhp_template('tlhp/loghistory', $data);
	}
	
	public function get_user_history_list() {
		$col = array (
				'log_id' => 'log_id',
				'user_id' => 'user_id',
				'login' => 'login',
				'logout' => 'logout',
		);
		
		// Get Db Prefix 
		$this->load->database();
		$dbPrefix = $this->db->dbprefix;
		
		$table = $dbPrefix . "user_history";
		header ( 'Content-Type: application/json' );
		exit(datatable_connect ( $col, $table, 'log_id', 1));
	}

	/**
	 * List All Product
	 *
	 * @param string Category slug
	 */
	
}