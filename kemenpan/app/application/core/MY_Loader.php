<?php

class MY_Loader extends CI_Loader {

	public function template($template_name, $vars = array(), $return = FALSE) {
		//checkAdminUser();
		if ($return) :
			$content = $this->view('template/header', $vars, $return);
			// $content .= $this->view('user/user_template/sidebar', $vars, $return);
			$content .= $this->view($template_name, $vars, $return);
			$content .= $this->view('template/footer', $vars, $return);
			return $content;
		 else :
			$this->view('template/header', $vars);
			// $this->view('user/user_template/sidebar', $vars);
			$this->view($template_name, $vars);
			$this->view('template/footer', $vars);
		endif;
	}

	/* public function admin_template($template_name, $vars = array(), $return = FALSE) {
		checkAdminUser();
		if ($return) :
			$content = $this->view('admin/admin_template/admin_header', $vars, $return);
			$content .= $this->view('admin/admin_template/admin_sidebar', $vars, $return);
			$content .= $this->view($template_name, $vars, $return);
			$content .= $this->view('admin/admin_template/admin_footer', $vars, $return);
			return $content;
		 else :
			$this->view('admin/admin_template/admin_header', $vars);
			$this->view('admin/admin_template/admin_sidebar', $vars);
			$this->view($template_name, $vars);
			$this->view('admin/admin_template/admin_footer', $vars);
		endif;
	} */
}

