<?php
/**
 * 
 * @author omapslab
 *
 */
class Mtemplate extends CI_Model {

	function __construct() {
		parent::__construct();
	}

	public function insertTemplateLaporan($data) {
		unset($data['files']);
		unset($data['file']);
		unset($data['file_id']);
		$data['tanggal_laporan'] = sqlDateFormat($data['tanggal_laporan']);
		$query = $this->db->insert('template_laporan', $data);
		return $this->db->insert_id();
		// echo $this->db->last_query();exit;
	}

// 	public function getAllTemplate($cond = NULL, $order_by = NULL) {
// 		$cond = ! empty($cond) ? " WHERE 1=1  " . $cond : null;
// 		$sql = "SELECT *, tl.template_laporan_id as template_laporan_id, tl.create_date as create_date
// 				FROM {PRE}template_laporan tl
//     			LEFT JOIN {PRE}template_laporan_media tlm ON tlm.template_laporan_id = tl.template_laporan_id
//     			LEFT JOIN {PRE}upload_template_laporan utl ON tlm.upload_template_id = utl.upload_template_id
//     			" . $cond . " " . $order_by;
// 		$query = $this->db->query($sql);
// 		// echo $this->db->last_query();exit;
// 		return $query;
// 	}
	
	public function getAllTemplate($cond = NULL, $order_by = NULL) {
		$cond = ! empty($cond) ? " WHERE 1=1  " . $cond : null;
		$sql = "SELECT *, tl.template_laporan_id as template_laporan_id, tl.create_date as create_date
				FROM {PRE}template_laporan tl
    			LEFT JOIN {PRE}template_laporan_media tlm ON tlm.template_laporan_id = tl.template_laporan_id
    			LEFT JOIN {PRE}upload_template_laporan utl ON tlm.upload_template_id = utl.upload_template_id
    			" . $cond . " GROUP BY tl.template_laporan_id  " . $order_by;
		$query = $this->db->query($sql);
		// echo $this->db->last_query();exit;
		return $query;
	}

	public function getTemplate($id) {
		$query = $this->db->get_where('template_laporan', array('template_laporan_id' => $id));
		// echo $this->db->last_query();exit;
		return checkRow($query);
	}

	public function updateTemplateLaporan($data, $template_laporan_id) {
		unset($data['file']);
		unset($data['files']);
		unset($data['img_id']);
		unset($data['file_id']);
		return $this->db->update('template_laporan', $data, array('template_laporan_id' => $template_laporan_id));
	}

	public function insertMedia($data) {
// 		print_r($data);
		$file_name = $data['file_name'];
		$this->db->insert("upload_template_laporan", $data);
		$upload_template_id = $this->db->insert_id();
		//$this->renameFile($file_name,$upload_template_id);
		return $upload_template_id;
	}
	
	
	public function getMediaList($template_laporan_id) {
		$query = "
				SELECT * FROM {PRE}template_laporan_media tlm  
				LEFT JOIN {PRE}upload_template_laporan utl ON tlm.upload_template_id = utl.upload_template_id 
				WHERE  tlm.template_laporan_id = '$template_laporan_id' ";
		return $this->db->query($query);
	}

	public function renameFile($file_name,$upload_tempalate_id) {
		$ext = getExt($file_name);
		$oldname = FCPATH . 'assets/media/'.$file_name;
		$newname = FCPATH . 'assets/media/template/'.$upload_tempalate_id.$ext;
		
		$data['path'] = 'assets/media/template/'.$upload_tempalate_id.$ext;
		$data['url'] = base_url(). 'assets/media/template/'.$upload_tempalate_id.$ext;
		$this->updateMedia($data,$upload_tempalate_id);
		return rename($oldname, $newname);
// 		return $this->db->update('upload_template_laporan', $data, array('upload_template_id' => $upload_tempalate_id));
	}
	
	public function updateMedia($data,$upload_template_id) {
		return $this->db->update('upload_template_laporan', $data, array('upload_template_id' =>$upload_template_id));
	}

	public function insertTemplateLaporanMedia($data) {
		$this->db->insert("template_laporan_media", $data);
		return $this->db->insert_id();
	}
}