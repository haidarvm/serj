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
							<table class="table table-striped table-custom-head lead-table">
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
									<tr>
										<td>1</td>
										<td>00</td>
										<td>00</td>
										<td>Lorem ipsum</td>
										<td>Lorem ipsum</td>
										<td><a class="btn btn-info circle-perfect" href="#"> <i aria-hidden="true" class="fa fa-cogs"></i> <span class="sr-only">Edit</span>
										</a></td>
										<td><a class="btn btn-danger circle-perfect" href="#"> <i class="fa fa-trash-o" title="Delete" aria-hidden="true"></i> <span class="sr-only">Delete</span>
										</a></td>
									</tr>
									<tr>
										<td>1</td>
										<td>00</td>
										<td>00</td>
										<td>Lorem ipsum</td>
										<td>Lorem ipsum</td>
										<td><a class="btn btn-info circle-perfect" href="#"> <i aria-hidden="true" class="fa fa-cogs"></i> <span class="sr-only">Delete</span>
										</a></td>
										<td><a class="btn btn-danger circle-perfect" href="#"> <i class="fa fa-trash-o" title="Delete" aria-hidden="true"></i> <span class="sr-only">Delete</span>
										</a></td>
									</tr>
									<tr>
										<td>1</td>
										<td>00</td>
										<td>00</td>
										<td>Lorem ipsum</td>
										<td>Lorem ipsum</td>
										<td><a class="btn btn-info circle-perfect" href="#"> <i aria-hidden="true" class="fa fa-cogs"></i> <span class="sr-only">Delete</span>
										</a></td>
										<td><a class="btn btn-danger circle-perfect" href="#"> <i class="fa fa-trash-o" title="Delete" aria-hidden="true"></i> <span class="sr-only">Delete</span>
										</a></td>
									</tr>
									<tr>
										<td>1</td>
										<td>00</td>
										<td>00</td>
										<td>Lorem ipsum</td>
										<td>Lorem ipsum</td>
										<td><a class="btn btn-info circle-perfect" href="#"> <i aria-hidden="true" class="fa fa-cogs"></i> <span class="sr-only">Delete</span>
										</a></td>
										<td><a class="btn btn-danger circle-perfect" href="#"> <i class="fa fa-trash-o" title="Delete" aria-hidden="true"></i> <span class="sr-only">Delete</span>
										</a></td>
									</tr>
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
								<?php foreach ( $rekomend as $value ) { ?>
								<tr>
										<td><?=$value->kode_rekomendasi;?></td>
										<td><?=$value->uraian_rekomendasi;?></td>
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
									<tr class="info">
										<th>KODE SEBEB GRUP</th>
										<th>KODE SEBAB</th>
										<th>URAIAN SEBAB</th>
										<th>EDIT</th>
										<th>HAPUS</th>
									</tr>
								</thead>
								<tbody>
							<?php foreach ($sebab as $value) {?>
								<tr>
										<td><?=$value->kode_sebab_group;?></td>
										<td><?=$value->kode_sebab;?></td>
										<td><?=$value->uraian_sebab;?></td>
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