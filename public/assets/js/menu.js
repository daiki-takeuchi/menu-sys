$(function () {
    $('.target-category').change(function () {
        var selected_date = $(this).attr('data-selected-date');
        var page = ($(this).attr('data-page') == 'index')? 'menu' : 'menu/list';
        var kubun = $(this).val();

        window.location.href = base_url +  page + '/' + kubun + '/' + selected_date;
    });

    $('.excel-download').click(function() {
        BootstrapDialog.show({
            title: "帳票ダウンロード",
            message: $('<div></div>').load('excel_download', function (response, status, xhr) {
                // 画面描写より早くに動いちゃうときがあるので、0.1秒後に実行
                setTimeout( function() {
                    $(".selectpicker").selectpicker({
                        "selectedText": "cat"
                    });
                    $('.date-all').datepicker({
                        weekStart: 1,
                        format: "yyyy/mm/dd",
                        endDate: download_date,
                        language: "ja",
                        autoclose: true,
                        todayHighlight: true
                    });
                }, 100 )
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

    $('.btn-save-menu').click(function () {
        $('#form').submit();
    });

    $('.btn-menu-delete').click(function () {
        var menuId = this.id;
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
                    window.location.href = base_url + 'menu/delete/' + menuId;
                }
            }
        });
    });

    $('.btn-decrease').on('click', function () {
        var input = $(this).parent().parent().find('input');
        if(input.val() > 0) {
            input.val(parseInt(input.val(), 10) - 1);
        } else {
            MessageBox.show('マイナスにはできません。');
        }
    });

    $('.btn-increase').on('click', function () {
        var input = $(this).parent().parent().find('input');
        input.val(parseInt(input.val(), 10) + 1);
    });

    $('.btn-with-rice button:first-of-type').on('click', function () {
        var $price_elem = $(this).parent().parent().parent().find('.price');
        var $price_with_rice_elem = $(this).parent().parent().parent().find('.price-with-rice');
        if($(this).hasClass('btn-default')) {
            $(this).parent().find('button:last-of-type').addClass('btn-default');
            $(this).parent().find('button:last-of-type').removeClass('btn-info');
            $(this).addClass('btn-info');
            $(this).removeClass('btn-default');
            $price_with_rice_elem.delay(200).fadeOut(300,function () {
                $price_with_rice_elem.addClass('hidden');
            });
            $price_elem.delay(200).fadeIn(300,function () {
                $price_elem.removeClass('hidden');
            });
        } else {
            $(this).parent().find('button:last-of-type').addClass('btn-info');
            $(this).parent().find('button:last-of-type').removeClass('btn-default');
            $(this).addClass('btn-default');
            $(this).removeClass('btn-info');
            $price_elem.delay(200).fadeOut(300,function () {
                $price_elem.addClass('hidden');
            });
            $price_with_rice_elem.delay(200).fadeIn(300,function () {
                $price_with_rice_elem.removeClass('hidden');
            });
        }
    });

    $('.btn-with-rice button:last-of-type').on('click', function () {
        var $price_elem = $(this).parent().parent().parent().find('.price');
        var $price_with_rice_elem = $(this).parent().parent().parent().find('.price-with-rice');
        if($(this).hasClass('btn-default')) {
            $(this).parent().find('button:first-of-type').addClass('btn-default');
            $(this).parent().find('button:first-of-type').removeClass('btn-info');
            $(this).addClass('btn-info');
            $(this).removeClass('btn-default');
            $price_elem.delay(200).fadeOut(300,function () {
                $price_elem.addClass('hidden');
            });
            $price_with_rice_elem.delay(200).fadeIn(300,function () {
                $price_with_rice_elem.removeClass('hidden');
            });
        } else {
            $(this).parent().find('button:first-of-type').addClass('btn-info');
            $(this).parent().find('button:first-of-type').removeClass('btn-default');
            $(this).addClass('btn-default');
            $(this).removeClass('btn-info');
            $price_with_rice_elem.delay(200).fadeOut(300,function () {
                $price_with_rice_elem.addClass('hidden');
            });
            $price_elem.delay(200).fadeIn(300,function () {
                $price_elem.removeClass('hidden');
            });
        }
    });
});

$(function () {
    /*-- tagit --*/
    if (!pluginExists("tagit")) {
        return;
    }

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

    $('.tag-input-readonly').tagit({
        readOnly: true
    });
});
