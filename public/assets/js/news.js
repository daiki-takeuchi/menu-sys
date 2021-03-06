$(function () {

    $('.btn-save-news').click(function () {
        $('#form').submit();
    });

    $('.btn-news-delete').click(function () {
        var newsId = this.id;
        BootstrapDialog.confirm({
            title: '削除の確認',
            message: '削除してよろしいですか？',
            type: BootstrapDialog.TYPE_WARNING,
            closable: true,
            draggable: true,
            btnCancelLabel: 'キャンセル',
            btnOKLabel: '削除する',
            btnOKClass: 'btn-warning',
            callback: function(result) {
                if(result) {
                    window.location.href = base_url + 'news/delete/' + newsId;
                }
            }
        });
    });
});
