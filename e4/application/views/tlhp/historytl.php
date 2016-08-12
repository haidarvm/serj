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
						  <?php foreach ($tindakLanjut as $rowTl) :?>
						  <tr>
						    <td>1</td>
						    <td><?php echo $rowTl->tanggal_tl ?></td>
						    <td><?php echo $rowTl->tindak_lanjut ?></td>
						    <td>Rp<?php echo number_format($rowTl-> nilai, 0, ",", ".") ?></td>
						    <td>-</td>
						    <td><input type="checkbox"/></td>
						    <td>
						    	<input type="text"/>
						    </td>
						    <td></td>
						    <td>
						    	<select name="status">
						    		<option>sesuai rekomendasi</option>
						    		<option>tidak sesuai rekomendasi</option>
						    	</select>
						    </td>
						  </tr>
						  <?php endforeach; ?>
						</table>
						<div class="pull-right">
							<button class="btn">Cetak</button>
							<button class="btn">Simpan History Tl</button>
						</div>
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

