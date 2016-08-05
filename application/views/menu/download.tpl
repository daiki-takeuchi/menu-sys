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
                $('.target-month').addClass('hidden');
                $('.target-date').removeClass('hidden');
            } else {
                $('.target-month').removeClass('hidden');
                $('.target-date').addClass('hidden');
            }
        });
    });
</script>
<div class="row">
    <div class="col-xs-6 col-xs-offset-3 controls">
        <div class="form-group">
            <div><label>出力帳票</label></div>
            <select class="selectpicker show-menu-arrow form_list" data-width="150px">
                <option value="1">予約者リスト</option>
                <option value="2">食数実績表</option>
                <option value="3">食堂取組報告</option>
            </select>
        </div>
        <div class="form-group target-date">
            <div><label>対象日</label></div>
            <div class='input-group date'>
                <span class="input-group-addon">
                    <span class="fa fa-calendar"></span>
                </span>
                <input type="text" class="form-control" name="date" value="{$smarty.now|date_format:'%Y/%m/%d'}" placeholder="対象日" />
            </div>
        </div>
        <div class="form-group target-month hidden">
            <div><label>対象年月</label></div>
            <select class="selectpicker show-menu-arrow" data-width="90px">
                <option value="2015">2015</option>
                <option value="2016" selected>2016</option>
                <option value="2017">2017</option>
            </select> 年　
            <select class="selectpicker show-menu-arrow" data-width="65px">>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7" selected>7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
            </select> 月　
        </div>
        <div class="form-group">
            <div><label>対象カテゴリ</label></div>
            <select class="selectpicker show-menu-arrow" data-width="125px">
                <option value="1">Breakfast</option>
                <option value="2" selected>Lunch</option>
                <option value="3">Dinner</option>
            </select>
        </div>
    </div>
</div>
