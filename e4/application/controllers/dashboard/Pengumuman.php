<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Pengumuman extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->muser = new MUser();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$data['title'] = "Pengumuman";
		//$data['getAll'] = $this->muser->getAllUser();
		$this->load->dashboard_template('dashboard/pengumuman', $data);
	}

	/**
	 * List All Product
	 *
	 * @param string Category slug
	 */
	
}
