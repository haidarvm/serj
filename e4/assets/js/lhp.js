define(["jquery", "knockout", "bootstrap", "datetimepicker", "moment"], function($, ko){
	
	function TeamViewModel() {
		var selfD = this;
		selfD.teamId = ko.observable();
		selfD.name = ko.observable();
		selfD.roleId = ko.observable();
	}
	
	function LhpViewModel() {
		var self = this;
		
		self.data = {
			noSuratTugas: ko.observable(),
			jenisPengawasan: ko.observable(),
			tglSuratTugas: ko.observable(),
			objectPengawasan: ko.observable(),
			
			startHariPengawasan: ko.observable(),
			endHariPengawasan: ko.observable(),
			judulLhp: ko.observable(),
			
			startSkorPemeriksaan: ko.observable(),
			endSkorPemeriksaan: ko.observable(),
			nomorLhp: ko.observable(),
			
			team: ko.observableArray([]),
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
	}
	
	var lhpView = new LhpViewModel();
	
    $(function(){
    	ko.applyBindings(lhpView);
    	
        $('.datepicker').datetimepicker({
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
        });
    });
 });

