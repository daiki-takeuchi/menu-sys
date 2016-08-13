$(function () {
    $(document).on('change','input.csv_file', function () {
        $('#file_error').html('');
        var file = $(this)[0].files[0];

        if (file.type == 'text/csv' || file.type == 'text/comma-separated-values' ) {
            $('.txt_user_csv').val($(this).val().replace("C:\\fakepath\\", ""));
        } else {
            var error = $('<span class="text-danger"/>').text('CSVファイルのみアップロード可能です。');
            $('<p/>').append(error).appendTo('#file_error');
            $('input.csv_file').replaceWith($('input.csv_file').clone());
        }
    });

    $('.user_csv_group').click(function() {
        $('input.csv_file').click();
    });

    $('.btn-batch-register').click(function () {
        $('#file_error').html('');
        var file = $('.csv_file')[0].files[0];
        if(file == null) {
            var error = $('<span class="text-danger"/>').text('ファイルが選択されていません。');
            $('<p/>').append(error).appendTo('#file_error');
        } else {
            BootstrapDialog.confirm({
                title: '一括登録の確認',
                message: '一括登録してよろしいですか？',
                closable: true,
                draggable: true,
                btnCancelLabel: 'キャンセル',
                btnOKLabel: '一括登録する',
                callback: function(result) {
                    if(result) {
                        // アップロード処理＆データ取り込み
                        var button = $(this);
                        button.prop('disabled', true);
                        MessageBox.show('一括登録しました。', function () {
                            location.reload();
                        });
                    }
                }
            });
        }
    });

    $('.btn-pw-reset').click(function () {
        var $cur_tr = $(this).closest('tr');
        BootstrapDialog.confirm({
            title: 'パスワードリセットの確認',
            message: $cur_tr.children('td:eq(0)').text() + 'さん のパスワードをリセットしてよろしいですか？',
            type: BootstrapDialog.TYPE_WARNING,
            closable: true,
            draggable: true,
            btnCancelLabel: 'キャンセル',
            btnOKLabel: 'リセットする',
            btnOKClass: 'btn-warning',
            callback: function(result) {
                if(result) {
                    // リセット処理
                    var button = $(this);
                    button.prop('disabled', true);
                    MessageBox.show('パスワードをリセットしました。');
                }
            }
        });
    });

    $('#company').change(function () {
        var company_cc = $('#company option:selected').val();
        var company_nm = $('#company option:selected').text();

        $.ajax({
            type: 'POST',
            url: base_url + 'user/organization',
            data: {company_cc : company_cc},
            dataType: 'json',
            success: function(data, dataType) {
                var $select = $('#organization');
                $select.html('');
                $select.prop('disabled', false);
                $optionGroup = $('<optgroup>').attr('label',company_nm);
                $select.append($optionGroup);
                $.each(data, function(key, item) {
                    $option = $('<option>').val(item.soshiki_cc).text(item.soshiki_nm);
                    $optionGroup.append($option);
                });
                $select.selectpicker('refresh');
            },
            error: function(XMLHttpRequest, textStatus, errorThrown){MessageBox.show(errorThrown.message);}
        });
    });

    $('#organization').change(function () {
        $('#soshiki_nm').val($('#organization option:selected').text());
    });

    if($('#organization option:selected').val() === undefined) {
        $('#organization').prop('disabled', true);
    }

    $('.btn-save-user').click(function () {
        $('#save_btn').val('save-user');
        $('#form').submit();
    });

    $('.btn-save-user-more').click(function () {
        $('#save_btn').val('save-user-more');
        $('#form').submit();
    });

    $('.btn-user-delete').click(function () {
        var userId = this.id;
        BootstrapDialog.confirm({
            title: '削除の確認',
            message: '削除してよろしいですか？',
            type: BootstrapDialog.TYPE_WARNING,
            closable: true,
            draggable: true,
            btnCancelLabel: 'キャンセル',
            btnOKLabel: '削除する',
            btnOKClass: 'btn-warning',
            callback: function(result) {
                if(result) {
                    window.location.href = base_url + 'user/delete/' + userId;
                }
            }
        });
    });
});
