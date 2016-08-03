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
            message: $(this).html()
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
