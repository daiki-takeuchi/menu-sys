{extends file='templates/application.tpl'}
{block name=title}パスワード変更{/block}
{block name=main_contents}
    <div class="container">
        <div class="row center">
            <div class="col-xs-8 col-xs-offset-2">
                <div class="alert alert-success text-hide" style="height: 50px;text-align: left;margin-bottom: 5px;"></div>
                <div class="row" style="margin: 5px;display: inline-block;">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bg-light-gray" style="height: 380px;padding-top: 10px;">
                        <div class="row" style="padding-top: 50px;">
                            <div class="col-sm-12 controls">
                                <div class="form-group" style="text-align: left;">
                                    <label><span class="label-required rd5">必須</span> 現在のパスワード</label>
                                    <div class='input-group'>
                                        <input type="password" class="form-control soft_keyboard" name="old_password" placeholder="現在のパスワード" />
                                    </div>
                                </div>
                                <div class="form-group" style="text-align: left;">
                                    <label><span class="label-required rd5">必須</span> 新しいパスワード</label>
                                    <div class='input-group'>
                                        <input type="password" class="form-control soft_keyboard" name="new_password" placeholder="新しいパスワード" />
                                    </div>
                                </div>
                                <div class="form-group" style="text-align: left;">
                                    <label><span class="label-required rd5">必須</span> 新しいパスワード（確認）</label>
                                    <div class='input-group'>
                                        <input type="password" class="form-control soft_keyboard" name="new_password_confirmation" placeholder="新しいパスワード（確認）" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin: 5px;display: inline-block;">
                    <div class="spNone1024">
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
            </div>
        </div>
        <div class="row">
            <div class="col-xs-offset-4 col-xs-8 col-sm-offset-5 col-sm-7 col-md-offset-6 col-md-7 col-lg-offset-7 col-lg-5">
                <button type="submit" name="login" class="btn btn-orange btn-sm box rd24 font-pop"
                        style="font-size: large;">
                    <span class="glyphicon glyphicon-saved"></span>　パスワードを変更&nbsp;&nbsp;
                </button>
            </div>
        </div>
    </div>
{/block}