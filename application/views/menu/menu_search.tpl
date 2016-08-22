{extends file='templates/application.tpl'}
{block name=title}メニュー検索{/block}
{block name=include_js}
{/block}
{block name=main_contents}
    <div class="container">
        <div class="bg-light-gray" style="padding: 5px 10px 10px 10px;">
            <div style="font-size: 12pt;">
                <span class="fa fa-search"></span><span class="font-pop"> 絞り込み</span>
            </div>
            <form class="form" method="post" id="form" action="{base_url}menu/search">
                <div class="row">
                    <div class="col-xs-10 col-xs-offset-1">
                        <div class="row">
                            <div class="col-md-9">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class='form-group' style="margin: 0;">
                                            <label>メニュー名 : </label>
                                            <input type="text" class="form-control" name="menu_name" value="{$menu_name}" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class='form-group' style="margin: 0;">
                                            <label>カテゴリ : </label>
                                            {html_options name="category_id[]" options=$category data-width="100%" class="selectpicker show-menu-arrow" title="カテゴリを選択してください" selected=$category_id
                                            data-size="8" data-actions-box="true" data-selected-text-format="count > 1" multiple="multiple"}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3" style="margin-top: 20px;">
                                <button class="btn btn-orange box rd24 font-pop pull-right" style="font-size: large;">
                                    <span class="fa fa-search"></span> 検索
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                {if $pager}{$pager}{else}<div style="height: 32px;margin: 5px 0 5px 0;"></div>{/if}
            </div>
        </div>
        <div class="panel panel-default table-responsive">
            <table class="table table-sm table-condensed table-hover table-striped">
                <thead>
                <tr>
                    <th style="text-align: center;width: 150px;">掲載開始</th>
                    <th style="text-align: center;width: 150px;">掲載終了</th>
                    <th>お知らせ</th>
                </tr>
                </thead>
                <tbody>
                {foreach from=$menu_list item=menu}
                    <tr>
                        <td style="text-align: center;padding-top: 10px;">{$menu.start_date|date_format:"Y/m/d"}</td>
                        <td style="text-align: center;padding-top: 10px;">{$menu.end_date|date_format:"Y/m/d"}</td>
                        <td style="padding-top: 10px;"><a href="{base_url}menu/edit/{$menu.id}">{$menu.content|escape}</a></td>
                    </tr>
                {/foreach}
                {if !$menu_list}<tr><td colspan="3">検索結果がありません。</td></tr>{/if}
                </tbody>
            </table>
        </div>
    </div>
{/block}
{block name=footer_right}
    <a href="{base_url}menu/new" class="btn btn-orange box rd24 font-pop"
            style="font-size: large;width:150px;">
        <span class="fa fa-plus"></span> メニュー登録
    </a>
{/block}
