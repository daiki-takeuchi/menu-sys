{extends file='templates/application.tpl'}
{block name=title}test{/block}
{block name=include}
    <link rel="stylesheet" href="/assets/css/bootstrap-datepicker.min.css"/>
    <script src="/assets/js/bootstrap-datepicker.min.js"></script>
    <script src="/assets/js/bootstrap-datepicker.ja.min.js"></script>
    <script src="/assets/js/ticker.js"></script>
{/block}
{block name=main_contents}
    <div class="container">
        {include file='menus/news_ticker.tpl'}
        {include file='menus/header_calendar.tpl'}
    </div>
    <div class="list_menu">
        <div class="container">
            <div class="row">
                <div class="col-sm-3 col-md-2">
                    <span class="contain" style="background-image: url('/assets/img/special_lunch.jpg')"></span>
                </div>
                <div class="menu col-sm-9 col-md-10">
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-lg-3">
                            <span class="cover" style="background-image: url('/assets/img/chicken.jpg')"></span>
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
                    <span class="contain" style="background-image: url('/assets/img/a_lunch.jpg')"></span>
                </div>
                <div class="menu col-sm-9 col-md-10">
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-lg-3">
                            <span class="cover" style="background-image: url('/assets/img/mabo.jpg')"></span>
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
                    <span class="contain" style="background-image: url('/assets/img/b_lunch.jpg')"></span>
                </div>
                <div class="menu col-sm-9 col-md-10">
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-lg-3">
                            <span class="cover" style="background-image: url('/assets/img/fish.jpg')"></span>
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
                    <span class="contain" style="background-image: url('/assets/img/japanese_noodle.jpg')"></span>
                </div>
                <div class="menu col-sm-9 col-md-10">
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-lg-3">
                            <span class="cover" style="background-image: url('/assets/img/soba.jpg')"></span>
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
                    <span class="contain" style="background-image: url('/assets/img/bowl.jpg')"></span>
                </div>
                <div class="menu col-sm-9 col-md-10">
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-lg-3">
                            <span class="cover" style="background-image: url('/assets/img/oyako.jpg')"></span>
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
                            <span class="cover" style="background-image: url('/assets/img/gyudon.jpg')"></span>
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
{block name=footer-right}
    <button type="button" class="btn btn-orange btn-sm box rd24 font-pop"
            style="font-size: large;width:150px;">
        予約する
    </button>
{/block}
