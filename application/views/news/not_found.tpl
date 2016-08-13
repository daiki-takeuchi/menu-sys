{extends file='templates/application.tpl'}
{block name=title}お知らせが見つかりません。{/block}
{block name=main_contents}
    <div class="container">
        <div class="row">
            <div class="col-xs-10 col-xs-offset-1">
                <p>選択したお知らせが見つかりません。</p>
                <p>The news you requested was not found.</p>
            </div>
        </div>
    </div>
{/block}
{block name=footer_right}
    <a href="{base_url}news" class="btn btn-orange btn-sm box rd24 font-pop"
       style="font-size: large;">
        <span class="fa fa-arrow-circle-left"></span> お知らせー一覧に戻る
    </a>
{/block}
