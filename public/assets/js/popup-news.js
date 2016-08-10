$(function () {
    // モーダル画面からも実行（ajaxでページ読み込みされるため.clickでのイベント登録不可）
    $(document).on('click','.news-content a', function () {
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