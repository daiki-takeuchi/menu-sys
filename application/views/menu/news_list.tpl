<script>
    $(function () {
        $('.news-content-modal a').click(function() {
            BootstrapDialog.show({
                title: "お知らせ",
                message: $(this).html(),
                draggable: true
            });
        });
    });
</script>
<div class="form-group">
    <div class="row">
        <div class="col-xs-12">
            <table class="table table-sm table-hover">
                <thead>
                <tr>
                    <th>掲載日</th>
                    <th>内容</th>
                </tr>
                </thead>
                <tbody>
                {foreach from=$news_list item=news name=news}
                    <tr>
                        <td>{$news.date|date_format:"%Y/%m/%d"}</td>
                        <td><span class="news-content-modal"><a>{$news.content}({$smarty.foreach.news.iteration}件 / {count($news_list)}件 )</a></span></td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
</div>