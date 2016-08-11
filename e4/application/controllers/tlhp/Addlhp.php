<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Addlhp extends MY_Controller {

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

	public function add(){
		$data['action'] = 'insert';
		$data['title'] = "Buat Laporan Hasil Pengawasan Baru";
		$data['getAllJenisTim'] = $this->mlhp->getAllJenisTim();
		$data['getAllJenisPengawasan'] = $this->mlhp->getAllJenisPengawasan();
		$this->load->tlhp_template('tlhp/lhp', $data);
	}
	/**
	 * List All Product
	 * -
	 * @param string Category slug
	 */
	
	public function insert(){
		$post = $this->input->post();
		if ($post){
			$post['user_id'] = 4;
			$lhp_id = $this->mlhp->insertLHP($post);
			redirect('tlhp/kklhpbaru/add/'.$lhp_id);
		}
	}
	
	public function edit($lhp_id){
		//TODO: error handling when lhp_id not found
		$data['lhp'] = $this->mlhp->getLHP($lhp_id);
		$data['action'] = 'update';
		$data['title'] = "Edit Laporan Hasil Pengawasan";
		$data['getAllJenisTim'] = $this->mlhp->getAllJenisTim();
		$data['getAllJenisPengawasan'] = $this->mlhp->getAllJenisPengawasan();
		$this->load->tlhp_template('tlhp/lhp', $data);
	}
	
	public function test(){
		$date = sqlDateFormat('27-03-2016');
		echo $date;
		var_dump(checkdate($date));
	}
	
	public function delete(){
		$post = $this->input->post();
		if ($post){
			print_r($post);exit;
		}
	
	}
        
	public function get_all($year) {
		$lhpList = $this->mlhp->findAllByYear($year);
		$data = array();
		foreach ($lhpList as $lhp) {
			$data[] = array(
				'lhp_id' => $lhp->lhp_id,
				'lhp_title' => $lhp->judul_lhp
			);
		}
		$this->output->
		set_status_header(200)->
		set_content_type('application/json', 'utf-8')->
		set_output(json_encode($data, JSON_PRETTY_PRINT))->
		_display();
		exit;
	}
}