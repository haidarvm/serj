<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="<?php echo base_url();?>assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="<?php echo base_url();?>assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title><?php echo (isset($title)) ? $title : 'Kementrian Pendayagunaan Aparatur Negara.'; ?></title>

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />

<!-- Bootstrap core CSS     -->
<link href="<?php echo base_url();?>assets/css/style.css" rel="stylesheet" />
<link href="<?php echo base_url();?>assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="<?php echo base_url();?>assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="<?php echo base_url();?>assets/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="<?php echo base_url();?>assets/css/paper-tlhp-dashboard.css" rel="stylesheet" />

<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="<?php echo base_url();?>assets/css/demo.css" rel="stylesheet" />

<!--  Fonts and icons     -->
<link href="<?php echo base_url();?>assets/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
<link href="<?php echo base_url();?>assets/css/themify-icons.css" rel="stylesheet">

<!-- #######################################
			StyleSheet And LESS Compailer
		########################################-->
<link href="<?php echo base_url();?>assets/css/custom.css" rel="stylesheet" />
</head>
<script type="text/javascript">
var site_url = '<?php echo base_url()?>';
</script>
<body>

	<div class="wrapper">
		<div class="sidebar" data-background-color="white" data-active-color="info">

			<!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

			<div class="sidebar-wrapper">
				<div class="logo t-center">
					<a href="<?php echo site_url();?>dashboard/"><img src="<?php echo base_url();?>assets/img/logo-white.png"></a>
				</div>
				<div class="clr"></div>
				<ul class="nav">
					<li <?php echo $this->uri->segment(2)  == 'menusa' ? 'class="active"' : '' ?>><a href="<?php echo site_url();?>tlhp/menusa.php"> <i class="ti-dashboard"></i>
							<p title="Dashboard">Dashboard</p>
					</a></li>
					<li <?php echo $this->uri->segment(2)  == 'manus' ? 'class="active"' : '' ?>><a href="<?php echo site_url();?>tlhp/manus.php"> <i class="ti-user"></i>
							<p title="Managment User">Managment User</p>
					</a></li>
					<li <?php echo $this->uri->segment(2)  == 'addlhp' ? 'class="active"' : '' ?>><a href="<?php echo site_url();?>tlhp/addlhp.php"> <i class="ti-pencil-alt"></i>
							<p title="Buat LHP Baru">Buat LHP Baru</p>
					</a></li>
					<li <?php echo $this->uri->segment(2)  == 'pilihlhp' ? 'class="active"' : '' ?>><a href="<?php echo site_url();?>tlhp/pilihlhp.php"> <i class="ti-new-window"></i>
							<p title="Update LHP">Update LHP</p>
					</a></li>
					<li <?php echo $this->uri->segment(2)  == 'daftarlap' ? 'class="active"' : '' ?>><a href="<?php echo site_url();?>tlhp/daftarlap.php"> <i class="ti-agenda"></i>
							<p title="Template Laporan">Template Laporan</p>
					</a></li>
					<li <?php echo $this->uri->segment(2)  == 'kodefikasi' ? 'class="active"' : '' ?>><a href="<?php echo site_url();?>tlhp/kodefikasi.php"> <i class="ti-menu-alt"></i>
							<p title="Kodefikasi">Kodefikasi</p>
					</a></li>
					<li <?php echo $this->uri->segment(2)  == 'loghistory' ? 'class="active"' : '' ?>><a href="<?php echo site_url();?>tlhp/loghistory.php"> <i class="ti-archive"></i>
							<p title="Log History">Log History</p>
					</a></li>
					<li><a href="<?php echo site_url();?>tlhp/welcome.php"> <i class="ti-power-off"></i>
							<p title="Logout">Logout</p>
					</a></li>
				</ul>
			</div>
		</div>

		<div class="main-panel">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-minimize">
						<a class="navbar-brand navbar-minimize" href="#" id="minimizeSidebar"> <i class="ti-menu"></i>
						</a>
					</div>
					<div class="navbar-header">
						<button type="button" class="navbar-toggle">
							<span class="sr-only">Toggle navigation</span> <span class="icon-bar bar1"></span> <span class="icon-bar bar2"></span> <span class="icon-bar bar3"></span>
						</button>
						<h3><?php echo (isset($title)) ? $title : 'Kementrian Pendayagunaan Aparatur Negara.'; ?></h3>
					</div>

					<div class="collapse navbar-collapse .col-md-3">
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img src="<?php echo base_url();?>assets/img/faces/face-2.jpg" alt="..." class="img-circle profile-pic">
									<p>Welcome, Super admin</p> <b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<li><a href="#">Edit profile</a></li>
									<li><a href="#">Setting</a></li>
									<li><a href="#">Log out</a></li>
								</ul></li>
						</ul>

					</div>
				</div>
			</nav>

			<!--nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">Kementrian Pendayagunaan Aparatur Negara</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="ti-panel"></i>
								<p>Stats</p>
                            </a>
                        </li>
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="ti-bell"></i>
                                    <p class="notification">5</p>
									<p>Notifications</p>
									<b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                                <li><a href="#">Notification 3</a></li>
                                <li><a href="#">Notification 4</a></li>
                                <li><a href="#">Another notification</a></li>
                              </ul>
                        </li>
						<li>
                            <a href="#">
								<i class="ti-settings"></i>
								<p>Settings</p>
                            </a>
                        </li>
                    </ul>

                </div>
            </div>
            </nav-->