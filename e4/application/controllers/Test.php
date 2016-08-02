<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Test extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->muser = new MUser();
		$this->load->library('pdf');
	}

	public function index() {
		$data['title'] = 'test';
		echo APPPATH;
		// echo 'test';
		// $this->pdf($data);
	}

	public function userlog() {
		$data['pageTitle'] = 'Log History ' . get_current_app();
		$data['headers'] = array('NO', 'NAMA', 'USERNAME', 'JABATAN', 'UNIT KERJA', 'LAST LOGIN', 'LAMA PENGGUNAAN');
		$userLog = $this->muser->getAllLogUser($cond = NULL, $order_by = ' ORDER BY log_id DESC')->result();
		$x = 1;
		$userLogs = array();
		// print_r($userLog);exit;
		foreach ( $userLog as $row ) {
			if ($x % 2 == 0)
				$class = "genap";
			else
				$class = "ganjil";
			$x ++;
			array_push($userLogs, '<tr class="' . $class . '">', add_td($row->log_id), add_td($row->full_name), add_td($row->username), add_td($row->jabatan), add_td($row->unit_kerja), add_td($row->login), add_td($row->lama_penggunaan) . '</tr>');
		}
		$data['report'] = $userLogs;
		$this->pdf($data, "userlog");
	}

	public function pdf($data, $report) {
		// $pdfFilePath = FCPATH . "assets/downloads/reports/$report.pdf";
		ini_set('memory_limit', '512M'); // boost the memory limit if it's low <img src="http://davidsimpson.me/wp-includes/images/smilies/icon_wink.gif" alt=";)" class="wp-smiley">
// 		$report_type = $report == NULL ? 'report' : $report;
		$html = $this->load->view("report/report_" . $report, $data, true); // render the view into HTML
		$pdf = $this->pdf->load();
		$full_name = ! empty($_SESSION['full_name']) ? $_SESSION['full_name'] : '';
		$pdf->SetFooter($full_name . '|{PAGENO}|' . date(DATE_RFC822)); // Add a footer for good measure <img src="http://davidsimpson.me/wp-includes/images/smilies/icon_wink.gif" alt=";)" class="wp-smiley">
		$pdf->WriteHTML($html); // write the HTML into the PDF
		$pdf->Output(); // save to file because we can
		exit();
	}

	public function menusa() {
		$data['pageTitle'] = 'Report Dashboard TLHP ' . get_current_app();
		// $data['headers'] = array('TINDAK LANJUT HASIL PENGAWASAN', 'KERUGIAN KEUANGAN NEGARA');
		// $reportMenusa = $this->muser->getAllLogUser($cond = NULL, $order_by = ' ORDER BY log_id DESC')->result();
		$reportMenusa = "<tr>
							<td colspan='2'>TINDAK LANJUT HASIL PENGAWASAN</td>
							<td colspan='2'>KERUGIAN KEUANGAN NEGARA</td>
						</tr>
						<tr>
							<td>TOTAL TEMUAN SEJAK TAHUN 2013	:</td>
							<td>50</td>
						</tr>	
						<tr>
							<td>TOTAL REKOMENDASI SEJAK TAHUN 2013	:</td>
							<td>70</td>
						</tr>
						<tr>
							<td>SELESAI DITINDAKLANJUTI		:</td>
							<td>50</td>
						</tr>
						<tr>
							<td>BELUM SESUAI REKOMENDASI		:</td>
							<td>15</td>
						</tr>
						<tr>
							<td>BELUM DITINDAKLANJUTI		:</td>
							<td>30</td>
						</tr>
						<tr>
							<td>TIDAK DAPAT DITINDAKLANJUTI		:</td>
							<td>2</td>
						</tr>
				
						";
		$data['report'] = $reportMenusa;
		$this->pdf($data, "menusa");
	}
}
