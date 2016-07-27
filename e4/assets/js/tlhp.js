$(document).ready(function() {
	// Management User 
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
      });
 	 
 	// add tim
	$('#add-tim').click(function(event){
		event.preventDefault();
		console.log('tambah tim');
		var add_more = $('.add-more-tim').last().clone(true).show();
		$('#tim-more').append(add_more);
	});
	
 	// add tim oerpanjangan
	$('#add-tim-perpanjangan').click(function(event){
		event.preventDefault();
		console.log('tambah tim perpanjangan');
		var add_more = $('.add-more-tim-perpanjangan').last().clone(true).show();
//			$('#noper-more').append($('.add-more-noper').show());
		$('#tim-more').append(add_more);
	});

	// Add new tr rekomendasi 

	/**
	 * ############ TEMUAN A
	 * 
	 */
	
	$("#add-temuan").click(function(event){
		event.preventDefault();
		console.log('add new temuan');
		var add_more_temuan = $('.temuan-tr').last().clone();
		$('.temuan-tr:last').after(add_more_temuan);	
		$('.no-temuan:last').text(+($('.no-temuan:last').text()) + 1);
		//$('tr.rekomen-tr').last().after($(".hiddensit")).clone(true);
	});
	
	// Add new tr rekomendasi 1
	$(".add-rekomen-1").click(function(event){
		event.preventDefault();
		console.log('add new rekomen');
		var add_more_rekomen = $('.rekomen-tr-1').last().clone();
		$('.rekomen-tr-1:last').after(add_more_rekomen);	
		$('.no-rekomen-1:last').text(+($('.no-rekomen-1:last').text()) + 1);
		//$('tr.rekomen-tr').last().after($(".hiddensit")).clone(true);
	});
	
	// Add new tr rekomendasi 2
	$(".add-rekomen-2").click(function(event){
		event.preventDefault();
		console.log('add new rekomen');
		var add_more_rekomen = $('.rekomen-tr-2').last().clone();
		$('.rekomen-tr-2:last').after(add_more_rekomen);	
		$('.no-rekomen-2:last').text(+($('.no-rekomen-2:last').text()) + 1);
		//$('tr.rekomen-tr').last().after($(".hiddensit")).clone(true);
	});

	// Add new tr rekomendasi 2
	$(".add-rekomen-3").click(function(event){
		event.preventDefault();
		console.log('add new rekomen');
		var add_more_rekomen = $('.rekomen-tr-3').last().clone();
		$('.rekomen-tr-3:last').after(add_more_rekomen);	
		$('.no-rekomen-3:last').text(+($('.no-rekomen-3:last').text()) + 1);
		//$('tr.rekomen-tr').last().after($(".hiddensit")).clone(true);
	});
	
	/**
	 * ############ TEMUAN B
	 * 
	 */
	// Add new tr rekomendasi 
	$("#add-temuan-b").click(function(event){
		event.preventDefault();
		console.log('add new temuan');
		var add_more_temuan = $('.temuan-b-tr').last().clone();
		$('.temuan-b-tr:last').after(add_more_temuan);	
		$('.no-temuan-b:last').text(+($('.no-temuan-b:last').text()) + 1);
		//$('tr.rekomen-tr').last().after($(".hiddensit")).clone(true);
	});
	
	// Add new tr rekomendasi 1
	$(".add-rekomen-b-1").click(function(event){
		event.preventDefault();
		console.log('add new rekomen');
		var add_more_rekomen = $('.rekomen-b-tr-1').last().clone();
		$('.rekomen-b-tr-1:last').after(add_more_rekomen);	
		$('.no-rekomen-b-1:last').text(+($('.no-rekomen-b-1:last').text()) + 1);
		//$('tr.rekomen-tr').last().after($(".hiddensit")).clone(true);
	});
	
	// Add new tr rekomendasi 2
	$(".add-rekomen-b-2").click(function(event){
		event.preventDefault();
		console.log('add new rekomen');
		var add_more_rekomen = $('.rekomen-b-tr-2').last().clone();
		$('.rekomen-b-tr-2:last').after(add_more_rekomen);	
		$('.no-rekomen-b-2:last').text(+($('.no-rekomen-b-2:last').text()) + 1);
		//$('tr.rekomen-tr').last().after($(".hiddensit")).clone(true);
	});

	// Add new tr rekomendasi 2
	$(".add-rekomen-b-3").click(function(event){
		event.preventDefault();
		console.log('add new rekomen');
		var add_more_rekomen = $('.rekomen-tr-3').last().clone();
		$('.rekomen-b-tr-3:last').after(add_more_rekomen);	
		$('.no-rekomen-b-3:last').text(+($('.no-rekomen-b-3:last').text()) + 1);
		//$('tr.rekomen-tr').last().after($(".hiddensit")).clone(true);
	});
	/**
	 * ############ END TEMUAN B
	 * 
	 */
	
	// Add new tr tindak lanjut 
	$("#add-tl").click(function(event){
		event.preventDefault();
		console.log('add new tl');
		var add_more_rekomen = $('.tl-tr').last().clone();
		$('.tl-tr:last').after(add_more_rekomen);	
		$('.no-tl:last').text(+($('.no-tl:last').text()) + 1);
		//$('tr.rekomen-tr').last().after($(".hiddensit")).clone(true);
	});
	
	
	// Save All KKLHP 
	$('#kklhp').click(function() {
		$("#kklhp-form").submit();
	});
	
	// load user
	$('.user-modal').on('click', function(e){
		  e.preventDefault();
		  $('#userModal').modal('show').find('.modal-body').load($(this).attr('href'));
	});
	
});

//add tim
$('#add-tim').click(function(event){
	event.preventDefault();
	console.log('tambah tim');
	var add_more = $('.add-more-tim').last().clone(true).show();
//		$('#noper-more').append($('.add-more-noper').show());
	$('#tim-more').append(add_more);
});

/**
 * User Edit and Render to Modal
 * 
 * @param id
 * @returns
 */
function userEdit(id) {
	body = site_url + 'tlhp/manus/update/'+ id;
	$('#userModal').modal('show').find('.modal-body').load(body);
}

function refreshManusTable() {
	$('#manus-grid').DataTable().ajax.reload();
}
