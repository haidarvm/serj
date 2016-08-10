<div class="content">
	<!-- form tindak lajut -->
	<div id="formTindakLanjut" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="userModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="userModalLabel">Tambah Tindak Lanjut</h4>
				</div>
	            <div class="modal-body modal-form" role="form">
	            	<div class="row">
	            		<div class="col-lg-9">
			                <form class="form-horizontal">
			                	<label for="rekomendasi">Rekomendasi</label>
			                	<textarea name="rekomendasi" class="form-control" 
			                	data-bind="value: dataTindakLanjut.uraianRekomendasi" disabled="disabled"></textarea>
			                	
		                		<label for="tindakLanjut">Tindak Lanjut</label>
		    					<textarea name="tindakLanjut" class="form-control" 
		    					data-bind="value: dataTindakLanjut.uraianTindakLanjut"></textarea>
		    					
		                		<label for="rekomendasi">Nilai</label>
		    					<input type="text" class="form-control" data-bind="priceformat: true, 
		    					value: dataTindakLanjut.uiJumlahTl, originalNumber: dataTindakLanjut.jumlahTl"/>
			                		
		                		<label for="dokumen">Dokumen</label>
		    					<input type="file"/>
			                	
		                		<label for="rekomendasi">Tanggal</label>
		    					<input type="text" class="form-control"
		    					data-bind="datepicker: true, selectedDate: dataTindakLanjut.tanggalTl, value: dataTindakLanjut.tanggalTl"
		    					class="datepicker"/>
			                </form>
	            		</div>
	            	</div>
	            </div>
	            <div class="modal-footer">
		        	<button type="button" class="btn btn-default" data-dismiss="modal">Keluar</button>
		        	<button type="button" class="btn btn-primary" data-bind="event: {click: insertTindakLanjut}">Simpan</button>
		      </div>
			</div>
		</div>
	</div><!-- end form tindak lanjut -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12 col-md-7">
				<div class="card">
					<div class="header">
						<h4 class="title">MATRIKS PEMANTAUAN TINDAK LANJUT</h4>
						<p class="category">Hasil <?php echo isset($lhp->judul_lhp) ? ucfirst($lhp->judul_lhp) : "undefined"; ?></p>
						<p class="category">Pada <?php echo isset($lhp->objek_pengawasan) ? ucfirst($lhp->objek_pengawasan) : "undefined"; ?></p>
					</div>
					<!-- these are very importan, be carefull dont rename them -->
					<input type="hidden" id="action" value="<?php echo isset($action) ? $action : null; ?>"/>
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
											<th class="success">NAMA PPK</th>
											<th class="success">NAMA PJ</th>
											<th class="success">PERIODE TINDAK LANJUT</th>
											<th class="success">TINDAK LANJUT</th>
											<th class="success">DOKUMEN PENDUKUNG</th>
											<th class="success">JUMLAH</th>
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
												
												<button type="button" class="ngurang" data-bind="visible: !isFirstRow(), 
												event: {click: $parent.removeRow}">
													<i aria-hidden="true" class="fa fa-minus"></i>
												</button>
											</td>
											<td>
												<select class="form-control select-simple border-input"
												data-bind="kodeTemuan: true, value: data.kodeTemuanId, 
												uiKodeTemuan: uiKodeTemuan">
												</select>
											</td>
											<td>
												<!-- uraian temuan -->
												<textarea class="form-control border-input" data-bind="value: data.uraianTemuan">
												</textarea>
											</td>
											<td>
												<select class="form-control select-simple border-input"
												data-bind="kodeSebab: true, value: data.kodeSebabId, 
												uiKodeSebab: uiKodeSebab, uraianSebab: data.uraianSebab">
												</select>
											</td>
											<td>
												<!-- uraian sebab -->
												<textarea class="form-control border-input" data-bind="value: data.uraianSebab" disabled="disabled">
												</textarea>
											</td>
											<td>
												<!-- nilai -->
												<input type="text" class="form-control border-input" 
												data-bind="priceformat: true, value: uiNilaiTemuan, originalNumber: data.nilaiTemuan" style="width: 200px"/>
											</td>
											<!-- Rekomendasi -->
											<td>
												<button type="button" class="tambah" data-bind="event: {click: addRow}">
													<i aria-hidden="true" class="fa fa-plus"></i>
												</button>
											</td>
											<td>
												<select class="form-control select-simple border-input"
												data-bind="kodeRekomendasi: true, value: data.firstKodeRekomendasiId, 
												uiKodeRekomendasi: uiFirstKodeRekomendasi">  
												</select>
											</td>
											<td>
												<!-- uraian rekomendasi -->
												<textarea class="form-control border-input" data-bind="value: data.firstUraianRekomendasi">
												</textarea>
												<a href="#" class="add-case" data-toggle="modal" data-bind="event: {click: $root.addTindakLanjutFirstLine}">
													Tambah Tindak Lanjut
												</a>
											</td>
											<td>
												<input type="checkbox" data-bind="checked: data.firstKerugianNegaraCbk"/>
											</td>
											<td>
												<!-- nilai -->
<!--												<textarea class="form-control border-input" value="value: data.firstNilaiRekomendasi">-->
<!--												</textarea>-->
												<input type="text" class="form-control border-input" 
												data-bind="priceformat: true, value: uiFirstNilaiRekomendasi, originalNumber: data.firstNilaiRekomendasi, 
												enable: data.firtsNilaiRekomendasiEnable" 
												style="width: 200px"/>
											</td>
											<td>
												<select class="form-control select-simple border-input" 
												data-bind="options: $root.unitKerja, optionsText: 'unit_kerja', value: data.firstUnitKerja">
												</select>
											</td>
											<td>
												<!-- nama ppk -->
												<input type="text" class="form-control border-input" data-bind="value: data.firstNamaPpk"
												style="width: 200px;"/>
											</td>
											<td>
												<!-- nama pj -->
												<input type="text" class="form-control border-input" data-bind="value: data.firstNamaPj"
												style="width: 200px;"/>
											</td>
											<td>
												<!-- periode tindak lanjut -->
												<span></span>
											</td>
											<td>
												<!-- uraian tindak lanjut -->
												<span data-bind="text: data.firstUraianTindakLanjut">[uraian tindak lanjut]</span>
											</td>
											<td>
												<!-- dokument pendukung -->
											</td>
											<td>
												<!-- nilai -->
												<span data-bind="text: uiFirstJumlahTl">[nilai dari tindak lanjut]</span>
											</td>
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
												data-bind="kodeRekomendasi: true, value: data.kodeRekomendasiId, 
												uiKodeRekomendasi: uiKodeRekomendasi">
												</select>
											</td>
											<td>
												<!-- uraian rekomendasi -->
												<textarea class="form-control border-input" data-bind="value: data.uraianRekomendasi">
												</textarea>
												<a href="#" class="add-case" data-toggle="modal" data-bind="event: {click: $root.addTindakLanjut}">
													Tambah Tindak Lanjut
												</a>
											</td>
											<td>
												<!-- kerugian negara -->
												<input type="checkbox" data-bind="checked: data.kerugianNegaraCbk"/>
											</td>
											<td>
												<!-- nilai -->
												<input type="text" class="form-control border-input" 
												data-bind="priceformat: true, value: uiNilaiRekomendasi, originalNumber: data.nilaiRekomendasi, 
												enable: data.nilaiRekomendasiEnable"/>
											</td>
											<td>
												<select class="form-control" data-bind="options: $root.unitKerja, 
												optionsText: 'unit_kerja', value: data.unitKerja">
												</select>
											</td>
											<td>
												<!-- nama ppk -->
												<input type="text" class="form-control border-input" 
												data-bind="value: data.namaPpk"/>
											</td>
											<td>
												<!-- nama pj -->
												<input type="text" class="form-control border-input" 
												data-bind="value: data.namaPj"/>
											</td>
											<td>
												<!-- periode tindak lanjut -->
												<span></span>
											</td>
											<td>
												<!-- uraian tindak lanjut -->
												<span data-bind="text: data.uraianTindakLanjut">[uraian tindak lanjut]</span>
											</td>
											<td>
												<!-- dokument pendukung -->
											</td>
											<td>
												<!-- nilai -->
												<span data-bind="text: uiJumlahTl">[nilai dari tindak lanjut]</span>
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
								<button type="submit" id="save-to-excel" class="btn btn-wd btn-info btn-fill btn-margin">
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
            "select2" : {deps: ["jquery"]},
            "datetimepicker" : {deps: ["jquery", "moment"]},
            "datebindinghandler": {deps: ["jquery", "knockout", "moment", "bootstrap", "datetimepicker"]},
            "jquerypriceformat": {deps: ["jquery"]}
		},
		"paths": {
			"jspath": site_url+"assets/js/",
        	"jquery": site_url+"assets/js/jquery-2.1.4.min",
            "bootstrap": site_url+ "assets/js/bootstrap.min",
            "select2": site_url+ "assets/js/select2.min",
         	"knockout": site_url+"assets/js/knockout-3.2.0",
         	"underscore": site_url+"assets/js/underscore",
         	"accounting": site_url+"assets/js/accounting.min",
         	"datebindinghandler": site_url+"assets/js/datebindinghandler",
         	"datetimepicker": site_url+ "assets/js/bootstrap-datetimepicker.min",
            "moment" : site_url+ "assets/js/moment.min",
            "jquerypriceformat" : site_url+ "assets/js/jquery.price_format.2.0.min",
//         	"papertlhp": site_url + "assets/js/paper-dashboard"
		}
	});
	requirejs(["jspath/kklhp", "jspath/datebindinghandler"]);
</script> 

