define(["jquery", "knockout", "notify"], function($, ko){
	
	function ViewModel() {
		var self = this;
		self.tlhpList = ko.observableArray();
		self.tlhpListEnable = ko.observable(false);
		
		self.choosenYear = ko.observable();
		self.choosenLhpId = ko.observable();
		
		self.getLhp = function() {
			var reqYear = self.choosenYear();
			$.ajax({
				type: "GET",
				url: site_url+"tlhp/addlhp/get_all/"+ reqYear,
				beforeSend: function(){
					self.tlhpList.removeAll();
				},
				success: function(data) {
					for (var i=0; i< data.length; i++) {
						self.tlhpList.push(data[i]);
					}
				},
				error: function(xhr, msg) {
					alert("Sory, there is something wrong in our system");
				}
			});
			
		}
		self.choosenTlhpTitle = ko.observable();
		self.choosenTlhpTitle.subscribe(function(val){
			console.debug(val);
			$("#lhp_id").attr("value", val.lhp_id);
		});
		
		self.choosenYear.subscribe(function(val){
			self.tlhpListEnable(true);
		});
		
		self.doEdit = function() {
			var selectedLhp = self.choosenTlhpTitle();
			if (selectedLhp == undefined) {
				alert("Lhp tidak boleh kosong");
			} else {
				window.location = site_url+"tlhp/lhp/edit?lhp_id="+selectedLhp.lhp_id;
			}
		}
		
		self.init = function() {
			if (self.choosenYear() != undefined) {
				var reqYear = self.choosenYear();
				$.ajax({
					type: "GET",
					data: {'year': year},
					url: site_url+"restlhp/lhpcontent",
					beforeSend: function(){
						self.tlhpList.removeAll();
						$('#btnSearch').attr('disabled', 'disabled');
					},
					success: function(data) {
						for (var i=0; i< data.length; i++) {
							self.tlhpList.push(data[i]);
						}
					},
					error: function(xhr, msg) {
						$.notify("Maaf saat ini sistem sedang mengalami masalah, silahkan hubungi Administrator", "error");
					}
				}).always(function(){
					$('#btnSearch').removeAttr('disabled');
				});
			}
		}
	}
	
	var vm = new ViewModel();
	
    $(function(){
    	vm.init();
    	ko.applyBindings(vm);
    	//$("#js-example-data-array").select2();
    	/**
        $("#js-example-data-array").select2({
        	ajax: {
        		url: "http://www.e4.dev/tlhp/addlhp/get_all",
        		dataType: "json",
        		delay: 250,
        		data: function (params) {
        		console.debug(params);
        		      return {
        		        q: params.term, // search term
        		        page: params.page
        		      };
        		},
        		processResults: function(data, params) {
        			console.debug(data);
		        	params.page = params.page || 1;
		        	
		        	//var data = [{ id: 0, text: 'enhancement' }, { id: 1, text: 'bug' }, { id: 2, text: 'duplicate' }, { id: 3, text: 'invalid' }, { id: 4, text: 'wontfix' }];
		            return {
		              results: data,
		              pagination: {
		                more: (params.page * 30) < data.total_count
		              }
		            };
        		},
        		cache: true
        	},
        	//minimumInputLength: 1
        	
        }); **/   
    });
 });
