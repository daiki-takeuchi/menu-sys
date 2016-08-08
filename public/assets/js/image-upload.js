$(function () {
    'use strict';

    var url = base_url + 'page/file_upload';
    $('#fileupload').fileupload({
        url: url,
        dataType: 'json',
        add: function(e, data) {
            $('#files').html('');
            $('#progress').removeClass('hidden');
            var uploadErrors = [];
            var acceptFileTypes = /^image\/(gif|jpe?g|png)$/i;
            if(data.originalFiles[0]['type'].length && !acceptFileTypes.test(data.originalFiles[0]['type'])) {
                uploadErrors.push('画像ファイルのみアップロード可能です。');
            }
            if(uploadErrors.length > 0) {
                var error = $('<span class="text-danger"/>').text(uploadErrors);
                $('<p/>').append(error).appendTo('#files');
                $('#progress').addClass('hidden');
            } else {
                data.submit();
            }
        },
        done: function (e, data) {
            $.each(data.result.files, function (index, file) {
                $('#progress').addClass('hidden');
                $('#progress .progress-bar').css('width', '0%').addClass('hidden');
                if (file.url) {
                    $('#img-menu').removeAttr('data-src')
                        .removeAttr('data-holder-rendered')
                        .removeAttr('style')
                        .attr('src',file.url);
                } else if (file.error) {
                    var error = $('<span class="text-danger"/>').text(file.error);
                    $('<p/>').append(error).appendTo('#files');
                }
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
