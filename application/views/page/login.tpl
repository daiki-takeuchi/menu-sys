{extends file='templates/application.tpl'}
{block name=title}ログイン{/block}
{block name=include}{/block}
{block name=main_contents}
<form method="post">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-md-12 col-lg-6 col-lg-offset-3">
                <div class="panel panel-default panel-login">
                    <div class="panel-heading">食堂メニュー予約システム</div>
                    <div class="panel-body center">
                        <div class="row" style="margin: 5px;display: inline-block;">
                            <div class="col-xs-12 bg-light-gray" style="height: 380px; width: 220px;padding-top: 15px;">
                                <div style="text-align: center;"><img class="img-rounded" src="{base_url}assets/img/a_lunch.jpg"></div>
                                <div class="row" style="padding-top: 20px;">
                                    <div class="col-xs-12 controls">
                                        <div class="form-group">
                                            <input type="text" class="form-control soft_keyboard" name="shain_id" placeholder="社員番号" />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control soft_keyboard" name="password" placeholder="パスワード" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <button type="submit" name="login" class="btn btn-orange btn-sm box rd24 font-pop"
                                                style="font-size: large;">
                                            <span class="fa fa-sign-in"></span> ログイン&nbsp;&nbsp;
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin: 5px;display: inline-block;">
                            <div class="hidden-xs">
                                <div class="col-xs-12 bg-light-gray" style="height: 380px;padding-top: 10px;">
                                    <div>
                                        <button type="button" class="btn-keyboard">1</button>
                                        <button type="button" class="btn-keyboard">2</button>
                                        <button type="button" class="btn-keyboard">3</button>
                                    </div>
                                    <div>
                                        <button type="button" class="btn-keyboard">4</button>
                                        <button type="button" class="btn-keyboard">5</button>
                                        <button type="button" class="btn-keyboard">6</button>
                                    </div>
                                    <div>
                                        <button type="button" class="btn-keyboard">7</button>
                                        <button type="button" class="btn-keyboard">8</button>
                                        <button type="button" class="btn-keyboard">9</button>
                                    </div>
                                    <div>
                                        <button type="button" class="btn-keyboard">0</button>
                                        <button type="button" class="btn-keyboard" style="width: 155px;">BackSpace</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <a href="#" class="font-pop">パスワードがわからない場合はこちらをクリック</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
{/block}