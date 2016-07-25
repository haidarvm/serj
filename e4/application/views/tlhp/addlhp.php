
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 custom-form">
				<div class="card">
					<div class="content">
						<form class="form-horizontal" method="post" action="<?php echo base_url()?>tlhp/addlhp/insert">

							<!-- <div class="header">
								<h4 class="title must-center">Buat LHP Baru</h4>
							</div> -->
							
							<div class="row">
								<div class="col-md-4 box-margin-ur">
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-4 control-label t-left">NOMOR SURAT TUGAS</label>
										<div class="col-sm-8">
											<input type="text" name="no_surat_tugas" class="form-control border-input" />
										</div>
									</div>

									<div class="form-group">
										<label for="inputEmail3" class="col-sm-4 control-label t-left">TANGGAL SURAT TUGAS</label>
										<div class="col-sm-8 form_datetime">
											<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="tanggal_surat_tugas" class="form-control border-input date-input-big datepicker" />
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-4 control-label t-left">HARI PENUGASAN</label>
										<div class="col-sm-4">
											<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="hari_awal_penugasan" class="form-control border-input date-input datepicker" />
										</div>
										<div class="col-sm-4">
											<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="hari_akhir_penugasan" class="form-control border-input date-input datepicker" />
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-4 control-label t-left">SKOP PEMERIKSAAN</label>
										<div class="col-sm-4">
											<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="skop_awal_penugasan" class="form-control border-input date-input datepicker" />
										</div>
										<div class="col-sm-4">
											<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="skop_akhir_penugasan" class="form-control border-input date-input datepicker" />
										</div>
									</div>


									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label t-left">TIM</label>
										<div class="col-sm-5">
											<input type="text" name="tim[]" class="form-control border-input" />
										</div>
										<div class="col-sm-5">
											<select class="form-control">
												<?php if ($getAllJenisTim) {?>
												<?php  foreach($getAllJenisTim as $tim) {?>
												<option><?php echo $tim->jenis_tim;?></option>
												<?php } ?> 
												<?php }?>
											</select>
										</div>
									</div>

									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label t-left">&nbsp;</label>
										<div class="col-sm-5">
											<input type="text" name="tim[]" class="form-control border-input" />
										</div>
										<div class="col-sm-5">
											<select class="form-control">
												<?php if ($getAllJenisTim) {?>
												<?php foreach($getAllJenisTim as $tim) {?>
												<option><?php echo $tim->jenis_tim;?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>
									<!-- Tim More -->
									<div id="tim-more"></div>
									<div class="form-group add-more-tim" style="display: none;">
										<label for="inputName" class="col-sm-2 control-label">&nbsp;</label>
										<div class="col-sm-5">
											<input type="text" name="tim[]" class="form-control border-input">
										</div>
										<div class="col-sm-5">
											<select class="form-control">
												<?php if ($getAllJenisTim) {?>
												<?php foreach($getAllJenisTim as $tim) {?>
												<option><?php echo $tim->jenis_tim;?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>
									<!-- End Tim More -->

									<div class="form-group">
										<div class="col-md-12 t-center">
											<br />
											<button id="add-tim" class="btn btn-sm btn-fill">
												<span class="btn-label"> <i class="ti-plus"></i>
												</span>&nbsp; TAMBAH &nbsp;
											</button>
										</div>
									</div>
								</div>

								<div class="col-md-4 box-margin-ur bg-grey">
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-4 control-label t-left">JENIS PENGAWASAN</label>
										<div class="col-sm-8">
											<select name="jenis_pengawasan_id" class="form-control">
												<?php if ($getAllJenisPengawasan) {?>
												<?php foreach($getAllJenisPengawasan as $pengawas) {?>
												<option value="<?=$pengawas->jenis_pengawasan_id;?>"><?php echo $pengawas->jenis_pengawasan;?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>

									<div class="form-group">
										<label for="inputEmail3" class="col-sm-4 control-label t-left">OBJEK PENGAWASAN</label>
										<div class="col-sm-8">
											<input type="text" name="objek_pengawasan" class="form-control border-input" />
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-4 control-label t-left">JUDUL LHP</label>
										<div class="col-sm-8">
											<input type="text" name="judul_lhp" class="form-control border-input" />
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-4 control-label t-left">NOMOR LHP</label>
										<div class="col-sm-8">
											<input type="text" name="nomor_lhp" class="form-control border-input" />
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-4 control-label t-left">TANGGAL LHP</label>
										<div class="col-sm-8">
											<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="tgl_st_perpanjangan" class="form-control border-input date-input-big datepicker" />
										</div>
									</div>

									<div class="form-group">
										<label for="exampleInputFile" class="col-sm-4 control-label t-left">UPLOAD</label> 
										<div class="col-sm-8">
											<input type="file" id="exampleInputFile">
										</div>
									</div>
									
									<div class="top-space"><br /></div>
									
									<div class="form-group">
										<div class="col-md-12 t-center">
											<button type="submit" class="btn btn-wd btn-success btn-fill btn-rotate">
												<span class="btn-label"> <i class="ti-save"></i>
												</span> SAVE
											</button>
										</div>
									</div>
								</div>

								<div class="col-md-4 box-margin-ur">
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-4 control-label t-left">ST PERPANJANGAN</label>
										<div class="col-sm-8">
											<input type="text" name="st_perpanjangan" class="form-control border-input" />
										</div>
									</div>

									<div class="form-group">
										<label for="inputEmail3" class="col-sm-4 control-label t-left">TGL ST PERPANJANGAN</label>
										<div class="col-sm-8">
											<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="tgl_st_perpanjangan" class="form-control border-input date-input-big datepicker" />
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-4 control-label t-left">HARI PENUGASAN</label>
										<div class="col-sm-4">
											<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="hari_awal_perpanjangan_penugasan" class="form-control border-input date-input datepicker" />
										</div>
										<div class="col-sm-4">
											<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="hari_akhir_perpanjangan_penugasan" class="form-control border-input date-input datepicker" />
										</div>
									</div>
									<div class="form-group hide">
										<label for="inputEmail3" class="col-sm-4 control-label t-left">SKOP PEMERIKSAAN</label>
										<div class="col-sm-4">
											<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="hari_awal_pemeriksaan_penugasan" class="form-control border-input date-input datepicker" />
										</div>
										<div class="col-sm-4">
											<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="hari_awal_pemeriksaan_penugasan" class="form-control border-input date-input datepicker" />
										</div>
									</div>


									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label t-left">TIM</label>
										<div class="col-sm-5">
											<input type="text" class="form-control border-input" />
										</div>
										<div class="col-sm-5">
											<select class="form-control">
												<?php if ($getAllJenisTim ) {?>
												<?php foreach($getAllJenisTim as $tim) {?>
												<option><?php echo $tim->jenis_tim;?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>

									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label t-left">&nbsp;</label>
										<div class="col-sm-5">
											<input type="text" class="form-control border-input" />
										</div>
										<div class="col-sm-5">
											<select class="form-control">
												<?php if ($getAllJenisTim ) {?>
												<?php foreach($getAllJenisTim as $tim) {?>
												<option><?php echo $tim->jenis_tim;?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>

									<div class="form-group">
										<div class="col-md-12 t-center">
											<br />
											<button id="add-tim-perpanjangan" class="btn btn-sm btn-fill">
												<span class="btn-label"> <i class="ti-plus"></i>
												</span>&nbsp; TAMBAH &nbsp;
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
