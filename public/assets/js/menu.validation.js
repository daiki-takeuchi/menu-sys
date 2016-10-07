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
        'price_regular': {required: [true, '価格(正規従業員)'],digits:{}},
        'price_non_regular': {required: [true, '価格(正規従業員以外)'],digits:{}},
        'price_regular_with_rice': {
            required: function (element) {
                return $('[name="with_rice"]').val() !== '';
            },
            digits:{}
        },
        'price_non_regular_with_rice': {
            required: function (element) {
                return $('[name="with_rice"]').val() !== '';
            },
            digits:{}
        }
    };

    //入力項目ごとのエラーメッセージ定義
    var messages = {
        'price_regular_with_rice': {
            required: 'ご飯付きにした場合、このフィールドは必須です。',
            digits: '整数を入力してください。'
        },
        'price_non_regular_with_rice': {
            required: 'ご飯付きにした場合、このフィールドは必須です。',
            digits: '整数を入力してください。'
        },
        'price_regular': {
            digits: '整数を入力してください。'
        },
        'price_non_regular': {
            digits: '整数を入力してください。'
        }
    };

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
