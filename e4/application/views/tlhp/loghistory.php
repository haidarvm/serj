        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">LOG HISTORY</h4>
                                <p class="category">List History</p>
                            </div>

							<div class="content">
								<div class="table-responsive">
								  <table id="tlhp_log_history_table" class="table table-striped table-custom-head">
									<thead>
										<tr class="info">
											<td>NO</td>
											<td>NAMA</td>
											<td>USERNAME</td>
											<td>JABATAN</td>
											<td>UNIT KERJA</td>
											<td>LAST LOGIN</td>
											<td>LAMA PENGGUNAAN</td>
										</tr>
									</thead>
									<tbody>
										<tr>
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
							
							<div class="t-center">
								<ul class="pagination"> 
									<li class="disabled"><a aria-label="Previous" href="#"><span aria-hidden="true">«</span></a></li> 
									<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li> 
									<li><a href="#">2</a></li> 
									<li><a href="#">3</a></li> 
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li> 
									<li><a aria-label="Next" href="#"><span aria-hidden="true">»</span></a></li> 
								</ul>
							</div>
                              
							<div class="both-space t-right">
								<a class="btn btn-info" href="#"><i class="fa fa-print"></i> Print</a>
								<a class="btn btn-success" href="#"><i class="fa fa-file-pdf-o"></i> PDF</a>
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
    requirejs(["jspath/loghistory"]);
</script>