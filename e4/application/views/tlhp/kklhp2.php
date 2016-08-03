<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12 col-md-7">
				<div class="card">
					<div class="header">
						<h4 class="title">MATRIKS PEMANTAUAN TINDAK LANJUT</h4>
						<p class="category">Hasil <?php echo isset($lhp->judul_lhp) ? $lhp->judul_lhp : "undefined"; ?></p>
						<p class="category">Pada <?php echo isset($lhp->objek_pengawasan) ? $lhp->objek_pengawasan: "undefined"; ?></p>
					</div>
					<div class="content table-full-width custom-tab">
						<div class="table-responsive tab-res-lg">
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
									<td> <?php echo isset($lhp->tanggal_lhp) ? year_only($lhp->tanggal_lhp):"";?></td>
									<td> <?php echo isset($lhp->nomor_lhp) ? $lhp->nomor_lhp:"";?></td>
									<td> <?php echo isset($lhp->judul_lhp) ? $lhp->judul_lhp:"";?></td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>
										<a class="btn btn-info circle-perfect" href="<?php echo site_url() ?>tlhp/addlhp/update/<?php echo $lhp->lhp_id?>"> 
										<i aria-hidden="true" class="fa fa-cogs"></i> <span class="sr-only">Edit</span>
										</a>
									</td>
								</tr>
							</table>
							
							<!-- table kklhp baru -->
							<table id="kertas-kerja" class="table table-bordered table-custom">
									<thead>
										<tr>
											<th colspan="6" class="warning">JUDUL TEMUAN</th>
											<th colspan="5" class="info">REKOMENDASI</th>
											<th colspan="7" class="success">TINDAK LANJUT ENTITAS<br />YANG TELAH DILAKUKAN
											</th>
											<th colspan="2">SESUAI DENGAN REKOMENDASI</th>
											<th colspan="2" width="200">BELUM SESUAI REKOMENDASI DAN DALAM PROSES DI TINDAK LANJUTI</th>
											<th colspan="2">BELUM DITINDAK LANJUTI</th>
											<th colspan="2">TIDAK DAPAT DI TINDAK LANJUTI KARENA ALASAN YANG SAH</th>
										</tr>
										<tr>
											<th class="warning">NO</th>
											<th class="warning">KODE TEMUAN</th>
											<th class="warning">URAIAN TEMUAN</th>
											<th class="warning">KODE SEBAB</th>
											<th class="warning">URAIAN SEBAB</th>
											<th class="warning">NILAI (Rp.)</th>
											<th class="info">NO</th>
											<th class="info">KODE REKOMENDASI</th>
											<th class="info">URAIAN REKOMENDASI</th>
											<th class="info">KERUGIAN NEGARA</th>
											<th class="info">NILAI (Rp.)</th>
											<th class="success">UNIT KERJA</th>
											<th class="success">UNIT KERJA</th>
											<th class="success">NAMA PPK</th>
											<th class="success">NAMA PJ</th>
											<th class="success">PERIODE TINDAK LANJUT</th>
											<th class="success">TINDAK LANJUT</th>
											<th class="success">DOKUMEN PENDUKUNG</th>
											<th>JUMLAH</th>
											<th>NILAI (Rp.)</th>
											<th>JUMLAH</th>
											<th>NILAI (Rp.)</th>
											<th>JUMLAH</th>
											<th>NILAI (Rp.)</th>
											<th>JUMLAH</th>
											<th>NILAI (Rp.)</th>
										</tr>
									</thead>
									<tbody>
										<!-- ko template: {foreach: jenisTemuan} -->
										<tr>
											<td colspan="23">
												<span class="pull-left">
													<b>
														<span data-bind="text: data.kodeTemuan">[kode temuan]</span>.
														<span data-bind="text: data.jenisTemuan">[kode temuan]</span>
													</b>
												</span>
											</td>
										</tr>
										<!-- ko template: {foreach: data.kertasKerjaTemuan} -->
										<tr>
											<td class="no-temuan">
												<span data-bind="text: urutan"></span>
												<button type="button" data-bind="visible: isFirstRow(), event: {click: $parent.addRow}">
													<i aria-hidden="true" class="fa fa-plus"></i>
												</button>
												
												<button type="button" data-bind="visible: !isFirstRow(), event: {click: $parent.removeRow}">
													<i aria-hidden="true" class="fa fa-minus"></i>
												</button>
											</td>
											<td>
												<select class="form-control select-simple border-input"
												data-bind="kodeTemuan: true, value: data.kodeTemuanId">
												</select>
											</td>
											<td>
												<input type="text" class="form-control border-input"/>
											</td>
											<td>
												<select class="form-control select-simple border-input"
												data-bind="kodeSebab: true, value: data.kodeSebabId">
												</select>
											</td>
											<td>
												<input type="text" class="form-control border-input"/>
											</td>
											<td>
												<input type="text" class="form-control border-input"/>
											</td>
											<!-- Rekomendasi -->
											<td>
												<button type="button" data-bind="event: {click: addRow}">
													<i aria-hidden="true" class="fa fa-plus"></i>
												</button>
											</td>
											<td>
												<select class="form-control select-simple border-input"
												data-bind="kodeRekomendasi: true">
												</select>
											</td>
											<td>
												<input type="text" class="form-control border-input"/>
											</td>
											<td>
												<input type="checkbox"/>
											</td>
											<td>
												<input type="text" class="form-control border-input"/>
											</td>
											<td>
												<select class="form-control">
													<option>-- departement --</option>
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
												</select>
											</td>
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
											<td></td>
											<td></td>
										</tr>
										<!-- rekomendasi -->
										<!-- ko template: {foreach: data.rekomendasi} -->
										<tr>
											<td colspan="6"></td>
											<td>
												<button type="button" data-bind="event: {click: $parent.removeRow}">
													<i aria-hidden="true" class="fa fa-minus"></i>
												</button>
											</td>
											<td>
												<select class="form-control select-simple">
													<option value="">-- kode rekomendasi --</option>
												</select>
											</td>
											<td>
												<input type="text" class="form-control border-input"/>
											</td>
											<td>
												<input type="checkbox"/>
											</td>
											<td>
												<input type="text" class="form-control border-input"/>
											</td>
											<td>
												<select class="form-control">
													<option>-- departement --</option>
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
												</select>
											</td>
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
											<td></td>
											<td></td>
										</tr>
										<!-- /ko -->
										<!-- /rekomendasi -->
										
										<!-- /ko -->
										<!-- /ko -->
										<!-- Bagian Update -->
									</tbody>
								</table>
							<!-- end table kklhp -->
							<form method="post" id="kklhp-form" action="<?php echo site_url()?>tlhp/kklhpbaru/insert">
								<input type="hidden" value="<?php echo $lhp->lhp_id?>" id="lhp_id" name="lhp_id">
								<table id="kertas-kerja" class="table table-bordered table-custom">
									<thead>
										<tr>
											<th colspan="6" class="warning">JUDUL TEMUAN</th>
											<th colspan="5" class="info">REKOMENDASI</th>
											<th colspan="7" class="success">TINDAK LANJUT ENTITAS<br />YANG TELAH DILAKUKAN
											</th>
											<th colspan="2">SESUAI DENGAN REKOMENDASI</th>
											<th colspan="2" width="200">BELUM SESUAI REKOMENDASI DAN DALAM PROSES DI TINDAK LANJUTI</th>
											<th colspan="2">BELUM DITINDAK LANJUTI</th>
											<th colspan="2">TIDAK DAPAT DI TINDAK LANJUTI KARENA ALASAN YANG SAH</th>
										</tr>
										<tr>
											<th class="warning">NO</th>
											<th class="warning">KODE TEMUAN</th>
											<th class="warning">URAIAN TEMUAN</th>
											<th class="warning">KODE SEBAB</th>
											<th class="warning">URAIAN SEBAB</th>
											<th class="warning">NILAI (Rp.)</th>
											<th class="info">NO</th>
											<th class="info">KODE REKOMENDASI</th>
											<th class="info">URAIAN REKOMENDASI</th>
											<th class="info">KERUGIAN NEGARA</th>
											<th class="info">NILAI (Rp.)</th>
											<th class="success">UNIT KERJA</th>
											<th class="success">UNIT KERJA</th>
											<th class="success">NAMA PPK</th>
											<th class="success">NAMA PJ</th>
											<th class="success">PERIODE TINDAK LANJUT</th>
											<th class="success">TINDAK LANJUT</th>
											<th class="success">DOKUMEN PENDUKUNG</th>
											<th>JUMLAH</th>
											<th>NILAI (Rp.)</th>
											<th>JUMLAH</th>
											<th>NILAI (Rp.)</th>
											<th>JUMLAH</th>
											<th>NILAI (Rp.)</th>
											<th>JUMLAH</th>
											<th>NILAI (Rp.)</th>
										</tr>
									</thead>
																			
							<?php
							$arrayjenistemuan = array("a" => "SISTEM PENGENDALIAN INTERNAL", "b" => "KEPATUHAN TERHADAP PERATURAN DAN PERUNDANG-UNDANGAN", "c" => "LAPORAN KEUANGAN");
							foreach ( $arrayjenistemuan as $index => $jenistemuan ) :
								?>
							
							 
										<tr>
											<td colspan="23"><span class="pull-left"><b><?php echo strtoupper($index); ?> . <?php echo strtoupper($jenistemuan); ?></b></span></td>
										</tr>
							<?php
								// jika buat kklhp baru
								if ($action == "add") {
									// echo 'masuk loh';exit;
									// print_r($kode_temuan);exit;
									
									?>
							
										<input type="hidden" value="1" id="nomor_temuan_<?php echo $index; ?>" name="nomor_temuan_<?php echo $index; ?>">
										<input type="hidden" value="1" id="jumlah_temuan_<?php echo $index; ?>" name="jumlah_temuan_<?php echo $index; ?>">
										<tr class="temuan-tr-1 append<?php echo $index; ?>1">
											<!-- tr 1 -->
											<td class="no-temuan">1
												<button class="add-temuan" jenis="<?php echo $index; ?>" type="button"><i aria-hidden="true" class="fa fa-plus"></i></button>

											</td>
											<td><select class="form-control kode_temuan-<?php echo $index; ?> select-simple" id="kode_temuan-<?php echo $index; ?>" required name="kode_temuan_id-<?php echo $index; ?>1">
													<option value=""></option>
													
													 <?php
									if (! empty($kode_temuan)) :
										foreach ( $kode_temuan as $kode_temuan_data ) :
											?>
														    <option value="<?php echo $kode_temuan_data->kode_temuan_id; ?>"><?php echo $kode_temuan_data->kode_temuan; ?> </option>
														    <?php
										endforeach ;
									
									
													  endif;
									?>
													 
											</select></td>
											<td><input type="text" class="form-control border-input uraian_temuan-<?php echo $index; ?>" name="uraian_temuan-<?php echo $index; ?>1" /></td>
											<td><select class="form-control kode_sebab_id-<?php echo $index; ?> select-simple" id="kode_sebab_id-<?php echo $index; ?>" required name="kode_sebab_id-<?php echo $index; ?>1">
													<option value=""></option>
													 <?php
									if (! empty($kode_sebab) > 0) :
										foreach ( $kode_sebab as $kode_sebab_data ) :
											
											?><option value="<?php echo $kode_sebab_data->kode_sebab_id; ?>"><?php echo $kode_sebab_data->uraian_sebab; ?> </option><?php
										endforeach ;
									
									
													  endif;
									?>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_sebab-<?php echo $index; ?>1" /></td>
											<td><input type="text" class="form-control border-input" name="nilai_temuan-<?php echo $index; ?>1" /></td>

											<!-- Rekomendasi -->
											<td>1 <input type="hidden" value="1" id="nomor_rekomen_<?php echo $index; ?>1" name="nomor_rekomen_<?php echo $index; ?>1"> <input type="hidden" value="1" id="jumlah_rekomen_<?php echo $index; ?>1" name="jumlah_rekomen-<?php echo $index; ?>1">
												<button class="add-rekomen" jenis="<?php echo $index; ?>" id="add-rekomen-<?php echo $index; ?>" nomor="1" type="button"><i aria-hidden="true" class="fa fa-plus"></i></button>
											</td>
											<td><select class="form-control kode_rekomendasi_id-<?php echo $index; ?> select-simple" id="kode_rekomendasi_id-<?php echo $index; ?>" required name="kode_rekomendasi_id-<?php echo $index; ?>11">
													<option value=""></option>
													 <?php
									if (count($kode_rekomendasi) > 0) :
										foreach ( $kode_rekomendasi as $kode_rekomendasi_data ) :
											
											?><option value="<?php echo $kode_rekomendasi_data->kode_rekomendasi_id	; ?>"><?php echo $kode_rekomendasi_data->uraian_rekomendasi; ?> </option><?php
										endforeach
										;
									
									
													  endif;
									?>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_rekomendasi-<?php echo $index; ?>11" /></td>
											<td><select class="form-control kerugian_negara-<?php echo $index; ?>" id="kerugian_negara-<?php echo $index; ?>" name="kerugian_negara-<?php echo $index; ?>11">
													<option value=""></option>
													<option value="1">Ada</option>
													<option value="2">Tidak</option>
											</select></td>
											<td><input type="text" class="form-control border-input " name="nilai_rekomendasi-<?php echo $index; ?>11" /></td>
											<td><select class="form-control uker-<?php echo $index; ?>" id="uker-<?php echo $index; ?>" name="nama_ppk-<?php echo $index; ?>1">
													<option></option>
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
											<td></td>
											<td></td>
										</tr>
										<!-- Bagian Update -->
									 <?php
								} else {
									
									$data_temuan = $this->mlhp->getAllKKLHP($lhp->lhp_id, strtolower($index));
									// debug($data_temuan);exit;
									if (! empty($data_temuan)) :
										$no = 0;
										$jumlah = count($data_temuan);
// 										echo 'jumlah'. $jumlah;exit();
										foreach ( $data_temuan as $valdatatemuan ) :
											$data_rekomen = $this->mlhp->getAllRekomendasi($valdatatemuan->kertas_kerja_id);
											$jumlahrekomen = count($data_rekomen);
											$no ++?>
										
										<input type="hidden" value="update" name="update">
										<input type="hidden" value="<?php echo count($data_temuan); ?>" id="nomor_temuan_<?php echo $index; ?>" name="nomor_temuan_<?php echo $index; ?>">
										<input type="hidden" value="<?php echo count($data_temuan); ?>" id="jumlah_temuan_<?php echo $index; ?>" name="jumlah_temuan_<?php echo $index; ?>">
										<tr class="temuan-<?php echo $index.$no; ?> append<?php echo $index.$no; ?>">
											<!-- tr 1 -->
											<td class="no-temuan">
											    <?php echo $no; ?>
												<?php
											if ($no == 1) {
												
												?><button class="add-temuan" jenis="<?php echo $index; ?>" type="button"><i aria-hidden="true" class="fa fa-plus"></i></button><?php
											} else {
												
												?><button class="batal" type='button' nomor='nomor_temuan_<?php echo $index; ?>' tr='temuan-<?php echo $index.$no; ?>'><i aria-hidden="true" class="fa fa-times"></i></button>
											   <?php
											}
											?>
											</td>
											<td><select class="form-control kode_temuan-<?php echo $index; ?> select-simple" id="kode_temuan-<?php echo $index; ?>" required name="kode_temuan_id-<?php echo $index.$no; ?>">
													<option value=""></option>
													
													 <?php
											if (count($kode_temuan) > 0) :
												foreach ( $kode_temuan as $kode_temuan_data ) :
													
													?><option value="<?php echo $kode_temuan_data->kode_temuan_id; ?>" <?php echo ($kode_temuan_data->kode_temuan_id==$valdatatemuan->kode_temuan_id) ? "selected":""; ?>><?php echo $kode_temuan_data->kode_temuan; ?> </option><?php
												endforeach
												;
											
											
													  endif;
											?>
													 
											</select></td>
											<td><input type="text" class="form-control border-input uraian_temuan-<?php echo $index; ?>" name="uraian_temuan-<?php echo $index.$no; ?>" value="<?php echo isset($valdatatemuan->uraian_temuan) ? $valdatatemuan->uraian_temuan:""; ?>" /></td>
											<td><select class="form-control kode_sebab_id-<?php echo $index; ?>" id="kode_sebab_id-<?php echo $index; ?>" required name="kode_sebab_id-<?php echo $index.$no; ?>">
													<option value=""></option>
													 <?php
											if (count($kode_sebab) > 0) :
												foreach ( $kode_sebab as $kode_sebab_data ) :
													
													?><option value="<?php echo $kode_sebab_data->kode_sebab_id; ?>" <?php echo ($kode_sebab_data->kode_sebab_id==$valdatatemuan->kode_sebab_id) ? "selected":""; ?>><?php echo $kode_sebab_data->uraian_sebab; ?> </option><?php
												endforeach
												;
											
											
													  endif;
											?>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_sebab-<?php echo $index.$no; ?>" value="<?php echo isset($valdatatemuan->uraian_sebab) ? $valdatatemuan->uraian_sebab:""; ?>" /></td>
											<td><input type="text" class="form-control border-input" name="nilai_temuan-<?php echo $index.$no; ?>" value="<?php echo isset($valdatatemuan->nilai_temuan) ? $valdatatemuan->nilai_temuan:""; ?>" /></td>

											<!-- Rekomendasi -->
											<td><input type="hidden" value="<?php echo $jumlahrekomen; ?>" id="nomor_rekomen_<?php echo $index.$no; ?>" name="nomor_rekomen_<?php echo $index.$no; ?>"> <input type="hidden" value="<?php echo $jumlahrekomen; ?>" id="jumlah_rekomen_<?php echo $index.$no; ?>" name="jumlah_rekomen-<?php echo $index.$no; ?>">
												<button class="add-rekomen" jenis="<?php echo $index; ?>" id="add-rekomen-<?php echo $index; ?>" nomor="<?php echo $no; ?>" type="button"><i aria-hidden="true" class="fa fa-plus"></i></button></td>
											<td><select class="form-control kode_rekomendasi_id-<?php echo $index; ?> select-simple" id="kode_rekomendasi_id-<?php echo $index; ?>" required name="kode_rekomendasi_id-<?php echo $index.$no; ?>">
													<option value=""></option>
													 <?php
											if (count($kode_rekomendasi) > 0) :
												foreach ( $kode_rekomendasi as $kode_rekomendasi_data ) :
													
													?><option value="<?php echo $kode_rekomendasi_data->kode_rekomendasi_id	; ?>"><?php echo $kode_rekomendasi_data->uraian_rekomendasi; ?> </option><?php
												endforeach
												;
											
											
													  endif;
											?>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_rekomendasi-<?php echo $index.$no; ?>" /></td>
											<td><select class="form-control kerugian_negara-<?php echo $index; ?>" id="kerugian_negara-<?php echo $index; ?>" name="kerugian_negara-<?php echo $index.$no; ?>">
													<option value=""></option>
													<option value="1">Ada</option>
													<option value="2">Tidak</option>
											</select></td>
											<td><input type="text" class="form-control border-input " name="nilai_rekomendasi-<?php echo $index.$no; ?>" /></td>
											<td><select class="form-control uker-<?php echo $index; ?>" id="nama_ppk-<?php echo $index; ?>" name="nama_ppk-<?php echo $index; ?>1">
													<option></option>
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
											<td></td>
											<td></td>
										</tr>
										
										
										
										
									<?php
											
											$nomorrekomen = 0;
											foreach ( $data_rekomen as $valeditrekomen ) :
												$nomorrekomen ++;
												?>
												
									<tr class="temuan-<?php echo $index.$no; ?> append<?php echo $index.$no; ?> rekomen<?php echo $index.$nomorrekomen.$no; ?>">
											<!-- tr 1 -->
											<td colspan="6"></td>

											<!-- Rekomendasi -->
											<td><?php echo $nomorrekomen; ?>
											 		<button class="batal" type="button" nomor="nomor_rekomen_<?php echo $index.$no; ?>" tr="rekomen<?php echo $index.$nomorrekomen.$no; ?>"><i aria-hidden="true" class="fa fa-times"></i></button></td>
											<td><select class="form-control kode_rekomendasi_id-<?php echo $index; ?> select-simple" required name="kode_rekomendasi_id-<?php echo $index.$nomorrekomen.$no; ?>">
													<option value=""></option>
													 <?php
												if (count($kode_rekomendasi) > 0) :
													foreach ( $kode_rekomendasi as $kode_rekomendasi_data ) :
														
														?><option value="<?php echo $kode_rekomendasi_data->kode_rekomendasi_id	; ?>" <?php echo ($kode_rekomendasi_data->kode_rekomendasi_id==$valeditrekomen->kode_rekomendasi_id) ? "selected":""; ?>><?php echo $kode_rekomendasi_data->uraian_rekomendasi; ?> </option><?php
													endforeach
													;
												
												
													  endif;
												?>
											</select></td>
											<td><input type="text" class="form-control border-input" name="uraian_rekomendasi-<?php echo $index.$nomorrekomen.$no; ?>" value="<?php echo !empty($valeditrekomen->uraian_rekomendasi) ? $valeditrekomen->uraian_rekomendasi:""; ?>" /></td>
											<td><select class="form-control kerugian_negara-<?php echo $index; ?>" name="kerugian_negara-<?php echo $index.$nomorrekomen.$no; ?>">
													<option value=""></option>
													<option value="1" <?php echo (1==$valeditrekomen->kerugian_negara) ? "selected":""; ?>>Ada</option>
													<option value="2" <?php echo (2==$valeditrekomen->kerugian_negara) ? "selected":""; ?>>Tidak</option>
											</select></td>
											<td><input type="text" class="form-control border-input " name="nilai_rekomendasi-<?php echo $index.$nomorrekomen.$no; ?>" value="<?php echo isset($valeditrekomen->nilai_rekomendasi) ? $valeditrekomen->nilai_rekomendasi:""; ?>" "/></td>
											<td><select class="form-control uker-<?php echo $index; ?>" id="nama_ppk-<?php echo $index; ?>" name="nama_ppk-<?php echo $index; ?>1">
													<option></option>
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
											<td></td>
											<td></td>
										</tr>
												
												<?php
											endforeach
											;
										endforeach
										;
									
									
									 endif;
									?>
										
										
										
										
										<?php }  ?>
							  
						<?php endforeach; ?>		
										

										
									</thead>
									<tbody>
									</tbody>
								</table>
							</form>
						</div>



						<div class="row">
							<div class="col-md-7 t-center top-space">
								<button type="submit" id="kklhp" class="btn btn-wd btn-info btn-fill btn-margin">
									<span class="btn-label"> <i aria-hidden="true" class="fa fa-file-excel-o"></i>
									</span> EXPORT TO EXCEL
								</button>
								
								<button type="submit" id="kklhp" class="btn btn-wd btn-warning btn-fill btn-margin">
									<span class="btn-label"> <i aria-hidden="true" class="fa fa-file-pdf-o"></i>
									</span> EXPORT TO PDF
								</button>

								<button type="submit" id="kklhp" class="btn btn-wd btn-success btn-fill btn-margin">
									<span class="btn-label"> <i aria-hidden="true" class="fa fa-print"></i>
									</span> PRINT
								</button>
							</div>

							<div class="col-md-5 t-ce ter top-space">
								<button type="submit" id="kklhp" class="btn btn-wd btn-danger btn-fill btn-margin">
									<span class="btn-label"> <i class="ti-save"></i>
									</span> SAVE
								</button>
							</div>
							<div class="col-md-12 top-space">&nbsp;</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	require.config({
		"shim": {
			"tlhp" : {"deps": ["jquery"]},
            "bootstrap" : {deps: ["jquery"]},
            "select2" : {deps: ["jquery"]},
		},
		"paths": {
			"jspath": site_url+"assets/js/",
        	"jquery": site_url+"assets/js/jquery-2.1.4.min",
            "bootstrap": site_url+ "assets/js/bootstrap.min",
            "select2": site_url+ "assets/js/select2.min",
         	"knockout": site_url+"assets/js/knockout-3.2.0",
		}
	});
	requirejs(["jspath/kklhp"]);
</script> 

