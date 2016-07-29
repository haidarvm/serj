
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
							This page is coming soon <a href="<?php echo site_url();?>tlhp/">back to home</a> PHP
						</p>
						<small class="text-muted">error_php</small>
						<small class="text-muted"><?php echo $severity; ?></small> 
						<small class="text-muted"><?php echo $message; ?></small> 
						<small class="text-muted"><?php echo $filepath; ?></small> 
						<small class="text-muted"><?php echo $line; ?></small>
								<?php if (defined('SHOW_DEBUG_BACKTRACE') && SHOW_DEBUG_BACKTRACE === TRUE): ?>
									<small class="text-muted">Backtrace:</small>
									<?php foreach (debug_backtrace() as $error): ?>
								
										<?php if (isset($error['file']) && strpos($error['file'], realpath(BASEPATH)) !== 0): ?>
								
											<small class="text-muted"style="margin-left: 10px">
											File: <?php echo $error['file'] ?><br />
											Line: <?php echo $error['line'] ?><br />
											Function: <?php echo $error['function']?>
											</small>
								
										<?php endif ?>
								
									<?php endforeach ?>
								
								<?php endif ?>
						
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


