
 	 $(document).ready(function() {
$('#confirm-delete-modal').on('show.bs.modal', function(e) {
	console.log('masuk delete');
    $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
});
 	});

	  // Data Nasional Grid in Admin Atlet
 	 $(document).ready(function() {
                var dataTable = $('#data-grid').DataTable( {
                    "processing": true,
                    "serverSide": true,
                    "order": [[ 0, "desc" ]],
                    "ajax":{
                        url : site_url + 'admin/data/get_data', // json datasource
                        type: "post",  // method  , by default get
                        error: function(){  // error handling
                            $(".data-grid-error").html("");
                            $("#data-grid").append('<tbody class="data-grid-error"><tr><th colspan="3">No data found in the server</th></tr></tbody>');
                            $("#data-grid_processing").css("display","none");
                            
                        }
                    },

                    "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
                      if(aData[3] == 'putra') {
                          $('td:eq(3)', nRow).html('<i class="fa fa-male"></i> '+ aData[3]);
                        $('td:eq(1)', nRow).html('<a href="'+ site_url + 'admin/data/detail/' + aData[0] + '">' + aData[1] + '</a>');
                          return nRow;
                      } else {
                          $('td:eq(3)', nRow).html('<i class="fa fa-female"></i> '+ aData[3]);
                        $('td:eq(1)', nRow).html('<a href="'+ site_url + 'admin/data/detail/' + aData[0] + '">' + aData[1] + '</a>');
                      }
                      $('td:eq(1)', nRow).html('<a href="'+ site_url + 'admin/data/detail/' + aData[0] + '">' + aData[1] + '</a>');
                      return nRow;
                        
                      },

                  "aoColumnDefs": [{
                        "aTargets": [5],
                        mRender: function ( data, type, row ) {
                        return '<div class="btn-group"><a href="'+ site_url + 'admin/data/detail/'+ row[0]+'" class="btn btn-primary btn-xs"><i class="fa fa-eye"></i> Detail</a> &nbsp; <a href="#" data-toggle="modal" data-target="#confirm-delete-modal" data-href="'+ site_url + 'admin/data/delete/'+ row[0]+'" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</a></div>';
                      }
                    }]
          });
      });
 	 
 	 // Data Pelatda Grid on Admin
 	$(document).ready(function() {
        var dataTable = $('#pelatda-grid').DataTable( {
            "processing": true,
            "serverSide": true,
            "order": [[ 0, "desc" ]],
            "ajax":{
                url : site_url + 'admin/data/get_pelatda', // json datasource
                type: "post",  // method  , by default get
                error: function(){  // error handling
                    $(".pelatda-grid-error").html("");
                    $("#pelatda-grid").append('<tbody class="pelatda-grid-error"><tr><th colspan="3">No data found in the server</th></tr></tbody>');
                    $("#pelatda-grid_processing").css("display","none");
                    
                }
            },

            "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
              if(aData[3] == 'putra') {
                  $('td:eq(3)', nRow).html('<i class="fa fa-male"></i> '+ aData[3]);
                $('td:eq(1)', nRow).html('<a href="'+ site_url + 'admin/data/detail/' + aData[0] + '">' + aData[1] + '</a>');
                  return nRow;
              } else {
                  $('td:eq(3)', nRow).html('<i class="fa fa-female"></i> '+ aData[3]);
                $('td:eq(1)', nRow).html('<a href="'+ site_url + 'admin/data/detail/' + aData[0] + '">' + aData[1] + '</a>');
              }
              $('td:eq(1)', nRow).html('<a href="'+ site_url + 'admin/data/detail/' + aData[0] + '">' + aData[1] + '</a>');
              return nRow;
                
              },

          "aoColumnDefs": [{
                "aTargets": [5],
                mRender: function ( data, type, row ) {
                return '<div class="btn-group"><a href="'+ site_url + 'admin/data/detail/'+ row[0]+'" class="btn btn-primary btn-xs"><i class="fa fa-eye"></i> Detail</a> &nbsp; <a href="#" data-toggle="modal" data-target="#confirm-delete-modal" data-href="'+ site_url + 'admin/data/delete/'+ row[0]+'" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</a></div>';
              }
            }]
  });
});

     // Data Jabar Grid on Admin
  $(document).ready(function() {
        var dataTable = $('#jabar-grid').DataTable( {
            "processing": true,
            "serverSide": true,
            "order": [[ 0, "desc" ]],
            "ajax":{
                url : site_url + 'admin/data/get_jabar', // json datasource
                type: "post",  // method  , by default get
                error: function(){  // error handling
                    $(".jabar-grid-error").html("");
                    $("#jabar-grid").append('<tbody class="jabar-grid-error"><tr><th colspan="3">No data found in the server</th></tr></tbody>');
                    $("#jabar-grid_processing").css("display","none");
                    
                }
            },

            "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
              if(aData[3] == 'putra') {
                  $('td:eq(3)', nRow).html('<i class="fa fa-male"></i> '+ aData[3]);
                $('td:eq(1)', nRow).html('<a href="'+ site_url + 'admin/data/detail/' + aData[0] + '">' + aData[1] + '</a>');
                  return nRow;
              } else {
                  $('td:eq(3)', nRow).html('<i class="fa fa-female"></i> '+ aData[3]);
                $('td:eq(1)', nRow).html('<a href="'+ site_url + 'admin/data/detail/' + aData[0] + '">' + aData[1] + '</a>');
              }
              $('td:eq(1)', nRow).html('<a href="'+ site_url + 'admin/data/detail/' + aData[0] + '">' + aData[1] + '</a>');
              return nRow;
                
              },

          "aoColumnDefs": [{
                "aTargets": [5],
                mRender: function ( data, type, row ) {
                return '<div class="btn-group"><a href="'+ site_url + 'admin/data/detail/'+ row[0]+'" class="btn btn-primary btn-xs"><i class="fa fa-eye"></i> Detail</a> &nbsp; <a href="#" data-toggle="modal" data-target="#confirm-delete-modal"  data-href="'+ site_url + 'admin/data/delete/'+ row[0]+'" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</a></div>';
              }
            }]
  });
});

  

	  // Konida Grid in Admin konida
      $(document).ready(function() {
                var dataTable = $('#konida-grid').DataTable( {
                    "processing": true,
                    "serverSide": true,
                    "order": [[ 0, "desc" ]],
                    "ajax":{
                        url : site_url + 'admin/konida/get_data', // json datasource
                        type: "post",  // method  , by default get
                        error: function(){  // error handling
                            $(".konida-grid-error").html("");
                            $("#konida-grid").append('<tbody class="konida-grid-error"><tr><th colspan="3">No data found in the server</th></tr></tbody>');
                            $("#konida-grid_processing").css("display","none");
                            
                        }
                    },
                    "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
                        $('td:eq(1)', nRow).html('<a href="'+ site_url + 'admin/konida/detail/' + aData[0] + '">' +
                            aData[1] + '</a>');
                        return nRow;
                      },

                  "aoColumnDefs": [{
                        "aTargets": [4],
                        mRender: function ( data, type, row ) {
                        return '<div class="btn-group"><a href="'+ site_url + 'admin/konida/update/'+ row[0]+'" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i> Update</a>  <a href="#" data-toggle="modal" data-target="#confirm-delete-modal" data-href="'+ site_url + 'admin/konida/delete/'+ row[0]+'" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</a></div>';
                        }
                    }]
          });
      });

      // Event Grid in Admin Event
      $(document).ready(function() {
                var dataTable = $('#event-grid').DataTable( {
                    "processing": true,
                    "serverSide": true,
                    "order": [[ 0, "desc" ]],
                    "ajax":{
                        url : site_url + 'admin/event/get_data', // json datasource
                        type: "post",  // method  , by default get
                        error: function(){  // error handling
                            $(".event-grid-error").html("");
                            $("#event-grid").append('<tbody class="event-grid-error"><tr><th colspan="3">No data found in the server</th></tr></tbody>');
                            $("#event-grid_processing").css("display","none");
                            
                        }
                    },
                    "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
                        $('td:eq(1)', nRow).html('<a href="'+ site_url + 'admin/event/update/' + aData[0] + '">' +
                            aData[1] + '</a>');
                        return nRow;
                      },

                  "aoColumnDefs": [{
                        "aTargets": [4],
                        mRender: function ( data, type, row ) {
                        return '<div class="btn-group"><a href="'+ site_url + 'admin/event/update/'+ row[0]+'"> Update</a> | <a href="#" data-toggle="modal" data-target="#confirm-delete-modal" data-href="'+ site_url + 'admin/event/delete/'+ row[0]+'" >Delete</a></div>';
                        }
                    }]
          });
      });
                
     // Noper Grid in Admin No per
    $(document).ready(function() {
                  var dataTable = $('#noper-grid').DataTable( {
                      "processing": true,
                      "serverSide": true,
                      "ajax":{
                          url : site_url + 'admin/noper/get_data', // json datasource
                          type: "post",  // method  , by default get
                          error: function(){  // error handling
                              $(".noper-grid-error").html("");
                              $("#noper-grid").append('<tbody class="noper-grid-error"><tr><th colspan="3">No data found in the server</th></tr></tbody>');
                              $("#noper-grid_processing").css("display","none");
                              
                          }
                      },
                      "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
                          $('td:eq(1)', nRow).html('<a href="'+ site_url + 'admin/data/update/' + aData[3] + '">' +
                              aData[1] + '</a>');
                          $('td:eq(2)', nRow).html('<a href="'+ site_url + 'admin/noper/update/' + aData[0] + '">' +
                                  aData[2] + '</a>');
                          return nRow;
                        },

                    "aoColumnDefs": [{
                          "aTargets": [3],
                          mRender: function ( data, type, row ) {
                          return '<div class="btn-group"><a href="'+ site_url + 'admin/noper/update/'+ row[0]+'" >Update</a> | <a href="#" data-toggle="modal" data-target="#confirm-delete-modal" data-href="'+ site_url + 'admin/noper/delete/'+ row[0]+'" >Delete</a></div>';
                          }
                      }]
            });
       });
      
      // Pengda Grid in Admin
      $(document).ready(function() {
                var dataTable = $('#pengda-grid').DataTable( {
                    "processing": true,
                    "serverSide": true,
                    "order": [[ 0, "desc" ]],
                    "ajax":{
                        url : site_url + 'admin/pengda/get_data', // json datasource
                        type: "post",  // method  , by default get
                        error: function(){  // error handling
                            $(".pengda-grid-error").html("");
                            $("#pengda-grid").append('<tbody class="pengda-grid-error"><tr><th colspan="3">No data found in the server</th></tr></tbody>');
                            $("#pengda-grid_processing").css("display","none");
                            
                        }
                    },
                    "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
                        $('td:eq(2)', nRow).html('<a href="'+ site_url + 'admin/pengda/detail/' + aData[0] + '">' +
                            aData[2] + '</a>');
                        return nRow;
                      },

                  "aoColumnDefs": [{
                        "aTargets": [4],
                        mRender: function ( data, type, row ) {
                        return '<div class="btn-group"><a href="'+ site_url + 'admin/pengda/update/'+ row[0]+'" >Update</a> | <a href="#" data-toggle="modal" data-target="#confirm-delete-modal" data-href="'+ site_url + 'admin/pengda/delete/'+ row[0]+'" >Delete</a></div>';
                    	}
                    }]
          });
      });

      // Tunjangan Grid in Admin
      $(document).ready(function() {
                var dataTable = $('#tunjangan-grid').DataTable( {
                    "processing": true,
                    "serverSide": true,
                    "order": [[ 0, "desc" ]],
                    "ajax":{
                        url : site_url +'admin/tunjangan/get_data', // json datasource
                        type: "post",  // method  , by default get
                        error: function(){  // error handling
                            $(".tunjangan-grid-error").html("");
                            $("#tunjangan-grid").append('<tbody class="tunjangan-grid-error"><tr><th colspan="3">No data found in the server</th></tr></tbody>');
                            $("#tunjangan-grid_processing").css("display","none");
                            
                        }
                    },
                    "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
                        $('td:eq(1)', nRow).html('<a href="'+ site_url + 'admin/tunjangan/transaksi/' + aData[0] + '">' +
                            aData[1] + '</a>');
                        return nRow;
                      },

                  "aoColumnDefs": [{
                        "aTargets": [4],
                        mRender: function ( data, type, row ) {
                        return '<div class="btn-group"><a href="'+ site_url + 'admin/tunjangan/transaksi/'+ row[0]+'" >Transaksi</a></div>';
                        }
                    }]
          });
      });
      
        // Autocomplate get Atlet name
        $(document).ready(function() {
            $('.autocomplete').autocomplete({
                // serviceUrl berisi URL ke controller/fungsi yang menangani request kita
                serviceUrl: site_url +'admin/compare/search',
                // fungsi ini akan dijalankan ketika user memilih salah satu hasil request
                onSelect: function (suggestion) {
                    $('#atlet_id_first').val(''+suggestion.atlet_id); // membuat id 'atlet_id' untuk ditampilkan
                }
            });
        });


        // Autocomplate get Atlet name 2
        $(document).ready(function() {
            $('.autocomplete2').autocomplete({
                // serviceUrl berisi URL ke controller/fungsi yang menangani request kita
                serviceUrl: site_url +'admin/compare/search',
                // fungsi ini akan dijalankan ketika user memilih salah satu hasil request
                onSelect: function (suggestion) {
                    $('#atlet_id_second').val(''+suggestion.atlet_id); // membuat id 'v_nim' untuk ditampilkan
                }
            });
        });

//        //Boostrap Datatables
//        $(function () {
//            $("#example").dataTable();
//              "bPaginate": true,
//              "bLengthChange": false,
//              "bFilter": false,
//              "bSort": true,
//              "bInfo": true,
//              "bAutoWidth": false
//           });
        
        // For Pendidikan Atlet Admin 
        $(function () {
        	$("#datepicker").datepicker({format: 'dd-mm-yyyy'});
          $("#datepicker-psikolog").datepicker({format: 'dd-mm-yyyy'});
//          	$('#datepicker').datetimepicker({timePicker: false, format: 'DD/DD/YYYY'});
        	$("#date_out1").datepicker( {format: " yyyy", viewMode: "years", minViewMode: "years"});
        	$("#date_out2").datepicker( {format: " yyyy", viewMode: "years", minViewMode: "years"});
        	$("#date_out3").datepicker( {format: " yyyy", viewMode: "years", minViewMode: "years"});
        	$("#date_out4").datepicker( {format: " yyyy", viewMode: "years", minViewMode: "years"});
          	$('#datetimepicker').datetimepicker({
          		format: 'yyyy-mm-dd hh:ii'
            });
          });
        
          // Summernote Editor
          $(document).ready(function() {
              $('#summernote').summernote({
                  height: 500,
                  maximumImageFileSize: 15242880,
                  onImageUpload: function(files, editor, welEditable) {
                      sendFile(files[0], editor, welEditable);
                  }
              });
              
              $('#pulahta-desc').summernote({
                  height: 200,
                  maximumImageFileSize: 15242880,
                  onImageUpload: function(files, editor, welEditable) {
                      sendFile(files[0], editor, welEditable);
                  }
              });
          });
          
          
          	function tampilKabupaten() {
        		 kdprop = $('#provinsi_id').val();
        		 $.ajax({
        			 url: site_url + "admin/data/pilih_kabupaten/"+kdprop+"",
        			 success: function(response){
        			 $("#kota_kabupaten_id").html(response);
        			 },
        			 dataType:"html"
        		 });
        		 return false;
        	}

        	function tampilKecamatan() {
        		 kdkab = $('#kota_kabupaten_id').val();
        		 $.ajax({
        			 url: site_url + "admin/data/pilih_kecamatan/"+kdkab+"",
        			 success: function(response){
        			 $("#kecamatan_id").html(response);
        			 },
        			 dataType:"html"
        		 });
        		 return false;
        	}

        	function tampilKelurahan() {
        		 kdkec = $('#kecamatan_id').val();
        		 $.ajax({
        			 url: site_url + "admin/data/pilih_kelurahan/"+kdkec,
        			 success: function(response){
        			 $("#kelurahan_id").html(response);
        			 },
        			 dataType:"html"
        		 });
        		 return false;
        	}
        	
        	function getAge(dob){
        		dob = new Date(dob);
        		var today = new Date();
        		var age = Math.floor((today-dob) / (365.25 * 24 * 60 * 60 * 1000));
        		return age;
        	}
        	