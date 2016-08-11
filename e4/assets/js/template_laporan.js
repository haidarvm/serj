   define(["jquery", "bootstrap","summernote", "moment", "ui.widget", "iframe.transport", "fileupload"], function($){
   	$(function(){
   		$('#summernote').summernote();
   	});
   	
   	$(function(){
   		$('#summernote2').summernote();
   	});
   	
   	$(function () {
   	    'use strict';
   	    var url = site_url+'assets/inc/multiupload/server/php/';
   	    $('#fileupload').fileupload({
   	        url: url,
   	        dataType: 'json',
   	        done: function (e, data) {
   	            $.each(data.result.files, function (index, file) {
   	            	
   	            	var name =  file.name;
   	            	var type =  file.type;
   	            	var size =  file.size;
   	            	var url =  file.url;
   	            	var dir =  url.replace(site_url, "");
   	            	
   	            	$.ajax({
	   	         		type : "GET",
	   	         		url : site_url+'tlhp/template/upload_media_proccess',
	   	         		data: 'file_name='+name+'&ext='+type+'&size='+size+'&url='+url+'&path='+dir,
	   	         		success : function(id) {
	   	         			//console.log(data.result.files);
	   	         			$('<input type="text" name="file_id[]"/>').val(id).appendTo('#files');
	   	         		}
	   	         	});
   	            });
   	        },
   	        progressall: function (e, data) {
   	            var progress = parseInt(data.loaded / data.total * 100, 10);
   	            $('#progress .progress-bar').css(
   	                'width',
   	                progress + '%'
   	            );
   	        }
   	    }).prop('disabled', !$.support.fileInput)
   	        .parent().addClass($.support.fileInput ? undefined : 'disabled');
   	});
   	
   	
});
   
   
   