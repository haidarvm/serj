<div class="container" style="padding:10px;">
    <span class="btn btn-success fileinput-button">
        <i class="glyphicon glyphicon-plus"></i>
        <span>Select files...</span>
        <input id="fileupload" type="file" name="files[]" multiple>
    </span>
    <br>
    <div id="progress" class="progress" style="margin-top: 10px;">
        <div class="progress-bar progress-bar-success"></div>
    </div>
    <div id="files" class="files"></div>
    <br>
</div>
<script src="<?=base_url()?>assets/js/jquery-2.1.4.min.js"></script>
<script src="<?=base_url()?>assets/js/jquery.ui.widget.js"></script>
<script src="<?=base_url()?>assets/js/jquery.iframe-transport.js"></script>
<script src="<?=base_url()?>assets/js/jquery.fileupload.js"></script>
<script src="<?=base_url()?>assets/js/bootstrap.min.js"></script>
<script>
$(function () {
    'use strict';
    var url = window.location.hostname === 'blueimp.github.io' ?
                '//jquery-file-upload.appspot.com/' : '../inc/multiupload/server/php/';
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
</script>