<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12 col-md-7">
				<div class="card">
					<div class="content">
						<div class="table-responsive">
							<table id="kode_sebab" class="table table-striped table-custom-head">
								<thead>
									<tr class="info">
										<td>KODE SEBAB ID</td>
										<td>KODE SEBEB GRUP</td>
										<td>KODE SEBAB</td>
										<td>URAIAN SEBAB</td>
										<td>EDIT</td>
										<td>HAPUS</td>
									</tr>
								</thead>
								<tbody>
							<?php foreach ($sebab as $value) {?>
								<tr>
										<td><?=$value->kode_sebab_id;?></td>
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

