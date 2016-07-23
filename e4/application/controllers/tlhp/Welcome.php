<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Welcome extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->muser = new MUser();
	}
	
	/**
	 * Redirect to product_list
	 */
	public function index() {
		$data['title'] = "Welcome TLHP";
		//$data['getAll'] = $this->muser->getAllUser();
		$this->load->view('tlhp/welcome', $data);
	}
	
}
