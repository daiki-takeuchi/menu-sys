<div style="width: 200px;">
    <div class="input-group" style="margin-bottom: 5px;">
        <span class="input-group-addon bg-white">　予約数：</span>
        <span class="form-control center" style="outline: none;border: none;box-shadow: none;font-size: 14pt;height: 36px;">{$menu_item.reservation_count}</span>
        <span class="input-group-addon bg-white">食</span>
    </div>
    <div class="input-group" style="margin-bottom: 5px;">
        <span class="input-group-addon bg-white">最大食数：</span>
        <input type="number" name="max_supply_num[]" class="form-control center" style="font-size: 14pt;" value="{$menu_item.max_supply_num}" />
        <span class="input-group-addon bg-white">食</span>
    </div>
    <div class="input-group">
        <span class="input-group-addon bg-white">実績食数：</span>
        <input type="number" name="actual_supply_num[]" class="form-control center" style="font-size: 14pt;" value="{$menu_item.actual_supply_num}" />
        <span class="input-group-addon bg-white">食</span>
    </div>
</div>
<div class="center" style="width: 300px;">
    <span class="price">
        <span class="font-pop font-price">
            {convert_han2full string=$menu_item.price_regular}
        </span>円
        <span class="font-pop font-price">
        &nbsp;/ {convert_han2full string=$menu_item.price_non_regular}
        </span>円
    </span>
    <span class="price-with-rice hidden">
        <span class="font-pop font-price">
            {convert_han2full string=$menu_item.price_regular_with_rice}
        </span>円
        <span class="font-pop font-price">
        &nbsp;/ {convert_han2full string=$menu_item.price_non_regular_with_rice}
        </span>円
    </span>
</div>
