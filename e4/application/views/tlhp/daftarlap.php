        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Daftar Template</h4>
                                <p class="category">List Template Laporan</p>
                            </div>

							<div class="content">
								<div class="table-responsive">
								  <table id="daftarlap_table" class="table table-striped table-custom-head">
									<thead>
										<tr class="info">
											<th>NO</th>
											<th>NOMOR LAP.</th>
											<th>PERIODE LAPORAN</th>
											<th>TANGGAL SIMPAN</th>
											<th>TANGGAL TERAKHIR CETAK</th>
											<th>JUDUL LAP.</th>
										</tr>
									</thead>
									<tbody>
										<tr>
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
									</tbody>
								  </table>
								</div>
							</div>
                              
							<div class="both-space t-right">
								<a class="btn btn-danger" href="#"><i class="fa fa-undo"></i> Kembali</a>
							</div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
<script>
    requirejs.config({
        "shim": {
            "bootstrap": {"deps": ["jquery"]}
        },
        "paths": {
            "jspath": site_url+"assets/js/",
            "jquery": site_url+"assets/js/jquery-2.1.4.min",
            "knockout": site_url+"assets/js/knockout-3.2.0",
            "bootstrap": site_url+"assets/js/bootstrap.min",
            "data-table": site_url+"assets/js/jquery.dataTables.min" 
        }
    });
    requirejs(["jspath/daftarlap"]);

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