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
		$team = array_merge($this->post('team'), 
			$this->post('teamPerpanjangan'));
		
		$teamLhp = array();
		foreach($team as $member) {
			array_push($teamLhp, array(
				'kategory_tim' => $member['kategoryTim'],
				'tim_id' => $member['teamId'],
				'nama_tim' => $member['namaTim']
			));
		}
		
		$lhpData = array(
			'no_surat_tugas' => $this->post('noSuratTugas'),
			'tanggal_surat_tugas' => $this->post('tglSuratTugas'),
			'jenis_pengawasan_id' => $this->post('jenisPengawasanId'),
			'object_pengawasan' => $this->post('objectPengawasan'),
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
			'user_id' => $this->post('userId')
		);
		
		$dataResponse = array(
			'newLhp' => $lhpData,
			'team' => $teamLhp,
			'totalTim' => count($teamLhp)
		);
		
		$this->response($dataResponse, 200);
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