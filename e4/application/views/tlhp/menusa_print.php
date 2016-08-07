<div class="content">
	<div id="header">
		<h1><?php echo $pageTitle;?></h1> 
		<a class="btn btn-danger btn-fill btn-wd print-this"><i aria-hidden="true" class="fa fa-print"></i> Print</a>
	</div>
	<table width="100%" class="t-print">
		<tr>
			<th colspan='2' align="center" style="font-weight: bold;">TINDAK LANJUT HASIL PENGAWASAN</th>
			<th colspan='2' align="center">KERUGIAN KEUANGAN NEGARA</th>
		</tr>
		<tr>
			<td>TOTAL TEMUAN SEJAK TAHUN 2013</td>
			<td>50</td>
			<td>TOTAL TEMUAN SEJAK TAHUN 2013</td>
			<td>50</td>
		</tr>
		<tr>
			<td>TOTAL REKOMENDASI SEJAK TAHUN 2013</td>
			<td>70</td>
			<td>TOTAL REKOMENDASI SEJAK TAHUN 2013</td>
			<td>70</td>
		</tr>
		<tr>
			<td>SELESAI DITINDAKLANJUTI</td>
			<td>50</td>
			<td>SELESAI DITINDAKLANJUTI</td>
			<td>50</td>
		</tr>
		<tr>
			<td>BELUM SESUAI REKOMENDASI</td>
			<td>15</td>
			<td>BELUM SESUAI REKOMENDASI</td>
			<td>15</td>
		</tr>
		<tr>
			<td>BELUM DITINDAKLANJUTI</td>
			<td>30</td>
			<td>BELUM DITINDAKLANJUTI</td>
			<td>30</td>
		</tr>
		<tr>
			<td>TIDAK DAPAT DITINDAKLANJUTI</td>
			<td>2</td>
			<td>TIDAK DAPAT DITINDAKLANJUTI</td>
			<td>2</td>
		</tr>
	</table>

    <div class="row">
        <h4 class="tittle-row"></h4>
		<div class="col-md-6">
			<div class="card">
				<div class="header">
					<h4 class="title">
						<b>TINDAK LANJUT HASIL PENGAWASAN</b>
					</h4>
<!-- 					<p class="category">Pie Chart</p> -->
				</div>
				<div class="content">
					<div id="tindak_lanjut" style="height: 300px; width: 100%;"></div>
					<!--  <canvas id="pieTindakLanjut" class="full-width" width="300" height="200" style="width: 300px; height: 200px;"></canvas>-->


				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card">
				<div class="header">
					<h4 class="title">
						<b>KERUGIAN KEUANGAN NEGARA</b>
					</h4>
<!-- 					<p class="category">Pie Chart</p> -->
				</div>
				<div class="content">
					<div id="kerugian" style="height: 300px; width: 100%;"></div>
					<!--  <canvas id="pieKerugian" class="full-width" width="300" height="200" style="width: 300px; height: 200px;"></canvas>-->

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
//            "demo": site_url + "assets/js/demo",
//             "papertlhp": site_url + "assets/js/paper-dashboard"
        }
    });
    requirejs(["jspath/menusa"]);
</script>
