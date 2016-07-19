<?php include('header.php')?>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-7">
                        <div class="card">
							<div class="content">	
							<form>
							
								<div class="header">
									<h3 class="title must-center">PEMANTAUAN TINDAK LANJUT REKOMENDASI HASIL PEMERIKSAAN</h3>
								</div>
								
							   <div class="row">
									<div class="col-md-6">
										<h4>ST</h4>
										
										<div class="col-md-6">
											<div class="form-group">
												<label>Nomer</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Tanggal</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Pemeriksaan</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										<div class="col-md-6"></div>
									</div>
									
									<div class="col-md-6">
										<h4>ST (PERPANJANGAN)</h4>
										
										<div class="col-md-6">
											<div class="form-group">
												<label>Nomer</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Tanggal</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Pemeriksaan</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										<div class="col-md-6"></div>
									</div>
								</div>
							
								<div class="row">
									<div class="col-md-6">
										<h4>Tim Pemeriksa</h4>
										
										<div id="modules" class="col-md-12">
											<div class="col-md-6 nopadding">
												<div class="form-group">
													<label>Nama</label>
													<input type="text" class="form-control border-input" placeholder="" value="" />
												</div>
												<div class="form-group">
													<label>Jabatan</label>
													<input type="text" class="form-control border-input" placeholder="" value="" />
												</div>
											</div>
										</div>
										
										<div class="col-md-12">
											<button onclick="myFunction()" class="add-button">+ Tambah Tim Pemeriksa</button>
										</div>
										
										<div class="col-md-12">
											<label>Jenis Pemeriksa</label>
											<input type="text" class="form-control border-input" placeholder="" value="" />
										</div>
										<div class="col-md-12"></div>
									</div>
									<div class="col-md-6"></div>
								</div>
							
								<div class="row">
									<div class="col-md-12">
										<h4>LHP</h4>
										
										<div class="col-md-6">
											<div class="form-group">
												<label>Judul</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										
										<div class="clearfix"></div>
										<div class="col-md-3">
											<div class="form-group">
												<label>Nomer</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label>Tanggal</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										<div class="col-md-3"></div>
									</div>
								</div>
							
								<div class="row">
									<div class="col-md-12">
										<h4>Judul Temuan</h4>
										
										<div class="col-md-3">
											<div class="form-group">
												<label>Nomer</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										
										<div class="col-md-3">
											<div class="form-group">
												<label>Kode Temuan</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label>Besaran (Rupiah)</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										
										<div class="col-md-9">
											<div class="form-group">
												<label>Uraian</label>
												<textarea rows="5" class="form-control border-input">
												</textarea>
											</div>
										</div>
										<div class="col-md-12"></div>
									</div>
								</div>
							
								<div class="row">
									<div class="col-md-12">
										<h4>Rekomendasi</h4>
										
										<div class="col-md-3">
											<div class="form-group">
												<label>Nomer</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										
										<div class="col-md-3">
											<div class="form-group">
												<label>Kode Rekomendasi</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label>Kerugian Negara (Rupiah)</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label>Besaran (Rupiah)</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										
										<div class="col-md-9">
											<div class="form-group">
												<label>Uraian</label>
												<textarea rows="5" class="form-control border-input">
												</textarea>
											</div>
										</div>
										<div class="col-md-12"></div>
									</div>
								</div>
							
								<div class="row">
									<div class="col-md-12">
										<h4>Tindak Lanjut Entitas Yang Telah Dilakukan</h4>
										
										<div class="col-md-3">
											<div class="form-group">
												<label>Unit Kerja</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										
										<div class="col-md-3">
											<div class="form-group">
												<label>Masa Tindak Lanjut</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label>Dokumen Pendukung</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										
										<div class="col-md-9">
											<div class="form-group">
												<label>Uraian</label>
												<textarea rows="5" class="form-control border-input">
												</textarea>
											</div>
										</div>
										<div class="col-md-12"></div>
									</div>
								</div>
							
								<div class="row">
									<div class="col-md-12">
										<h3>Hasil Tindak Lanjut</h3>
										
										<h4>Sesuai Dengan Rekomendasi</h4>
										<div class="col-md-4">
											<div class="form-group">
												<label>Jumlah</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										
										<div class="col-md-4">
											<div class="form-group">
												<label>Nilai</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										<div class="col-md-12"></div>
									</div>
								</div>
							
								<div class="row">
									<div class="col-md-12">
										<h4>Belum Sesuai Rekomendasi dan Dalam Proses di Tindak Lanjuti</h4>
										<div class="col-md-4">
											<div class="form-group">
												<label>Jumlah</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										
										<div class="col-md-4">
											<div class="form-group">
												<label>Nilai</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										<div class="col-md-12"></div>
									</div>
								</div>
							
								<div class="row">
									<div class="col-md-12">
										<h4>Belum di Tindak Lanjuti</h4>
										<div class="col-md-4">
											<div class="form-group">
												<label>Jumlah</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										
										<div class="col-md-4">
											<div class="form-group">
												<label>Nilai</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										<div class="col-md-12"></div>
									</div>
								</div>
							
								<div class="row">
									<div class="col-md-12">
										<h4>Tidak Dapat Di Tindak Lanjuti Karena Alasan Yang Sah</h4>
										<div class="col-md-4">
											<div class="form-group">
												<label>Jumlah</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										
										<div class="col-md-4">
											<div class="form-group">
												<label>Nilai</label>
												<input type="text" class="form-control border-input" placeholder="" value="" />
											</div>
										</div>
										<div class="col-md-12"></div>
									</div>
									
									
								</div>
							
								<div class="row">
									<div class="col-md-12">
										<button type="submit" class="btn btn-info btn-fill btn-wd bottom-space">Submit</button>
									</div>
								</div>
								
							</form>	
						</div>
                    </div>
                </div>
            </div>
        </div>
<?php include('footer.php')?>
