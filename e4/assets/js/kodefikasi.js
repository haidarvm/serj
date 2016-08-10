define(["jquery", "knockout", "bootstrap", "data-table"], function($, ko){
	
	window.refreshTable = function refreshLogHistoryTable() {
		$('#tlhp_log_history_table').DataTable().ajax.reload();
	}
	
    /*$(function(){	
        $('#kode_temuan').DataTable({
            "processing": true,
            "serverSide": true,
            "order": [[ 0, "desc" ]],
            "ajax":  site_url + 'tlhp/kodefikasi/get_user_history_list',
            "columns":[ 
                       { "data": "no"},
                       { "data": "full_name" },
                       { "data": "username" },
                       { "data": "jabatan" },
                       { "data": "unit_kerja" },
                       { "data": "login" },
                       { "data": "lama_penggunaan" },
          ]
        });
    });*/
	$(function () {
	    $('#kode_temuan').DataTable({
	      "paging": true,
	      "lengthChange": false,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false
	    });
	});
	$(function () {
	    $('#kode_rekomendasi').DataTable({
	      "paging": false,
	      "lengthChange": false,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false
	    });
	});
	$(function () {
	    $('#kode_sebab').DataTable({
	      "paging": false,
	      "lengthChange": false,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false
	    });
	});
 });
	
	
	