<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author Haidar Mar'ie
 *         email : haidarvm@gmail.com
 */
class Addlhp extends MY_Controller {

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
		$data['title'] = "Buat Laporan Hasil Pengawasan Baru";
		$data['getAllJenisTim'] = $this->mlhp->getAllJenisTim();
		$data['getAllJenisPengawasan'] = $this->mlhp->getAllJenisPengawasan();
		$this->load->tlhp_template('tlhp/addlhp', $data);
	}

	/**
	 * List All Product
	 * -
	 * @param string Category slug
	 */
	
	public function insert(){
		$post = $this->input->post();
		if ($post){
			$no_surat_tugas = $post['no_surat_tugas'];
			$tanggal_surat_tugas = $post['tanggal_surat_tugas'];
			$hari_awal_penugasan = $post['hari_awal_penugasan'];
			$hari_akhir_penugasan = $post['hari_akhir_penugasan'];
			$skop_awal_penugasan = $post['skop_awal_penugasan'];
			$skop_akhir_penugasan = $post['skop_akhir_penugasan'];
			$tim = $post['tim'];
			$objek_pengawasan = $post['objek_pengawasan'];
			$judul_lhp = $post['judul_lhp'];
			$nomor_lhp = $post['nomor_lhp'];
			$st_perpanjangan = $post['st_perpanjangan'];
			$tgl_st_perpanjangan = $post['tgl_st_perpanjangan'];
			$hari_awal_perpanjangan_penugasan = $post['hari_awal_perpanjangan_penugasan'];
			$hari_akhir_perpanjangan_penugasan = $post['hari_akhir_perpanjangan_penugasan'];
			$hari_awal_pemeriksaan_penugasan = $post['hari_awal_pemeriksaan_penugasan'];
			
			
			$param = array (
					'no_surat_tugas' => $no_surat_tugas,
					'tanggal_surat_tugas' => $tanggal_surat_tugas,
					'hari_awal_penugasan' => $hari_akhir_penugasan,
					'hari_akhir_penugasan' => $hari_akhir_penugasan,
					'skop_awal_penugasan' => $skop_awal_penugasan,
					'skop_akhir_penugasan' => $skop_akhir_penugasan,
					'jenis_pengawasan_id' => null,
					'objek_pengawasan' => $objek_pengawasan,
					'judul_lhp' => $judul_lhp,
					'nomor_lhp' => $nomor_lhp,
					'tanggal_lhp' => $t,
					'nama_ppk' => $no_surat_tugas,
					'st_perpanjangan' => $st_perpanjangan,
					'tgl_st_perpanjangan' => $tgl_st_perpanjangan,
					'hari_awal_perpanjangan_penugasan' => $hari_awal_perpanjangan_penugasan,
					'hari_akhir_perpanjangan_penugasan' => $hari_akhir_perpanjangan_penugasan,
					'user_id' => $no_surat_tugas,
					
			);
			
			
			
			//$this->mlhp->addAllLHP($param);
			
			print_r($post);
			exit;
		}
	}
	
	public function update(){
		$post = $this->input->post();
		if ($post){
			print_r($post);exit;
		}
	}
	
	public function delete(){
		$post = $this->input->post();
		if ($post){
			print_r($post);exit;
		}
	
	}
	
	
}