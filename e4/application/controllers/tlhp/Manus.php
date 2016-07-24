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
		$data['title'] = "Management User";
		//$data['getAll'] = $this->muser->getAllUser();
		$this->load->tlhp_template('tlhp/manus', $data);
	}
	
	public function stat() {
		$data['title'] = "Stat";
		//$data['getAll'] = $this->muser->getAllUser();
		$this->load->tlhp_template('tlhp/stat', $data);
		
	}
	
	/**
	 * For All User
	 */
	function get_all_user() {
		$requestData = $this->input->post();
		// print_r($requestData['search']['value']);exit;
		$columns = array( 0 => 'atlet_id', 1 => 'full_name', 2 => 'cabor', 3 => 'gender', 4 => 'jabatan' );
		// echo $sql;
		// $order_by = " ORDER BY employee_name LIMIT 10,10 ";
		$query = $this->muser->getAllAtletSql($cond = NULL, $order_by = NULL);
		// echo $query; exit;
		$totalData = $query->num_rows();
		$totalFiltered = $totalData;
		if (! empty($requestData['search']['value'])) {
			$cond = "AND ( full_name LIKE '%" . $requestData['search']['value'] . "%' ";
			$cond .= "OR cabor LIKE '%" . $requestData['search']['value'] . "%' ";
			$cond .= " OR jabatan LIKE '%" . $requestData['search']['value'] . "%' )";
			// echo 'masuk';
		} else {
			$cond = NULL;
		}
		$query2 = $this->muser->getAllAtletSql($cond);
		$totalFiltered = $query2->num_rows();
		$order_by3 = " ORDER BY " . $columns[$requestData['order'][0]['column']] . "   " . $requestData['order'][0]['dir'] . "  LIMIT " . $requestData['start'] . " ," . $requestData['length'] . "   ";
		$query3 = $this->muser->getAllAtletSql($cond, $order_by3);
		;
		$data = array();
		foreach ($query3->result_array() as $row ) {
			$nestedData = array();
			$nestedData[] = $row["atlet_id"];
			$nestedData[] = $row["full_name"];
			$nestedData[] = $row["cabor"];
			$nestedData[] = $row["gender"];
			$nestedData[] = $row["jabatan"];
			$data[] = $nestedData;
		}
		$json_data = array( "draw" => intval($requestData['draw']), "recordsTotal" => intval($totalData), "recordsFiltered" => intval($totalFiltered), "data" => $data );
		echo json_encode($json_data);
	}

	/**
	 * List All Product
	 *
	 * @param string Category slug
	 */
	
}
