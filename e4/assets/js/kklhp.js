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
	}
	
	function KertasKerjaTemuanViewModel(urutan, isFirstRow) {
		var selfK = this;
		
		selfK.isFirstRow = ko.observable(isFirstRow);
		selfK.urutan = ko.observable(urutan);
		
		selfK.data = {
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
						'lhp_id': 18
					}, 
					'kertasKerjaTemuan': kktList
				}
			console.debug(kklhpData);
			self.postKklhp('POST', kklhpData);
		} // end do insert
		
		self.postKklhp = function(actionType, postData) {
			$.ajax({
				type: 'POST',
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
//					refreshManusTable();
					if (actionType == "POST") {
						
//						self.resetData();
//						$("#notify").notify("Data telah disimpan", "alert alert-info");
					} else {
//						$('#userModal').modal('hide');
					}
				},
				error: function(xhr, msg) {
//					self.userNotif("Internal Server Error");
//					$("#notify").notify("Internal Server Error", "alert alert-error");
					alert("Internal Server Error..");
				}
			}).always(function(){
				$('#btnSave').removeAttr('disabled');
			});
		}
	}
	
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
				}
			});
		}
	}
	
	ko.bindingHandlers.kodeSebab = {
		init: function(element, valueAccessor, allBindings) {
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