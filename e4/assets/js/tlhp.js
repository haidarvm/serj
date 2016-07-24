$(document).ready(function() {
// Data Nasional Grid in Admin Atlet
 	 $(document).ready(function() {
                var dataTable = $('#manus-grid').DataTable( {
                    "processing": true,
                    "serverSide": true,
                    "order": [[ 0, "desc" ]],
                    "ajax":{
                        url : site_url + 'tlhp/manus/get_data', // json datasource
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
});