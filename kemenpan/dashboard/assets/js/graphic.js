$(document).ready(
				function() {

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
								+ ': '
								+ label.value.toString().replace(
										/\B(?=(\d{3})+(?!\d))/g, ".");
					}; // "<%= value %>";
					
					// For a bar chart
					/*var myBar = document.getElementById("myBar");
					var myBarChart = new Chart(
							myBar,
							{
								type : 'bar',
								responsive : true,
								data : {
									labels : [ "2011", "2012", "2013", "2014",
											"2015", "2016" ],
									datasets : [
											{
												label : 'Jumlah',
												data : [ 12, 16, 9, 4, 7, 3 ],
												yAxisID : "y-axis-1",
												backgroundColor : [
														'rgb(102, 153, 255)',
														'rgb(102, 153, 255)',
														'rgb(102, 153, 255)',
														'rgb(102, 153, 255)',
														'rgb(102, 153, 255)',
														'rgb(102, 153, 255)' ],
												borderColor : [
														'rgb(0, 102, 255)',
														'rgb(0, 102, 255)',
														'rgb(0, 102, 255)',
														'rgb(0, 102, 255)',
														'rgb(0, 102, 255)',
														'rgb(0, 102, 255)' ],
												borderWidth : 1
											},
											{

												label : 'Nilai',
												data : [ 1000000000,
														2000000000, 3000000000,
														1500000000, 1700000000,
														250000000 ],
												yAxisID : "y-axis-2",
												backgroundColor : [
														'rgb(0, 204, 102)',
														'rgb(0, 204, 102)',
														'rgb(0, 204, 102)',
														'rgb(0, 204, 102)',
														'rgb(0, 204, 102)',
														'rgb(0, 204, 102)' ],
												borderColor : [
														'rgb(51, 153, 51)',
														'rgb(51, 153, 51)',
														'rgb(51, 153, 51)',
														'rgb(51, 153, 51)',
														'rgb(51, 153, 51)',
														'rgb(51, 153, 51)' ],
												borderWidth : 1
											} ]
								},
								options : {
									tooltipTemplate : "<%= datasetLabel %> - <%= value.toLocaleString() %>",

									scales : {
										yAxes : [ {
											id : "y-axis-1",
											ticks : {
												beginAtZero : true
											}
										}, {
											type : "linear", // only linear
																// but allow
																// scale type
																// registration.
																// This allows
																// extensions to
																// exist solely
																// for log scale
																// for instance
											display : true,
											position : "right",
											id : "y-axis-2",
											gridLines : {
												drawOnChartArea : false
											}
										} ]
									}
								}
							});*/

					// For a pie chart
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

					// Demo Line
					/*var dataLine = {
						labels : [ "2010", "2011", "2012", "2013",
								"2014", "2015", "2016" ],
						datasets : [ {
							label : "Temuan",
							fill : false,
							lineTension : 0.1,
							backgroundColor : "rgb(0, 204, 102)",
							borderColor : "rgba(75,192,192,1)",
							borderCapStyle : 'butt',
							borderDash : [],
							borderDashOffset : 0.0,
							borderJoinStyle : 'miter',
							pointBorderColor : "rgba(75,192,192,1)",
							pointBackgroundColor : "#fff",
							pointBorderWidth : 1,
							pointHoverRadius : 5,
							pointHoverBackgroundColor : "rgba(75,192,192,1)",
							pointHoverBorderColor : "rgba(220,220,220,1)",
							pointHoverBorderWidth : 2,
							pointRadius : 1,
							pointHitRadius : 10,
							data : [ 65, 59, 80, 81, 56, 55, 40 ],
						}, {
							label : "Rekomendasi",
							fill : false,
							lineTension : 0.1,
							backgroundColor : "rgb(102, 153, 255)",
							borderColor : "rgba(30,160,130,1)",
							borderCapStyle : 'butt',
							borderDash : [],
							borderDashOffset : 0.0,
							borderJoinStyle : 'miter',
							pointBorderColor : "rgba(75,192,192,1)",
							pointBackgroundColor : "#fff",
							pointBorderWidth : 1,
							pointHoverRadius : 5,
							pointHoverBackgroundColor : "rgba(75,160,192,1)",
							pointHoverBorderColor : "rgba(220,230,220,1)",
							pointHoverBorderWidth : 2,
							pointRadius : 1,
							pointHitRadius : 10,
							data : [ 20, 30, 10, 90, 40, 50, 30 ],
						} ]
					};

					var myLine = document.getElementById("myLine");
					var myLineChart = Chart.Line(myLine, {
						type : 'line',
						data : dataLine,
					});*/

					// demo.initChartist();

					/*
					 * $.notify({ icon: 'ti-gift', message: "Welcome to <b>Paper
					 * Dashboard</b> - a beautiful Bootstrap freebie for your
					 * next project."
					 * 
					 * },{ type: 'success', timer: 4000 });
					 */

				});