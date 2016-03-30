<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Daftar extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('mdaftar');
		$this->mdaftar = new MDaftar();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
// 		echo 'haidar';
		$data['title'] = "haidar";
		$this->load->user_template('user/signup', $data);
	}
}