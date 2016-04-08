<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Auth extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->muser = new MUser();
		$this->load->model('matlet');
		$this->matlet = new MAtlet();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$this->login();
	}

	public function login($msg = NULL) {
		$data['msg'] = $msg;
		$data['pageTitle'] = "Login";
		if (isset($_SESSION['user_id'])) {
			redirect('home');
		} else {
			$this->load->view('login', $data);
		}
		// $this->load->user_template('admin/login', $data);
	}

	public function login_atlet($msg = NULL) {
		$data['msg'] = $msg;
		$data['pageTitle'] = "Login";
		if (isset($_SESSION['user_id'])) {
			// redirect('admin/atlet/insert');
		} else {
			$this->load->view('login_atlet', $data);
		}
		// $this->load->user_template('admin/login', $data);
	}

	public function do_login() {
		$post = $this->input->post();
		if ($post) {
			try {
				$login = $this->muser->login($post['username'], $post['password']);
				if ($login !== FALSE) {
					// echo 'masuk benar';
					define_sess($login->username, $login->user_id, $login->full_name, $login->email, $login->level_id);
					redirect('home');
				} else {
					// echo 'Username And Password are invalid';
					// die();
					// throw new Exception("Username Or Password is invalid");
					$msg = "Username Or Password is invalid";
					$this->login($msg);
				}
			} catch (Exception $e ) {
				echo $e->getMessage();
			}
		}
	}

	public function json_login_user() {
		$post = $this->input->post();
		header('Content-Type: application/json');
		if ($post) {
			try {
				$login = $this->muser->login($post['username'], $post['password']);
				if ($login !== FALSE) {
					// echo 'masuk benar';
					define_sess($login->username, $login->user_id, $login->full_name, $login->email, $login->level_id);
					$response['error_no'] = 0;
					$response['error_msg'] = "Username Or Password is Correct";
					$response['user_detail'] = $login;
					echo json_encode($response);
					// redirect('atlet/list');
				} else {
					$response['error_no'] = 100;
					$response['error_msg'] = "Username Or Password is invalid";
					echo json_encode($response);
				}
			} catch (Exception $e ) {
				echo $e->getMessage();
			}
		}
	}

	/**
	 * For Andriod Use 
	 */
	public function json_login_atlet() {
		$post = $this->input->post();
		header('Content-Type: application/json');
		if ($post) {
			try {
				$login = $this->matlet->login($post['username'], $post['password']);
				if ($login !== FALSE) {
					// echo 'masuk benar';
					// define_sess($login->username, $login->user_id, $login->full_name, $login->email, $login->level_id);
					$response = array();
					$response['error_no'] = 0;
					$response['error_msg'] = "Username Or Password is Correct";
					// $response['user_detail'] = $login;
					$user_detail = $this->matlet->getAtletDetailApi($login->atlet_id);
					$phone = $this->matlet->getAllAtletPhone($login->atlet_id);
					$noper = $this->matlet->getAllAtletNoper($login->atlet_id);
					$img = ! empty($user_detail->image) ? base_url(). 'assets/atlet_dp/' . $user_detail->image : base_url() . 'assets/img/default_user.jpg';
					$response['user_detail'] = $user_detail;
					$response['user_detail']->img = $img;
					echo json_encode($response);
				} else {
					$response['error_no'] = 100;
					$response['error_msg'] = "Username Or Password is invalid";
					echo json_encode($response);
				}
			} catch (Exception $e ) {
				echo $e->getMessage();
			}
		}
	}

	public function logout() {
		$this->muser->user_logout($_SESSION['user_id']);
		session_destroy();
		redirect('home');
	}
	
	public function info(){
		//echo date('D, d-M-Y H:i:s');
		echo floor('107.84764739189254');
		phpinfo();
	}
	
	public function count_char(){
		echo strlen("JL. BUKIT DAGO SELATAN NO. 1 ");
	}
}
