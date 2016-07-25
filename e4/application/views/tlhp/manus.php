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
						<table class="table table-striped t-center table-custom-head">
							<thead>
								<tr class="info">
									<td>No</td>
									<td>Nama</td>
									<td>NIP</td>
									<td>Jabatan</td>
									<td>Username</td>
									<td>Password</td>
									<td>Unit Kerja</td>
									<td>Status</td>
									<td>Edit</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Devi Anantha</td>
									<td>1963032</td>
									<td>INSPEKTUR</td>
									<td>DEVI.ANANTHA</td>
									<td>DEVI1963</td>
									<td><select name="jabatan">
											<option>DEPUTI I</option>
											<option>DEPUTI II</option>
											<option>DEPUTI III</option>
											<option>DEPUTI IV</option>
											<option>STAF AHLI</option>
											<option>INSPEKTORAT</option>
											<option>BIRO SDMU</option>
											<option>BIRO HUKIP</option>
											<option>BIRO BMOK</option>
											<option>KASN</option>
									</select></td>
									<td><select name="status">
											<option>Super Admin</option>
											<option>Admin</option>
											<option>User</option>
									</select></td>
									<td><a class="btn btn-default circle-perfect" href="#"> <i class="ti-pencil-alt" title="Edit" aria-hidden="true"></i> <span class="sr-only">Settings</span>
									</a> <a class="btn btn-danger circle-perfect" href="#"> <i class="fa fa-trash-o" title="Delete" aria-hidden="true"></i> <span class="sr-only">Delete</span>
									</a></td>
								</tr>

								<tr>
									<td>2</td>
									<td>Devi Anantha</td>
									<td>1963032</td>
									<td>INSPEKTUR</td>
									<td>DEVI.ANANTHA</td>
									<td>DEVI1963</td>
									<td><select name="jabatan">
											<option>DEPUTI I</option>
											<option>DEPUTI II</option>
											<option>DEPUTI III</option>
											<option>DEPUTI IV</option>
											<option>STAF AHLI</option>
											<option>INSPEKTORAT</option>
											<option>BIRO SDMU</option>
											<option>BIRO HUKIP</option>
											<option>BIRO BMOK</option>
											<option>KASN</option>
									</select></td>
									<td><select name="status">
											<option>Super Admin</option>
											<option>Admin</option>
											<option>User</option>
									</select></td>
									<td><a class="btn btn-default circle-perfect" href="#"> <i class="ti-pencil-alt" title="Settings" aria-hidden="true"></i> <span class="sr-only">Settings</span>
									</a> <a class="btn btn-danger circle-perfect" href="#"> <i class="fa fa-trash-o" title="Delete" aria-hidden="true"></i> <span class="sr-only">Delete</span>
									</a></td>
								</tr>

								<tr>
									<td>3</td>
									<td>Devi Anantha</td>
									<td>1963032</td>
									<td>INSPEKTUR</td>
									<td>DEVI.ANANTHA</td>
									<td>DEVI1963</td>
									<td><select name="jabatan">
											<option>DEPUTI I</option>
											<option>DEPUTI II</option>
											<option>DEPUTI III</option>
											<option>DEPUTI IV</option>
											<option>STAF AHLI</option>
											<option>INSPEKTORAT</option>
											<option>BIRO SDMU</option>
											<option>BIRO HUKIP</option>
											<option>BIRO BMOK</option>
											<option>KASN</option>
									</select></td>
									<td><select name="status">
											<option>Super Admin</option>
											<option>Admin</option>
											<option>User</option>
									</select></td>
									<td><a class="btn btn-default circle-perfect" href="#"> <i class="ti-pencil-alt" title="Settings" aria-hidden="true"></i> <span class="sr-only">Settings</span>
									</a> <a class="btn btn-danger circle-perfect" href="#"> <i class="fa fa-trash-o" title="Delete" aria-hidden="true"></i> <span class="sr-only">Delete</span>
									</a></td>
								</tr>

								<tr>
									<td>4</td>
									<td>Devi Anantha</td>
									<td>1963032</td>
									<td>INSPEKTUR</td>
									<td>DEVI.ANANTHA</td>
									<td>DEVI1963</td>
									<td><select name="jabatan">
											<option>DEPUTI I</option>
											<option>DEPUTI II</option>
											<option>DEPUTI III</option>
											<option>DEPUTI IV</option>
											<option>STAF AHLI</option>
											<option>INSPEKTORAT</option>
											<option>BIRO SDMU</option>
											<option>BIRO HUKIP</option>
											<option>BIRO BMOK</option>
											<option>KASN</option>
									</select></td>
									<td><select name="status">
											<option>Super Admin</option>
											<option>Admin</option>
											<option>User</option>
									</select></td>
									<td><a class="btn btn-default circle-perfect" href="#"> <i class="ti-pencil-alt" title="Settings" aria-hidden="true"></i> <span class="sr-only">Settings</span>
									</a> <a class="btn btn-danger circle-perfect" href="#"> <i class="fa fa-trash-o" title="Delete" aria-hidden="true"></i> <span class="sr-only">Delete</span>
									</a></td>
								</tr>
						
						</table>
						<!-- Data Table -->
						<table id="manus-grid" class="table table-striped t-center table-custom-head top-space" width="100%">
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
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
								<i class="fa fa-plus fa-lg"></i> Tambah User
							</button>
							<a class="btn btn-success" href="#"><i class="fa fa-save"></i> Simpan</a> <a class="btn btn-danger" href="#"><i class="fa fa-ban"></i> Batal</a>
						</div>

						<div id="exampleModal" class="modal modal-wide fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="exampleModalLabel">New User</h4>
									</div>
									<div class="modal-body">
										<div class="container col-md-12">
											<div class="row">
												<div class="col-md-3">
													<p>1st col 3</p>
												</div>
												<div class="col-md-3">
													<p>2nd col 3</p>
												</div>
												<div class="col-md-3">
													<p>3rd col 3</p>
												</div>
												<div class="col-md-3">
													<p>4th col 3</p>
												</div>
											</div>
										</div>
										<form>
											<div class="form-group">
												<label for="recipient-name" class="control-label">Nama:</label> <input type="text" class="form-control" id="recipient-name">
											</div>
											<div class="form-group">
												<label for="recipient-name" class="control-label">NIP:</label> <input type="text" class="form-control" id="recipient-name">
											</div>
											<div class="form-group">
												<label for="recipient-name" class="control-label">Jabatan:</label> <input type="text" class="form-control" id="recipient-name">
											</div>
											<div class="form-group">
												<label for="recipient-name" class="control-label">Username:</label> <input type="text" class="form-control" id="recipient-name">
											</div>
											<div class="form-group">
												<label for="recipient-name" class="control-label">Password:</label> <input type="text" class="form-control" id="recipient-name">
											</div>
											<div class="form-group">
												<label for="recipient-name" class="control-label">Unit Kerja:</label> <input type="text" class="form-control" id="recipient-name">
											</div>
											<div class="form-group">
												<label for="recipient-name" class="control-label">Status:</label> <input type="text" class="form-control" id="recipient-name">
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary">Send message</button>
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
