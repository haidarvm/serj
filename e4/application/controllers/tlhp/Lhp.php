<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 * @author: Atang Sutisna (atang.sutisna.87@gmail.com)
 * 
 */
class Lhp extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('mlhp');
	}
	
	public function add() {
		$allowedGroup = 1;
		$currGroup = $_SESSION['user_level_id'];
		try {
			check_permission($allowedGroup, $currGroup);
			
			$data['action'] = 'insert';
			$data['title'] = "Buat Laporan Hasil Pengawasan Baru";
			$data['getAllJenisTim'] = $this->mlhp->getAllJenisTim();
			$data['getAllJenisPengawasan'] = $this->mlhp->getAllJenisPengawasan();
			$this->load->tlhp_template('tlhp/lhp/add', $data);
		} catch (Exception $e) {
			$this->access_denied();
		}
	}
	
	public function monitoring() {
		$allowedGroup = 2;
		$currGroup = $_SESSION['user_level_id'];
		try {
			check_permission($allowedGroup, $currGroup);
			
			$data ['title'] = "UPDATE LHP";
			$data ['getAllLHP'] = $this->mlhp->getAllLHP ();
			$this->load->tlhp_template ( 'tlhp/lhp/form_monitoring', $data );	
		} catch (Exception $e) {
			$this->access_denied();
		}
		
	}
	
}