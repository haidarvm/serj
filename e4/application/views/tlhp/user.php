<form>
	<div class="row">
		<div class="col-md-5">
			<div class="form-group">
				<label>Username</label> <input type="text" class="form-control border-input" value="<?php echo isset($atlet) ? $atlet->email : '';?>">
			</div>
		</div>
		<div class="col-md-3">
			<div class="form-group">
				<label>NIP</label> <input type="text" class="form-control border-input" value="<?php echo isset($atlet) ? $atlet->email : '';?>">
			</div>
		</div>
		<div class="col-md-4">
			<div class="form-group">
				<label for="exampleInputEmail1">Jabatan</label> <input type="email" class="form-control border-input" value="<?php echo isset($atlet) ? $atlet->email : '';?>">
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<label>Full name</label> <input type="text" class="form-control border-input" value="<?php echo isset($atlet) ? $atlet->email : '';?>">
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-4">
			<div class="form-group">
				<label>Password</label> <input type="text" class="form-control border-input" value="<?php echo isset($atlet) ? $atlet->email : '';?>">
			</div>
		</div>
		<div class="col-md-4">
			<div class="form-group">
				<label>Unit Kerja</label> <input type="text" class="form-control border-input" value="<?php echo isset($atlet) ? $atlet->email : '';?>">
			</div>
		</div>
		<div class="col-md-4">
			<div class="form-group">
				<label>User Level</label> <input type="number" class="form-control border-input" value="<?php echo isset($atlet) ? $atlet->email : '';?>">
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<label>Address</label> <input type="text" class="form-control border-input" value="<?php echo isset($atlet) ? $atlet->email : '';?>">
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<label>Deskripsi</label>
				<textarea rows="5" class="form-control border-input">Oh so, your weak rhyme </textarea>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
</form>