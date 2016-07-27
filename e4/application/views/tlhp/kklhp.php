<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12 col-md-7">
				<div class="card">
					<div class="header">
						<h4 class="title">MATRIKS PEMANTAUAN TINDAK LANJUT</h4>
						<p class="category">HASIL <?=$lhp->judul_lhp;?></p>
						<p class="category">PADA <?=$lhp->objek_pengawasan;?></p>
					</div>
					<div class="content table-full-width custom-tab">
						<div class="table-responsive tab-res-lg">
							<?php if(!empty($update)) {?>
							<table id="judul-lhp" class="table table-bordered">
								<tr class="success">
									<td>Tahun</td>
									<td>No.LHP</td>
									<td>JUDUL LHP</td>
									<td>TEMUAN</td>
									<td>REKOM</td>
									<td>SESUAI</td>
									<td>BELUM SESUAI</td>
									<td>BELUM TL</td>
									<td>TDK DAPAT TL</td>
									<td>Edit</td>
								</tr>
								<tr>
									<td><?=$lhp->tanggal_lhp?></td>
									<td><?=$lhp->nomor_lhp?></td>
									<td><?=$lhp->judul_lhp?></td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
									<td>6</td>
									<td>3</td>
									<td>3</td>
									<td><a class="btn btn-info circle-perfect" href="<?=site_url()?>tlhp/addlhp/update/<?=$lhp->lhp_id?>"> <i aria-hidden="true" class="fa fa-cogs"></i> <span class="sr-only">Edit</span>
									</a></td>
								</tr>
							</table>
							<?php } ?>
							<form method="post" id="kklhp-form" action="<?=site_url()?>tlhp/kklhpbaru/insert">
								<table id="kertas-kerja" class="table table-bordered table-custom">
									<thead>
										<tr>
											<td colspan="6" class="warning">JUDUL TEMUAN</td>
											<td colspan="5" class="info">REKOMENDASI</td>
											<td colspan="4" class="success">TINDAK LANJUT ENTITAS<br />YANG TELAH DILAKUKAN
											</td>
											<td colspan="2">SESUAI DENGAN REKOMENDASI</td>
											<td colspan="2" width="200">BELUM SESUAI REKOMENDASI DAN DALAM PROSES DI TINDAK LANJUTI</td>
											<td colspan="2">BELUM DITINDAK LANJUTI</td>
											<td colspan="2">TIDAK DAPAT DI TINDAK LANJUTI KARENA ALASAN YANG SAH</td>
										</tr>
										<tr>
											<td class="warning">NO</td>
											<td class="warning">KODE TEMUAN</td>
											<td class="warning">URAIAN TEMUAN</td>
											<td class="warning">KODE SEBAB</td>
											<td class="warning">URAIAN SEBAB</td>
											<td class="warning">NILAI (Rp.)</td>
											<td class="info">NO</td>
											<td class="info">KODE REKOMENDASI</td>
											<td class="info">URAIAN REKOMENDASI</td>
											<td class="info">KERUGIAN NEGARA</td>
											<td class="info">NILAI (Rp.)</td>
											<td class="success">UNIT KERJA</td>
											<td class="success">PERIODE TINDAK LANJUT</td>
											<td class="success">TINDAK LANJUT</td>
											<td class="success">DOKUMEN PENDUKUNG</td>
											<td>JUMLAH</td>
											<td>NILAI (Rp.)</td>
											<td>JUMLAH</td>
											<td>NILAI (Rp.)</td>
											<td>JUMLAH</td>
											<td>NILAI (Rp.)</td>
											<td>JUMLAH</td>
											<td>NILAI (Rp.)</td>
										</tr>
										<!--  ##### A Sistem Pengendalian #####-->
										<tr>
											<td colspan="23"><span class="pull-left"><b>A. SISTEM PENGENDALIAN INTERNAL </b></span></td>
										</tr>
										<tr class="temuan-tr">
											<td class="no-temuan">1</td>
											<td><select class="form-control" name="kode_sebab_id[]">
													<option>1111</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_temuan[]" /></td>
											<td><select class="form-control" name="kode_sebab_id[]">
													<option>222</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" disabled /></td>
											<td><input type="text" class="form-control border-input" name="nilai[]" /></td>
											<td>1
												<button class="add-rekomen-1">+</button>
											</td>
											<td><select class="form-control" name="kode_rekomendasi_id[]">
													<option>333</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_rekomendasi[]" /></td>
											<td><select class="form-control" name="kerugian_negara[]">
													<option>Ada</option>
													<option>Tidak</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="nilai_rekomendasi[]" /></td>
											<td><select class="form-control">
													<option>DEPUTI I</option>
													<option>DEPUTI II</option>
													<option>DEPUTI III</option>
													<option>DEPUTI IV</option>
													<option>STAFF AHLI</option>
													<option>INSPEKTORAT</option>
													<option>BIRO SDMU</option>
													<option>BIRO HUKIP</option>
													<option>BIRO BMOK</option>
													<option>BIRO KASN</option>
											</select></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr class="rekomen-tr-1">
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td class="no-rekomen-1">2</td>
											<td><select class="form-control">
													<option>444</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_temuan" /></td>
											<td><select class="form-control">
													<option>Ada</option>
													<option>Tidak</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_temuan" /></td>
											<td><select class="form-control">
													<option>DEPUTI I</option>
													<option>DEPUTI II</option>
													<option>DEPUTI III</option>
													<option>DEPUTI IV</option>
													<option>STAFF AHLI</option>
													<option>INSPEKTORAT</option>
													<option>BIRO SDMU</option>
													<option>BIRO HUKIP</option>
													<option>BIRO BMOK</option>
													<option>BIRO KASN</option>
											</select></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr class="temuan-tr">
											<td class="no-temuan">2 <!-- <button id="add-temuan">+</button> -->
											</td>
											<td><select class="form-control" name="kode_sebab_id[]">
													<option>1111</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_temuan[]" /></td>
											<td><select class="form-control" name="kode_sebab_id[]">
													<option>222</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" disabled /></td>
											<td><input type="text" class="form-control border-input" name="nilai[]" /></td>
											<td>1
												<button class="add-rekomen-2">+</button>
											</td>
											<td><select class="form-control" name="kode_rekomendasi_id[]">
													<option>333</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_rekomendasi[]" /></td>
											<td><select class="form-control" name="kerugian_negara[]">
													<option>Ada</option>
													<option>Tidak</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="nilai_rekomendasi[]" /></td>
											<td><select class="form-control">
													<option>DEPUTI I</option>
													<option>DEPUTI II</option>
													<option>DEPUTI III</option>
													<option>DEPUTI IV</option>
													<option>STAFF AHLI</option>
													<option>INSPEKTORAT</option>
													<option>BIRO SDMU</option>
													<option>BIRO HUKIP</option>
													<option>BIRO BMOK</option>
													<option>BIRO KASN</option>
											</select></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr class="rekomen-tr-2">
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td class="no-rekomen-2">2</td>
											<td><select class="form-control">
													<option>444</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_temuan" /></td>
											<td><select class="form-control">
													<option>Ada</option>
													<option>Tidak</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_temuan" /></td>
											<td><select class="form-control">
													<option>DEPUTI I</option>
													<option>DEPUTI II</option>
													<option>DEPUTI III</option>
													<option>DEPUTI IV</option>
													<option>STAFF AHLI</option>
													<option>INSPEKTORAT</option>
													<option>BIRO SDMU</option>
													<option>BIRO HUKIP</option>
													<option>BIRO BMOK</option>
													<option>BIRO KASN</option>
											</select></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr class="temuan-tr">
											<td class="no-temuan">3</td>
											<td><select class="form-control" name="kode_sebab_id[]">
													<option>1111</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_temuan[]" /></td>
											<td><select class="form-control" name="kode_sebab_id[]">
													<option>222</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" disabled /></td>
											<td><input type="text" class="form-control border-input" name="nilai[]" /></td>
											<td>1
												<button class="add-rekomen-3">+</button>
											</td>
											<td><select class="form-control" name="kode_rekomendasi_id[]">
													<option>333</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_rekomendasi[]" /></td>
											<td><select class="form-control" name="kerugian_negara[]">
													<option>Ada</option>
													<option>Tidak</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="nilai_rekomendasi[]" /></td>
											<td><select class="form-control">
													<option>DEPUTI I</option>
													<option>DEPUTI II</option>
													<option>DEPUTI III</option>
													<option>DEPUTI IV</option>
													<option>STAFF AHLI</option>
													<option>INSPEKTORAT</option>
													<option>BIRO SDMU</option>
													<option>BIRO HUKIP</option>
													<option>BIRO BMOK</option>
													<option>BIRO KASN</option>
											</select></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr class="rekomen-tr-3">
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td class="no-rekomen-3">2</td>
											<td><select class="form-control">
													<option>444</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_temuan" /></td>
											<td><select class="form-control">
													<option>Ada</option>
													<option>Tidak</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_temuan" /></td>
											<td><select class="form-control">
													<option>DEPUTI I</option>
													<option>DEPUTI II</option>
													<option>DEPUTI III</option>
													<option>DEPUTI IV</option>
													<option>STAFF AHLI</option>
													<option>INSPEKTORAT</option>
													<option>BIRO SDMU</option>
													<option>BIRO HUKIP</option>
													<option>BIRO BMOK</option>
													<option>BIRO KASN</option>
											</select></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>

										<!--  ##### B Kepatuhan Terhadap Aturan #####-->

										<tr>
											<td colspan="23"><span class="pull-left"><b>A. SISTEM PENGENDALIAN INTERNAL </b></span></td>
										</tr>
										<tr class="temuan-b-tr">
											<td class="no-temuan-b">1</td>
											<td><select class="form-control" name="kode_sebab_id[]">
													<option>1111</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_temuan[]" /></td>
											<td><select class="form-control" name="kode_sebab_id[]">
													<option>222</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" disabled /></td>
											<td><input type="text" class="form-control border-input" name="nilai[]" /></td>
											<td>1
												<button class="add-rekomen-b-1">+</button>
											</td>
											<td><select class="form-control" name="kode_rekomendasi_id[]">
													<option>333</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_rekomendasi[]" /></td>
											<td><select class="form-control" name="kerugian_negara[]">
													<option>Ada</option>
													<option>Tidak</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="nilai_rekomendasi[]" /></td>
											<td><select class="form-control">
													<option>DEPUTI I</option>
													<option>DEPUTI II</option>
													<option>DEPUTI III</option>
													<option>DEPUTI IV</option>
													<option>STAFF AHLI</option>
													<option>INSPEKTORAT</option>
													<option>BIRO SDMU</option>
													<option>BIRO HUKIP</option>
													<option>BIRO BMOK</option>
													<option>BIRO KASN</option>
											</select></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr class="rekomen-b-tr-1">
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td class="no-rekomen-b-1">2</td>
											<td><select class="form-control">
													<option>444</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_temuan" /></td>
											<td><select class="form-control">
													<option>Ada</option>
													<option>Tidak</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_temuan" /></td>
											<td><select class="form-control">
													<option>DEPUTI I</option>
													<option>DEPUTI II</option>
													<option>DEPUTI III</option>
													<option>DEPUTI IV</option>
													<option>STAFF AHLI</option>
													<option>INSPEKTORAT</option>
													<option>BIRO SDMU</option>
													<option>BIRO HUKIP</option>
													<option>BIRO BMOK</option>
													<option>BIRO KASN</option>
											</select></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr class="temuan-b-tr">
											<td class="no-temuan-b">2 <!-- <button id="add-temuan-b">+</button> -->
											</td>
											<td><select class="form-control" name="kode_sebab_id[]">
													<option>1111</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_temuan[]" /></td>
											<td><select class="form-control" name="kode_sebab_id[]">
													<option>222</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" disabled /></td>
											<td><input type="text" class="form-control border-input" name="nilai[]" /></td>
											<td>1
												<button class="add-rekomen-b-2">+</button>
											</td>
											<td><select class="form-control" name="kode_rekomendasi_id[]">
													<option>333</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_rekomendasi[]" /></td>
											<td><select class="form-control" name="kerugian_negara[]">
													<option>Ada</option>
													<option>Tidak</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="nilai_rekomendasi[]" /></td>
											<td><select class="form-control">
													<option>DEPUTI I</option>
													<option>DEPUTI II</option>
													<option>DEPUTI III</option>
													<option>DEPUTI IV</option>
													<option>STAFF AHLI</option>
													<option>INSPEKTORAT</option>
													<option>BIRO SDMU</option>
													<option>BIRO HUKIP</option>
													<option>BIRO BMOK</option>
													<option>BIRO KASN</option>
											</select></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr class="rekomen-b-tr-2">
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td class="no-rekomen-b-2">2</td>
											<td><select class="form-control">
													<option>444</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_temuan" /></td>
											<td><select class="form-control">
													<option>Ada</option>
													<option>Tidak</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_temuan" /></td>
											<td><select class="form-control">
													<option>DEPUTI I</option>
													<option>DEPUTI II</option>
													<option>DEPUTI III</option>
													<option>DEPUTI IV</option>
													<option>STAFF AHLI</option>
													<option>INSPEKTORAT</option>
													<option>BIRO SDMU</option>
													<option>BIRO HUKIP</option>
													<option>BIRO BMOK</option>
													<option>BIRO KASN</option>
											</select></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr class="temuan-b-tr">
											<td class="no-temuan-b">3</td>
											<td><select class="form-control" name="kode_sebab_id[]">
													<option>1111</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_temuan[]" /></td>
											<td><select class="form-control" name="kode_sebab_id[]">
													<option>222</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" disabled /></td>
											<td><input type="text" class="form-control border-input" name="nilai[]" /></td>
											<td>1
												<button class="add-rekomen-b-3">+</button>
											</td>
											<td><select class="form-control" name="kode_rekomendasi_id[]">
													<option>333</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_rekomendasi[]" /></td>
											<td><select class="form-control" name="kerugian_negara[]">
													<option>Ada</option>
													<option>Tidak</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="nilai_rekomendasi[]" /></td>
											<td><select class="form-control">
													<option>DEPUTI I</option>
													<option>DEPUTI II</option>
													<option>DEPUTI III</option>
													<option>DEPUTI IV</option>
													<option>STAFF AHLI</option>
													<option>INSPEKTORAT</option>
													<option>BIRO SDMU</option>
													<option>BIRO HUKIP</option>
													<option>BIRO BMOK</option>
													<option>BIRO KASN</option>
											</select></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr class="rekomen-b-tr-3">
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td class="no-rekomen-b-3">2</td>
											<td><select class="form-control">
													<option>444</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_temuan" /></td>
											<td><select class="form-control">
													<option>Ada</option>
													<option>Tidak</option>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_temuan" /></td>
											<td><select class="form-control">
													<option>DEPUTI I</option>
													<option>DEPUTI II</option>
													<option>DEPUTI III</option>
													<option>DEPUTI IV</option>
													<option>STAFF AHLI</option>
													<option>INSPEKTORAT</option>
													<option>BIRO SDMU</option>
													<option>BIRO HUKIP</option>
													<option>BIRO BMOK</option>
													<option>BIRO KASN</option>
											</select></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</form>
						</div>

						<div class="row">
							<div class="col-md-12 t-center">
								<button class="btn btn-sm btn-info btn-fill">
									<span class="btn-label"> <i class="ti-plus"></i>
									</span> Tambah Temuan
								</button>
								<button class="btn btn-sm btn-success btn-fill">
									<span class="btn-label"> <i class="ti-plus"></i>
									</span> Tambah Rekomendasi
								</button>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12 t-center">
								<button type="submit" id="kklhp" class="btn btn-wd btn-success btn-fill">
									<span class="btn-label"> <i class="ti-save"></i>
									</span> SAVE
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

