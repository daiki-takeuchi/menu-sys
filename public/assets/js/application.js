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

    date.on('hide', function () {
        $(this).valid();
    });

    date_all.on('hide', function () {
        $(this).valid();
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

        this.hide();
        elem.stop();
        elem.find("span").html(text);
        elem.delay(200).fadeIn().delay(4000).fadeOut(function () {
            if(callback !== undefined) callback();
        });
    };

    that.hide = function() {
        elem.css('display', 'none');
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
    $("#form").validate({
        ignoreTitle: true,
        onfocusout: function(element) {
            if(!($(element).hasClass('date') || $(element).hasClass('date-all'))) {
                this.element(element);
            }
        }
    });
});

$(function () {
    $('input,select,textarea').each(function(){
        $(this)
            .focusin(function(element) {
                $(this).addClass('bg-light-yellow');
            })
            .focusout(function(element) {
                $(this).removeClass('bg-light-yellow');
            });
    });
});

$(function () {
    $(".pager li a").click(function (event) {
        if($(this).attr('href') === undefined) {
            event.preventDefault();
        }
    });
});

$(function () {
    $(".bb-alert a.close").click(function (event) {
        event.preventDefault();
        MessageBox.hide();
    });
});