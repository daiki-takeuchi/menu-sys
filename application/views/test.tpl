{extends file='templates/application.tpl'}
{block name=title}test{/block}
{block name=main_contents}
    <div class="container">
        <div id="news-fixed">
            <div id="news-bk" class="clearfix">
                <span class="label-news rd5 pull-left">お知らせ</span>
                <div class="ticker" rel="slide">
                    <ul>
                        <li>
                            <span class="news-date">2016年7月7日掲載</span>
                            <span class="news-content"><a>【メンテナンスのお知らせ】7月29日(金) 午前6時00分 〜 午前8時00分の間、サーバーメンテナンスのためご利用頂けません。</a></span>
                        </li>
                        <li>
                            <span class="news-date">2016年7月7日掲載</span>
                            <span class="news-content"><a>【News2】このテキストはNewsTicker用のダミーテキスト［2］です。</a></span>
                        </li>
                        <li>
                            <span class="news-date">2016年7月7日掲載</span>
                            <span class="news-content"><a>【News3】このテキストはNewsTicker用のダミーテキスト［3］です。</a></span>
                        </li>
                    </ul>
                </div><!--/.ticker-->
            </div>
        </div>
        <div id="header-fixed">
            <div id="header-bk">
                <div id="header" class="header">
                    <div class="header-cat" align="center" style="width:170px;">
                        <select class="selectpicker show-menu-arrow" data-width="110px">
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
                                                <td align="center"><a class="cal-day cal-selected">7/11(月)</a></td>
                                                <td align="center"><a class="cal-day">7/12(火)</a></td>
                                                <td align="center"><a class="cal-day">7/13(水)</a></td>
                                                <td align="center"><a class="cal-day">7/14(木)</a></td>
                                                <td align="center"><a class="cal-day">7/15(金)</a></td>
                                                <td align="center"><a class="cal-day">7/16(土)</a></td>
                                                <td align="center"><a class="cal-day">7/17(日)</a></td>
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
                                                    <select class="selectpicker show-menu-arrow" data-width="105px">
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
    <div class="list_menu" style="overflow: scroll;">
        <div class="container">
            <div class="row">
                <div class="col-sm-3 col-md-2">
                    <span class="contain" style="background-image: url('/assets/img/special_lunch.jpg')"></span>
                </div>
                <div class="menu col-sm-9 col-md-10">
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
        <hr style="margin: 0 0 5px 0;"/>
        <div class="container">
            <div class="row">
                <div class="col-sm-3 col-md-2">
                    <span class="contain" style="background-image: url('/assets/img/a_lunch.jpg')"></span>
                </div>
                <div class="menu col-sm-9 col-md-10">
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
        <hr style="margin: 0 0 5px 0;"/>
        <div class="container">
            <div class="row">
                <div class="col-sm-3 col-md-2">
                    <span class="contain" style="background-image: url('/assets/img/b_lunch.jpg')"></span>
                </div>
                <div class="menu col-sm-9 col-md-10">
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
        <hr style="margin: 0 0 5px 0;"/>
        <div class="container">
            <div class="row">
                <div class="col-sm-3 col-md-2">
                    <span class="contain" style="background-image: url('/assets/img/japanese_noodle.jpg')"></span>
                </div>
                <div class="menu col-sm-9 col-md-10">
                    <div class="row">
                        <div class="col-lg-3">
                            <span class="cover" style="background-image: url('/assets/img/soba.jpg')"></span>
                        </div>
                        <div class="col-lg-9">
                            <span>aaa</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr style="margin: 0 0 5px 0;"/>
        <div class="container">
            <div class="row">
                <div class="col-sm-3 col-md-2">
                    <span class="contain" style="background-image: url('/assets/img/bowl.jpg')"></span>
                </div>
                <div class="menu col-sm-9 col-md-10">
                    <div class="row">
                        <div class="col-lg-3">
                            <span class="cover" style="background-image: url('/assets/img/oyako.jpg')"></span>
                        </div>
                        <div class="col-lg-9">
                            <span>aaa</span>
                        </div>
                    </div>
                </div>
                <div class="menu col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
                    <hr style="margin: 0 0 5px 0;"/>
                    <div class="row">
                        <div class="col-lg-3">
                            <span class="cover" style="background-image: url('/assets/img/gyudon.jpg')"></span>
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