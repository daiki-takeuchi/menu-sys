$(function () {
    $(".selectpicker").selectpicker({
        "selectedText": "cat"
    });
    $('.input-group.date').datepicker({
        weekStart: 1,
        format: "yyyy/mm/dd",
        language: "ja",
        autoclose: true,
        todayHighlight: true
    });
    $('.form_list').change(function(){
        var selected = $('.form_list option:selected').val();
        if(selected == '1') {
            $('.area-target-year-month').addClass('hidden');
            $('.area-target-date').removeClass('hidden');
        } else {
            $('.area-target-year-month').removeClass('hidden');
            $('.area-target-date').addClass('hidden');
        }
    });
});