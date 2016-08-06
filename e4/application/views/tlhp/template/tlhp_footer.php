<footer class="footer">
	<div class="container-fluid">
		<div class="copyright pull-right col-md-12">
			<!--&copy; <script>document.write(new Date().getFullYear())</script>,-->
			<div class="col-md-11 nopadding">
				<p class="footer-text">DATABASE HASIL PENGAWASAN INSPEKTORAT KEMENTERIAN PENDAYAGUNAAN APARATUR NEGARA DAN REFORMASI BIROKRASI</p>
				<p class="copy-right">&copy; Copyright 2016 CAFS.TECHNOLOGY</p>
			</div>
			<div class="col-md-1">
				<div class="footer-logo">
					<img src="<?php echo base_url();?>assets/img/<?php echo delNonChar(get_current_app())?>-logo.png" class="right-img-footer" />
				</div>
			</div>
		</div>
	</div>
</footer>

</div>
<!-- main panel -->
</div>
<!-- wrapper -->

<script type="text/javascript">
	 requirejs.config({
        "shim": {
            "bootstrap": {"deps": ["jquery"]}
        },
        "paths": {
            "jspath": site_url+"assets/js/",
            "jquery": site_url+"assets/js/jquery-2.1.4.min",
            "knockout": site_url+"assets/js/knockout-3.2.0",
            "bootstrap": site_url+"assets/js/bootstrap.min",
            "sidebar-collapse": site_url+"assets/js/sidebar-collapse" 
        }
    });
//    requirejs(["jspath/sidebar-collapses"]);
</script>

</body>
</html>