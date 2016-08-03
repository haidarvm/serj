<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');
/**
 *
 * @author: Atang Sutisna
 * email : atang.sutisna.87@gmail.com
 */
	require_once(APPPATH.'libraries/REST_Controller.php');

class Restlhp extends REST_Controller {
	
	public function index_post() {
		$this->load->library('session');
		try {
			if (!$this->session->has_userdata('user_id')) {
				throw new Exception('Access Denied');
			}
			
			$team = array_merge($this->post('team'), 
			$this->post('teamPerpanjangan'));
		
			$lhpData = array(
				'no_surat_tugas' => $this->post('noSuratTugas'),
				'tanggal_surat_tugas' => $this->post('tglSuratTugas'),
				'jenis_pengawasan_id' => $this->post('jenisPengawasanId'),
				'objek_pengawasan' => $this->post('objekPengawasan'),
				'hari_awal_penugasan' => $this->post('startHariPenugasan'),
				'hari_akhir_penugasan' => $this->post('endHariPenugasan'),
				'skop_awal_penugasan' => $this->post('startSkopPenugasan'),
				'skop_akhir_penugasan' => $this->post('endSkopPenugasan'),
				
				'nomor_lhp' => $this->post('nomorLhp'),
				'judul_lhp' => $this->post('judulLhp'),
				'tanggal_lhp' => $this->post('tglLhp'),
			
	//			'nama_ppk' => $this->post('namaPpk'),
	//			'pj_kegiatan' => $this->post('pjKegiatan'),
				'st_perpanjangan' => $this->post('stPerpanjangan'),
				'tgl_st_perpanjangan' => $this->post('tglStPerpanjangan'),
				'hari_awal_perpanjangan_penugasan' => $this->post('startPerpanjanganPenugasan'),
				'hari_akhir_perpanjangan_penugasan' => $this->post('endPerpanjanganPenugasan'),
				'user_id' => $this->session->userdata('user_id')
			);
			
			$teamLhp = array();
			//workaround for transction
			$this->load->model('mlhp');
			$lhpId = $this->mlhp->insertLHP($lhpData);
			if (isset($lhpId)) {
				$this->load->model('timlhp');
				
				foreach($team as $member) {
					array_push($teamLhp, array(
						'lhp_id' => $lhpId,
						'kategory_tim' => $member['kategoryTim'],
						'tim_id' => $member['teamId'],
						'nama_tim' => $member['namaTim']
					));
				}
				
				if (count($teamLhp) > 0) {
					$this->timlhp->insert_batch($teamLhp);
				}
			}
			
			$lhpData['team'] = $teamLhp;
			$lhpData['lhpId'] = $lhpId;
			$dataResponse = array(
				'newLhp' => $lhpData,
				'totalTeamMember' => count($teamLhp),
				'message' => 'Data berhasil disimpan'
			);
			
			$this->response($dataResponse, 201);			
		} catch (Exception $ex) {
			$this->response(array(
				'message' => $ex->getMessage()
			), 400);
		}
	}
	
	public function content_get() {
		$this->load->model('Mlhp', 'mlhp');
		$listKodeTemuan = $this->mlhp->getAllKodeTemuan();
		$dataResponse = array(
			'data' => $listKodeTemuan,
			'size' => count($listKodeTemuan)
		);
		$this->response($dataResponse, 201);
	}
	
//	public function test_post() {
//		$postTeam = $this->post('childs');
//		
//		$team = array();
//		foreach($postTeam['team'] as $teamItem) {
//			$team[] = [$teamItem['name']];
//		}
//		$this->response(array(
//			'data' => $team,
//		), 200);
//	}
}