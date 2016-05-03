
	
	<!-- quotes suka-suka -->
	<div class="container">
		<div class="row">
			<div class="col-md-12 box-quote wow zoomIn">
				<h2>Data Semua Pendaftaran Online</h2>

				<table class="table">
					<thead> 
						<tr> 
							<th>Nama</th> 
							<th>Telp</th> 
							<th>email</th> 
							<th>Sekolah</th> 
							<th>Kelas</th> 
							<th>Kota</th> 
							<th>Tanggal</th> 
							<th>Lomba Foto</th> 
							<th>Lomba Cover Lagu</th> 
							<th>Lomba Gambar</th> 
							<th>Lomba Mewarnai</th> 
							<th>Test Minat Bakat</th> 
							<th>Parenting</th> 
						</tr> 
					</thead> 
					<tbody> 
						<?php foreach($all_daftar as $daftar) { ?>
						<tr> 
							<td><b><?php echo $daftar->full_name; ?></b></td> 
							<td><b><?php echo $daftar->phone; ?></b></td> 
							<td><b><?php echo $daftar->email; ?></b></td> 
							<td><b><?php echo $daftar->school; ?></b></td> 
							<td><b><?php echo $daftar->grade; ?></b></td> 
							<td><b><?php echo $daftar->city; ?></b></td> 
							<td><?php echo $daftar->create_date ;?></td>
							<td><?php echo $daftar->lomba_foto_id != NULL ? "ikut" : "" ;?></td> 
							<td><?php echo $daftar->lomba_cover_id != NULL ? "ikut" : "" ;?></td> 
							<td><?php echo $daftar->lomba_gambar_id != NULL ? "ikut" : "" ;?></td> 
							<td><?php echo $daftar->lomba_mewarnai_id != NULL ? "ikut" : "" ;?></td> 
							<td><?php echo $daftar->bakat_id != NULL ? "ikut" : "" ;?></td> 
							<td><?php echo $daftar->parenting_id != NULL ? "ikut" : "" ;?></td> 
						</tr> 
						<?php } ?>
					</tbody> 
				</table>
			</div>
		</div>
	</div>
	
	<!-- line fullscreen line -->
	<div class="container tagline nopadding"><hr /></div>
	
