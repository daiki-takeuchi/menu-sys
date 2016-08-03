<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <title>ログイン</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no"/>
    <link rel="stylesheet" href="/assets/css/jquery-ui-1.12.0.min.css"/>
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/assets/css/application.css"/>
    <script src="/assets/js/jquery-2.1.4.min.js"></script>
    <script src="/assets/js/jquery-ui-1.12.0.min.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/application.js"></script>
    {include file='templates/shim.tpl'}
</head>
<body>
<form method="post">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6 col-lg-offset-3">
                <div class="panel panel-default panel-login">
                    <div class="panel-heading">食堂メニュー予約システム</div>
                    <div class="panel-body center">
                        <div class="row" style="margin: 5px;display: inline-block;">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bg-light-gray" style="height: 380px;padding-top: 10px;">
                                <div style="text-align: center;"><img class="img-rounded" src="/assets/img/a_lunch.jpg"></div>
                                <div class="row" style="padding-top: 30px;">
                                    <div class="col-sm-12 controls">
                                        <div class="form-group">
                                            <div class='input-group'>
                                                <input type="text" class="form-control" name="shain_id" placeholder="社員番号" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class='input-group'>
                                                <input type="password" class="form-control" name="password" placeholder="パスワード" />
                                            </div>
                                        </div>
                                        <a href="#" class="font-pop"">パスワードがわからない場合はこちらをクリック</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin: 5px;display: inline-block;">
                            <div class="spNone">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bg-light-gray" style="height: 380px;padding-top: 10px;">
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
                                        <button type="button" class="btn-keyboard" style="width: 175px;">BackSpace</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-offset-8 col-sm-4 col-md-offset-8 col-md-4 col-lg-offset-8 col-lg-4">
                                <button type="submit" name="login" class="btn btn-orange btn-sm box rd24 font-pop"
                                        style="font-size: large;">
                                    <span class="fa fa-sign-in"></span>　ログイン&nbsp;&nbsp;
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>