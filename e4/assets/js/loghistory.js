define(["jquery", "knockout", "bootstrap", "data-table"], function($, ko){
	
	window.refreshTable = function refreshLogHistoryTable() {
		$('#tlhp_log_history_table').DataTable().ajax.reload();
	}
	
    $(function(){	
        $('#tlhp_log_history_table').DataTable({
            "processing": true,
            "serverSide": true,
            "order": [[ 0, "desc" ]],
            "ajax":  site_url + 'tlhp/loghistory/get_user_history_list',
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
    });
 });