$(function () {
    $('#pwchange').click(function() {
        BootstrapDialog.show({
            title: '性別の入力をお願いします。',
            message: $('<div></div>').load('page/input_gender'),
            cssClass: 'input-gender-dialog',
            draggable: true,
            closable: false,
            buttons: [{
                id: 'btn-register',
                label: '登録',
                cssClass: 'btn-success',
                action: function(dialog) {
                    var gender = dialog.getModalBody().find("[name=gender]:checked").val();
                    if(gender === undefined) {
                        dialog.getModalBody().find('.alert').removeClass('hidden');
                        return false;
                    }
                    var $button = this; // 'this' here is a jQuery object that wrapping the <button> DOM element.
                    $button.disable();
                    $button.spin();
                    $.ajax({
                        type: 'POST',
                        url: 'page/update_gender',
                        data: {gender : gender},
                        dataType: 'json',
                        success: function(data, dataType) {dialog.close();},
                        error: function(XMLHttpRequest, textStatus, errorThrown){MessageBox.show(errorThrown.message);}
                    });
                    $button.stopSpin();
                    $button.enable();
                }
            }],
            onhide: function(dialog){
                $('#form').submit();
            }
        });
    });
});