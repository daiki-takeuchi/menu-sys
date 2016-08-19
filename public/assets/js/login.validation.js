$(function () {
    //標準エラーメッセージの変更
    $.extend($.validator.messages, {
        required: "{1}は必須です。"
    });

    //入力項目の検証ルール定義
    var rules = {
        'shain_bn': {required: [true, '社員番号']},
        'password': {required: [true, 'パスワード']}
    };

    //入力項目ごとのエラーメッセージ定義
    var messages = {};

    $("#form").validate({
        ignoreTitle: true,
        rules: rules,
        messages: messages,
        onfocusout: function(element) {
            this.element(element);
        }
    });
});
