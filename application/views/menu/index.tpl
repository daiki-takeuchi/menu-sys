{extends file='templates/application.tpl'}
{block name=title}メニュー予約{/block}
{block name=include_css}
    <link rel="stylesheet" href="{base_url}assets/css/bootstrap-datepicker.min.css"/>
    <link rel="stylesheet" href="{base_url}assets/css/jquery.tagit.css">
    <link rel="stylesheet" href="{base_url}assets/css/tag-input.css">
{/block}
{block name=include_js}
    <script src="{base_url}assets/js/bootstrap-datepicker.min.js"></script>
    <script src="{base_url}assets/js/bootstrap-datepicker.ja.min.js"></script>
    <script src="{base_url}assets/js/tag-it.min.js"></script>
    <script src="{base_url}assets/js/ticker.js"></script>
    <script src="{base_url}assets/js/popup-news.js"></script>
    <script src="{base_url}assets/js/menu.js"></script>
{/block}
{block name=main_contents}
    <div class="container">
        {include file='menu/news_ticker.tpl'}
        {include file='menu/header_calendar.tpl'}
    </div>
    <div class="list_menu">
        {foreach from=$menu_list item=menu key=category_id name=menu_list}
            <div class="container">
                <div class="row">
                    <div class="col-sm-3 col-md-2">
                        <div class="img-menu-category">
                            <img src="{base_url}assets/img/{if $category_id == 3}special_lunch{elseif $category_id == 4}a_lunch{elseif $category_id == 5}b_lunch{elseif $category_id == 6}japanese_noodle{elseif $category_id == 7}bowl{/if}.jpg">
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
                                <div class="col-sm-7 col-md-8 col-lg-9">
                                    <div class="font-pop" style="font-size: 18pt;">{$menu_item.menu_name}</div>
                                    <ul class="tag-input-readonly" style="border-color: #fff;font-size: 9pt;margin-left: -5px;">
                                        {assign var="tags" value=","|explode:$menu_item.tag}
                                        {foreach from=$tags item=tag}
                                            <li>{$tag}</li>
                                        {/foreach}
                                    </ul>
                                    <div style="font-size: 10pt;">
                                        <div style="margin: 5px 0 5px 0;"><span style="font-size: 9pt;">アレルゲン：</span>{if $menu_item.allergen}{$menu_item.allergen}{else}なし{/if}</div>
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
                                </div>
                            </div>
                        </div>
                    {/foreach}
                </div>
            </div>
            {if !$smarty.foreach.menu_list.last}<hr style="margin: 0 0 5px 0;"/>{/if}
        {/foreach}
    </div>
{/block}
{block name=footer_right}
    <button type="button" class="btn btn-orange box rd24 font-pop"
            style="font-size: large;width:150px;">
        予約する
    </button>
{/block}
