<!-- line fullscreen line -->
	<div class="container-fluid tagline nopadding"><hr /></div>
	
	<div class="container-fluid foot">
		<div class="row">
			<div class="col-md-10 col-md-offset-1 footer">
				<ul>
					<li><a href="#">home</a></li>
					<li><a href="#">term &amp; condition</a></li>
					<li><a href="#">privacy</a></li>
					<li><a href="#">contact</a></li>
					<li><a href="#">about</a></li>
					<li><a href="#">forum</a></li>
				</ul>
				<p>Copyright &copy; 2016. All Right Reserved.</p>
			</div>
		</div>
	</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<?php echo base_url()?>assets/js/jquery.min.js"></script>
    <script src="<?php echo base_url()?>assets/js/learn.js"></script>
	<script src="<?php echo base_url()?>assets/js/bootstrap.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/js/jquery.validate-min.js"></script>
    <script src="<?php echo base_url();?>assets/js/bootstrap-datepicker.js"></script>
	<script src="<?php echo base_url()?>assets/js/unslider-min.js"></script>
	<script src="<?php echo base_url()?>assets/js/fontsmoothie.min.js"></script>
	<script src="<?php echo base_url()?>assets/js/wow.min.js"></script>
	<script type="text/javascript">
		//EFFECT TRANSITION
		var wow = new WOW(
			{
				boxClass:     'wow',      // animated element css class (default is wow)
				animateClass: 'animated', // animation css class (default is animated)
				offset:       100,          // distance to the element when triggering the animation (default is 0)
				mobile:       true,       // trigger animations on mobile devices (default is true)
				live:         true,       // act on asynchronously loaded content (default is true)
				callback:     function(box) {
				  // the callback is fired every time an animation is started
				  // the argument that is passed in is the DOM node being animated
				}
			}
		);
		wow.init();
		
		//slider function
		$('.infinite-slider').unslider({
			animation: 'fade',
			delay: 5000,
			autoplay: true,
			arrows: true
		});
	</script>
  </body>
</html>