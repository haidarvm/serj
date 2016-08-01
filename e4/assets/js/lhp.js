define(["jquery", "knockout", "bootstrap", "datetimepicker", "moment"], function($, ko){
	
	function TeamViewModel() {
		var selfD = this;
		
		selfD.data = {
			teamId: ko.observable(),
			namaTim: ko.observable(),
			kategoryTim: ko.observable()  
		}
		
	}
	
	function LhpViewModel() {
		var self = this;
		
		self.data = {
			noSuratTugas: ko.observable(),
			tglSuratTugas: ko.observable(),
			jenisPengawasanId: ko.observable(),
			objectPengawasan: ko.observable(),
			
			startHariPenugasan: ko.observable(),
			endHariPenugasan: ko.observable(),
			
			startHariPengawasan: ko.observable(),
			endHariPengawasan: ko.observable(),
			
			startSkorPemeriksaan: ko.observable(),
			endSkorPemeriksaan: ko.observable(),
			
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
			console.info('create new team');
			self.data.team.push(new TeamViewModel());
		}
		
		self.removeTeam = function(vMember){
			console.info('remove item');
			self.data.team.remove(vMember);
		}
		
		self.addTeamPerpanjangan = function() {
			console.info('create new team perpanjangan');
			self.data.teamPerpanjangan.push(new TeamViewModel());
		}
		
		self.removeTeamPerpanjangan = function(vMember){
			console.info('remove item perpanjangan');
			self.data.teamPerpanjangan.remove(vMember);
		}
		
		self.doInsert = function() {
			console.info('attempting to insert new lhp');
		}
	}
	
	var lhpView = new LhpViewModel();
	
    $(function(){
    	ko.applyBindings(lhpView);
    	
    	var datepickerCfg = {
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
    	
        $('.datepicker').datetimepicker(datepickerCfg); 
    	
    });
 });

