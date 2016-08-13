<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');
	
/**
 *
 * @author Atang Sutisna
 * email : atang.sutisna.87@gmail.com
 */

class Lhp extends MY_Controller {
	
	public function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->load->model('mlhp');
		$this->muser = new MUser();
		$this->mlhp = new MLhp();
	}
	
	public function historytl($rekomendasiId) {
		$rekomendasi = $this->mlhp->getRekomendasi($rekomendasiId);
		$tindakLanjut = $this->mlhp->getAllTindakLanjut($rekomendasi->rekomendasi_id); 
		$kertasKerjaTemuan = $this->mlhp->getKertasKerjaTemuan($rekomendasi->kertas_kerja_id);
		$lhp = $this->mlhp->getLHP($kertasKerjaTemuan->lhp_id);
		$data = array(
			'title' => "DATA TEMUAN",
			'rekomendasi' => $rekomendasi,
			'tindakLanjut' => $tindakLanjut,
			'kertasKerjaTemuan' => $kertasKerjaTemuan,
			'lhp' => $lhp
		);
		$this->load->tlhp_template('tlhp/historytl', $data);
	}
	
	public function savetl() {
		$this->load->library('session');
		$this->load->model('mtindaklanjut', 'rtl');
		$posts = $this->input->post();
//		var_dump($posts);
		$toBeInsert = array();
		foreach ($posts['tindakLanjut'] as $idx => $rowTl) {
			$updater = $this->session->userdata('user_id');
			$tl = array(
				'tindak_lanjut_id' => $idx,
				'nilai_disetujui' => $rowTl['approvalValue'],
				'status_tl' => $rowTl['status'],
				'saldo_rekomendasi' => $rowTl['saldoRekomendasi']
			);
			
			if (isset($rowTl['approvalStatus'])) {
				$tl['approval_status'] = 'approved';
				$tl['approved_by'] = $updater;
			} else {
				$tl['approval_status'] = 'rejected';
				$tl['rejected_by'] = $updater;
			}
			
			array_push($toBeInsert, $tl);
		}
		
		$this->rtl->insertAll($toBeInsert);
		echo "berhasil";
	}
}