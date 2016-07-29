<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 custom-form">
				<div class="card">
					<div class="content">
						<form class="form-horizontal" method="post" action="<?=site_url()?>tlhp/addlhp/insert">

							<!-- <div class="header">
								<h4 class="title must-center">Buat LHP Baru</h4>
							</div> -->
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<div class="col-sm-10">
											<label for="inputEmail3" class="control-label t-left">NOMOR SURAT TUGAS<star>*</star></label> <input type="text" name="no_surat_tugas" class="form-control border-input" required="true" />
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-10">
											<div class="form_datetime">
												<label for="inputEmail3" class="control-label t-left">TANGGAL SURAT TUGAS<star>*</star></label>
												<div class="input-group">
													<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="tanggal_surat_tugas" class="form-control border-input date-input-big datepicker" required="true" />
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-10">
											<label for="inputEmail3" class="control-label t-left">HARI PENUGASAN<star>*</star></label>
											<div class="row">

												<div class="col-md-6">
													<div class=" l-float input-group">
														<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="hari_awal_penugasan" class="form-control border-input date-input datepicker" required="true" />
													</div>
												</div>
												<div class="col-md-6">
													<div class=" l-float input-group">
														<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="hari_akhir_penugasan" class="form-control border-input date-input datepicker" required="true" />
													</div>
												</div>

											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-10">
											<label for="inputEmail3" class="control-label t-left">SKOP PEMERIKSAAN<star>*</star></label>
											<div class="row">

												<div class="col-md-6">
													<div class="l-float input-group">
														<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="skop_awal_penugasan" class="form-control border-input date-input datepicker" required="true" />
													</div>
												</div>
												<div class="col-md-6">
													<div class="l-float input-group">
														<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="skop_akhir_penugasan" class="form-control border-input date-input datepicker" required="true" />
													</div>
												</div>

											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-12 control-label t-left">TIM<star>*</star></label>
										<div class="col-sm-5">
											<input type="text" name="tim[]" class="form-control border-input" />
										</div>
										<div class="col-sm-5">
											<select class="form-control">
												<?php if ($getAllJenisTim) {?>
												<?php  foreach($getAllJenisTim as $tim) {?>
												<option><?=$tim->jenis_tim;?></option>
												<?php } ?> 
												<?php }?>
											</select>
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-5">
											<input type="text" name="tim[]" class="form-control border-input" />
										</div>
										<div class="col-sm-5">
											<select class="form-control">
												<?php if ($getAllJenisTim) {?>
												<?php foreach($getAllJenisTim as $tim) {?>
												<option><?=$tim->jenis_tim;?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>
									<!-- Tim More -->
									<div id="tim-more"></div>
									<div class="form-group add-more-tim" style="display: none;">
										<div class="col-sm-5">
											<input type="text" name="tim[]" class="form-control border-input">
										</div>
										<div class="col-sm-5">
											<select class="form-control">
												<?php if ($getAllJenisTim) {?>
												<?php foreach($getAllJenisTim as $tim) {?>
												<option><?=$tim->jenis_tim;?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>
									<!-- End Tim More -->

									<div class="form-group">
										<div class="col-md-12 t-center">
											<br />
											<button id="add-tim" class="btn l-float btn-sm btn-fill">
												<span class="btn-label"> <i class="fa fa-plus-circle"></i></span> TAMBAH
											</button>
										</div>
									</div>
								</div>

								<div class="col-md-4">
									<div class="form-group">
										<div class="col-sm-10">
											<label for="inputEmail3" class="control-label t-left">JENIS PENGAWASAN<star>*</star></label> <select name="jenis_pengawasan_id" class="form-control">
												<?php if ($getAllJenisPengawasan) {?>
												<?php foreach($getAllJenisPengawasan as $pengawas) {?>
												<option value="<?=$pengawas->jenis_pengawasan_id;?>"><?=$pengawas->jenis_pengawasan;?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-12 control-label t-left">OBJEK PENGAWASAN<star>*</star></label>
										<div class="col-sm-10">
											<input type="text" name="objek_pengawasan" class="form-control border-input" required="true" />
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-12 control-label t-left">JUDUL LHP<star>*</star></label>
										<div class="col-sm-10">
											<input type="text" name="judul_lhp" class="form-control border-input" required="true" />
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-12 control-label t-left">NOMOR LHP<star>*</star></label>
										<div class="col-sm-10">
											<input type="text" name="nomor_lhp" class="form-control border-input" required="true" />
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-10">
											<label for="inputEmail3" class="control-label t-left">TANGGAL LHP<star>*</star></label>
											<div class="input-group">
												<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span><input type="text" name="tanggal_lhp" class="form-control border-input date-input-big datepicker" />
											</div>
										</div>
									</div>

									<div class="form-group">
										<label for="exampleInputFile" class="col-sm-12 control-label t-left">UPLOAD COVER<star>*</star></label>
										<div class="col-sm-10">
											<input type="file" id="exampleInputFile">
										</div>
									</div>
								</div>

								<!-- Perpanjangan -->
								<div class="col-md-4">
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-10 control-label t-left">ST PERPANJANGAN</label>
										<div class="col-sm-10">
											<input type="text" name="st_perpanjangan" class="form-control border-input" />
										</div>
									</div>

									<div class="form-group">
										<label for="inputEmail3" class="col-sm-10 control-label t-left">TANGGAL ST PERPANJANGAN</label>
										<div class="col-sm-10">
											<div class="input-group">
												<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="tgl_st_perpanjangan" class="form-control border-input date-input-big datepicker" />
											</div>
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-10">
											<label for="inputEmail3" class="control-label t-left">HARI PENUGASAN<star>*</star></label>
											<div class="row">

												<div class="col-md-6">
													<div class=" l-float input-group">
														<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="hari_awal_perpanjangan_penugasan" class="form-control border-input date-input datepicker" />
													</div>
												</div>
												<div class="col-md-6">
													<div class=" l-float input-group">
														<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="hari_akhir_perpanjangan_penugasan" class="form-control border-input date-input datepicker" />
													</div>
												</div>

											</div>
										</div>
									</div>
									<!-- <div class="form-group hide">
										<label for="inputEmail3" class="col-sm-4 control-label t-left">SKOP PEMERIKSAAN</label>
										<div class="col-sm-4">
											<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="hari_awal_pemeriksaan_penugasan" class="form-control border-input date-input datepicker" />
										</div>
										<div class="col-sm-4">
											<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="hari_awal_pemeriksaan_penugasan" class="form-control border-input date-input datepicker" />
										</div>
									</div> -->
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-10 control-label t-left">TIM</label>
										<div class="col-sm-5">
											<input type="text" class="form-control border-input" />
										</div>
										<div class="col-sm-5">
											<select class="form-control">
												<?php if ($getAllJenisTim ) {?>
												<?php foreach($getAllJenisTim as $tim) {?>
												<option><?=$tim->jenis_tim;?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-5">
											<input type="text" class="form-control border-input" />
										</div>
										<div class="col-sm-5">
											<select class="form-control">
												<?php if ($getAllJenisTim ) {?>
												<?php foreach($getAllJenisTim as $tim) {?>
												<option><?=$tim->jenis_tim;?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12 t-center"><br />
											<button id="add-tim-perpanjangan" class="btn btn-sm l-float btn-fill">
												<span class="btn-label"><i class="fa fa-plus-circle"></i> </span>TAMBAH
											</button>
										</div>
									</div>

								</div>
								<!-- Perpanjangan -->
								<div class="col-md-12">
									<div class="row">
										<div class="col-md-10"></div>
										<div class="col-md-2">
											<button type="submit" class="btn btn-wd btn-success btn-fill btn-rotate">
												<span class="btn-label"> <i class="ti-save"></i>
												</span>BUAT LHP BARU
											</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
