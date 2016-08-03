define(["jquery", "knockout", "bootstrap","select2"], function($, ko){
	function RekomendasiViewModel(isFirstRow) {
		var selfR = this;
		
		selfR.isFirstRow = ko.observable(isFirstRow);
		selfR.data = {
			rekomendasiId: ko.observable(),
			kertasKerjaId: ko.observable(),
			kodeRekomendasiId: ko.observable(),
			uraianRekomendasi: ko.observable(),
			kerugianNegara: ko.observable(),
			nilaiRekomendasi: ko.observable(),
		}
	}
	
	function KertasKerjaTemuanViewModel(isFirstRow) {
		var selfK = this;
		
		selfK.isFirstRow = ko.observable(isFirstRow);
//		console.debug(selfK.isFirstRow());
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
			
			rekomendasi: ko.observableArray([])
		}
		
		selfK.addRow = function() {
			console.info('add rekomendasi')
			selfK.data.rekomendasi.push(new RekomendasiViewModel(false));
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
			kertasKerjaTemuan: ko.observableArray([new KertasKerjaTemuanViewModel(true)])
		}
		
		selfJ.addRow = function() {
			var kkt = new KertasKerjaTemuanViewModel(false);
			kkt.data.jenisTemuan(selfJ.data.kodeTemuan());
			
			selfJ.data.kertasKerjaTemuan.push(kkt);
		}
		
		selfJ.removeRow = function(vModel) {
			selfJ.data.kertasKerjaTemuan.remove(vModel);
		}
	}
	
	function MainViewModel() {
		var self = this;
		
		self.jenisTemuan = ko.observableArray([]);
		
		self.init = function() {
			self.jenisTemuan.push(new JenisTemuanViewModel('A', 'SISTEM PENGENDALIAN INTERNAL'));
			self.jenisTemuan.push(new JenisTemuanViewModel('B', 'KEPATUHAN TERHADAP PERATURAN DAN PERUNDANG-UNDANGAN'));
			self.jenisTemuan.push(new JenisTemuanViewModel('C', 'LAPORAN KEUANGAN'));
		}
		
	}
	
	var vm = new MainViewModel();
	
	(function(){
		ko.applyBindings(vm);
		vm.init();
		
		$(document).on("click",".add-temuan",function(event){
			event.preventDefault();
			console.log('Tambah Temuan');
			var jenis 				 = $(this).attr("jenis");
			var kode_temuan  	 	 = $('#kode_temuan-'+jenis+' > option').clone();
			var kode_sebab_id	  	 = $('#kode_sebab_id-'+jenis+' > option').clone();
			var kerugian_negara   	 = $('#kerugian_negara-'+jenis+' > option').clone();
			var kode_rekomendasi_id  = $('#kode_rekomendasi_id-'+jenis+' > option').clone();
			var uker			  	 = $('#uker-'+jenis+' > option').clone();
			var nomor 			  	 = parseInt($("#nomor_temuan_"+jenis+"").val())+1;
	        var html 			  = "<tr class='append"+jenis+nomor+" temuan-"+jenis+nomor+"'>";
			html 				 +="<td>"+nomor+"<button class='batal' type='button' nomor='nomor_temuan_"+jenis+"' tr='temuan-"+jenis+nomor+"'> x</button></td>";
			html 				 +="<td><select  class='form-control' id='kode_temuan-"+jenis+nomor+"'  name='kode_temuan_id-"+jenis+nomor+"'></select></td>";
			html 				 +='<td><input type="text" class="form-control border-input uraian_temuan" name="uraian_temuan-'+jenis+nomor+'" /></td>';
		    html 				 +="<td><select  class='form-control kode_sebab_id' id='kode_sebab_id-"+jenis+nomor+"'  name='kode_sebab_id-"+jenis+nomor+"'></select></td>";
		    html 				 +='<td><input type="text" class="form-control border-input" name="uraian_sebab-'+jenis+nomor+'" /></td>';
		    html 				 +='<td><input type="text" class="form-control border-input" name="nilai_temuan-'+jenis+nomor+'" /></td>';
		    html 				 +='<td> 1 <input type="hidden" value="1" id="jumlah_rekomen_'+jenis+nomor+'" name="jumlah_rekomen-'+jenis+nomor+'">  <input type="hidden" value="1" id="nomor_rekomen_'+jenis+nomor+'" name="nomor_rekomen-'+jenis+nomor+'"><button class="add-rekomen" jenis="'+jenis+'" type="button" nomor="'+nomor+'">+</button></td>';
		    html 				 +="<td><select  class='form-control kode_rekomendasi_id' id='kode_rekomendasi_id-"+jenis+nomor+"'  name='kode_rekomendasi_id-"+jenis+nomor+"1'></select></td>";
		    html 				 +='<td><input type="text" class="form-control border-input" name="uraian_rekomendasi-'+jenis+nomor+'1" /></td>';
		    html 				 +="<td><select  class='form-control ' id='kerugian_negara-"+jenis+nomor+"'  name='kerugian_negara-"+jenis+nomor+"1'></select></td>";
		    html 				 +='<td><input type="text" class="form-control border-input " name="nilai_rekomendasi-'+jenis+nomor+'1" /></td>';
		    html 				 +="<td><select  class='form-control ' id='nama_ppk-"+jenis+nomor+"'  name='nama_ppk-"+jenis+nomor+"1'></select></td>";
			html 				 +="<td></td>";
			html 				 +="<td></td>";
			html 				 +="<td></td>";
			html 				 +="<td></td>";
			html 				 +="<td></td>";
			html 				 +="<td></td>";
			html 				 +="<td></td>";
			html 				 +="<td></td>";
			html 				 +="<td></td>";
			html 				 +="<td></td>";
			html 			     += "</tr>";
		    nomor   = nomor-1;
		   
		   $('.append'+jenis+nomor+':last').after(html);
		   nomor   = nomor+1;
		   $('#kode_temuan-'+jenis+nomor).append(kode_temuan);
		   $('#kode_sebab_id-'+jenis+nomor).append(kode_sebab_id);
		   $('#kode_rekomendasi_id-'+jenis+nomor).append(kode_rekomendasi_id);
		   $('#kerugian_negara-'+jenis+nomor).append(kerugian_negara);
		   $('#nama_ppk-'+jenis+nomor).append(uker);
		  $("#nomor_temuan_"+jenis+"").val(nomor)
		  $("#jumlah_temuan_"+jenis+"").val(nomor)
		});
		
		// Add Rekomen A
		 $(document).on("click",".add-rekomen",function(event){
			event.preventDefault();
			console.log('Tambah Rekomen');
			var jenis 				 = $(this).attr("jenis");
			var nomortemuan				 = $(this).attr("nomor");
			var kode_temuan  	 	 = $('#kode_temuan-'+jenis+' > option').clone();
			var kode_sebab_id	  	 = $('#kode_sebab_id-'+jenis+' > option').clone();
			var kerugian_negara   	 = $('#kerugian_negara-'+jenis+' > option').clone();
			var kode_rekomendasi_id  = $('#kode_rekomendasi_id-'+jenis+' > option').clone();
			var uker			  	 = $('#uker-'+jenis+' > option').clone();
			var nomor  	  		  	 = parseInt($("#nomor_rekomen_"+jenis+nomortemuan+"").val())+1;
	        var html 			  	 = "<tr class='append"+jenis+nomortemuan+" temuan-"+jenis+nomortemuan+" rekomen"+jenis+nomor+nomortemuan+"' >";
			html 				 +="<td colspan='6'></td>";
			html 				 +='<td>'+nomor+'<button class="batal" type="button" nomor="nomor_rekomen_'+jenis+nomortemuan+'" tr="rekomen'+jenis+nomor+nomortemuan+'">x</button></td>';
		    html 				 +="<td><select  class='form-control ' id='kode_rekomendasi_id-"+jenis+nomortemuan+nomor+"'  name='kode_rekomendasi_id-"+jenis+nomortemuan+nomor+"'></select></td>";
		    html 				 +='<td><input type="text" class="form-control border-input" name="uraian_rekomendasi-'+jenis+nomortemuan+nomor+'" /></td>';
		    html 				 +="<td><select  class='form-control ' id='kerugian_negara-"+jenis+nomortemuan+nomor+"'  name='kerugian_negara-"+jenis+nomortemuan+nomor+"'></select></td>";
		    html 				 +='<td><input type="text" class="form-control border-input " name="nilai_rekomendasi-'+jenis+nomortemuan+nomor+'" /></td>';
		    html 				 +="<td><select  class='form-control ' id='nama_ppk-"+jenis+nomortemuan+nomor+"'  name='nama_ppk-"+jenis+nomortemuan+nomor+"'></select></td>";
			html 				 +="<td></td>";
			html 				 +="<td></td>";
			html 				 +="<td></td>";
			html 				 +="<td></td>";
			html 				 +="<td></td>";
			html 				 +="<td></td>";
			html 				 +="<td></td>";
			html 				 +="<td></td>";
			html 				 +="<td></td>";
			html 				 +="<td></td>";
			html 			     += "</tr>";
			
		    $('.append'+jenis+nomortemuan+':last').after(html);
		   $('#kode_rekomendasi_id-'+jenis+nomortemuan+nomor).append(kode_rekomendasi_id);
		   $('#kerugian_negara-'+jenis+nomortemuan+nomor).append(kerugian_negara);
		   $('#nama_ppk-'+jenis+nomortemuan+nomor).append(uker);
		  $("#nomor_rekomen_"+jenis+nomortemuan+"").val(nomor)
		  $("#jumlah_rekomen_"+jenis+nomortemuan+"").val(nomor)
		});
		
		// Batal kan Temuan dan rekomen
		$(document).on("click",".batal",function(event){
			event.preventDefault();
			console.log('Batal Jenis');
			var tr    = $(this).attr("tr");
			var nomor = $(this).attr("nomor");
			
			$("#"+nomor).val(parseInt($("#"+nomor).val())-1);
			$("."+tr).remove();
			
		});
		
		  $(document).ready(function() {
			  $(".select-simple").select2();
			});
		
		$(document).on('click', '#kklhp', function(event) {
			$("#kklhp-form").submit();
		});
		
		$('.user-modal').on('click', function(e){
	        $('#lhpModal').modal('show');
	        return false;
	    });
		
	})();
});