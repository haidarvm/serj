define(["jquery", "knockout","underscore",  "bootstrap","select2", 
        ], function($, ko, _){
	
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
		}
		
		selfR.data.kerugianNegaraCbk.subscribe(function(newVal){
			if (newVal == true) {
				selfR.data.kerugianNegara(true);
			} else {
				selfR.data.kerugianNegara(false);
			}
			
		});
		
		selfR.initData = function(rekomendasiId, kertasKerjaId, kodeRekomendasiId, oriUraianRekomendasi,
				uraianRekomendasi, kerugianNegara, nilaiRekomendasi) {
			selfR.data.rekomendasiId(rekomendasiId);
			selfR.data.kertasKerjaId(kertasKerjaId);
			selfR.data.kodeRekomendasiId(kodeRekomendasiId);
			selfR.data.uraianRekomendasi(uraianRekomendasi);
			if (kerugianNegara ==1) {
				selfR.data.kerugianNegaraCbk(true);
			}
			selfR.data.nilaiRekomendasi(nilaiRekomendasi);
			selfR.kodeSebab.push({id: kodeRekomendasiId, text: kodeRekomendasiId+"."+oriUraianRekomendasi});
		}
		
		selfR.kodeSebab = ko.observableArray([]);
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
			
			firstKodeRekomendasiId: ko.observable(),
			firstUraianRekomendasi: ko.observable(),
			firstKerugianNegara: ko.observable(false),
			firstKerugianNegaraCbk: ko.observable(false),
			firstNilaiRekomendasi: ko.observable(),
		}
		
		selfK.data.firstKerugianNegaraCbk.subscribe(function(newVal){
			console.debug('kerugian negara '+ newVal)
			if (newVal == true) {
				selfK.data.firstKerugianNegara(true);
			} else {
				selfK.data.firstKerugianNegara(false);
			}  
		});
		
		selfK.addRow = function() {
			console.info('add rekomendasi')
			selfK.data.rekomendasi.push(new RekomendasiViewModel(1, false));
		}
		
		selfK.removeRow = function(vModel) {
			selfK.data.rekomendasi.remove(vModel);
		}
		
		selfK.initData = function(kertasKerjaId, lhpId, jenisTemuan, noTemuan, kodeTemuanId, 
				deskripsi_temuan, uraianTemuan, kodeSebabId, uraianSebab, nilaiTemuan, 
				firstKodeRekomendasiId, firstOriUraianRekomendasi, firstUraianRekomendasi, 
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
			
			selfK.data.firstKodeRekomendasiId(firstKodeRekomendasiId);
			selfK.data.firstUraianRekomendasi(firstUraianRekomendasi);
			selfK.data.firstKerugianNegara(firstKerugianNegara);
			if (firstKerugianNegara == 1) {
				selfK.data.firstKerugianNegaraCbk(true);
			}
			selfK.data.firstNilaiRekomendasi(firstNilaiRekomendasi);
			
			selfK.kodeTemuan.push({id: kodeTemuanId, text: kodeTemuanId+'. '+deskripsi_temuan});
			selfK.kodeSebab.push({id: kodeSebabId, text: kodeSebabId+'. '+uraianSebab});
			selfK.firstKodeRekomendasi.push({id: firstKodeRekomendasiId, text: firstKodeRekomendasiId+'. '+firstOriUraianRekomendasi});
		}
		
		selfK.kodeTemuan = ko.observableArray([]);
		selfK.kodeSebab = ko.observableArray([]);
		selfK.firstKodeRekomendasi = ko.observableArray([]);
		
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
					var listRekomendasi = [{
							kode_rekomendasi_id: kertasKerjaTemuan.data.firstKodeRekomendasiId(),
							uraian_rekomendasi: kertasKerjaTemuan.data.firstUraianRekomendasi(),
							kerugian_negara: kertasKerjaTemuan.data.firstKerugianNegara(),
							nilai_rekomendasi: kertasKerjaTemuan.data.firstNilaiRekomendasi(),
					}];
					
					_.each(kertasKerjaTemuan.data.rekomendasi(), function(item){
						console.debug(ko.toJSON(item.data));
						var itemRekomendasi = {
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
			console.debug(kklhpData);
			var action = $('#action').val();
			if (action == "update") {
				action = "PUT";
			} else {
				action = "POST";
			}
			console.debug('action '+ action);
			self.postKklhp(action, kklhpData);
		} // end do insert
		
		self.postKklhp = function(actionType, postData) {
			if (actionType == "update") {
				alert("Fungsi ini belum dapat digunakan");
			} else {
				$.ajax({
					type: actionType,
					data: JSON.stringify(postData),
					contentType: 'application/json',
					url: site_url + "tlhp/restlhp/kklhp",
//				dataType: 'json',
					beforeSend: function(){
					console.info('attempting to contact server to save data kklhp');
					$('#btnSave').attr('disabled', 'disabled');
				},
				success: function(data) {
					console.info('kklhp saved');
					alert('Data sudah disimpan');
//					window.location = site_url+ "tlhp/menusa";
//					console.debug(window.location);
				},
				error: function(xhr, msg) {
					alert("Internal Server Error..");
				}
				}).always(function(){
					$('#btnSave').removeAttr('disabled');
				});
			}
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
									newKkt.initData(a.kertas_kerja_id, a.lhp_id, a.jenis_temuan, null, a.kode_temuan_id, 
											a.deskripsi_temuan, a.uraian_temuan, a.kode_sebab_id, 
											a.uraian_sebab, a.nilai_temuan, 
											a.rekomendasi[0].kode_rekomendasi_id,
											a.rekomendasi[0].ori_uraian_rekomendasi, 
											a.rekomendasi[0].uraian_rekomendasi, 
											a.rekomendasi[0].kerugian_negara, 
											a.rekomendasi[0].nilai_rekomendasi);
								} else {
									newKkt.initData(a.kertas_kerja_id, a.lhp_id, a.jenis_temuan, null, a.kode_temuan_id, 
											a.deskripsi_temuan, a.uraian_temuan, a.kode_sebab_id, 
											a.uraian_sebab, a.nilai_temuan, 
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
						}
					}); // end each jenis temuan
				},
				error: function(xhr, msg) {
					alert("Internal Server Error");
				}
			}).always(function(){
				
			});
		}
	} // end mainViewModel
	
	var vm = new MainViewModel();
	
	//TODO: kode dibawah masih banyak yang duplicate,
	// sederhanakan lagi ya
	ko.bindingHandlers.kodeTemuan = {
		init: function(element, valueAccessor, allBindings) {
			$(element).select2({
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
								text: data.data[i].kode_temuan_id+'. '+data.data[i].kode_temuan
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
				},
//				placeholder: 'select one'
			});
			$.fn.select2.defaults.set("2", "default some text");
		},
//		update: function(element, valueAccessor, allBindings) {
//			
//		}
	}
	
	ko.bindingHandlers.kodeSebab = {
		init: function(element, valueAccessor, allBindings) {
//			allBindings().listKodeSebab.removeAll();
			$(element).select2({
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
								text: data.data[i].kode_sebab+'. '+data.data[i].uraian_sebab
							}
//							allBindings().listKodeSebab.push(item);
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
			}).on('change', function(evt){
				console.debug("total list kode sebab "+ allBindings().listKodeSebab().length);
//				for(var i=0; i<allBindings().listKodeSebab().length; i++) {
//					var rowKodeSebab = allBindings().listKodeSebab()[i];
//					var kodeSebabId = allBindings().value();
//					console.debug("rowKodeSebab: "+ rowKodeSebab.id + ", kodeSebabId: "+kodeSebabId.id);
//					if (rowKodeSebab.id == kodeSebabId) {
//						allBindings().uraianSebab(rowKodeSebab.text);
//					}
//				}
			});
		} 
		
	}
	

	$(document).ready(function() {
	  $(".select-kode").select2();
	});
	
	ko.bindingHandlers.kodeRekomendasi = {
			init: function(element, valueAccessor, allBindings) {
				$(element).select2({
					ajax: {
						action: 'GET',
						dataType: 'json',
						url: site_url + "tlhp/restlhp/codrekomendasi",
						success: function() {
							console.info('success');
						}, 
						processResults: function(data, params) {
							var rData = [];
							for (var i=0; i<data.data.length; i++) {
								var item = {
									id: data.data[i].kode_rekomendasi_id,
									text: data.data[i].kode_rekomendasi+'. '+data.data[i].uraian_rekomendasi
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
				});
			}
		}
	
	$(function(){
		ko.applyBindings(vm);
		vm.init();
	});
	
});