define(["jquery", "knockout", "moment", "bootstrap", "datetimepicker"], function($, ko, moment){
	
	function TeamViewModel() {
		var selfD = this;
		
		selfD.teamId = ko.observable();
		selfD.namaTim = ko.observable();
		selfD.kategoryTim = ko.observable();
	}
	
	function LhpViewModel() {
		var self = this;
		
		self.data = {
			userId: ko.observable(),
			noSuratTugas: ko.observable(),
			tglSuratTugas: ko.observable(),
			jenisPengawasanId: ko.observable(),
			objekPengawasan: ko.observable(),
			
			startHariPenugasan: ko.observable(),
			endHariPenugasan: ko.observable(),
			
			startHariPengawasan: ko.observable(),
			endHariPengawasan: ko.observable(),
			
			startSkopPenugasan: ko.observable(),
			endSkopPenugasan: ko.observable(),
			
			nomorLhp: ko.observable(),
			judulLhp: ko.observable(),
			
			tglLhp: ko.observable(),
			team: ko.observableArray([]),
			
			stPerpanjangan: ko.observable(),
			tglStPerpanjangan: ko.observable(),
			startPerpanjanganPenugasan: ko.observable(),
			endPerpanjanganPenugasan: ko.observable(),
			
			teamPerpanjangan: ko.observableArray([])
		}
		
		self.addTeam = function() {
			var mView = new TeamViewModel();
			mView.kategoryTim('biasa');
			
			self.data.team.push(mView);
		}
		
		self.removeTeam = function(vMember){
			self.data.team.remove(vMember);
		}
		
		self.addTeamPerpanjangan = function() {
			var mView = new TeamViewModel();
			mView.kategoryTim('perpanjangan');
			
			self.data.teamPerpanjangan.push(mView);
		}
		
		self.removeTeamPerpanjangan = function(vMember){
			self.data.teamPerpanjangan.remove(vMember);
		}
		
		self.doInsert = function() {
			var reqData = ko.toJSON(self.data);
			console.debug(reqData);
			/**
			$.ajax({
				type: 'POST',
				data: reqData,
				contentType: 'application/json',
				url: site_url + "tlhp/restlhp",
				beforeSend: function() {
					$('#btnSave').attr('disabled', 'disabled');
				},
				success: function(data) {
					console.info(data.message);
//					$("#notify").notify("Data telah disimpan", "alert alert-info");
				},
				error: function(xhr, msg) {
//					$("#notify").notify("Internal Server Error", "alert alert-error");
				}
			}).always(function(){
				$('#btnSave').removeAttr('disabled');
			}); **/
		}
	}
	
	var lhpView = new LhpViewModel();
	
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
    $(function(){
    	ko.applyBindings(lhpView);
    	
//    	var datepickerCfg = {
//			format: 'DD-MM-YYYY',    //use this format if you want the 12hours timpiecker with AM/PM toggle
//            icons: {
//                time: "fa fa-clock-o",
//                date: "fa fa-calendar",
//                up: "fa fa-chevron-up",
//                down: "fa fa-chevron-down",
//                previous: 'fa fa-chevron-left',
//                next: 'fa fa-chevron-right',
//                today: 'fa fa-screenshot',
//                clear: 'fa fa-trash',
//                close: 'fa fa-remove'
//            }	
//    	}
//    	
//        $('.datepicker').datetimepicker(datepickerCfg); 
    	
    });
 });

