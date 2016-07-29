<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Kodefikasi extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->load->model('mlhp');
		$this->muser = new MUser();
		$this->muser = new MLhp();
	}

	public function index() {
		$data['title'] = "Kodefikasi";
		$data['sebab'] = $this->mlhp->getAllKodeSebab();
		$data['rekomend'] = $this->mlhp->getAllKodeRekomendasi();
		$this->load->tlhp_template('tlhp/kodefikasi', $data);
	}

	public function kode_sebab() {
		$data['title'] = "Kodefikasi";
		$data['sebab'] = $this->mlhp->getAllKodeSebab();
		$this->load->tlhp_template('tlhp/kode_sebab', $data);
	}

	public function kode_rekomendasi() {
		$data['title'] = "Kodefikasi";
		$data['rekomend'] = $this->mlhp->getAllKodeRekomendasi();
		$this->load->tlhp_template('tlhp/kode_rekomendasi', $data);
	}
}