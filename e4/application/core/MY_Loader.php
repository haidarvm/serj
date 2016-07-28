<?php

class MY_Loader extends CI_Loader {

	public function tlhp_template($template_name, $vars = array(), $return = FALSE) {
		checkAdminUser();
		if ($return) :
			$content = $this->view('tlhp/template/tlhp_header', $vars, $return);
			// $content .= $this->view('user/user_template/sidebar', $vars, $return);
			$content .= $this->view($template_name, $vars, $return);
			$content .= $this->view('tlhp/template/tlhp_footer', $vars, $return);
			return $content;
		 else :
			$this->view('tlhp/template/tlhp_header', $vars);
			// $this->view('user/user_template/sidebar', $vars);
			$this->view($template_name, $vars);
			$this->view('tlhp/template/tlhp_footer', $vars);
		endif;
	}
	
	public function dashboard_template($template_name, $vars = array(), $return = FALSE) {
		//checkAdminUser();
		if ($return) :
		$content = $this->view('dashboard/template/dashboard_header', $vars, $return);
		// $content .= $this->view('user/user_template/sidebar', $vars, $return);
		$content .= $this->view($template_name, $vars, $return);
		$content .= $this->view('tlhp/template/dashboard_footer', $vars, $return);
		return $content;
		else :
		$this->view('dashboard/template/dashboard_header', $vars);
		// $this->view('user/user_template/sidebar', $vars);
		$this->view($template_name, $vars);
		$this->view('dashboard/template/dashboard_footer', $vars);
		endif;
	}
}

