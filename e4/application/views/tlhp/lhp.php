<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 custom-form">
				<div class="card">
					<div class="content">
						<!-- start form -->
						<?php $this->load->view('tlhp/form_lhp') ?>
						<!-- end form -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
//	console.debug(site_url);
    requirejs.config({
        "shim": {
            "bootstrap": {"deps": ["jquery"]},
            "datetimepicker" : {deps: ["jquery", "moment"]},
            "papertlhp" : {"deps": ["jquery","bootstrap"]},
        },
        "paths": {
            "jspath": site_url+ "assets/js/",
            "jquery": site_url+"assets/js/jquery-2.1.4.min",
            "knockout": site_url+ "assets/js/knockout-3.2.0",
            "datetimepicker": site_url+ "assets/js/bootstrap-datetimepicker.min",
            "moment" : site_url+ "assets/js/moment.min",
            "bootstrap": site_url+ "assets/js/bootstrap.min",
            "papertlhp": site_url + "assets/js/paper-dashboard"
        }
    });
    requirejs(["jspath/lhp"]);
</script>
