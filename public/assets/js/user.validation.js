$(function () {

    //標準エラーメッセージの変更
    $.extend($.validator.messages, {
        required: "{1}は必須です。"
    });

    //入力項目の検証ルール定義
    var rules = {
        'name': {required: [true, '名前']},
        'shain_bn': {required: [true, '社員番号']},
        'company_cc': {required: [true, '会社名']},
        'soshiki_cc': {required: [true, '組織']},
        'shain_keitai_cc': {required: [true, '雇用形態']}
    };

    //入力項目ごとのエラーメッセージ定義
    var messages = {};

    $("#form").validate({
        ignoreTitle: true,
        rules: rules,
        messages: messages
    });
});
