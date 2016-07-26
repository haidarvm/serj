<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="header">
						<h4 class="title">Management User</h4>
						<p class="category">List User</p>
					</div>
					<div class="content table-responsive">
						<!-- Data Table -->
						<table id="manus-grid" class="table table-striped t-center table-custom-head t-grid" width="100%">
							<thead>
								<tr class="info">
									<td class="tsort">ID</td>
									<td class="tsort">Nama</td>
									<td class="tsort">NIP</td>
									<td class="tsort">Jabatan</td>
									<td class="tsort">Username</td>
									<td class="tsort">Unit Kerja</td>
									<td class="tsort">Status</td>
									<td class="tsort">Action</td>
								</tr>
							</thead>
						</table>

						<div class="table-action">
							<a href="<?php echo site_url();?>tlhp/manus/add_user" class="btn btn-primary user-modal"><i class="fa fa-plus fa-lg"></i> Tambah User</a>
						</div>

						<div id="userModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="userModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="userModalLabel">User</h4>
									</div>
									<div class="modal-body modal-form"></div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">BATAL</button>
										<button type="button" class="btn btn-primary">SIMPAN</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
