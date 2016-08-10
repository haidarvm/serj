<?php
if (! defined('BASEPATH'))
	exit('No direct script access allowed');
class Upload extends MY_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('muser');
		$this->load->model('mtemplate');
		$this->muser = new MUser();
		$this->mtemplate = new mtemplate();
	}

	public function do_upload() {
		$upload_path_url = base_url() . 'assets/upload/';
		
		$config['upload_path'] = FCPATH . 'assets/upload/';
		$config['allowed_types'] = 'jpg|jpeg|png|gif';
		$config['max_size'] = '300000';
		
		$this->load->library('upload', $config);
		
		if (! $this->upload->do_upload()) {
			// $error = array('error' => $this->upload->display_errors());
			// $this->load->view('upload', $error);
			// Load the list of existing files in the upload directory
			$existingFiles = get_dir_file_info($config['upload_path']);
			$foundFiles = array();
			$f = 0;
			foreach ( $existingFiles as $fileName => $info ) {
				if ($fileName != 'thumbs') { // Skip over thumbs directory
				                             // set the data for the json array
					$foundFiles[$f]['name'] = $fileName;
					$foundFiles[$f]['size'] = $info['size'];
					$foundFiles[$f]['url'] = $upload_path_url . $fileName;
					$foundFiles[$f]['thumbnailUrl'] = $upload_path_url . 'thumbs/' . $fileName;
					$foundFiles[$f]['deleteUrl'] = base_url() . 'upload/deleteImage/' . $fileName;
					$foundFiles[$f]['deleteType'] = 'DELETE';
					$foundFiles[$f]['error'] = null;
					
					$f ++;
				}
			}
			// echo 'masuk';exit;
			$this->output->set_content_type('application/json')->set_output(json_encode(array('files' => $foundFiles)));
		} else {
			$data = $this->upload->data();
			// to re-size for thumbnail images un-comment and set path here and in json array
			$config = array();
			$config['image_library'] = 'gd2';
			$config['source_image'] = $data['full_path'];
			$config['create_thumb'] = TRUE;
			$config['new_image'] = $data['file_path'] . 'thumbs/';
			$config['maintain_ratio'] = TRUE;
			$config['thumb_marker'] = '';
			$config['width'] = 75;
			$config['height'] = 50;
			$this->load->library('image_lib', $config);
			$this->image_lib->resize();
			
			// set the data for the json array
			$info = new StdClass();
			$info->name = $data['file_name'];
			$info->size = $data['file_size'] * 1024;
			$info->type = $data['file_type'];
			$info->url = $upload_path_url . $data['file_name'];
			// I set this to original file since I did not create thumbs. change to thumbnail directory if you do = $upload_path_url .'/thumbs' .$data['file_name']
			$info->thumbnailUrl = $upload_path_url . 'thumbs/' . $data['file_name'];
			$info->deleteUrl = base_url() . 'upload/deleteImage/' . $data['file_name'];
			$info->deleteType = 'DELETE';
			$info->error = null;
			
			$files[] = $info;
			// this is why we put this in the constants to pass only json data
			if (IS_AJAX) {
				//echo 'masuk'; exit();
				echo json_encode(array("files" => $files));
				// this has to be the only data returned or you will get an error.
				// if you don't give this a json array it will give you a Empty file upload result error
				// it you set this without the if(IS_AJAX)...else... you get ERROR:TRUE (my experience anyway)
				// so that this will still work if javascript is not enabled
			}
		}
	}

	public function deleteImage($file) { // gets the job done but you might want to add error checking and security
		$success = unlink(FCPATH . 'assets/upload/' . $file);
		$success = unlink(FCPATH . 'assets/upload/thumbs/' . $file);
		// info to see if it is doing what it is supposed to
		$info = new StdClass();
		$info->sucess = $success;
		$info->path = base_url() . 'assets/upload/' . $file;
		$info->file = is_file(FCPATH . 'assets/upload/' . $file);
		
		if (IS_AJAX) {
			// I don't think it matters if this is set but good for error checking in the console/firebug
			echo json_encode(array($info));
		} else {
			// here you will need to decide what you want to show for a successful delete
			$file_data['delete_data'] = $file;
			$this->load->view('upload/delete_success', $file_data);
		}
	}
}
