{extends file='templates/application.tpl'}
{block name=title}メニューが見つかりません。{/block}
{block name=main_contents}
    <div class="container">
        <div class="row">
            <div class="col-xs-10 col-xs-offset-1">
                <p>選択したメニューが見つかりません。</p>
                <p>The menu you requested was not found.</p>
            </div>
        </div>
    </div>
{/block}
{block name=footer_right}
    <a href="{base_url}menu/list" class="btn btn-orange btn-sm box rd24 font-pop"
       style="font-size: large;">
        <span class="fa fa-arrow-circle-left"></span> メニュー管理に戻る
    </a>
{/block}
