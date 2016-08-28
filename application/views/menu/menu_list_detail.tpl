<div class="list_menu">
    {foreach from=$menu_list item=menu key=category_id name=menu_list}
    <div class="container">
        <div class="row">
            <div class="col-sm-3 col-md-2">
                <div class="img-menu-category">
                    <img src="{base_url}assets/img/{if $category_id == 3}special_lunch{elseif $category_id == 4}a_lunch{elseif $category_id == 5}b_lunch{elseif $category_id == 6}japanese_noodle{elseif $category_id == 7}bowl{elseif $category_id == 9}chinese_noodle{elseif $category_id == 10}pasta{elseif $category_id == 11}curry{/if}.jpg">
                </div>
            </div>
            {foreach from=$menu item=menu_item name=menu}
            <div class="col-sm-9 col-md-10{if $smarty.foreach.menu.iteration > 1} col-sm-offset-3 col-md-offset-2{/if}">
                {if $smarty.foreach.menu.iteration > 1}<hr style="margin: 0 0 5px 0;"/>{/if}
                <div class="row" style="margin: 5px;">
                    <div class="col-sm-5 col-md-4 col-lg-3">
                        <div class="img-menu">
                            <img src="{base_url}assets/img/chicken.jpg">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-5 col-lg-5">
                        {if $page == 'menu_list'}
                            <a class="font-pop" style="font-size: 18pt;" href="{base_url}menu/edit/{$menu_item.id}">{$menu_item.menu_name}</a>
                        {else}
                            <div class="font-pop" style="font-size: 18pt;">{$menu_item.menu_name}</div>
                        {/if}
                        <ul class="tag-input-readonly" style="border-color: #fff;font-size: 9pt;margin-left: -5px;">
                            {assign var="tags" value=","|explode:$menu_item.tag}
                            {foreach from=$tags item=tag}
                                <li>{$tag}</li>
                            {/foreach}
                        </ul>
                        {if $menu_item.with_rice}
                        <div class="btn-group btn-with-rice" role="group" aria-label="with rice">
                            <button type="button" class="btn btn-info btn-xs">{$menu_item.with_rice}なし</button>
                            <button type="button" class="btn btn-default btn-xs">{$menu_item.with_rice}つき</button>
                        </div>
                        {/if}
                        <div style="margin: 5px 0 5px 0;"><span style="font-size: 9pt;">特定原材料（７品目）：</span>{if $menu_item.allergen}{$menu_item.allergen}{else}なし{/if}</div>
                        <table>
                            <tr>
                                <td><span style="font-size: 9pt;">エネルギー：</span>{$menu_item.energy} kcal</td>
                                <td style="padding-left: 15px;"><span style="font-size: 9pt;">塩分：</span>{$menu_item.salt} g</td>
                            </tr>
                            <tr>
                                <td><span style="font-size: 9pt;">たんぱく質：</span>{$menu_item.protein} g</td>
                                <td style="padding-left: 15px;"><span style="font-size: 9pt;">脂質：</span>{$menu_item.lipid} g</td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-sm-1 col-md-3 col-lg-3">
                        {if $page == 'index'}
                            {include file='menu/menu_list_detail_reservation.tpl'}
                        {else}
                            {include file='menu/menu_list_detail_actual.tpl'}
                        {/if}
                    </div>
                </div>
            </div>
            {/foreach}
        </div>
    </div>
    {if !$smarty.foreach.menu_list.last}<hr style="margin: 0 0 5px 0;"/>{/if}
    {/foreach}
</div>