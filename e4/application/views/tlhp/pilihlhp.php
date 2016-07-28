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
								<form class="form-horizontal" action="<?=site_url()?>tlhp/pilihlhp/updatelhp" method="POST">
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-3 control-label t-left nopadding min-top-margin">TAHUN</label>
										<div class="col-sm-9">
											<select class="form-control" name="tanngal_lhp">
												<option>2016</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-3 control-label t-left nopadding min-top-margin">JUDUL LHP</label>
										<div class="col-sm-9">
											<select class="form-control" name="lhp_id">
													<?php if ($getAllLHP) {?>
														<?php foreach($getAllLHP as $lhp) {?>
														<option value="<?=$lhp->lhp_id;?>"><?=$lhp->judul_lhp;?></option>
														<?php } ?>
													<?php } ?>
											</select>
										</div>
									</div>
									<div class="col-md-12 top-space must-center">
										<button type="submit" class="btn btn-info btn-fill btn-wd bottom-space">UPDATE LHP</button>
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
