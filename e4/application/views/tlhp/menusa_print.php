<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.png" />

<title>Menusa Print</title>
<link rel="stylesheet" href="<?php echo base_url();?>assets/css/responsive-msite.css">
<link rel="stylesheet" href="<?php echo base_url()?>assets/css/bootstrap.css">
<link rel="stylesheet" href="<?php echo base_url()?>assets/css/style.css">
<link rel="stylesheet" href="<?php echo base_url()?>assets/css/custom.css">
<link rel="stylesheet" type="text/css" href="<?php echo base_url()?>assets/css/animate.css" />
<link rel="stylesheet" type="text/css" href="<?php echo base_url()?>assets/css/idangerous.swiper.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="bg-print">
<!--  <button class="btn btn-danger btn-fill btn-wd print-this" onclick="printDiv('printable')">Print</button> -->
			
	<div class="container box-print">
		<!-- <a class="btn btn-danger btn-fill btn-wd print-this"><i aria-hidden="true" class="fa fa-print"></i> Print</a> -->

		<div class="row" id="printable">
			<div class="col-md-12">
				<div id="header">
					<h3><?php echo $pageTitle;?></h3>
				</div>

				<table width="100%" class="t-print">
					<tr>
						<th colspan='2' align="center" style="font-weight: bold;">TINDAK LANJUT HASIL PENGAWASAN</th>
						<th colspan='2' align="center">KERUGIAN KEUANGAN NEGARA</th>
					</tr>
					<tr>
						<td>TOTAL TEMUAN SEJAK TAHUN <?php echo $current_year ?></td>
						<td><?php echo $totalTemuan ?></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>TOTAL REKOMENDASI SEJAK TAHUN <?php echo $current_year ?></td>
						<td>70</td>
						<td>KERUGIAN NEGARA SEJAK TAHUN <?php echo $current_year ?></td>
						<td><span class="rupiah"><?php echo $totalKerugianNegara->total_kerugian ?></span></td>
					</tr>
					<tr>
						<td>SELESAI DITINDAKLANJUTI</td>
						<td><?php echo $totalSelesaiTl?></td>
						<td>TELAH DISETOR KE KAS NEGARA	</td>
						<td><span class="rupiah"><?php echo $totalKerugianNegara->total_kerugian ?></span></td>
					</tr>
					<tr>
						<td>BELUM SESUAI REKOMENDASI</td>
						<td>15</td>
						<td>BELUM DISETOR KE KAS NEGARA</td>
						<td><span class="rupiah"><?php echo $totalKerugianNegara->total_kerugian ?></span></td>
					</tr>
					<tr>
						<td>BELUM DITINDAKLANJUTI</td>
						<td><?php echo $totalBelumTl ?></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>TIDAK DAPAT DITINDAKLANJUTI</td>
						<td>2</td>
						<td></td>
						<td></td>
					</tr>
				</table>

				<div class="row">
					<h4 class="tittle-row"></h4>
					<div class="col-md-6 bottom-space">
						<div class="card">
							<div class="header">
								<h4 class="title">
									<b>TINDAK LANJUT HASIL PENGAWASAN</b>
								</h4>
								<!-- 					<p class="category">Pie Chart</p> -->
							</div>
							<div class="content">
								<div id="tindak_lanjut" style="height: 250px; width: 100%;"></div>
								<!--  <canvas id="pieTindakLanjut" class="full-width" width="300" height="200" style="width: 300px; height: 200px;"></canvas>-->


							</div>
						</div>
					</div>
					<div class="col-md-6 bottom-space">
						<div class="card">
							<div class="header">
								<h4 class="title">
									<b>KERUGIAN KEUANGAN NEGARA</b>
								</h4>
								<!-- 					<p class="category">Pie Chart</p> -->
							</div>
							<div class="content">
								<div id="kerugian" style="height: 250px; width: 100%;"></div>
								<!--  <canvas id="pieKerugian" class="full-width" width="300" height="200" style="width: 300px; height: 200px;"></canvas>-->

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="<?php echo base_url()?>assets/js/jquery-3.1.0.min.js"></script>
	<script src="<?php echo base_url()?>assets/js/bootstrap.min.js"></script>
	<script src="<?php echo base_url()?>assets/js/jquery.price_format.2.0.min.js"></script>
	<script src="<?php echo base_url()?>assets/js/canvasjs.min.js"></script>
	<script>

	function printDiv(selector) {
	    $('body .site-container').css({display:'none'});
	    var content = $(selector).clone();
	    $('body .site-container').before(content);
	    window.print();
	    $(selector).first().remove();
	    $('body .site-container').css({display:''});
	}
		

	/* function printDiv(divName) {
	     var printContents = document.getElementById(divName).innerHTML;
	     var originalContents = document.body.innerHTML;

	     document.body.innerHTML = printContents;

	     window.print();

	     document.body.innerHTML = originalContents;
	} */
	
$(function(){
	  $('.rupiah').priceFormat({
			prefix : 'Rp ',
			thousandsSeparator : ',',
			centsLimit : 0
		});
	    
	var tindak_lanjut = new CanvasJS.Chart("tindak_lanjut",
			{
//				title:{
//					text: "TLHP"
//				},
		                animationEnabled: true,
				legend:{
					verticalAlign: "bottom",
					horizontalAlign: "center"
				},
				data: [
				{        
					indexLabelFontSize: 20,
					indexLabelFontFamily: "Monospace",       
					indexLabelFontColor: "darkgrey", 
					indexLabelLineColor: "darkgrey",        
					indexLabelPlacement: "outside",
					type: "pie",       
					showInLegend: true,
					toolTipContent: "{y} - <strong>#percent%</strong>",
					dataPoints: [
						{  y: 38, legendText:"belum tl", indexLabel: "BELUM TL : <?php echo $totalBelumTl ?>" },
						{  y: 45, legendText:"selesai tl", indexLabel: "SELESAI TL : <?php echo $totalSelesaiTl?>" },
						{  y: 17, legendText:"belum sesuai",exploded: true, indexLabel: "BELUM SESUAI : <?php echo $totalBelumSesuaiRekomendasi?>" },
						{  y: 1, legendText:"tidak dapat tl" , indexLabel: "TIDAK DAPAT TL : 1"},
					]
				}
				]
			});
	tindak_lanjut.render();
});

$(function(){
	var kerugian = new CanvasJS.Chart("kerugian",
			{
//				title:{
//					text: "KERUGIAN KEUANGAN NEGARA"
//				},
		                animationEnabled: true,
				legend:{
					verticalAlign: "bottom",
					horizontalAlign: "center"
				},
				data: [
				{        
					indexLabelFontSize: 20,
					indexLabelFontFamily: "Monospace",       
					indexLabelFontColor: "darkgrey", 
					indexLabelLineColor: "darkgrey",        
					indexLabelPlacement: "outside",
					type: "pie",       
					showInLegend: true,
					toolTipContent: "{y} - <strong>#percent%</strong>",
					dataPoints: [
						{  y: 62, legendText:"telah disetor", indexLabel: "TELAH DISETOR : 62%" },
						{  y: 38, legendText:"belum disetor", indexLabel: "BELUM DISETOR : 38%" }
					]
				}
				]
			});
	kerugian.render();
});

//	console.debug(site_url+ "assets/js/paper-dashboard");
    /*requirejs.config({
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
    requirejs(["jspath/menusa"]);*/
</script>
</body>
</html>