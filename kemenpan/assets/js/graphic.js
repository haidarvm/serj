$(document).ready(function(){

    		// For a bar chart
    		var ctx = document.getElementById("myChart");
    		var myChart = new Chart(ctx, {
    		    type: 'bar',
    		    data: {
    		        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
    		        datasets: [{
    		            label: '# of Votes',
    		            data: [12, 19, 3, 5, 2, 3],
    		            backgroundColor: [
    		                'rgba(255, 99, 132, 0.2)',
    		                'rgba(54, 162, 235, 0.2)',
    		                'rgba(255, 206, 86, 0.2)',
    		                'rgba(75, 192, 192, 0.2)',
    		                'rgba(153, 102, 255, 0.2)',
    		                'rgba(255, 159, 64, 0.2)'
    		            ],
    		            borderColor: [
    		                'rgba(255,99,132,1)',
    		                'rgba(54, 162, 235, 1)',
    		                'rgba(255, 206, 86, 1)',
    		                'rgba(75, 192, 192, 1)',
    		                'rgba(153, 102, 255, 1)',
    		                'rgba(255, 159, 64, 1)'
    		            ],
    		            borderWidth: 1
    		        }]
    		    },
    		    options: {
    		        scales: {
    		            yAxes: [{
    		                ticks: {
    		                    beginAtZero:true
    		                }
    		            }]
    		        }
    		    }
    		});


    		// For a pie chart
    		var myPie = document.getElementById("myPie");
    		var data2 = {
					    labels: [
					        "Red",
					        "Blue",
					        "Yellow"
					    ],
					    datasets: [
					        {
					            data: [300, 50, 100],
					            backgroundColor: [
					                "#FF6384",
					                "#36A2EB",
					                "#FFCE56"
					            ],
					            hoverBackgroundColor: [
					                "#FF6384",
					                "#36A2EB",
					                "#FFCE56"
					            ]
					        }]
					};
    		
    		var myPieChart = new Chart(myPie,{
    		    type: 'pie',
    		    data: data2,
    		});

    		
    		// Demo Line
    		
    		var dataLine = {
    			    labels: ["January", "February", "March", "April", "May", "June", "July"],
    			    datasets: [
    			        {
    			            label: "My First dataset",
    			            fill: false,
    			            lineTension: 0.1,
    			            backgroundColor: "rgba(75,192,192,0.4)",
    			            borderColor: "rgba(75,192,192,1)",
    			            borderCapStyle: 'butt',
    			            borderDash: [],
    			            borderDashOffset: 0.0,
    			            borderJoinStyle: 'miter',
    			            pointBorderColor: "rgba(75,192,192,1)",
    			            pointBackgroundColor: "#fff",
    			            pointBorderWidth: 1,
    			            pointHoverRadius: 5,
    			            pointHoverBackgroundColor: "rgba(75,192,192,1)",
    			            pointHoverBorderColor: "rgba(220,220,220,1)",
    			            pointHoverBorderWidth: 2,
    			            pointRadius: 1,
    			            pointHitRadius: 10,
    			            data: [65, 59, 80, 81, 56, 55, 40],
    			        }
    			    ]
    			};

    		var myLine = document.getElementById("myLine");
    		var myLineChart = Chart.Line(myLine, {
    			 type: 'line',
    			 data: dataLine,
    		});
    		
        	//demo.initChartist();

        	/* $.notify({
            	icon: 'ti-gift',
            	message: "Welcome to <b>Paper Dashboard</b> - a beautiful Bootstrap freebie for your next project."

            },{
                type: 'success',
                timer: 4000
            }); */

    	});