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
						<table id="manus-grid" class="table table-striped table-custom-head t-grid" width="100%">
							<thead>
								<tr class="info">
									<th class="tsort" width="5%">ID</th>
									<th class="tsort" width="15%">Nama</th>
									<th class="tsort" width="15%">NIP</th>
									<th class="tsort" width="10%">Jabatan</th>
									<th class="tsort" width="10%">Username</th>
									<th class="tsort" width="15%">Unit Kerja</th>
									<th class="tsort" width="10%">Status</th>
									<th class="tsort" width="20%">Action</th>
								</tr>
							</thead>
						</table>

						<div class="table-action">
							<button class="btn btn-primary user-modal" data-bind="event: {click: newUser}">
								<i class="fa fa-plus fa-lg"></i> Tambah User
							</button>
							<a  href="<?php echo site_url()?>tlhp/manus/inactive" class="btn btn-danger">
								<i class="fa fa-edit fa-lg"></i> Aktifasi User
							</a>
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
//	function doEdit(id) {
//		var insert = {
//		}
//	}
    requirejs.config({
        "shim": {
            "bootstrap": {"deps": ["jquery"]},
    		"notify": {"deps": ["jquery"]},
//    		"papertlhp" : {"deps": ["jquery","bootstrap"]},
        },
        "paths": {
            "jspath": site_url+"assets/js/",
            "jquery": site_url+"assets/js/jquery-2.1.4.min",
            "notify": site_url+"assets/js/notify.min",
            "knockout": site_url+"assets/js/knockout-3.2.0",
            "bootstrap": site_url+"assets/js/bootstrap.min",
            "data-table": site_url+"assets/js/jquery.dataTables.min" ,
//            "papertlhp": site_url + "assets/js/paper-dashboard"
        }
    });
    requirejs(["jspath/manus"]);
</script>
