<div class="row">
    <div class="col-xs-10 col-xs-offset-1">
        <div class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-3">
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
                    {html_options class="selectpicker show-menu-arrow" data-width="100px" name="target-category" options=$category selected="2"}
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $(function () {
        $(".selectpicker").selectpicker({
            "selectedText": "cat"
        });
        $('.input-group.date').datepicker({
            weekStart: 1,
            format: "yyyy/mm/dd",
            language: "ja",
            autoclose: true,
            todayHighlight: true
        });
        $('.form_list').change(function(){
            var selected = $('.form_list option:selected').val();
            if(selected == '1') {
                $('.area-target-year-month').addClass('hidden');
                $('.area-target-date').removeClass('hidden');
            } else {
                $('.area-target-year-month').removeClass('hidden');
                $('.area-target-date').addClass('hidden');
            }
        });
    });
</script>