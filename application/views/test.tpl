{extends file='templates/application.tpl'}
{block name=title}test{/block}
{block name=main_contents}
    <div class="container">
        <div id="news-fixed">
            <div id="news-bk">
                <span class="label-news rd5" style="float: left;">お知らせ</span>
                <div class="ticker" rel="slide">
                    <ul>
                        <li>
                            <span class="news-date" style="padding-left: 10px;">2016年7月7日掲載</span>
                            <span class="news-content" style="padding-left: 10px;">【メンテナンスのお知らせ】7月29日(金) 午前6時00分 〜 午前8時00分の間、サーバーメンテナンスのためご利用頂けません。</span>
                        </li>
                        <li>
                            <span class="news-date" style="padding-left: 10px;">2016年7月7日掲載</span>
                            <span class="news-content" style="padding-left: 10px;">【News2】このテキストはNewsTicker用のダミーテキスト［2］です。</span>
                        </li>
                        <li>
                            <span class="news-date" style="padding-left: 10px;">2016年7月7日掲載</span>
                            <span class="news-content" style="padding-left: 10px;">【News2】このテキストはNewsTicker用のダミーテキスト［2］です。</span>
                        </li>
                    </ul>
                </div><!--/.ticker-->
            </div>
        </div>
        <div id="header-fixed">
            <div id="header-bk">
                <div id="header" class="header">
                    <div class="header-cat" align="center" style="width:170px;">
                        <select class="selectpicker" data-width="110px">
                            <option value="1">Breakfast</option>
                            <option value="2" selected>Lunch</option>
                            <option value="3">Dinner</option>
                        </select>
                    </div>
                    <div class="header-cal">
                        <table style="margin-right: 15px;">
                            <tr>
                                <td>
                                    <div align="center" style="height:45px;padding-top:9px;">
                                        <button type="button" class="btn btn-orange btn-sm box rd15">
                                            <span class="fa fa-arrow-left"></span> <span class="spNone">前の週</span>
                                        </button>
                                    </div>
                                </td>
                                <td>
                                    <div class="bg-light-gray spNone1024" align="center"
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
                                    <div class="ltNone1024" align="center"
                                         style="margin: 0 5px 0 5px;">
                                        <table style="table-layout:fixed;" width="100%">
                                            <tr>
                                                <td align="center">
                                                    <select class="selectpicker" data-width="105px">
                                                        <option value="20160711" selected>7/11(月)</option>
                                                        <option value="20160712">7/12(火)</option>
                                                        <option value="20160713">7/13(水)</option>
                                                        <option value="20160714">7/14(木)</option>
                                                        <option value="20160715">7/15(金)</option>
                                                        <option value="20160716">7/16(土)</option>
                                                        <option value="20160717">7/17(日)</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" style="font-size: x-small;color: #999">予約済み</td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                                <td>
                                    <div align="center" style="height:45px;padding-top:9px;">
                                        <button type="button" class="btn btn-orange btn-sm box rd15">
                                            <span class="spNone">次の週</span> <span class="fa fa-arrow-right"></span>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <hr style="margin: 5px 0 5px 0;"/>
            </div>
        </div>
    </div>
    <div class="list_menu" style="overflow: scroll">
        <div class="container">
            <div class="row">
                <div class="col-sm-2">
                    <span class="contain" style="background-image: url('/assets/img/Special Lunch.png')"></span>
                </div>
                <div class="menu col-sm-10">
                    <div class="row">
                        <div class="col-lg-3">
                            <span class="cover" style="background-image: url('/assets/img/chicken.jpg')"></span>
                        </div>
                        <div class="col-lg-9">
                            <span>aaa</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr style="margin: 5px 0 5px 0;"/>
        <div class="container">
            <div class="row">
                <div class="col-sm-2">
                    <span class="contain" style="background-image: url('/assets/img/A Lunch.png')"></span>
                </div>
                <div class="menu col-sm-10">
                    <div class="row">
                        <div class="col-lg-3">
                            <span class="cover" style="background-image: url('/assets/img/mabo.jpg')"></span>
                        </div>
                        <div class="col-lg-9">
                            <span>aaa</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr style="margin: 5px 0 5px 0;"/>
        <div class="container">
            <div class="row">
                <div class="col-sm-2">
                    <span class="contain" style="background-image: url('/assets/img/B Lunch.png')"></span>
                </div>
                <div class="menu col-sm-10">
                    <div class="row">
                        <div class="col-lg-3">
                            <span class="cover" style="background-image: url('/assets/img/fish.jpg')"></span>
                        </div>
                        <div class="col-lg-9">
                            <span>aaa</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr style="margin: 5px 0 5px 0;"/>
        <div class="container">
            <div class="row">
                <div class="col-sm-2">
                    <span class="contain" style="background-image: url('/assets/img/Special Lunch.png')"></span>
                </div>
                <div class="menu col-sm-10">
                    <div class="row">
                        <div class="col-lg-3">
                            <span class="cover" style="background-image: url('/assets/img/chicken.jpg')"></span>
                        </div>
                        <div class="col-lg-9">
                            <span>aaa</span>
                        </div>
                    </div>
                </div>
                <div class="menu col-sm-10 col-sm-offset-2">
                    <hr style="margin: 10px 0 10px 0;"/>
                    <div class="row">
                        <div class="col-lg-3">
                            <span class="cover" style="background-image: url('/assets/img/chicken.jpg')"></span>
                        </div>
                        <div class="col-lg-9">
                            <span>aaa</span>
                        </div>
                    </div>
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