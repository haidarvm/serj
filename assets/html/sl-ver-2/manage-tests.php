<?php include("header.php");?>

<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="row">
			<!-- left content -->
			<div class="col-md-12 main-content">
				<div class="panel-group">
					<div class="box-panel col-md-12 wow fadeIn">
						<div class="head-panel blue">
							<h2>Daftar Tugas</h2>
							<i class="fa fa-tags"></i>
						</div>

						<div id="content-3 text-center"
							class="content mCustomScrollbar light body-panel"
							data-mcs-theme="minimal-dark">
							<div class="container">
								<h2>3 Tugas Aktif</h2>
								<p>Ini adalah daftar tugas yang telah di buat</p>
								<table class="table">
									<thead>
										<tr>
											<th>Nama Tugas</th>
											<th>Jumlah Soal</th>
											<th>Status</th>
											<th>Aksi</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><a href="question.html">Matematika</a></td>
											<td>10</td>
											<td>Berakhir</td>
											<td><a href="">Serahkan</a></td>
										</tr>
										<tr>
											<td><a href="question.html">Bahasa Indonesia</a></td>
											<td>20</td>
											<td>Aktif</td>
											<td><a href="">Serahkan</a></td>
										</tr>
										<tr>
											<td><a href="question.html">PKN</a></td>
											<td>30</td>
											<td>Sedang Berlangsung</td>
											<td><a href="">Serahkan</a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php include("footer.php")?>

