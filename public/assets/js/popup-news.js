$(function () {
    $('.news-content a').click(function() {
        BootstrapDialog.show({
            title: "お知らせ",
            message: $(this).html(),
            draggable: true
        });
    });
});