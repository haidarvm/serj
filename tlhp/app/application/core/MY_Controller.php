<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class MY_Controller extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        
        //session_start();
        
//         if ($this->session->userdata('login') == FALSE)
//         {
//             redirect('auth/login');
//         }
    }   
}
