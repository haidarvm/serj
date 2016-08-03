$(document).ready(function() {
	// Management User 
        /** uda dipindahin ke manus.js
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
			    $('td:eq(1)', nRow).html('<a onclick="userEdit(' + aData[0] + ')" href="javascript:;">' + aData[1] + '</a>');
			    return nRow;
			  },

			"aoColumnDefs": [{
				"aTargets": [7],
				mRender: function ( data, type, row ) {
					//return '<div class="btn-group"><a onclick="userEdit()"  href="'+ site_url + 'tlhp/manus/update_user/'+ row[0]+'" class="user-modal-edit  btn btn-primary btn-xs"><i class="fa fa-eye"></i> Edit</a> &nbsp; <a href="#" data-toggle="modal" data-target="#confirm-delete-modal" data-href="'+ site_url + 'tlhp/manus/delete/'+ row[0]+'" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</a></div>';
					return '<div class="btn-group"><a onclick="userEdit('+row[0]+')" href="javascript:;" class="user-modal-edit  btn btn-primary btn-xs"><i class="fa fa-eye"></i> Edit</a> &nbsp; <a onclick="return confirm('+"'Anda yakin ingin menghapus data ini ...?'"+')"  href="'+ site_url + 'tlhp/manus/delete/'+ row[0]+'" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</a></div>';
					
				}
			}]
      }); **/
	
	// uda dipindah ke manus.js
 	// add tim
//	$('#add-tim').click(function(event){
//		event.preventDefault();
//		console.log('tambah tim');
//		var add_more = $('.add-more-tim').last().clone(true).show();
//		$('#tim-more').append(add_more);
//	});
//	
// 	// add tim oerpanjangan
//	$('#add-tim-perpanjangan').click(function(event){
//		event.preventDefault();
//		console.log('tambah tim perpanjangan');
//		var add_more = $('.add-more-tim-perpanjangan').last().clone(true).show();
////			$('#noper-more').append($('.add-more-noper').show());
//		$('#tim-more').append(add_more);
//	});

	// Add new tr rekomendasi 

	/**
	 * ############ KKLHP
	 * 
	 */
	$(function () {
	    $('#kode_sebab').DataTable({
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
	      "paging": true,
	      "lengthChange": false,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false
	    });
	});
	
	$('#summernote').summernote();
    $('#summernote2').summernote();

/**
 * User Edit and Render to Modal
 * 
 * @param id
 * @returns
 */
/**
function userEdit(id) {
	body = site_url + 'tlhp/manus/update/'+ id;
	$('#userModal').modal('show').find('.modal-body').load(body);
} **/


