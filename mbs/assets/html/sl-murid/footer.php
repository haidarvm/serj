</div>
<div class="container-fluid">
	<div class="row">
		<div class="footer">
			<p>Copyright &copy; 2016. All Right Reserved.</p>
			<p>
				Smart Learning Dashboard <img src="img/logo.png" alt="" border="0" />
			</p>
		</div>
	</div>
</div>

<!-- jQuery (necessary for JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/sidebar_menu.js"></script>
<script src="js/pace.min.js"></script>
<script src="js/jquery.knob.js"></script>
<script src="js/jquery.flot.js"></script>
<script src="js/jquery.flot.categories.js"></script>
<script src="js/jquery.flot.pie.js"></script>
<script src="js/learn.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>

<!-- DataTables
	<script src="js/dataTables.bootstrap.min.js"></script>
	<script src="js/jquery.dataTables.min.js"></script> -->


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
		
		// custom scrolling with style
		$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})
		
		
	</script>
<!--  <script type="text/javascript">
	  $(function () {
	    $("#example1").DataTable();
	    $('#example2').DataTable({
	      "paging": true,
	      "lengthChange": false,
	      "searching": false,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false
	    });
	  });
	</script>-->

</body>
</html>

