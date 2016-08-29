<div style="width: 200px;">
    <div class="input-group" style="margin-bottom: 5px;">
        <span class="input-group-addon" style="border: none;background-color:#fff;">　予約数：</span>
        <span class="form-control center" style="outline: none;border: none;box-shadow: none;font-size: 14pt;height: 36px;background-color:#fff;">80</span>
        <span class="input-group-addon" style="border: 0;background-color:#fff;">食</span>
    </div>
    <div class="input-group" style="margin-bottom: 5px;">
        <span class="input-group-addon" style="border: none;background-color:#fff;">最大食数：</span>
        <input type="number" name="max_supply_num[]" class="form-control center" style="font-size: 14pt;" />
        <span class="input-group-addon" style="border: 0;background-color:#fff;">食</span>
    </div>
    <div class="input-group">
        <span class="input-group-addon" style="border: none;background-color:#fff;">実績食数：</span>
        <input type="number" name="actual_supply_num[]" class="form-control center" style="font-size: 14pt;" />
        <span class="input-group-addon" style="border: 0;background-color:#fff;">食</span>
    </div>
</div>
<div class="center" style="width: 300px;">
    <span class="font-pop price">
        <span style="font-size: 24pt;font-weight: bold;">
            {convert_han2full string=$menu_item.price_regular}
        </span>円
        <span style="font-size: 24pt;font-weight: bold;">
        &nbsp;/ {convert_han2full string=$menu_item.price_non_regular}
        </span>円
    </span>
    <span class="font-pop price-with-rice hidden">
        <span style="font-size: 24pt;font-weight: bold;">
            {convert_han2full string=$menu_item.price_regular_with_rice}
        </span>円
        <span style="font-size: 24pt;font-weight: bold;">
        &nbsp;/ {convert_han2full string=$menu_item.price_non_regular_with_rice}
        </span>円
    </span>
</div>
