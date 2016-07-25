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
    $('.selectpicker').selectpicker({
        'selectedText': 'cat'
    });
})

$(function () {
    $('.dropdown-menu a').click(function(){
        //反映先の要素名を取得
        var visibleTag = $(this).parents('ul').attr('visibleTag');
        var hiddenTag = $(this).parents('ul').attr('hiddenTag');
        //選択された内容でボタンの表示を変える
        $(visibleTag).html($(this).attr('value'));
        //選択された内容でhidden項目の値を変える
        $(hiddenTag).val($(this).attr('value'));
    })
})