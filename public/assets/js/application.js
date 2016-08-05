function pluginExists(pluginName) {
    return $.fn[pluginName] != undefined;
}

$(function () {
    /*-- カレンダー --*/
    if (!pluginExists("datepicker")) {
        return;
    }

    $('.input-group.date').datepicker({
        format: "yyyy/mm/dd",
        startDate: "today",
        language: "ja",
        autoclose: true,
        todayHighlight: true
    });
});

var MessageBox = (function() {
    "use strict";

    var elem,
        hideHandler,
        that = {};

    that.init = function(options) {
        elem = $(options.selector);
    };

    that.show = function(text) {
        clearTimeout(hideHandler);

        elem.find("span").html(text);
        elem.delay(200).fadeIn().delay(4000).fadeOut();
    };

    return that;
}());

$(function () {
    MessageBox.init({
        "selector": ".bb-alert"
    });
});

$(function () {
    if (!pluginExists("selectpicker")) {
        return;
    }
    $(".selectpicker").selectpicker({
        "selectedText": "cat"
    });
});

$(function () {
    $('[data-toggle="tooltip"]').tooltip();
});

$(function () {
    $('.news-content a').click(function() {
        BootstrapDialog.show({
            title: "お知らせ",
            message: $(this).html(),
            draggable: true
        });
    });
});

$(function () {
    var forcus = "";

    $('.soft_keyboard').click(function() {
        forcus = $(this).attr("name");
    });

    $('.btn-keyboard').click(function() {
        if(forcus != "") {
            var input = $("input[name='" + forcus + "']");
            if($(this).text() == "BackSpace") {
                // 最後の１文字削除
                input.val(input.val().slice(0, -1));
            } else {
                input.val(input.val() + $(this).text());
            }
        }
    });
});

$(function () {
    $('.excel-download').click(function() {
        BootstrapDialog.show({
            title: "帳票ダウンロード",
            message: $('<div></div>').load('download_display'),
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

$(function () {
    $('#pwchange').click(function() {

        var $text = $('<div></div>');
        $text.append('食堂利用状況を分析する際に利用させていただきますので、性別の入力にご協力お願いします。<br /><br />');
        $text.append('<div class="row center">' +
                     '  <div class="col-xs-12">' +
                     '      <div class="radio-inline">' +
                     '          <label><input type="radio" name="gender" value="1"> 男性</label>' +
                     '      </div>' +
                     '      <div class="radio-inline">' +
                     '          <label><input type="radio" name="gender" value="2"> 女性</label>' +
                     '      </div>' +
                     '      <div class="radio-inline">' +
                     '          <label><input type="radio" name="gender" value="3"> その他</label>' +
                     '      </div>' +
                     '  </div>' +
                     '</div><br /><div class="alert alert-danger hidden">性別を選択してください。</div>');

        BootstrapDialog.show({
            title: '性別の入力をお願いします。',
            message: $text,
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
                        url: 'user/update_gender',
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