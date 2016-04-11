<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Daftar extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('mdaftar');
		$this->mdaftar = new MDaftar();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		// echo 'haidar';
		$data['title'] = "haidar";
		$this->load->user_template('user/signup', $data);
	}

	public function submit() {
		$post = $this->input->post();
		if($post) {
			unset($post['re_password']);
			//print_r($post);exit;
			//$data['user'] = 
			$data_user = array('full_name' => $post['full_name'], 'gender' => $post['full_name'], 'date_birth' => $post['date_birth'] , 'email' => $post['email'] , 'school' => $post['school'] ,
				'grade' =>$post['grade'] , 	'city' => $post['city']
			);
			$user_id = $this->mdaftar->insertUser($data_user);
			$data_lomba = array('user_id' => $user_id);
			if($post['bakat']) {
				$this->mdaftar->insertBakat($data_lomba);
			}
			if($post['lomba_foto']) {
				$this->mdaftar->insertLombaFoto($data_lomba);
			}
			if($post['lomba_cover_lagu']) {
				$this->mdaftar->insertLombaCover($data_lomba);
			}
			if($post['lomba_gambar']) {
				$this->mdaftar->insertLombaGambar($data_lomba);
			}
			if($post['lomba_mewarnai']) {
				$this->mdaftar->insertLombaMewarnai($data_lomba);
			}
			if($post['parenting']) {
				$this->mdaftar->insertParenting($data_lomba);
			}
			redirect('daftar/berhasil');
		}
	}
	
	public function berhasil() {
		$data['title'] = "berhasil";
		$this->load->user_template('user/signup_success', $data);
	}
	
}



