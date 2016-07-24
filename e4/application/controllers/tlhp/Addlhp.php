<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Addlhp extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->muser = new MUser();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$data['title'] = "Buat Laporan Hasil Pengawasan Baru";
		//$data['getAll'] = $this->muser->getAllUser();
		$this->load->tlhp_template('tlhp/addlhp', $data);
	}

	/**
	 * List All Product
	 * -
	 * @param string Category slug
	 */
	
}