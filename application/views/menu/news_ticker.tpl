<div id="news-fixed">
    <div id="news-bk" class="clearfix">
        <span class="label-news rd5 pull-left">お知らせ</span>
        <div class="ticker" rel="roll">
            <ul>
                {foreach from=$news_list item=news name=news}
                <li>
                    <span class="news-date">{$news.date|date_format:"%Y"}年{$news.date|date_format:"%m"}月{$news.date|date_format:"%d"}日掲載</span>
                    <span class="news-content"><a>{$news.content}({$smarty.foreach.news.iteration}件 / {count($news_list)}件 )</a></span>
                </li>
                {/foreach}
            </ul>
        </div><!--/.ticker-->
    </div>
</div>
