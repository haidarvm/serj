<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 custom-form">
				<div class="card">
					<div class="content">
						<!-- start form -->
							<form class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-2 control-label">NOMOR LHP</label>
								    <div class="col-sm-10">
								      <?php echo isset($lhp) ? $lhp->no_surat_tugas : '' ?>
								    </div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">JUDUL LHP</label>
								    <div class="col-sm-10">
								      <?php echo isset($lhp) ? $lhp->judul_lhp : ''?>
								    </div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">OBJEK PENGAWASAN</label>
								    <div class="col-sm-10">
								      <?php echo isset($lhp) ? $lhp->objek_pengawasan : ''?>
								    </div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">TEMUAN</label>
								    <div class="col-sm-10">
								      <?php  echo isset($kertasKerjaTemuan) ? $kertasKerjaTemuan->uraian_temuan : ''?>
								    </div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">NILAI TEMUAN</label>
								    <div class="col-sm-10">
								      Rp<?php echo isset($kertasKerjaTemuan) ? number_format($kertasKerjaTemuan->nilai_temuan,0,",",".") : ''?>
								    </div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">REKOMENDASI</label>
								    <div class="col-sm-10">
								      <?php echo isset($rekomendasi) ? $rekomendasi->uraian_rekomendasi : ''?>
								    </div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">NILAI REKOMENDASI</label>
								    <div class="col-sm-10">
								      Rp<?php echo isset($rekomendasi) ? number_format($rekomendasi->nilai_rekomendasi, 0, ",", ".") : ''?>
								    </div>
								</div>
							</form>
						<!-- end form -->
						<h4>RIWAYAT TINDAK LANJUT</h4>
						<form action="<?php echo base_url() ?>tlhp/lhp/savetl" method="post">
						<input type="hidden" name="lhp_id" value="<?php echo $lhp->lhp_id ?>">
						<table class="table table-bordered">
						  <tr>
						    <th rowspan="2">No</th>
						    <th rowspan="2">TANGGAL TL</th>
						    <th rowspan="2">URAIAN TINDAK LANJUT</th>
						    <th rowspan="2">NILAI YANG SUDAH<br>DI TINDAK LANJUTI</th>
						    <th rowspan="2">DOK</th>
						    <th colspan="4">RIWAYAT PERSETUJUAN</th>
						  </tr>
						  <tr>
						    <td>DISETUJUI</td>
						    <td>NILAI YANG<br>DI SETUJUI</td>
						    <td>SALDO<br>REKOMENDASI</td>
						    <td>STATUS</td>
						  </tr>
						  <?php foreach ($tindakLanjut as $idx => $rowTl) :?>
						  <tr>
						    <td><?php echo $idx+1 ?></td>
						    <td><?php echo $rowTl->tanggal_tl ?></td>
						    <td><?php echo $rowTl->tindak_lanjut ?></td>
						    <td>Rp<?php echo number_format($rowTl-> nilai, 0, ",", ".") ?></td>
						    <td>-</td>
						    <td>
						    	<?php if ($rowTl->approval_status != null && $rowTl->approval_status == 'approved') : ?>
						    		<i class="fa fa-check" aria-hidden="true"></i>
						    	<?php endif; ?>
						    </td>
						    <td>
						    	Rp<?php echo number_format($rowTl->nilai_disetujui, 0, ",", ".") ?>
						    </td>
						    <td>
						    	Rp<?php echo number_format($rekomendasi->nilai_rekomendasi, 0, ",", ".") ?>
						    </td>
						    <td>
						    	<?php if ($rowTl->status_tl == 1) : ?>
						    		<b>sesui rekomendasi</b>
						    	<?php elseif ($rowTl->status_tl == 0) : ?>
						    		<b>tidak sesui rekomendasi</b>
						    	<?php endif; ?>
						    </td>
						  </tr>
						  <?php endforeach; ?>
						</table>
						<div class="pull-right">
							<button class="btn" onclick="alert('Sorry, this fiture undercontruction'); return false;">Cetak</button>
							<a class="btn" href="<?php echo base_url().'tlhp/kkt/view?lhp_id='.$lhp->lhp_id ?>">
								Kembali
							</a>
						</div>
						<div style="clear: both;"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>