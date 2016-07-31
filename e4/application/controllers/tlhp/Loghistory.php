<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Loghistory extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->muser = new MUser();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$data['title'] = "LOG HISTORY USER";
		
		//$data['getAll'] = $this->muser->getAllUser();
		$this->load->tlhp_template('tlhp/loghistory', $data);
	}
	
	public function get_user_history_list() {
		
		$requestData = $this->input->get();
		
		$columns = array(
				0 => 'log_id', 
				1 => 'full_name', 
				2 => 'username', 
				3 => 'jabatan', 
				4 => 'unit_kerja', 
				5 => 'last_login',
				6 => 'lama_penggunaan')
		;
		
		$query = $this->muser->getAllLogUser($cond = NULL, $order_by = NULL);
		$totalData = $query->num_rows();
		$totalFiltered = $totalData;
		
		// For Search value
		if (! empty($requestData['search']['value'])) {
			$cond = "AND ( full_name LIKE '%" . $requestData['search']['value'] . "%' ";
			$cond .= "OR unit_kerja LIKE '%" . $requestData['search']['value'] . "%' ";
			$cond .= " OR jabatan LIKE '%" . $requestData['search']['value'] . "%' )";
		} else {
			$cond = NULL;
		}
		$query2 = $this->muser->getAllLogUser($cond);
		$totalFiltered = $query2->num_rows();
		$order_by3 = " ORDER BY " . $columns[$requestData['order'][0]['column']] . "   " . $requestData['order'][0]['dir'] . "  LIMIT " . $requestData['start'] . " ," . $requestData['length'] . "   ";
		$query3 = $this->muser->getAllLogUser($cond, $order_by3);
		;
		$data = array();
		$x = 1;
		foreach ( $query3->result_array() as $row ) {
			$y = $x++;
			$nestedData['no'] = $y;
			$nestedData['full_name'] = $row["full_name"];
			$nestedData["username"] = $row["username"];
			$nestedData["jabatan"] = $row["jabatan"];
			$nestedData["unit_kerja"] = $row["unit_kerja"];
			$nestedData["login"] = $row["login"];
			$nestedData["lama_penggunaan"] = $row["lama_penggunaan"];
			$data[] = $nestedData;
		}
		
		$json_data = array("draw" => intval($requestData['draw']), "recordsTotal" => intval($totalData), "recordsFiltered" => intval($totalFiltered), "data" => $data);
		exit(json_encode($json_data));
		
	}

	/**
	 * List All Product
	 *
	 * @param string Category slug
	 */
	
}