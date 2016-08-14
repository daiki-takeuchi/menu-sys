// 初期化処理
(function($) {
    "use strict";
    // Validatorの初期値を変更します
    $.validator.setDefaults({
        // NG項目のclass
        errorClass : 'has-error',
        // OK項目のclass
        validClass : '',
        // エラーメッセージを表示する処理
        errorPlacement: function (error, element) {
            var $help = element.closest('.form-group').find('.help-block');
            error.appendTo($help);
        },
        // 入力チェックNGの場合、項目のform-groupにerrorClassを設定します
        highlight : function(element, errorClass, validClass) {

            var $formGroup = $(element).closest('div.form-group');
            var $feedback = $formGroup.find('span.form-control-feedback');

            // フォームグループにエラークラスを設定する
            $formGroup.addClass(errorClass).removeClass(validClass);
            // フィードバックアイコンにエラーを設定する
            $feedback.addClass('glyphicon').addClass('glyphicon-remove');
        },
        // 入力チェックOKの場合、項目のform-groupにvalidClassを設定します
        unhighlight : function(element, errorClass, validClass) {

            var $formGroup = $(element).closest('div.form-group');
            var $feedback = $formGroup.find('span.form-control-feedback');

            // フォームグループに正常クラスを設定する
            $formGroup.removeClass(errorClass).addClass(validClass);
            // フィードバックアイコンに正常を設定する
            $feedback.addClass('glyphicon').removeClass('glyphicon-remove');
        }
    });
}(jQuery));

// DOM構築後の処理
$(function() {
    "use strict";
    // ページ内のすべてのフォームにValidatorを設定します
    $('form').each(function(index, element) {
        var $form = $(element);
        var validator = $form.validate();

        // フォームがresetされたときの処理
        $form.bind('reset', function() {
            // Validatorをリセットします
            validator.resetForm();
            // フォーム内のすべてのform-groupからerrorClassとvalidClassを削除します
            $form.find('.form-group').each(function(index, element) {
                $(element).removeClass($.validator.defaults.errorClass).removeClass($.validator.defaults.validClass);
            });
        });
    });
});