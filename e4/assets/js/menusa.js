define(["jquery", "canvasjs", "bootstrap"], function($, window){
    $(function(){
    	console.debug(CanvasJS.Chart.version);
    	/*function addCommas(nStr) {
            nStr += '';
            x = nStr.split('.');
            x1 = x[0];
            x2 = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            while (rgx.test(x1)) {
                    x1 = x1.replace(rgx, '$1' + ',' + '$2');
            }
            return x1 + x2;
        }

        Chart.defaults.global.scaleLabel = function(label) {
            return label.value.toString().replace(
                            /\B(?=(\d{3})+(?!\d))/g, ".");

        };

        Chart.defaults.global.multiTooltipTemplate = function(label) {
            return label.datasetLabel
                + ': '+ label.value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        }; // "<%= value %>";
        
        var pieTindakLanjut = $("#pieTindakLanjut");
        var dataTindakLanjut = {
            labels : [ "TIDAK DAPAT TL", "SELESAI TL", "BELUM SESUAI", "BELUM TL" ],
            datasets : [ {
                data : [ 10, 40, 30, 100 ],
                backgroundColor : [ "#FF6384", "#36A2EB", "#FFCE56", "#7AC29A" ],
                hoverBackgroundColor : [ "#FF6384", "#36A2EB",
                                "#FFCE56","#62E43A" ]
            } ]
        };

        var pieTindakLanjutChart = new Chart(pieTindakLanjut, {
            type : 'pie',
            data : dataTindakLanjut,
        });
					
					// For a pie chart
        var pieKerugian = $("#pieKerugian");
        var dataKerugian = {
            labels : [ "TELAH DISETOR", "BELUM DISETOR" ],
            datasets : [ {
                data : [ 62, 38 ],
                backgroundColor : [ "#FF6384", "#36A2EB", "#FFCE56" ],
                hoverBackgroundColor : [ "#FF6384", "#36A2EB",
                                "#FFCE56" ]
            } ]
        };

        var pieKerugianChart = new Chart(pieKerugian, {
            type : 'pie',
            data : dataKerugian,
        });*/
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
    });
});