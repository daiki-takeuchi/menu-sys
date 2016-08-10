$(function () {
    $('.excel-download').click(function() {
        BootstrapDialog.show({
            title: "帳票ダウンロード",
            message: $('<div></div>').load('excel_download', function () {
                $(".selectpicker").selectpicker({
                    "selectedText": "cat"
                });
                $('.input-group.date').datepicker({
                    weekStart: 1,
                    format: "yyyy/mm/dd",
                    language: "ja",
                    autoclose: true,
                    todayHighlight: true
                });
            }),
            buttons: [{
                id: 'btn-download',
                label: 'ダウンロード',
                cssClass: 'btn-success',
                action: function(dialog) {
                    var $button = this; // 'this' here is a jQuery object that wrapping the <button> DOM element.
                    $button.disable();
                    $button.spin();
//                    dialog.setClosable(false);
                }
            }],
            draggable: true
        });
    });

    $('.select-favorite-menu').click(function() {
        BootstrapDialog.show({
            title: "よく使うメニューから選ぶ",
            message: $('<div></div>').load('favorite_menu_list'),
            buttons: [{
                id: 'btn-set',
                label: '設定',
                cssClass: 'btn-success',
                action: function(dialog) {
                    var $button = this; // 'this' here is a jQuery object that wrapping the <button> DOM element.
                    dialog.close();
                }
            }],
            draggable: true
        });
    });

    $('.register-favorite-menu').click(function() {
        // ajaxで登録処理を実装
        var button = $(this);
        button.prop('disabled', true);
        MessageBox.show('よく使うメニューとして登録しました。', function () {
            button.prop('disabled', false);
        });
    });

    $.ajax({
        url: base_url + 'menu/tag',
        dataType: 'json',
        success: function(data) {
            $('.tag-input').tagit({
                removeConfirmation: true,
                availableTags: data
            });
        }
    });

    // モーダル画面から実行（ajaxでページ読み込みされるため.click等でのイベント登録不可）
    $(document).on('click','.fav-menu-delete', function () {
        var record = $(this).parent().parent();
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
                    record.remove();
                    var table = $('#id-tbl-fav-menu tbody');
                    if(table.children().length == 0) {
                        table.append('<tr><td colspan="2">表示するデータがありません。</td></tr>');
                    }
                }
            }
        });
    });
    
    $(document).on('change','.form_list', function () {
        var selected = $('.form_list option:selected').val();
        if(selected == '1') {
            $('.area-target-year-month').addClass('hidden');
            $('.area-target-date').removeClass('hidden');
        } else {
            $('.area-target-year-month').removeClass('hidden');
            $('.area-target-date').addClass('hidden');
        }
    });
});