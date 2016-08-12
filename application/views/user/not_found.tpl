{extends file='templates/application.tpl'}
{block name=title}ユーザーが見つかりません。{/block}
{block name=main_contents}
    <div class="container">
        <div class="row">
            <div class="col-xs-10 col-xs-offset-1">
                <p>選択したユーザーが見つかりません。</p>
                <p>The user you requested was not found.</p>
            </div>
        </div>
    </div>
{/block}
{block name=footer_right}
    <a href="{base_url}user" class="btn btn-orange btn-sm box rd24 font-pop"
       style="font-size: large;">
        <span class="fa fa-arrow-circle-left"></span> ユーザー一覧に戻る
    </a>
{/block}
