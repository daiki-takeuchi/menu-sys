{extends file='templates/application.tpl'}
{block name=title}お知らせ管理{/block}
{block name=include_js}
{/block}
{block name=main_contents}
    <div class="container">
        <div class="bg-light-gray" style="padding: 5px 10px 5px 10px;">
            <div style="font-size: 12pt;">
                <span class="fa fa-search"></span><span class="font-pop"> 絞り込み</span>
            </div>
            <form class="form-horizonta" method="post">
                <div class="row" style="margin-bottom: 5px;">
                    <div class='form-inline'>
                        <div class="col-xs-10 col-xs-offset-1 col-lg-4" style="margin-bottom: 5px;">
                            <div style="display: inline; font-weight: bold;margin: 7px 5px 0 0;">お知らせ : </div>
                            <input type="text" class="form-control" name="contents" />
                        </div>
                        <div class="col-xs-10 col-xs-offset-1 col-lg-4 col-lg-pull-1" style="margin-top: 8px;">
                            <div class="checkbox-inline">
                                <label><input type="checkbox" name="permission_menu" value="1">現在掲載中のお知らせだけを掲載する</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-10 col-xs-offset-1 col-sm-5 col-sm-offset-1 col-md-4 col-lg-4">
                        <div class="form-group" style="margin-bottom: 5px;">
                            <label>期間 : </label>
                            {html_options class="selectpicker show-menu-arrow" data-width="90px" name="target-year" values=$year.values output=$year.values selected=$year.selected} 年　
                            {html_options class="selectpicker show-menu-arrow" data-width="65px" name="target-month" values=$month.values output=$month.values selected=$month.selected} 月　
                        </div>
                    </div>
                    <div class="col-xs-10 col-xs-offset-1 col-sm-5 col-sm-pull-1 col-md-4 col-md-pull-1 col-lg-4 col-lg-pull-2">
                        <div class='form-group' style="margin-bottom: 5px;">
                            <label>&nbsp;&nbsp;〜&nbsp;&nbsp;</label>
                            {html_options class="selectpicker show-menu-arrow" data-width="90px" name="target-year" values=$year.values output=$year.values selected=$year.selected} 年　
                            {html_options class="selectpicker show-menu-arrow" data-width="65px" name="target-month" values=$month.values output=$month.values selected=$month.selected} 月　
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class="col-xs-10 col-xs-offset-1 col-md-1 col-md-pull-1 col-lg-1 col-lg-pull-3">
                            <button class="btn btn-orange box rd24 font-pop pull-right" style="font-size: large;">
                                <span class="fa fa-search"></span> 検索
                            </button>
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
            <table id="id-tbl-fav-menu" class="table table-sm table-condensed table-hover table-striped">
                <thead>
                <tr>
                    <th style="text-align: center;">掲載開始</th>
                    <th style="text-align: center;">掲載終了</th>
                    <th>お知らせ</th>
                </tr>
                </thead>
                <tbody>
                {foreach from=$news item=news_item}
                    <tr>
                        <td style="text-align: center;padding-top: 10px;">{$news_item.start_date|date_format:"Y/m/d"}</td>
                        <td style="text-align: center;padding-top: 10px;">{$news_item.end_date|date_format:"Y/m/d"}</td>
                        <td style="padding-top: 10px;"><a href="{base_url}news/edit/{$news_item.id}">{$news_item.contents}</a></td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/block}
{block name=footer_right}
    <a href="{base_url}news/new" class="btn btn-orange box rd24 font-pop"
            style="font-size: large;width:150px;">
        <span class="fa fa-plus"></span> お知らせ登録
    </a>
{/block}
