$(function () {
    'use strict';

    var url = '/page/file_upload';
    $('#fileupload').fileupload({
        url: url,
        dataType: 'json',
        done: function (e, data) {
            $.each(data.result.files, function (index, file) {
                $('#progress').addClass('hidden');
                $('#progress .progress-bar').css('width', '0%').addClass('hidden');
                $('#files').html('');
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
            $('#progress').removeClass('hidden');
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress .progress-bar').css(
                'width',
                progress + '%'
            );
        }
    }).prop('disabled', !$.support.fileInput)
        .parent().addClass($.support.fileInput ? undefined : 'disabled');
});
