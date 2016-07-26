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
			    $('td:eq(1)', nRow).html('<a href="'+ site_url + 'tlhp/manus/detail/' + aData[0] + '">' + aData[1] + '</a>');
			    return nRow;
			  },

			"aoColumnDefs": [{
				"aTargets": [7],
				mRender: function ( data, type, row ) {
					//return '<div class="btn-group"><a onclick="userEdit()"  href="'+ site_url + 'tlhp/manus/update_user/'+ row[0]+'" class="user-modal-edit  btn btn-primary btn-xs"><i class="fa fa-eye"></i> Edit</a> &nbsp; <a href="#" data-toggle="modal" data-target="#confirm-delete-modal" data-href="'+ site_url + 'tlhp/manus/delete/'+ row[0]+'" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</a></div>';
					return '<div class="btn-group"><a onclick="userEdit('+row[0]+')" href="#" class="user-modal-edit  btn btn-primary btn-xs"><i class="fa fa-eye"></i> Edit</a> &nbsp; <a href="#" data-toggle="modal" data-target="#confirm-delete-modal" data-href="'+ site_url + 'tlhp/manus/delete/'+ row[0]+'" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</a></div>';
				}
			}]
      });
 	 
 	// add tim
	$('#add-tim').click(function(event){
		event.preventDefault();
		console.log('tambah tim');
		var add_more = $('.add-more-tim').last().clone(true).show();
//			$('#noper-more').append($('.add-more-noper').show());
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
	$("#add-temuan").click(function(event){
		event.preventDefault();
		console.log('add new rekomen');
		var add_more_temuan = $('.temuan-tr').last().clone();
		$('.temuan-tr:last').after(add_more_temuan);	
		$('.no-temuan:last').text(+($('.no-temuan:last').text()) + 1);
		//$('tr.rekomen-tr').last().after($(".hiddensit")).clone(true);
	});
	
	// Add new tr rekomendasi 
	$("#add-rekomen").click(function(event){
		event.preventDefault();
		console.log('add new rekomen');
		var add_more_rekomen = $('.rekomen-tr').last().clone();
		$('.rekomen-tr:last').after(add_more_rekomen);	
		$('.no-rekomen:last').text(+($('.no-rekomen:last').text()) + 1);
		//$('tr.rekomen-tr').last().after($(".hiddensit")).clone(true);
	});

	
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

function userEdit(id) {
	body = site_url + 'tlhp/manus/update_user/'+ id;
	$('#userModal').modal('show').find('.modal-body').load(body);
}