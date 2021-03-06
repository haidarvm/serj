<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12 col-md-7">
				<div class="card">
					<div class="content">
						<div class="header">
							<h3 class="title must-center">PILIH LHP</h3>
						</div>
						<div class="row">
							<div class="col-md-7 col-md-offset-2 top-space">
								<form class="form-horizontal" action="<?php echo $form_action ?>" method="get" id="formLhp"> 
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-3 control-label t-left nopadding min-top-margin">TAHUN</label>
										<div class="col-sm-9">
											<select class="form-control" name="tanngal_lhp" data-bind="value: choosenYear, event: {change: getLhp}">
												<option>-- Choose --</option>
												<option value="2013">2013</option>
												<option value="2014">2014</option>
												<option value="2015">2015</option>
												<option value="2016">2016</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-3 control-label t-left nopadding min-top-margin">JUDUL LHP</label>
										<div class="col-sm-9">
											<select  class="form-control" 
												data-bind="enable: tlhpListEnable, options: tlhpList, optionsCaption: 'Choose', optionsText: 'lhp_title', value: choosenTlhpTitle">
											</select>
											<input type="hidden" id="lhp_id" name="lhp_id">
										</div>
									</div>
									<div class="col-md-12 top-space must-center">
										<button class="btn btn-info btn-fill btn-wd bottom-space" data-bind="event: {click: doEdit}" id="btnSearch">
											<i aria-hidden="true" class="fa fa-pencil-square-o"></i> <?php echo $btn_label ?>
										</button>
									</div>
								</form>
							</div>
						</div>
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
    		"notify": {"deps": ["jquery"]},
    	},
        "paths": {
            "jspath": site_url+ "assets/js/",
            "knockout": site_url+ "assets/js/knockout-3.2.0",
            "jquery": site_url+ "assets/js/jquery-2.1.4.min",
            "bootstrap": site_url+ "assets/js/bootstrap.min",
            "notify": site_url+"assets/js/notify.min",
        }
    });
    requirejs(["jspath/pilihlhp"]);
    
</script>