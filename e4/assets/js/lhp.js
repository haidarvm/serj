define(["jquery", "knockout", "moment", "bootstrap", "datetimepicker", "notify"], function($, ko, moment){
	
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
			lhpId: ko.observable(),
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
			
			var errorMsg = [];
			
			if (self.data.noSuratTugas() == undefined) {
				errorMsg.push('No surat tugas tidak boleh kosong');
			}
			
			if (self.data.tglSuratTugas() == undefined) {
				errorMsg.push('Tgl surat tugas tidak boleh kosong');
			}
			
			if (self.data.jenisPengawasanId() == undefined) {
				errorMsg.push('Jenis pengawasan tidak boleh kosong');
			}
			
			if (self.data.objekPengawasan() == undefined) {
				errorMsg.push('No surat tugas tidak boleh kosong');
			}
			
			if (self.data.startHariPenugasan() == undefined || self.data.endHariPenugasan() == undefined) {
				errorMsg.push('Hari awal atau akhir penugasan tidak boleh kosong');
			}
			
			if (self.data.startSkopPenugasan() == undefined || self.data.endSkopPenugasan() == undefined) {
				errorMsg.push('Hari awal atau skop penugasan tidak boleh kosong');
			}
			
			if (self.data.nomorLhp() == undefined) {
				errorMsg.push('Nomer LHP tidak boleh kosong');
			}
			
			if (self.data.judulLhp() == undefined) {
				errorMsg.push('Judul LHP tidak boleh kosong');
			}
			
			if (self.data.tglLhp() == undefined) {
				errorMsg.push('Tanggal LHP tidak boleh kosong');
			}
			
			if (errorMsg.length > 0) {
				for(var i=0; i<errorMsg.length; i++) {
					$.notify(errorMsg[i]);
				}
			} else {
				var reqAction = $('#action').val();
				var action = 'POST';
				if (reqAction == 'update') {
					action = 'PUT';
				}
				
				console.debug(reqData);
				$.ajax({
					type: action,
					data: reqData,
					contentType: 'application/json',
					url: site_url + "tlhp/restlhp",
					beforeSend: function() {
					$('#btnSave').attr('disabled', 'disabled');
				},
				success: function(data) {
					console.info(data.message);
					if (reqAction == 'insert') {
						window.location = site_url+ "tlhp/kkt/add?lhp_id=" + data.newLhp.lhpId;
					} else if (reqAction == 'update') {
						$.notify("Data sudah diubah", "success");
					}
//					$("#notify").notify("Data telah disimpan", "alert alert-info");
				},
				error: function(xhr, msg) {
					$.notify("Maaf saat ini sistem sedang mengalami masalah, silahkan hubungi Administrator", "error");
				}
				}).always(function(){
					$('#btnSave').removeAttr('disabled');
				}); 
			}
		}
		
		self.loadLhp = function() {
			var lhp_id = $('#lhp_id').val();
			$.ajax({
				type: 'GET',
				data: {'lhp_id': lhp_id},
				contentType: 'application/json',
				dataType: 'json',
				url: site_url + "tlhp/restlhp/lhp",
				beforeSend: function(){
					console.info('attempting to load lhp data');
				},
				success: function(msg) {
					console.info('success to get lhp with id '+ lhp_id);
					
					self.data.lhpId(msg.data.lhp.lhp_id);
					self.data.noSuratTugas(msg.data.lhp.no_surat_tugas);
					self.data.tglSuratTugas(moment(msg.data.lhp.tanggal_surat_tugas).format('DD-MM-YYYY'));
					self.data.jenisPengawasanId(msg.data.lhp.jenis_pengawasan_id)
					self.data.objekPengawasan(msg.data.lhp.objek_pengawasan);
					
					self.data.startHariPenugasan(moment(msg.data.lhp.hari_awal_penugasan).format('DD-MM-YYYY'));
					self.data.endHariPenugasan(moment(msg.data.lhp.hari_akhir_penugasan).format('DD-MM-YYYY'));
					
					self.data.startSkopPenugasan(moment(msg.data.lhp.skop_awal_penugasan).format('DD-MM-YYYY'));
					self.data.endSkopPenugasan(moment(msg.data.lhp.skop_akhir_penugasan).format('DD-MM-YYYY'));
					
					self.data.nomorLhp(msg.data.lhp.nomor_lhp);
					self.data.judulLhp(msg.data.lhp.judul_lhp);
					
					self.data.tglLhp(moment(msg.data.lhp.tanggal_lhp).format('DD-MM-YYYY'));
//					team: ko.observableArray([]),
					
					self.data.stPerpanjangan(msg.data.lhp.st_perpanjangan);
					if (msg.data.lhp.tgl_st_perpanjangan != null) {
						self.data.tglStPerpanjangan(moment(msg.data.lhp.tgl_st_perpanjangan).format('DD-MM-YYYY'));
					}
					if (msg.data.lhp.hari_awal_perpanjangan_penugasan != null) {
						self.data.startPerpanjanganPenugasan(moment(msg.data.lhp.hari_awal_perpanjangan_penugasan).format('DD-MM-YYYY'));
					}
					if (msg.data.lhp.hari_akhir_perpanjangan_penugasan != null) {
						self.data.endPerpanjanganPenugasan(moment(msg.data.lhp.hari_akhir_perpanjangan_penugasan).format('DD-MM-YYYY'));
					}						
					
					if (msg.data.tim.length > 0) {
						for (var i=0; i < msg.data.tim.length; i++) {
							var member = msg.data.tim[i];
							var teamVm = new TeamViewModel();
							teamVm.teamId(member.tim_id);
							teamVm.namaTim(member.nama_tim);
							teamVm.kategoryTim(member.kategori_tim);
							
							if (teamVm.kategoryTim() == 'biasa') {
								self.data.team.push(teamVm);
							} else {
								self.data.teamPerpanjangan.push(teamVm);
							}
						}
					}
//					teamPerpanjangan: ko.observableArray([])
					console.debug(ko.toJSON(self.data));
				},
				error: function() {
					$.notify("Internal Serverl Error, Cannot Load LHP Data");
				}
			});
		}
		
		self.init = function() {
			var lhp_id = $('#lhp_id').val();
			console.info('ini dipanggil');
			console.debug(lhp_id === '');
			if (lhp_id !== '') {
				console.info('di load lhp');
				self.loadLhp();
			} else {
				console.info('tidak di load lhp');
			}
			
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
    	lhpView.init();
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

