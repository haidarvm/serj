<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" sizes="96x96" href="<?php echo base_url();?>assets/img/favicon.png">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Login Super User</title>

<!-- Bootstrap -->
<link href="<?php echo base_url();?>assets/css/style.css" rel="stylesheet" />
<link href="<?php echo base_url();?>assets/css/bootstrap.min.css" rel="stylesheet" />


<!-- Animation library for notifications   -->
<link href="<?php echo base_url();?>assets/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="<?php echo base_url();?>assets/css/paper-dashboard.css" rel="stylesheet" />


<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="<?php echo base_url();?>assets/css/demo.css" rel="stylesheet" />

<!-- #######################################
			StyleSheet And LESS Compailer
		########################################-->
<link href="<?php echo base_url();?>assets/css/custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/less.min.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="bg-blue">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 col-md-offset-1 top-head logo">
				<a href="index.php"><img src="<?php echo base_url();?>assets/img/logo-white.png" alt="" /></a>
			</div>

			<div class="col-md-8 col-md-offset-2 desc-content">
				<p>
					DATABASE HASIL PENGAWASAN INSPEKTORAT <br /> KEMENTERIAN PENDAYAGUNAAN APARATUR NEGARA DAN REFORMASI BIROKRASI
				</p>

			</div>

			<div class="col-md-4 col-md-offset-4 box-login">
				<div class="grid-box">
					<p>
						<img src="<?php echo base_url();?>assets/img/icon_logo.png" alt="" width="86" height="111" border="0" />
					</p>

					<p class="category text-warning"><?php echo $msg?> </p>
					<form action="<?php echo site_url();?>auth/do_login" method="post">
						<div class="form-group">
							<input type="text" class="form-control" name="username" placeholder="USERNAME" value="admin">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="password" placeholder="PASSWORD" value="haidar">
						</div>

						<button type="submit" class="btn btn-default btn-blue">LOGIN</button>
						<input type="hidden" name="accountType" value="<?=$accountType?>" />
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid footer-black nopadding">
		<p>&copy;2016, DATABASE HASIL PENGAWASAN INSPEKTORAT KEMENTERIAN PENDAYAGUNAAN APARATUR NEGARA DAN REFORMASI BIROKRASI .</p>
	</div>

	<!--   Core JS Files   -->
	<script src="<?php echo base_url();?>assets/js/jquery-2.1.4.min.js" type="text/javascript"></script>
	<script src="<?php echo base_url();?>assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="<?php echo base_url();?>assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin
	<script src="<?php echo base_url();?>assets/js/Chart.js"></script>
	<script src="<?php echo base_url();?>assets/js/graphic.js"></script> -->

	<!--  Notifications Plugin    -->
	<script src="<?php echo base_url();?>assets/js/bootstrap-notify.js"></script>

	<!--  Google Maps Plugin    
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>-->

	<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="<?php echo base_url();?>assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="<?php echo base_url();?>assets/js/demo.js"></script>
</body>
</html>
