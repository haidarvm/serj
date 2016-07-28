<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Home extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->muser = new MUser();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$data['title'] = "Login ALL TLHP App";
		// echo 'masuk';
		if (isset($_SESSION['user_id'])) {
			$_SESSION['logged'] = "tlhp";
			redirect('tlhp/menusa');
		}
		// echo $_SESSION['logged'];
		// $data['getAll'] = $this->muser->getAllUser();
		$this->load->view('tlhp/choose_app', $data);
	}

	public function error() {
		$data['title'] = "Error";
		$this->load->tlhp_template('tlhp/404', $data);
	}

	public function underconstruction() {
		$data['title'] = "underconstruction";
		$this->load->tlhp_template('tlhp/underconstruction', $data);
	}
}
