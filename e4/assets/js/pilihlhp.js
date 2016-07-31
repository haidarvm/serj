define(["jquery", "knockout"], function($, ko){
	var getUri = window.location;
	var baseUri = getUri.protocol+"//"+ getUri.host + "/";
	
	function ViewModel() {
		var self = this;
		self.tlhpList = ko.observableArray();
		self.tlhpListEnable = ko.observable(false);
		
		self.choosenYear = ko.observable();
		
		self.getLhp = function() {
			var reqYear = self.choosenYear();
			$.ajax({
				type: "GET",
				url: "http://www.e4.dev/tlhp/addlhp/get_all/"+ reqYear,
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
			console.info("jalan");
			$("#lhp_id").attr("value", val.id);
		});
		
		self.choosenYear.subscribe(function(val){
			self.tlhpListEnable(true);
		});
	}
	
	var vm = new ViewModel();
	
    $(function(){
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