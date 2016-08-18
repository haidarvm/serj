<?php

if (! defined ( 'BASEPATH' ))
	exit ( 'No direct script access allowed' );

class AccessDeniedException extends Exception {
	
	public function __construct($message, $code = 0, Exception $previous = null) {
        parent::__construct($message, $code, $previous);
    }
}

class MY_Controller extends CI_Controller {
	public function __construct() {
		parent::__construct ();		
		// session_start();
		
		// if ($this->session->userdata('login') == FALSE)
		// {
		// redirect('auth/login');
		// }
	}
	
	protected function access_denied() {
		echo "<h2>Access Denied</h2>";
	}
}
