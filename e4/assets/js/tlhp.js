$(document).ready(function() {
// Management User 
 	 $(document).ready(function() {
                var dataTable = $('#manus-grid').DataTable( {
                    "processing": true,
                    "serverSide": true,
                    "order": [[ 0, "desc" ]],
                    "ajax":{
                        url : site_url + 'tlhp/manus/get_all_user', // json data
                        type: "post",  
                        error: function(){  // error handling
                            $(".data-grid-error").html("");
                            $("#data-grid").append('<tbody class="data-grid-error"><tr><th colspan="3">No data found in the server</th></tr></tbody>');
                            $("#data-grid_processing").css("display","none");
                        }
                    },

					"fnRowCallback": function( nRow, aData, iDisplayIndex ) {
					    $('td:eq(1)', nRow).html('<a href="'+ site_url + 'tlhp/manus/detail/' + aData[0] + '">' + aData[1] + '</a>');
					    return nRow;
					  },

					"aoColumnDefs": [{
						"aTargets": [7],
						mRender: function ( data, type, row ) {
							return '<div class="btn-group"><a href="'+ site_url + 'admin/manus/detail/'+ row[0]+'" class="btn btn-primary btn-xs"><i class="fa fa-eye"></i> Detail</a> &nbsp; <a href="#" data-toggle="modal" data-target="#confirm-delete-modal" data-href="'+ site_url + 'admin/manus/delete/'+ row[0]+'" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</a></div>';
						}
					}]
          });
      });
});