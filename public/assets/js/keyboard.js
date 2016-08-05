$(function () {
    var forcus = "";

    $('.soft_keyboard').click(function() {
        forcus = $(this).attr("name");
    });

    $('.btn-keyboard').click(function() {
        if(forcus != "") {
            var input = $("input[name='" + forcus + "']");
            if($(this).text() == "BackSpace") {
                // 最後の１文字削除
                input.val(input.val().slice(0, -1));
            } else {
                input.val(input.val() + $(this).text());
            }
        }
    });
});