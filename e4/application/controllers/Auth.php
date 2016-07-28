<?php
if (! defined ( 'BASEPATH' ))
	exit ( 'No direct script access allowed' );

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Auth extends MY_Controller {
	function __construct() {
		parent::__construct ();
		$this->load->model ( 'muser' );
		$this->muser = new MUser ();
	}
	
	/**
	 * Redirect to product_list
	 */
	public function index() {
		$this->login ();
	}
	public function login($msg = NULL) {
		// Get Account Type
		$accountType = $this->input->post ( 'account_type' );
		
		$data ['msg'] = $msg;
		$data ['accountType'] = $accountType;
		$data ['pageTitle'] = "Login";
		if (isset ( $_SESSION ['user_id'] )) {
			if (isset ( $_SESSION ['logged'] )) {
				if ($_SESSION ['logged'] == "tlhp") {
					// echo 'ada id nya 2</br>' . var_dump($_SESSION['logged']);exit();
					redirect ( 'tlhp/menusa' );
				} else {
					// echo 'else ada id nya 2</br>' . var_dump($_SESSION['logged']);exit();
					redirect ( 'home' );
				}
			} else {
				redirect ( 'home' );
			}
		} else {
			$this->load->view ( 'tlhp/login', $data );
		}
		// $this->load->user_template('admin/login', $data);
	}
	
	/**
	 * Still redirect to tlhp
	 */
	public function do_login() {
		
		// Account List
		$accountList = array (
				'_IKP_',
				'_BPK_',
				'_BPKP_',
				'_ORIX_' 
		);
		
		$post = $this->input->post ();
		if ($post) {
			$accountType = $post ['accountType'];
			try {
				
				// Setting Prefix Data with multi account and then write into file config
				if (in_array ( $accountType, $accountList )) {
					switch ($accountType) {
						case '_IKP_' :
							//write_file ( APPPATH . 'data/prefix.data', "tlhp_ikp_" );
							$this->setTempUserType('_prefixdata', 'tlhp_ikp_');
							break;
						case '_BPK_' :
							//write_file ( APPPATH . 'data/prefix.data', "tlhp_bpk_" );
							$this->setTempUserType('_prefixdata', 'tlhp_bpk_');
							break;
						case '_BPKP_' :
							//write_file ( APPPATH . 'data/prefix.data', "tlhp_bpkp_" );
							$this->setTempUserType('_prefixdata', 'tlhp_bpkp_');
							break;
						case '_ORIX_' :
							//write_file ( APPPATH . 'data/prefix.data', "tlhp_orix_" );
							$this->setTempUserType('_prefixdata', 'tlhp_orix_');
							break;
						default :
							//write_file ( APPPATH . 'data/prefix.data', "tlhp_" );
							$this->setTempUserType('_prefixdata', 'tlhp_');
							break;
					}
					
					$login = $this->muser->login ( $post ['username'], $post ['password'] );
					if ($login !== FALSE) {
						// echo 'masuk benar';
						define_sess ( $login->username, $login->user_id, $login->full_name, $login->email, $login->user_level_id );
						redirect ( 'tlhp' );
						// echo 'tst';exit;
						// previous_url();
					} else {
						// echo 'Username And Password are invalid';
						// die();
						// throw new Exception("Username Or Password is invalid");
						$msg = "Username Or Password is invalid";
						$this->login ( $msg );
					}
				} else {
					$msg = "Ilegal Login!!";
					$this->login ( $msg );
				}
			} catch ( Exception $e ) {
				echo $e->getMessage ();
			}
		} else {
			redirect ( 'home' );
			// previous_url();
		}
	}
	public function logout() {
		$this->muser->user_logout ( $_SESSION ['user_id'] );
		session_destroy ();
		setcookie("_prefixdata", "", time() - 3600);
		redirect ( 'home' );
	}
	public function info() {
		// echo date('D, d-M-Y H:i:s');
		echo floor ( '107.84764739189254' );
		phpinfo ();
	}
	public function count_char() {
		echo strlen ( "JL. BUKIT DAGO SELATAN NO. 1 " );
	}
	
	private  function setTempUserType($cookieName, $cookieValue) {
		$cookie_name = $cookieName;
		$cookie_value = $cookieValue;
		setcookie($cookie_name, $cookie_value, time() + (86400 * 30), "/"); // 86400 = 1 day
	}
}
