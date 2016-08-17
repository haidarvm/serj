<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');
	
/**
 *
 * @author Atang Sutisna
 * email : atang.sutisna.87@gmail.com
 */
class Tndklanjut extends MY_Controller {
	
	public function __construct() {
		parent::__construct();
		$this->load->model('mlhp');
		$this->load->model('Mkertaskerjatemuan', 'mkkt');
		$this->load->model('Mrekomendasi', 'mrekomendasi');
		$this->load->model('Mtindaklanjut', 'mtl');
	}
	
	public function update() {
		$this->load->library('session');
		$posts = $this->input->post();
		
		$toBeInsert = array();
		foreach ($posts['tindakLanjut'] as $idx => $rowTl) {
			$updater = $this->session->userdata('user_id');
			$tl = array(
				'tindak_lanjut_id' => $idx,
				'nilai_disetujui' => $rowTl['approvalValue'],
				'saldo_rekomendasi' => $rowTl['saldoRekomendasi']
			);
			
			$status = (int) $rowTl['status_tl'];
			if ($status >= 0) {
				$tl['status_tl'] = $status;
			}
			
			if (isset($rowTl['approvalStatus'])) {
				$tl['approval_status'] = 'approved';
				$tl['approved_by'] = $updater;
			} else {
				$tl['approval_status'] = 'rejected';
				$tl['rejected_by'] = $updater;
			}
			
			array_push($toBeInsert, $tl);
		}
		
//		var_dump($toBeInsert);
		$this->mtl->updateAll($toBeInsert);
		redirect('tlhp/lhp/edit?lhp_id='.$posts['lhp_id']);
	}
	
	public function view($rekomendasiId) {
		try {
			$rekomendasi = $this->mlhp->getRekomendasi($rekomendasiId);
			if ($rekomendasi == null) {
				throw new Exception("Undefined rekomendasi id");
			}
			
			$tindakLanjut = $this->mlhp->getAllTindakLanjut($rekomendasi->rekomendasi_id); 
			$kertasKerjaTemuan = $this->mlhp->getKertasKerjaTemuan($rekomendasi->kertas_kerja_id);
			$lhp = $this->mlhp->getLHP($kertasKerjaTemuan->lhp_id);
			if ($lhp == null) {
				throw new Exception("Undefined lhp id");
			}
			
			$data = array(
				'title' => "DATA TEMUAN",
				'rekomendasi' => $rekomendasi,
				'tindakLanjut' => $tindakLanjut,
				'kertasKerjaTemuan' => $kertasKerjaTemuan,
				'lhp' => $lhp,
			);
			$this->load->tlhp_template('tlhp/tndklanjut/view', $data);	
		} catch (Exception $e) {
			show_404();
		}
	}
		
}