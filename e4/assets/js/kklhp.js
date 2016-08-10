define(["jquery", "knockout","underscore", "accounting",  "bootstrap","select2", 
        "jquerypriceformat"], function($, ko, _, accounting){
	
	
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
			
			NamaPpk : ko.observable(),
			NamaPj : ko.observable(),
			periodeTindakLanjut : ko.observable(),
			uraianTindakLanjut : ko.observable(),
			dokumentPendukungTl : ko.observable(),
			tanggalTl: ko.observable(),
			jumlahTl : ko.observable(),
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
				oriUraianRekomendasi, uraianRekomendasi, kerugianNegara, nilaiRekomendasi) {
			selfR.data.rekomendasiId(rekomendasiId);
			selfR.data.kertasKerjaId(kertasKerjaId);
			selfR.data.kodeRekomendasiId(kodeRekomendasiId);
			selfR.data.uraianRekomendasi(uraianRekomendasi);
			if (kerugianNegara ==1) {
				selfR.data.kerugianNegaraCbk(true);
			}
			selfR.data.nilaiRekomendasi(nilaiRekomendasi);
			selfR.uiKodeRekomendasi(kodeRekomendasi+": "+oriUraianRekomendasi);
			selfR.uiNilaiRekomendasi(accounting.formatMoney(nilaiRekomendasi, "Rp", 0, ".", ","));
		}
		
		selfR.nilaiKerugianNegaraEnable = ko.observable(false);
		selfR.uiKodeRekomendasi = ko.observable();
		selfR.uiNilaiRekomendasi = ko.observable();
		selfR.uiJumlahTl = ko.computed(function(){
			return accounting.formatMoney(selfR.data.nilaiRekomendasi(), "Rp", 0, ".", ",");
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
			
			firstNamaPpk : ko.observable(),
			firstNamaPj : ko.observable(),
			firstPeriodeTindakLanjut : ko.observable(),
			firstUraianTindakLanjut : ko.observable(),
			firstDokumentPendukungTl : ko.observable(),
			firstTanggalTl: ko.observable(),
			firstJumlahTl : ko.observable(),
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
				firstKerugianNegara, firstNilaiRekomendasi) {
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
	}
	
	function MainViewModel() {
		var self = this;
		
		self.jenisTemuan = ko.observableArray([]);
		self.data = {
				
		}
		self.init = function() {
			self.jenisTemuan.push(new JenisTemuanViewModel('A', 'SISTEM PENGENDALIAN INTERNAL'));
			self.jenisTemuan.push(new JenisTemuanViewModel('B', 'KEPATUHAN TERHADAP PERATURAN DAN PERUNDANG-UNDANGAN'));
			self.jenisTemuan.push(new JenisTemuanViewModel('C', 'LAPORAN KEUANGAN'));
			self.loadLhp();
		}
		
		self.doInsert = function() {
			var kktList = [];
			var errorList = [];
			for (var i=0; i<self.jenisTemuan().length; i++) {
				var jenisTemuan = {
					kode_jenis_temuan: self.jenisTemuan()[i].data.kodeTemuan(),
					jenis_temuan: self.jenisTemuan()[i].data.jenisTemuan(),
				}
				var kertasKerjaTemuanList = self.jenisTemuan()[i].data.kertasKerjaTemuan();
				_.each(kertasKerjaTemuanList, function(kertasKerjaTemuan){
					var listRekomendasi = [];
					if (kertasKerjaTemuan.data.firstKodeRekomendasiId() != undefined &&
						kertasKerjaTemuan.data.firstUraianRekomendasi() != undefined) {
						listRekomendasi.push({
							rekomendasi_id: kertasKerjaTemuan.data.firstRekomendasiId(),
							kode_rekomendasi_id: kertasKerjaTemuan.data.firstKodeRekomendasiId(),
							uraian_rekomendasi: kertasKerjaTemuan.data.firstUraianRekomendasi(),
							kerugian_negara: kertasKerjaTemuan.data.firstKerugianNegara(),
							nilai_rekomendasi: kertasKerjaTemuan.data.firstNilaiRekomendasi(),
						});
					}
					
					_.each(kertasKerjaTemuan.data.rekomendasi(), function(item){
						console.debug(ko.toJSON(item.data));
						var itemRekomendasi = {
							rekomendasi_id: item.data.rekomendasiId(),
							kode_rekomendasi_id: item.data.kodeRekomendasiId(),
							uraian_rekomendasi: item.data.uraianRekomendasi(),
							kerugian_negara: item.data.kerugianNegara(),
							nilai_rekomendasi: item.data.nilaiRekomendasi()
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
					
//					console.debug(itemKkt);
//					console.info(itemKkt.listRekomendasi);
					
					if (itemKkt.kode_temuan_id !== undefined &&
						itemKkt.uraian_temuan !== undefined &&
						itemKkt.kode_sebab_id !== undefined &&
						itemKkt.uraian_sebab !== undefined &&
						itemKkt.nilai_temuan !== undefined) {
						kktList.push(itemKkt);
					}
				});
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
//			console.debug(kklhpData);
			self.postKklhp(action, kklhpData);
		} // end do insert
		
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
				alert('Data sudah disimpan');
//				window.location = site_url+ "tlhp/menusa";
//				console.debug(window.location);
			},
			error: function(xhr, msg) {
				alert("Internal Server Error..");
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
				data: {'lhp_id': lhp_id},
				contentType: 'application/json',
				dataType: 'json',
				url: site_url + "tlhp/restlhp/lhp",
				beforeSend: function(){
					console.info('attempting to load lhp data');
				},
				success: function(msg) {
					console.debug(msg);
					console.info('return from server lhpId '+ lhp_id);
					console.debug(msg.data.kertasKerjaTemuan.length);
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
											a.rekomendasi[0].nilai_rekomendasi);
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
										rekView.initData(a.rekomendasi[i].rekomendasi_id, 
												a.rekomendasi[i].kertas_kerja_id, 
												a.rekomendasi[i].kode_rekomendasi_id,
												a.rekomendasi[i].kode_rekomendasi,
												a.rekomendasi[i].ori_uraian_rekomendasi, 
												a.rekomendasi[i].uraian_rekomendasi, 
												a.rekomendasi[i].kerugian_negara, 
												a.rekomendasi[i].nilai_rekomendasi);
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
					alert("Internal Server Error");
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
			dokument : ko.observableArray([]),
			tanggalTl: ko.observable()
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
			if (self.isFirstLineTindakLanjut == true) {
				self.firstViewTindakLanjut.data.firstUraianTindakLanjut(self.dataTindakLanjut.uraianTindakLanjut());
				self.firstViewTindakLanjut.data.firstJumlahTl(self.dataTindakLanjut.jumlahTl());
				self.firstViewTindakLanjut.data.firstTanggalTl(self.dataTindakLanjut.tanggalTl());
			} else {
				console.debug(self.viewTindakLanjut);
				self.viewTindakLanjut.data.uraianTindakLanjut(self.dataTindakLanjut.uraianTindakLanjut());
				self.viewTindakLanjut.data.jumlahTl(self.dataTindakLanjut.jumlahTl());
				self.viewTindakLanjut.data.tanggalTl(self.dataTindakLanjut.tanggalTl());
			}
			
			$('#formTindakLanjut').modal('hide');
//			console.debug(viewTindakLanjut.data);
		}
		
		self.resetDataTindakLanjut = function() {
			self.dataTindakLanjut.uraianRekomendasi(null);
			self.dataTindakLanjut.uraianTindakLanjut(null);
			self.dataTindakLanjut.jumlahTl(null);
			self.dataTindakLanjut.dokument([]);
			self.dataTindakLanjut.tanggalTl(null);
		}
		
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
									id: data.data[i].kode_temuan,
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
		ko.applyBindings(vm);
		vm.init();
	});
	
});