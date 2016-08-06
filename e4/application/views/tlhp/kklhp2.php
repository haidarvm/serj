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
					<input type="hidden" id="lhp_id" value="<?php echo isset($lhp->lhp_id) ? $lhp->lhp_id : null; ?>"/>
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
										<a class="btn btn-info circle-perfect" href="<?php echo site_url() ?>tlhp/addlhp/edit/<?php echo $lhp->lhp_id?>"> 
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
											<td colspan="26">
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
												<button type="button" class="tambah" data-bind="visible: isFirstRow(), event: {click: $parent.addRow}">
													<i aria-hidden="true" class="fa fa-plus"></i>
												</button>
												
												<button type="button" class="ngurang" data-bind="visible: !isFirstRow(), event: {click: $parent.removeRow}">
													<i aria-hidden="true" class="fa fa-minus"></i>
												</button>
											</td>
											<td>
												<select class="form-control select-simple border-input"
												data-bind="kodeTemuan: true, value: data.kodeTemuanId, options: kodeTemuan, optionsText: 'text'">
												</select>
											</td>
											<td>
												<!-- uraian temuan -->
												<textarea class="form-control border-input" data-bind="value: data.uraianTemuan">
												</textarea>
											</td>
											<td>
												<select class="form-control select-simple border-input"
												data-bind="kodeSebab: true, value: data.kodeSebabId, uraianSebab: data.uraianSebab, 
												listKodeSebab: kodeSebab,
												options: kodeSebab, optionsText: 'text'">
												</select>
											</td>
											<td>
												<!-- uraian sebab -->
												<textarea class="form-control border-input" data-bind="value: data.uraianSebab"></textarea>
											</td>
											<td>
												<!-- nilai -->
<!--												<textarea class="form-control border-input" data-bind="value: data.nilaiTemuan">-->
<!--												</textarea>-->
												<input type="number" class="form-control border-input" 
												data-bind="value: data.nilaiTemuan" style="width: 200px"/>
											</td>
											<!-- Rekomendasi -->
											<td>
												<button type="button" class="tambah" data-bind="event: {click: addRow}">
													<i aria-hidden="true" class="fa fa-plus"></i>
												</button>
											</td>
											<td>
												<select class="form-control select-simple border-input"
												data-bind="kodeRekomendasi: true, value: data.firstKodeRekomendasiId, options: firstKodeRekomendasi, optionsText: 'text'">  
												</select>
											</td>
											<td>
												<!-- uraian rekomendasi -->
												<textarea class="form-control border-input" data-bind="value: data.firstUraianRekomendasi">
												</textarea>
											</td>
											<td>
												<input type="checkbox" data-bind="checked: data.firstKerugianNegaraCbk"/>
											</td>
											<td>
												<!-- nilai -->
<!--												<textarea class="form-control border-input" value="value: data.firstNilaiRekomendasi">-->
<!--												</textarea>-->
												<input type="number" class="form-control border-input" 
												data-bind="value: data.firstNilaiRekomendasi" style="width: 200px"/>
											</td>
											<td>
												<select class="form-control select-simple border-input">
													<option>-- Departement --</option>
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
											<td></td>
										</tr>
										<!-- rekomendasi -->
										<!-- ko template: {foreach: data.rekomendasi} -->
										<tr>
											<td colspan="6"></td>
											<td>
												<button class="ngurang" type="button" data-bind="event: {click: $parent.removeRow}">
													<i aria-hidden="true" class="fa fa-minus"></i>
												</button>
											</td>
											<td>
												<select class="form-control select-simple border-input"
												data-bind="kodeRekomendasi: true, value: data.kodeRekomendasiId, options: kodeSebab, optionsText: 'text'">
												</select>
											</td>
											<td>
												<!-- uraian rekomendasi -->
												<textarea class="form-control border-input" data-bind="value: data.uraianRekomendasi">
												</textarea>
											</td>
											<td>
												<!-- kerugian negara -->
												<input type="checkbox" data-bind="checked: data.kerugianNegaraCbk"/>
											</td>
											<td>
												<!-- nilai -->
												<input type="number" class="form-control border-input" 
												data-bind="value: data.nilaiRekomendasi"/>
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
								<button type="submit" class="btn btn-wd btn-danger btn-fill btn-margin"
								id="btnSave" 
								data-bind="event: {click: doInsert}">
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
<!--<div id="form_edit">-->
<!--	<h1>Form Edit</h1>-->
<!--</div>-->
<script type="text/javascript">
	require.config({
		"shim": {
			"tlhp" : {"deps": ["jquery"]},
            "bootstrap" : {deps: ["jquery"]},
            "select2" : {deps: ["jquery"]},
            //masih suka bermasalah
//            "papertlhp" : {"deps": ["jquery","bootstrap"]},
            "select2" : {deps: ["jquery"]}
		},
		"paths": {
			"jspath": site_url+"assets/js/",
        	"jquery": site_url+"assets/js/jquery-2.1.4.min",
            "bootstrap": site_url+ "assets/js/bootstrap.min",
            "select2": site_url+ "assets/js/select2.min",
         	"knockout": site_url+"assets/js/knockout-3.2.0",
         	"underscore": site_url+"assets/js/underscore",
//         	"papertlhp": site_url + "assets/js/paper-dashboard"
		}
	});
	requirejs(["jspath/kklhp"]);
</script> 

