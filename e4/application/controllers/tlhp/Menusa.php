<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Menusa extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->load->model('mlhp');
		$this->load->model('mkertaskerjatemuan');
		$this->load->model('mrekomendasi');
		$this->load->model('mtindaklanjut');
		$this->muser = new MUser();
		$this->mlhp = new MLhp();
		$this->mkertaskerjatemuan = new MKertaskerjatemuan();
		$this->mrekomendasi = new MRekomendasi();
		$this->mtindaklanjut = new MTindaklanjut();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$data['title'] = "TLHP Dashboard";
		$data['current_year'] = date('Y');
		$data['totalTemuan'] = $this->mkertaskerjatemuan->countByYear(date('Y'));
		$data['totalRekomendasi'] = $this->mrekomendasi->countByYear(date('Y'));
		$data['totalFinishedTl'] = $this->mtindaklanjut->countFinishTl();
		$data['totalBelumTl'] = $this->mtindaklanjut->countBelumTL();
		$this->load->tlhp_template('tlhp/menusa', $data);
	}
	
	
	public function pie(){
		$data['title'] = "PIE";
		$this->load->view('report/pie', $data);
	}

	/**
	 * List All Product
	 *
	 * @param string Category slug
	 */
}