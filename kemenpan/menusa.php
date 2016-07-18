<?php include('header.php')?>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="header">
						<h4 class="title">
							<b>TINDAK LANJUT HASIL PENGAWASAN</b>
						</h4>
						<!--                                 <p class="category">Last Campaign Performance</p> -->
					</div>
					<div class="content">
						<table style="width: 100%">
							<tr>
								<td>TOTAL TEMUAN SEJAK TAHUN 2013</td>
								<td>: 50</td>
							</tr>
							<tr>
								<td>TOTAL REKOMENDASI SEJAK TAHUN 2013</td>
								<td>: 70</td>
							</tr>
						</table>
						<br />
						<table style="width: 100%">
							<tr>
								<td>SELESAI DITINDAKLANJUTI</td>
								<td>: 40</td>
							</tr>
							<tr>
								<td>BELUM SESUAI REKOMENDASI</td>
								<td>: 15</td>
							</tr>
							<tr>
								<td>BELUM DITINDAKLANJUTI</td>
								<td>: 30</td>
							</tr>
							<tr>
								<td>TIDAK DAPAT DITINDAKLANJUTI</td>
								<td>: 2</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card ">
					<div class="header">
						<h4 class="title">
							<b>KERUGIAN KEUANGAN NEGARA</b>
						</h4>
						<!--                                 <p class="category">All products including Taxes</p> -->
					</div>
					<div class="content">
						<table style="width: 100%">
							<tr>
								<td>KERUGIAN NEGARA SEJAK TAHUN 2013</td>
								<td>: 50</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
						<br />
						<table style="width: 100%">
							<tr>
								<td>TELAH DISETOR KE KAS NEGARA</td>
								<td>: 40</td>
							</tr>
							<tr>
								<td>BELUM DISETOR KE KAS NEGARA</td>
								<td>: 15</td>
							</tr>
						</table>
						<a class="btn btn-info" href="#"><i class="fa fa-print fa-lg"></i>
							Cetak</a>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="header">
						<h4 class="title"><b>TINDAK LANJUT HASIL PENGAWASAN</b></h4>
						<p class="category">Last Campaign Performance</p>
					</div>
					<div class="content">
						<canvas id="pieTindakLanjut" class="full-width" width="300" height="200"
							style="width: 300px; height: 200px;"></canvas>

						<div class="footer">
							<div class="chart-legend">
								<i class="fa fa-circle text-info"></i> Tidak dapat tindak lanjut
								<i class="fa fa-circle text-danger"></i> Selesai tindak lanjut <i
									class="fa fa-circle text-warning"></i> Belum selesai <i
									class="fa fa-circle text-success"></i> Belum tindak lanjut
							</div>
							<hr>
							<div class="stats">
								<i class="ti-timer"></i> Campaign sent 2 days ago
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="header">
						<h4 class="title"><b>KERUGIAN KEUANGAN NEGARA</b></h4>
						<p class="category">Last Campaign Performance</p>
					</div>
					<div class="content">
						<canvas id="pieKerugian" class="full-width" width="300" height="200"
							style="width: 300px; height: 200px;"></canvas>

						<div class="footer">
							<div class="chart-legend">
								<i class="fa fa-circle text-info"></i> Tidak dapat tindak lanjut
								<i class="fa fa-circle text-danger"></i> Selesai tindak lanjut <i
									class="fa fa-circle text-warning"></i> Belum selesai <i
									class="fa fa-circle text-success"></i> Belum tindak lanjut
							</div>
							<hr>
							<div class="stats">
								<i class="ti-timer"></i> Campaign sent 2 days ago
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php include('footer.php')?>