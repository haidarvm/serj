<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Pilihlhp extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->load->model('mlhp');
		$this->muser = new MUser();
		$this->mlhp = new MLhp();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$this->pilih();
	}

	public function pilih() {
		$data['title'] = "UPDATE LHP";
		$data['getAllLHP'] = $this->mlhp->getAllLHP();
		$post = $this->input->post();
		if ($post) {
			echo 'test';
		}
		$this->load->tlhp_template('tlhp/pilihlhp', $data);
	}

	public function updatelhp() {
		$post = $this->input->post();
		if ($post) {
			$data['title'] = "UPDATE LHP";
			$lhp_id = $post['lhp_id'];
			$data['lhp'] = $this->mlhp->getLHP($lhp_id);
			$data['title'] = "Kertas Kerja Laporan Hasil Pengawasan Baru";
			$data['update'] = "update";
			// $data['getAll'] = $this->muser->getAllUser();
			$this->load->tlhp_template('tlhp/kklhp', $data);
		} else {
			// redirect pilih
		}
	}

/**
 * List All Product
 *
 * @param
 *        	string Category slug
 */
}