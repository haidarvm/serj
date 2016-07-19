<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Manus extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->muser = new MUser();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$this->user_list();
	}

	/**
	 * List All Product
	 *
	 * @param string Category slug
	 */
	public function user_list() {
		$data['title'] = "Admin User List";
		//$data['getAll'] = $this->muser->getAllUser();
		$this->load->template('manus', $data);
	}
	
}