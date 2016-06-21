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

    		
        	//demo.initChartist();

        	/* $.notify({
            	icon: 'ti-gift',
            	message: "Welcome to <b>Paper Dashboard</b> - a beautiful Bootstrap freebie for your next project."

            },{
                type: 'success',
                timer: 4000
            }); */

    	});