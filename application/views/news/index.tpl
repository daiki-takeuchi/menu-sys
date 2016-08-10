{extends file='templates/application.tpl'}
{block name=title}お知らせ管理{/block}
{block name=include_js}
{/block}
{block name=main_contents}
{/block}
{block name=footer_right}
    <a href="{base_url}news/new" class="btn btn-orange box rd24 font-pop"
            style="font-size: large;width:150px;">
        <span class="fa fa-plus"></span> お知らせ登録
    </a>
{/block}
