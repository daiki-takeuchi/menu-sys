<div id="header-fixed">
    <div id="header-bk">
        <div id="header" class="header">
            <div class="header-cat" align="center" style="width:170px;">
                {html_options class="selectpicker show-menu-arrow target-category" data-width="100px" data-selected-date=$selected_date|date_format:'Y/n/j' data-page=$page name="target-category" options=$kubun selected=$selected_kubun}
            </div>
            <div class="header-cal">
                <table style="margin-right: 15px;">
                    <tr>
                        <td>
                            <div align="center" style="height:45px;padding-top:9px;">
                                <a href="{base_url}menu/{if $page == 'menu_list'}list/{/if}{$selected_kubun}/{$last_monday|date_format:'Y/n/j'}" class="btn btn-orange btn-sm box rd15">
                                    <span class="fa fa-arrow-left"></span> <span class="spNone">前の週</span>
                                </a>
                            </div>
                        </td>
                        <td>
                            <div class="bg-light-gray spNone1024" align="center"
                                 style="height:50px;margin: 0 20px 0 20px;">
                                <table style="table-layout:fixed;" width="100%">
                                    <tr height="28px;">
                                        {foreach from=$week item=date key=day_of_week}
                                        <td align="center">
                                            <a href="{base_url}menu/{if $page == 'menu_list'}list/{/if}{$selected_kubun}/{$date|date_format:'Y/n/j'}" class="cal-day{if $date === $selected_date} cal-selected{/if}">
                                                {$date|date_format:'n/j'}({$day_of_week})
                                            </a>
                                        </td>
                                        {/foreach}
                                    </tr>
                                    {if $page == 'index'}
                                    <tr>
                                        {foreach from=$reservation item=is_reserved}
                                            <td class="menu_reserved">{if $is_reserved}予約済み{/if}</td>
                                        {/foreach}
                                    </tr>
                                    {/if}
                                </table>
                            </div>
                            <div class="ltNone1024" align="center"
                                 style="margin: 0 5px 0 5px;">
                                <table style="table-layout:fixed;" width="100%">
                                    <tr>
                                        <td align="center">
                                            <select class="selectpicker show-menu-arrow select-date" data-width="105px">
                                                {foreach from=$week item=date key=day_of_week}
                                                <option value="{if $page == 'menu_list'}list/{/if}{$selected_kubun}/{$date|date_format:'Y/n/j'}"{if $date === $selected_date} selected{/if}>
                                                    {$date|date_format:'n/j'}({$day_of_week})
                                                </option>
                                                {/foreach}
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="menu_reserved">{if isset($reservation[$selected_date]) && $reservation[$selected_date]}予約済み{/if}</td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                        <td>
                            <div align="center" style="height:45px;padding-top:9px;">
                                {if $next_week_menu_exists}
                                <a href="{base_url}menu/{if $page == 'menu_list'}list/{/if}{$selected_kubun}/{$next_monday|date_format:'Y/n/j'}" type="button" class="btn btn-orange btn-sm box rd15">
                                    <span class="spNone">次の週</span> <span class="fa fa-arrow-right"></span>
                                </a>
                                {/if}
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <hr style="margin: 5px 0 5px 0;"/>
    </div>
</div>