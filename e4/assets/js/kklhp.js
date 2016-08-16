define(["jquery", "knockout","underscore", "accounting",  "bootstrap","select2", 
        "notify", "moment"], function($, ko, _, accounting){
	
//	console.debug(moment);
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
			console.debug('initData rekomendasi');
			selfR.data.unitKerja(unitKerja);
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
	}
	
	function JenisTemuanViewModel(kodeTemuan, jenisTemuan) {
		var selfJ = this;
		
		selfJ.data = {
			kodeTemuan: ko.observable(kodeTemuan),
			jenisTemuan: ko.observable(jenisTemuan),
			kertasKerjaTemuan: ko.observableArray([new KertasKerjaTemuanViewModel(1, true)])
		}
		
		selfJ.addRow = function() {
			var urutan = selfJ.data.kertasKerjaTemuan().length + 1;
			var kkt = new KertasKerjaTemuanViewModel(urutan, false);
			kkt.data.jenisTemuan(selfJ.data.kodeTemuan());
			kkt.data.lhpId($('#lhp_id').val());
			
			console.debug(kkt.data.lhpId());
			selfJ.data.kertasKerjaTemuan.push(kkt);
		}
		
		selfJ.removeRow = function(vModel) {
			selfJ.data.kertasKerjaTemuan.remove(vModel);
			for (var i=0; i< selfJ.data.kertasKerjaTemuan().length; i++) {
				var urutan = i+1;
				var kertasKerjaTemuan = selfJ.data.kertasKerjaTemuan()[i];
				kertasKerjaTemuan.urutan(urutan);
			}
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
		self.data = {
			totalTemuan: ko.observable(0),
			totalRekomendasi: ko.observable(0),
			totalSesuaiRekomendasi: ko.observable(0),
			totalTdkSesuaiRekomendasi: ko.observable(0),
			totalBlmTindakLanjut: ko.observable(0),
			totalTdkTdpTl: ko.observable(0),
		}
		self.init = function() {
			self.loadUnitKerja();
			self.jenisTemuan.push(new JenisTemuanViewModel('A', 'SISTEM PENGENDALIAN INTERNAL'));
			self.jenisTemuan.push(new JenisTemuanViewModel('B', 'KEPATUHAN TERHADAP PERATURAN DAN PERUNDANG-UNDANGAN'));
			self.jenisTemuan.push(new JenisTemuanViewModel('C', 'LAPORAN KEUANGAN'));
			self.loadLhp();
		}
		
		self.doInsert = function() {
			var kktList = [];
			var errorList = [];
			for (var i=0; i<self.jenisTemuan().length; i++) {
				var kdTemuan = self.jenisTemuan()[i];
				var jenisTemuan = {
					kode_jenis_temuan: self.jenisTemuan()[i].data.kodeTemuan(),
					jenis_temuan: self.jenisTemuan()[i].data.jenisTemuan(),
				}
				var kertasKerjaTemuanList = self.jenisTemuan()[i].data.kertasKerjaTemuan();
				var kktRow = 1;
				_.each(kertasKerjaTemuanList, function(kertasKerjaTemuan){
//					var kertasKerjaTemuan = kertasKerjaTemuanList[i];
					var listRekomendasi = [];
					if (kertasKerjaTemuan.data.firstKodeRekomendasiId() != undefined &&
						kertasKerjaTemuan.data.firstUraianRekomendasi() != undefined) {
						console.debug('execute baris ke-'+ kktRow);
						var firstRekomendasi = {
								rekomendasi_id: kertasKerjaTemuan.data.firstRekomendasiId(),
								kode_rekomendasi_id: kertasKerjaTemuan.data.firstKodeRekomendasiId(),
								uraian_rekomendasi: kertasKerjaTemuan.data.firstUraianRekomendasi(),
								kerugian_negara: kertasKerjaTemuan.data.firstKerugianNegara(),
								nilai_rekomendasi: kertasKerjaTemuan.data.firstNilaiRekomendasi(),
								nama_ppk: kertasKerjaTemuan.data.firstNamaPpk(),
								nama_pj: kertasKerjaTemuan.data.firstNamaPj(),
								unit_kerja_id: kertasKerjaTemuan.data.firstUnitKerja().unit_kerja_id,
						}
						
						var firstUraianTl = kertasKerjaTemuan.data.firstUraianTindakLanjut();
						var firstJumlahTl = kertasKerjaTemuan.data.firstJumlahTl();
						var isFirstNewTl = kertasKerjaTemuan.data.isFirstNewTl();
						console.debug(firstUraianTl);
						console.debug(firstJumlahTl);
						if ((firstUraianTl != undefined || firstUraianTl != null) &&
								(firstJumlahTl != undefined || firstJumlahTl != null) && isFirstNewTl == true) {
							firstRekomendasi.tindak_lanjut = {
								uraian_tindak_lanjut: kertasKerjaTemuan.data.firstUraianTindakLanjut(),
								tanggal_tl: kertasKerjaTemuan.data.firstTanggalTl(),
								nilai: kertasKerjaTemuan.data.firstJumlahTl()
							}
						}
						
						listRekomendasi.push(firstRekomendasi);
					}
					
					_.each(kertasKerjaTemuan.data.rekomendasi(), function(item){
						console.debug(ko.toJSON(item.data));
						var itemRekomendasi = {
							rekomendasi_id: item.data.rekomendasiId(),
							kode_rekomendasi_id: item.data.kodeRekomendasiId(),
							uraian_rekomendasi: item.data.uraianRekomendasi(),
							kerugian_negara: item.data.kerugianNegara(),
							nilai_rekomendasi: item.data.nilaiRekomendasi(),
							nama_ppk: item.data.namaPpk(),
							nama_pj: item.data.namaPj(),
							unit_kerja_id: item.data.unitKerja().unit_kerja_id
						}
						
						var uraianTl = item.data.uraianTindakLanjut();
						var jumlahTl = item.data.jumlahTl();
						var isNewTl = item.data.isNewTl();
						if ((uraianTl != undefined || uraianTl != null)&& 
								(item.data.jumlahTl() != undefined || jumlahTl != null) && isNewTl == true) {
							itemRekomendasi.tindak_lanjut = {
								uraian_tindak_lanjut: item.data.uraianTindakLanjut(),
								tanggal_tl: item.data.tanggalTl(),
								nilai: item.data.jumlahTl()
							}
						}
						listRekomendasi.push(itemRekomendasi);
					});
					
					var itemKkt = {
						kertas_kerja_id: kertasKerjaTemuan.data.kertasKerjaId(),
						lhp_id: kertasKerjaTemuan.data.lhpId(),
						jenis_temuan: jenisTemuan,
						no_temuan: '',
						kode_temuan_id: kertasKerjaTemuan.data.kodeTemuanId(),
						uraian_temuan: kertasKerjaTemuan.data.uraianTemuan(),
						kode_sebab_id: kertasKerjaTemuan.data.kodeSebabId(),
						uraian_sebab: kertasKerjaTemuan.data.uraianSebab(),
						nilai_temuan: kertasKerjaTemuan.data.nilaiTemuan(),
						rekomendasi: listRekomendasi
					}
					
					if (itemKkt.kode_temuan_id !== undefined &&
						itemKkt.uraian_temuan !== undefined &&
						itemKkt.kode_sebab_id !== undefined &&
						itemKkt.uraian_sebab !== undefined &&
						itemKkt.nilai_temuan !== undefined) {
						kktList.push(itemKkt);
						if (itemKkt.rekomendasi.length == 0) {
							errorList.push('Rekomendasi untuk temuan '+ kdTemuan.data.kodeTemuan() +' baris '+ kktRow + ' belum lengkap');
						}
						
						_.each(itemKkt.rekomendasi, function(itemRek){
//							kode_rekomendasi_id: item.data.kodeRekomendasiId(),
//							uraian_rekomendasi: item.data.uraianRekomendasi(),
//							kerugian_negara: item.data.kerugianNegara(),
//							nilai_rekomendasi: item.data.nilaiRekomendasi(),
//							nama_ppk: item.data.namaPpk(),
//							nama_pj: item.data.namaPj(),
							if (itemRek.kode_rekomendasi_id == undefined || itemRek.kode_rekomendasi_id == null &&
								itemRek.uraian_rekomendasi == undefined || itemRek.uraian_rekomendasi == null &&
								itemRek.nama_ppk == undefined || itemRek.nama_ppk == null &&
								itemRek.nama_pj == undefined || itemRek.nama_pj == null) {
								errorList.push('Data rekomendasi '+ kdTemuan.data.kodeTemuan() +' baris '+ kktRow + ' belum lengkap');
							}
						});
					}
					
					kktRow += parseInt(1);
//					console.debug(kktRow);
				}); //end loop kkt
			}
			
			var kklhpData = {
					'lhp': {
						'lhp_id': $('#lhp_id').val()
					}, 
					'kertasKerjaTemuan': kktList
				}
//			console.debug(kklhpData);
			var action = $('#action').val();
			if (action == "update") {
				action = "PUT";
			} else {
				action = "POST";
			}
			console.debug('action '+ action);
			console.debug(kklhpData);
			if (errorList.length > 0) {
				_.each(errorList, function(errItem){
					$.notify(errItem);
				});
			} else {
				self.postKklhp(action, kklhpData);
			}
		} // end do insert
		
		
		self.doExportToExcel = function() {
			console.debug('doExportToExcel');
			var lhp_id = $('#lhp_id').val();
			window.open(site_url+"tlhp/lhp/downloadxls?lhp_id="+lhp_id, "_blank");
		} // end do Export To Excel
		
		self.postKklhp = function(actionType, postData) {
			$.ajax({
				type: actionType,
				data: JSON.stringify(postData),
				contentType: 'application/json',
				url: site_url + "tlhp/restlhp/kklhp",
				beforeSend: function(){
				console.info('attempting to contact server to save data kklhp');
				$('#btnSave').attr('disabled', 'disabled');
			},
			success: function(data) {
				console.info('kklhp saved');
//				alert('Data sudah disimpan');
				$.notify("Data sudah disimpan", "success");
//				window.location = site_url+ "tlhp/menusa";
//				console.debug(window.location);
			},
			error: function(xhr, msg) {
				alert("Maaf sistem sedang mengalami gangguan, silahkan hubungi Administrator", "error");
			}
			}).always(function(){
				$('#btnSave').removeAttr('disabled');
			});
		}
		
		self.loadLhp = function() {
			var lhp_id = $('#lhp_id').val();
//			console.debug('lhp_id '+ lhp_id);
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
//					console.debug(msg);
//					console.info('return from server lhpId '+ lhp_id);
//					console.debug(msg.data.kertasKerjaTemuan.length);
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
									_.each(self.unitKerja(), function(ukerja){
										var firstUnitKerjaId = a.rekomendasi[0].unit_kerja_id;
										if (ukerja.unit_kerja_id == firstUnitKerjaId) {
											firstUnitKerja = ukerja;
										}
									});
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
										
										var unitKerja;
										_.each(self.unitKerja(), function(ukerja){
											var unitKerjaId = a.rekomendasi[i].unit_kerja_id;
											if (ukerja.unit_kerja_id == unitKerjaId) {
												unitKerja = ukerja;
											}
										});
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
				
			});
		}
		
		
		self.dataTindakLanjut = {
			kertasKerjaId: ko.observable(),
			rekomendasiId: ko.observable(),
			uraianRekomendasi: ko.observable(),
			uraianTindakLanjut: ko.observable(),
			
			jumlahTl: ko.observable(),
			uiJumlahTl: ko.observable(),
			
			dokument : ko.observableArray([]),
			tanggalTl: ko.observable(),
		}
		
		self.firstViewTindakTindakLanjut;
		self.viewTindakLanjut;
		self.isFirstLineTindakLanjut = false;
		
		self.addTindakLanjutFirstLine = function(data){
			self.resetDataTindakLanjut();
			self.isFirstLineTindakLanjut = true;
			self.firstViewTindakLanjut = data;
			self.dataTindakLanjut.uraianRekomendasi(data.data.firstUraianRekomendasi());
			$('#formTindakLanjut').modal('show');
		}
		
		self.addTindakLanjut = function(data){
			self.resetDataTindakLanjut();
			console.debug(data);
			self.viewTindakLanjut = data;
			self.dataTindakLanjut.uraianRekomendasi(data.data.uraianRekomendasi());
			$('#formTindakLanjut').modal('show');
		}
		
		self.insertTindakLanjut = function() {
			console.info('insert tindak lanjut was clicked');
			var errorMsg = [];
			if (self.dataTindakLanjut.uraianTindakLanjut() == undefined) {
				errorMsg.push('Uraian tindak lanjut tidak boleh kosong');
			}
			
			if (self.dataTindakLanjut.jumlahTl() == undefined) {
				errorMsg.push('Nilai tidak boleh kosong');
			}
			
			if (self.dataTindakLanjut.tanggalTl() == undefined) {
				errorMsg.push('Tanggal tidak boleh kosong');
			}
			
			if (self.dataTindakLanjut.uraianRekomendasi() == undefined) {
				errorMsg.push('Uraian Rekomendasi tidak boleh kosong');
			}
			
			if (errorMsg.length == 0) {
				if (self.isFirstLineTindakLanjut == true) {
					self.firstViewTindakLanjut.data.firstUraianTindakLanjut(self.dataTindakLanjut.uraianTindakLanjut());
					self.firstViewTindakLanjut.data.firstJumlahTl(self.dataTindakLanjut.jumlahTl());
					self.firstViewTindakLanjut.data.firstTanggalTl(self.dataTindakLanjut.tanggalTl());
					self.firstViewTindakLanjut.data.isFirstNewTl(true);
				} else {
					console.debug(self.viewTindakLanjut);
					self.viewTindakLanjut.data.uraianTindakLanjut(self.dataTindakLanjut.uraianTindakLanjut());
					self.viewTindakLanjut.data.jumlahTl(self.dataTindakLanjut.jumlahTl());
					self.viewTindakLanjut.data.tanggalTl(self.dataTindakLanjut.tanggalTl());
					self.viewTindakLanjut.data.isNewTl(true);
					
//					console.debug(self.viewTindakLanjut.data.uraianTindakLanjut());
//					console.debug(self.viewTindakLanjut.data.jumlahTl());
//					console.debug(self.viewTindakLanjut.data.tanggalTl());
				}
				$('#formTindakLanjut').modal('hide');
				self.isFirstLineTindakLanjut = false;
			} else {
				$("#notify").notify("Data belum terisi semua, silahkan lenkapi", "alert alert-error");
			}
			
		}
		
		self.resetDataTindakLanjut = function() {
			self.dataTindakLanjut.uraianRekomendasi(null);
			self.dataTindakLanjut.uraianTindakLanjut(null);
			self.dataTindakLanjut.jumlahTl(null);
			self.dataTindakLanjut.uiJumlahTl(null);
			self.dataTindakLanjut.dokument([]);
			self.dataTindakLanjut.tanggalTl(null);
		}
		
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
		
		self.totalNilaiRekomendasi = ko.computed(function(){
			
		});
	} // end mainViewModel
	
	var vm = new MainViewModel();
	
	//TODO: kode dibawah masih banyak yang duplicate,
	// sederhanakan lagi ya
	ko.bindingHandlers.kodeTemuan = {
		init: function(element, valueAccessor, allBindings, s, te) {
			var options = {
					ajax: {
						action: 'GET',
						dataType: 'json',
						url: site_url + "tlhp/restlhp/codtemuan",
						success: function() {
							console.info('success');
						}, 
						processResults: function(data, params) {
							var rData = [];
							for (var i=0; i<data.data.length; i++) {
								var item = {
									id: data.data[i].kode_temuan_id,
									text: data.data[i].kode_temuan+": "+data.data[i].deskripsi
								}
								rData.push(item);
							}
							
							return {
							    results: rData,
							    pagination: {
							      more: data.more
							    }
							};
						},
						error: function(e) {
							console.info('error');
						}
					}	
			}
			
			var kodeTemuanId = allBindings().value();
			var uiKodeTemuan = allBindings().uiKodeTemuan();
			if (kodeTemuanId != undefined && uiKodeTemuan != undefined) {
				options.data = [{id: kodeTemuanId, text: uiKodeTemuan}];
				$(element).select2(options).val(1);
			} else {
				$(element).select2(options);
			}
		},
	}
	
	ko.bindingHandlers.kodeSebab = {
		init: function(element, valueAccessor, allBindings) {
			var options = {
					ajax: {
						action: 'GET',
						dataType: 'json',
						url: site_url + "tlhp/restlhp/codsebab",
						success: function() {
							console.info('success');
						}, 
						processResults: function(data, params) {
							var rData = [];
							for (var i=0; i<data.data.length; i++) {
								var item = {
									id: data.data[i].kode_sebab_id,
									text: data.data[i].kode_sebab+': '+ data.data[i].uraian_sebab
								}
								rData.push(item);
							}
							
							return {
							    results: rData,
							    pagination: {
							      more: data.more
							    }
							};
						},
						error: function(e) {
							console.info('error');
						}
					}	
			}
			
			var uiKodeSebab = allBindings().uiKodeSebab();
			var kodeSebabId = allBindings().value();
			console.debug('uiKodeSebab: '+ uiKodeSebab);
			console.debug('kodeSebabId: '+ kodeSebabId);
			
			var autoCompleteUraian = function(kodeSebabId) {
				console.debug('autocomplete with id '+ kodeSebabId);
				
			}
			
			var $select2;
			if (kodeSebabId != undefined) {
				options.data = [{id: kodeSebabId, text: uiKodeSebab}];
				$select2 = $(element).select2(options).val(kodeSebabId);
			} else {
				$select2 = $(element).select2(options);
			}
			
			$select2.on('select2:select', function(evt){
				var id = $(element).val();
				$.ajax({
					action: 'GET',
					data: {'kode_sebab_id': id},
					dataType: 'json',
					url: site_url + "tlhp/restlhp/getcodesebab",
					beforeSend: function() {
						allBindings().uraianSebab('Please wait..');
					},
					success: function(data) {
						allBindings().uraianSebab(data.data.uraian_sebab);
					}, 
					error: function(e) {
						console.info('error');
					}
				})
			});
			
		}
	}
	

	$(document).ready(function() {
	  $(".select-kode").select2();
	});
	
	ko.bindingHandlers.kodeRekomendasi = {
			init: function(element, valueAccessor, allBindings) {
				var options = {
						ajax: {
						action: 'GET',
						dataType: 'json',
						url: site_url + "tlhp/restlhp/codrekomendasi",
						success: function(msg) {
							console.info('success');
							console.debug(msg.data);
						}, 
						processResults: function(data, params) {
							var rData = [];
							for (var i=0; i<data.data.length; i++) {
								var item = {
									id: data.data[i].kode_rekomendasi_id,
									text: data.data[i].kode_rekomendasi+': '+data.data[i].uraian_rekomendasi
								}
								rData.push(item);
							}
							
							return {
							    results: rData,
							    pagination: {
							      more: data.more
							    }
							};
						},
						error: function(e) {
							console.info('error');
						}
					}	
				}
				
				var rowRekomendasiId = allBindings().value();
				var kodeRekomendasi = allBindings().uiKodeRekomendasi();
				if (rowRekomendasiId != undefined) {
					options.data = [{id: rowRekomendasiId, text: kodeRekomendasi}];
					$(element).select2(options);
				} else {
					$(element).select2(options);
				}
			}
	}
	
	ko.bindingHandlers.priceformat = {
		init: function(element, valueAccessor, allBindings) {
			$(element).on('blur', function(){
				var originalVal = allBindings().value();
				if (originalVal == undefined) {
					originalVal = $(this).val();
					allBindings().originalNumber(originalVal);
					var formatedVal = accounting.formatMoney(originalVal, "Rp", 0, ".", ",")
					allBindings().value(formatedVal);
				} else {
					var unformat = accounting.unformat(originalVal, ",");
					allBindings().originalNumber(unformat);
					var formatedVal = accounting.formatMoney(unformat, "Rp", 0, ".", ",")
					allBindings().value(formatedVal);
				}
				
				
			});
		}
	}
//	ko.bindingHandlers.priceformat = {
//		init: function(element, valueAccessor, allBindings) {
//			$(element).priceFormat({
//			    prefix: 'Rp.',
//			    centsSeparator: ',',
//			    thousandsSeparator: '.'
//			});
//		}
//	}
	
	
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