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
		$this->load->model('mlhp');
		$this->muser = new MUser();
		$this->mlhp = new MLhp();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$this->laporan();
	}

	public function daftarlap() {
		$data['title'] = "Daftar Laporan";
		// $data['getAll'] = $this->muser->getAllUser();
		$this->load->tlhp_template('tlhp/daftarlap', $data);
	}

	public function laporan() {
		$data['title'] = "PILIH Template";
		$this->load->tlhp_template('tlhp/template_laporan', $data);
	}

	public function insert_template_laporan() {
		$insert = $this->input->post();
		if ($insert) {
			// $insert['waktu']=date('Y-m-d H:i:s');
			$this->mlhp->insert_templateLaporan($insert);
			// redirect('ctrl/tampil');
		}
		$this->load->tlhp_template('tlhp/template_laporan');
	}
}
