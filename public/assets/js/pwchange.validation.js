$(function () {
    //標準エラーメッセージの変更
    $.extend($.validator.messages, {
        required: "{1}は必須です。"
    });

    //入力項目の検証ルール定義
    var rules = {
        'old_password': {required: [true, '現在のパスワード']},
        'new_password': {required: [true, '新しいパスワード']},
        'new_password_confirmation': {
            required: [true, '新しいパスワード（確認）'],
            equalTo: "[name='new_password']"
        }
    };

    //入力項目ごとのエラーメッセージ定義
    var messages = {
        'new_password_confirmation': {
            equalTo: '新しいパスワードと値が一致しません。'
        }
    };

    $("#form").validate({
        ignoreTitle: true,
        rules: rules,
        messages: messages
    });
});
