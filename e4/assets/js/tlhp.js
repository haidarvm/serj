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
	 * ############ KKLHP
	 * 
	 */
	$(document).on("click",".add-temuan",function(event){
		event.preventDefault();
		console.log('Tambah Temuan');
		var jenis 				 = $(this).attr("jenis");
		var kode_temuan  	 	 = $('#kode_temuan-'+jenis+' > option').clone();
		var kode_sebab_id	  	 = $('#kode_sebab_id-'+jenis+' > option').clone();
		var kerugian_negara   	 = $('#kerugian_negara-'+jenis+' > option').clone();
		var kode_rekomendasi_id  = $('#kode_rekomendasi_id-'+jenis+' > option').clone();
		var uker			  	 = $('#uker-'+jenis+' > option').clone();
		var nomor 			  	 = parseInt($("#nomor_temuan_"+jenis+"").val())+1;
        var html 			  = "<tr class='append"+jenis+nomor+" temuan-"+jenis+nomor+"'>";
		html 				 +="<td>"+nomor+"<button class='batal' type='button' nomor='nomor_temuan_"+jenis+"' tr='temuan-"+jenis+nomor+"'> x</button></td>";
		html 				 +="<td><select  class='form-control' id='kode_temuan-"+jenis+nomor+"'  name='kode_temuan_id-"+jenis+nomor+"'></select></td>";
		html 				 +='<td><input type="text" class="form-control border-input uraian_temuan" name="uraian_temuan-'+jenis+nomor+'" /></td>';
	    html 				 +="<td><select  class='form-control kode_sebab_id' id='kode_sebab_id-"+jenis+nomor+"'  name='kode_sebab_id-"+jenis+nomor+"'></select></td>";
	    html 				 +='<td><input type="text" class="form-control border-input" name="uraian_sebab-'+jenis+nomor+'" /></td>';
	    html 				 +='<td><input type="text" class="form-control border-input" name="nilai_temuan-'+jenis+nomor+'" /></td>';
	    html 				 +='<td> 1 <input type="hidden" value="1" id="jumlah_rekomen_'+jenis+nomor+'" name="jumlah_rekomen-'+jenis+nomor+'">  <input type="hidden" value="1" id="nomor_rekomen_'+jenis+nomor+'" name="nomor_rekomen-'+jenis+nomor+'"><button class="add-rekomen" jenis="'+jenis+'" type="button" nomor="'+nomor+'">+</button></td>';
	    html 				 +="<td><select  class='form-control kode_rekomendasi_id' id='kode_rekomendasi_id-"+jenis+nomor+"'  name='kode_rekomendasi_id-"+jenis+nomor+"1'></select></td>";
	    html 				 +='<td><input type="text" class="form-control border-input" name="uraian_rekomendasi-'+jenis+nomor+'1" /></td>';
	    html 				 +="<td><select  class='form-control ' id='kerugian_negara-"+jenis+nomor+"'  name='kerugian_negara-"+jenis+nomor+"1'></select></td>";
	    html 				 +='<td><input type="text" class="form-control border-input " name="nilai_rekomendasi-'+jenis+nomor+'1" /></td>';
	    html 				 +="<td><select  class='form-control ' id='nama_ppk-"+jenis+nomor+"'  name='nama_ppk-"+jenis+nomor+"1'></select></td>";
		html 				 +="<td></td>";
		html 				 +="<td></td>";
		html 				 +="<td></td>";
		html 				 +="<td></td>";
		html 				 +="<td></td>";
		html 				 +="<td></td>";
		html 				 +="<td></td>";
		html 				 +="<td></td>";
		html 				 +="<td></td>";
		html 				 +="<td></td>";
		html 			     += "</tr>";
	    nomor   = nomor-1;
	   
	   $('.append'+jenis+nomor+':last').after(html);
	   nomor   = nomor+1;
	   $('#kode_temuan-'+jenis+nomor).append(kode_temuan);
	   $('#kode_sebab_id-'+jenis+nomor).append(kode_sebab_id);
	   $('#kode_rekomendasi_id-'+jenis+nomor).append(kode_rekomendasi_id);
	   $('#kerugian_negara-'+jenis+nomor).append(kerugian_negara);
	   $('#nama_ppk-'+jenis+nomor).append(uker);
	  $("#nomor_temuan_"+jenis+"").val(nomor)
	  $("#jumlah_temuan_"+jenis+"").val(nomor)
	});
	
	
	
	// Add Rekomen A
	 $(document).on("click",".add-rekomen",function(event){
		event.preventDefault();
		console.log('Tambah Rekomen');
		var jenis 				 = $(this).attr("jenis");
		var nomortemuan				 = $(this).attr("nomor");
		var kode_temuan  	 	 = $('#kode_temuan-'+jenis+' > option').clone();
		var kode_sebab_id	  	 = $('#kode_sebab_id-'+jenis+' > option').clone();
		var kerugian_negara   	 = $('#kerugian_negara-'+jenis+' > option').clone();
		var kode_rekomendasi_id  = $('#kode_rekomendasi_id-'+jenis+' > option').clone();
		var uker			  	 = $('#uker-'+jenis+' > option').clone();
		var nomor  	  		  	 = parseInt($("#nomor_rekomen_"+jenis+nomortemuan+"").val())+1;
        var html 			  	 = "<tr class='append"+jenis+nomortemuan+" temuan-"+jenis+nomortemuan+" rekomen"+jenis+nomor+nomortemuan+"' >";
		html 				 +="<td colspan='6'></td>";
		html 				 +='<td>'+nomor+'<button class="batal" type="button" nomor="nomor_rekomen_'+jenis+nomortemuan+'" tr="rekomen'+jenis+nomor+nomortemuan+'">x</button></td>';
	    html 				 +="<td><select  class='form-control ' id='kode_rekomendasi_id-"+jenis+nomortemuan+nomor+"'  name='kode_rekomendasi_id-"+jenis+nomortemuan+nomor+"'></select></td>";
	    html 				 +='<td><input type="text" class="form-control border-input" name="uraian_rekomendasi-'+jenis+nomortemuan+nomor+'" /></td>';
	    html 				 +="<td><select  class='form-control ' id='kerugian_negara-"+jenis+nomortemuan+nomor+"'  name='kerugian_negara-"+jenis+nomortemuan+nomor+"'></select></td>";
	    html 				 +='<td><input type="text" class="form-control border-input " name="nilai_rekomendasi-'+jenis+nomortemuan+nomor+'" /></td>';
	    html 				 +="<td><select  class='form-control ' id='nama_ppk-"+jenis+nomortemuan+nomor+"'  name='nama_ppk-"+jenis+nomortemuan+nomor+"'></select></td>";
		html 				 +="<td></td>";
		html 				 +="<td></td>";
		html 				 +="<td></td>";
		html 				 +="<td></td>";
		html 				 +="<td></td>";
		html 				 +="<td></td>";
		html 				 +="<td></td>";
		html 				 +="<td></td>";
		html 				 +="<td></td>";
		html 				 +="<td></td>";
		html 			     += "</tr>";
		
	    $('.append'+jenis+nomortemuan+':last').after(html);
	   $('#kode_rekomendasi_id-'+jenis+nomortemuan+nomor).append(kode_rekomendasi_id);
	   $('#kerugian_negara-'+jenis+nomortemuan+nomor).append(kerugian_negara);
	   $('#nama_ppk-'+jenis+nomortemuan+nomor).append(uker);
	  $("#nomor_rekomen_"+jenis+nomortemuan+"").val(nomor)
	  $("#jumlah_rekomen_"+jenis+nomortemuan+"").val(nomor)
	});
	
	// Batal kan Temuan dan rekomen
	$(document).on("click",".batal",function(event){
		event.preventDefault();
		console.log('Batal Jenis');
		var tr    = $(this).attr("tr");
		var nomor = $(this).attr("nomor");
		
		$("#"+nomor).val(parseInt($("#"+nomor).val())-1);
		$("."+tr).remove();
		
	});
	
	/**
	 * ############ END KKLHP
	 * 
	 */
	
	
	// Save All KKLHP 
	$('#kklhp').click(function() {
		$("#kklhp-form").submit();
	});
	
	// load user
	$('.user-modal').on('click', function(e){
		  e.preventDefault();
		  $('#userModal').modal('show').find('.modal-body').load($(this).attr('href'));
	});
	
	
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
	// end document ready
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


