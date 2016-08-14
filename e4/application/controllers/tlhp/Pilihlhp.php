<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Pilihlhp extends MY_Controller {

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
		$this->pilih();
	}

	public function pilih() {
		$data['title'] = "UPDATE LHP";
		$data['getAllLHP'] = $this->mlhp->getAllLHP();
		$post = $this->input->post();
		if ($post) {
			echo 'test';
		}
		$this->load->tlhp_template('tlhp/pilihlhp', $data);
	}

	public function list_lhp() {
		$data['data_lhp'] = $this->mlhp->getAllLHPKK();
		$this->load->tlhp_template('tlhp/data_lhp', $data);
	}

	public function get_lhp($lhp_id) {
		$data['title'] = "UPDATE LHP";
		$data['lhp'] = $this->mlhp->getLHP($lhp_id);
		$data['title'] = "Kertas Kerja Laporan Hasil Pengawasan Baru";
		$data['action'] = "update";
		// $data['getAll'] = $this->muser->getAllUser();
		$this->load->tlhp_template('tlhp/kklhp', $data);
		// redirect pilih
	}
	
	public function updatelhponly(){
		redirect('tlhp/addlhp/update');
	}
	
	public function updatekklhp() {
			$data['kode_temuan'] = $this->mlhp->getAllKodeTemuan();
			$data['kode_sebab'] = $this->mlhp->getAllKodeSebab();
			$data['action'] = "update";
			$data['kode_rekomendasi'] = $this->mlhp->getAllKodeRekomendasi();
			$data['title'] = "UPDATE LHP";
			$lhp_id = $post['lhp_id'];
			$data['lhp'] = $this->mlhp->getLHP($lhp_id);
			$data['title'] = "Kertas Kerja Laporan Hasil Pengawasan Baru";
			// $data['update'] = "update";
			// $data['getAll'] = $this->muser->getAllUser();
			$this->load->tlhp_template('tlhp/kklhp', $data);
		
	}
	
	
	
	public function save_to_excel($lhp_id) {
		$kode_temuan = $this->mlhp->getAllKodeTemuan();
		$kode_sebab = $this->mlhp->getAllKodeSebab();
		$kode_rekomendasi = $this->mlhp->getAllKodeRekomendasi();
		$lhp = $this->mlhp->getLHP($lhp_id);
		$data['title'] = "Kertas Kerja Laporan Hasil Pengawasan Baru";
		
		var_dump($kode_sebab);
		
		$param['title'] =$lhp->judul_lhp;
		$param['to'] = $lhp->objek_pengawasan;
		$param['table_top'] = array(
				'tahun'=>  isset($lhp->tanggal_lhp) ? year_only($lhp->tanggal_lhp):"",
				'no_lhp'=>  isset($lhp->nomor_lhp) ? year_only($lhp->nomor_lhp):"",
				'judul_lhp'=> isset($lhp->judul_lhp) ? $lhp->judul_lhp:"",
				'temuan' => '0',
				'rekom'=> '0',
				'sesuai'=>'0',
				'belum_sesuai'=>'0',
				'belum_tl'=>'0',
				'tidak_dpt_tl'=>'0',
		);
		//$this->writeToExcel($param);
	}
	
	private function writeToExcel($param = NULL) {
		$root =  $_SERVER['DOCUMENT_ROOT'];
		require_once $root.'/assets/inc/PHPExcel/Classes/PHPExcel.php';
	
		$objReader = PHPExcel_IOFactory::createReader('Excel5');
		$tpl = $root.'/assets/template-excel/tpl_update_lhp.xls';
		$objPHPExcel = $objReader->load($tpl);
	
		if (@$param['title'] != "") {
			$objPHPExcel->getActiveSheet()->setCellValue('A2', @$param['title']);
		}
	
		if (@$param['to'] != "") {
			$objPHPExcel->getActiveSheet()->setCellValue('A3', @$param['to']);
		}
	
		if (@$param['table_top'] != "") {
			if (is_array($param['table_top'])) {
				$tTop = $param['table_top'];
				$objPHPExcel->getActiveSheet()->setCellValue('A7', @$tTop['tahun']);
				$objPHPExcel->getActiveSheet()->setCellValue('B7', @$tTop['no_lhp']);
				$objPHPExcel->getActiveSheet()->setCellValue('C7', @$tTop['judul_lhp']);
				$objPHPExcel->getActiveSheet()->setCellValue('D7', @$tTop['temuan']);
				$objPHPExcel->getActiveSheet()->setCellValue('E7', @$tTop['rekom']);
				$objPHPExcel->getActiveSheet()->setCellValue('F7', @$tTop['sesuai']);
				$objPHPExcel->getActiveSheet()->setCellValue('G7', @$tTop['belum_sesuai']);
				$objPHPExcel->getActiveSheet()->setCellValue('H7', @$tTop['belum_tl']);
				$objPHPExcel->getActiveSheet()->setCellValue('I7', @$tTop['tidak_dpt_tl']);
			}
		}
	
		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
		$saving = $root.'/assets/data/lhp.xls';
		$objWriter->save($saving);
	}
	
	
	// $data['data_lhp'] = $this->mlhp->data_lhp()->result();
	// $this->load->tlhp_template('tlhp/data_lhp', $data);

/**
 * List All Product
 *
 * @param
 *        	string Category slug
 */
}