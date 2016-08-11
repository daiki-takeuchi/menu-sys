{extends file='templates/application.tpl'}
{block name=title}ユーザー管理{/block}
{block name=include_js}
    <script src="{base_url}assets/js/user.js"></script>
{/block}
{block name=main_contents}
    <div class="container">
        <div class="bg-light-gray" style="padding: 5px 10px 5px 10px;">
            <div class="row">
                <div class="col-xs-12">
                    <div style="font-size: 12pt;">
                        <span class="fa fa-search"></span><span class="font-pop"> 絞り込み</span>
                    </div>
                    <form class="form-horizonta" method="post">
                        <div class="row">
                            <div class='form-group'>
                                <div class="col-xs-10 col-xs-offset-1 col-md-3 col-lg-4" style="margin-bottom: 5px;">
                                    <div class='input-group'>
                                        <span class="input-group-addon">名前</span>
                                        <input type="text" class="form-control" name="name" />
                                    </div>
                                </div>
                                <div class="col-xs-10 col-xs-offset-1 col-md-4 col-md-pull-1" style="margin-bottom: 5px;z-index: 1;">
                                    <div class='input-group'>
                                        <span class="input-group-addon">組織</span>
                                        {html_options name="sel_organization" options=$organization data-width="fit"
                                        data-live-search="true" class="selectpicker show-menu-arrow" title="組織を選択してください"
                                        data-size="8" data-actions-box="true" data-selected-text-format="count > 1" multiple="multiple"}
                                    </div>
                                </div>
                                <div class="col-xs-10 col-xs-offset-1 col-md-2 col-lg-1 col-lg-pull-1">
                                    <button class="btn btn-orange box rd24 font-pop pull-right" style="font-size: large;">
                                        <span class="fa fa-search"></span> 検索
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="bg-light-gray" style="padding: 5px;margin-top: 5px;">
            <div class="row">
                <div class="col-xs-10 col-xs-offset-1 col-md-10 col-md-offset-1">
                    <div id="file_error"></div>
                </div>
                <div class="col-xs-10 col-xs-offset-1 col-md-5 col-md-offset-1">
                    <input type="file" name="user_csv" class="csv_file" style="display: none;" accept="text/csv" />
                    <div class="input-group">
                        <span class="input-group-addon user_csv_group">
                            <span class="fa fa-file"></span>
                        </span>
                        <input type="text" class="form-control txt_user_csv user_csv_group" readonly placeholder="登録用CSVを選択して下さい">
                        <span class="input-group-btn">
                            <button class="btn btn-success btn-batch-register"> 一括登録</button>
                        </span>
                    </div>
                </div>
                <div class="col-xs-10 col-xs-offset-1">
                    <span>ユーザー登録用CSVテンプレートのダウンロードは<a href="#">こちら</a></span>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <ul class="pager" style="margin: 5px 0 5px 0;">
            <li class=""><a href="#">&lt; 前<span class="spNone">のページ</span></a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li class=""><a href="#">次<span class="spNone">のページ</span> &gt;</a></li>
        </ul>
        <div class="hidden" style="height: 32px;margin: 5px 0 5px 0;"></div>
        <div class="panel panel-default table-responsive">
            <table id="id-tbl-fav-menu" class="table table-sm table-condensed table-hover table-striped">
                <thead>
                <tr>
                    <th>名前</th>
                    <th style="text-align: center;">社員番号</th>
                    <th style="text-align: center;">雇用形態</th>
                    <th>会社</th>
                    <th>組織</th>
                    <th style="text-align: center;">メニュー登録</th>
                    <th style="text-align: center;">ユーザー管理</th>
                    <th style="text-align: center;">パスワードリセット</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td style="padding-top: 10px;"><a href="{base_url}user/edit/1">山田　太郎</a></td>
                    <td style="text-align: center;padding-top: 10px;">12345678</td>
                    <td style="text-align: center;padding-top: 10px;">正社員</td>
                    <td style="padding-top: 10px;">クノール食品（株）</td>
                    <td style="padding-top: 10px;">総務・人事部　労務G</td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-circle-o"></span></td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-circle-o"></span></td>
                    <td style="text-align: center;">
                        <button type="button" class="btn btn-sm btn-delete btn-pw-reset rd15 font-pop">リセット</button>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 10px;"><a href="{base_url}user/edit/2">鈴木　一郎</a></td>
                    <td style="text-align: center;padding-top: 10px;">23456789</td>
                    <td style="text-align: center;padding-top: 10px;">正社員</td>
                    <td style="padding-top: 10px;">クノール食品（株）</td>
                    <td style="padding-top: 10px;">総務・人事部　労務G</td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-times"></span></td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-times"></span></td>
                    <td style="text-align: center;">
                        <button type="button" class="btn btn-sm btn-delete btn-pw-reset rd15 font-pop">リセット</button>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 10px;"><a href="{base_url}user/edit/3">本田　圭介</a></td>
                    <td style="text-align: center;padding-top: 10px;">34567890</td>
                    <td style="text-align: center;padding-top: 10px;">正社員</td>
                    <td style="padding-top: 10px;">クノールサービス（株）</td>
                    <td style="padding-top: 10px;">クノールサービス株式会社</td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-circle-o"></span></td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-times"></span></td>
                    <td style="text-align: center;">
                        <button type="button" class="btn btn-sm btn-delete btn-pw-reset rd15 font-pop">リセット</button>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 10px;"><a href="{base_url}user/edit/4">吉田　隆一</a></td>
                    <td style="text-align: center;padding-top: 10px;">45678901</td>
                    <td style="text-align: center;padding-top: 10px;">嘱託・契約社員</td>
                    <td style="padding-top: 10px;">クノール食品（株）</td>
                    <td style="padding-top: 10px;">開発技術Ｃ　開発管理部　管理Ｇ</td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-times"></span></td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-times"></span></td>
                    <td style="text-align: center;">
                        <button type="button" class="btn btn-sm btn-delete btn-pw-reset rd15 font-pop">リセット</button>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 10px;"><a href="{base_url}user/edit/5">佐藤　花子</a></td>
                    <td style="text-align: center;padding-top: 10px;">56789012</td>
                    <td style="text-align: center;padding-top: 10px;">派遣社員</td>
                    <td style="padding-top: 10px;">クノール食品（株）</td>
                    <td style="padding-top: 10px;">生産Ｃ　川崎事業所　管理部　総務課</td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-times"></span></td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-times"></span></td>
                    <td style="text-align: center;">
                        <button type="button" class="btn btn-sm btn-delete btn-pw-reset rd15 font-pop">リセット</button>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 10px;"><a href="{base_url}user/edit/6">田中　紀子</a></td>
                    <td style="text-align: center;padding-top: 10px;">67890123</td>
                    <td style="text-align: center;padding-top: 10px;">パート</td>
                    <td style="padding-top: 10px;">クノールトレーディング（株）</td>
                    <td style="padding-top: 10px;">クノールトレーディング株式会社</td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-times"></span></td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-times"></span></td>
                    <td style="text-align: center;">
                        <button type="button" class="btn btn-sm btn-delete btn-pw-reset rd15 font-pop">リセット</button>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 10px;"><a href="{base_url}user/edit/7">山田　栞</a></td>
                    <td style="text-align: center;padding-top: 10px;">78901234</td>
                    <td style="text-align: center;padding-top: 10px;">正社員</td>
                    <td style="padding-top: 10px;">クノール食品（株）</td>
                    <td style="padding-top: 10px;">総務・人事部　労務G</td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-times"></span></td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-times"></span></td>
                    <td style="text-align: center;">
                        <button type="button" class="btn btn-sm btn-delete btn-pw-reset rd15 font-pop">リセット</button>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 10px;"><a href="{base_url}user/edit/8">安倍　綾子</a></td>
                    <td style="text-align: center;padding-top: 10px;">89012345</td>
                    <td style="text-align: center;padding-top: 10px;">正社員</td>
                    <td style="padding-top: 10px;">クノール食品（株）</td>
                    <td style="padding-top: 10px;">開発技術Ｃ　洋風ソース開発部　洋風ソース開発第１Ｇ</td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-times"></span></td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-times"></span></td>
                    <td style="text-align: center;">
                        <button type="button" class="btn btn-sm btn-delete btn-pw-reset rd15 font-pop">リセット</button>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 10px;"><a href="{base_url}user/edit/9">加藤　健</a></td>
                    <td style="text-align: center;padding-top: 10px;">90123456</td>
                    <td style="text-align: center;padding-top: 10px;">正社員</td>
                    <td style="padding-top: 10px;">クノール食品（株）</td>
                    <td style="padding-top: 10px;">生産Ｃ　生産統括部</td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-times"></span></td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-times"></span></td>
                    <td style="text-align: center;">
                        <button type="button" class="btn btn-sm btn-delete btn-pw-reset rd15 font-pop">リセット</button>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 10px;"><a href="{base_url}user/edit/10">速水　尚道</a></td>
                    <td style="text-align: center;padding-top: 10px;">01234567</td>
                    <td style="text-align: center;padding-top: 10px;">正社員</td>
                    <td style="padding-top: 10px;">クノール食品（株）</td>
                    <td style="padding-top: 10px;">総務・人事部　労務G</td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-times"></span></td>
                    <td style="text-align: center;padding-top: 10px;"><span class="fa fa-times"></span></td>
                    <td style="text-align: center;">
                        <button type="button" class="btn btn-sm btn-delete btn-pw-reset rd15 font-pop">リセット</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
{/block}
{block name=footer_right}
    <a href="{base_url}user/new" class="btn btn-orange btn-sm box rd24 font-pop"
            style="font-size: large;width:150px;">
        <span class="fa fa-plus"></span> ユーザー登録
    </a>
{/block}
