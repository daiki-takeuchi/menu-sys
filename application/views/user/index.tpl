{extends file='templates/application.tpl'}
{block name=title}ユーザー管理{/block}
{block name=include}
{/block}
{block name=main_contents}
{/block}
{block name=footer_right}
    <a href="{base_url}user/new" class="btn btn-orange btn-sm box rd24 font-pop"
            style="font-size: large;width:150px;">
        <span class="fa fa-plus"></span> ユーザー登録
    </a>
{/block}
