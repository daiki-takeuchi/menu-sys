{extends file='templates/application.tpl'}
{block name=title}メニュー予約{/block}
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
<form method="post" id="form">
    <div class="container">
        {include file='menu/news_ticker.tpl'}
        {include file='menu/header_calendar.tpl'}
    </div>
    {include file='menu/menu_list_detail.tpl'}
</form>
{/block}
{block name=footer_right}
    {if {earlier_than_reference_time date="$selected_date"}}
    <button class="btn btn-orange btn-menu-reserve box rd24 font-pop"
            style="font-size: large;width:150px;">
        予約する
    </button>
    {else}
        <button class="btn btn-orange box rd24 font-pop disabled"
                style="font-size: large;width:150px;">
            予約は{$reference_time|date_format:'G:i'}まで
        </button>
    {/if}
{/block}
