{extends file='templates/application.tpl'}
{block name=title}メニュー管理{/block}
{block name=include_css}
    <link rel="stylesheet" href="{base_url}assets/css/bootstrap-datepicker.min.css"/>
    <link rel="stylesheet" href="{base_url}assets/css/jquery.tagit.css">
    <link rel="stylesheet" href="{base_url}assets/css/tag-input.css">
{/block}
{block name=include_js}
    <script src="{base_url}assets/js/bootstrap-datepicker.min.js"></script>
    <script src="{base_url}assets/js/bootstrap-datepicker.ja.min.js"></script>
    <script src="{base_url}assets/js/tag-it.min.js"></script>
    <script src="{base_url}assets/js/ticker.js"></script>
    <script src="{base_url}assets/js/popup-news.js"></script>
    <script src="{base_url}assets/js/menu.js"></script>
{/block}
{block name=main_contents}
    <div class="container">
        {include file='menu/news_ticker.tpl'}
        {include file='menu/header_calendar.tpl'}
    </div>
    {include file='menu/menu_list_detail.tpl'}
{/block}
{block name=footer_left}
    <button type="button" class="btn btn-orange box rd24 font-pop excel-download"
            style="font-size: large;">
        <span class="fa fa-download"></span><span class="spNone"> 帳票をDL</span>
    </button>
{/block}
{block name=footer_right}
    <a href="{base_url}menu/new" class="btn btn-orange box rd24 font-pop"
            style="margin-right:15px;font-size: large;">
        <span class="fa fa-plus"></span><span class="spNone"> メニュー登録</span>
    </a>
    <a href="{base_url}menu/list" class="btn btn-orange box rd24 font-pop"
            style="font-size: large;">
        <span class="glyphicon glyphicon-saved"></span><span class="spNone"> 食数を保存</span>
    </a>
{/block}
