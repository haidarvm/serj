<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 custom-form">
				<div class="card">
					<div class="content">
						<div class="row">
						<?php
						$update = ! empty($action) == "update" ? true : false;
						?>
						<div class="both-space t-right">
								<a class="btn btn-danger" href="<?=site_url()?>tlhp/template/daftarlap"><i class="fa fa-undo"></i> Kembali Daftar Laporan</a>
							</div>
							<form id="template-laporan" method="post" action="<?php echo $action == "add" ? site_url().'tlhp/template/insert_template_laporan"' : site_url().'tlhp/template/update_laporan/'.$template->template_laporan_id?>" class="form form-horizontal">
								<div class="row top-space">
									<div class="col-md-6">
										<fieldset>
											<div class="form-group">
												<label class="col-sm-3 control-label">Judul Laporan</label>
												<div class="col-sm-8">
													<input type="text" name="judul_laporan" class="form-control" value="<?php echo !empty($template) ? $template->judul_laporan : "" ?>">
												</div>
											</div>
										</fieldset>

										<fieldset>
											<div class="form-group">
												<label class="col-sm-3 control-label">Nomor Laporan</label>
												<div class="col-sm-8">
													<input type="text" name="nomor_laporan" class="form-control" value="<?php echo !empty($template) ? $template->nomor_laporan : "" ?>">
												</div>
											</div>
										</fieldset>
										<fieldset>
											<div class="form-group">
												<label class="col-sm-3 control-label">Periode Laporan</label>
												<div class="col-sm-8">
													<input type="text" name="periode_laporan" class="form-control" value="<?php echo !empty($template) ? $template->periode_laporan : "" ?>">
												</div>
											</div>
										</fieldset>
									</div>

									<div class="col-md-6">
										<fieldset>
											<div class="form-group">
												<label class="col-sm-3 control-label">Tanggal Laporan</label>
												<div class="col-sm-8">
													<div class="input-group">
														<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span> <input type="text" name="tanggal_laporan" class="form-control border-input date-input-big datepicker" data-bind="datepicker: true, selectedDate: data.startTanggalLaporan" value="<?php echo !empty($template) ? indoDateFormat($template->tanggal_laporan) : "" ?>" required="true">
													</div>
												</div>
											</div>
										</fieldset>
										<?php if ($action == "update") {
												if($templateFiles->num_rows() > 0) {?>
										<fieldset>
											<div class="form-group">
												<label class="col-sm-3 control-label">Files</label>
												<div class="col-sm-8">
													<div class="input-group">
														<ul class="files list-inline">
															<?php foreach($templateFiles->result() as $file) {?>
																<li><a href="<?=site_url()?>tlhp/template/download_files/<?=$file->upload_template_id?>"><i aria-hidden="true" class="fa fa-file-image-o"></i> <?php echo $file->file_name?></a></li>
															<?php } ?>
														</ul>
													</div>
												</div>
											</div>
										</fieldset>
										<?php }
										}?>
										<fieldset>
											<div class="form-group">
												<label for="exampleInputFile" class="col-sm-3 control-label">Upload Cover<star>*</star></label>
												<div class="col-sm-8">
													<!-- <input type="file" name="file" id="exampleInputFile"> -->
													<div style="padding: 10px;">
														<span class="btn btn-success fileinput-button"> <i class="glyphicon glyphicon-plus"></i> <span>Select files...</span> <input id="fileupload" type="file" name="files[]" multiple>
														</span> <br>
														<div id="progress" class="progress" style="margin-top: 10px;">
															<div class="progress-bar progress-bar-success"></div>
														</div>
														<div id="files" class="files"></div>
														<br>
													</div>
												</div>
											</div>
										</fieldset>
									</div>

								</div>


								<div class="row top-space">
									<div class="col-md-12 top-space">
										<div class="col-md-12">
											<fieldset>
												<center>
													<b>KATA PENGANTAR</b>
												</center>
												<textarea name="kata_pengantar" id="summernote"><?php echo !empty($template) ? $template->kata_pengantar : "" ?></textarea>
											</fieldset>
										</div>
									</div>
									<!-- <div class="col-md-12 top-space">
									<fieldset>
										<center>
											<b>KATA PENGANTAR</b>
										</center>
										<textarea name="daftar_isi" id="summernote2" height="500px"></textarea>
									</fieldset>
								</div> -->
								</div>
							<?php !empty($template) ? '<input name="template_laporan_id" type="hidden" value="'.$template->template_laporan_id. '" >"' : "" ;?>

							<div class="row">
									<div class="col-md-12 t-center">
										<input type="submit" value="simpan" class="btn btn-wd btn-primary btn-fill btn-margin">
										<!-- <input type="reset" value="Reset" class="btn btn-wd btn-warning btn-margin"> -->
									</div>
								</div>
							</form>

							<div class="row">
								<div class="col-md-8">
									<!--.col-md-8-->
								</div>
							<?php if(!empty($template)) {?>
							<div class="col-md-4">
									<button type="button" class="btn btn-wd btn-warning btn-fill btn-margin">
										<span class="btn-label"> <i aria-hidden="true" class="fa fa-file-pdf-o"></i>
										</span> EXPORT TO PDF
									</button>

									<button type="button" class="btn btn-wd btn-success btn-fill btn-margin">
										<span class="btn-label"> <i aria-hidden="true" class="fa fa-print"></i>
										</span> PRINT
									</button>
								</div>
							<?php }?>
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
            "datetimepicker" : {deps: ["jquery", "moment"]},
            "summernote": {"deps": ["jquery"]}
        },
        "paths": {
            "jspath": site_url+ "assets/js/",
            "jquery": site_url+ "assets/js/jquery-2.1.4.min",
            "knockout": site_url+ "assets/js/knockout-3.2.0",
            "datetimepicker": site_url+ "assets/js/bootstrap-datetimepicker.min",
            "moment" : site_url+ "assets/js/moment.min",
            "bootstrap": site_url+ "assets/js/bootstrap.min",
            "summernote": site_url+ "assets/js/summernote",
            "ui.widget": site_url+ "assets/js/jquery.ui.widget",
            "iframe.transport": site_url+ "assets/js/jquery.iframe-transport",
            "fileupload": site_url+ "assets/js/jquery.fileupload",
            "fileupload-image": site_url+ "assets/js/jquery.fileupload-image",
            "fileupload-ui": site_url+ "assets/js/jquery.fileupload-ui"
        }
    });
    requirejs(["jspath/lhp", "jspath/template_laporan"]);
</script>