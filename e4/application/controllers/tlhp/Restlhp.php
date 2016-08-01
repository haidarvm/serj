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
		$data = array(
			'no_surat_tugas' => $this->post('noSuratTugas'),
			'tanggal_surat_tugas' => $this->post('tglSuratTugas'),
			'hari_awal_penugasan' => $this->post('hariAwalPenugasan'),
			'hari_akhir_penugasan' => $this->post('hariAkhirPenugasan'),
			'skop_awal_penugasan' => $this->post('skopAwalPenugasan'),
			'skop_akhir_penugasan' => $this->post('skopAkhirPenugasan'),
			'jenis_pengawasan_id' => $this->post('jenisPengawasanId'),
			'object_pengawasan' => $this->post('objectPengawasan'),
			'judul_lhp' => $this->post('judulLhp'),
			'nomor_lhp' => $this->post('nomorLhp'),
			'tanggal_lhp' => $this->post('tglLhp'),
			'nama_ppk' => $this->post('namaPpk'),
			'pj_kegiatan' => $this->post('pjKegiatan'),
			'st_perpanjangan' => $this->post('stPerpanjangan'),
			'tgl_st_perpanjangan' => $this->post('tglStPerpanjangan'),
			'hari_awal_perpanjangan_penugasan' => $this->post('hariAwalPerpanjanganPenugasan'),
			'hari_akhir_perpanjangan_penugasan' => $this->post('hariAkhirPerpanjanganPenugasan'),
			'user_id' => $this->post('userId')
		);
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