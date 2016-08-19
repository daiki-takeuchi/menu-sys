$(function () {
    //標準エラーメッセージの変更
    $.extend($.validator.messages, {
        required: "{1}は必須です。"
    });

    //入力項目の検証ルール定義
    var rules = {
        'start_date': {required: [true, '掲載開始日']},
        'end_date': {required: [true, '掲載終了日']},
        'content': {required: [true, 'お知らせ'], maxlength: 100}
    };

    //入力項目ごとのエラーメッセージ定義
    var messages = {};

    $("#form").validate({
        ignoreTitle: true,
        rules: rules,
        messages: messages,
        onfocusout: function(element) {
            if(!($(element).hasClass('date') || $(element).hasClass('date-all'))) {
                this.element(element);
            }
        }
    });
});
