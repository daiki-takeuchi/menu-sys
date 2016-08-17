$(function () {
    //標準エラーメッセージの変更
    $.extend($.validator.messages, {
        required: "{1}は必須です。"
    });

    //入力項目の検証ルール定義
    var rules = {
        'supply_date': {required: [true, 'メニュー提供日']},
        'open_date': {required: [true, 'メニュー公開日']},
        'menu_name': {required: [true, 'メニュー名']},
        'category_id': {required: [true, 'カテゴリ']},
        'price_regular': {required: [true, '正規従業員の価格']},
        'price_non_regular': {required: [true, '正規従業員以外の価格']}
    };

    //入力項目ごとのエラーメッセージ定義
    var messages = {};

    $("#form").validate({
        ignoreTitle: true,
        rules: rules,
        messages: messages
    });
});
