{extends file='templates/application.tpl'}
{block name=title}パスワード変更{/block}
{block name=include_js}
    <script src="{base_url}assets/js/keyboard.js"></script>
    <script src="{base_url}assets/js/page.js"></script>
{/block}
{block name=main_contents}
    <div class="container-fluid">
        <div class="row center">
            <div class="col-xs-12">
                <div class="row">
                    <div class="col-xs-12 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3">
                        <div class="alert alert-success {if empty($message)}text-hide{/if}" style="text-align: left;margin-bottom: 2px;">
                            {$message}
                        </div>
                        {if {validation_errors} != null}
                            <div class="alert alert-danger">{validation_errors}</div>
                        {/if}
                    </div>
                </div>
                <div class="row" style="margin: 5px;display: inline-block;">
                    <div class="col-xs-12 bg-light-gray" style="height: 380px;width: 300px;padding-top: 15px;">
                        <div class="row" style="padding-top: 30px;">
                            <form class="form-horizontal" method="post" id="form">
                                <div class="col-xs-10 col-xs-offset-1">
                                    <div class="form-group has-feedback" style="text-align: left;">
                                        <label><span class="label-required rd5">必須</span> 現在のパスワード</label>
                                        <input type="password" class="form-control soft_keyboard" name="old_password" placeholder="現在のパスワード" required />
                                        <div class="help-block with-errors"></div>
                                        <span class="form-control-feedback"></span>
                                    </div>
                                    <div class="form-group has-feedback" style="text-align: left;">
                                        <label><span class="label-required rd5">必須</span> 新しいパスワード</label>
                                        <input type="password" class="form-control soft_keyboard" name="new_password" placeholder="新しいパスワード" required />
                                        <div class="help-block with-errors"></div>
                                        <span class="form-control-feedback"></span>
                                    </div>
                                    <div class="form-group has-feedback" style="text-align: left;">
                                        <label><span class="label-required rd5">必須</span> 新しいパスワード（確認）</label>
                                        <input type="password" class="form-control soft_keyboard" name="new_password_confirmation" data-rule-equalTo="[name='new_password']" placeholder="新しいパスワード（確認）" required />
                                        <div class="help-block with-errors"></div>
                                        <span class="form-control-feedback"></span>
                                    </div>
                                    <button type="button" id="pwchange" class="btn btn-orange box rd24 font-pop"
                                            style="font-size: large;">
                                        <span class="glyphicon glyphicon-saved"></span> パスワードを変更&nbsp;&nbsp;
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin: 5px;display: inline-block;">
                    <div class="spNone1024">
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
            </div>
        </div>
    </div>
    <input type="hidden" id="hid_alert" value="{$gender}" />
{/block}