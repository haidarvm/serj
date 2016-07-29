<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="header">
						<h4 class="title">
							<b>Data LHP</b>
						</h4>
						<!-- <p class="category">Last Campaign Performance</p> -->
					</div>
					<div class="content">
						<div class="table-responsive">
							<table class="table table-striped table-custom-head">
								<thead>
									<tr class="info">
										<td>No</td>
										<td>Judul LHP</td>
										<td>Nomor LHP</td>
										<td>Obyek Pengawasan</td>

										<td>Aksi</td>
									</tr>
								</thead>
								<tbody>
							<?php
							if (count($data_lhp) > 0) :
								$no = 1;
								foreach ( $data_lhp as $val ) :
									?>
								<tr>
										<td><?php echo $no++; ?></td>
										<td><?php echo $val->judul_lhp; ?></td>
										<td><?php echo $val->nomor_lhp; ?></td>
										<td><?php echo $val->objek_pengawasan; ?></td>


										<td><a class="btn btn-info circle-perfect" href="<?=site_url();?>tlhp/pilihlhp/get_lhp/<?=$val->lhp_id?>"> <i aria-hidden="true" class="fa fa-cogs"></i> <span class="sr-only">Edit</span>
										</a> <a class="btn btn-danger circle-perfect" href="#" onClick="return confirm('Apakah Anda Yakin ?')"> <i class="fa fa-trash-o" title="Delete" aria-hidden="true"></i> <span class="sr-only">Delete</span>
										</a></td>
									</tr>
							<?php
								endforeach
								;
							
						  endif;
							?>
							</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>