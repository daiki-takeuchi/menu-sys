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
            title: "実績ダウンロード",
            message: function(dialog) {
                var $message = $('<div></div>');
                var pageToLoad = dialog.getData('pageToLoad');
                $message.load(pageToLoad);

                return $message;
            },
            data: {
                'pageToLoad': 'download_display'
            },
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
