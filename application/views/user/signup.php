	<!-- quotes suka-suka -->
	<div class="container">
		<div class="row">
			<div class="col-md-9 box-quote wow zoomIn">
				<h2>Mari Bergabung</h2>
				<p>Bandung Juara Education Expo 2016 "Smart Leading, Future Leading".</p>
			</div>
		</div>
	</div>
	<!-- form signup -->
	<div class="container">
		<div class="row">
			<!-- sign up -->
			<div class="col-md-6 col-md-offset-3 single-inner wow fadeIn">
				<div class="box-form">
					<h2 class="wow pulse">Daftar</h2>
					<div class="bform">
						<form action="<?php echo site_url()?>daftar/submit" id="validation-reg" method="post">
							<div class="form-group">
								<label>Nama Lengkap</label>
								<input type="text" name="full_name" class="form-control">
							</div>
							<div class="gender">
								<label>Kelamin</label>
							</div>
							<div class="radio-inline">
							  <label>
								<input type="radio" name="gender" id="optionsRadios1" value="l" checked>
								Laki-laki
							  </label>
							</div>
							<div class="radio-inline">
							  <label>
								<input type="radio" name="gender" id="optionsRadios1" value="p">
								Perempuan
							  </label>
							</div>
							
							<div class="gender">
								<label>Tanggal Lahir</label>
							</div>
							<div class="three-col">
								<div class="form-group">
									<input type="date" name="date_birth" class="form-control">
								</div>
								<div class="clearfix"></div>
							</div>
							
							<div class="form-group">
								<label>Alamat email</label>
								<input type="email" name="email" class="form-control">
							</div>
							<div class="form-group">
								<label>Password</label>
								<input type="password" name="password" id="password" class="form-control">
							</div>
							<div class="form-group">
								<label>Ulangi Password</label>
								<input type="password" name="re_password" id="re_password"  class="form-control">
							</div>
							<div class="form-group">
								<label>Nama Sekolah/Perguruan Tinggi/Instansi</label>
								<input type="text" name="school" class="form-control">
							</div>
							<div class="form-group">
								<label>Kelas/Jurusan/Pekerjaan</label>
								<input type="text" name="grade" class="form-control">
							</div>
							<div class="form-group">
								<label>Kota</label>
								<input type="text" name="city" class="form-control">
							</div>
							<div class="form-group">
								<label><input type="checkbox" name="bakat">Daftar Lomba Test Bakat Biaya Pendaftaran 50.000 </label>
							</div>
							<div class="form-group">
								<label><input type="checkbox" name="lomba_foto">Daftar Lomba Foto Biaya Pendaftaran 35.000</label>
							</div>
							<div class="form-group">
								<label><input type="checkbox" name="lomba_cover_lagu">Daftar Lomba Cover Lagu Biaya Pendaftaran 35.000 </label>
							</div>
							<div class="form-group">
								<label><input type="checkbox" name="lomba_gambar">Daftar Lomba Gambar Biaya Pendaftaran 35.000</label>
							</div>
							<div class="form-group">
								<label><input type="checkbox" name="lomba_mewarnai">Daftar Lomba Mewarnai Biaya Pendaftaran 35.000 </label>
							</div>
							<div class="form-group">
								<label><input type="checkbox" name="parenting">Daftar Parenting Biaya Pendaftaran 100.000</label>
							</div>
							<button type="submit" class="btn btn-success">Daftar</button>
							
							<!-- line fullscreen line -->
							<div class="tagline nopadding"><hr /></div>
							
							<div class="form-group wow fadeIn">
								<p>Sudah menjadi member? <a href="#">Masuk di sini</a>.</p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>