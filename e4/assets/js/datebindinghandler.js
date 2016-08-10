define(["jquery", "knockout", "moment", "bootstrap", "datetimepicker"], function($, ko, moment){
	ko.bindingHandlers.datepicker = {
		init: function(element, valueAccessor, allBindings) {
			var cfg = {
				format: 'DD-MM-YYYY',    //use this format if you want the 12hours timpiecker with AM/PM toggle
	            icons: {
	                time: "fa fa-clock-o",
	                date: "fa fa-calendar",
	                up: "fa fa-chevron-up",
	                down: "fa fa-chevron-down",
	                previous: 'fa fa-chevron-left',
	                next: 'fa fa-chevron-right',
	                today: 'fa fa-screenshot',
	                clear: 'fa fa-trash',
	                close: 'fa fa-remove'
	            }	
	    	}
	    	
	        $(element).datetimepicker(cfg).on('dp.change', function(e){
	        	var date = moment(new Date(e.date)).format('DD-MM-YYYY');
	        	allBindings().selectedDate(date);
	        });
		}
	}
})