<?php
$ci = & get_instance();
$ci->load->view('tlhp/template/tlhp_header');
defined('BASEPATH') or exit('No direct script access allowed');
?>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="col-xs-6 col-md-4 col-md-offset-5"></div>
				<div class="col-md-12 under-con nopadding">
					<div class="logo-under">
						<img src="<?php echo base_url();?>assets/img/traffic-cone.png">
						<h3 class="under-text">UNDER CONSTRUCTION </h3>
						<p class="h6">
							This page is coming soon <a href="<?php echo site_url();?>tlhp/">back to home </a> General
						</p>
						<small class="text-muted"><?php echo textSmall($message); ?></small>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php $ci->load->view('tlhp/template/tlhp_footer');?>