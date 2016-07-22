<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Login extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->muser = new MUser();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$data['title'] = "DAFTAR LAPORAN";
		//$data['getAll'] = $this->muser->getAllUser();
		$this->load->view('tlhp/login', $data);
	}
	
	public function do_login() {
		redirect("tlhp/menusa");
	}

	/**
	 * List All Product
	 *
	 * @param string Category slug
	 */
	
}
