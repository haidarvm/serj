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
	
	public function index_put() {
		$team = array_merge($this->put('team'), $this->put('teamPerpanjangan'));
		
		$lhpData = array(
			'no_surat_tugas' => $this->put('noSuratTugas'),
			'tanggal_surat_tugas' => $this->put('tglSuratTugas'),
			'jenis_pengawasan_id' => $this->put('jenisPengawasanId'),
			'objek_pengawasan' => $this->put('objekPengawasan'),
			'hari_awal_penugasan' => $this->put('startHariPenugasan'),
			'hari_akhir_penugasan' => $this->put('endHariPenugasan'),
			'skop_awal_penugasan' => $this->put('startSkopPenugasan'),
			'skop_akhir_penugasan' => $this->put('endSkopPenugasan'),
			
			'nomor_lhp' => $this->put('nomorLhp'),
			'judul_lhp' => $this->put('judulLhp'),
			'tanggal_lhp' => $this->put('tglLhp'),
		
			'st_perpanjangan' => $this->put('stPerpanjangan'),
			'tgl_st_perpanjangan' => $this->put('tglStPerpanjangan'),
			'hari_awal_perpanjangan_penugasan' => $this->put('startPerpanjanganPenugasan'),
			'hari_akhir_perpanjangan_penugasan' => $this->put('endPerpanjanganPenugasan'),
			'user_id' => $this->session->userdata('user_id')
		);
			
		$teamLhp = array();
		//workaround for transction
		$this->load->model('mlhp');
		$lhpId = $this->put('lhpId');
		if ($this->mlhp->updateLHP($lhpData, $lhpId)) {
			//I hate this code, should be refactor to be one transction
			$this->mlhp->deleteTimLhp($lhpId);
			
			foreach($team as $member) {
				array_push($teamLhp, array(
					'lhp_id' => $lhpId,
					'kategory_tim' => $member['kategoryTim'],
					'tim_id' => $member['teamId'],
					'nama_tim' => $member['namaTim']
				));
			}
			
			if (count($teamLhp) > 0) {
				$this->load->model('timlhp');
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
	}
	
	function clean($string) {
	   $string = str_replace(' ', '-', $string); // Replaces all spaces with hyphens.
	   return preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
	}
	
	public function codtemuan_get() {
		$this->load->model('Mlhp', 'mlhp');
		$listKodeTemuan = $this->mlhp->getAllKodeTemuan();
		$returnKodeTemuan = array();
		foreach ($listKodeTemuan as $kodeTemuan) {
			$kode = $kodeTemuan->kelompok.'.'.$kodeTemuan->sub_kelompok.'.'.$kodeTemuan->jenis;
			$deskripsi = $this->clean($kodeTemuan->kode_temuan);
			array_push($returnKodeTemuan, array(
				'kode_temuan_id' => $kodeTemuan->kode_temuan_id,
				'kode_temuan' => $kode,
				'deskripsi' => $deskripsi
			));
		}
		$dataResponse = array(
			'data' => $returnKodeTemuan,
			'size' => count($listKodeTemuan)
		);
		$this->response($dataResponse, 200);
	}
	
	public function codsebab_get() {
		$this->load->model('Mlhp', 'mlhp');
		$listKodeSebab = $this->mlhp->getAllKodeSebab();
		
		$returnVal = array();
		foreach ($listKodeSebab as $row) {
			array_push($returnVal, array(
				'kode_sebab_id' => $row->kode_sebab_id,
				'kode_sebab' => $row->kode_sebab,
				'uraian_sebab' => $row->uraian_sebab
			));
		}
		
		$dataResponse = array(
			'data' => $returnVal,
			'size' => count($returnVal)
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
							"nama_ppk" => $rekomendasi["nama_ppk"],
							"nama_pj" => $rekomendasi["nama_pj"],
							"unit_kerja_id" => $rekomendasi["unit_kerja_id"],
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
		$kkt = $this->get("kkt");
		
		$lhp = $this->mlhp->getbyid($lhp_id);
		$dataResponse = array(
			'lhp' => $lhp
		);
		if ($kkt) {
			$kkt = $this->mlhp->getAllKertasKerjaTemuan($lhp_id);
			$unitKerja = $this->mlhp->getAllUnitKerja();
			
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
			$dataResponse['kertasKerjaTemuan'] = $kkt;
			$dataResponse['totalKertasKerjaTemuan'] =count($kkt);
		} 
		
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
		$newRowRekomendasi = array();
		$newRowTindakLanjut = array();
		
		$testTindakLanjut;
		
		$addedData = array();
		foreach ($postKertasKerjaTemuan as $kertasKerjaTemuan) {
			if (isset($kertasKerjaTemuan["kertas_kerja_id"])) {
				array_push($updatedData, array(
					'kertas_kerja_id' => $kertasKerjaTemuan["kertas_kerja_id"],
					'lhp_id' => $postLhp['lhp_id'],
					'jenis_temuan' => strtolower($kertasKerjaTemuan['jenis_temuan']['kode_jenis_temuan']),
					'kode_temuan_id' => $kertasKerjaTemuan['kode_temuan_id'],
					'uraian_temuan' => $kertasKerjaTemuan['uraian_temuan'],
					'kode_sebab_id' => $kertasKerjaTemuan['kode_sebab_id'],
					'uraian_sebab' => $kertasKerjaTemuan['uraian_sebab'],
					'nilai_temuan' => $kertasKerjaTemuan['nilai_temuan'],
					'user_id' => $this->session->userdata('user_id')
				));
				$listRekomendasi = $kertasKerjaTemuan['rekomendasi'];
				foreach ($listRekomendasi as $rekomendasi) {
					if (isset($rekomendasi["rekomendasi_id"])) {
						array_push($updatedRekomendasiData, array(
							"rekomendasi_id" => $rekomendasi["rekomendasi_id"],
							"kode_rekomendasi_id" => $rekomendasi["kode_rekomendasi_id"],
							"uraian_rekomendasi" => $rekomendasi["uraian_rekomendasi"],
							"kerugian_negara" => $rekomendasi["kerugian_negara"],
							"nilai_rekomendasi" => isset($rekomendasi["nilai_rekomendasi"]) ? $rekomendasi["nilai_rekomendasi"] : 0,
							"nama_ppk" => $rekomendasi["nama_ppk"],
							"nama_pj" => $rekomendasi["nama_pj"],
							"unit_kerja_id" => $rekomendasi["unit_kerja_id"],
						));
						
						if (isset($rekomendasi['tindak_lanjut'])) {
							$tindakLanjut = $rekomendasi['tindak_lanjut'];
							if (count($tindakLanjut) > 0)
							array_push($newRowTindakLanjut, array(
								'rekomendasi_id' => $rekomendasi['rekomendasi_id'],
								'tindak_lanjut' => $tindakLanjut['uraian_tindak_lanjut'],
								'nilai' => $tindakLanjut['nilai'],
								'tanggal_tl' => $tindakLanjut['tanggal_tl'],
								'user_id' => $this->session->userdata('user_id')
							));
							
						}
					} else {
						//new row kkt
						array_push($newRowRekomendasi, array(
							"kertas_kerja_id" => $kertasKerjaTemuan["kertas_kerja_id"],
							"kode_rekomendasi_id" => $rekomendasi["kode_rekomendasi_id"],
							"uraian_rekomendasi" => $rekomendasi["uraian_rekomendasi"],
							"kerugian_negara" => $rekomendasi["kerugian_negara"],
							"nilai_rekomendasi" => isset($rekomendasi["nilai_rekomendasi"]) ? $rekomendasi["nilai_rekomendasi"] : 0,
							"nama_ppk" => $rekomendasi["nama_ppk"],
							"nama_pj" => $rekomendasi["nama_pj"],
							"unit_kerja_id" => $rekomendasi["unit_kerja_id"],
						));
					}
				}
			} else {
				array_push($addedData, $kertasKerjaTemuan);
			}
		}
		//TODO: should be in one transaction
		if (count($updatedData)) {
			$this->mlhp->updateBatchKkt($updatedData);
		}
		
		if (count($updatedRekomendasiData)) {
			$this->mlhp->updateBatchRekomendasi($updatedRekomendasiData);
		}
		
		if (count($newRowTindakLanjut)) {
			$this->mlhp->insertBatchTindakLanjut($newRowTindakLanjut);
		}
		
//		var_dump($newRowRekomendasi);
		if (count($newRowRekomendasi) > 0) {
			$this->mlhp->insertBatchRekomendasi($newRowRekomendasi);
		}
		
		if (count($addedData) > 0) {
//			$this->mlhp->insertBatchKkt($addedData);
			foreach ($addedData as $addedRow) {
				$kktId = $this->mlhp->insertKKLHP(array(
					'lhp_id' => $addedRow['lhp_id'],
					'jenis_temuan' => strtolower($addedRow['jenis_temuan']['kode_jenis_temuan']),
					'kode_temuan_id' => $addedRow['kode_temuan_id'],
					'uraian_temuan' => $addedRow['uraian_temuan'],
					'kode_sebab_id' => $addedRow['kode_sebab_id'],
					'uraian_sebab' => $addedRow['uraian_sebab'],
					'nilai_temuan' => $addedRow['nilai_temuan'],
					'user_id' => $this->session->userdata('user_id')
				));
				$rekomendasi = $addedRow['rekomendasi'];
				if (isset($kktId)) {
					$newRekomendasi = array();
					foreach ($rekomendasi as $rowRekomendasi) {
						array_push($newRekomendasi, array(
							"kertas_kerja_id" => $kktId,
							"kode_rekomendasi_id" => $rowRekomendasi["kode_rekomendasi_id"],
							"uraian_rekomendasi" => $rowRekomendasi["uraian_rekomendasi"],
							"kerugian_negara" => $rowRekomendasi["kerugian_negara"],
							"nilai_rekomendasi" => isset($rowRekomendasi["nilai_rekomendasi"]) ? $rowRekomendasi["nilai_rekomendasi"] : 0,
							"nama_ppk" => $rowRekomendasi["nama_ppk"],
							"nama_pj" => $rowRekomendasi["nama_pj"],
							"unit_kerja_id" => $rowRekomendasi["unit_kerja_id"],
						));
					}
					if (count($newRekomendasi) > 0) {
						$this->mlhp->insertBatchRekomendasi($newRekomendasi);
					}
				}
			}
		}
		
		
		$this->response(array(
			'data' => $postKertasKerjaTemuan,
			'message' => 'Data berhasil diperbaharui',
			'updateDateCount' => count($updatedData),
			'updatedData' => $updatedData,
			'addedData' => $addedData,
			'newRowTindakLanjut' => $newRowTindakLanjut
		), 200);
	}
	
	public function getcodesebab_get() {
		$kodeSebabId = $this->get("kode_sebab_id");
		$this->load->model('Mlhp', 'mlhp');
		$kodeSebab = $this->mlhp->getKodeSebab($kodeSebabId);
		try {
			if (!isset($kodeSebab)) {
				throw new Exception('Data not found');
			}
			$this->response(array(
				'data' => $kodeSebab,
			), 200);	
		} catch (Exception $ex) {
			$this->response(array(
				'message' => $ex->getMessage()
			), 404);
		}
	}
	
	public function unitkerja_get() {
		$this->load->model('Mlhp', 'mlhp');
		$listUnitKerja = $this->mlhp->getAllUnitKerja();
		
		$dataResponse = array(
			'data' => $listUnitKerja,
			'size' => count($listUnitKerja)
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