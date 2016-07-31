define(["jquery", "bootstrap", "data-table"], function($){
	
	window.userEdit = function userEdit(id) {
    	var body = site_url + 'tlhp/manus/update/'+ id;
    	$('#userModal').modal('show').find('.modal-body').load(body);
    }
	
    $(function(){
        $('#manus-grid').DataTable( {
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
                $('td:eq(1)', nRow).html('<a onclick="userEdit(' + aData[0] + ')" href="javascript:;" class="fire">' + aData[1] + '</a>');
                return nRow;
            },
            "aoColumnDefs": [{
                    "aTargets": [7],
                    mRender: function ( data, type, row ) {
                            //return '<div class="btn-group"><a onclick="userEdit()"  href="'+ site_url + 'tlhp/manus/update_user/'+ row[0]+'" class="user-modal-edit  btn btn-primary btn-xs"><i class="fa fa-eye"></i> Edit</a> &nbsp; <a href="#" data-toggle="modal" data-target="#confirm-delete-modal" data-href="'+ site_url + 'tlhp/manus/delete/'+ row[0]+'" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</a></div>';
                            return '<div class="btn-group"><a onClick="userEdit('+row[0]+')" href="javascript:;" class="user-modal-edit  btn btn-primary btn-xs"><i class="fa fa-eye"></i> Edit</a> &nbsp; <a onclick="return confirm('+"'Anda yakin ingin menghapus data ini ...?'"+')"  href="'+ site_url + 'tlhp/manus/delete/'+ row[0]+'" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</a></div>';

                    }
            }]
        });
    });
    
    $('.user-modal').on('click', function(e){
        $('#userModal').modal('show');
        return false;
    });
    
 });