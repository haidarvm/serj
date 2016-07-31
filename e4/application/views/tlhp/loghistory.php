        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">LOG HISTORY</h4>
                                <p class="category">List History</p>
                            </div>

							<div class="content">
								<div class="table-responsive">
								  <table id="tlhp_log_history_table" class="table table-striped table-custom-head">
									<thead>
										<tr class="info">
											<td>NO</td>
											<td>NAMA</td>
											<td>USERNAME</td>
											<td>JABATAN</td>
											<td>UNIT KERJA</td>
											<td>LAST LOGIN</td>
											<td>LAMA PENGGUNAAN</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								  </table>
								</div>
							</div>
							
							<!--  
							<div class="t-center">
								<ul class="pagination"> 
									<li class="disabled"><a aria-label="Previous" href="#"><span aria-hidden="true">«</span></a></li> 
									<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li> 
									<li><a href="#">2</a></li> 
									<li><a href="#">3</a></li> 
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li> 
									<li><a aria-label="Next" href="#"><span aria-hidden="true">»</span></a></li> 
								</ul>
							</div>
							 -->
                              
							<div class="both-space t-right">
								<a class="btn btn-info" href="#"><i class="fa fa-print"></i> Print</a>
								<a class="btn btn-success" href="#"><i class="fa fa-file-pdf-o"></i> PDF</a>
								<a class="btn btn-danger" href="#"><i class="fa fa-undo"></i> Kembali</a>
							</div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
       
  
<script src="<?=site_url()?>assets/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="<?=site_url()?>assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<?=site_url()?>assets/js/jquery.dataTables.min.js"></script>

 <script type="text/javascript">
 var oTable;
 $(document).ready(function() {
   	 oTable = $('#tlhp_log_history_table').dataTable({
 	  	 "bPaginate": true,
 		 "bLengthChange": true,
 		 "bFilter": true,
 		 "bSort": true,
 		 "bInfo": true,
 		 "bAutoWidth": true,
 		 "aLengthMenu": [[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, 'All']],
 		 "bProcessing": true,
 	     "bServerSide": true,
 		 "sAjaxSource": "{SITE_INDEX}webadmin/order?get_order_data=true",
 		 "sDom": '<"container-fluid menus-area"<"row"<"col-md-4"f><"col-md-8"lp>>><"center"r><"tlhp_log_history_table table-container"<"table-responsive"t?><"container-fluid menus-area"<"row"<"col-md-4"i><"col-md-8"lp>>><"clear">',
 		 "bScrollCollapse": true,
 		 "aoColumns":[ 
 		     			{ "mData": "no"},
 	            		{ "mData": "log_id" },
 			          	{ "mData": "user_id" },
 			           	{ "mData": "login" },
 			           	{ "mData": "logout" }
 			 		],
 		 "oLanguage": {
 		        "sLengthMenu": "_MENU_ ",
 		        "sZeroRecords": "Data Tidak Ditemukan",
 		        "sSearch": "",
 	            "sInfo": "Halaman _START_ sampai _END_ , Total _TOTAL_ data"
 		 }
 	});

   	
//  	$("select[name='tlhp_log_history_table_length']" ).attr('style','width:70px;');
//  	$(".dataTables_paginate").attr('style', 'max-width:350px; padding:6px 0; margin:4px;').addClass('span pull-right').attr('align', 'right');
//  	$(".pagination").attr('style', 'margin:0px;').addClass('pagination-green');
//  	$(".dataTables_length").attr('style', 'max-width:75px; padding:6px 0;').addClass('span pull-right').attr('align', 'right');;
//  	$(".dataTables_filter").attr('style', 'padding:6px 0;').addClass('col-sm-7');
//  	$(".dataTables_filter>label>input").attr('placeholder', 'Filter Data').addClass('form-control');
//  	$(".menus-area").attr('style', 'margin:8px 0 0 0; padding:0');
//  	$(".pagging-area").attr('style', 'width:460px;');
//  	$(".table-container").attr('style', 'margin-top:0;');
//  	$("#tlhp_log_history_table" ).attr('style','width:100%; font-size: 11px;');

     
 });
 
</script>
