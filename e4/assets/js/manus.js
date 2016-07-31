define(["jquery", "knockout", "bootstrap", "data-table"], function($, ko){
	
	window.refreshTable = function refreshManusTable() {
		$('#manus-grid').DataTable().ajax.reload();
	}
	
	function UserViewModel() {
    	var self = this;
    	
    	self.data = {
    		userId: ko.observable(),
			userName: ko.observable(),
	    	accountNumber: ko.observable(),
	    	accountPosition:  ko.observable(),
	    	
	    	departement: ko.observable(),
	    	fullName: ko.observable(),
	    	password: ko.observable(),
	    	rePassword: ko.observable(),
	    	
	    	role: ko.observable(),
	    	address: ko.observable()
	    	
    	}
    	
    	self.data.userName.subscribe(function(ev){
    		console.info("data sekarang "+ ev);
    	});
    	
    	self.doInsert = function() {
    		var reqData = ko.toJSON(self.data);
    		
    		var actionType = "POST";
    		if (reqData.userId == undefined || reqData.userId == null) {
    			delete reqData.userId;
    		} else {
    			actionType = "PUT";
    		}
    		
    		//var type = 
    		console.debug(reqData);
    		$.ajax({
				type: "POST",
				data: actionType,
				url: site_url + "tlhp/restmanus",
				beforeSend: function(){
					console.info('attempting to insert new user');
				},
				success: function(data) {
					self.userNotif("data berhasil disimpan");
					refreshTable();
					$('#userModal').modal('hide');
				},
				error: function(xhr, msg) {
					alert("Sory, there is something wrong in our system");
				}
			});
    	}
    	
    	self.userNotif = ko.observable("example message");
    }
	
	var userView = new UserViewModel();
	
	window.userEdit = function userEdit(id) {
//    	var body = site_url + 'tlhp/manus/update/'+ id;
//    	$('#userModal').modal('show').find('.modal-body').load(body);
		console.debug(id);
		var reqData = {
			username: id
		}
		$.ajax({
			type: "GET",
			data: reqData,
			url: site_url + "tlhp/restmanus",
			beforeSend: function(){
				console.info('attempting to find user with username '+ id);
			},
			success: function(data) {
				userView.data.userId(data.data.user_id);
				userView.data.userName(data.data.username);
				userView.data.fullName(data.data.nip);
				userView.data.accountPosition(data.data.jabatan);
				userView.data.fullName(data.data.full_name);
				userView.data.departement(data.data.user_level_id);
				userView.data.role(data.data.unit_kerja_id);
				console.debug(data.data);
				$('#userModal').modal('show');
			},
			error: function(xhr, msg) {
				alert("Ups, Internal Server Error");
			}
		});
    }
	
    $(function(){
    	ko.applyBindings(userView);
       
    	$('#manus-grid').DataTable({
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
//               $('td:eq(1)', nRow).html('<a onclick="userEdit(\''+ aData[1] +'\')" href="javascript:;" class="fire">' + aData[1] + '</a>');
                return nRow;
            },
            "aoColumnDefs": [{
                    "aTargets": [7],
                    mRender: function ( data, type, row ) {
            				console.debug(row[4]);
                            //return '<div class="btn-group"><a onclick="userEdit()"  href="'+ site_url + 'tlhp/manus/update_user/'+ row[0]+'" class="user-modal-edit  btn btn-primary btn-xs"><i class="fa fa-eye"></i> Edit</a> &nbsp; <a href="#" data-toggle="modal" data-target="#confirm-delete-modal" data-href="'+ site_url + 'tlhp/manus/delete/'+ row[0]+'" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</a></div>';
                            return '<div class="btn-group"><a onClick="userEdit(\''+row[4]+'\')" href="javascript:;" class="user-modal-edit  btn btn-primary btn-xs"><i class="fa fa-eye"></i> Edit</a> &nbsp; <a onclick="return confirm('+"'Anda yakin ingin menghapus data ini ...?'"+')"  href="'+ site_url + 'tlhp/manus/delete/'+ row[0]+'" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</a></div>';

                    }
            }]
        });
    });
    
    $('.user-modal').on('click', function(e){
        $('#userModal').modal('show');
        return false;
    });
    
    
    
 });