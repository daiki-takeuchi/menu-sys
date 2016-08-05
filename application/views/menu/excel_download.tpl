<script src="{base_url}assets/js/excel-download.js"></script>
<div class="row">
    <div class="col-xs-10 col-xs-offset-1">
        <div class="col-xs-10 col-sm-offset-1 col-md-10 col-md-offset-1">
            <form class="form-horizontal" method="post">
                <div class="form-group">
                    <div><label>出力帳票</label></div>
                    {html_options class="selectpicker show-menu-arrow form_list" data-width="150px" name="form" options=$form_list selected="1"}
                </div>
                <div class="form-group area-target-date">
                    <div><label>対象日</label></div>
                    <div class='input-group date'>
                <span class="input-group-addon">
                    <span class="fa fa-calendar"></span>
                </span>
                        <input type="text" class="form-control" name="target-date" value="{$smarty.now|date_format:'%Y/%m/%d'}" placeholder="対象日" />
                    </div>
                </div>
                <div class="form-group area-target-year-month hidden">
                    <div><label>対象年月</label></div>
                    {html_options class="selectpicker show-menu-arrow" data-width="90px" name="target-year" values=$year.values output=$year.values selected=$year.selected} 年　
                    {html_options class="selectpicker show-menu-arrow" data-width="65px" name="target-month" values=$month.values output=$month.values selected=$month.selected} 月　
                </div>
                <div class="form-group">
                    <div><label>対象カテゴリ</label></div>
                    {html_options class="selectpicker show-menu-arrow" data-width="155px" name="target-category" options=$category selected="2"}
                </div>
            </form>
        </div>
    </div>
</div>
