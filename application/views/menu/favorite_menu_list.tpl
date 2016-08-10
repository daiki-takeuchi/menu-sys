<div class="form-group">
    <div class="row">
        <div class="col-xs-10 col-xs-offset-1">
            <div class="panel panel-default table-responsive">
                <table id="id-tbl-fav-menu" class="table table-sm table-condensed table-hover table-striped table-headerfixed">
                    <thead>
                    <tr style="margin-top:2px;padding: 0;" >
                        <th style="padding-left: 30px;width: 80%;">メニュー</th>
                        <th style="width: 20%;margin-left: -17px;">削除</th>
                    </tr>
                    </thead>
                    <tbody>
                    {foreach from=$favorite_menu_list item=favorite_menu name=favorite_menu}
                        <tr id="{$favorite_menu.menu_id}">
                            <td style="padding-top: 10px;padding-left: 10px;width: 80%;" >
                                <label for="fav_{$favorite_menu.menu_id}" style="width: 100%;height: 100%;">
                                    <input name="rad_fav_menu[]" type="radio" id="fav_{$favorite_menu.menu_id}" value="{$favorite_menu.menu_id}"> {$favorite_menu.menu_name}
                                </label>
                            </td>
                            <td style="padding-top: 7px;padding-left: 0;width: 20%;">
                                <button type="button" class="btn btn-sm btn-default fav-menu-delete rd15"><span class="fa fa-trash"></span></button>
                            </td>
                        </tr>
                    {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>