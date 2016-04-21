$(function() {

	// Example Data
	 
	 var data = [
	        	 { label: "Kurang", data: 30},
	        	 { label: "Cukup", data: 30},
	        	 { label: "Bagus", data: 30},
	        	 { label: "Istimewa", data: 10},
	        	 ];
	 var data2 = [
	        	 { label: "Kurang", data: 20},
	        	 { label: "Cukup", data: 40},
	        	 { label: "Bagus", data: 20},
	        	 { label: "Istimewa", data: 20},
	        	 ];
	 var data3 = [
	        	 { label: "Kurang", data: 10},
	        	 { label: "Cukup", data: 50},
	        	 { label: "Bagus", data: 20},
	        	 { label: "Istimewa", data: 20},
	        	 ];
	 var data4 = [
	        	 { label: "Kurang", data: 10},
	        	 { label: "Cukup", data: 60},
	        	 { label: "Bagus", data: 20},
	        	 { label: "Istimewa", data: 10},
	        	 ];

	// var data = [
	// { label: "Series1", data: [[1,10]]},
	// { label: "Series2", data: [[1,30]]},
	// { label: "Series3", data: [[1,90]]},
	// { label: "Series4", data: [[1,70]]},
	// { label: "Series5", data: [[1,80]]},
	// { label: "Series6", data: [[1,0]]}
	// ];

	// var data = [
	// { label: "Series A", data: 0.2063},
	// { label: "Series B", data: 38888}
	// ];

	// Randomly Generated Data

//	var data = [], series = Math.floor(Math.random() * 6) + 3;

//	for (var i = 0; i < series; i++) {
//		data[i] = {
//			label : "Series" + (i + 1),
//			data : Math.floor(Math.random() * 100) + 1
//		}
//	}

	var placeholder = $("#placeholder");

	placeholder.unbind();

	$.plot(placeholder, data, {
		series : {
			pie : {
				show : true,
				radius : 1,
				label : {
					show : true,
					radius : 3 / 4,
					formatter : labelFormatter,
					background : {
						opacity : 0.5,
						color : "#000"
					}
				}
			}
		},
		legend : {
			show : false
		}
	});

	var placeholder2 = $("#placeholder2");
	
	$.plot(placeholder2, data2, {
		series : {
			pie : {
				show : true,
				radius : 1,
				label : {
					show : true,
					radius : 3 / 4,
					formatter : labelFormatter,
					background : {
						opacity : 0.5,
						color : "#000"
					}
				}
			}
		},
		legend : {
			show : false
		}
	});
	
	var placeholder3 = $("#placeholder3");
	
	$.plot(placeholder3, data3, {
		series : {
			pie : {
				show : true,
				radius : 1,
				label : {
					show : true,
					radius : 3 / 4,
					formatter : labelFormatter,
					background : {
						opacity : 0.5,
						color : "#000"
					}
				}
			}
		},
		legend : {
			show : false
		}
	});

	var placeholder4 = $("#placeholder4");
	
	$.plot(placeholder4, data4, {
		series : {
			pie : {
				show : true,
				radius : 1,
				label : {
					show : true,
					radius : 3 / 4,
					formatter : labelFormatter,
					background : {
						opacity : 0.5,
						color : "#000"
					}
				}
			}
		},
		legend : {
			show : false
		}
	});

	setCode([ "$.plot('#placeholder', data, {", "    series: {",
			"        pie: { ", "            show: true,",
			"            radius: 1,", "            label: {",
			"                show: true,", "                radius: 3/4,",
			"                formatter: labelFormatter,",
			"                background: { ",
			"                    opacity: 0.5,",
			"                    color: '#000'", "                }",
			"            }", "        }", "    },", "    legend: {",
			"        show: false", "    }", "});" ]);

	placeholder.bind("plothover", function(event, pos, obj) {

		if (!obj) {
			return;
		}

		var percent = parseFloat(obj.series.percent).toFixed(2);
		$("#hover").html(
				"<span style='font-weight:bold; color:" + obj.series.color
						+ "'>" + obj.series.label + " (" + percent
						+ "%)</span>");
	});

	placeholder.bind("plotclick", function(event, pos, obj) {

		if (!obj) {
			return;
		}

		percent = parseFloat(obj.series.percent).toFixed(2);
		alert("" + obj.series.label + ": " + percent + "%");
	});
});




// A null signifies separate line segments

var bhsindo = [ ["1 January", 10], ["14 January", 8], ["1 Febuari", 4], ["14 Febuari", 7], ["1 Maret", 5], ["14 Maret", 7] ];
var math = [ ["1 January", 8], ["14 January", 7], ["1 Febuari", 5], ["14 Febuari", 7], ["1 Maret", 6], ["14 Maret", 9] ];
var biologi = [ ["1 January", 9], ["14 January", 6], ["1 Febuari", 6], ["14 Febuari", 7], ["1 Maret", 7], ["14 Maret", 8] ];
var eng = [ ["1 January", 10], ["14 January", 8], ["1 Febuari", 7], ["14 Febuari", 7], ["1 Maret", 5], ["14 Maret", 10] ];

var d3 = [[0, 12], [7, 12], null, [7, 2.5], [12, 2.5]];

$.plot("#stat-nilai", [ { data: bhsindo, label: "Bahasa Indonesia" }, 
                        {data: math, label : "Matematika"}, 
                        {data: biologi, label : "Biologi"} 
                      ],
	                  	{ xaxis: {
	              		mode: "categories",
	              		tickLength: 0
	              	} }
					);



//$.plot("#stat-nilai", [ datastat ], {
//	series: {
//		bars: {
//			show: true,
//			barWidth: 0.6,
//			align: "center"
//		}
//	},
//	xaxis: {
//		mode: "categories",
//		tickLength: 0
//	}
//});

// Show the initial default chart

// Add

// A custom label formatter used by several of the plots

function labelFormatter(label, series) {
	return "<div style='font-size:8pt; text-align:center; padding:2px; color:white;'>"
			+ label + "<br/>" + Math.round(series.percent) + "%</div>";
}

//

function setCode(lines) {
	$("#code").text(lines.join("\n"));
}