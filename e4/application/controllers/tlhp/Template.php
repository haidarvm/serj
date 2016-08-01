<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Template extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->load->model('mlhp');
		$this->muser = new MUser();
		$this->mlhp = new MLhp();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$data['title'] = "Daftar Laporan";
		// $data['getAll'] = $this->muser->getAllUser();
// 		$data["getAll"] = $this->muser->getAllTemplate();
		$this->load->tlhp_template('tlhp/template', $data);
// 		$this->laporan();
	}

// 	public function daftarlap() {
// 	}
	
	
	public function get_daftarlap_list() {
	
		$requestData = $this->input->get();
	
		$columns = array(
				0 => 'nomor_laporan',
				1 => 'periode_laporan',
				2 => 'create_date',
				3 => 'tanggal_laporan',
				4 => 'judul_laporan');
	
		$query = $this->mlhp->getAllTemplate($cond = NULL, $order_by = NULL);
		$totalData = $query->num_rows();
		$totalFiltered = $totalData;
	
		// For Search value
		if (! empty($requestData['search']['value'])) {
			$cond = "AND ( judul_laporan LIKE '%" . $requestData['search']['value'] . "%' ";
			$cond .= "OR nomor_laporan LIKE '%" . $requestData['search']['value'] . "%' ";
			$cond .= " OR periode_laporan LIKE '%" . $requestData['search']['value'] . "%' )";
		} else {
			$cond = NULL;
		}
		$query2 = $this->mlhp->getAllTemplate($cond);
		$totalFiltered = $query2->num_rows();
		$order_by3 = " ORDER BY " . $columns[$requestData['order'][0]['column']] . "   " . $requestData['order'][0]['dir'] . "  LIMIT " . $requestData['start'] . " ," . $requestData['length'] . "   ";
		$query3 = $this->mlhp->getAllTemplate($cond, $order_by3);
		;
		$data = array();
		$x = 1;
		foreach ( $query3->result_array() as $row ) {
			$y = $x++;
			$nestedData['no'] = $y;
			$nestedData['nomor_laporan'] = $row["nomor_laporan"];
			$nestedData["periode_laporan"] = $row["periode_laporan"];
			$nestedData["create_date"] = $row["create_date"];
			$nestedData["tanggal_laporan"] = $row["tanggal_laporan"];
			$nestedData["judul_laporan"] = $row["judul_laporan"];
			$data[] = $nestedData;
		}
	
		$json_data = array("draw" => intval($requestData['draw']), "recordsTotal" => intval($totalData), "recordsFiltered" => intval($totalFiltered), "data" => $data);
		echo json_encode($json_data);
	
	}

	public function laporan() {
		$data['title'] = "PILIH Template";
		$this->load->tlhp_template('tlhp/template_laporan', $data);
	}

	public function insert_template_laporan() {
		$post = $this->input->post();
		if ($post) {
			// print_r($insert);exit;
			// $insert['waktu']=date('Y-m-d H:i:s');
			$post['user_id'] = $_SESSION['user_id'];
			$template_laporan_id = $this->mlhp->insert_templateLaporan($post);
			// $insert_id;
			// redirect('ctrl/tampil');
		}
		// $this->load->tlhp_template('tlhp/template_laporan');
	}
}
