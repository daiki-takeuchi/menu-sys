{extends file='templates/application.tpl'}
{block name=title}メニュー予約{/block}
{block name=include}
    <link rel="stylesheet" href="{base_url}assets/css/bootstrap-datepicker.min.css"/>
    <script src="{base_url}assets/js/bootstrap-datepicker.min.js"></script>
    <script src="{base_url}assets/js/bootstrap-datepicker.ja.min.js"></script>
    <script src="{base_url}assets/js/ticker.js"></script>
    <script src="{base_url}assets/js/popup-news.js"></script>
{/block}
{block name=main_contents}
    <div class="container">
        {include file='menu/news_ticker.tpl'}
        {include file='menu/header_calendar.tpl'}
    </div>
    <div class="list_menu">
        <div class="container">
            <div class="row">
                <div class="col-sm-3 col-md-2">
                    <div class="img-menu-category">
                        <img src="{base_url}assets/img/special_lunch.jpg">
                    </div>
                </div>
                <div class="menu col-sm-9 col-md-10">
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-lg-3">
                            <div class="img-menu">
                                <img src="{base_url}assets/img/chicken.jpg">
                            </div>
                        </div>
                        <div class="ccol-sm-7 col-md-8 col-lg-9">
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
                    <div class="img-menu-category">
                        <img src="{base_url}assets/img/a_lunch.jpg">
                    </div>
                </div>
                <div class="menu col-sm-9 col-md-10">
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-lg-3">
                            <div class="img-menu">
                                <img src="{base_url}assets/img/mabo.jpg">
                            </div>
                        </div>
                        <div class="ccol-sm-7 col-md-8 col-lg-9">
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
                    <div class="img-menu-category">
                        <img src="{base_url}assets/img/b_lunch.jpg">
                    </div>
                </div>
                <div class="menu col-sm-9 col-md-10">
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-lg-3">
                            <div class="img-menu">
                                <img src="{base_url}assets/img/fish.jpg">
                            </div>
                        </div>
                        <div class="ccol-sm-7 col-md-8 col-lg-9">
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
                    <div class="img-menu-category">
                        <img src="{base_url}assets/img/japanese_noodle.jpg">
                    </div>
                </div>
                <div class="menu col-sm-9 col-md-10">
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-lg-3">
                            <div class="img-menu">
                                <img src="{base_url}assets/img/soba.jpg">
                            </div>
                        </div>
                        <div class="ccol-sm-7 col-md-8 col-lg-9">
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
                    <div class="img-menu-category">
                        <img src="{base_url}assets/img/bowl.jpg">
                    </div>
                </div>
                <div class="menu col-sm-9 col-md-10">
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-lg-3">
                            <div class="img-menu">
                                <img src="{base_url}assets/img/oyako.jpg">
                            </div>
                        </div>
                        <div class="ccol-sm-7 col-md-8 col-lg-9">
                            <span>aaa</span>
                        </div>
                    </div>
                </div>
                <div class="menu col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
                    <hr style="margin: 0 0 5px 0;"/>
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-lg-3">
                            <div class="img-menu">
                                <img src="{base_url}assets/img/gyudon.jpg">
                            </div>
                        </div>
                        <div class="ccol-sm-7 col-md-8 col-lg-9">
                            <span>aaa</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}
{block name=footer_right}
    <button type="button" class="btn btn-orange box rd24 font-pop"
            style="font-size: large;width:150px;">
        予約する
    </button>
{/block}
