{extends file='templates/application.tpl'}
{block name=title}ログイン{/block}
{block name=include_js}
    <script src="{base_url}assets/js/keyboard.js"></script>
    <script src="{base_url}assets/js/login.validation.js"></script>
{/block}
{block name=main_contents}
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-md-12 col-lg-6 col-lg-offset-3">
                <div class="panel panel-default panel-login">
                    <div class="panel-heading" style="background: url('{base_url}assets/img/logo.png') no-repeat 10px center;background-size: 40px;background-color: #ff9900;">食堂メニュー予約システム</div>
                    <div class="panel-body center">
                        {if {validation_errors} != null}
                            <div class="alert alert-danger">{validation_errors}</div>
                        {/if}
                        <div class="row" style="margin: 5px;display: inline-block;">
                            <div class="col-xs-12 bg-light-gray" style="height: 390px; width: 220px;padding-top: 15px;">
                                <div style="text-align: center;"><img class="img-rounded" src="{base_url}assets/img/icon_login.jpg"></div>
                                <form class="form-horizontal" method="post" id="form" data-toggle="validator">
                                    <div class="row" style="padding-top: 20px;">
                                        <div class="col-xs-10 col-xs-offset-1 controls">
                                            <div class="form-group has-feedback">
                                                <input type="text" class="form-control soft_keyboard" name="shain_bn" placeholder="社員番号" style="ime-mode: inactive" required />
                                                <div class="help-block with-errors"></div>
                                                <span class="form-control-feedback"></span>
                                            </div>
                                            <div class="form-group has-feedback">
                                                <input type="password" class="form-control soft_keyboard" name="password" placeholder="パスワード" required />
                                                <div class="help-block with-errors"></div>
                                                <span class="form-control-feedback"></span>
                                            </div>
                                            <div class="form-group">
                                                <button type="submit" name="login" class="btn btn-orange box rd24 font-pop"
                                                        style="font-size: large;width: 190px;">
                                                    <span class="fa fa-sign-in"></span> ログイン&nbsp;&nbsp;
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="row hidden-xs" style="margin: 5px;display: inline-block;">
                            <div class="col-xs-12 bg-light-gray" style="height: 390px;padding-top: 10px;">
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
{/block}