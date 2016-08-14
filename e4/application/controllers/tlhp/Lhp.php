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

		$this->rtl->updateAll($toBeInsert);
		redirect('tlhp/lhp/edit?lhp_id='.$posts['lhp_id']);
	}
	
	public function edit() {
		$this->load->model('Mkertaskerjatemuan', 'mkkt');
		$this->load->model('MRekomendasi', 'mrekomendasi');
		$this->load->model('Mtindaklanjut', 'mtl');
		
		$gets = $this->input->get();
		$rekomendasiIds = array();
		$rekomendasi = $this->mrekomendasi->findAllRekomendasi($gets['lhp_id']);
		foreach ($rekomendasi as $rowRek) {
			array_push($rekomendasiIds, $rowRek->rekomendasi_id);
		}
				
		$data['lhp'] = $this->mlhp->getbyid($gets['lhp_id']);
		$data['totalTemuan'] = $this->mkkt->countByLhpId($gets['lhp_id']);
		$data['totalRekomendasi'] = $this->mrekomendasi->countRekomendasiByLhpId($gets['lhp_id']);
		$data['totalSesuaiRek'] = $this->mtl->count($rekomendasiIds, true);
		$data['totalBlmSesuaiRek'] = $this->mtl->count($rekomendasiIds, false);
		$data['totalBlmTl'] = 0;
		$data['totalTdkTl'] = 0;
		$data['action'] = "update";
//		var_dump($data);
		$this->load->tlhp_template('tlhp/kklhp2', $data);
	}
	
	
	public function downloadxls() {
//		$post= $this->input->post();
//		$lhp_id = @$post['lhp_id'];
//		$table_data = @$post['table_data'];
//	
//		if ($lhp_id == NULL) {
//			$col['notif'] = 'error';
//			$col['msg'] = 'LHP ID not found';
//			exit(json_encode($col));
//		} else if ($table_data == NULL) {
//			$col['notif'] = 'error';
//			$col['msg'] = 'Table Data Null';
//			exit(json_encode($col));
//		}
		$get = $this->input->get();	
		$lhp = $this->mlhp->getLHP ($get['lhp_id']);
		
		$this->load->model('Mlhp', 'mlhp');
		$this->load->model('Mtindaklanjut', 'mtl');
		
		$arrJenisTemuan = array(
			'A' => 'SISTEM PENGENDALIAN INTERNAL',
			'B' => 'KEPATUHAN TERHADAP PERATURAN DAN PERUNDANG-UNDANGAN',
			'C' => 'Laporan Keuangan'
		);
		
		$arrKertasKerjaTemuan = $this->mlhp->getAllKertasKerjaTemuan($get['lhp_id']);
		
		$kktIds = array();
		foreach ($arrKertasKerjaTemuan as $rowKkt) {
			array_push($kktIds, $rowKkt->kertas_kerja_id);
		}	
		$arrRekomendasi = $this->mlhp->getAllRekomendasiByKktIds($kktIds);
		
		foreach ($arrKertasKerjaTemuan as $rowKkt) {
			foreach ($arrJenisTemuan as $idx => $value) {
				if ($rowKkt->jenis_temuan == strtolower($idx)) {
					$rowKkt->jenis_temuan = array(
						'kode_jenis_temuan' => $idx,
						'jenis_temuan' => $value
					);
				}
			}
		}
		
		foreach ($arrKertasKerjaTemuan as $rowKkt) {
			$rowKkt->rekomendasi = array();
			foreach ($arrRekomendasi as $rek) {
				if ($rowKkt->kertas_kerja_id == $rek->kertas_kerja_id) {
					//TODO: di refactor nanti y
					$tindaklanjut = $this->mlhp->getAllTindakLanjut($rek->rekomendasi_id);
					if (count($tindaklanjut) > 0) {
						$rek->tindak_lanjut = $tindaklanjut[0];
					}
					array_push($rowKkt->rekomendasi, $rek);
				}
			}
			
		}
		
		
		$param ['title'] = $lhp->judul_lhp;
		$param ['to'] = $lhp->objek_pengawasan;
		$param ['table_top'] = array (
				'tahun' => isset ( $lhp->tanggal_lhp ) ? year_only ( $lhp->tanggal_lhp ) : "",
				'no_lhp' => isset ( $lhp->nomor_lhp ) ? year_only ( $lhp->nomor_lhp ) : "",
				'judul_lhp' => isset ( $lhp->judul_lhp ) ? $lhp->judul_lhp : "",
				'temuan' => '0',
				'rekom' => '0',
				'sesuai' => '0',
				'belum_sesuai' => '0',
				'belum_tl' => '0',
				'tidak_dpt_tl' => '0'
		);
		/**
		$table_req = '{
					"data": [{
						"lhp_id": 30,
						"jenis_temuan": {
							"kode_jenis_temuan": "A",
							"jenis_temuan": "SISTEM PENGENDALIAN INTERNAL"
						},
						"no_temuan": "",
						"kode_temuan_id": 1,
						"uraian_temuan": "wewewe",
						"kode_sebab_id": 2,
						"uraian_sebab": "Penyebab lain yang belum didefinisikan (nihil)",
						"nilai_temuan": 1212,
						"rekomendasi": [{
							"kode_rekomendasi_id": 6,
							"uraian_rekomendasi": 11212,
							"kerugian_negara": true,
							"nilai_rekomendasi": 1111,
							"nama_ppk": "wrwrwr",
							"nama_pj": "wrwrwr",
							"unit_kerja_id": 1,
							"tindak_lanjut": {
								"uraian_tindak_lanjut": "dwwrwr",
								"tanggal_tl": 242424,
								"nilai": 322424
							}
						}, {
							"kode_rekomendasi_id": 6,
							"uraian_rekomendasi": 121212,
							"kerugian_negara": true,
							"nilai_rekomendasi": 1111,
							"nama_ppk": "wrwrw",
							"nama_pj": "wrwr",
							"unit_kerja_id": 1,
							"tindak_lanjut": []
						}]
					}, {
						"lhp_id": 30,
						"jenis_temuan": {
							"kode_jenis_temuan": "A",
							"jenis_temuan": "SISTEM PENGENDALIAN INTERNAL"
						},
						"no_temuan": "",
						"kode_temuan_id": 1,
						"uraian_temuan": "wewe",
						"kode_sebab_id": 2,
						"uraian_sebab": "Penyebab lain yang belum didefinisikan (nihil)",
						"nilai_temuan": 1212,
						"rekomendasi": [{
							"kode_rekomendasi_id": 6,
							"uraian_rekomendasi": 111212,
							"kerugian_negara": true,
							"nilai_rekomendasi": 11111111,
							"nama_ppk": "wrwr",
							"nama_pj": "wrwr",
							"unit_kerja_id": 1,
							"tindak_lanjut": []
						}, {
							"kode_rekomendasi_id": 7,
							"uraian_rekomendasi": 44444,
							"kerugian_negara": true,
							"nilai_rekomendasi": 43535,
							"nama_ppk": "wrwr",
							"nama_pj": "ryryry",
							"unit_kerja_id": 1,
							"tindak_lanjut": []
						}, {
							"kode_rekomendasi_id": 6,
							"uraian_rekomendasi": 444444,
							"kerugian_negara": true,
							"nilai_rekomendasi": 3533535,
							"nama_ppk": "ryryry",
							"nama_pj": "ryryryry",
							"unit_kerja_id": 1,
							"tindak_lanjut": []
						}]
					}, {
						"lhp_id": 30,
						"jenis_temuan": {
							"kode_jenis_temuan": "B",
							"jenis_temuan": "KEPATUHAN TERHADAP PERATURAN DAN PERUNDANG-UNDANGAN"
						},
						"no_temuan": "",
						"kode_temuan_id": 1,
						"uraian_temuan": 1231313,
						"kode_sebab_id": 2,
						"uraian_sebab": "Penyebab lain yang belum didefinisikan (nihil)",
						"nilai_temuan": 12121,
						"rekomendasi": [{
							"kode_rekomendasi_id": 7,
							"uraian_rekomendasi": 323224,
							"kerugian_negara": true,
							"nilai_rekomendasi": 24224,
							"nama_ppk": "e4464",
							"nama_pj": "erwsffsf",
							"unit_kerja_id": 1,
							"tindak_lanjut": []
						}]
					}, {
						"lhp_id": 30,
						"jenis_temuan": {
							"kode_jenis_temuan": "C",
							"jenis_temuan": "LAPORAN KEUANGAN"
						},
						"no_temuan": "",
						"kode_temuan_id": 2,
						"uraian_temuan": 12121,
						"kode_sebab_id": 3,
						"uraian_sebab": "KELEMAHAN PENGAWASAN MELEKAT",
						"nilai_temuan": 1111,
						"rekomendasi": [{
							"kode_rekomendasi_id": 6,
							"uraian_rekomendasi": 242424,
							"kerugian_negara": true,
							"nilai_rekomendasi": 242424,
							"nama_ppk": "sfsfsf",
							"nama_pj": "sfsfsfsf",
							"unit_kerja_id": 1,
							"tindak_lanjut": []
						}]
					}],
					"message": "Data berhasil diperbaharui",
					"updateDateCount": 0,
					"updatedData": [],
					"addedData": [{
						"lhp_id": 30,
						"jenis_temuan": {
							"kode_jenis_temuan": "A",
							"jenis_temuan": "SISTEM PENGENDALIAN INTERNAL"
						},
						"no_temuan": "",
						"kode_temuan_id": 1,
						"uraian_temuan": "wewewe",
						"kode_sebab_id": 2,
						"uraian_sebab": "Penyebab lain yang belum didefinisikan (nihil)",
						"nilai_temuan": 1212,
						"rekomendasi": [{
							"kode_rekomendasi_id": 6,
							"uraian_rekomendasi": 11212,
							"kerugian_negara": true,
							"nilai_rekomendasi": 1111,
							"nama_ppk": "wrwrwr",
							"nama_pj": "wrwrwr",
							"unit_kerja_id": 1,
							"tindak_lanjut": {
								"uraian_tindak_lanjut": "dwwrwr",
								"tanggal_tl": 242424,
								"nilai": 322424
							}
						}, {
							"kode_rekomendasi_id": 6,
							"uraian_rekomendasi": 121212,
							"kerugian_negara": true,
							"nilai_rekomendasi": 1111,
							"nama_ppk": "wrwrw",
							"nama_pj": "wrwr",
							"unit_kerja_id": 1,
							"tindak_lanjut": []
						}]
					}, {
						"lhp_id": 30,
						"jenis_temuan": {
							"kode_jenis_temuan": "A",
							"jenis_temuan": "SISTEM PENGENDALIAN INTERNAL"
						},
						"no_temuan": "",
						"kode_temuan_id": 1,
						"uraian_temuan": "wewe",
						"kode_sebab_id": 2,
						"uraian_sebab": "Penyebab lain yang belum didefinisikan (nihil)",
						"nilai_temuan": 1212,
						"rekomendasi": [{
							"kode_rekomendasi_id": 6,
							"uraian_rekomendasi": 111212,
							"kerugian_negara": true,
							"nilai_rekomendasi": 11111111,
							"nama_ppk": "wrwr",
							"nama_pj": "wrwr",
							"unit_kerja_id": 1,
							"tindak_lanjut": []
						}, {
							"kode_rekomendasi_id": 7,
							"uraian_rekomendasi": 44444,
							"kerugian_negara": true,
							"nilai_rekomendasi": 43535,
							"nama_ppk": "wrwr",
							"nama_pj": "ryryry",
							"unit_kerja_id": 1,
							"tindak_lanjut": []
						}, {
							"kode_rekomendasi_id": 6,
							"uraian_rekomendasi": 444444,
							"kerugian_negara": true,
							"nilai_rekomendasi": 3533535,
							"nama_ppk": "ryryry",
							"nama_pj": "ryryryry",
							"unit_kerja_id": 1,
							"tindak_lanjut": []
						}]
					}, {
						"lhp_id": 30,
						"jenis_temuan": {
							"kode_jenis_temuan": "B",
							"jenis_temuan": "KEPATUHAN TERHADAP PERATURAN DAN PERUNDANG-UNDANGAN"
						},
						"no_temuan": "",
						"kode_temuan_id": 1,
						"uraian_temuan": 1231313,
						"kode_sebab_id": 2,
						"uraian_sebab": "Penyebab lain yang belum didefinisikan (nihil)",
						"nilai_temuan": 12121,
						"rekomendasi": [{
							"kode_rekomendasi_id": 7,
							"uraian_rekomendasi": 323224,
							"kerugian_negara": true,
							"nilai_rekomendasi": 24224,
							"nama_ppk": "e4464",
							"nama_pj": "erwsffsf",
							"unit_kerja_id": 1,
							"tindak_lanjut": []
						}]
					}, {
						"lhp_id": 30,
						"jenis_temuan": {
							"kode_jenis_temuan": "C",
							"jenis_temuan": "LAPORAN KEUANGAN"
						},
						"no_temuan": "",
						"kode_temuan_id": 2,
						"uraian_temuan": 12121,
						"kode_sebab_id": 3,
						"uraian_sebab": "KELEMAHAN PENGAWASAN MELEKAT",
						"nilai_temuan": 1111,
						"rekomendasi": [{
							"kode_rekomendasi_id": 6,
							"uraian_rekomendasi": 242424,
							"kerugian_negara": true,
							"nilai_rekomendasi": 242424,
							"nama_ppk": "sfsfsf",
							"nama_pj": "sfsfsfsf",
							"unit_kerja_id": 1,
							"tindak_lanjut": []
						}]
					}],
					"rekomendasiData": [],
					"newRowTindakLanjut": []
				}';
		**/
//		$table_req = $table_data;
//		$param ['table_data'] = $table_req;
		$param ['table_data'] = $arrKertasKerjaTemuan;
		$this->writeToExcel ( $param );
	}

	private function writeToExcel($param = NULL) {
		$root = $_SERVER ['DOCUMENT_ROOT'];
		require_once $root . '/assets/inc/PHPExcel/Classes/PHPExcel.php';
	
		$objReader = PHPExcel_IOFactory::createReader ( 'Excel5' );
		$tpl = $root . '/assets/template-excel/tpl_update_lhp.xls';
		$objPHPExcel = $objReader->load ( $tpl );
	
		if (@$param ['title'] != "") {
			$objPHPExcel->getActiveSheet ()->setCellValue ( 'A2', @$param ['title'] );
		}
	
		if (@$param ['to'] != "") {
			$objPHPExcel->getActiveSheet ()->setCellValue ( 'A3', @$param ['to'] );
		}
	
		if (@$param ['table_top'] != "") {
			if (is_array ( $param ['table_top'] )) {
				$tTop = $param ['table_top'];
				$objPHPExcel->getActiveSheet ()->setCellValue ( 'A7', @$tTop ['tahun'] );
				$objPHPExcel->getActiveSheet ()->setCellValue ( 'B7', @$tTop ['no_lhp'] );
				$objPHPExcel->getActiveSheet ()->setCellValue ( 'C7', @$tTop ['judul_lhp'] );
				$objPHPExcel->getActiveSheet ()->setCellValue ( 'D7', @$tTop ['temuan'] );
				$objPHPExcel->getActiveSheet ()->setCellValue ( 'E7', @$tTop ['rekom'] );
				$objPHPExcel->getActiveSheet ()->setCellValue ( 'F7', @$tTop ['sesuai'] );
				$objPHPExcel->getActiveSheet ()->setCellValue ( 'G7', @$tTop ['belum_sesuai'] );
				$objPHPExcel->getActiveSheet ()->setCellValue ( 'H7', @$tTop ['belum_tl'] );
				$objPHPExcel->getActiveSheet ()->setCellValue ( 'I7', @$tTop ['tidak_dpt_tl'] );
			}
		}
	
		// Declare Jenis Temuan
		$jenisTemuanData = array (
				'SISTEM PENGENDALIAN INTERNAL',
				'KEPATUHAN TERHADAP PERATURAN DAN PERUNDANG-UNDANGAN',
				'LAPORAN KEUANGAN'
		);
	
		if (@$param ['table_data'] != "") {
//			$tableData = json_decode ( @$param ['table_data'] );
			$tableData = @$param ['table_data'];
			foreach ( $tableData as $data ) {
				$jenisTemuan [] = $data->jenis_temuan['jenis_temuan'];
			}
				
			$jenisTemuanValue = array_count_values ( $jenisTemuan );
				
			$indexCol = 13;
			$temuanA = 1;
			$rekomendasiA = 1;
			$temuanPassA = 0;
			$colPasCont = array ();
			foreach ( $tableData as $data ) {
				if ($jenisTemuanData [0] == $data->jenis_temuan['jenis_temuan']) {
					$indexNo = $temuanA ++;
					if ($indexNo == 1) {
						$index = $indexCol;
						$tableTitle = $data->jenis_temuan['kode_jenis_temuan'] . " " . $data->jenis_temuan['jenis_temuan'];
						$objPHPExcel->getActiveSheet ()->mergeCells ( 'A' . $index . ':Y' . $index );
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'A' . $index, $tableTitle );
					}
						
					// echo $temuanPass;
					$indexColTemuan = ($temuanPassA == 0) ? $indexCol + $indexNo : $indexCol + $temuanPassA;
					$objPHPExcel->getActiveSheet ()->setCellValue ( 'A' . $indexColTemuan, $indexNo );
					$kodeTemuan = $data->kode_temuan_id;
					$objPHPExcel->getActiveSheet ()->setCellValue ( 'B' . $indexColTemuan, $kodeTemuan );
					$uraianTemuan = $data->uraian_temuan;
					$objPHPExcel->getActiveSheet ()->setCellValue ( 'C' . $indexColTemuan, $uraianTemuan );
					$kodeSebab = $data->kode_sebab_id;
					$objPHPExcel->getActiveSheet ()->setCellValue ( 'D' . $indexColTemuan, $kodeSebab );
					$uraianSebab = $data->uraian_sebab;
					$objPHPExcel->getActiveSheet ()->setCellValue ( 'E' . $indexColTemuan, $uraianSebab );
					$nilaiTemuan = $data->nilai_temuan;
					$objPHPExcel->getActiveSheet ()->setCellValue ( 'F' . $indexColTemuan, $nilaiTemuan );
					// break;
						
					// Write Rekomendasi
					$indexColRekomendasi = $indexCol + $indexNo;
					$indexNoTemuan = count ( $data->rekomendasi );
						
					$indekRekNo = 1;
					foreach ( $data->rekomendasi as $rekomendasi ) {
						$indexColRekomendasi = $indexCol + $rekomendasiA ++;
						$countTemuanA [] = $indexColRekomendasi;
						$colPasCont [] = $indexColRekomendasi;
	
						$rekNo = $indekRekNo ++;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'G' . $indexColRekomendasi, $rekNo );
	
						$kodeRekomendasi = $rekomendasi->kode_rekomendasi_id;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'H' . $indexColRekomendasi, $kodeRekomendasi );
	
						$uraian_rekomendasi = $rekomendasi->uraian_rekomendasi;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'I' . $indexColRekomendasi, $uraian_rekomendasi );
	
						$kerugian_negara = ($rekomendasi->kerugian_negara) ?"ADA" : "TIDAK";
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'J' . $indexColRekomendasi, $kerugian_negara );
	
						$nilai_rekomendasi = $rekomendasi->nilai_rekomendasi;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'K' . $indexColRekomendasi, $nilai_rekomendasi );
	
						$unit_kerja = $rekomendasi->unit_kerja_id;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'L' . $indexColRekomendasi, $unit_kerja );
	
						$namaPj = $rekomendasi->nama_ppk;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'M' . $indexColRekomendasi, $namaPj );
	
						$namaPj = $rekomendasi->nama_pj;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'N' . $indexColRekomendasi, $namaPj );
	
						if (is_object ( $rekomendasi->tindak_lanjut )) {
							$uraian_tindak_lanjut = $rekomendasi->tindak_lanjut->tindak_lanjut;
							$objPHPExcel->getActiveSheet ()->setCellValue ( 'P' . $indexColRekomendasi, $uraian_tindak_lanjut );
								
							$nilai = $rekomendasi->tindak_lanjut->nilai;
							$objPHPExcel->getActiveSheet ()->setCellValue ( 'R' . $indexColRekomendasi, $nilai );
						}
					}
					$temuanPassA = count ( $countTemuanA ) + 1;
					continue;
				}
			}
				
			$indexColB = end ( $colPasCont ) + 1;
			$temuanB = 1;
			$rekomendasiB = 1;
			$temuanPassB = 0;
			$colPasContB = array ();
			foreach ( $tableData as $data ) {
				if ($jenisTemuanData [1] == $data->jenis_temuan['jenis_temuan']) {
					$indexNo = $temuanB ++;
					if ($indexNo == 1) {
						$index = $indexColB;
						$tableTitle = $data->jenis_temuan['kode_jenis_temuan'] . " " . $data->jenis_temuan['jenis_temuan'];
						$objPHPExcel->getActiveSheet ()->mergeCells ( 'A' . $index . ':Y' . $index );
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'A' . $index, $tableTitle );
					}
						
					// echo $temuanPassB;
					$indexColBTemuan = ($temuanPassB == 0) ? $indexColB + $indexNo : $indexColB + $temuanPassB;
					$objPHPExcel->getActiveSheet ()->setCellValue ( 'A' . $indexColBTemuan, $indexNo );
					$kodeTemuan = $data->kode_temuan_id;
					$objPHPExcel->getActiveSheet ()->setCellValue ( 'B' . $indexColBTemuan, $kodeTemuan );
					$uraianTemuan = $data->uraian_temuan;
					$objPHPExcel->getActiveSheet ()->setCellValue ( 'C' . $indexColBTemuan, $uraianTemuan );
					$kodeSebab = $data->kode_sebab_id;
					$objPHPExcel->getActiveSheet ()->setCellValue ( 'D' . $indexColBTemuan, $kodeSebab );
					$uraianSebab = $data->uraian_sebab;
					$objPHPExcel->getActiveSheet ()->setCellValue ( 'E' . $indexColBTemuan, $uraianSebab );
					$nilaiTemuan = $data->nilai_temuan;
					$objPHPExcel->getActiveSheet ()->setCellValue ( 'F' . $indexColBTemuan, $nilaiTemuan );
					// break;
						
					// Write Rekomendasi
					$indexColBRekomendasi = $indexColB + $indexNo;
					$indexNoTemuan = count ( $data->rekomendasi );
						
					$indekRekNo = 1;
					foreach ( $data->rekomendasi as $rekomendasi ) {
						$indexColBRekomendasi = $indexColB + $rekomendasiB ++;
						$countTemuan [] = $indexColBRekomendasi;
						$colPasContB [] = $indexColBRekomendasi;
	
						$rekNo = $indekRekNo ++;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'G' . $indexColBRekomendasi, $rekNo );
	
						$kodeRekomendasi = $rekomendasi->kode_rekomendasi_id;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'H' . $indexColBRekomendasi, $kodeRekomendasi );
	
						$uraian_rekomendasi = $rekomendasi->uraian_rekomendasi;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'I' . $indexColBRekomendasi, $uraian_rekomendasi );
	
						$kerugian_negara = ($rekomendasi->kerugian_negara) ?"ADA" : "TIDAK";
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'J' . $indexColBRekomendasi, $kerugian_negara );
	
						$nilai_rekomendasi = $rekomendasi->nilai_rekomendasi;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'K' . $indexColBRekomendasi, $nilai_rekomendasi );
	
						$unit_kerja = $rekomendasi->unit_kerja_id;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'L' . $indexColBRekomendasi, $unit_kerja );
	
						$namaPj = $rekomendasi->nama_ppk;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'M' . $indexColBRekomendasi, $namaPj );
	
						$namaPj = $rekomendasi->nama_pj;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'N' . $indexColBRekomendasi, $namaPj );
	
						if (is_object ( $rekomendasi->tindak_lanjut )) {
							$uraian_tindak_lanjut = $rekomendasi->tindak_lanjut->uraian_tindak_lanjut;
							$objPHPExcel->getActiveSheet ()->setCellValue ( 'P' . $indexColBRekomendasi, $uraian_tindak_lanjut );
	
							$nilai = $rekomendasi->tindak_lanjut->nilai;
							$objPHPExcel->getActiveSheet ()->setCellValue ( 'R' . $indexColBRekomendasi, $nilai );
						}
	
					}
					$temuanPassB = count ( $countTemuan ) + 1;
					continue;
				}
			}
				
			$indexColC = end ( $colPasContB ) + 1;
			$temuanC = 1;
			$rekomendasiC = 1;
			$temuanPassC = 0;
			$colPasContC = array ();
			foreach ( $tableData as $data ) {
				if ($jenisTemuanData [2] == $data->jenis_temuan['jenis_temuan']) {
					$indexNo = $temuanC ++;
					if ($indexNo == 1) {
						$index = $indexColC;
						$tableTitle = $data->jenis_temuan['kode_jenis_temuan'] . " " . $data->jenis_temuan['jenis_temuan'];
						$objPHPExcel->getActiveSheet ()->mergeCells ( 'A' . $index . ':Y' . $index );
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'A' . $index, $tableTitle );
					}
						
					// echo $temuanPassC;
					$indexColCTemuan = ($temuanPassC == 0) ? $indexColC + $indexNo : $indexColC + $temuanPassC;
					$objPHPExcel->getActiveSheet ()->setCellValue ( 'A' . $indexColCTemuan, $indexNo );
					$kodeTemuan = $data->kode_temuan_id;
					$objPHPExcel->getActiveSheet ()->setCellValue ( 'B' . $indexColCTemuan, $kodeTemuan );
					$uraianTemuan = $data->uraian_temuan;
					$objPHPExcel->getActiveSheet ()->setCellValue ( 'C' . $indexColCTemuan, $uraianTemuan );
					$kodeSebab = $data->kode_sebab_id;
					$objPHPExcel->getActiveSheet ()->setCellValue ( 'D' . $indexColCTemuan, $kodeSebab );
					$uraianSebab = $data->uraian_sebab;
					$objPHPExcel->getActiveSheet ()->setCellValue ( 'E' . $indexColCTemuan, $uraianSebab );
					$nilaiTemuan = $data->nilai_temuan;
					$objPHPExcel->getActiveSheet ()->setCellValue ( 'F' . $indexColCTemuan, $nilaiTemuan );
					// break;
						
					// Write Rekomendasi
					$indexColCRekomendasi = $indexColC + $indexNo;
					$indexNoTemuan = count ( $data->rekomendasi );
						
					$indekRekNo = 1;
					foreach ( $data->rekomendasi as $rekomendasi ) {
						$indexColCRekomendasi = $indexColC + $rekomendasiC ++;
						$countTemuan [] = $indexColCRekomendasi;
						$colPasContB = $indexColCRekomendasi;
	
						$rekNo = $indekRekNo ++;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'G' . $indexColCRekomendasi, $rekNo );
	
						$kodeRekomendasi = $rekomendasi->kode_rekomendasi_id;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'H' . $indexColCRekomendasi, $kodeRekomendasi );
	
						$uraian_rekomendasi = $rekomendasi->uraian_rekomendasi;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'I' . $indexColCRekomendasi, $uraian_rekomendasi );
	
						$kerugian_negara = ($rekomendasi->kerugian_negara) ?"ADA" : "TIDAK";
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'J' . $indexColCRekomendasi, $kerugian_negara );
	
						$nilai_rekomendasi = $rekomendasi->nilai_rekomendasi;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'K' . $indexColCRekomendasi, $nilai_rekomendasi );
	
						$unit_kerja = $rekomendasi->unit_kerja_id;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'L' . $indexColCRekomendasi, $unit_kerja );
	
						$namaPj = $rekomendasi->nama_ppk;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'M' . $indexColCRekomendasi, $namaPj );
	
						$namaPj = $rekomendasi->nama_pj;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'N' . $indexColCRekomendasi, $namaPj );
	
						if (is_object ( $rekomendasi->tindak_lanjut )) {
							$uraian_tindak_lanjut = $rekomendasi->tindak_lanjut->uraian_tindak_lanjut;
							$objPHPExcel->getActiveSheet ()->setCellValue ( 'P' . $indexColCRekomendasi, $uraian_tindak_lanjut );
	
							$nilai = $rekomendasi->tindak_lanjut->nilai;
							$objPHPExcel->getActiveSheet ()->setCellValue ( 'R' . $indexColCRekomendasi, $nilai );
						}
					}
					$temuanPassC = count ( $countTemuan ) + 1;
					continue;
				}
			}
				
			$objWriter = PHPExcel_IOFactory::createWriter ( $objPHPExcel, 'Excel5' );
			header('Content-Type: application/vnd.ms-excel');
			header('Content-Disposition: attachment;filename="myFile.xls"');
			header('Cache-Control: max-age=0');
			$objWriter->save ('php://output');
//			$saving = $root . '/assets/data/lhp.xls';
//			$objWriter->save ( $saving );
		}
	}
	
	
	
}