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
						<div class="clr"></div>
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
							<button class="btn btn-primary user-modal" data-bind="event: {click: newUser}">
								<i class="fa fa-plus fa-lg"></i> Tambah User
							</button>
						</div>
						<!-- Modal Add / Edit User -->
						<div id="userModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="userModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="userModalLabel">User</h4>
									</div>
                                                                    <div class="modal-body modal-form">
                                                                        <?php $this->load->view('tlhp/user') ?>
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
<script>
    requirejs.config({
        "shim": {
            "bootstrap": {"deps": ["jquery"]},
    		"notify": {"deps": ["jquery"]}
        },
        "paths": {
            "jspath": site_url+"assets/js/",
            "jquery": site_url+"assets/js/jquery-2.1.4.min",
            "notify": site_url+"assets/js/notify.min",
            "knockout": site_url+"assets/js/knockout-3.2.0",
            "bootstrap": site_url+"assets/js/bootstrap.min",
            "data-table": site_url+"assets/js/jquery.dataTables.min" 
        }
    });
    requirejs(["jspath/manus"]);
</script>
