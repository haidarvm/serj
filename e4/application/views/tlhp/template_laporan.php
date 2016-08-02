<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 custom-form">
				<div class="card">
					<div class="content">
					
					<div class="both-space t-right">
						<a class="btn btn-danger" href="<?=site_url()?>tlhp/template/daftarlap"><i class="fa fa-undo"></i> Kembali Daftar Laporan</a>
					</div>
						<form method="post" action="<?=site_url()?>tlhp/template/insert_template_laporan" class="form form-horizontal">
							<div class="row top-space">
								<div class="col-md-6">
									<fieldset>
										<div class="form-group">
											<label class="col-sm-3 control-label">Judul Laporan</label>
											<div class="col-sm-9">
												<input type="text" name="judul_laporan" class="form-control">
											</div>
										</div>
									</fieldset>

									<fieldset>
										<div class="form-group">
											<label class="col-sm-3 control-label">Nomor Laporan</label>
											<div class="col-sm-9">
												<input type="text" name="nomor_laporan" class="form-control">
											</div>
										</div>
									</fieldset>
									<fieldset>
										<div class="form-group">
											<label class="col-sm-3 control-label">Periode Laporan</label>
											<div class="col-sm-9">
												<input type="text" name="periode_laporan" class="form-control">
											</div>
										</div>
									</fieldset>
								</div>

								<div class="col-md-6">

									<fieldset>
										<div class="form-group">
											<label class="col-sm-3 control-label">Tanggal Laporan</label>
											<div class="col-sm-9">
												<div class="input-group">
													<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="tanggal_laporan" class="form-control border-input date-input-big datepicker" data-bind="datepicker: true, selectedDate: data.startTanggalLaporan" required="true">
												</div>
											</div>
										</div>
									</fieldset>
									<fieldset>
										<div class="form-group">
											<label for="exampleInputFile" class="col-sm-3 control-label">Upload Cover<star>*</star></label>
											<div class="col-sm-9">
												<input type="file" name="file" id="exampleInputFile">
											</div>
										</div>
									</fieldset>

								</div>

							</div>


							<div class="row top-space">
								<div class="col-md-12 top-space">
									<fieldset>
										<center>
											<b>KATA PENGANTAR</b>
										</center>
										<textarea name="kata_pengantar" id="summernote" height="500px"></textarea>
									</fieldset>
								</div>
								<div class="col-md-12 top-space">
									<fieldset>
										<center>
											<b>KATA PENGANTAR</b>
										</center>
										<textarea name="daftar_isi" id="summernote2" height="500px"></textarea>
									</fieldset>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12 t-center">
									<input type="submit" value="simpan" class="btn btn-wd btn-primary btn-fill btn-margin">
									<!-- <input type="reset" value="Reset" class="btn btn-wd btn-warning btn-margin"> -->
								</div>
							</div>
						</form>

						<div class="row">
							<div class="col-md-8">
								<!--.col-md-8-->
							</div>
							<div class="col-md-4">
								<button type="button" class="btn btn-wd btn-warning btn-fill btn-margin">
									<span class="btn-label"> <i aria-hidden="true" class="fa fa-file-pdf-o"></i>
									</span> EXPORT TO PDF
								</button>

								<button type="button" class="btn btn-wd btn-success btn-fill btn-margin">
									<span class="btn-label"> <i aria-hidden="true" class="fa fa-print"></i>
									</span> PRINT
								</button>
								<!-- <a href="#" onclick="window.print()" class="btn btn-warning btn-wd btn-margin"><span class="glyphicon glyphicon-print" aria-hidden="true"></span> Print </a>
								<a href="#" onclick="window.print()" class="btn btn-warning btn-wd btn-margin"><span class="glyphicon glyphicon-print" aria-hidden="true"></span> PDF </a> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	console.debug(site_url);
    requirejs.config({
        "shim": {
            "bootstrap": {"deps": ["jquery"]},
            "datetimepicker" : {deps: ["jquery", "moment"]},
            "summernote": {"deps": ["jquery"]}
        },
        "paths": {
            "jspath": site_url+ "assets/js/",
            "jquery": site_url+ "assets/js/jquery-2.1.4.min",
            "datetimepicker": site_url+ "assets/js/bootstrap-datetimepicker.min",
            "moment" : site_url+ "assets/js/moment.min",
            "bootstrap": site_url+ "assets/js/bootstrap.min",
            "summernote": site_url+ "assets/js/summernote",
        }
    });
    requirejs(["jspath/lhp", "jspath/template_laporan"]);
</script>

<script>
	console.debug(site_url);
    requirejs.config({
        "shim": {
            "bootstrap": {"deps": ["jquery"]},
            "datetimepicker" : {deps: ["jquery", "moment"]}
        },
        "paths": {
            "jspath": site_url+ "assets/js/",
            "jquery": site_url+ "assets/js/jquery-2.1.4.min",
            "knockout": site_url+ "assets/js/knockout-3.2.0",
            "datetimepicker": site_url+ "assets/js/bootstrap-datetimepicker.min",
            "moment" : site_url+ "assets/js/moment.min",
            "bootstrap": site_url+ "assets/js/bootstrap.min",
        }
    });
    requirejs(["jspath/lhp"]);
</script>

<script type="text/javascript">
     
     function printDiv(elementId) {
    var a = document.getElementById('print-area-2').value;
    var b = document.getElementById(elementId).innerHTML;
    window.frames["print_frame"].document.title = document.title;
    window.frames["print_frame"].document.body.innerHTML = '<style>' + a + '</style>' + b;
    window.frames["print_frame"].window.focus();
    window.frames["print_frame"].window.print();
}
</script>