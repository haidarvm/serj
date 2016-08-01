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
		//TODO: use exception if username is null
		$this->load->model('muser');
		$reqUsername = $this->get('username');
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
		//TODO: use exception
		$data = array(array(
			'username' => $this->post('userName'),
			'nip' => $this->post('accountNumber'),
			'full_name' => $this->post('fullName'),
			'jabatan' => $this->post('accountPosition'),
			'password' => $this->post('password'),
			'unit_kerja_id' => $this->post('departement'),
			'user_level_id' => $this->post('role'))
		);
		
		$this->load->model('muser');
		$this->muser->add($data);

		$dataResponse = array();
		$dataResponse['data'] = $data;
		$dataResponse['message'] = "Data berhasil disimpan";

		$this->response($dataResponse, 200);
	}
	
	public function index_put() {
		//TODO: use exception if userId is empty or null
		$data = array(
			'username' => $this->put('userName'),
			'nip' => $this->put('accountNumber'),
			'full_name' => $this->put('fullName'),
			'jabatan' => $this->put('accountPosition'),
			'password' => $this->put('password'),
			'unit_kerja_id' => $this->put('departement'),
			'user_level_id' => $this->put('role')
		);
		
		$this->load->model('muser');
		$this->muser->updateUser($this->put('userId'), $data);
		$dataResponse = array(
			'data' => $data,
			'message' => 'Data berhasil diubah'
		);
		$this->response($dataResponse, 200);
	}
	
	public function index_delete() {
		$this->response(array('id' => $this->get('id')), 200);
	}
}