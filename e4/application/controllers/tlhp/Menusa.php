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
		$this->muser = new MUser();
		$this->mlhp = new MLhp();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$this->load->model('Mkertaskerjatemuan', 'mkkt');
		$this->load->model('MRekomendasi', 'mrekomendasi');
		$this->load->model('Mtindaklanjut', 'mttl');
		
		$data['title'] = "TLHP Dashboard";
		$data['current_year'] = date('Y');
		$data['totalTemuan'] = $this->mkkt->countByYear(date('Y'));
		$data['totalRekomendasi'] = $this->mrekomendasi->countByYear(date('Y'));
		$data['totalFinishedTl'] = $this->mttl->countFinishTl();
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