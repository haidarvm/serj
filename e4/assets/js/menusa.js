define(["jquery", "canvasjs", "bootstrap"], function($, window){
    $(function(){
    	console.debug(CanvasJS.Chart.version);
    	
    	var tindak_lanjut = new CanvasJS.Chart("tindak_lanjut",
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
    						{  y: 38, legendText:"belum tl", indexLabel: "BELUM TL" },
    						{  y: 45, legendText:"selesai tl", indexLabel: "SELESAI TL" },
    						{  y: 17, legendText:"belum sesuai",exploded: true, indexLabel: "BELUM SESUAI" },
    						{  y: 1, legendText:"tidak dapat tl" , indexLabel: "TIDAK DAPAT TL"},
    					]
    				}
    				]
    			});
    	tindak_lanjut.render();
    });
    
    $(function(){
    	console.debug(CanvasJS.Chart.version);
    	
    	var kerugian = new CanvasJS.Chart("kerugian",
    			{
    				title:{
    					text: "KERUGIAN KEUANGAN"
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
    						{  y: 62, legendText:"telah disetor", indexLabel: "TELAH DISETOR" },
    						{  y: 38, legendText:"belum disetor", indexLabel: "BELUM DISETOR" }
    					]
    				}
    				]
    			});
    	kerugian.render();
    });
});