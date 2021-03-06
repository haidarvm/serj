
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
										<th>FILES</th>
										<th>EDIT</th>
<!-- 										<th>DELETE</th> -->
									</tr>
								</thead>
								<tbody>
									<?php
									$i = 1;
									foreach ( $getAllTemplate->result() as $template ) {
										?>
									<tr>
										<td><?=$i++?></td>
										<td><?=$template->nomor_laporan;?></td>
										<td><?=$template->periode_laporan;?></td>
										<td><?=$template->create_date;?></td>
										<td><?=$template->tanggal_laporan;?></td>
										<td><?=$template->judul_laporan;?></td>
										<td>
											<?php if (!empty($template->upload_template_id) ) {?>
											<a data-id="<?=$template->template_laporan_id;?>" class="btn btn-warning circle-perfect showfileListModal" href="javascript:;" > <i aria-hidden="true" class="fa fa-file-o" style="margin-top:6px;"></i> <span class="sr-only">Show Files</span></a>
											<?php }?>
										</td>
										<td><a class="btn btn-info circle-perfect" href="<?=site_url()?>tlhp/template/update_laporan/<?=$template->template_laporan_id?>"> <i aria-hidden="true" class="fa fa-cogs"></i> <span class="sr-only">Edit</span>
										</a></td>
<!-- 										<td><a class="btn btn-danger circle-perfect" href="#"> <i class="fa fa-trash-o" title="Delete" aria-hidden="true"></i> <span class="sr-only">Delete</span> -->
<!-- 										</a></td> -->
									</tr>
									<?php } ?>
								</tbody>
							</table>
						</div>
					</div>
					<div class="both-space t-left">
						<a class="btn btn-success" href="<?=site_url()?>tlhp/template/laporan"><i class="fa fa-plus"></i> Tambah Laporan</a>
					</div>
					<div class="both-space t-right">
						<a class="btn btn-danger" href="<?=site_url()?>tlhp/template/laporan"><i class="fa fa-undo"></i> Kembali</a>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>

<div id="fileListModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="fileListModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="fileListModal">List File</h4>
			</div>
			<div class="modal-body modal-form">
				<div id="fileListContainer"></div>
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
</script>
