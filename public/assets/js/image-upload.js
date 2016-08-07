$(function () {
    'use strict';

    var url = '//jquery-file-upload.appspot.com/';
    $('#fileupload').fileupload({
        url: url,
        dataType: 'json',
        done: function (e, data) {
            $.each(data.result.files, function (index, file) {
                if (file.url) {
                    $('#ima-menu').attr('data-src','');
                    $('#img-menu').attr('src',file.url);
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
