<?php include("header.php");?>
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<!-- left content -->
					<div class="col-md-12 main-content">
						<div class="panel-group">
                            <div class="box-panel col-md-12 wow fadeIn">
                                <div class="head-panel blue">
                                    <h2>Buat Tugas</h2>
                                    <i class="fa fa-tags"></i>
                                </div>

                                <div class="col-md-12 content long-panel" >
                                        <div class="tittle-panel text-center">
											<strong>Tugas Biologi</strong>
										</div>
                                        
										<div class="col-md-10 col-md-offset-1 space-bottom">
											<label for="comment">Pilih Jenis Pertanyaan:</label>
                                            <div class="dropdown">
                                                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Pilihan Ganda
                                                <span class="caret"></span></button>
                                                <ul class="dropdown-menu">
                                                  <li><a href="#">Benar atau salah</a></li>
                                                  <li><a href="#">Essay</a></li>
                                                </ul>
                                            </div>
                                            <br/><br/>
                                            <div class="form-group">
                                              <label for="comment">Pertanyaan:</label>
                                              <textarea class="form-control" rows="5" id="comment"></textarea>
                                                <br/><br/>
                                              <label for="comment">Jawaban opsi A</label>
                                                <div class="checkbox">
                                                    <label><input type="checkbox" value="">Pilih sebagai jawaban yang benar</label>
                                                </div>
                                              <textarea class="form-control" rows="5" id="comment"></textarea>
                                                <br/>
                                              <label for="comment">Jawaban opsi B</label>
                                                <div class="checkbox">
                                                    <label><input type="checkbox" value="">Pilih sebagai jawaban yang benar</label>
                                                </div>
                                              <textarea class="form-control" rows="5" id="comment"></textarea>
                                                <br/>
                                              <label for="comment">Jawaban opsi C</label>
                                                <div class="checkbox">
                                                    <label><input type="checkbox" value="">Pilih sebagai jawaban yang benar</label>
                                                </div>
                                              <textarea class="form-control" rows="5" id="comment"></textarea>
                                                <br/>
                                              <label for="comment">Jawaban opsi D</label>
                                                <div class="checkbox">
                                                    <label><input type="checkbox" value="">Pilih sebagai jawaban yang benar</label>
                                                </div>
                                              <textarea class="form-control" rows="5" id="comment"></textarea>
                                            </div>
                                            <button type="button" class="btn btn-success">Simpan</button>
                                            <button type="button" class="btn btn-danger">Batal</button> 
										</div>
                                </div>
                            </div>
				        </div>
				    </div>
				</div>
            </div>
        </div>
</div>
<?php include("footer.php")?>