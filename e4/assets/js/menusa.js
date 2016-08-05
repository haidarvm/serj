define(["jquery", "canvasjs", "bootstrap"], function($, window){
    $(function(){
    	var tindak_lanjut = new CanvasJS.Chart("tindak_lanjut",
    			{
//    				title:{
//    					text: "TLHP"
//    				},
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
    						{  y: 38, legendText:"belum tl", indexLabel: "BELUM TL : 38" },
    						{  y: 45, legendText:"selesai tl", indexLabel: "SELESAI TL : 45" },
    						{  y: 17, legendText:"belum sesuai",exploded: true, indexLabel: "BELUM SESUAI : 17" },
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
//    				title:{
//    					text: "KERUGIAN KEUANGAN NEGARA"
//    				},
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
});