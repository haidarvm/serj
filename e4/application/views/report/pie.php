<!DOCTYPE HTML>
<html>
<head>
</head>
<body>
	<div id="chartContainer" style="height: 300px; width: 100%;"></div>
<script type="text/javascript" src="<?=site_url()?>assets/js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="<?=site_url()?>assets/js/jquery.canvasjs.min.js"></script>
<script type="text/javascript">
window.onload = function () {
	var chart = new CanvasJS.Chart("chartContainer",
	{
		title:{
			text: "Haidar Ganteng"
		},
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
				{  y: 4181563, legendText:"PS 3", indexLabel: "PlayStation 3" },
				{  y: 2175498, legendText:"Wii", indexLabel: "Wii" },
				{  y: 3125844, legendText:"360",exploded: true, indexLabel: "Xbox 360" },
				{  y: 1176121, legendText:"DS" , indexLabel: "Nintendo DS"},
				{  y: 1727161, legendText:"PSP", indexLabel: "PSP" },
				{  y: 4303364, legendText:"3DS" , indexLabel: "Nintendo 3DS"},
				{  y: 1717786, legendText:"Vita" , indexLabel: "PS Vita"}
			]
		}
		]
	});
	chart.render();
}
</script>
</body>
</html>
