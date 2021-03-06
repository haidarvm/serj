<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 custom-form">
				<div class="card">
					<div class="content">
						<!-- start form -->
						<?php $this->load->view('tlhp/lhp/form_lhp') ?>
						<!-- end form -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
    requirejs.config({
        "shim": {
            "bootstrap": {"deps": ["jquery"]},
            "datetimepicker" : {deps: ["jquery", "moment"]},
            "notify": {deps: ["jquery"]}
        },
        "paths": {
            "jspath": site_url+ "assets/js/",
            "jquery": site_url+"assets/js/jquery-2.1.4.min",
            "knockout": site_url+ "assets/js/knockout-3.2.0",
            "datetimepicker": site_url+ "assets/js/bootstrap-datetimepicker.min",
            "moment" : site_url+ "assets/js/moment.min",
            "bootstrap": site_url+ "assets/js/bootstrap.min",
            "notify": site_url+"assets/js/notify.min",
        }
    });
    requirejs(["jspath/lhp"]);
</script>
