{extends file='templates/application.tpl'}
{block name=title}{$title}{/block}
{block name=include_css}
    <link rel="stylesheet" href="{base_url}assets/css/bootstrap-datepicker.min.css"/>
    <link rel="stylesheet" href="{base_url}assets/css/jquery.fileupload.css">
    <link rel="stylesheet" href="{base_url}assets/css/jquery.tagit.css">
    <link rel="stylesheet" href="{base_url}assets/css/tag-input.css">
{/block}
{block name=include_js}
    <script src="{base_url}assets/js/bootstrap-datepicker.min.js"></script>
    <script src="{base_url}assets/js/bootstrap-datepicker.ja.min.js"></script>
    <script src="{base_url}assets/js/tag-it.min.js"></script>
    <script src="{base_url}assets/js/menu.js"></script>

    <script src="{base_url}assets/js/jquery.iframe-transport.js"></script>
    <script src="{base_url}assets/js/jquery.fileupload.js"></script>
    <script src="{base_url}assets/js/holder.min.js"></script>
    <script src="{base_url}assets/js/image-upload.js"></script>
{/block}
{block name=main_contents}
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-push-4">
                <div class="row">
                    <div class="col-xs-10 col-xs-offset-1" style="padding-right: 0;">
                        <button type="button" class="btn btn-success btn-xs pull-right {if $id}register-favorite-menu{else}select-favorite-menu{/if}" style="margin: 5px 0 5px 0;">
                            {if $id}
                                このメニューを「よく使うメニュー」として登録
                            {else}
                                「よく使うメニュー」から選ぶ
                            {/if}
                        </button>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-4 center">
                <span class="fileinput-button">
                    <div class="img-thumbnail img-menu-form">
                        <img class="img-responsive" id="img-menu" data-src="holder.js/300x210?text=ここをクリックして画像を登録">
                    </div>
                    <input id="fileupload" type="file" name="files[]" accept="image/png, image/jpeg, image/gif" />
                </span>
                <div id="progress" class="progress hidden">
                    <div class="progress-bar progress-bar-success"></div>
                </div>
                <div id="files" class="files"></div>
            </div>
            <form class="form-horizontal" method="post" id="form">
                <div class="col-md-8 pull-right">
                    <div class="row">
                        <div class="col-xs-10 col-xs-offset-1">
                            <div class="row">
                                <div class="col-sm-5">
                                    <div class="form-group">
                                        <label><span class="label-required rd5">必須</span> メニュー提供日</label>
                                        <div class='input-group date'>
                                            <span class="input-group-addon">
                                                <span class="fa fa-calendar"></span>
                                            </span>
                                            <input type="text" class="form-control" style="min-width: 120px;" name="menu-provide-date" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-5 col-sm-offset-2">
                                    <div class="form-group">
                                        <label><span class="label-required rd5">必須</span> メニュー公開日</label>
                                        <div class='input-group date'>
                                            <span class="input-group-addon">
                                                <span class="fa fa-calendar"></span>
                                            </span>
                                            <input type="text" class="form-control" style="min-width: 120px;" name="menu-open-date" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label><span class="label-required rd5">必須</span> メニュー名</label>
                                <input type="text" class="form-control" name="nemu_name" />
                            </div>
                            <div class="form-group">
                                <label> タグ（"減塩"や"ヘルシーメニュー"等の強調したい文字を入力してください。）</label>
                                <input type="text" class="form-control tag-input" name="tag" />
                            </div>
                            <div class="form-group">
                                <label><span class="label-required rd5">必須</span> カテゴリ</label><br />
                                {html_options name="sel_category" options=$category data-width="175px" class="selectpicker show-menu-arrow" title=" "}
                            </div>
                            <div class="form-group" style="margin-bottom: 0">
                                <label><span class="label-required rd5">必須</span> 価格</label>
                            </div>
                            <div class="row">
                                <div class="col-xs-5">
                                    <div class="form-group">
                                        <div class='input-group'>
                                            <input type="number" class="form-control" name="price-regular" placeholder="正規従業員の価格" />
                                            <span class="input-group-addon">円</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-5 col-xs-offset-2">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="number" class="form-control" name="price-non-regular" placeholder="正規従業員以外の価格" />
                                            <span class="input-group-addon">円</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>ご飯付き、小鉢付きなどで価格が違う場合は以下の項目を入力してください。</label>
                                <div class="row">
                                    <div class="col-sm-5">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="with-rice" placeholder="" />
                                            <span class="input-group-addon">付き</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="margin-bottom: 0">
                                <label>ご飯付き等にした場合の価格（上の項目を入力した場合は必須）</label>
                            </div>
                            <div class="row">
                                <div class="col-xs-5">
                                    <div class="form-group">
                                        <div class='input-group'>
                                            <input type="number" class="form-control" name="price-regular-with-rice" placeholder="正規従業員の価格" />
                                            <span class="input-group-addon">円</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-5 col-xs-offset-2">
                                    <div class="form-group">
                                        <div class='input-group'>
                                            <input type="number" class="form-control" name="price-non-regular-with-rice" placeholder="正規従業員以外の価格" />
                                            <span class="input-group-addon">円</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 pull-left">
                    <div class="row" style="padding-top: 15px;">
                        <div class="row">
                            <div class="col-xs-10 col-xs-offset-1">
                                <div class="col-xs-5">
                                    <div class="form-group">
                                        <label>エネルギー</label>
                                        <div class='input-group'>
                                            <input type="text" class="form-control" name="energy" />
                                            <span class="input-group-addon">kcal</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-5 col-xs-offset-2">
                                    <div class="form-group">
                                        <label>塩分</label>
                                        <div class='input-group'>
                                            <input type="text" class="form-control" name="salt" />
                                            <span class="input-group-addon">g</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-5">
                                    <div class="form-group">
                                        <label>たんぱく質</label>
                                        <div class='input-group'>
                                            <input type="text" class="form-control" name="protein" />
                                            <span class="input-group-addon">g</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-5 col-xs-offset-2">
                                    <div class="form-group">
                                        <label>脂質</label>
                                        <div class='input-group'>
                                            <input type="text" class="form-control" name="lipid" />
                                            <span class="input-group-addon">g</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label>アレルゲン</label>
                                        <input type="text" class="form-control" name="allergen" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
{/block}
{block name=footer_left}
    {if $id}
        <a href="{base_url}menu/delete/{$id}" class="btn btn-delete box rd24 font-pop"
           style="font-size: large;">
            <span class="fa fa-trash"></span><span class="spNone"> 削除</span>
        </a>
    {/if}
{/block}
{block name=footer_right}
    <button type="submit" class="btn btn-orange box rd24 font-pop spNone"
            style="margin-right:15px;font-size: large;">
        <span class="glyphicon glyphicon-saved"></span><span class="spNone"> 保存してもう１つ追加</span>
    </button>
    <a href="{base_url}menu/list" class="btn btn-orange box rd24 font-pop"
       style="font-size: large;">
        <span class="glyphicon glyphicon-saved"></span><span class="spNone"> 保存する</span>
    </a>
{/block}
