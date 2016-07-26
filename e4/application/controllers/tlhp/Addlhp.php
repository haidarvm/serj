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
		$data['title'] = "Buat Laporan Hasil Pengawasan Baru";
		$data['getAllJenisTim'] = $this->mlhp->getAllJenisTim();
		$data['getAllJenisPengawasan'] = $this->mlhp->getAllJenisPengawasan();
		$this->load->tlhp_template('tlhp/addlhp', $data);
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
			$this->mlhp->insertLHP($post);
			redirect('tlhp/kklhpbaru');
		}
	}
	
	public function update(){
		$post = $this->input->post();
		if ($post){
			print_r($post);exit;
		}
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
	
	
}