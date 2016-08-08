$(function () {
    $('.news-content a').click(function() {
        BootstrapDialog.show({
            title: "お知らせ",
            message: $(this).html(),
            draggable: true
        });
    });

    $('.label-news').click(function() {
        BootstrapDialog.show({
            size: BootstrapDialog.SIZE_WIDE,
            title: "お知らせ一覧",
            message: $('<div></div>').load(base_url + 'menu/news_list'),
            draggable: true
        });
    });
});