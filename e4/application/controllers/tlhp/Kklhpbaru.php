<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Kklhpbaru extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->load->model('mlhp');
		$this->muser = new MUser();
		$this->mlhp = new MLhp();
	}

	/**
	 * Redirect to product_list
	 */
	public function index() {
		$this->add();
	}

	public function add($lhp_id) {
		$data['lhp'] = $this->mlhp->getLHP($lhp_id);
		$data['title'] = "Kertas Kerja Laporan Hasil Pengawasan Baru";
		$data['action'] = "add";
		$data['kode_temuan'] = $this->mlhp->getAllKodeTemuan();
		$data['kode_sebab'] = $this->mlhp->getAllKodeSebab();
		$data['kode_rekomendasi'] = $this->mlhp->getAllKodeRekomendasi();
		// $data['getAll'] = $this->muser->getAllUser();
		$this->load->tlhp_template('tlhp/kklhp', $data);
	}

	public function insert() {
		// entry Jumlah Temuan A
		// print_r($_POST); exit();
		$arrayjenistemuan = array("a" => "SISTEM PENGENDALIAN INTERNAL", "b" => "KEPATUHAN TERHADAP PERATURAN DAN PERUNDANG-UNDANGAN", "c" => "LAPORAN KEUANGAN");
		$lhp_id = $this->input->post("lhp_id");
		
		$post = $this->input->post();
		
		// Karna ini berat klo di edit satu per satu
		// $this->mlhp->deleteRekomendasiLHPId($lhp_id);
		// $this->mlhp->deleteKKKLHPId($lhp_id);
		$this->db->query("delete from {PRE}rekomendasi where kertas_kerja_id in(select kertas_kerja_id from {PRE}kertas_kerja_temuan where lhp_id='" . $lhp_id . "')");
		$this->db->query("delete from {PRE}kertas_kerja_temuan where lhp_id='" . $lhp_id . "'");
		
		foreach ( $arrayjenistemuan as $index => $jenistemuan ) {
			$jumlahtemuan = $this->input->post("jumlah_temuan_" . $index . "");
			
			for($a = 1; $a <= $jumlahtemuan; $a ++) {
				
				$jumlahrekomen = $this->input->post("jumlah_rekomen-" . $index . $a . "", true);
				
				$kode_temuan = $this->input->post("kode_temuan_id-" . $index . $a . "", true);
				$uraian_temuan = $this->input->post("uraian_temuan-" . $index . $a . "", true);
				$kode_sebab = $this->input->post("kode_sebab_id-" . $index . $a . "", true);
				$uraian_sebab = $this->input->post("uraian_sebab-" . $index . $a . "", true);
				$nilai_temuan = $this->input->post("nilai_temuan-" . $index . $a . "", true);
				$user_id = $_SESSION['user_id'];
				
				if (! empty($kode_temuan) && ! empty($kode_sebab)) {
					// echo 'masuk';exit;
					$data_temuan = array("lhp_id" => $lhp_id, "jenis_temuan" => strtolower($index), "kode_temuan_id" => $kode_temuan, "uraian_temuan" => $uraian_temuan, "kode_sebab_id" => $kode_sebab, "uraian_sebab" => $uraian_sebab, "user_id" => $user_id, "nilai_temuan" => $nilai_temuan);
					
					$insertKK = $this->mlhp->insertKKLHP($data_temuan);
				}
				// $this->db->insert("kertas_kerja_temuan", $datatemuan);
				
				$row_kertas_kerja = $this->mlhp->getMaxKK();
				$kertas_kerja_id = $row_kertas_kerja->kertas_kerja_id;
				
				// echo $jumlahrekomen; exit();
				for($b = 1; $b <= $jumlahrekomen; $b ++) {
					
					$kode_rekomendasi = $this->input->post("kode_rekomendasi_id-" . $index . $a . $b . "", true);
					$uraian_rekomendasi = $this->input->post("uraian_rekomendasi-" . $index . $a . $b . "", true);
					$kerugian_negara = $this->input->post("kerugian_negara-" . $index . $a . $b . "", true);
					$nilai_rekomendasi = $this->input->post("nilai_rekomendasi-" . $index . $a . $b . "", true);
					
					if (! empty($kode_rekomendasi)) {
						$data_rekomendasi = array("kertas_kerja_id" => $insertKK, "kode_rekomendasi_id" => $kode_rekomendasi, "uraian_rekomendasi" => $uraian_rekomendasi, "kerugian_negara" => $kerugian_negara, "nilai_rekomendasi" => $nilai_rekomendasi);
						$insertRekomen = $this->mlhp->insertRekomen($data_rekomendasi);
					}
				}
			}
		}
		redirect(base_url() . "tlhp/pilihlhp");
	}
}