<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Test extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->muser = new MUser();
	}

	public function index() {
		$data['title'] = 'test';
		echo APPPATH;
		// echo 'test';
		// $this->pdf($data);
	}

	public function userlog() {
		$data['pageTitle'] = 'Employee Report';
		$data['headers'] = array('log_id', 'full_name', 'username', 'jabatan', 'unit_kerja', 'last_login', 'lama_penggunaan');
		$userLog = $this->muser->getAllLogUser()->result();
		$x = 1;
		$userLogs = array();
		// print_r($userLog);exit;
		foreach ( $userLog as $row ) {
			if ($x % 2 == 0)
				$class = "genap";
			else
				$class = "ganjil";
			$x ++;
			array_push($userLogs, '<tr class="' . $class . '">', add_td($row->log_id), add_td($row->full_name), add_td($row->username), add_td($row->jabatan), add_td($row->unit_kerja), add_td($row->lama_penggunaan) . '</tr>');
		}
		$data['report'] = $userLogs;
		$this->pdf($data);
	}

	public function pdf($data, $report = NULL) {
		// $pdfFilePath = FCPATH . "assets/downloads/reports/$report.pdf";
		ini_set('memory_limit', '512M'); // boost the memory limit if it's low <img src="http://davidsimpson.me/wp-includes/images/smilies/icon_wink.gif" alt=";)" class="wp-smiley">
		$report_type = $report == NULL ? 'report' : $report;
		$html = $this->load->view("report/" . $report_type, $data, true); // render the view into HTML
		$this->load->library('pdf');
		$pdf = $this->pdf->load();
		$pdf->SetFooter($_SESSION['gps_full_name'] . '|{PAGENO}|' . date(DATE_RFC822)); // Add a footer for good measure <img src="http://davidsimpson.me/wp-includes/images/smilies/icon_wink.gif" alt=";)" class="wp-smiley">
		$pdf->WriteHTML($html); // write the HTML into the PDF
		$pdf->Output(); // save to file because we can
		exit();
	}
}
