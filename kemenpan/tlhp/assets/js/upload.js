var venues_id = $('#venues_id').val();
var image_id = $('#image_id').val();
var url_upload = site_url + "upload/do_upload_venues/" + venues_id + "/" + image_id;
console.log('top log =' + url_upload);

$(function() {
			$('#insert-venues').click(
					function() {
						$('#quick-venues-box').block({
							message : '<h1>Processing</h1>',
							css : {
								border : 'none',
								padding : '15px',
								backgroundColor : '#000',
								'-webkit-border-radius' : '10px',
								'-moz-border-radius' : '10px',
								opacity : .5,
								color : '#fff'
							}
						});
						var venues_data = $('#quick-venues').serializeArray();
						$.ajax({
							method : "POST",
							url : site_url + "admin/venues/insert_quick_venues",
							data : venues_data
						// On Done Insert New venues
						}).done(
								function(msg) {
									$(':input', '#quick-venues-box').not(
											':button, :submit, :reset').val('')
											.removeAttr('checked').removeAttr(
													'selected');
									console.log("venues Created: " + msg);
									console.log("venues Draft Created: " + msg);
									var data = JSON.parse(msg);
									console.log('venues_id' + data.venues_id);
									$('#venues_id').val(data.venues_id);
									$('#image_id').val(data.image_id);
									venues_id = data.venues_id;
									image_id = data.image_id;
									url_upload = site_url + "upload/do_upload_venues/" + data.venues_id + "/" + data.image_id;
									console.log('after insert=' + url_upload);
									changeUrl(data.venues_id, data.image_id);
									$('#quick-venues-box').block({
										message : '<h2>Successfully Created </h2>' +
										// '<p>' + msg + '</p>' +
										'You can Create New one',
										css : {
											border : 'none',
											padding : '15px',
											backgroundColor : '#000',
											'-webkit-border-radius' : '10px',
											'-moz-border-radius' : '10px',
											opacity : .5,
											color : '#fff'
										}
									});
									setInterval(function() {
										$('#quick-venues-box').unblock();
									}, 1500);
									$('#files').empty();
									$(".progress-bar").css("width", "0%");
									window.location = window.location.pathname + '?venues_id=' + venues_id + '&image_id=' + image_id
								}).always(function() {
							// $('#files').remove();
							// $('#description').editor.clear();
							// $("input[name='_wysihtml5_mode']").val('');
							// $('#description').data("wysihtml5").editor.clear();
						});

					});
				
				$('#btn-login').click( function() {
					console.log('login');
					window.location = site_url + 'user/register';
				});
				
				$('.btn-admin-add').click( function() {
					var action = $('.btn-admin-add').data('action');
					console.log(action);
					window.location = site_url + 'admin/' + action + '/insert';
				});
				
				$('.btn-checkout').click( function() {
					console.log('checkout');
					$('#update-all').submit();
					//window.location = site_url + 'cart/checkout';
				});
				
//				$('.btn-admin').click( function() {
//					var actions = $('.btn-admin').data('action');
//					console.log(actions);
//					window.location = site_url + 'admin/' + action + '/insert';
//				});
				
				// last click img id
				var last_clicke_img_id = null;
				$('.delete-venue-img').click(function () {
					last_clicke_img_id = $(this).data("id");
				});
				
				// delete venue img
				$(".delete-venue-img").confirm({
					text: "Are you sure you want to delete this venue image?",
					confirm: function(button) {
						image_id = last_clicke_img_id;
						$.ajax({
							method : "POST",
							url : site_url + "admin/venue/delete_img/",
							data : {  img_id: image_id }
						}).done(
								function(msg) {
									$('#img-'+image_id).remove();
									console.log(msg);
								}
						);
								
				    },
				});
				
				var last_clicke_img_id = null;
				$('.default-img').click(function () {
					last_clicke_img_id = $(this).data("id");
				});
				
				$(".default-img").confirm({
					text: "Are you sure you want to set this atlet image default?",
					confirm: function(button) {
						image_id = last_clicke_img_id;
						$.ajax({
							method : "POST",
							url : site_url + "admin/venue/default_img/",
							data : {  img_id: image_id, atlet_id: atlet_id }
						}).done(
								function(msg) {
									console.log(msg);
								}
						);
								
				    },
				});
				
				$('#update-venues').click(
					function() {
						$('#quick-getVenueDraft-box').block({
							message : '<h1>Processing</h1>',
							css : {
								border : 'none',
								padding : '15px',
								backgroundColor : '#000',
								'-webkit-border-radius' : '10px',
								'-moz-border-radius' : '10px',
								opacity : .5,
								color : '#fff'
							}
						});
						var venues_data = $('#quick-venues').serializeArray();
						$.ajax({
							method : "POST",
							url : site_url + "admin/venues/update",
							data : venues_data
						// On Done Insert New venues
						}).done(
								function(msg) {
									$(':input', '#quick-venues-box').not(
											':button, :submit, :reset').val('')
											.removeAttr('checked').removeAttr(
													'selected');
									console.log("venues Created: " + msg);
									console.log("venues Draft Created: " + msg);
									var data = JSON.parse(msg);
									console.log('venues_id' + data.venues_id);
									$('#venues_id').val(data.venues_id);
									$('#image_id').val(data.image_id);
									venues_id = data.venues_id;
									image_id = data.image_id;
									url_upload = site_url + "upload/do_upload_venues/" + data.venues_id + "/" + data.image_id;
									console.log('after insert=' + url_upload);
									changeUrl(data.venues_id, data.image_id);
									$('#quick-venues-box').block({
										message : '<h2>Successfully Created </h2>' +
										// '<p>' + msg + '</p>' +
										'You can Create New one',
										css : {
											border : 'none',
											padding : '15px',
											backgroundColor : '#000',
											'-webkit-border-radius' : '10px',
											'-moz-border-radius' : '10px',
											opacity : .5,
											color : '#fff'
										}
									});
									setInterval(function() {
										$('#quick-venues-box').unblock();
									}, 1500);
									$('#files').empty();
									$(".progress-bar").css("width", "0%");
									window.location.href = site_url + "admin/venues/";
									//window.location = window.location.pathname + '?venues_id=' + venues_id + '&image_id=' + image_id
								}).always(function() {
							// $('#files').remove();
							// $('#description').editor.clear();
							// $("input[name='_wysihtml5_mode']").val('');
							// $('#description').data("wysihtml5").editor.clear();
						});

					});
				$.fn.digits = function() {
					return this.each(function() {
						$(this).text(
								$(this).text().replace(
										/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
					})
				};
				$('.number').keyup(function() {
					this.value = this.value.replace(/[^0-9\.]/g, '');
					// console.log(this.value.replace(/[^0-9\.]/g,''));
				});
				// $(".number").digits();
				$('.numbers').priceFormat({
					prefix : '',
					thousandsSeparator : ',',
					centsLimit : 0
				});
				
				var last_clicke_img_id = null;
				$('.delete-prod-img').click(function () {
					last_clicke_img_id = $(this).data("id");
				});
				
				$(".delete-prod-img").confirm({
					text: "Are you sure you want to delete this venues image?",
					confirm: function(button) {
						image_id = last_clicke_img_id;
						$.ajax({
							method : "POST",
							url : site_url + "admin/venues/delete_img/",
							data : {  img_id: image_id }
						}).done(
								function(msg) {
									console.log(msg);
								}
						);
								
				    },
					
				});
				
				
				$('#select-cat').change( function() {
				      location.href = $(this).val();
				   });

});

$('#fileupload')
		.fileupload(
				{
					url : site_url + "upload/do_upload/" + venues_id + "/" + image_id,
					dataType : 'json',
					acceptFileTypes : /(\.|\/)(gif|jpe?g|png)$/i,
					maxFileSize : 999000,
					// Enable image resizing, except for Android and Opera,
					// which actually support image resizing, but fail to
					// send Blob objects via XHR requests:
					disableImageResize : /Android(?!.*Chrome)|Opera/
							.test(window.navigator.userAgent),
					previewMaxWidth : 200,
					previewMaxHeight : 200,
					previewCrop : true
				})
		.on('fileuploadadd', function(e, data) {
			data.context = $('<div/>').appendTo('#files');
			$.each(data.files, function(index, file) {
				var node = $('<p/>').append($('<span/>').text(file.name));
				if (!index) {
					node.append('<br>');
				}
				node.appendTo(data.context);
			});
		})
		.on(
				'fileuploadprocessalways',
				function(e, data) {
					var index = data.index, file = data.files[index], node = $(data.context
							.children()[index]);
					if (file.preview) {
						node.prepend('<br>').prepend(file.preview);
					}
					if (file.error) {
						node.append('<br>').append(
								$('<span class="text-danger"/>').text(
										file.error));
					}
					if (index + 1 === data.files.length) {
						data.context.find('button').text('Upload').prop(
								'disabled', !!data.files.error);
					}
				}).on('fileuploadprogressall', function(e, data) {
			var progress = parseInt(data.loaded / data.total * 100, 10);
			$('#progress .progress-bar').css('width', progress + '%');
		}).on(
				'fileuploaddone',
				function(e, data) {
					$.each(data.result.files, function(index, file) {
						if (file.url_upload) {
							var link = $('<a>').attr('target', '_blank').prop(
									'href', file.url_upload);
							$(data.context.children()[index]).wrap(link);
						} else if (file.error) {
							var error = $('<span class="text-danger"/>').text(
									file.error);
							$(data.context.children()[index]).append('<br>')
									.append(error);
						}
					});
				}).on(
				'fileuploadfail',
				function(e, data) {
					$.each(data.files, function(index) {
						var error = $('<span class="text-danger"/>').text(
								'File upload failed.');
						$(data.context.children()[index]).append('<br>')
								.append(error);
					});
				}).prop('disabled', !$.support.fileInput).parent().addClass(
				$.support.fileInput ? undefined : 'disabled');

