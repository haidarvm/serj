<!--  <script type="text/javascript">
//var $table = $('#kode_sebab');
//$table.floatThead({
//    scrollContainer: function($table){
//        return $table.closest('.scrolling-table');
//    }
//});
<!--</script>-->

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="header">
						<h4 class="title">
							<b>KODE ATRIBUT TEMUAN</b>
						</h4>
						<!-- <p class="category">Last Campaign Performance</p> -->
					</div>
					<div class="content">
						<div class="table-responsive">
							<table id="kode_temuan" class="table table-striped table-custom-head lead-table">
								<thead>
									<tr class="info">
										<th>KEL</th>
										<th>SUB KEL</th>
										<th>JENIS</th>
										<th>DESKRIPSI</th>
										<th>ALT REKOM</th>
										<th>EDIT</th>
										<th>HAPUS</th>
									</tr>
								</thead>
								<tbody>
									<?php foreach ( $getAllTemuan as $temuan ) { ?>
								<tr>
										<td><?=$temuan->kelompok;?></td>
										<td><?=$temuan->sub_kelompok;?></td>
										<td><?=$temuan->jenis;?></td>
										<td><?=$temuan->kode_temuan;?></td>
										<td><?=$temuan->alt_rekom;?></td>
										<td><a class="btn btn-info circle-perfect" href="#"> <i aria-hidden="true" class="fa fa-cogs"></i> <span class="sr-only">Edit</span>
										</a></td>
										<td><a class="btn btn-danger circle-perfect" href="#"> <i class="fa fa-trash-o" title="Delete" aria-hidden="true"></i> <span class="sr-only">Delete</span>
										</a></td>
									</tr>
								<?php } ?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="header">
						<h4 class="title">
							<b>KODE ATRIBUT REKOMENDASI</b>
						</h4>
						<!-- <p class="category">Last Campaign Performance</p> -->
					</div>
					<div class="content">
						<div class="table-responsive scrolling-table">
							<table id="kode_rekomendasi" class="table table-striped table-custom-head">
								<thead>
									<tr class="info">
										<th>KODE REKOMENDASI</th>
										<th>URAIAN REKOMENDASI</th>
										<th>EDIT</th>
										<th>HAPUS</th>
									</tr>
								</thead>
								<tbody>
								<?php foreach ( $getAllRekomen as $rekomen ) { ?>
								<tr>
										<td><?=$rekomen->kode_rekomendasi;?></td>
										<td><?=$rekomen->uraian_rekomendasi;?></td>
										<td><a class="btn btn-info circle-perfect" href="#"> <i aria-hidden="true" class="fa fa-cogs"></i> <span class="sr-only">Edit</span>
										</a></td>
										<td><a class="btn btn-danger circle-perfect" href="#"> <i class="fa fa-trash-o" title="Delete" aria-hidden="true"></i> <span class="sr-only">Delete</span>
										</a></td>
									</tr>
								<?php } ?>
							</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="header">
						<h4 class="title">
							<b>KODE ATRIBUT SEBAB</b>
						</h4>
						<!-- <p class="category">Last Campaign Performance</p> -->
					</div>
					<div class="content">
						<div class="table-responsive scrolling-table">
							<table id="kode_sebab" class="table table-striped table-custom-head">
								<thead>
									<tr id="header-row" class="info">
										<th>KODE SEBEB GRUP</th>
										<th>KODE SEBAB</th>
										<th>URAIAN SEBAB</th>
										<th>EDIT</th>
										<th>HAPUS</th>
									</tr>
								</thead>
								<tbody>
							<?php foreach ($getAllSebab as $sebab) {?>
								<tr>
										<td><?=$sebab->kode_sebab_group;?></td>
										<td><?=$sebab->kode_sebab;?></td>
										<td><?=$sebab->uraian_sebab;?></td>
										<td><a class="btn btn-info circle-perfect" href="#"> <i aria-hidden="true" class="fa fa-cogs"></i> <span class="sr-only">Edit</span>
										</a></td>
										<td><a class="btn btn-danger circle-perfect" href="#"> <i class="fa fa-trash-o" title="Delete" aria-hidden="true"></i> <span class="sr-only">Delete</span>
										</a></td>
									</tr>
							<?php } ?>
							</tbody>
							</table>
						</div>
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
requirejs(["jspath/kodefikasi"]);
</script>