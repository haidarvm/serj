<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Template extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->muser = new MUser();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$this->laporan();
	}
	
	public function daftarlap(){
		$data['title'] = "Daftar Laporan";
		//$data['getAll'] = $this->muser->getAllUser();
		$this->load->tlhp_template('tlhp/daftarlap', $data);
		
	}
	
	public function laporan() {
		$data['title'] = "PILIH Template";
		$this->load->tlhp_template('tlhp/template_laporan', $data);
	}

	
}
