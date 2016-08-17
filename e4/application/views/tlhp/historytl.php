<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 custom-form">
				<div class="card">
					<div class="content">
						<!-- start form -->
							<form class="form-horizontal">
								<div class="col-md-7 bg-grey">
									<div class="form-group">
										<label class="col-sm-4 control-label t-left">NOMOR LHP</label>
									    <div class="col-sm-8 top-pad">
									      <?php echo isset($lhp) ? $lhp->no_surat_tugas : '' ?>
									    </div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label t-left">JUDUL LHP</label>
									    <div class="col-sm-8 top-pad">
									      <?php echo isset($lhp) ? $lhp->judul_lhp : ''?>
									    </div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label t-left">OBJEK PENGAWASAN</label>
									    <div class="col-sm-8 top-pad">
									      <?php echo isset($lhp) ? $lhp->objek_pengawasan : ''?>
									    </div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label t-left">TEMUAN</label>
									    <div class="col-sm-8 top-pad">
									      <?php  echo isset($kertasKerjaTemuan) ? $kertasKerjaTemuan->uraian_temuan : ''?>
									    </div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label t-left">NILAI TEMUAN</label>
									    <div class="col-sm-8 top-pad">
									      Rp<?php echo isset($kertasKerjaTemuan) ? number_format($kertasKerjaTemuan->nilai_temuan,0,",",".") : ''?>
									    </div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label t-left">REKOMENDASI</label>
									    <div class="col-sm-8 top-pad">
									      <?php echo isset($rekomendasi) ? $rekomendasi->uraian_rekomendasi : ''?>
									    </div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label t-left">NILAI REKOMENDASI</label>
									    <div class="col-sm-8 top-pad">
									      Rp<?php echo isset($rekomendasi) ? number_format($rekomendasi->nilai_rekomendasi, 0, ",", ".") : ''?>
									    </div>
									</div>
								</div>
							</form>
						<!-- end form -->

						<div class="clr"></div>
						<h4>RIWAYAT TINDAK LANJUT</h4>
						<form action="<?php echo base_url() ?>tlhp/lhp/savetl" method="post">
						<input type="hidden" name="lhp_id" value="<?php echo $lhp->lhp_id ?>">
						<div class="content table-full-width">
							<table id="kertas-kerja" class="table table-bordered t-center historytl">
							  <tr>
							    <th rowspan="2" class="info">No</th>
							    <th rowspan="2" class="info">TANGGAL TL</th>
							    <th rowspan="2" class="info">URAIAN TINDAK LANJUT</th>
							    <th rowspan="2" class="info">NILAI YANG SUDAH<br>DI TINDAK LANJUTI</th>
							    <th rowspan="2" class="info">DOK</th>
							    <th colspan="4" class="info">RIWAYAT PERSETUJUAN</th>
							  </tr>
							  <tr>
							    <th class="info">DISETUJUI</th>
							    <th class="info">NILAI YANG<br>DI SETUJUI</th>
							    <th class="info">SALDO<br>REKOMENDASI</th>
							    <th class="info">STATUS</th>
							  </tr>
							  <?php foreach ($tindakLanjut as $idx => $rowTl) :?>
							  <tr>
							    <td><?php echo $idx+1 ?></td>
							    <td><?php echo $rowTl->tanggal_tl ?></td>
							    <td><?php echo $rowTl->rekomendasi_id ?>><?php echo $rowTl->tindak_lanjut ?></td>
							    <td>Rp<?php echo number_format($rowTl-> nilai, 0, ",", ".") ?></td>
							    <td>-</td>
							    <td>
							    	<input type="checkbox" name="tindakLanjut[<?php echo $rowTl->tindak_lanjut_id ?>][approvalStatus]"
							    	<?php echo isset($rowTl->approval_status) && $rowTl->approval_status == 'approved' ? "checked" : ''?>/>
							    </td>
							    <td>
							    	<input type="text" class="form-control border-input" name="tindakLanjut[<?php echo $rowTl->tindak_lanjut_id ?>][approvalValue]"
							    	value="<?php echo $rowTl->nilai_disetujui ?>"/>
							    </td>
							    <td>
							    	<input type="hidden" class="form-control border-input" name="tindakLanjut[<?php echo $rowTl->tindak_lanjut_id ?>][saldoRekomendasi]"
							    	value="<?php echo $rekomendasi->nilai_rekomendasi ?>"/>
							    	Rp<?php echo number_format($rekomendasi->nilai_rekomendasi, 0, ",", ".") ?>
							    </td>
							    <td>
							    	<select class="form-control border-input" name="tindakLanjut[<?php echo $rowTl->tindak_lanjut_id ?>][status_tl]">
							    		<option value="-1">-- Status Tl --</option>
							    		<option value="1" <?php echo $rowTl->status_tl == '1' ? "selected" : ''?>>sesuai rekomendasi</option>
							    		<option value="0" <?php echo $rowTl->status_tl == '0' ? "selected" : '' ?>>tidak sesuai rekomendasi</option>
							    	</select>
							    </td>
							  </tr>
							  <?php endforeach; ?>
							</table>
						</div>
						<div class="pull-right">
							<button class="btn btn-wd btn-info btn-fill" onclick="alert('Sorry, this fiture undercontruction'); return false;">
							<span class="btn-label"> <i aria-hidden="true" class="fa fa-print"></i>
									</span> Cetak
							</button>
							<button class="btn btn-wd btn-success btn-fill">
								<span class="btn-label"> <i class="ti-save"></i>
									</span> Simpan History Tl
							</button>
						</div>
							<a class="btn btn-wd btn-danger" href="<?php echo base_url().'tlhp/lhp/edit?lhp_id='.$lhp->lhp_id ?>">
								<span class="btn-label"> <i aria-hidden="true" class="fa fa-undo"></i>
									</span> Kembali ke KKLHP
							</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	require.config({
		"shim": {
			"tlhp" : {"deps": ["jquery"]},
//            "notify": {"deps": ["jquery"]},
		},
		"paths": {
			"jspath": site_url+"assets/js/",
        	"jquery": site_url+"assets/js/jquery-2.1.4.min",
         	"knockout": site_url+"assets/js/knockout-3.2.0",
         	"underscore": site_url+"assets/js/underscore",
         	"accounting": site_url+"assets/js/accounting.min",
//            "notify": site_url+"assets/js/notify.min",
		}
	});
//	requirejs(["jspath/historytl"]);
</script> 

