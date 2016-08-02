define(["jquery", "knockout", "bootstrap", "data-table"], function($, ko){
	
	window.refreshTable = function refreshLogHistoryTable() {
		$('#daftarlap_table').DataTable().ajax.reload();
	}
	
    $(function(){	
        $('#daftarlap_table').DataTable({
            "processing": true,
            "serverSide": true,
            "order": [[ 0, "desc" ]],
            "ajax":  site_url + 'tlhp/template/get_daftarlap_list',
            "columns":[ 
                       { "data": "nomor_laporan"},
                       { "data": "periode_laporan" },
                       { "data": "create_date" },
                       { "data": "tanggal_laporan" },
                       { "data": "judul_laporan" }
          ]
        });
    });
 });