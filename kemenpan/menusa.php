<?php include('header.php')?>
<div class="content">

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
						<div class="inner col-md-10">
				            <p>TOTAL TEMUAN SEJAK TAHUN 2013</p>	
						    <p>TOTAL REKOMENDASI SEJAK TAHUN 2013</p><br />
                            <p>BELUM SESUAI REKOMENDASI</p>
                            <p>BELUM DITINDAKLANJUTI</p>
                            <p>TIDAK DAPAT DITINDAKLANJUTI</p>
						</div>	
                        <div class="inner col-md-2">
				            <p>: 50</p>	
						    <p>: 70</p><br />
                            <p>: 40</p>
                            <p>: 15</p>
                            <p>: 30</p>
						</div>
					</div>
                    <div class="clearfix"></div>
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
						<div class="inner col-md-8">
				            <p>KERUGIAN NEGARA SEJAK TAHUN 2013</p><br />	
						    <p>TELAH DISTOR KE KAS NEGARA</p>
                            <p>BELUM DISTOR KE KAS NEGARA</p>
						</div>	
                        <div class="inner col-md-4">
				            <p>: Rp 8.000.000</p><br />	
						    <p>: Rp 5.000.000</p>	
                            <p>: Rp 3.000.000</p>	
						</div>
                        <a class="btn btn-info" href="#"><i class="fa fa-print fa-lg"></i>Cetak</a>
					</div>
                    <div class="clearfix"></div>
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