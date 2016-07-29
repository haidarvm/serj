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
						<h3 class="under-text">UNDER CONSTRUCTION</h3>
						<p class="h6">
							This page is coming soon <a href="<?php echo site_url();?>tlhp/">back to home</a> Exception
						</p>
						<small class="text-muted"></small>
						<p>Type: <?php echo get_class($exception); ?></p>
						<p>Message: <?php echo $message; ?></p>
						<p>Filename: <?php echo $exception->getFile(); ?></p>
						<p>Line Number: <?php echo $exception->getLine(); ?></p>

						<?php if (defined('SHOW_DEBUG_BACKTRACE') && SHOW_DEBUG_BACKTRACE === TRUE): ?>
						
							<p>Backtrace:</p>
							<?php foreach ($exception->getTrace() as $error): ?>
						
								<?php if (isset($error['file']) && strpos($error['file'], realpath(BASEPATH)) !== 0): ?>
						
									<p style="margin-left: 10px">
									File: <?php echo $error['file']; ?><br />
									Line: <?php echo $error['line']; ?><br />
									Function: <?php echo $error['function']; ?>
									</p>
								<?php endif ?>
						
							<?php endforeach ?>
						
						<?php endif ?>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php $ci->load->view('tlhp/template/tlhp_footer');?>
