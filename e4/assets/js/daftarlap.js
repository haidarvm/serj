define([ "jquery", "knockout", "bootstrap", "data-table" ], function($, ko) {

//	window.refreshTable = function refreshLogHistoryTable() {
//		$('#daftarlap_table').DataTable().ajax.reload();
//	}

	/*$(function() {
		$('#daftarlap_table').DataTable({
			 "processing": true,
			 "serverSide": true,
			 "order": [[ 0, "desc" ]],
			 "ajax": site_url + 'tlhp/template/get_daftarlap_list',
			 "columns":[
			 { "data": "nomor_laporan"},
			 { "data": "periode_laporan" },
			 { "data": "create_date" },
			 { "data": "tanggal_laporan" },
			 { "data": "judul_laporan" }
			 ]
			
		});
	});*/
	$(function () {
	    $('#daftarlap_table').DataTable({
	    	"paging" : true,
	    	"lengthChange" : false,
	    	"searching" : true,
	    	"ordering" : false,
			"order": [[ 0, "desc" ]],
	    	"info" : true,
	    	"autoWidth" : false
	    });
	    
	    /**
	     * Show file list
	     * agusprasetyo811@gmail.com
	     */
	    $(document).on("click", ".showfileListModal", function (e) {
		   $('#fileListModal').modal('show');
		   var id = $(this).data("id");
		   $('#fileListContainer').html('<div align="center">Loading File ...</div');
		   var table = 
			   '<table class="table">'
			   		+'<thead>'
			  		+'<tr>'
			  			+'<th>Nama File</th>'
			  			+'<th>Jenis</th>'
			  			+'<th>Tanggal Upload</th>'
			  		+'</tr>'
			  		+'</thead>';
		   
		   $.ajax({
				type: 'GET',
				url: site_url + "tlhp/template/show_file_list",
				data: "template_laporan_id="+ id,
				success: function(data) {
					console.info(data);
					var getFiles = $.parseJSON(data);
					for (var i = 0; i< getFiles.length; i++) {
						table +=
						  '<tr>'
				  			+'<td>'+getFiles[i].file_name+'</td>'
				  			+'<td>'+getFiles[i].ext+'</td>'
				  			+'<td>'+getFiles[i].update_date+'</td>'
				  		+'</tr>';
					}
					table +=
						'</table>';				
					$('#fileListContainer').html(table);
				},
				error: function(xhr, msg) {
					alert('Ups, Internal Server Error');
				}
			});
	        return false;
	   });
	});
});