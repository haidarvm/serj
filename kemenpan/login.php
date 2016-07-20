<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Login Super User</title>

    <!-- Bootstrap -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />


    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
	

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />

	<!-- #######################################
			StyleSheet And LESS Compailer
		########################################-->
	<link href="assets/css/custom.css" rel="stylesheet" />
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
				<a href="#"><img src="assets/img/logo.png" alt=""/></a>
			</div>
			
			<div class="col-md-8 col-md-offset-2 desc-content">
				<p>DATABASE HASIL PENGAWASAN INSPEKTORAT <br /> KEMENTERIAN PENDAYAGUNAAN APARATUR NEGARA DAN REFORMASI BIROKRASI</p>
			</div>
			
			<div class="col-md-4 col-md-offset-4 box-login">
				<div class="grid-box">
					<p><img src="assets/img/icon_logo.png" alt="" width="86" height="111" border="0" /></p>
					
					<form action="post.php" method="post">
					  <div class="form-group">
						<input type="text" class="form-control" name="username" placeholder="USERNAME" value="admin">
					  </div>
					  <div class="form-group">
						<input type="password" class="form-control" name="password" placeholder="PASSWORD" value="admin">
					  </div>
					  
					  <button type="submit" class="btn btn-default btn-blue">LOGIN</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container-fluid footer-black nopadding">
		<p>&copy;2016, DATABASE HASIL PENGAWASAN INSPEKTORAT
                    KEMENTERIAN PENDAYAGUNAAN APARATUR NEGARA DAN REFORMASI BIROKRASI	.</p>
	</div>

   <!--   Core JS Files   -->
    <script src="assets/js/jquery-2.1.4.min.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin
	<script src="assets/js/Chart.js"></script>
	<script src="assets/js/graphic.js"></script> -->

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>-->

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>
  </body>
</html>