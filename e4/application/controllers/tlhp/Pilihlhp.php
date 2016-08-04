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

	public function list_lhp() {
		$data['data_lhp'] = $this->mlhp->getAllLHPKK();
		$this->load->tlhp_template('tlhp/data_lhp', $data);
	}

	public function get_lhp($lhp_id) {
		$data['title'] = "UPDATE LHP";
		$data['lhp'] = $this->mlhp->getLHP($lhp_id);
		$data['title'] = "Kertas Kerja Laporan Hasil Pengawasan Baru";
		$data['action'] = "update";
		// $data['getAll'] = $this->muser->getAllUser();
		$this->load->tlhp_template('tlhp/kklhp', $data);
		// redirect pilih
	}
	
	public function updatelhponly(){
		redirect('tlhp/addlhp/update');
	}

	public function updatelhp() {
		$post = $this->input->post();
		if ($post) {
			$data['kode_temuan'] = $this->mlhp->getAllKodeTemuan();
			$data['kode_sebab'] = $this->mlhp->getAllKodeSebab();
			$data['kode_rekomendasi'] = $this->mlhp->getAllKodeRekomendasi();
			$data['title'] = "UPDATE LHP";
			$data['action'] = "update";
			$lhp_id = $post['lhp_id'];
			$data['lhp'] = $this->mlhp->getLHP($lhp_id);
			$data['title'] = "Kertas Kerja Laporan Hasil Pengawasan Baru";
			// $data['update'] = "update";
			// $data['getAll'] = $this->muser->getAllUser();
			$this->load->tlhp_template('tlhp/kklhp2', $data);
		} else {
			// redirect pilih
		}
	}
	
	public function updatekklhp() {
			$data['kode_temuan'] = $this->mlhp->getAllKodeTemuan();
			$data['kode_sebab'] = $this->mlhp->getAllKodeSebab();
			$data['action'] = "update";
			$data['kode_rekomendasi'] = $this->mlhp->getAllKodeRekomendasi();
			$data['title'] = "UPDATE LHP";
			$lhp_id = $post['lhp_id'];
			$data['lhp'] = $this->mlhp->getLHP($lhp_id);
			$data['title'] = "Kertas Kerja Laporan Hasil Pengawasan Baru";
			// $data['update'] = "update";
			// $data['getAll'] = $this->muser->getAllUser();
			$this->load->tlhp_template('tlhp/kklhp', $data);
		
	}
	
	// $data['data_lhp'] = $this->mlhp->data_lhp()->result();
	// $this->load->tlhp_template('tlhp/data_lhp', $data);

/**
 * List All Product
 *
 * @param
 *        	string Category slug
 */
}