<footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>

                        <li>
                            <a href="http://www.creative-tim.com">
                                PERURI
                            </a>
                        </li>
                        <li>
                            <a href="http://blog.creative-tim.com">
                               Blog
                            </a>
                        </li>
                        <li>
                            <a href="http://www.creative-tim.com/license">
                                Licenses
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by <a href="http://www.creative-tim.com">Creative Tim</a>
                </div>
            </div>
        </footer>

    </div>
</div>


</body>

    <!--   Core JS Files   -->
    <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="assets/js/Chart.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>

	<script type="text/javascript">
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
	</script>

</html>
