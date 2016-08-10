<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Upload extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->muser = new MUser();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$this->do_upload();
	}

	public function do_upload() {
		$data['title'] = 'test';
		$this->load->viwe('basicupload',$data);
	}
	
	public function test_excel() {
		$param['title'] = 'Hasil JUDUL 123';
		$param['to'] = 'Pada Pengawasan';
		$param['table_top'] = array(
				'tahun'=> '2016',
				'no_lhp'=>'67699',
				'judul_lhp'=> '1234AAA',
				'temuan' => '0',
				'rekom'=> '0',
				'sesuai'=>'0',
				'belum_sesuai'=>'0',
				'belum_tl'=>'0',
				'tidak_dpt_tl'=>'0',
		);
		$this->writeToExcel($param);
	}
	
	private function writeToExcel($param = NULL) {
		$root =  $_SERVER['DOCUMENT_ROOT'];
		require_once $root.'/assets/inc/PHPExcel/Classes/PHPExcel.php';
		
		define('EOL',(PHP_SAPI == 'cli') ? PHP_EOL : '<br />');
		
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
		//$objWriter->save(str_replace('.php', '.xls', __FILE__));
		$objWriter->save($saving);
	}
	
}
