<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Bjee extends MY_Controller {

	function __construct() {
		parent::__construct();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
// 		echo 'haidar';
		$data['title'] = "Bjee";
		$this->load->user_template('bjee', $data);
	}
}