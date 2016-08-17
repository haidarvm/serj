define(["jquery", "knockout","underscore", "accounting",  "bootstrap","select2", 
        "notify", "moment"], function($, ko, _, accounting){
	
	function RekomendasiViewModel(isFirstRow) {
		var selfR = this;
		
		selfR.isFirstRow = ko.observable(isFirstRow);
		selfR.data = {
			rekomendasiId: ko.observable(),
			kertasKerjaId: ko.observable(),
			kodeRekomendasiId: ko.observable(),
			uraianRekomendasi: ko.observable(),
			kerugianNegara: ko.observable(false),
			kerugianNegaraCbk: ko.observable(false),
			nilaiRekomendasi: ko.observable(),
			nilaiRekomendasiEnable: ko.observable(false),
			
			unitKerja: ko.observable(),
			namaPpk : ko.observable(),
			namaPj : ko.observable(),
			periodeTindakLanjut : ko.observable(),
			uraianTindakLanjut : ko.observable(),
			dokumentPendukungTl : ko.observable(),
			tanggalTl: ko.observable(),
			jumlahTl : ko.observable(),
			isNewTl: ko.observable(false),
			totalTindakLanjut : ko.observable(),
			
			matchedTlRowCount: ko.observable(),
			matchedTlTotalAmount: ko.observable(),
			
			notmatchedTlRowCount: ko.observable(),
			notmatchedTlTotalAmount: ko.observable(),
			
			notYetActionTlRowCount: ko.observable(),
			notYetActionTlTotalAmount: ko.observable()
		}
		
		selfR.data.kerugianNegaraCbk.subscribe(function(newVal){
			if (newVal == true) {
				selfR.data.kerugianNegara(true);
				selfR.data.nilaiRekomendasiEnable(true);
			} else {
				selfR.data.kerugianNegara(false);
				selfR.data.nilaiRekomendasiEnable(false);
			}
			
		});
		
		selfR.initData = function(rekomendasiId, kertasKerjaId, kodeRekomendasiId, kodeRekomendasi, 
				oriUraianRekomendasi, uraianRekomendasi, kerugianNegara, nilaiRekomendasi, 
				unitKerja, namaPpk, namaPj, 
				uraianTindakLanjut, tanggalTl, nilaiTl, totalTindakLanjut, 
				matchedTl, notmatchedTl, notYetActionTl) {
			selfR.data.rekomendasiId(rekomendasiId);
			selfR.data.kertasKerjaId(kertasKerjaId);
			selfR.data.kodeRekomendasiId(kodeRekomendasiId);
			selfR.data.uraianRekomendasi(uraianRekomendasi);
			if (kerugianNegara ==1) {
				selfR.data.kerugianNegaraCbk(true);
			}
			selfR.data.nilaiRekomendasi(nilaiRekomendasi);
			selfR.data.unitKerja(unitKerja);
			selfR.uiUnitKerja(unitKerja.unit_kerja);
			selfR.data.namaPpk(namaPpk);
			selfR.data.namaPj(namaPj);
			selfR.data.uraianTindakLanjut(uraianTindakLanjut);
			selfR.data.tanggalTl(tanggalTl);
			selfR.data.jumlahTl(nilaiTl);
			selfR.data.totalTindakLanjut(totalTindakLanjut);
			
			selfR.data.matchedTlRowCount(matchedTl.rowCount);
			selfR.data.matchedTlTotalAmount(matchedTl.totalAmount);
//			
			selfR.data.notmatchedTlRowCount(notmatchedTl.rowCount);
			selfR.data.notmatchedTlTotalAmount(notmatchedTl.totalAmount);
//			console.debug(selfR.data.unitKerja());
//			console.debug(selfR.data.namaPpk());
//			console.debug(selfR.data.namaPj());
			selfR.uiKodeRekomendasi(kodeRekomendasi+": "+oriUraianRekomendasi);
			selfR.uiNilaiRekomendasi(accounting.formatMoney(nilaiRekomendasi, "Rp", 0, ".", ","));
			
			selfR.data.notYetActionTlRowCount(notYetActionTl.rowCount);
			selfR.data.notYetActionTlTotalAmount(notYetActionTl.totalAmount);
		}
		
		selfR.nilaiKerugianNegaraEnable = ko.observable(false);
		selfR.uiKodeRekomendasi = ko.observable();
		selfR.uiNilaiRekomendasi = ko.observable();
		
		selfR.uiJumlahTl = ko.computed(function(){
			if (selfR.data.jumlahTl() != undefined) {
				console.debug('jumlahtl will be formated');
				console.debug(selfR.data.jumlahTl());
				return accounting.formatMoney(selfR.data.jumlahTl(), "Rp", 0, ".", ",");
			} else {
				return null;
			}
			
		});
		
		selfR.uiPeriodeTindakLanjut = ko.computed(function(){
			if (selfR.data.tanggalTl() != undefined) {
				var moment = require('moment');
				var month = moment(selfR.data.tanggalTl(), "DD-MM-YYYY").format("M");
				if (parseInt(month) > 1 && parseInt(month) <= 6 ) {
					return "SEMESTER I";
				} else if (parseInt(month) > 6 && parseInt(month) <= 12 ) {
					return "SEMESTER II";
				}
			} else {
				return null;
			}
		});
		
		selfR.viewHistoryTl = function(data) {
			var rekId = data.data.rekomendasiId();
			window.location = site_url+"/tlhp/lhp/historytl/"+rekId;
		}
		
		selfR.uiMatchedTlTotalAmount = ko.computed(function() {
			return accounting.formatMoney(selfR.data.matchedTlTotalAmount(), "Rp", 0, ".", ",");
		});
		
		selfR.uiNotMatchedTlTotalAmount = ko.computed(function() {
			return accounting.formatMoney(selfR.data.notmatchedTlTotalAmount(), "Rp", 0, ".", ",");
		});
		
		selfR.uiNotYetActionTlTotalAmount = ko.computed(function() {
			return accounting.formatMoney(selfR.data.notYetActionTlTotalAmount(), "Rp", 0, ".", ",");
		});
		
		selfR.uiUnitKerja = ko.observable();
	}
	
	function KertasKerjaTemuanViewModel(urutan, isFirstRow) {
		var selfK = this;
		
		selfK.isFirstRow = ko.observable(isFirstRow);
		selfK.urutan = ko.observable(urutan);
		selfK.enableRemoveBtn = ko.observable(false);
		
		selfK.data = {
			kertasKerjaId: ko.observable(),
			lhpId: ko.observable(),
			jenisTemuan: ko.observable(),
			noTemuan: ko.observable(),
			kodeTemuanId: ko.observable(),
			uraianTemuan: ko.observable(),
			kodeSebabId: ko.observable(),
			uraianSebab: ko.observable(),
			nilaiTemuan: ko.observable(),
			namaPpk: ko.observable(),
			namaPjKegiatan: ko.observable(),
			jumlahSesuai: ko.observable(),
			nilaiSesuai: ko.observable(),
			jumlahBelumSesuai: ko.observable(),
			nilaiBelumSesuai: ko.observable(),
			jumlahBelumTl: ko.observable(),
			nilaiBelumTl: ko.observable(),
			jumlahTidakTlAlasan: ko.observable(),
			nilaiTidakTlAlasan: ko.observable(),
			userId: ko.observable(),
			
			
			rekomendasi: ko.observableArray([]),
			
			firstRekomendasiId: ko.observable(),
			firstKodeRekomendasiId: ko.observable(),
			firstKodeRekomendasi: ko.observable(),
			firstUraianRekomendasi: ko.observable(),
			firstKerugianNegara: ko.observable(false),
			firstKerugianNegaraCbk: ko.observable(false),
			firstNilaiRekomendasi: ko.observable(),
			firtsNilaiRekomendasiEnable: ko.observable(false),
			
			firstUnitKerja: ko.observable(),
			firstNamaPpk: ko.observable(),
			firstNamaPj: ko.observable(),
			firstPeriodeTindakLanjut : ko.observable(),
			firstUraianTindakLanjut : ko.observable(),
			firstDokumentPendukungTl : ko.observable(),
			firstTanggalTl: ko.observable(),
			firstJumlahTl : ko.observable(),
			isFirstNewTl: ko.observable(false),
			firstTotalTindakLanjut: ko.observable(),
			
			firstMatchedTlRowCount: ko.observable(),
			firstMatchedTlTotalAmount: ko.observable(),
			
			firstNotMatchedTlRowCount: ko.observable(),
			firstNotMatchedTlTotalAmount: ko.observable(),
			
			firstNotYetActionTlRowCount: ko.observable(),
			firstNotYetActionTlTotalAmount: ko.observable(),
		}
		
		selfK.data.firstKerugianNegaraCbk.subscribe(function(newVal){
			console.debug('kerugian negara '+ newVal)
			if (newVal == true) {
				selfK.data.firstKerugianNegara(true);
				selfK.data.firtsNilaiRekomendasiEnable(true);
			} else {
				selfK.data.firstKerugianNegara(false);
				selfK.data.firtsNilaiRekomendasiEnable(false);
			}  
		});
		
		selfK.addRow = function() {
			console.info('add rekomendasi')
			selfK.data.rekomendasi.push(new RekomendasiViewModel(1, false));
		}
		
		selfK.removeRow = function(vModel) {
			selfK.data.rekomendasi.remove(vModel);
		}
		
		selfK.initData = function(kertasKerjaId, lhpId, jenisTemuan, noTemuan, 
				kodeTemuanId, kelompokTemuan, subKelompokTemuan, jenisKelompokTemuan,
				deskripsi_temuan, uraianTemuan, kodeSebabId, kodeSebab, uraianSebab, nilaiTemuan, firstRekomendasiId,
				firstKodeRekomendasiId, firstKodeRekomendasi, firstOriUraianRekomendasi, firstUraianRekomendasi, 
				firstKerugianNegara, firstNilaiRekomendasi, firstUnitKerja, firstNamaPpk, firstNamaPj, 
				uraianTindakLanjut, tanggalTl, nilaiTl, totalTindakLanjut, 
				firstMatchedTl, firstNotMatchedTl, firstNotYetActionTl) {
			selfK.data.kertasKerjaId(kertasKerjaId);
			selfK.data.lhpId(lhpId);
			selfK.data.jenisTemuan(jenisTemuan);
			selfK.data.noTemuan(noTemuan);
			selfK.data.kodeTemuanId(kodeTemuanId);
			selfK.data.uraianTemuan(uraianTemuan);
			selfK.data.kodeSebabId(kodeSebabId);
			selfK.data.uraianSebab(uraianSebab);
			selfK.data.nilaiTemuan(nilaiTemuan);
			
			selfK.data.firstRekomendasiId(firstRekomendasiId);
			selfK.data.firstKodeRekomendasiId(firstKodeRekomendasiId);
			selfK.data.firstKodeRekomendasi(firstKodeRekomendasi);
			selfK.data.firstUraianRekomendasi(firstUraianRekomendasi);
			selfK.data.firstKerugianNegara(firstKerugianNegara);
			if (firstKerugianNegara == 1) {
				selfK.data.firstKerugianNegaraCbk(true);
			}
			selfK.data.firstNilaiRekomendasi(firstNilaiRekomendasi);
			selfK.uiFirstNilaiRekomendasi(accounting.formatMoney(firstNilaiRekomendasi, "Rp", 0, ".", ","));
			
			selfK.uiKodeTemuan(kelompokTemuan+'.'+subKelompokTemuan+'.'+jenisKelompokTemuan+': '+deskripsi_temuan);
			selfK.uiKodeSebab(kodeSebab+": "+uraianSebab);
			selfK.uiFirstKodeRekomendasi(firstKodeRekomendasi+': '+firstOriUraianRekomendasi);
			
			selfK.uiNilaiTemuan(accounting.formatMoney(nilaiTemuan, "Rp", 0, ".", ","));
			
			selfK.data.firstUnitKerja(firstUnitKerja);
			selfK.uiFirstUnitKerja(firstUnitKerja.unit_kerja);
			selfK.data.firstNamaPpk(firstNamaPpk);
			selfK.data.firstNamaPj(firstNamaPj);
			selfK.data.firstUraianTindakLanjut(uraianTindakLanjut);
//			firstDokumentPendukungTl : ko.observable(),
			selfK.data.firstTanggalTl(tanggalTl);
			selfK.data.firstJumlahTl(nilaiTl);
			selfK.data.firstTotalTindakLanjut(totalTindakLanjut);
			
			selfK.data.firstMatchedTlRowCount(firstMatchedTl.rowCount);
			selfK.data.firstMatchedTlTotalAmount(firstMatchedTl.totalAmount);
//			
			selfK.data.firstNotMatchedTlRowCount(firstNotMatchedTl.rowCount);
			selfK.data.firstNotMatchedTlTotalAmount(firstNotMatchedTl.totalAmount);
			
			console.info('firstnotyet action');
			console.debug(firstNotYetActionTl);
			selfK.data.firstNotYetActionTlRowCount(firstNotYetActionTl.rowCount);
			selfK.data.firstNotYetActionTlRowCount(firstNotYetActionTl.totalAmount);
		}
		
		selfK.uiKodeTemuan = ko.observable();
		selfK.uiKodeSebab = ko.observable();
		selfK.uiFirstKodeRekomendasi = ko.observable();
		selfK.uiFirstNilaiRekomendasi = ko.observable();
		selfK.uiNilaiTemuan = ko.observable();

		selfK.uiFirstJumlahTl = ko.computed(function(){
			if (selfK.data.firstJumlahTl() != undefined) {
				console.debug('uiFirstJumlahTl was formated');
				console.debug(selfK.data.firstJumlahTl());
				return accounting.formatMoney(selfK.data.firstJumlahTl(), "Rp", 0, ".", ",");
			} else {
				return null;
			}
			
		});
		
		selfK.uiPeriodeTindakLanjut = ko.computed(function(){
			var moment = require('moment');
			if (selfK.data.firstTanggalTl() != undefined) {
				var tglTl = selfK.data.firstTanggalTl();
				var month = moment(tglTl, "DD-MM-YYYY").format("M");
//				console.debug('selected month '+ month);
//				var month = moment('2016-08-17').format("M");
				if (parseInt(month) > 1 && parseInt(month) <= 6 ) {
					return "SEMESTER I";
				} else if (parseInt(month) > 6 && parseInt(month) <= 12 ) {
					return "SEMESTER II";
				} else {
					return 'Unknown date '+ selfK.data.firstTanggalTl();
				}
			} else {
				return '-';
			}
		});
		
		self.firstViewHistoryTl = function(data) {
			var rekId = data.data.firstRekomendasiId();
			window.location = site_url+"/tlhp/lhp/historytl/"+rekId;
		}
		
		selfK.uiFirstMatchedTlTotalAmount = ko.computed(function() {
			return accounting.formatMoney(selfK.data.firstMatchedTlTotalAmount(), "Rp", 0, ".", ",");
		});
		
		selfK.uiFirstNotMatchedTlTotalAmount = ko.computed(function() {
			return accounting.formatMoney(selfK.data.firstNotMatchedTlTotalAmount(), "Rp", 0, ".", ",");
		});
		
		selfK.uiFirstNotYetActionTlTotalAmount = ko.computed(function() {
			return accounting.formatMoney(selfK.data.firstNotYetActionTlTotalAmount(), "Rp", 0, ".", ",");
		});
		
		selfK.uiFirstUnitKerja = ko.observable();
	}
	
	function JenisTemuanViewModel(kodeTemuan, jenisTemuan) {
		var selfJ = this;
		
		selfJ.data = {
			kodeTemuan: ko.observable(kodeTemuan),
			jenisTemuan: ko.observable(jenisTemuan),
			kertasKerjaTemuan: ko.observableArray([new KertasKerjaTemuanViewModel(1, true)])
		}
		
		selfJ.totalNilaiTemuan = ko.computed(function(){
			var totalNilaiTemuan = 0;
			_.each(selfJ.data.kertasKerjaTemuan(), function(kktItem){
				if (kktItem.data.nilaiTemuan() != undefined) {
					var nilaiTemuan = parseFloat(kktItem.data.nilaiTemuan());
					totalNilaiTemuan += nilaiTemuan;
				}
			});
			
			return accounting.formatMoney(totalNilaiTemuan, "Rp", 0, ".", ",");
		});
		
		selfJ.totalNilaiRekomendasi = ko.computed(function(){
			var totalNilaiTemuan = 0;
			_.each(selfJ.data.kertasKerjaTemuan(), function(kktItem){
				if (kktItem.data.firstNilaiRekomendasi() != undefined) {
					totalNilaiTemuan += parseFloat(kktItem.data.firstNilaiRekomendasi());
					_.each(kktItem.data.rekomendasi(), function(itemRek){
						if (itemRek.data.nilaiRekomendasi() != undefined) {
							totalNilaiTemuan += parseFloat(itemRek.data.nilaiRekomendasi());
						}
					});
				}
			});
			
			return accounting.formatMoney(totalNilaiTemuan, "Rp", 0, ".", ",");
		});
	}
	
	function MainViewModel() {
		var self = this;
		
		self.jenisTemuan = ko.observableArray([]);
		
		self.init = function() {
			self.loadUnitKerja();
			self.jenisTemuan.push(new JenisTemuanViewModel('A', 'SISTEM PENGENDALIAN INTERNAL'));
			self.jenisTemuan.push(new JenisTemuanViewModel('B', 'KEPATUHAN TERHADAP PERATURAN DAN PERUNDANG-UNDANGAN'));
			self.jenisTemuan.push(new JenisTemuanViewModel('C', 'LAPORAN KEUANGAN'));
			self.loadLhp();
		}
		
		self.doExportToExcel = function() {
			console.debug('doExportToExcel');
			var lhp_id = $('#lhp_id').val();
			window.open(site_url+"tlhp/lhp/downloadxls?lhp_id="+lhp_id, "_blank");
		} // end do Export To Excel
		
		self.loadLhp = function() {
			var lhp_id = $('#lhp_id').val();
			$.ajax({
				type: 'GET',
				data: {'lhp_id': lhp_id, 'kkt': true},
				contentType: 'application/json',
				dataType: 'json',
				url: site_url + "tlhp/restlhp/lhp",
				beforeSend: function(){
					console.info('attempting to load lhp data');
				},
				success: function(msg) {
					_.each(self.jenisTemuan(), function(item){
						var kodeTemuan = item.data.kodeTemuan().toLowerCase();
						var kkt = _.filter(msg.data.kertasKerjaTemuan, function(kktItem){
							return kktItem.jenis_temuan == kodeTemuan; 
						});
						if (kkt.length > 0) {
							item.data.kertasKerjaTemuan.removeAll();
							var urutan = 1;
							_.each(kkt, function(a){
								var newKkt;
								if (urutan == 1) {
									newKkt = new KertasKerjaTemuanViewModel(urutan, true)
								} else {
									newKkt = new KertasKerjaTemuanViewModel(urutan, false)
								}
								
								if (a.rekomendasi.length > 0) {
//									kodeTemuanId, kelompok_temuan, sub_kelompok_temuan, jenis_kelompok_temuan,
									var firstUnitKerja = {
										'unit_kerja_id': a.rekomendasi[0].unit_kerja_id,
										'unit_kerja': a.rekomendasi[0].unit_kerja
									}
									
//									uraianTindakLanjut, tanggalTl, nilaiTl
									newKkt.initData(a.kertas_kerja_id, a.lhp_id, a.jenis_temuan, null, 
											a.kode_temuan_id, a.kelompok_temuan, a.sub_kelompok_temuan, a.jenis_kelompok_temuan, 
											a.deskripsi_temuan, a.uraian_temuan, a.kode_sebab_id, 
											a.kode_sebab, a.uraian_sebab, a.nilai_temuan,
											a.rekomendasi[0].rekomendasi_id,
											a.rekomendasi[0].kode_rekomendasi_id,
											a.rekomendasi[0].kode_rekomendasi,
											a.rekomendasi[0].ori_uraian_rekomendasi, 
											a.rekomendasi[0].uraian_rekomendasi, 
											a.rekomendasi[0].kerugian_negara, 
											a.rekomendasi[0].nilai_rekomendasi,
											firstUnitKerja,
											a.rekomendasi[0].nama_ppk,
											a.rekomendasi[0].nama_pj,
											a.rekomendasi[0].tindak_lanjut != undefined ? a.rekomendasi[0].tindak_lanjut.tindak_lanjut : null,
											a.rekomendasi[0].tindak_lanjut != undefined ? a.rekomendasi[0].tindak_lanjut.tanggal_tl : null,
											a.rekomendasi[0].tindak_lanjut != undefined ? a.rekomendasi[0].tindak_lanjut.nilai : null, 
											a.rekomendasi[0].total_tindak_lanjut != undefined ? a.rekomendasi[0].total_tindak_lanjut : 0, 
											a.rekomendasi[0].matchedtl != undefined ? a.rekomendasi[0].matchedtl : null, 
											a.rekomendasi[0].notmatchedtl, 
											a.rekomendasi[0].notYetActionTl);
								} else {
									newKkt.initData(a.kertas_kerja_id, a.lhp_id, a.jenis_temuan, null, 
											a.kode_temuan_id, a.kelompok_temuan, a.sub_kelompok_temuan, a.jenis_kelompok_temuan, 
											a.deskripsi_temuan, a.uraian_temuan, a.kode_sebab_id, 
											a.kode_sebab, a.uraian_sebab, a.nilai_temuan, 
											null,
											null,
											null, 
											null, 
											null, 
											null);
								}
								
								for (var i=0; i< a.rekomendasi.length; i++) {
									if (i != 0) {
										var rekView = new RekomendasiViewModel(false);
										
										var unitKerja = {
											"unit_kerja_id" : a.rekomendasi[i].unit_kerja_id,
											"unit_kerja" : a.rekomendasi[i].unit_kerja,
										}
										
//										uraianTindakLanjut, tanggalTl, nilaiTl
										rekView.initData(a.rekomendasi[i].rekomendasi_id, 
												a.rekomendasi[i].kertas_kerja_id, 
												a.rekomendasi[i].kode_rekomendasi_id,
												a.rekomendasi[i].kode_rekomendasi,
												a.rekomendasi[i].ori_uraian_rekomendasi, 
												a.rekomendasi[i].uraian_rekomendasi, 
												a.rekomendasi[i].kerugian_negara, 
												a.rekomendasi[i].nilai_rekomendasi, 
												unitKerja,
												a.rekomendasi[i].nama_ppk,
												a.rekomendasi[i].nama_pj, 
												a.rekomendasi[i].tindak_lanjut != undefined ? a.rekomendasi[i].tindak_lanjut.tindak_lanjut : null,
												a.rekomendasi[i].tindak_lanjut != undefined ? a.rekomendasi[i].tindak_lanjut.tanggal_tl : null,
												a.rekomendasi[i].tindak_lanjut != undefined ? a.rekomendasi[i].tindak_lanjut.nilai : null, 
												a.rekomendasi[i].total_tindak_lanjut != undefined ? a.rekomendasi[i].total_tindak_lanjut : 0,
												a.rekomendasi[i].matchedtl != undefined ? a.rekomendasi[i].matchedtl : null,
												a.rekomendasi[i].notmatchedtl, 
												a.rekomendasi[i].notYetActionTl);
										newKkt.data.rekomendasi.push(rekView);
									}
								}
								item.data.kertasKerjaTemuan.push(newKkt);
								urutan++;
							});
						} else {
							_.each(item.data.kertasKerjaTemuan(), function(item){
								console.debug('setup lhp id '+ msg.data.lhp.lhp_id);
								item.data.lhpId(msg.data.lhp.lhp_id);
							});
						}
					}); // end each jenis temuan
				},
				error: function(xhr, msg) {
					$.notify("Internal Serverl Error, Cannot Load LHP Data");
				}
			}).always(function(){
				_.each(self.jenisTemuan(), function(item){
					var removedKkt = item.data.kertasKerjaTemuan()[0];
					console.info('will be removed');
					console.debug(removedKkt.data.kertasKerjaId());
					if (removedKkt.data.kertasKerjaId() == undefined) {
						console.info("masuk kesini");
						item.data.kertasKerjaTemuan.remove(removedKkt);
					}
				});
			});
		}
		
		self.totalNilaiTemuan = ko.computed(function() {
			var totalNilaiTemuan = 0;
			_.each(self.jenisTemuan(), function(item){
				_.each(item.data.kertasKerjaTemuan(), function(kktItem){
					console.info('kkt item');
					console.debug(kktItem.data.nilaiTemuan());
					totalNilaiTemuan += 1;
				});
				
			});
			
			return accounting.formatMoney(totalNilaiTemuan, "Rp", 0, ".", ",");
		});
		
		self.unitKerja = ko.observableArray([]);
		self.loadUnitKerja = function() {
			$.ajax({
				type: 'GET',
				contentType: 'application/json',
				url: site_url + "tlhp/restlhp/unitkerja",
				beforeSend: function(){
					console.info('attempting to contact server to get data unitkerja');
				},
				success: function(data) {
					var unitKerja = data.data;
					_.each(unitKerja, function(item){
						self.unitKerja.push(item);
					});
				},
				error: function(xhr, msg) {
					alert("Internal Server Error..");
				}
			});
		}
		
	} // end mainViewModel
	
	var vm = new MainViewModel();
	
	$(function(){
	
		/**
		 * Save To Excel
		 * agusprasetyo811@gmail.com
		 */
		$('#save-to-excel').on('click', function() {
			$.ajax({
				action: 'GET',
				url: site_url + "tlhp/pilihlhp/save_to_excel",
				success: function(data) {
					alert('Data berhasil disimpan dalam File Excel, Lokasi, `assets/data/lhp.xls`');
				}, 
				error: function(e) {
					console.info('error');
				}
			});
		});
		
		
		ko.applyBindings(vm);
		vm.init();
	});
	
});