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
		echo 'test';
		redirect('dashboard');
	}
	
	public function error(){
		$data['title'] = "Error";
		$this->load->tlhp_template('tlhp/404', $data);
	}

	public function underconstruction() {
		$data['title'] = "underconstruction";
		$this->load->tlhp_template('tlhp/underconstruction', $data);
	}
	
	public function get_error(){
		$test = 'test';
		echo $te;
	}
	
	public function tag(){
		$link = '<a title="title" href="http://example.com">Text</a>';
		echo "<b>".strip_tags($links)."</b>";
	}
}
?>