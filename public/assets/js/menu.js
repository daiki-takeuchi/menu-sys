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
});