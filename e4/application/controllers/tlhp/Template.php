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

	/**
	 * Add New Laporan
	 */
	public function laporan() {
		$data['title'] = "Tambah Template";
		$data['action'] = "add";
		$data['kata_pengantar'] = $this->kata_pengantar();
		$this->load->tlhp_template('tlhp/template_laporan', $data);
	}

	/**
	 * edit laporan
	 * @param unknown $template_laporan_id
	 */
	public function update_laporan($template_laporan_id) {
		$data['title'] = "UPDATE Template";
		$data['action'] = "update";
		
		$post = $this->input->post();
		if ($post) {
			// echo 'masuk';exit();
			$this->mtemplate->updateTemplateLaporan($post, $template_laporan_id);
			// $this->insert_template_laporan();
			$fileId = $post['file_id'];
			unset($post['file_id']);
			// print_r()
			if (count($fileId) != 0) {
				foreach ( $fileId as $upload_id ) {
					$data = array('template_laporan_id' => $template_laporan_id, 'upload_template_id' => $upload_id);
					$this->mtemplate->insertTemplateLaporanMedia($data);
				}
			}
			redirect('tlhp/template/daftarlap');
		} else {
			$data['kata_pengantar'] = $this->kata_pengantar();
			$data['template'] = $this->mtemplate->getTemplate($template_laporan_id);
			$data['templateFiles'] = $this->mtemplate->getMediaList($template_laporan_id);
			$this->load->tlhp_template('tlhp/template_laporan', $data);
		}
	}

	public function show_file_list() {
		$post = $this->input->post();
		if ($post != NULL) {
			$template_laporan_id = $post['template_laporan_id'];
			$getMediaLists = $this->mtemplate->getMediaList($template_laporan_id);
			
			foreach ( $getMediaLists->result() as $files ) {
				$col['upload_template_id'] = $files->upload_template_id;
				$col['file_name'] = $files->file_name;
				$col['ext'] = $files->ext;
				$col['url'] = $files->url;
				$col['update_date'] = $files->update_date;
				$get_col[] = $col;
			}
			exit(json_encode($get_col));
		}
	}

	public function download_files($upload_template_id) {
		// $post = $this->input->post();
		if ($upload_template_id) {
			$file = $this->mtemplate->getUploadTemplate($upload_template_id);
			
			$this->load->helper('download');
			
			if (!empty($file)) {
				$files = $file->url;
				$name = $file->file_name;
				$data = file_get_contents($files);
				force_download($name, $data);
				//redirect('template/daftarlap', 'refresh');
			}
		}
	}

	public function update_proccess() {
		// test
	}

	public function upload_media_proccess() {
		$get = $this->input->get();
		$data = array('file_name' => @$get['file_name'], 'ext' => getExt(@$get['file_name']), 'size' => @$get['size'], 'url' => @$get['url'], 'path' => @$get['path']);
		// $post = $this->input->post();
		// print_r($post);
		echo $this->mtemplate->insertMedia($data);
		exit();
	}

	public function insert_template_laporan() {
		$post = $this->input->post();
		
		// Insert File ID
		$fileId = $post['file_id'];
		
		if ($post) {
			// $insert['waktu']=date('Y-m-d H:i:s');
			$post['user_id'] = $_SESSION['user_id'];
			unset($post['file_id']);
			
			$template_laporan_id = $this->mtemplate->insertTemplateLaporan($post);
			if (count($fileId) != 0) {
				foreach ( $fileId as $id ) {
					$data = array('template_laporan_id' => $template_laporan_id, 'upload_template_id' => $id);
					$this->mtemplate->insertTemplateLaporanMedia($data);
				}
			}
			redirect('tlhp/template/daftarlap');
		}
		// $this->load->tlhp_template('tlhp/template_laporan');
	}
	
	public function kata_pengantar() {
		$template = '<p style="text-align: left; "><b>KATA PENGANTAR</b></p><p style="text-align: left; "><b>DAFTAR ISI</b></p><p style="text-align: left;"><b>RINGKASAN UNTUK PIMPINAN</b></p><p style="text-align: left;"><b>BAB I INFORMASI UMUM</b></p><p style="text-align: left;">A. Dasar Hukum</p><p style="text-align: left;">B. Struktur Organisasi</p><p style="text-align: left;">C. Tujuan Penyusunan Ikhtisar Pelaporan</p><p style="text-align: left;">D. Program Pengawasan dan Realisasinya</p><p style="text-align: left;"><b>BAB II HASIL PENGAWASAN</b></p><p style="text-align: left;">A. Audit</p><p style="text-align: left;">1. Audit Kinerja</p><p style="text-align: left;">2. Audit Dengan Tujuan Tertentu</p><p style="text-align: left;">B. Reviu</p><p style="text-align: left;">C. Evaluasi</p><p style="text-align: left;">D. Pemantauan</p><p style="text-align: left;">E. Kegiatan Pengawasan Lainnya</p><p style="text-align: left;"><b>BAB III HASIL PEMANTAUAN TINDAK LANJUT</b></p><p style="text-align: left;">A. Pemantauan Tindak Lanjut Hasil Pemeriksaan BPK-RI</p><p style="text-align: left;">B. Pemantauan Tindak Lanjut Hasil Pengawasan APIP</p><p style="text-align: left;"><b>BAB IV HASIL PENANGANAN PENGADUAN MASYARAKAT</b></p><p style="text-align: left;"><b>BAB V SIMPULAN, HAMBATAN DAN REKOMENDASI</b></p><p style="text-align: left;">A. Simpulan</p><p style="text-align: left;">B. Hambatan</p><p style="text-align: left;">C. Rekomendasi</p><p style="text-align: left;"><b>LAMPIRAN-LAMPIRAN</b></p>';
		return $template;
	}
}
