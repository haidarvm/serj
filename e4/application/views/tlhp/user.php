<!--  <form action="<?//=site_url();?>tlhp/manus/user_prosess" method="post"> -->
<form>
	<div class="row">
		<span data-bind="text: userNotif"></span>
	</div>
	<div class="row">
		<div class="col-md-5">
			<div class="form-group">
				<label>Username</label> 
				<input name="username" type="text" class="form-control border-input" value="<?=isset($user) ? $user->username : '';?>"  
				required="true" data-bind="value: data.userName">
			</div>
		</div>
		<div class="col-md-3">
			<div class="form-group">
				<label>NIP</label> 
				<input name="nip" type="text" class="form-control border-input" 
				value="<?=isset($user) ? $user->nip : '';?>"
				data-bind="value: data.accountNumber">
			</div>
		</div>
		<div class="col-md-4">
			<div class="form-group">
				<label for="exampleInputEmail1">Jabatan</label> 
				<input name="jabatan" type="text" class="form-control border-input" 
				value="<?=isset($user) ? $user->jabatan : '';?>"
				data-bind="value: data.accountPosition">
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<label>Full name</label> 
				<input name="full_name" type="text" class="form-control border-input" 
				value="<?=isset($user) ? $user->full_name : '';?>"  required="true" 
				data-bind="value: data.fullName">
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-4">
			<div class="form-group">
				<label>Password</label> 
				<input name="password" type="password" class="form-control border-input" 
				value="" <?php echo $action == 'add' ? 'required="true"' : ''?> 
				data-bind="value: data.password">
			</div>
		</div>
		<div class="col-md-4">
			<div class="form-group">
				<label>Ulangi Password</label> 
				<input name="re_password" type="password" class="form-control border-input" 
				value="" <?php echo $action == 'add' ? 'required="true"' : ''?> 
				data-bind="value: data.rePassword">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<div class="form-group">
				<label>Unit Kerja</label> 
				<select class="form-control" name="unit_kerja_id" required="true"
				data-bind="value: data.departement">
					<?php if ($getAllUnitKerja) {?>
					<?php  foreach($getAllUnitKerja as $unit) {?>
					<option value="<?=$unit->unit_kerja_id;?>" <?php if(!empty($user->unit_kerja_id)) echo $user->unit_kerja_id ==  $unit->unit_kerja_id ? 'selected' : '' ?>><?=$unit->unit_kerja;?></option>
					<?php } ?> 
					<?php }?>
				</select>
			</div>
		</div>
		<div class="col-md-4">
			<div class="form-group">
				<label>User Level</label> 
				<select class="form-control" name="user_level_id" required="true" data-bind="value: data.role">
					<?php if ($getAllLevel) {?>
					<?php  foreach($getAllLevel as $level) {?>
					<option value="<?=$level->user_level_id;?>" <?php if(!empty($user->user_level_id)) echo $user->user_level_id ==  $level->user_level_id ? 'selected' : '' ?>><?=$level->user_level;?></option>
					<?php } ?> 
					<?php }?>
				</select>
			</div>
		</div>
	</div>

	<br>
	<div class="clearfix"></div>

	<div class="modal-footer">
		<button type="button" class="btn btn-default btn-margin" data-dismiss="modal">BATAL</button>
		<button type="submit" id="save-manus" class="btn btn-primary btn-margin" data-bind="event: {click: doInsert}">SIMPAN</button>
		<input name="user_id" type="hidden" value="<?=isset($user) ? $user->user_id : '';?>">
	</div>

</form>