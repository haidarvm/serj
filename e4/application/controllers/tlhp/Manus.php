<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Manus extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->muser = new MUser();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
                $data['title'] = "username";
		$data['action'] = 'add';
		$data['getAllLevel'] = $this->muser->getAllLevel();
		$data['getAllUnitKerja'] = $this->muser->getAllUnitKerja();
		$data['title'] = "Management User";
		// $data['getAll'] = $this->muser->getAllUser();
		$this->load->tlhp_template('tlhp/manus', $data);
	}

	public function stat() {
		$data['title'] = "Stat";
		// $data['getAll'] = $this->muser->getAllUser();
		$this->load->tlhp_template('tlhp/stat', $data);
	}

	/**
	 * For All User
	 */
	function get_all_user() {
		$requestData = $this->input->post();
		// print_r($requestData['search']['value']);exit;
		$columns = array(0 => 'user_id', 1 => 'full_name', 2 => 'nip', 3 => 'jabatan', 4 => 'username', 5 => 'unit_kerja', 6 => 'user_level');
		// echo $sql;
		// $order_by = " ORDER BY employee_name LIMIT 10,10 ";
		$query = $this->muser->getAllUserDt($cond = NULL, $order_by = NULL);
		// echo $query; exit;
		$totalData = $query->num_rows();
		$totalFiltered = $totalData;
		// For Search value
		if (! empty($requestData['search']['value'])) {
			$cond = "AND ( full_name LIKE '%" . $requestData['search']['value'] . "%' ";
			$cond .= "OR unit_kerja LIKE '%" . $requestData['search']['value'] . "%' ";
			$cond .= " OR jabatan LIKE '%" . $requestData['search']['value'] . "%' )";
			// echo 'masuk';
		} else {
			$cond = NULL;
		}
		$query2 = $this->muser->getAllUserDt($cond);
		$totalFiltered = $query2->num_rows();
		$order_by3 = " ORDER BY " . $columns[$requestData['order'][0]['column']] . "   " . $requestData['order'][0]['dir'] . "  LIMIT " . $requestData['start'] . " ," . $requestData['length'] . "   ";
		$query3 = $this->muser->getAllUserDt($cond, $order_by3);
		;
		$data = array();
		foreach ( $query3->result_array() as $row ) {
			$nestedData = array();
			$nestedData[] = $row["user_id"];
			$nestedData[] = $row["full_name"];
			$nestedData[] = $row["nip"];
			$nestedData[] = $row["jabatan"];
			$nestedData[] = $row["username"];
			$nestedData[] = $row["unit_kerja"];
			$nestedData[] = $row["user_level"];
			$data[] = $nestedData;
		}
		$json_data = array("draw" => intval($requestData['draw']), "recordsTotal" => intval($totalData), "recordsFiltered" => intval($totalFiltered), "data" => $data);
		echo json_encode($json_data);
	}

	function update($id = NULL) {
		$data['title'] = "username";
		$data['action'] = 'update';
		$data['user'] = $this->muser->getUser($id);
		$data['getAllLevel'] = $this->muser->getAllLevel();
		$data['getAllUnitKerja'] = $this->muser->getAllUnitKerja();
		$this->load->view('tlhp/user', $data);
	}

	function add() {
		$data['title'] = "username";
		$data['action'] = 'add';
		$data['getAllLevel'] = $this->muser->getAllLevel();
		$data['getAllUnitKerja'] = $this->muser->getAllUnitKerja();
		$this->load->view('tlhp/user', $data);
	}

	function user_prosess() {
		$post = $this->input->post();
		if ($post) {
			// Update
			if (! empty($post['user_id'])) {
				if ($post['password'] == $post['re_password']) {
					if (! empty($post['password'])) {
						$post['password'] = md5($post['password']);
					} else {
						unset($post['password']);
					}
					$this->muser->updateUser($post['user_id'], $post);
					redirect('tlhp/manus');
				} else {
					redirect('tlhp/manus');
				}
				// Insert
			} else {
				if ($post) {
					if (! empty($post['password'])) {
						$post['password'] = md5($post['password']);
					} else {
						unset($post['password']);
					}
					unset($post['re_password'], $post['form']);
					$insertUserId = $this->muser->insertUser($post);
					redirect(site_url() . 'admin/user');
				}
				$user_id = $this->muser->insertUser($post);
				redirect('tlhp/manus');
			}
		}
	}

	function delete($id = NULL) {
		if ($id != NULL) {
			$this->muser->delete($id);
			redirect('tlhp/manus');
		}
	}

/**
 * List All Product
 *
 * @param
 *        	string Category slug
 */
}
