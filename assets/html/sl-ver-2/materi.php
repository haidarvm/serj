<?php include("header.php");?>
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<!-- left content -->
					<div class="col-md-12 main-content">
						<div class="box-panel col-md-12 wow fadeIn">
							<div class="head-panel purple">
								<h2>Materi Status</h2>
								<i class="fa fa-files-o"></i>
							</div>
							
							<!-- /.box-header -->
            <div class="box-body">
              <table  class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Nama</th>
                  <th>Pelajaran</th>
                  <th>Kelas</th>
                  <th>Mulai</th>
                  <th>Selesai</th>
                  <th>Tugas Terkumpul</th>
                  <th>Lihat</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>Bilangan Bulat</td>
                  <td>Matematika</td>
                  <td>5</td>
                  <td>1 Januari 2016</td>
                  <td>14 Januari 2016</td>
                  <td>
                  	<div class="progress">
					  <div class="progress-bar" role="progressbar" aria-valuenow="70"
					  aria-valuemin="0" aria-valuemax="100" style="width:50%">
					    50%
					  </div>
					</div>
					</td>
                  <td><a href="materi_detail.php"><i class="fa fa-user"></i> Lihat Materi</a></td>
                </tr>
                
                <tr>
                  <td>Volume Kubus</td>
                  <td>Matematika</td>
                  <td>5</td>
                  <td>14 Januari 2016</td>
                  <td>1 Febuari 2016</td>
                  <td>
                  	<div class="progress">
					  <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60"
					  aria-valuemin="0" aria-valuemax="100" style="width:60%">
					    60%
					  </div>
					</div>
					</td>
                  <td><a href="materi_detail.php"><i class="fa fa-user"></i> Lihat Materi</a></td>
                </tr>
                <tr>
                  <td>Pecahan</td>
                  <td>Matematika</td>
                  <td>6</td>
                  <td>1 Febuari 2016</td>
                  <td>14 Febuari 2016</td>
                  <td>
                  	<div class="progress">
					  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="70"
					  aria-valuemin="0" aria-valuemax="100" style="width:70%">
					    70%
					  </div>
					</div>
					</td>
                  <td><a href="materi_detail.php"><i class="fa fa-user"></i> Lihat Materi</a></td>
                <tr>
                  <td>Bilangan Bulat</td>
                  <td>Matematika</td>
                  <td>6</td>
                  <td>14 Febuari 2016</td>
                  <td>1 Maret 2016</td>
                  <td>
                  	<div class="progress">
					  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="80"
					  aria-valuemin="0" aria-valuemax="100" style="width:80%">
					    80%
					  </div>
					</div>
					</td>
                  <td><a href="materi_detail.php"><i class="fa fa-user"></i> Lihat Materi</a></td>
                </tr>
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->

						</div>
					</div>
				</div>
			</div>
		</div>
	<?php include("footer.php")?>
	