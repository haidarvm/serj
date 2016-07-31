<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author: Atang Sutisna
 * email : atang.sutisna.87@gmail.com
 */
require_once(APPPATH.'libraries/REST_Controller.php');

class Restmanus extends REST_Controller {
	
	public function index_get() {
		$this->load->model('muser');
		$reqUsername = $this->get('userName');
		$data = $this->muser->findOneByUserName($reqUsername);
		
		$dataResponse = array();
		if (isset($data)) {
			$dataResponse['data'] = $data;
		} else {
			$dataResponse['data'] = null;
			$dataResponse['message'] = "User tidak ditemukan";
		}
		
		$this->response($dataResponse, 200);
	}
	
	public function index_post() {
//		$username = $this->post('userName');
//		$data = array(array(
//			'username' => $this->post('userName'),
//			'nip' => $this->post('accountNumber'),
//			'full_name' => $this->post('fullName'),
//			'jabatan' => $this->post('accountPosition'),
//			'password' => $this->post('password'),
//			'unit_kerja_id' => $this->post('departement'),
//			'user_level_id' => $this->post('role'))
//		);
		
		$input_data = json_decode(trim(file_get_contents('php://input')), true);
		$data = array(array(
			'username' => $input_data['userName'],
			'nip' => $input_data['accountNumber'],
			'full_name' => $input_data['fullName'],
			'jabatan' => $input_data['accountPosition'],
			'password' => $input_data['password'],
			'unit_kerja_id' => $input_data['departement'],
			'user_level_id' => $input_data['role'])
		);
		
		$this->load->model('muser');
		$this->muser->add($data);

		$dataResponse = array();
		$dataResponse['data'] = $data;
		$dataResponse['message'] = "User telah berhasil disimpan";
//		if (isset($insertUserId)) {
//			
//		}
		$this->response($dataResponse, 200);
	}
}