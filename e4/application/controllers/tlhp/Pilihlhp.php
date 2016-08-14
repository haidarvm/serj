<?php
if (! defined ( 'BASEPATH' ))
	exit ( 'No direct script access allowed' );

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Pilihlhp extends MY_Controller {
	function __construct() {
		parent::__construct ();
		$this->load->model ( 'muser' );
		$this->load->model ( 'mlhp' );
		$this->muser = new MUser ();
		$this->mlhp = new MLhp ();
	}
	
	/**
	 * Redirect to product_list
	 */
	public function index() {
		$this->pilih ();
	}
	public function pilih() {
		$data ['title'] = "UPDATE LHP";
		$data ['getAllLHP'] = $this->mlhp->getAllLHP ();
		$post = $this->input->post ();
		if ($post) {
			echo 'test';
		}
		$this->load->tlhp_template ( 'tlhp/pilihlhp', $data );
	}
	public function list_lhp() {
		$data ['data_lhp'] = $this->mlhp->getAllLHPKK ();
		$this->load->tlhp_template ( 'tlhp/data_lhp', $data );
	}
	public function get_lhp($lhp_id) {
		$data ['title'] = "UPDATE LHP";
		$data ['lhp'] = $this->mlhp->getLHP ( $lhp_id );
		$data ['title'] = "Kertas Kerja Laporan Hasil Pengawasan Baru";
		$data ['action'] = "update";
		// $data['getAll'] = $this->muser->getAllUser();
		$this->load->tlhp_template ( 'tlhp/kklhp', $data );
		// redirect pilih
	}
	public function updatelhponly() {
		redirect ( 'tlhp/addlhp/update' );
	}
	public function updatelhp() {
		$post = $this->input->post ();
		if ($post) {
			$data ['kode_temuan'] = $this->mlhp->getAllKodeTemuan ();
			$data ['kode_sebab'] = $this->mlhp->getAllKodeSebab ();
			$data ['kode_rekomendasi'] = $this->mlhp->getAllKodeRekomendasi ();
			$data ['title'] = "UPDATE LHP";
			$data ['action'] = "update";
			$lhp_id = $post ['lhp_id'];
			$data ['lhp_id'] = $lhp_id;
			$data ['lhp'] = $this->mlhp->getLHP ( $lhp_id );
			$data ['title'] = "Kertas Kerja Laporan Hasil Pengawasan Baru";
			// $data['update'] = "update";
			// $data['getAll'] = $this->muser->getAllUser();
			$this->load->tlhp_template ( 'tlhp/kklhp2', $data );
		} else {
			// redirect pilih
		}
	}
	
	// public function editlhp() {
	// $gets = $this->input->get();
	// $data['lhp'] = $this->mlhp->getLHP($gets['lhp_id']);
	// $data['action'] = "update";
	// $this->load->tlhp_template('tlhp/kklhp2', $data);
	// if ($post) {
	// $data['kode_temuan'] = $this->mlhp->getAllKodeTemuan();
	// $data['kode_sebab'] = $this->mlhp->getAllKodeSebab();
	// $data['kode_rekomendasi'] = $this->mlhp->getAllKodeRekomendasi();
	// $data['title'] = "UPDATE LHP";
	// $data['action'] = "update";
	// $lhp_id = $post['lhp_id'];
	// $data['lhp'] = $this->mlhp->getLHP($lhp_id);
	// $data['title'] = "Kertas Kerja Laporan Hasil Pengawasan Baru";
	// // $data['update'] = "update";
	// // $data['getAll'] = $this->muser->getAllUser();
	// $this->load->tlhp_template('tlhp/kklhp2', $data);
	// } else {
	// // redirect pilih
	// }
	// }
	public function updatekklhp() {
		$data ['kode_temuan'] = $this->mlhp->getAllKodeTemuan ();
		$data ['kode_sebab'] = $this->mlhp->getAllKodeSebab ();
		$data ['action'] = "update";
		$data ['kode_rekomendasi'] = $this->mlhp->getAllKodeRekomendasi ();
		$data ['title'] = "UPDATE LHP";
		$lhp_id = $post ['lhp_id'];
		$data ['lhp'] = $this->mlhp->getLHP ( $lhp_id );
		$data ['title'] = "Kertas Kerja Laporan Hasil Pengawasan Baru";
		// $data['update'] = "update";
		// $data['getAll'] = $this->muser->getAllUser();
		$this->load->tlhp_template ( 'tlhp/kklhp', $data );
	}
	
	
	public function save_to_excel($lhp_id) {
		$lhp = $this->mlhp->getLHP ( $lhp_id );
		$data ['title'] = "Kertas Kerja Laporan Hasil Pengawasan Baru";
		
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
		
		$table_req = ' {
			"data": [{
				"lhp_id": 30,
				"jenis_temuan": {
					"kode_jenis_temuan": "A",
					"jenis_temuan": "SISTEM PENGENDALIAN INTERNAL"
				},
				"no_temuan": "",
				"kode_temuan_id": 1,
				"uraian_temuan": "agus",
				"kode_sebab_id": 2,
				"uraian_sebab": "Penyebab lain yang belum didefinisikan (nihil)",
				"nilai_temuan": 12121212,
				"rekomendasi": [{
					"kode_rekomendasi_id": 6,
					"uraian_rekomendasi": "sddsf xxx",
					"kerugian_negara": true,
					"nilai_rekomendasi": 0,
					"unit_kerja_id": 1,
					"tindak_lanjut": {
						"uraian_tindak_lanjut": "hahahaha",
						"tanggal_tl": "15-08-2016",
						"nilai": 0
					}
					}, {
						"kode_rekomendasi_id": 6,
						"uraian_rekomendasi": "sfsfsfsf",
						"kerugian_negara": true,
						"nilai_rekomendasi": 13313,
						"unit_kerja_id": 1,
						"tindak_lanjut": []
					},  {
						"kode_rekomendasi_id": 6,
						"uraian_rekomendasi": "nananana",
						"kerugian_negara": true,
						"nilai_rekomendasi": 13313,
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
				"uraian_temuan": "agus",
				"kode_sebab_id": 2,
				"uraian_sebab": "Penyebab lain yang belum didefinisikan (nihil)",
				"nilai_temuan": 12121212,
				"rekomendasi": [{
					"kode_rekomendasi_id": 6,
					"uraian_rekomendasi": "sddsf zzzzzzzz",
					"kerugian_negara": true,
					"nilai_rekomendasi": 0,
					"unit_kerja_id": 1,
					"tindak_lanjut": {
						"uraian_tindak_lanjut": "wewewe",
						"tanggal_tl": "15-08-2016",
						"nilai": 0
					}
				}, {
					"kode_rekomendasi_id": 6,
					"uraian_rekomendasi": "sfsfsfsf",
					"kerugian_negara": true,
					"nilai_rekomendasi": 13313,
					"unit_kerja_id": 1,
					"tindak_lanjut": []
				}]
			},
			{
				"lhp_id": 30,
				"jenis_temuan": {
					"kode_jenis_temuan": "B",
					"jenis_temuan": "KEPATUHAN TERHADAP PERATURAN DAN PERUNDANG-UNDANGAN"
				},
				"no_temuan": "",
				"kode_temuan_id": 1,
				"uraian_temuan": "aadad",
				"kode_sebab_id": 2,
				"uraian_sebab": "Penyebab lain yang belum didefinisikan (nihil)",
				"nilai_temuan": 1212121212,
				"rekomendasi": [{
					"kode_rekomendasi_id": 7,
					"uraian_rekomendasi": "sfsfsf",
					"kerugian_negara": true,
					"nilai_rekomendasi": 32242,
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
				"kode_temuan_id": 1,
				"uraian_temuan": "adadad",
				"kode_sebab_id": 2,
				"uraian_sebab": "Penyebab lain yang belum didefinisikan (nihil)",
				"nilai_temuan": 112121212,
				"rekomendasi": [{
					"kode_rekomendasi_id": 7,
					"uraian_rekomendasi": "sfsfsfsfsf",
					"kerugian_negara": true,
					"nilai_rekomendasi": 242424,
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
				"uraian_temuan": "agus",
				"kode_sebab_id": 2,
				"uraian_sebab": "Penyebab lain yang belum didefinisikan (nihil)",
				"nilai_temuan": 12121212,
				"rekomendasi": [{
					"kode_rekomendasi_id": 6,
					"uraian_rekomendasi": "sddsf",
					"kerugian_negara": true,
					"nilai_rekomendasi": 0,
					"unit_kerja_id": 1,
					"tindak_lanjut": {
						"uraian_tindak_lanjut": "wewewe",
						"tanggal_tl": "15-08-2016",
						"nilai": 0
					}
				}, {
					"kode_rekomendasi_id": 6,
					"uraian_rekomendasi": "sfsfsfsf",
					"kerugian_negara": true,
					"nilai_rekomendasi": 13313,
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
				"uraian_temuan": "aadad",
				"kode_sebab_id": 2,
				"uraian_sebab": "Penyebab lain yang belum didefinisikan (nihil)",
				"nilai_temuan": 1212121212,
				"rekomendasi": [{
					"kode_rekomendasi_id": 7,
					"uraian_rekomendasi": "sfsfsf",
					"kerugian_negara": true,
					"nilai_rekomendasi": 32242,
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
				"kode_temuan_id": 1,
				"uraian_temuan": "adadad",
				"kode_sebab_id": 2,
				"uraian_sebab": "Penyebab lain yang belum didefinisikan (nihil)",
				"nilai_temuan": 112121212,
				"rekomendasi": [{
					"kode_rekomendasi_id": 7,
					"uraian_rekomendasi": "sfsfsfsfsf",
					"kerugian_negara": true,
					"nilai_rekomendasi": 242424,
					"unit_kerja_id": 1,
					"tindak_lanjut": []
				}]
			}],
			"rekomendasiData": [],
			"newRowTindakLanjut": []
		}';
		
		$param ['table_data'] = $table_req;
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
			$tableData = json_decode ( @$param ['table_data'] );
			
			foreach ( $tableData->data as $data ) {
				$jenisTemuan [] = $data->jenis_temuan->jenis_temuan;
			}
			
			$jenisTemuanValue = array_count_values ( $jenisTemuan );
			
			$indexCol = 13;
			$temuanA = 1;
			$rekomendasiA = 1;
			$temuanPassA = 0;
			$colPasCont = array ();
			foreach ( $tableData->data as $data ) {
				if ($jenisTemuanData [0] == $data->jenis_temuan->jenis_temuan) {
					$indexNo = $temuanA ++;
					if ($indexNo == 1) {
						$index = $indexCol;
						$tableTitle = $data->jenis_temuan->kode_jenis_temuan . " " . $data->jenis_temuan->jenis_temuan;
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
						
						$kerugian_negara = $rekomendasi->kerugian_negara;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'J' . $indexColRekomendasi, $kerugian_negara );
						
						$nilai_rekomendasi = $rekomendasi->nilai_rekomendasi;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'K' . $indexColRekomendasi, $nilai_rekomendasi );
						
						$unit_kerja = $rekomendasi->unit_kerja_id;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'L' . $indexColRekomendasi, $unit_kerja );
						
						if (is_object ( $rekomendasi->tindak_lanjut )) {
							$uraian_tindak_lanjut = $rekomendasi->tindak_lanjut->uraian_tindak_lanjut;
							$objPHPExcel->getActiveSheet ()->setCellValue ( 'M' . $indexColRekomendasi, $uraian_tindak_lanjut );
							
							$tanggal_tl = $rekomendasi->tindak_lanjut->tanggal_tl;
							$objPHPExcel->getActiveSheet ()->setCellValue ( 'N' . $indexColRekomendasi, $tanggal_tl );
							
							$nilai = $rekomendasi->tindak_lanjut->nilai;
							$objPHPExcel->getActiveSheet ()->setCellValue ( 'O' . $indexColRekomendasi, $nilai );
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
			foreach ( $tableData->data as $data ) {
				if ($jenisTemuanData [1] == $data->jenis_temuan->jenis_temuan) {
					$indexNo = $temuanB ++;
					if ($indexNo == 1) {
						$index = $indexColB;
						$tableTitle = $data->jenis_temuan->kode_jenis_temuan . " " . $data->jenis_temuan->jenis_temuan;
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
						
						$kerugian_negara = $rekomendasi->kerugian_negara;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'J' . $indexColBRekomendasi, $kerugian_negara );
						
						$nilai_rekomendasi = $rekomendasi->nilai_rekomendasi;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'K' . $indexColBRekomendasi, $nilai_rekomendasi );
						
						$unit_kerja = $rekomendasi->unit_kerja_id;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'L' . $indexColBRekomendasi, $unit_kerja );
						
						if (is_object ( $rekomendasi->tindak_lanjut )) {
							$uraian_tindak_lanjut = $rekomendasi->tindak_lanjut->uraian_tindak_lanjut;
							$objPHPExcel->getActiveSheet ()->setCellValue ( 'M' . $indexColBRekomendasi, $uraian_tindak_lanjut );
							
							$tanggal_tl = $rekomendasi->tindak_lanjut->tanggal_tl;
							$objPHPExcel->getActiveSheet ()->setCellValue ( 'N' . $indexColBRekomendasi, $tanggal_tl );
							
							$nilai = $rekomendasi->tindak_lanjut->nilai;
							$objPHPExcel->getActiveSheet ()->setCellValue ( 'O' . $indexColBRekomendasi, $nilai );
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
			foreach ( $tableData->data as $data ) {
				if ($jenisTemuanData [2] == $data->jenis_temuan->jenis_temuan) {
					$indexNo = $temuanC ++;
					if ($indexNo == 1) {
						$index = $indexColC;
						$tableTitle = $data->jenis_temuan->kode_jenis_temuan . " " . $data->jenis_temuan->jenis_temuan;
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
						
						$kerugian_negara = $rekomendasi->kerugian_negara;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'J' . $indexColCRekomendasi, $kerugian_negara );
						
						$nilai_rekomendasi = $rekomendasi->nilai_rekomendasi;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'K' . $indexColCRekomendasi, $nilai_rekomendasi );
						
						$unit_kerja = $rekomendasi->unit_kerja_id;
						$objPHPExcel->getActiveSheet ()->setCellValue ( 'L' . $indexColCRekomendasi, $unit_kerja );
						
						if (is_object ( $rekomendasi->tindak_lanjut )) {
							$uraian_tindak_lanjut = $rekomendasi->tindak_lanjut->uraian_tindak_lanjut;
							$objPHPExcel->getActiveSheet ()->setCellValue ( 'M' . $indexColCRekomendasi, $uraian_tindak_lanjut );
							
							$tanggal_tl = $rekomendasi->tindak_lanjut->tanggal_tl;
							$objPHPExcel->getActiveSheet ()->setCellValue ( 'N' . $indexColCRekomendasi, $tanggal_tl );
							
							$nilai = $rekomendasi->tindak_lanjut->nilai;
							$objPHPExcel->getActiveSheet ()->setCellValue ( 'O' . $indexColCRekomendasi, $nilai );
						}
					}
					$temuanPassC = count ( $countTemuan ) + 1;
					continue;
				}
			}
			
			$objWriter = PHPExcel_IOFactory::createWriter ( $objPHPExcel, 'Excel5' );
			$saving = $root . '/assets/data/lhp.xls';
			$objWriter->save ( $saving );
		}
	}
	
	// $data['data_lhp'] = $this->mlhp->data_lhp()->result();
	// $this->load->tlhp_template('tlhp/data_lhp', $data);

/**
 * List All Product
 *
 * @param
 *        	string Category slug
 */
}