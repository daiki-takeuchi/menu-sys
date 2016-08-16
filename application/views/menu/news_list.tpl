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
                        <td>{$news.start_date|date_format:"%Y/%m/%d"}</td>
                        <td><span class="news-content"><a>{$news.content|escape}({$smarty.foreach.news.iteration}件 / {count($news_list)}件 )</a></span></td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
</div>