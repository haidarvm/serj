<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="<?php echo base_url();?>assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="<?php echo base_url();?>assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title><?php echo (isset($title)) ? $title : 'Dashboard | Kementrian Pendayagunaan Aparatur Negara.'; ?></title>

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />


<!-- Bootstrap core CSS     -->
<link href="<?php echo base_url();?>assets/css/style_dashboard.css" rel="stylesheet" />
<link href="<?php echo base_url();?>assets/css/bootstrap.min.css" rel="stylesheet" />


<!-- Animation library for notifications   -->
<link href="<?php echo base_url();?>assets/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="<?php echo base_url();?>assets/css/paper-dashboard.css" rel="stylesheet" />


<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="<?php echo base_url();?>assets/css/demo.css" rel="stylesheet" />
<link href="<?=base_url();?>assets/css/custom.css" rel="stylesheet" />


<!--  Fonts and icons     -->
<link href="<?php echo base_url();?>assets/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
<link href="<?php echo base_url();?>assets/css/themify-icons.css" rel="stylesheet">

<!-- #######################################
			StyleSheet And LESS Compailer
		########################################-->
<link href="<?php echo base_url();?>assets/css/custom.css" rel="stylesheet" />
</head>
<body>

	<div class="wrapper">
		<div class="sidebar" data-background-color="black" data-active-color="info">

			<!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

			<div class="sidebar-wrapper">
				<div class="logo t-center">
					<a href="#"><img src="<?php echo base_url();?>assets/img/logo-white.png"></a>
				</div>
				<div class="clr"></div>
				<ul class="nav">
					<li <?php echo basename($_SERVER['REQUEST_URI'], '?' . $_SERVER['QUERY_STRING'])  == 'dashboard.php' ? 'class="active"' : '' ?>><a href="<?php echo site_url();?>dashboard/"> <i class="ti-dashboard"></i>
							<p title="e-monitoring">E-Monitoring</p>
					</a></li>
					<li <?php echo basename($_SERVER['REQUEST_URI'], '?' . $_SERVER['QUERY_STRING'])  == 'pengumuman.php' ? 'class="active"' : '' ?>><a href="<?php echo site_url();?>dashboard/pengumuman"> <i class="ti-announcement"></i>
							<p title="Managment User">Buat Pengumuman</p>
					</a></li>
					<li <?php echo basename($_SERVER['REQUEST_URI'], '?' . $_SERVER['QUERY_STRING'])  == 'form.php' ? 'class="active"' : '' ?>><a href="#"> <i class="ti-pencil-alt"></i>
							<p title="Buat LHP Baru">Ganti Password</p>
					</a></li>
					<li <?php echo basename($_SERVER['REQUEST_URI'], '?' . $_SERVER['QUERY_STRING'])  == 'loghistory.php' ? 'class="active"' : '' ?>><a href="#"> <i class="ti-archive"></i>
							<p title="Log History">Log History</p>
					</a></li>
					<li><a href="<?=site_url()?>auth/logout"> <i class="ti-power-off"></i>
							<p title="Logout">Logout</p>
					</a></li>
				</ul>
			</div>
		</div>

		<div class="main-panel">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-minimize">
						</i> <a class="navbar-brand navbar-minimize" href="#" id="minimizeSidebar"> <i class="ti-menu"></i>
						</a>
					</div>
					<div class="navbar-header">
						<button type="button" class="navbar-toggle">
							<span class="sr-only">Toggle navigation</span> <span class="icon-bar bar1"></span> <span class="icon-bar bar2"></span> <span class="icon-bar bar3"></span>
						</button>
						<h3><?php echo (isset($title)) ? $title : 'Dashboard | Kementrian Pendayagunaan Aparatur Negara.'; ?></h3>
					</div>

					<div class="collapse navbar-collapse .col-md-3">
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img src="<?php echo base_url();?>assets/img/faces/face-2.jpg" alt="..." class="img-circle profile-pic">
									<p>Welcome, Guest User</p> <b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<li><a href="#">Edit profile</a></li>
									<li><a href="#">Setting</a></li>
									<li><a href="<?=site_url()?>auth/logout">Log out</a></li>
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