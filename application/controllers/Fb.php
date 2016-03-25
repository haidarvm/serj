<?php
defined('BASEPATH') or exit('No direct script access allowed');
use Facebook\Facebook;

class Fb extends CI_Controller {
	protected $accessToken;
	protected $pageId = '1632502116999548';

	function __construct() {
		parent::__construct();
		$data_fb = array( 'app_id' => FB_APP_ID, 'app_secret' => FB_APP_SECRET, 'default_graph_version' => 'v2.5' );
		$this->fb = new Facebook($data_fb);
		$this->load->model('mfacebook');
		$this->mfacebook = new MFacebook();
	}

	public function index() {
		if (! isset($_GET['code'])) {
			redirect('/fb/login', 'refresh');
			die();
		}
		$helper = $this->fb->getRedirectLoginHelper();
		try {
			$accessToken = $helper->getAccessToken();
		} catch (Facebook\Exceptions\FacebookSDKException $e ) {
			// There was an error communicating with Graph
			echo $e->getMessage();
			exit();
		}
		if (isset($accessToken)) {
			// User authenticated your app!
			// Save the access token to a session and redirect
			$_SESSION['facebook_access_token'] = (string) $accessToken;
			$this->accessToken = (string) $accessToken;
			// Log them into your web framework here . . .
			// Redirect here . . .
			redirect('/fb/timeline', 'refresh');
			exit();
		} elseif ($helper->getError()) {
			// The user denied the request
			// You could log this data . . .
			var_dump($helper->getError());
			var_dump($helper->getErrorCode());
			var_dump($helper->getErrorReason());
			var_dump($helper->getErrorDescription());
			// You could display a message to the user
			// being all like, "What? You don't like me?"
			exit();
		}
		// If they've gotten this far, they shouldn't be here
		http_response_code(400);
		exit();
	}
	
	public function feed() {
		$data['getAllFeed'] = $this->mfacebook->getAllFeed();
	}

	public function login() {
		$helper = $this->fb->getRedirectLoginHelper();
		$permissions = array( 'email', 'user_posts', 'manage_pages' ); // Optional permissions
		$loginUrl = $helper->getLoginUrl(site_url() . 'fb?fbTrue=true', $permissions);
		echo '<a href="' . htmlspecialchars($loginUrl) . '">Log in with Facebook!</a>';
	}

	public function timeline() {
		$accessToken = ($this->accessToken) ? $this->accessToken : "872359476218860|qQFDiIoA-eruOSIcoI9HkwkBNao";
		$fields = 'id,message,full_picture,picture,link,name,description,type,icon,created_time,from,object_id';
		$response = $this->fb->get('/' . $this->pageId . '/feed?fields=' . $fields, (string) $accessToken);
		foreach ($response->getDecodedBody() as $fb_data ) {
			// debug(array_pop($fb_data));
			foreach ($fb_data as $data_array ) {
				if (! empty($data_array['id'])) {
					$data['fb_id'] = $data_array['id'];
					$data['message'] = ! empty($data_array['message']) ? $data_array['message'] : "";
					$data['type'] = $data_array['type'];
					$data['created_time'] = $data_array['created_time'];
					$data['from_id'] = $data_array['from']['id'];
					$data['full_picture'] = ! empty($data_array['full_picture']) ? $data_array['full_picture'] : "";
					$data['picture_thumb'] = ! empty($data_array['picture']) ? $data_array['picture'] : "";
					$data['link'] = ! empty($data_array['link']) ? $data_array['link'] : "";
					$data['name'] = ! empty($data_array['name']) ? $data_array['name'] : "";
					$data['object_id'] = ! empty($data_array['object_id']) ? $data_array['object_id'] : "";
					$this->mfacebook->insert($data);
				}
			}
			debug($fb_data);
		}
		// $this->mfacebook->insert();
		// debug($response->getDecodedBody());
	}

	private function checkFbLogin() {
		$helper = $this->fb->getCanvasHelper();
		try {
			$accessToken = $helper->getAccessToken();
		} catch (Facebook\Exceptions\FacebookResponseException $e ) {
			// When Graph returns an error
			echo 'Graph returned an error: ' . $e->getMessage();
			exit();
		} catch (Facebook\Exceptions\FacebookSDKException $e ) {
			// When validation fails or other local issues
			echo 'Facebook SDK returned an error: ' . $e->getMessage();
			exit();
		}
		if (! isset($accessToken)) {
			// echo 'No OAuth data could be obtained from the signed request. User has not authorized your app yet.';
			echo '<script>top.window.location="' . $this->getLoginUrl() . '"; </script>';
			exit();
		}
		$this->accessToken = $accessToken;
	}

	private function getLoginUrl() {
		$helper = $this->fb->getRedirectLoginHelper();
		$permissions = array(); // optional
		$loginUrl = $helper->getLoginUrl('https://developers.facebook.com/apps/704528423018018?fb=true', $permissions);
		return $loginUrl;
	}

	function info() {
		phpinfo();
	}
}
