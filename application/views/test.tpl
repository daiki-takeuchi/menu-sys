{extends file='templates/application.tpl'}
{block name=title}test{/block}
{block name=main_contents}
    <div class="container">
        <div id="header-fixed">
            <div id="header-bk">
                <div id="header" class="header">
                    <div class="header-cat" align="center" style="width:170px;">
                        <div class="btn-group">
                            <button class="btn btn-default btn-sm" type="button" data-toggle="dropdown"
                                    style="width:80px;">
                                <span id="visibleValue">Lunch</span>
                            </button>
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu" hiddenTag="#hiddenValue" visibleTag="#visibleValue">
                                <li><a href="javascript:void(0)" value="Breakfast">Breakfast</a></li>
                                <li><a href="javascript:void(0)" value="Lunch">Lunch</a></li>
                                <li><a href="javascript:void(0)" value="Dinner">Dinner</a></li>
                            </ul>
                            <input type="hidden" id="hiddenValue" value="">
                        </div>
                    </div>
                    <div class="header-cal">
                        <table style="margin-right: 30px;">
                            <tr>
                                <td>
                                    <div align="center" style="height:45px;padding-top:9px;">
                                        <button type="button" class="btn btn-orange btn-sm box rd15">
                                            <span class="fa fa-arrow-left"></span> 前の週
                                        </button>
                                    </div>
                                </td>
                                <td>
                                    <div class="bg-light-gray" align="center"
                                         style="height:50px;margin: 0 20px 0 20px;">
                                        <table style="table-layout:fixed;" width="100%">
                                            <tr>
                                                <td align="center"><span class="cal-sel rd8">7/11(月)</span></td>
                                                <td align="center">7/12(火)</td>
                                                <td align="center">7/13(水)</td>
                                                <td align="center">7/14(木)</td>
                                                <td align="center">7/15(金)</td>
                                                <td align="center">7/16(土)</td>
                                                <td align="center">7/17(日)</td>
                                            </tr>
                                            <tr>
                                                <td align="center" style="font-size: x-small;color: #999">予約済み</td>
                                                <td align="center" style="font-size: x-small;color: #999">予約済み</td>
                                                <td align="center" style="font-size: x-small;color: #999">予約済み</td>
                                                <td align="center"></td>
                                                <td align="center"></td>
                                                <td align="center"></td>
                                                <td align="center"></td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                                <td>
                                    <div align="center" style="height:45px;padding-top:9px;">
                                        <button type="button" class="btn btn-orange btn-sm box rd15">
                                            次の週 <span class="fa fa-arrow-right"></span>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <hr style="margin:0;"/>
            </div>
        </div>
    </div>
    </div>
    <hr style="margin: 5px 0 5px 0;"/>
    <div class="list_menu" style="overflow: scroll">
        <div class="container">
            <div style="width:100%">
                <div class="pull-right" style="width: 80%;">
                    <div class="menu">
                        <span class="cover" style="background-image: url('/assets/img/チキンカツ.jpg')"></span>
                    </div>
                </div>
                <div class="category pull-left" style="width: 20%;">
                    <span class="contain" style="background-image: url('/assets/img/Special Lunch.png')"></span>
                </div>
            </div>
        </div>
        <hr style="margin: 5px 0 5px 0;"/>
        <div class="container">
            <div style="width:100%">
                <div class="pull-right" style="width: 80%;">
                    <div class="menu">
                        <span class="cover" style="background-image: url('/assets/img/麻婆豆腐.jpg')"></span>
                    </div>
                </div>
                <div class="category pull-left" style="width: 20%;">
                    <span class="contain" style="background-image: url('/assets/img/A Lunch.png')"></span>
                </div>
            </div>
        </div>
        <hr style="margin: 5px 0 5px 0;"/>
        <div class="container">
            <div style="width:100%">
                <div class="pull-right" style="width: 80%;">
                    <div class="menu">
                        <span class="cover" style="background-image: url('/assets/img/お魚定食.jpg')"></span>
                    </div>
                </div>
                <div class="category pull-left" style="width: 20%;">
                    <span class="contain" style="background-image: url('/assets/img/B Lunch.png')"></span>
                </div>
            </div>
        </div>
        <hr style="margin: 5px 0 5px 0;"/>
        <div class="container">
            <div style="width:100%">
                <div class="pull-right" style="width: 80%;">
                    <div class="menu">
                        <span class="cover" style="background-image: url('/assets/img/チキンカツ.jpg')"></span>
                    </div>
                    <hr style="margin: 10px 0 10px 0;"/>
                    <div class="menu">
                        <span class="cover" style="background-image: url('/assets/img/チキンカツ.jpg')"></span>
                    </div>
                </div>
                <div class="category pull-left" style="width: 20%;">
                    <span class="contain" style="background-image: url('/assets/img/Special Lunch.png')"></span>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer">
        <hr style="margin: 5px 0 5px 0;"/>
        <div class="container">
            <div class="pull-right" align="center" style="height:45px;padding-top:9px;">
                <button type="button" class="btn btn-orange btn-sm box rd24 font-pop"
                        style="font-size: large;width:150px;">
                    予約する
                </button>
            </div>
        </div>
    </footer>
{/block}