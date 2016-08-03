<?php

function get_current_app() {
	$prefixData = @$_COOKIE['_prefixdata'];
	switch ($prefixData) {
		case 'tlhp_ikp_' :
			$current_app = 'insp.';
			break;
		case 'tlhp_bpk_' :
			$current_app = 'BPK';
			break;
		case 'tlhp_bpkp_' :
			$current_app = 'BPKP';
			break;
		case 'tlhp_orix_' :
			$current_app = 'TLHP';
			break;
		default :
			$current_app = 'insp.';
			break;
	}
	return $current_app;
}

/*
 * function previous_url() {
 * // $ci = & get_instance();
 * // echo $ci->session->last_url;s
 * echo $_SESSION['last_url'];exit;
 * if ($_SESSION['last_url']) {
 * return header('Location: ' . $_SESSION['last_url']);
 * } elseif ($_SESSION['last_url'] == 'logout') {
 * $_SESSION['last_url'] = "";
 * } elseif ($_SESSION['last_url'] == 'logout') {
 * $_SESSION['last_url'] = "";
 * } else {
 * return redirect('home');
 * }
 * }
 */

// if user Super Admin /Admin / user
// Not Done for multiple level
function checkAdminUser() {
	// echo $_SESSION['user_level_id'];
	if (! empty($_SESSION['user_level_id'])) {
		if ($_SESSION['user_level_id'] !== 0 || $_SESSION['user_level_id'] != NULL) {
// 			echo 'level valid'; exit();
			return true;
		} else {
// 			echo 'level lain'; exit();
			// redirect('tlhp');
			# Super Admin, User, Operator only
			return true;
		}
	} else {
		// print_r($_SESSION);exit;
		// echo 'level kosong';exit;
		redirect('auth/login');
	}
}

function checkRes($query) {
	if ($query->num_rows() > 0) {
		return $query->result();
	} else {
		return false;
	}
}

/**
 * Check if Result Query has one row
 *
 * @param unknown $query        	
 * @return boolean
 */
function checkRow($query) {
	if ($query->num_rows() > 0) {
		return $query->row();
	} else {
		return false;
	}
}

/**
 * Count Row
 *
 * @param unknown $query        	
 * @return boolean
 */
function countRow($query) {
	if ($query->num_rows() > 0) {
		return $query->num_rows();
	} else {
		return false;
	}
}

/**
 * Only Number Allow
 *
 * @param unknown $num        	
 * @return mixed
 */
function numberOnly($num) {
	return preg_replace('/\D/', '', $num);
}

function getAge($dob) {
	$dt = DateTime::createFromFormat("Y-m-d", $dob);
	if ($dt !== false) {
		$from = new DateTime($dob);
		$to = new DateTime('today');
		return $from->diff($to)->y;
	} else {
		return $dob;
	}
}

function sidebarCollapse($uri) {
	$haystack = array('update', 'detail');
	if (in_array($uri, $haystack)) {
		return 'sidebar-collapse';
	} else {
		return '';
	}
}

function textSmall($text) {
	// $small = preg_replace("/<p\s(.+?)>(.+?)<\/p>/is", "<small>$2</small>", $text);
	// return $small;
	echo "<small>" . strip_tags($text) . "</small>";
}

function removeTopMenu($uri) {
	$haystack = array('home');
	if (in_array($uri, $haystack)) {
		return false;
	} else {
		return true;
	}
}

function removeButtonMenu($uri) {
	$haystack = array('compare', 'versus');
	if (in_array($uri, $haystack)) {
		return false;
	} else {
		return true;
	}
}

/**
 * User Login insert Session
 *
 * @param unknown $username        	
 * @param unknown $user_id        	
 * @param unknown $full_name        	
 * @param unknown $level        	
 * @param unknown $company_id        	
 * @param unknown $company_name        	
 * add new unit kerja perlu dengan id nya jga
 */
function define_sess($username, $user_id, $full_name, $user_level_id, $user_level, $email) {
	// $_SESSION['jk_username'] = $username;
	// $_SESSION['jk_user_id'] = $user_id;
	// $_SESSION['jk_full_name'] = $full_name;
	// $_SESSION['jk_level'] = $level;
	$ci = & get_instance();
	$newdata = array('username' => $username, 'user_id' => $user_id, 'full_name' => $full_name, 'user_level_id' => $user_level_id, 'user_level' => $user_level, 'email' => $email, 'last_url' => $_SERVER['HTTP_REFERER'], 'logged_in' => TRUE);
	$ci->session->set_userdata($newdata);
	// echo USERNAME;exit;
	// print_r($_SESSION);exit;
}

/**
 * For Back to previous URL
 */
function previousUrl() {
	if (isset($_SERVER["HTTP_REFERER"])) {
		header("Location: " . $_SERVER["HTTP_REFERER"]);
	}
}

function fire($log) {
	$ci = & get_instance();
	$ci->load->library('firephp');
	return $ci->firephp->log($log, __METHOD__);
}

function uploader($log) {
	$ci = & get_instance();
	$ci->load->library('uploadhandler');
	return $ci->uploadhandler->log($log, __METHOD__);
}

/**
 * Generate Slug
 *
 * @param string $text        	
 * @return string|mixed
 */
function slugify($text) {
	// replace non letter or digits by -
	$text = preg_replace('~[^\\pL\d]+~u', '-', $text);
	// trim
	$text = trim($text, '-');
	// transliterate
	$text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);
	// lowercase
	$text = strtolower($text);
	// remove unwanted characters
	$text = preg_replace('~[^-\w]+~', '', $text);
	if (empty($text)) {
		return 'n-a';
	}
	return $text;
}

/**
 * Get First Digit
 *
 * @param unknown $char        	
 * @return string
 */
function get3Digit($char) {
	return substr($char, 0, 3);
}

/**
 * Image Url
 *
 * @return string
 */
function img_url() {
	return base_url() . 'assets/img/';
}

/**
 * Product Thumbnail Url
 *
 * @return string
 */
function prod_thumb_url() {
	return base_url() . 'assets/product/thumb/';
}

/**
 * Product Small Image Url
 *
 * @return string
 */
function prod_small_url() {
	return base_url() . 'assets/product/small/';
}

/**
 * Product Original Url
 *
 * @return string
 */
function prod_ori_url() {
	return base_url() . 'assets/product/ori/';
}

/**
 * Product Small Image Url
 *
 * @return string
 */
function venue_small_url() {
	return base_url() . 'assets/venues/small/';
}

/**
 * Product Thumbnail Url
 *
 * @return string
 */
function venue_thumb_url() {
	return base_url() . 'assets/venues/thumb/';
}

/**
 * Product Original Url
 *
 * @return string
 */
function venue_ori_url() {
	return base_url() . 'assets/venues/ori/';
}

/**
 * Product Small Image Url
 *
 * @return string
 */
function small_url($type) {
	return base_url() . 'assets/' . $type . '/small/';
}

/**
 * Product Thumbnail Url
 *
 * @return string
 */
function thumb_url($type) {
	return base_url() . 'assets/' . $type . '/thumb/';
}

/**
 * Product Original Url
 *
 * @return string
 */
function ori_url($type) {
	return base_url() . 'assets/' . $type . '/ori/';
}

function basic_path() {
	$fr_loc = explode('/', $_SERVER['SCRIPT_NAME']);
	$base_path = $_SERVER['DOCUMENT_ROOT'] . '/' . $fr_loc[1] . '/';
	return $base_path;
}

/**
 *
 * @return page url
 */
function page_url() {
	return site_url() . 'page/';
}

function year_add($year) {
	return $year . '-01-01';
}

function year_only($date) {
	return date('Y', strtotime($date));
}

function indoDateFormat($date) {
	return date('d-m-Y', strtotime($date));
}

function sqlDateFormat($date) {
	return date('Y-m-d', strtotime($date));
}

/**
 * Limit Character
 *
 * @param unknown $text        	
 */
function limitChar($text, $limit) {
	return substr($text, 0, $limit);
}

/**
 * Delete Unused Character
 *
 * @param string $text        	
 * @return mixed
 */
function delUn($text) {
	$remove = array('copy', 'close');
	$string = str_replace($remove, '', $text);
	return $string;
}

/**
 * Replace char
 *
 * @param unknown $text        	
 * @return mixed
 */
function repChar($text) {
	$remove = array('&');
	$string = str_replace($remove, '-', $text);
	return $string;
}

/**
 * Delete Extension
 *
 * @param unknown $filename        	
 * @return mixed
 */
function delExt($filename) {
	return preg_replace('/\\.[^.\\s]{3,4}$/', '', $filename);
}

function clearName($filename) {
	return repChar(delUn(delExt($filename)));
}

/**
 * Minus Percantage Ex.
 * 90 - 10% = 80
 *
 * @param number $before        	
 * @param number $min        	
 * @return number
 */
function min_percent($before, $min) {
	return $before * ((100 - $min) / 100);
}

/**
 * Delete files
 *
 * @param path $path        	
 */
function deleteFiles($path) {
	$files = glob($path . '*'); // get all file names
	foreach ( $files as $file ) { // iterate files
		if (is_file($file))
			unlink($file); // delete file
				               // echo $file.'file deleted';
	}
}

function debug($params) {
	echo '<pre>';
	print_r($params);
	echo '</pre>';
}

function dump($params) {
	echo '<pre>';
	var_dump($params);
	echo '</pre>';
}

// add td for report
function add_td($row) {
	return '<td>' . $row . '</td>';
}

/**
 * Default config for upload
 *
 * @param path $uploadPath        	
 * @return string
 */
function configUpload($uploadPath) {
	$config['allowed_types'] = 'gif|jpg|png';
	$config['max_size'] = '1000';
	$config['max_width'] = '2000';
	$config['max_height'] = '1024';
	$config['max_height'] = '1024';
	$config['upload_path'] = $uploadPath;
	return $config;
}

/**
 * Get Message
 *
 * @param unknown $uri        	
 * @return string
 */
function getMessage($uri) {
	if ($uri == "delete_success")
		$data['message'] = "<div class='alert alert-success'>Delete Success</div>";
	else if ($uri == "add_success")
		$data['message'] = "<div class='alert alert-success'>Insert Success</div>";
	else if ($uri == "update_success")
		$data['message'] = "<div class='alert alert-success'>Update Success</div>";
	else
		$data['message'] = '';
	return $data['message'];
}

function dateReg() {
	return date('D, d-M-Y H:i:s');
}

/**
 * DataTable Execute Server side
 * Author : Agus Prasetyo / agusprasetyo811@gmail.com
 *
 * @param unknown $aCol        	
 * @param unknown $sTable        	
 * @param unknown $sGroupBy        	
 * @param unknown $sIndexTable        	
 * @param unknown $anyWhere        	
 * @return string
 */
function datatable_connect($aCol, $sTable, $sGroupBy = NULL, $sIndexTable = NULL, $anyWhere = NULL) {
	$CI = & get_instance();
	
	$sGroupBy = ($sGroupBy != NULL) ? $sGroupBy : '';
	
	$aColumns = array_keys($aCol);
	$aColVal = array_values($aCol);
	
	$sIndexTable = ($sIndexTable != NULL) ? (int) $sIndexTable : 0;
	
	// Paging
	$sLimit = "";
	
	if (isset($_GET['iDisplayStart']) && $_GET['iDisplayLength'] != '-1') {
		$sLimit = "LIMIT " . intval($_GET['iDisplayStart']) . ", " . intval($_GET['iDisplayLength']);
	}
	
	// Ordering
	$sOrder = "";
	if (isset($_GET['iSortCol_0'])) {
		$sOrder = "ORDER BY  ";
		for($i = 0; $i < intval($_GET['iSortingCols']); $i ++) {
			if ($_GET['bSortable_' . intval($_GET['iSortCol_' . $i])] == "true") {
				// echo intval($_GET['iSortCol_'.$i]).$i;
				$get_col = (intval($_GET['iSortCol_' . $i]) < 0) ? 0 : intval($_GET['iSortCol_' . $i]) - $sIndexTable;
				$cek_col[] = $aColVal[intval($_GET['iSortCol_' . $i]) - $sIndexTable];
				$sOrder .= "" . $aColVal[$get_col] . " " . ($_GET['sSortDir_' . $i] === 'asc' ? 'asc' : 'desc') . ", ";
			}
		}
		
		$sOrder = substr_replace($sOrder, "", - 2);
		
		if ($sOrder == "ORDER BY") {
			$sOrder = "";
		}
		
		if (! isset($cek_col)) {
			$sOrder = "";
		}
	}
	
	// Filtering
	$sWhere = "";
	if (isset($_GET['sSearch']) && $_GET['sSearch'] != "") {
		$sWhere = "WHERE (";
		
		if (count($anyWhere) != 0) {
			foreach ( $anyWhere as $cond ) {
				$getAnyCon[] = $cond;
			}
			
			$sWhere .= implode('AND ', $getAnyCon) . ") AND (";
		}
		
		for($i = 0; $i < count($aColumns); $i ++) {
			if (strpos($aColumns[$i], '@') !== false) {
			} else {
				$sWhere .= " " . $aColumns[$i] . " LIKE '%" . mysql_real_escape_string($_GET['sSearch']) . "%' OR ";
			}
		}
		
		$sWhere = substr_replace($sWhere, "", - 3) . ')';
	} else {
		if (count($anyWhere) != 0) {
			foreach ( $anyWhere as $cond ) {
				$getAnyCon[] = $cond;
			}
			
			$sWhere .= "WHERE ( " . implode('AND ', $getAnyCon) . ')';
		}
	}
	
	if (trim($sWhere) == "WHERE") {
		$sWhere = "";
	}
	
	// Individual column filtering
	for($i = 0; $i < count($aColumns); $i ++) {
		if (strpos($aColumns[$i], '@') !== false) {
		} else {
			if (isset($_GET['bSearchable_' . $i]) && $_GET['bSearchable_' . $i] == "true" && $_GET['sSearch_' . $i] != '') {
				if ($sWhere == "") {
					$sWhere = "WHERE ";
				} else {
					$sWhere .= " AND ";
				}
				$sWhere .= "" . $aColumns[$i] . " LIKE '%" . mysql_real_escape_string($_GET['sSearch_' . $i]) . "%' ";
			}
		}
	}
	
	if ($sGroupBy != '') {
		$sGroupBy = "GROUP BY " . $sGroupBy . " ";
	} else {
		$sGroupBy = '';
	}
	
	// SQL queries Get data to display
	for($col = 0; $col < count($aCol); $col ++) {
		if (strpos($aColumns[$col], '@') !== false) {
			$aColumns[$col] = substr($aColumns[$col], 1);
		}
		$getCol[] = $aColumns[$col] . " AS " . $aColVal[$col];
	}
	
	$sQuery = "SELECT SQL_CALC_FOUND_ROWS " . str_replace(" , ", " ", implode(", ", $getCol)) . " FROM   $sTable $sWhere $sGroupBy $sOrder $sLimit ";
	$rResult = $CI->db->query($sQuery);
	
	// Data set length after filtering
	$sQuery = "SELECT FOUND_ROWS() as found_rows";
	$rResultFilterTotal = $CI->db->query($sQuery);
	$aResultFilterTotal = $rResultFilterTotal->row()->found_rows;
	$iFilteredTotal = (string) $aResultFilterTotal;
	
	// Total data set length
	// $sQuery = "SELECT COUNT(".$sIndexColumn.") FROM $sTable $sGroupBy";
	$sQuery = "SELECT * FROM $sTable $sGroupBy";
	$rResultTotal = $CI->db->query($sQuery);
	$aResultTotal = $rResultTotal->num_rows();
	$iTotal = (string) $aResultTotal;
	
	// Output
	$output = array("sEcho" => intval(@$_GET['sEcho']), "iTotalRecords" => $iTotal, "iTotalDisplayRecords" => $iFilteredTotal, "aaData" => array());
	
	$no = (@$_GET['iDisplayStart'] != NULL) ? $_GET['iDisplayStart'] + 1 : 1;
	foreach ( $rResult->result() as $aRow ) {
		$get_no = $no ++;
		$row = array();
		for($i = 0; $i < count($aColVal); $i ++) {
			/* General output */
			$row['no'] = @$get_no;
			$row[$aColVal[$i]] = @$aRow->$aColVal[$i];
		}
		$output['aaData'][] = $row;
	}
	
	return json_encode($output);
}

