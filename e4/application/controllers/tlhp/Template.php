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
		$this->load->model('mtemplate');
		$this->muser = new MUser();
		$this->mtemplate = new mtemplate();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$data['title'] = "Daftar Laporan";
		// $data['getAll'] = $this->muser->getAllUser();
		// $data["getAll"] = $this->muser->getAllTemplate();
		// $this->load->tlhp_template('tlhp/template', $data);
		$this->daftarlap();
	}
	
	// public function daftarlap() {
	// }
	public function get_daftarlap_list() {
		$requestData = $this->input->get();
		
		$columns = array(0 => 'template_laporan_id', 1 => 'nomor_laporan', 2 => 'periode_laporan', 3 => 'create_date', 4 => 'tanggal_laporan', 5 => 'judul_laporan');
		
		$query = $this->mtemplate->getAllTemplate($cond = NULL, $order_by = NULL);
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
		$query2 = $this->mtemplate->getAllTemplate($cond);
		$totalFiltered = $query2->num_rows();
		$order_by3 = " ORDER BY " . $columns[$requestData['order'][0]['column']] . "   " . $requestData['order'][0]['dir'] . "  LIMIT " . $requestData['start'] . " ," . $requestData['length'] . "   ";
		$query3 = $this->mtemplate->getAllTemplate($cond, $order_by3);
		;
		$data = array();
		$x = 1;
		foreach ( $query3->result_array() as $row ) {
			$y = $x ++;
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

	public function daftarlap() {
		$data['title'] = "Daftar Laporan";
		$data['getAllTemplate'] = $this->mtemplate->getAllTemplate($cond = NULL, $order_by = NULL);
		$this->load->tlhp_template('tlhp/daftarlap', $data);
	}

	public function laporan() {
		$data['title'] = "Tambah Template";
		$data['action'] = "add";
		$this->load->tlhp_template('tlhp/template_laporan', $data);
	}

	public function update_laporan($id) {
		$data['title'] = "UPDATE Template";
		$data['action'] = "update";
		
		$post = $this->input->post();
		if ($post) {
// 			echo 'masuk';exit();
			$this->mtemplate->updateTemplateLaporan($post,$id);
			redirect('tlhp/template/daftarlap');
		} else {
			$data['template'] = $this->mtemplate->getTemplate($id);
			$this->load->tlhp_template('tlhp/template_laporan', $data);
		}
	}

	public function update_proccess() {
		// test
	}
	
	public function upload_media_proccess() {
		$get = $this->input->get();
		$data = array (array(
				'file_name' => @$get['file_name'],
				'ext' => @$get['ext'],
				'size' => @$get['size'],
				'url' => @$get['url'],
				'path' => @$get['path']
		));
		
		echo $this->mtemplate->insertMedia($data);
		exit();
		
	}
	
	

	public function insert_template_laporan() {
		$post = $this->input->post();
		
		// Insert Img ID
		$imgId = $post['img_id'];
		
		if ($post) {
			// $insert['waktu']=date('Y-m-d H:i:s');
			$post['user_id'] = $_SESSION['user_id'];
			unset($post['img_id']);
			
			$template_laporan_id = $this->mtemplate->insertTemplateLaporan($post);
			
			if (count($imgId) != 0) {	
				
				foreach ($imgId as $id) {
					$data = array(array(
							'template_laporan_id' => $template_laporan_id,
							'upload_template_id' => $id,
					));
					$this->mtemplate->insertTemplateLaporanMedia($data);
				}
				
			}
			
			redirect('tlhp/template/daftarlap');
		}
		// $this->load->tlhp_template('tlhp/template_laporan');
	}
}
