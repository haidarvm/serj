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
		$this->muser = new MUser();
		$this->load->model('mlhp');
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$data['title'] = "Kodefikasi";
		//$data['getAll'] = $this->muser->getAllUser();
		$this->load->tlhp_template('tlhp/kodefikasi', $data);
	}

	public function kode_sebab()
	{
		$data['sebab']=$this->mlhp->getAllSebab();
		//print_r($data['sebab']);exit;
		$this->load->tlhp_template('tlhp/kode_sebab', $data);
	}

	public function kode_rekomendasi()
	{
		$data['rekomend']=$this->mlhp->getAllRekomendasi();
		//print_r($data['sebab']);exit;
		$this->load->tlhp_template('tlhp/kode_rekomendasi', $data);
	}

	public function insert_template_laporan()
	{
		
		$insert=$this->input->post();
		if ($insert) {
			//$insert['waktu']=date('Y-m-d H:i:s');
			$this->mlhp->insert_templateLaporan($insert);
			//redirect('ctrl/tampil');
		}
		$this->load->tlhp_template('tlhp/template_laporan');

	}
	/**
	 * List All Product
	 *
	 * @param string Category slug
	 */
	
}