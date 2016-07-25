	<div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 custom-form">
                        <div class="card">
							<div class="content">	
							<form class="form-horizontal" method="post" action="<?php echo base_url()?>tlhp/addlhp/insert">
							
								<!-- <div class="header">
									<h3 class="title must-center">PEMANTAUAN TINDAK LANJUT REKOMENDASI HASIL PEMERIKSAAN</h3>
								</div> -->
								
							   <div class="row">
									<div class="col-md-4 box-margin-ur">
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-4 control-label t-left">NOMOR SURAT TUGAS</label>
											<div class="col-sm-8">
												<input type="text" name="no_surat_tugas" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-4 control-label t-left">TANGGAL SURAT TUGAS</label>
											<div class="col-sm-8">
												<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span>
												<input type="text" name="tanggal_surat_tugas" class="form-control border-input date-input datepicker" placeholder="" value="" />
											</div>
										</div>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-4 control-label t-left">HARI PENUGASAN</label>
											<div class="col-sm-4">
												<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span>
												<input type="text" name="hari_awal_penugasan" class="form-control border-input date-input datepicker" placeholder="" value="" />
											</div>
											<div class="col-sm-4">
												<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span>
												<input type="text" name="hari_akhir_penugasan" class="form-control border-input date-input datepicker" placeholder="" value="" />
											</div>
										</div>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-4 control-label t-left">SKOP PEMERIKSAAN</label>
											<div class="col-sm-4">
												<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span>
												<input type="text" name="skop_awal_penugasan" class="form-control border-input date-input datepicker" placeholder="" value="" />
											</div>
											<div class="col-sm-4">
												<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span>
												<input type="text" name="skop_akhir_penugasan" class="form-control border-input date-input datepicker" placeholder="" value="" />
											</div>
										</div>
										
										
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label t-left">TIM</label>
											<div class="col-sm-5">
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
											<div class="col-sm-5">
												<select class="form-control">
												  <option>1</option>
												  <option>2</option>
												  <option>3</option>
												  <option>4</option>
												  <option>5</option>
												</select>
											</div>
										</div>
										
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label t-left">&nbsp;</label>
											<div class="col-sm-5">
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
											<div class="col-sm-5">
												<select class="form-control">
												  <option>1</option>
												  <option>2</option>
												  <option>3</option>
												  <option>4</option>
												  <option>5</option>
												</select>
											</div>
										</div>
										
										<div class="form-group">
											<div class="col-md-12 t-center"><br />
												<button type="submit" class="btn btn-info btn-fill btn-wd bottom-space">TAMBAH</button>
											</div>
										</div>
									</div>
									
									<div class="col-md-4 box-margin-ur">
										<div class="form-group">
											<label for="inputEmail3" name="jenis_pengawasan_id" class="col-sm-4 control-label t-left">JENIS PENGAWASAN</label>
											
											<div class="col-sm-8">
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-4 control-label t-left">OBJEK PENGAWASAN</label>
											<div class="col-sm-8">
												<input type="text" name="objek_pengawasan" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-4 control-label t-left">JUDUL LHP</label>
											<div class="col-sm-8">
												<input type="text" name="judul_lhp" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-4 control-label t-left">NOMOR LHP</label>
											<div class="col-sm-8">
												<input type="text" name="nomor_lhp" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										
										<div class="form-group">
											<label for="exampleInputFile" class="col-sm-4 control-label t-left">UPLOAD</label>
										    <input type="file" id="exampleInputFile">
										</div>
										
										<div class="form-group">
											<div class="col-md-12 t-center">
												<button type="submit" class="btn btn-info btn-fill btn-wd bottom-space">BUAT LHP BARU</button>
											</div>
										</div>
									</div>
									
									<div class="col-md-4 bg-grey box-margin-ur">
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-4 control-label t-left">ST PERPANJANGAN</label>
											<div class="col-sm-8">
												<input type="text" name="st_perpanjangan" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-4 control-label t-left">TGL ST PERPANJANGAN</label>
											<div class="col-sm-8">
												<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span>
												<input type="text" name="tgl_st_perpanjangan" class="form-control border-input date-input datepicker" placeholder="" value="" />
											</div>
										</div>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-4 control-label t-left">HARI PENUGASAN</label>
											<div class="col-sm-4">
												<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span>
												<input type="text" name="hari_awal_perpanjangan_penugasan" class="form-control border-input date-input datepicker" placeholder="" value="" />
											</div>
											<div class="col-sm-4">
												<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span>
												<input type="text" name="hari_akhir_perpanjangan_penugasan" class="form-control border-input date-input datepicker" placeholder="" value="" />
											</div>
										</div>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-4 control-label t-left">SKOP PEMERIKSAAN</label>
											<div class="col-sm-4">
												<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span>
												<input type="text" name="hari_awal_pemeriksaan_penugasan" class="form-control border-input date-input datepicker" placeholder="" value="" />
											</div>
											<div class="col-sm-4">
												<span class="icn"><i aria-hidden="true" class="fa fa-calendar"></i></span>
												<input type="text" name="hari_awal_pemeriksaan_penugasan" class="form-control border-input date-input datepicker" placeholder="" value="" />
											</div>
										</div>
										
										
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label t-left">TIM</label>
											<div class="col-sm-5">
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
											<div class="col-sm-5">
												<select class="form-control">
												  <option>1</option>
												  <option>2</option>
												  <option>3</option>
												  <option>4</option>
												  <option>5</option>
												</select>
											</div>
										</div>
										
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label t-left">&nbsp;</label>
											<div class="col-sm-5">
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
											<div class="col-sm-5">
												<select class="form-control">
												  <option>1</option>
												  <option>2</option>
												  <option>3</option>
												  <option>4</option>
												  <option>5</option>
												</select>
											</div>
										</div>
										
										<div class="form-group">
											<div class="col-md-12 t-center"><br />
												<button type="submit" class="btn btn-info btn-fill btn-wd bottom-space">TAMBAH</button>
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
