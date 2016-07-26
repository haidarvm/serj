<form action="<?=site_url();?>tlhp/manus/add_user_prosess" method="post">
	<div class="row">
		<div class="col-md-5">
			<div class="form-group">
				<label>Username</label> <input name="username" type="text" class="form-control border-input" value="<?php echo isset($atlet) ? $atlet->username : '';?>">
			</div>
		</div>
		<div class="col-md-3">
			<div class="form-group">
				<label>NIP</label> <input name="nip" type="text" class="form-control border-input" value="<?php echo isset($atlet) ? $atlet->nip : '';?>">
			</div>
		</div>
		<div class="col-md-4">
			<div class="form-group">
				<label for="exampleInputEmail1">Jabatan</label> <input name="jabatan" type="text"  class="form-control border-input" value="<?php echo isset($atlet) ? $atlet->jabatan : '';?>">
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<label>Full name</label> <input name="full_name" type="text" class="form-control border-input" value="<?php echo isset($atlet) ? $atlet->full_name : '';?>">
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-4">
			<div class="form-group">
				<label>Password</label> <input name="password" type="password" class="form-control border-input" value="<?php echo isset($atlet) ? $atlet->password : '';?>">
			</div>
		</div>
		<div class="col-md-4">
			<div class="form-group">
				<label>Unit Kerja</label> <input name="unit_kerja_id" type="text" class="form-control border-input" value="<?php echo isset($atlet) ? $atlet->unit_kerja_id : '';?>">
			</div>
		</div>
		<div class="col-md-4">
			<div class="form-group">
				<label>User Level</label> <input name="user_level_id" type="number" class="form-control border-input" value="<?php echo isset($atlet) ? $atlet->user_level_id : '';?>">
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<label>Address</label> <input name="address" type="text" class="form-control border-input" value="<?php echo isset($atlet) ? $atlet->address : '';?>">
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<label>Deskripsi</label>
				<textarea name="description" rows="5" class="form-control border-input">Oh so, your weak rhyme </textarea>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">BATAL</button>
		<button type="submit" class="btn btn-primary">SIMPAN</button>
	</div>
	
</form>