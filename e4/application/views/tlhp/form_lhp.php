<form class="form-horizontal">
	<input type="hidden" id="lhp_id" value="<?php echo isset($lhp->lhp_id) ? $lhp->lhp_id : null; ?>"/>
	<div class="row">
		<div class="col-md-4">
			<div class="form-group">
				<div class="col-sm-10">
					<label for="inputEmail3" class="control-label t-left">NOMOR SURAT TUGAS<star>*</star></label> 
					<input type="text" name="no_surat_tugas" class="form-control border-input" 
					data-bind="value: data.noSuratTugas"/>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-10">
					<div class="form_datetime">
						<label for="inputEmail3" class="control-label t-left">TANGGAL SURAT TUGAS<star>*</star></label>
						<div class="input-group">
							<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span> 
							<input type="text" name="tanggal_surat_tugas" class="form-control border-input date-input-big datepicker" 
							data-bind="datepicker: true, selectedDate: data.tglSuratTugas, value: data.tglSuratTugas"/>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<label for="inputEmail3" class="control-label t-left">HARI PENUGASAN<star>*</star></label>
					<div class="row input-daterange">
						<div class="col-md-6">
							<div class=" l-float input-group">
								<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span> 
								<input type="text" name="hari_awal_penugasan" class="form-control border-input date-input datepicker" 
								data-bind="datepicker: true, selectedDate: data.startHariPenugasan, value: data.startHariPenugasan"/>
							</div>
						</div>
						<div class="col-md-6">
							<div class=" l-float input-group">
								<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span> 
								<input type="text" name="hari_akhir_penugasan" class="form-control border-input date-input datepicker" 
								data-bind="datepicker: true, selectedDate: data.endHariPenugasan, value: data.endHariPenugasan"/>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<label for="inputEmail3" class="control-label t-left">SKOP PENUGASAN<star>*</star></label>
					<div class="row">
						<div class="col-md-6">
							<div class="l-float input-group">
								<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span> 
								<input type="text" name="skop_awal_penugasan" class="form-control border-input date-input datepicker" 
								data-bind="datepicker: true, selectedDate: data.startSkopPenugasan, value: data.startSkopPenugasan"/>
							</div>
						</div>
						<div class="col-md-6">
							<div class="l-float input-group">
								<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span> 
								<input type="text" name="skop_akhir_penugasan" class="form-control border-input date-input datepicker" 
								data-bind="datepicker: true, selectedDate: data.endSkopPenugasan, value: data.endSkopPenugasan"/>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-12 control-label t-left">TIM PENGAWASAN<star>*</star></label>
			</div>
			<div data-bind="template: {foreach: data.team}">
				<div class="form-group">
					<div class="col-sm-5">
						<input type="text" class="form-control border-input" data-bind="value: namaTim"/>
					</div>
					<div class="col-sm-5">
						<select class="form-control" data-bind="value: teamId">
							<?php if ($getAllJenisTim) : ?>
								<?php foreach($getAllJenisTim as $tim) : ?>
								<option value="<?php echo $tim->tim_id ?>">
									<?php echo $tim->jenis_tim;?>
								</option>
								<?php endforeach; ?>
							<?php endif; ?>
						</select>
					</div>
					<div class="col-sm-5">
						<a href="#" data-bind="event: {click: $parent.removeTeam}">Hapus</a>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-12 t-center">
					<br />
					<button id="add-tim" class="btn l-float btn-sm btn-fill" data-bind="event: {click: addTeam}">
						<span class="btn-label"> <i class="fa fa-plus-circle"></i></span> TAMBAH
					</button>
				</div>
			</div>
		</div>

		<div class="col-md-4">
			<div class="form-group">
				<div class="col-sm-10">
					<label for="inputEmail3" class="control-label t-left">JENIS PENGAWASAN<star>*</star></label> 
					<select name="jenis_pengawasan_id" class="form-control" data-bind="value: data.jenisPengawasanId">
						<?php if ($getAllJenisPengawasan) :?>
							<?php foreach($getAllJenisPengawasan as $pengawas) : ?>
								<option value="<?php echo $pengawas->jenis_pengawasan_id;?>">
									<?php echo $pengawas->jenis_pengawasan;?>
								</option>
							<?php endforeach; ?>
						<?php endif; ?>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-12 control-label t-left">OBJEK PENGAWASAN<star>*</star></label>
				<div class="col-sm-10">
					<input type="text" name="objek_pengawasan" class="form-control border-input" 
					data-bind="value: data.objekPengawasan" required="true" />
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-12 control-label t-left">JUDUL LHP<star>*</star></label>
				<div class="col-sm-10">
					<input type="text" name="judul_lhp" class="form-control border-input" 
					data-bind="value: data.judulLhp" required="true" />
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-12 control-label t-left">NOMOR LHP<star>*</star></label>
				<div class="col-sm-10">
					<input type="text" name="nomor_lhp" class="form-control border-input" 
					data-bind="value: data.nomorLhp" required="true" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-10">
					<label for="inputEmail3" class="control-label t-left">TANGGAL LHP<star>*</star></label>
					<div class="input-group">
						<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span>
						<input type="text" name="tanggal_lhp" class="form-control border-input date-input-big datepicker" 
						data-bind="datepicker: true, selectedDate: data.tglLhp, value: data.tglLhp"/>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label for="exampleInputFile" class="col-sm-12 control-label t-left">UPLOAD COVER<star>*</star></label>
				<div class="col-sm-10">
					<input type="file" id="exampleInputFile">
				</div>
			</div>
		</div>

		<!-- Perpanjangan -->
		<div class="col-md-4">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-10 control-label t-left">ST PERPANJANGAN</label>
				<div class="col-sm-10">
					<input type="text" name="st_perpanjangan" class="form-control border-input" 
					data-bind="value: data.stPerpanjangan"/>
				</div>
			</div>

			<div class="form-group">
				<label for="inputEmail3" class="col-sm-10 control-label t-left">TANGGAL ST PERPANJANGAN</label>
				<div class="col-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span> 
						<input type="text" name="tgl_st_perpanjangan" class="form-control border-input date-input-big datepicker" 
						data-bind="datepicker: true, selectedDate: data.tglStPerpanjangan, value: data.tglStPerpanjangan"/>
					</div>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-10">
					<label for="inputEmail3" class="control-label t-left">HARI PENUGASAN<star>*</star></label>
					<div class="row">

						<div class="col-md-6">
							<div class=" l-float input-group">
								<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span> 
								<input type="text" name="hari_awal_perpanjangan_penugasan" class="form-control border-input date-input datepicker" 
								data-bind="datepicker: true, selectedDate: data.startPerpanjanganPenugasan, value: data.startPerpanjanganPenugasan"/>
							</div>
						</div>
						<div class="col-md-6">
							<div class=" l-float input-group">
								<span class="input-group-addon"><i aria-hidden="true" class="fa fa-calendar"></i></span> 
								<input type="text" name="hari_akhir_perpanjangan_penugasan" class="form-control border-input date-input datepicker" 
								data-bind="datepicker: true, selectedDate: data.endPerpanjanganPenugasan, value: data.endPerpanjanganPenugasan"/>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-10 control-label t-left">TIM PERPANJANGAN</label>
			</div>
			<div data-bind="template: {foreach: data.teamPerpanjangan}">
				<div class="form-group">
					<div class="col-sm-5">
						<input type="text" class="form-control border-input" data-bind="value: namaTim"/>
					</div>
					<div class="col-sm-5">
						<select class="form-control" data-bind="value: teamId">
							<?php if ($getAllJenisTim ) : ?>
								<?php foreach($getAllJenisTim as $tim) : ?>
									<option value="<?php echo $tim->tim_id?>">
										<?php echo $tim->jenis_tim;?>
									</option>
								<?php endforeach;?>
							<?php endif; ?>
						</select>
					</div>
					<div class="col-sm-5">
						<a href="#" data-bind="event: {click: $parent.removeTeamPerpanjangan}">Hapus</a>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-12 t-center"><br />
					<button class="btn btn-sm l-float btn-fill" data-bind="event: {click: addTeamPerpanjangan}">
						<span class="btn-label"><i class="fa fa-plus-circle"></i> </span>TAMBAH
					</button>
				</div>
			</div>

		</div>
		<!-- Perpanjangan -->
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-10"></div>
				<div class="col-md-2">
					<button class="btn btn-wd btn-success btn-fill btn-rotate" 
					data-bind="event: {click: doInsert}" id="btnSave">
						<span class="btn-label"> <i class="ti-save"></i>
						</span>SIMPAN
					</button>
				</div>
			</div>
		</div>
	</div>
</form>