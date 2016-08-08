$(function () {
    $('.excel-download').click(function() {
        BootstrapDialog.show({
            title: "帳票ダウンロード",
            message: $('<div></div>').load('excel_download'),
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
            message: 'test',
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
        $('#form').submit();
    });
});