<script>
    $(function () {
        $(".selectpicker").selectpicker({
            "selectedText": "cat"
        });
    });
</script>
<div class="row">
    <div class="col-xs-6 col-xs-offset-3 controls">
        <div class="form-group">
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
        <div class="form-group">
            <div><label>出力帳票</label></div>
            <select class="selectpicker show-menu-arrow" data-width="150px">
                <option value="1">食数実績表</option>
                <option value="2">食堂取組報告</option>
            </select>
        </div>
    </div>
</div>
