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
	
	public function codtemuan_get() {
		$this->load->model('Mlhp', 'mlhp');
		$listKodeTemuan = $this->mlhp->getAllKodeTemuan();
		$dataResponse = array(
			'data' => $listKodeTemuan,
			'size' => count($listKodeTemuan)
		);
		$this->response($dataResponse, 200);
	}
	
	public function codsebab_get() {
		$this->load->model('Mlhp', 'mlhp');
		$listKodeSebab = $this->mlhp->getAllKodeSebab();
		$dataResponse = array(
			'data' => $listKodeSebab,
			'size' => count($listKodeSebab)
		);
		$this->response($dataResponse, 200);
	}
	
	public function codrekomendasi_get() {
		$this->load->model('Mlhp', 'mlhp');
		$listKodeRekomendasi = $this->mlhp->getAllKodeRekomendasi();
		$dataResponse = array(
			'data' => $listKodeRekomendasi,
			'size' => count($listKodeRekomendasi)
		);
		$this->response($dataResponse, 200);
	}
	
	public function kklhp_post() {
		$this->load->library("session");
		try {
			if (!$this->session->has_userdata('user_id')) {
				throw new Exception('Access Denied');
			}
			
			$postLhp = $this->post('lhp');
		
			$this->load->model('Mlhp', 'mlhp');
			$dataKertasKejaTemuan = array();
			
			$postKertasKerjaTemuan = $this->post('kertasKerjaTemuan');
			//TODO: seharusnya ini dalam satu transaksi
			foreach ($postKertasKerjaTemuan as $kertasKerjaTemuan) {
				$kktId = $this->mlhp->insertKKLHP(array(
					'lhp_id' => $postLhp['lhp_id'],
					'jenis_temuan' => $kertasKerjaTemuan['jenis_temuan']['kode_jenis_temuan'],
					'kode_temuan_id' => $kertasKerjaTemuan['kode_temuan_id'],
					'uraian_temuan' => $kertasKerjaTemuan['uraian_temuan'],
					'kode_sebab_id' => $kertasKerjaTemuan['kode_sebab_id'],
					'uraian_sebab' => $kertasKerjaTemuan['uraian_sebab'],
					'nilai_temuan' => $kertasKerjaTemuan['nilai_temuan'],
					'user_id' => $this->session->userdata('user_id')
				));
				
				if (isset($kktId)) {
					$dataRekomendasi = array();
					$postRekomendasi = $kertasKerjaTemuan['rekomendasi'];
					foreach ($postRekomendasi as $rekomendasi) {
						array_push($dataRekomendasi, array(
							"kertas_kerja_id" => $kktId,
							"kode_rekomendasi_id" => $rekomendasi["kode_rekomendasi_id"],
							"uraian_rekomendasi" => $rekomendasi["uraian_rekomendasi"],
							"kerugian_negara" => $rekomendasi["kerugian_negara"],
							"nilai_rekomendasi" => $rekomendasi["nilai_rekomendasi"],
						));
					}
					$this->mlhp->insertBatchRekomendasi($dataRekomendasi);				
				}
				
			}
			
			$dataResponse = array(
				'message' => 'data suda disimpan'
			);
			$this->response($dataResponse, 201);
		} catch (Exception $ex) {
			$this->response(array(
				'message' => $ex->getMessage()
			), 400);
		}
	}
	
	public function lhp_get() {
		$this->load->model('Mlhp', 'mlhp');
		$lhp_id = $this->get("lhp_id");
		$lhp = $this->mlhp->getbyid($lhp_id);
		$kkt = $this->mlhp->getAllKertasKerjaTemuan($lhp_id);
		
		$kktIds = array();
		foreach ($kkt as $kktRow) {
			array_push($kktIds, $kktRow->kertas_kerja_id);
		}
		$kktUniqueIds = array_unique($kktIds);
		if (count($kktUniqueIds) > 0) {
			$rekomendasi = $this->mlhp->getAllRekomendasiByKktIds($kktUniqueIds);
			
			foreach ($kkt as $kktRow){
				$kktRekomendasi = array();
				foreach ($rekomendasi as $rekRow) {
					if ($rekRow->kertas_kerja_id == $kktRow->kertas_kerja_id) {
						array_push($kktRekomendasi, $rekRow);
					}
				}
				$kktRow->rekomendasi = $kktRekomendasi;
			}
		}
		
		$dataResponse = array(
			'lhp' => $lhp,
			'kertasKerjaTemuan' => $kkt,
			'totalKertasKerjaTemuan' => count($kkt),
		);
		$this->response(array(
			'data' => $dataResponse
		), 200);
	}
	
	public function kklhp_put() {
		$postLhp = $this->put('lhp');
		
		$this->load->model('Mlhp', 'mlhp');
		//TODO: harusnya dalam 1 transaksi
		$postKertasKerjaTemuan = $this->put('kertasKerjaTemuan');
		$updatedData = array();
		$updatedRekomendasiData = array();
		foreach ($postKertasKerjaTemuan as $kertasKerjaTemuan) {
			if (isset($kertasKerjaTemuan["kertas_kerja_id"])) {
				array_push($updatedData, array(
					'kertas_kerja_id' => $kertasKerjaTemuan["kertas_kerja_id"],
					'lhp_id' => $postLhp['lhp_id'],
					'jenis_temuan' => $kertasKerjaTemuan['jenis_temuan']['kode_jenis_temuan'],
					'kode_temuan_id' => $kertasKerjaTemuan['kode_temuan_id'],
					'uraian_temuan' => $kertasKerjaTemuan['uraian_temuan'],
					'kode_sebab_id' => $kertasKerjaTemuan['kode_sebab_id'],
					'uraian_sebab' => $kertasKerjaTemuan['uraian_sebab'],
					'nilai_temuan' => $kertasKerjaTemuan['nilai_temuan'],
					'user_id' => $this->session->userdata('user_id')
				));
			} 
		}
//		$this->mlhp->updateBatchKkt($updatedData);
		$this->response(array(
			'data' => $postKertasKerjaTemuan,
			'message' => 'Data berhasil diperbaharui',
			'updateDateCount' => count($updatedData)
		), 200);
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