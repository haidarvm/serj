<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Smart Learning</title>
	
	<!-- jQuery UI -->
    <script src="/js/jquery.knob-mini.js"></script>
    <script type="text/javascript" >
        $(document).ready(function()
        {
        $("#notificationLink").click(function()
        {
        $("#notificationContainer").fadeToggle(300);
        $("#notification_count").fadeOut("slow");
        return false;
        });

        //Document Click
        $(document).click(function()
        {
        $("#notificationContainer").hide();
        });
        //Popup Click
        $("#notificationContainer").click(function()
        {
        return false
        });

        });
    </script>

	<!-- stylesheet  -->
    <link href="css/custom.css" rel="stylesheet">
	<link href="css/bootstrap.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" href="css/styles.css" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="css/animate.css" />
	<link href="css/font-awesome.min.css" type="text/css" rel="stylesheet" />
	<link href="css/simple-sidebar.css" type="text/css" rel="stylesheet" />
	<link href="css/pace.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="css/jquery.mCustomScrollbar.css" />

	<link href="css/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
	
	<!-- LESS and JS -->
	<link rel="stylesheet/less" href="css/styles.less" />
	<script type="text/javascript" src="js/less.min.js"></script>
  </head>
  
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="col-md-12">
			<div class="navbar-header">
				<button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			  
				<!-- Logo -->
				<a href="#" class="navbar-brand"><img src="img/logo.png" alt="" width="125" height="30" border="0" /></a>
			</div>
			
			<div class="navbar-collapse collapse" id="navbar">
				<ul class="nav navbar-nav">
					<li>
						<div class="pict">
							<img src="img/img-author.jpg" alt="" width="30" height="30" border="0" />
						</div>
					</li>
					<li>
						<a aria-expanded="false" aria-haspopup="true" role="button" data-toggle="dropdown" class="dropdown-toggle" href="#">Veranda<i class="fa fa-angle-double-down"></i></a>
						<ul class="dropdown-menu">
							<li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
							<li><a href="#"><i class="fa fa-gear"></i> Pengaturan</a></li>
							<li><a href="#"><i class="fa fa-inbox"></i> Laporan</a></li>
							
							<li class="divider" role="separator"></li>
							<li><a href="#"><i class="fa fa-sign-out"></i> Log out</a></li>
						</ul>
					</li>
				</ul>
				
				<ul class="nav navbar-nav">
					<li>
						<a href="create-tests.php">
							<i class="fa fa-plus"></i>
							Buat Tugas
						</a>
					</li>
		
                    <li id="notification_li">
                        <span id="notification_count">3</span>
                        <a href="#" id="notificationLink"><i class="fa fa-bell-o"></i>Notifications</a>
                        <div id="notificationContainer">
                        <div id="notificationTitle"><i class="fa fa-bell-o"></i>Notifications</div>
                        <div id="notificationsBody" class="notifications">
                            
                            
                            
                        </div>
                        <div id="notificationFooter"><a href="#">See All</a></div>
                        </div>
                    </li>
						<!--a href="#">
							<i class="fa fa-bell-o"></i>
							Notification
						</a->
						
						<!-- <ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
						</ul> -->
				</ul>
			</div>
      </div>
    </nav>
	
	<!-- <div class="navbar-static-top">
		<div class="col-md-12 heading">
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active wow zoomIn" data-placement="right" data-toggle="tooltip" title="Minimalis Sidebar">
						<button class="navbar-toggle collapse in" data-toggle="collapse" id="menu-toggle-2"> 
							<span class="glyphicon glyphicon-th-large" aria-hidden="true"></span>
						</button>
					</li>
					
					<li>
						<div class="search">
							<form class="form-inline">
							  <div class="form-group">
								<label for="search" class="sr-only">Password</label>
								<input type="text" class="form-control" id="search" placeholder="Cari...">
								<button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
							  </div>
							</form>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div> -->
	
	
	<div id="wrapper">
		<!-- Sidebar -->
		<div id="sidebar-wrapper" class="sidebar">
			<div class="compact">
				<div class="wow fadeIn">
					<button class="navbar-toggle collapse in" data-toggle="collapse" id="menu-toggle-2"> 
						<span class="glyphicon glyphicon-th-large" aria-hidden="true"></span>
					</button>
				</div>
				
				<!-- <li>
					<div class="search">
						<form class="form-inline">
						  <div class="form-group">
							<label for="search" class="sr-only">Password</label>
							<input type="text" class="form-control" id="search" placeholder="Cari...">
							<button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
						  </div>
						</form>
					</div>
				</li> -->
			</div>
		
			<ul class="sidebar-nav nav-pills nav-stacked" id="menu">

				<li>
					<a href="index.php"><span class="fa-stack fa-lg pull-left"><i class="fa fa-desktop"></i></span> Dashboard</a>
						<!-- <ul class="nav-pills nav-stacked" style="list-style-type:none;">
							<li><a href="#">link1</a></li>
							<li><a href="#">link2</a></li>
						</ul> -->
				</li>
				<li>
					<a href="materi.php"><span class="fa-stack fa-lg pull-left"><i class="fa fa-book"></i></span> Materi</a>
					<!-- <ul class="nav-pills nav-stacked" style="list-style-type:none;">
						<li><a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-flag fa-stack-1x "></i></span>link1</a></li>
						<li><a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-flag fa-stack-1x "></i></span>link2</a></li>

					</ul> -->
				</li>
				<li>
					<a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-comments"></i></span>Diskusi</a>
				</li>
				<li class="current">
					<a href="tugas.php"> <span class="fa-stack fa-lg pull-left"><i class="fa fa-pencil"></i></span>Tugas</a>
				</li>
				<li>
					<a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-calendar"></i></span>Jadwal</a>
				</li>
				<li>
					<a href="tugas_detail.php"><span class="fa-stack fa-lg pull-left"><i class="fa fa-file-text-o"></i></span>Laporan</a>
				</li>
				<li>
					<a href="data_siswa.php"><span class="fa-stack fa-lg pull-left"><i class="fa fa-user"></i></span>Data Siswa</a>
				</li>
			</ul>
		</div><!-- /#sidebar-wrapper -->