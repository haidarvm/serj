			<footer class="footer">
				<div class="container-fluid">
					<!-- <nav class="pull-left">
                    <ul>
                        <li>
                            <a href="http://www.creative-tim.com">
                                KEMENPAN
                            </a>
                        </li>
                        <li>
                            <a href="http://blog.creative-tim.com">
                               Blog
                            </a>
                        </li>
                        <li>
                            <a href="http://www.creative-tim.com/license">
                                Licenses
                            </a>
                        </li>
                    </ul>
                </nav> -->
					<div class="copyright pull-right col-md-12">
						<!--&copy; <script>document.write(new Date().getFullYear())</script>,-->
						<div class="col-md-11 nopadding">
							<p class="footer-text">DATABASE HASIL PENGAWASAN INSPEKTORAT KEMENTERIAN PENDAYAGUNAAN APARATUR NEGARA DAN REFORMASI BIROKRASI</p>
							<p class="copy-right">&copy; Copy Right 2016 E-FOUR KEMENPAN RB</p>
						</div>
						<div class="col-md-1">
							<div class="footer-logo">
								<img src="<?php echo base_url();?>assets/img/img-1.png" class="right-img-footer"/>
							</div>
						</div>
					</div>
				</div>
			</footer>

		</div><!-- main panel -->
	</div><!-- wrapper -->


</body>

<!--   Core JS Files   -->
<script src="<?php echo base_url();?>assets/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="<?php echo base_url();?>assets/js/jquery-ui.min.js" type="text/javascript"></script>

<script src="<?php echo base_url();?>assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<?php echo base_url();?>assets/js/jquery.validate.min.js"></script>
<script src="<?php echo base_url();?>assets/js/jquery.dataTables.min.js"></script>

<script src="<?php echo base_url();?>assets/js/moment.min.js"></script>
<script src="<?php echo base_url();?>assets/js/bootstrap-datetimepicker.min.js"></script>
<script src="<?php echo base_url();?>assets/js/bootstrap-select.min.js"></script>


<!--  Checkbox, Radio & Switch Plugins -->
<script src="<?php echo base_url();?>assets/js/bootstrap-checkbox-radio.js"></script>

<?php if(basename($_SERVER['REQUEST_URI'], '?' . $_SERVER['QUERY_STRING'])  == 'menusa.php'){?>
<!--  Charts Plugin -->
<script src="<?php echo base_url();?>assets/js/Chart.js"></script>
<script src="<?php echo base_url();?>assets/js/graphic.js"></script>
<?php }?>
<!--  Notifications Plugin    -->
<script src="<?php echo base_url();?>assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>-->

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="<?php echo base_url();?>assets/js/paper-dashboard.js"></script>
<!--   TLHP JS Files   -->
<script src="<?php echo base_url();?>assets/js/tlhp.js" type="text/javascript"></script>
<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="<?php echo base_url();?>assets/js/demo.js"></script>
<script type="text/javascript">
$().ready(function(){
	$(function () {
	    $('#datetimepicker1').datetimepicker();
	});
});
        $().ready(function(){
            // Init DatetimePicker
            demo.initFormExtendedDatetimepickers();
        });
		
    </script> 
</html>