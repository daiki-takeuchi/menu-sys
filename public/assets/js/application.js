function pluginExists(pluginName) {
    return $.fn[pluginName] != undefined;
}

$(function () {
    /*-- カレンダー --*/
    if (!pluginExists("datepicker")) {
        return;
    }

    var date = $('.date').datepicker({
        format: "yyyy/mm/dd",
        startDate: "today",
        language: "ja",
        autoclose: true,
        todayHighlight: true
    });

    var date_all = $('.date-all').datepicker({
        format: "yyyy/mm/dd",
        language: "ja",
        autoclose: true,
        todayHighlight: true
    });

    date.on('change', function () {
        $(this).focus();
    });

    date_all.on('change', function () {
        $(this).focus();
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

    that.show = function(text, callback) {
        clearTimeout(hideHandler);

        elem.find("span").html(text);
        elem.delay(200).fadeIn().delay(4000).fadeOut(function () {
            if(callback !== undefined) callback();
        });
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
    $("#form").validate();
});

$(function () {
    $(".pager li a").click(function (event) {
        event.preventDefault();
        $('#form').attr('action', $(this).attr('href')).submit();
    });
});