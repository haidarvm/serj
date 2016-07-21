<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class User extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->muser = new MUser();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$this->register();
	}


	/**
	 * For Insert View
	 * And execute insert
	 */
	public function register() {
		$data['title'] = "Admin Create User";
		$data['action'] = 'insert';
		$post = $this->input->post();
		if ($post) {
			if (! empty($post['password'])) {
				$post['password'] = md5($post['password']);
			} else {
				unset($post['password']);
			}
			unset($post['re_password'], $post['form']);
			$insertUserId = $this->muser->insertUser($post);
			redirect(site_url() . 'home');
		}
		$this->load->user_template('user/user', $data);
	}

	/**
	 * For Edit / Update Product
	 *
	 * @param int $id        	
	 */
	public function update($id = NULL) {
		$data['title'] = "Admin Edit User";
		$data['action'] = 'update';
		$post = $this->input->post();
		if ($post) {
			// print_r($post);
			if ($post['password'] == $post['re_password']) {
				if (! empty($post['password'])) {
					$post['password'] = md5($post['password']);
				} else {
					unset($post['password']);
				}
				unset($post['re_password']);
				unset($post['form']);
// 				$post['username'] = $post['email'];
				$this->muser->updateUser($id, $post);
				redirect(site_url() . 'admin/user/user_list');
			} else {
				redirect(site_url() . 'admin/user/user_list/');
			}
		} else {
			$data['user'] = $this->muser->getUser($id);
			$this->load->admin_template('admin/user', $data);
		}
	}

	function delete($id) {
		$this->muser->delete($id);
		redirect('admin/user');
	}

	public function qr() {
		$data['username'] = 'haidarvm';
		$data['password'] = '12345';
		$output = base64_encode(json_encode($data));
		echo '<img src="https://chart.googleapis.com/chart?chs=300x300&cht=qr&chl='.$output.'" title="pass" />';
		
		
	}

	public function qr2() {
	}
}