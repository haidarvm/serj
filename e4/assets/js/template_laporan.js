   define(["jquery", "bootstrap","summernote", "moment", "ui.widget", "iframe.transport", "fileupload"], function($){
   	$(function(){
   		$('#summernote').summernote();
   	});
   	
   	$(function(){
   		$('#summernote2').summernote();
   	});
   	
   	$(function () {
   	    'use strict';
   	    var url = window.location.hostname === 'blueimp.github.io' ?
   	                '//jquery-file-upload.appspot.com/' : '../../inc/multiupload/server/php/';
   	    $('#fileupload').fileupload({
   	        url: url,
   	        dataType: 'json',
   	        done: function (e, data) {
   	            $.each(data.result.files, function (index, file) {
   	                $('<input type="text" name="img_result[]"/>').val(file.name).appendTo('#files');
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