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
		$this->response(array('name' => 'atang'), 200);
	}
	
	public function index_post() {
		$data = array(
			'input_name' => $this->post('name')
		);
		$this->response($data, 200);
	}
}