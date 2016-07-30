define(["jquery", "chart"], function($){
    $(function(){
        
        function addCommas(nStr) {
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
        });

    });
});