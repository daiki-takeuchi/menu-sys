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
                                        <div class='form-group'>
                                            <label>メニュー名 : </label>
                                            <input type="text" class="form-control" name="menu_name" value="{$menu_name}" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class='form-group'>
                                            <label>カテゴリ : </label>
                                            {html_options name="category_id[]" options=$category data-width="100%" class="selectpicker show-menu-arrow" title="カテゴリを選択してください" selected=$selected
                                            data-size="8" data-actions-box="true" data-selected-text-format="count > 1" multiple="multiple"}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-9">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class='form-group' style="margin: 0;">
                                            <label>提供日 : </label><br />
                                            {html_options class="selectpicker show-menu-arrow" data-width="90px" name="start_year" title=" " values=$year output=$year selected=$start_year_selected} 年　
                                            {html_options class="selectpicker show-menu-arrow" data-width="65px" name="start_month" title=" " values=$month output=$month selected=$start_month_selected} 月
                                            <span style="padding-left: 20px;">〜<span>　
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class='form-group' style="margin: 0;">
                                            <label>　</label><br />
                                            {html_options class="selectpicker show-menu-arrow" data-width="90px" name="end_year" title=" " values=$year output=$year selected=$end_year_selected} 年　
                                            {html_options class="selectpicker show-menu-arrow" data-width="65px" name="end_month" title=" " values=$month output=$month selected=$end_month_selected} 月　
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1" style="margin-top: 20px;">
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
                {if $pager}{$pager nofilter}{else}<div style="height: 32px;margin: 5px 0 5px 0;"></div>{/if}
            </div>
        </div>
        <div class="panel panel-default table-responsive">
            <table class="table table-sm table-condensed table-hover table-striped">
                <thead>
                <tr>
                    <th style="text-align: center;width: 150px;">提供日</th>
                    <th style="text-align: center;width: 150px;">公開日</th>
                    <th style="width: 180px;">カテゴリ</th>
                    <th style="text-align: center;width: 110px;"></th>
                    <th>メニュー名</th>
                </tr>
                </thead>
                <tbody>
                {foreach from=$menu_list item=menu}
                    <tr>
                        <td style="text-align: center;padding-top: 8px;">{$menu.supply_date|date_format:"Y/m/d"}</td>
                        <td style="text-align: center;padding-top: 8px;">{$menu.open_date|date_format:"Y/m/d"}</td>
                        <td style="padding-top: 8px;">{$category_master[$menu.category_id]}</td>
                        <td style="text-align: center;">
                            <a href="{base_url}menu/copy/{$menu.id}" class="btn btn-sm btn-default btn-menu-copy rd15">コピー登録</a>
                        </td>
                        <td style="padding-top: 8px;"><a href="{base_url}menu/edit/{$menu.id}">{$menu.menu_name|escape}</a></td>
                    </tr>
                {/foreach}
                {if !$menu_list}<tr><td colspan="4">検索結果がありません。</td></tr>{/if}
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
