<div class="content">
    <div class="row">
            <h4 class="tittle-row">TINDAK LANJUT HASIL PENGAWASAN</h4>
            <div class="col-md-12">
				<div class="col-lg-4 col-sm-6">
					<div class="card">
	                   <div class="content">
	                       <div class="row">
	                           <div class="col-xs-12">
	                               <div class="numbers">
	                                   <p class="t-card">TOTAL TEMUAN SEJAK TAHUN <?php echo $current_year ?></p>
                                       <span class="t-number"><?php echo $totalTemuan ?></span>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
				     
	               </div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<div class="card">
	                   <div class="content">
	                       <div class="row">
	                           <div class="col-xs-12">
	                               <div class="numbers">
	                                   <p class="t-card">TOTAL REKOMENDASI SEJAK TAHUN <?php echo $current_year ?></p>
                                       <span class="t-number"><?php echo $totalRekomendasi ?></span>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
				     
	               </div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<div class="card">
	                   <div class="content">
	                       <div class="row">
	                           <div class="col-xs-12">
	                               <div class="numbers">
	                                   <p class="t-card">SELESAI DITINDAKLANJUTI</p>
                                       <span class="t-number"><?php echo $totalSelesaiTl?></span>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
	               </div>
				</div>
			</div>
				
			<div class="col-md-12">
	           <div class="col-lg-4 col-sm-6">
                    <div class="card">
	                   <div class="content">
	                       <div class="row">
	                           <div class="col-xs-12">
	                               <div class="numbers">
	                                   <p class="t-card">BELUM SESUAI REKOMENDASI</p>
                                       <span class="t-number"><?php echo $totalBelumSesuaiRekomendasi?></span>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
	                </div>
	           </div>
	           <div class="col-lg-4 col-sm-6">
                <div class="card">
	                   <div class="content">
	                       <div class="row">
	                           <div class="col-xs-12">
	                               <div class="numbers">
	                                   <p class="t-card">BELUM DITINDAKLANJUTI</p>
                                       <span class="t-number"><?php echo $totalBelumTl ?></span>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
	               </div>
	           </div>
	           <div class="col-lg-4 col-sm-6">
                <div class="card">
	                   <div class="content">
	                       <div class="row">
	                           <div class="col-xs-12">
	                               <div class="numbers">
	                                   <p class="t-card">TIDAK DAPAT DITINDAKLANJUTI</p>
                                       <span class="t-number">2</span>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
	               </div>
	           </div>
			</div>
	   </div>
    
        <div class="row">
            <h4 class="tittle-row">KERUGIAN KEUANGAN NEGARA</h4>
            <div class="col-lg-3 col-sm-6">
                <div class="card same-height">
	                   <div class="content">
	                       <div class="row">
	                           <div class="col-xs-12">
	                               <div class="numbers">
	                                   <p class="t-card">KERUGIAN NEGARA SEJAK TAHUN <?php echo $current_year ?></p>
                                       <span class="t-number rupiah"><?php echo $totalKerugianNegara->total_kerugian ?></span>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
	               </div>
	           </div>
	           <div class="col-lg-3 col-sm-6">
                <div class="card same-height">
	                   <div class="content">
	                       <div class="row">
	                           <div class="col-xs-12">
	                               <div class="numbers">
	                                   <p class="t-card">TELAH DISTOR KE KAS NEGARA</p>
                                       <span class="t-number">RP 5.000.000</span>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
	               </div>
	           </div>
               <div class="col-lg-3 col-sm-6">
                <div class="card same-height">
	                   <div class="content">
	                       <div class="row">
	                           <div class="col-xs-12">
	                               <div class="numbers">
	                                   <p class="t-card">BELUM DISTOR KE KAS NEGARA</p>
                                       <span class="t-number">RP 3.000.000</span>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
	               </div>
	           </div>
				<div class="col-lg-3 col-sm-6">
	                   <div class="card same-height" data-color="magenta">
	                       <div class="content">
	                           <div class="row">
	                               <div class="col-xs-3">
	                                   <div class="icon-big icon-success text-center">
	                                   <i class="fa fa-print fa-lg"></i>
	                                   </div>
	                               </div>
	                                   <div class="col-xs-9">
	                                   <div class="numbers">
	                                   <p>CETAK DOKUMEN</p>
                                          <a href="<?=site_url()?>tlhp/menusa/cetak" class="btn btn-danger btn-fill btn-wd"><i class="fa fa-print" aria-hidden="true"></i> Print</a>
	                                   </div>
	                                   </div>
	                                </div>
	                            </div>
	                   </div>
                    
				</div>
    </div>
 <!--div class="row">
		<div class="col-md-6">
			<div class="card">
				<div class="header">
					<h4 class="title">
						<b>TINDAK LANJUT HASIL PENGAWASAN</b>
					</h4>
					<!-- <p class="category">Last Campaign Performance</p> -->
				<!--/div>
				<div class="content">
					<div class="inner col-md-10">
						<p class="h6">TOTAL TEMUAN SEJAK TAHUN 2013</p>
						<p class="h6">TOTAL REKOMENDASI SEJAK TAHUN 2013</p>
						<br />
						<p class="h6">BELUM SESUAI REKOMENDASI</p>
						<p class="h6">BELUM DITINDAKLANJUTI</p>
						<p class="h6">TIDAK DAPAT DITINDAKLANJUTI</p>
					</div>
					<div class="inner col-md-2">
						<p class="h6">: 50</p>
						<p class="h6">: 70</p>
						<br />
						<p class="h6">: 40</p>
						<p class="h6">: 15</p>
						<p class="h6">: 30</p>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div-->
		<!--div class="col-md-6">
			<div class="card ">
				<div class="header">
					<h4 class="title">
						<b>KERUGIAN KEUANGAN NEGARA</b>
					</h4>
					<!--                                 <p class="category">All products including Taxes</p> -->
				<!--/div>
				<div class="content">
					<div class="inner col-md-8">
						<p class="h6">KERUGIAN NEGARA SEJAK TAHUN 2013</p>
						<br />
						<p class="h6">TELAH DISTOR KE KAS NEGARA</p>
						<p class="h6">BELUM DISTOR KE KAS NEGARA</p>
						<p>&nbsp;</p>
						<p>&nbsp;</p>
					</div>
					<div class="inner col-md-4">
						<p class="h6">: Rp 8.000.000</p>
						<br />
						<p class="h6">: Rp 5.000.000</p>
						<p class="h6">: Rp 3.000.000</p>
					</div>
					<a class="btn btn-info pull-left" href="#"><i class="fa fa-print fa-lg"></i>Cetak</a>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div-->


	<div class="row">
        <h4 class="tittle-row"></h4>
		<div class="col-md-6">
			<div class="card">
				<div class="header">
					<h4 class="title">
						<b>TINDAK LANJUT HASIL PENGAWASAN</b>
					</h4>
				</div>
				<div class="content">
					<div id="tindak_lanjut" style="height: 300px; width: 100%;"></div>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card">
				<div class="header">
					<h4 class="title">
						<b>KERUGIAN KEUANGAN NEGARA</b>
					</h4>
				</div>
				<div class="content">
					<div id="kerugian" style="height: 300px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
//	console.debug(site_url+ "assets/js/paper-dashboard");
    requirejs.config({
        "shim": {
            "bootstrap": {"deps": ["jquery"]},
    		"notify": {"deps": ["jquery"]},
    		"price_format": {"deps": ["jquery"]},
    		"canvasjs" : {"deps": ["jquery"]}
//     		"papertlhp" : {"deps": ["jquery","bootstrap"]},
//    		"demo" : {"deps": ["jquery","bootstrap","paper-dashboard"]},
        },
        "paths": {
            "jspath": site_url + "assets/js/",
            "jquery": site_url + "assets/js/jquery-2.1.4.min",
            "notify": site_url+"assets/js/notify.min",
            "bootstrap": site_url + "assets/js/bootstrap.min",
            "canvasjs": site_url + "assets/js/jquery.canvasjs.min",
            "price_format": site_url + "assets/js/jquery.price_format.2.0.min",
            
//            "demo": site_url + "assets/js/demo",
//             "papertlhp": site_url + "assets/js/paper-dashboard"
        }
    });
    requirejs(["jspath/menusa"]);
</script>
