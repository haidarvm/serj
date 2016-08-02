define(["jquery", "knockout", "bootstrap", "data-table", "notify"], function($, ko){
	
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
    	
    	self.userNotif = ko.observable("example message");
    	self.doInsert = function() {
    		var reqData = ko.toJSON(self.data);
    		
    		var actionType = "POST";
    		console.debug(self.data.userId());
    		if (self.data.userId() != null) {
    			actionType = "PUT";
    		} 
    		
    		console.debug(reqData);
    		console.debug('actionType: '+ actionType);
    		$.ajax({
				type: actionType,
				data: reqData,
				contentType: 'application/json',
				url: site_url + "tlhp/restmanus",
				beforeSend: function(){
					console.info('attempting to insert new user');
					$('#btnSave').attr('disabled', 'disabled');
				},
				success: function(data) {
					console.info('new user was added');
					refreshTable();
					if (actionType == "POST") {
						self.resetData();
					}
					$("#notify").notify("Data telah disimpan", "alert alert-info");
//					$('#userModal').modal('hide');
				},
				error: function(xhr, msg) {
//					self.userNotif("Internal Server Error");
					$("#notify").notify("Internal Server Error", "alert alert-error");
				}
			}).always(function(){
				$('#btnSave').removeAttr('disabled');
			});;
    	}
    	
    	self.newUser = function() {
			self.resetData();
		}
    	
    	self.resetData = function() {
    		self.data.userId(null);
			self.data.userName(null);
			self.data.accountNumber(null);
	    	self.data.accountPosition(null);
	    	
	    	self.data.departement(null);
	    	self.data.fullName(null);
	    	self.data.password(null);
	    	self.data.rePassword(null);
	    	
	    	self.data.role(null);
	    	self.data.address(null);
    	}
    	
    }
	
	var userView = new UserViewModel();
	
	window.userEdit = function userEdit(id) {
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
				userView.data.accountPosition(data.data.jabatan);
				userView.data.accountNumber(data.data.nip);
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
    	$.notify.defaults({
    		clickToHide: true,
    		autoHide: false,
    		position: 'top-center'
    	});
//    	$.notify.addStyle('alert', {
//    		html: "<div>data-notify-text</div>"
//    	});
    	
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
                            return '<div class="btn-group"><a onClick="userEdit(\''+row[4]+'\')" href="javascript:;" class="user-modal-edit  btn btn-primary btn-xs"><i class="fa fa-eye"></i> Edit</a> &nbsp; <a onclick="return confirm('+"'Anda yakin ingin Non Aktif data ini ...?'"+')"  href="'+ site_url + 'tlhp/manus/delete/'+ row[0]+'" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Non Aktif</a></div>';

                    }
            }]
        });
    });
    
    $('.user-modal').on('click', function(e){
        $('#userModal').modal('show');
        return false;
    });
    
    
    
 });