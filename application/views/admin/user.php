<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Insert User <small>it all starts here</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="<?php echo site_url();?>admin/user/"><i class="fa fa-group"></i> User</a></li>
			<li class="active"><i class="fa fa-plus"></i> Insert</li>
			<li><a href="javascript:history.go(-1)" class="btn bg-purple btn-flat"><i class="fa fa-arrow-left"></i> Back</a></li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">

		<!-- Quick New Category -->
		<div class="box box-info" id="quick-user-box">
			<div class="box-header">
				<i class="fa fa-plus"></i>
				<h3 class="box-title">New User</h3>
				<!-- tools box -->
				<!-- /. tools -->
			</div>
			<div class="box-body">
          `			<?php if($action=='insert') {?>
						<form action="<?php echo site_url();?>admin/user/insert" class="form-horizontal" id="validation-reg" method="post" role="form">
						<?php } else {?>
						<form action="<?php echo site_url();?>admin/user/update/<?php echo !empty($user) ? $user->user_id : "";?>"
						class="form-horizontal" method="post">
						<?php  } ?>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="name">Username</label>
							<div class="col-sm-10">
								<input id="username" name="username" class="form-control"
									value="<?php echo isset($user) ? $user->username : '';?>"
									type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="name">Full Name</label>
							<div class="col-sm-10">
								<input id="full_name" name="full_name" class="form-control"
									value="<?php echo isset($user) ? $user->full_name : '';?>"
									type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="name">Password</label>
							<div class="col-sm-10">
								<input id="password" name="password" class="form-control"
									value="<?php //echo isset($user) ? $user->last_name : '';?>"
									type="password">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="name">Confirmation
								Password</label>
							<div class="col-sm-10">
								<input id="re_password" name="re_password" class="form-control"
									value="<?php //echo isset($user) ? $user->last_name : '';?>"
									type="password">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" for="name">Email</label>
							<div class="col-sm-10">
								<input id="email" name="email" class="form-control"
									value="<?php echo isset($user) ? $user->email : '';?>"
									type="text">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" for="name">Phone</label>
							<div class="col-sm-10">
								<input id="phone" name="phone" class="form-control"
									value="<?php echo isset($user) ? $user->phone : '';?>"
									type="text">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" for="name">Level</label>
							<div class="col-sm-10">
								<select name="level_id" class="form-control">
									<option value="1">Admin</option>
									<option value="2">Operator</option>
									</option>
								</select>
							</div>
						</div>
			
			</div>
			<div class="box-footer clearfix">
				<input type="hidden" name="user_id" id="user_id" value="<?php echo !empty($user) ? $user->user_id : "";?>">
				<input class="pull-right btn btn-default" name="form" value="Submit" type="submit"> 
				</form>
			</div>
		</div>

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

