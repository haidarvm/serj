<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Kklhpbaru extends MY_Controller {

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
		$this->add();
	}

	public function add($lhp_id) {
		$data['lhp'] = $this->mlhp->getLHP($lhp_id);
		$data['title'] = "Kertas Kerja Laporan Hasil Pengawasan Baru";
		// $data['getAll'] = $this->muser->getAllUser();
		$this->load->tlhp_template('tlhp/kklhp', $data);
	}

	public function insert() {
		$post = $this->input->post();
		if ($post) {
// 			debug($post);exit;
			$insert_id_kklhp = $this->mlhp->insertKKLHP($post);
		}
	}
}