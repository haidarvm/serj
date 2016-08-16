<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Menusa extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->load->model('mlhp');
		$this->load->model('mkertaskerjatemuan');
		$this->load->model('mrekomendasi');
		$this->load->model('mtindaklanjut');
		$this->muser = new MUser();
		$this->mlhp = new MLhp();
		$this->mkertaskerjatemuan = new MKertaskerjatemuan();
		$this->mrekomendasi = new MRekomendasi();
		$this->mtindaklanjut = new MTindaklanjut();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$data['title'] = "TLHP Dashboard";
		$data['current_year'] = date('Y');
		$data['totalTemuan'] = $this->mkertaskerjatemuan->countByYear(date('Y'));
		$data['totalRekomendasi'] = $this->mrekomendasi->countByYear(date('Y'));
		$data['totalSelesaiTl'] = $this->mtindaklanjut->totalSelesaiTl();
		$data['totalBelumTl'] = $this->mtindaklanjut->totalBelumTL();
		$data['totalBelumSesuaiRekomendasi'] = $this->mtindaklanjut->totalBelumSesuaiRekomendasi();
		$data['totalKerugianNegara'] = $this->mrekomendasi->totalKerugianNegara();
		$this->load->tlhp_template('tlhp/menusa', $data);
// 		$data['totalTidakTl'] = $this->mtindaklanjut->totalBelumSesuaiRekomendasi();
	}
	
	public function cetak() {
		$data['pageTitle'] = "Rekapitulasi hasil pengawasan inspektorat";
		$data['current_year'] = date('Y');
		$data['totalTemuan'] = $this->mkertaskerjatemuan->countByYear(date('Y'));
		$data['totalRekomendasi'] = $this->mrekomendasi->countByYear(date('Y'));
		$data['totalSelesaiTl'] = $this->mtindaklanjut->totalSelesaiTl();
		$data['totalBelumTl'] = $this->mtindaklanjut->totalBelumTL();
		$data['totalBelumSesuaiRekomendasi'] = $this->mtindaklanjut->totalBelumSesuaiRekomendasi();
		$data['totalKerugianNegara'] = $this->mrekomendasi->totalKerugianNegara();
		$this->load->view('tlhp/menusa_print',$data);
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
		$reportMenusa = "";
		$data['report'] = $reportMenusa;
		$this->pdf($data, "menusa");
	}
	
	public function pie(){
		$data['title'] = "PIE";
		$this->load->view('report/pie', $data);
	}

	/**
	 * List All Product
	 *
	 * @param string Category slug
	 */
}