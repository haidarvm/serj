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
			kerugianNegara: ko.observable(),
			kerugianNegaraCbk: ko.observable(false),
			nilaiRekomendasi: ko.observable(),
		}
		
		selfR.data.kerugianNegaraCbk.subscribe(function(newVal){
			if (newVal == true) {
				selfR.data.kerugianNegaraCbk(true);
			} else {
				selfR.data.kerugianNegaraCbk(false);
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
			var insertToServer = [];
			var errorList = [];
			for (var i=0; i<self.jenisTemuan().length; i++) {
				var jenisTemuan = {
					kodeTemuan: self.jenisTemuan()[i].data.kodeTemuan(),
					jenisTemuan: self.jenisTemuan()[i].data.jenisTemuan(),
				}
				var kertasKerjaTemuanList = self.jenisTemuan()[i].data.kertasKerjaTemuan();
				_.each(kertasKerjaTemuanList, function(kertasKerjaTemuan){
					delete kertasKerjaTemuan.data.rekomendasi;
					var itemKkt = {
						jenis_temuan: jenisTemuan,
						no_temuan: '',
						kode_temuan_id: kertasKerjaTemuan.data.kodeTemuanId(),
						uraian_temuan: kertasKerjaTemuan.data.uraianTemuan(),
						kode_sebab_id: kertasKerjaTemuan.data.kodeSebabId(),
						uraian_sebab: kertasKerjaTemuan.data.uraianSebab(),
						nilai_temuan: kertasKerjaTemuan.data.nilaiTemuan(),
						rekomendasi: [{
							kode_rekomendasi_id: kertasKerjaTemuan.data.firstKodeRekomendasiId(),
							uraian_rekomendasi: kertasKerjaTemuan.data.firstUraianRekomendasi(),
							kerugian_negara: kertasKerjaTemuan.data.firstFirstKergianNegara(),
							nilai_rekomendasi: kertasKerjaTemuan.data.firstNilaiRekomendasi(),
						}]
					}
					if (itemKkt.kode_temuan_id !== undefined &&
						itemKkt.uraian_temuan !== undefined &&
						itemKkt.kode_sebab_id !== undefined &&
						itemKkt.uraian_sebab !== undefined &&
						itemKkt.nilai_temuan !== undefined) {
						insertToServer.push(itemKkt);
					}
				});
			}
			
			console.debug(insertToServer);
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
								text: data.data[i].kode_temuan
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
								text: data.data[i].uraian_sebab
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
									text: data.data[i].uraian_rekomendasi
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