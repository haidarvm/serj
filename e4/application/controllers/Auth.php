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
			if (isset($_SESSION['logged'])) {
				if ($_SESSION['logged'] == "tlhp") {
					// echo 'ada id nya 2</br>' . var_dump($_SESSION['logged']);exit();
					redirect('tlhp/menusa');
				} else {
					// echo 'else ada id nya 2</br>' . var_dump($_SESSION['logged']);exit();
					redirect('home');
				}
			} else {
				redirect('home');
			}
		} else {
			$this->load->view('tlhp/login', $data);
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
					define_sess($login->username, $login->user_id, $login->full_name, $login->email, $login->user_level_id);
					// redirect('home');
					// echo 'tst';exit;
					previous_url();
				} else {
					// echo 'Username And Password are invalid';
					// die();
					// throw new Exception("Username Or Password is invalid");
					$msg = "Username Or Password is invalid";
					$this->login($msg);
				}
			} catch ( Exception $e ) {
				echo $e->getMessage();
			}
		}
	}

	public function logout() {
		$this->muser->user_logout($_SESSION['user_id']);
		session_destroy();
		redirect('home');
	}

	public function info() {
		// echo date('D, d-M-Y H:i:s');
		echo floor('107.84764739189254');
		phpinfo();
	}

	public function count_char() {
		echo strlen("JL. BUKIT DAGO SELATAN NO. 1 ");
	}
}
