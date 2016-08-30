<div class="reservation_remain center">
    {if $menu_item.max_supply_num}
        残り：
        <span style="font-size: 16pt;font-weight: bold;">６</span> 食
    {/if}
</div>
<div class='input-group reservation'>
    <div class="pull-left" style="margin-right: 10px;margin-top: 23px;">
        <button type="button" class="btn btn-xs btn-primary btn-decrease"><span class="fa fa-minus"></span></button>
    </div>
    <input type="text" name="quantity[]" class="form-control font-pop pull-left" min="0"
           value="0" readonly />
    <div class="pull-left" style="margin-left: 10px;margin-top: 23px;">
        <button type="button" class="btn btn-xs btn-primary btn-increase"><span class="fa fa-plus"></span></button>
    </div>
</div>
<div class="center" style="width: 120px;margin-left: 10px;">
    <span class="font-pop price" style="font-size: 24pt;font-weight: bold;">
    {if in_array($shain_keitai_cc, array('01','02','03','04'))}
        {convert_han2full string=$menu_item.price_regular}{else}{convert_han2full string=$menu_item.price_non_regular}{/if}</span>
    <span class="font-pop price-with-rice hidden" style="font-size: 24pt;font-weight: bold;">
    {if in_array($shain_keitai_cc, array('01','02','03','04'))}
        {convert_han2full string=$menu_item.price_regular_with_rice}{else}{convert_han2full string=$menu_item.price_non_regular_with_rice}{/if}</span>
    円
</div>
