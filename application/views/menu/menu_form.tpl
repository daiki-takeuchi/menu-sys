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
    <script src="{base_url}assets/js/menu.validation.js"></script>

    <script src="{base_url}assets/js/jquery.iframe-transport.js"></script>
    <script src="{base_url}assets/js/jquery.fileupload.js"></script>
    <script src="{base_url}assets/js/holder.min.js"></script>
    <script src="{base_url}assets/js/image-upload.js"></script>
{/block}
{block name=main_contents}
    <div class="container">
        <div class="row" style="margin-top: 15px;">
            {if {validation_errors()}}<div class="alert alert-danger">{validation_errors()}</div>{/if}
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
            <form class="form-horizontal" method="post" id="form" data-toggle="validator">
                <div class="col-md-8 pull-right">
                    <div class="row">
                        <div class="col-xs-10 col-xs-offset-1">
                            <div class="row">
                                <div class="col-sm-5">
                                    <div class="form-group has-feedback">
                                        <label><span class="label-required rd5">必須</span> メニュー提供日</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="fa fa-calendar"></span>
                                            </span>
                                            <input type="text" class="form-control date" name="supply_date" value="{$menu.supply_date|date_format:"Y/m/d"}" required />
                                        </div>
                                        <div class="help-block with-errors"></div>
                                        <span class="form-control-feedback"></span>
                                    </div>
                                </div>
                                <div class="col-sm-5 col-sm-offset-2">
                                    <div class="form-group has-feedback">
                                        <label><span class="label-required rd5">必須</span> メニュー公開日</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="fa fa-calendar"></span>
                                            </span>
                                            <input type="text" class="form-control date" name="open_date" value="{$menu.open_date|date_format:"Y/m/d"}" required />
                                        </div>
                                        <div class="help-block with-errors"></div>
                                        <span class="form-control-feedback"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <label><span class="label-required rd5">必須</span> メニュー名</label>
                                <input type="text" class="form-control" name="menu_name" value="{$menu.menu_name}" required />
                                <div class="help-block with-errors"></div>
                                <span class="form-control-feedback"></span>
                            </div>
                            <div class="form-group">
                                <label> タグ（"減塩"や"ヘルシーメニュー"等の強調したい文字を入力してください。）</label>
                                <input type="text" class="form-control tag-input" name="tag" value="{$menu.tag}" />
                            </div>
                            <div class="form-group has-feedback">
                                <label><span class="label-required rd5">必須</span> カテゴリ</label><br />
                                <div style="position:relative">
                                    {html_options name="category_id" options=$category data-width="100%" class="selectpicker show-menu-arrow" title="カテゴリを選択してください" selected="{$menu.category_id}" required="required"}
                                    <span class="form-control-feedback"></span>
                                </div>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group" style="margin-bottom: 0">
                                <label><span class="label-required rd5">必須</span> 価格</label>
                            </div>
                            <div class="row">
                                <div class="col-xs-5">
                                    <div class="form-group has-feedback">
                                        <div class='input-group'>
                                            <div style="position:relative">
                                                <input type="number" class="form-control" name="price_regular" placeholder="正規従業員の価格" value="{$menu.price_regular}" required />
                                                <span class="form-control-feedback"></span>
                                            </div>
                                            <span class="input-group-addon">円</span>
                                        </div>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-xs-5 col-xs-offset-2">
                                    <div class="form-group has-feedback">
                                        <div class="input-group">
                                            <div style="position:relative">
                                                <input type="number" class="form-control" name="price_non_regular" placeholder="正規従業員以外の価格" value="{$menu.price_non_regular}" required />
                                                <span class="form-control-feedback"></span>
                                            </div>
                                            <span class="input-group-addon">円</span>
                                        </div>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="margin-bottom: 0">
                                <label>ご飯付き、小鉢付きなどで価格が違う場合は以下の項目を入力してください。</label>
                            </div>
                            <div class="row">
                                <div class="col-sm-5">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="with_rice" value="{$menu.with_rice}" />
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
                                    <div class="form-group has-feedback">
                                        <div class='input-group'>
                                            <div style="position:relative">
                                                <input type="number" class="form-control" name="price_regular_with_rice" placeholder="正規従業員の価格" value="{$menu.price_regular_with_rice}" />
                                                <span class="form-control-feedback"></span>
                                            </div>
                                            <span class="input-group-addon">円</span>
                                        </div>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-xs-5 col-xs-offset-2">
                                    <div class="form-group has-feedback">
                                        <div class='input-group'>
                                            <div style="position:relative">
                                                <input type="number" class="form-control" name="price_non_regular_with_rice" placeholder="正規従業員以外の価格" value="{$menu.price_non_regular_with_rice}" />
                                                <span class="form-control-feedback"></span>
                                            </div>
                                            <span class="input-group-addon">円</span>
                                        </div>
                                        <div class="help-block with-errors"></div>
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
                                            <input type="text" class="form-control" name="energy" value="{$menu.energy}" />
                                            <span class="input-group-addon">kcal</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-5 col-xs-offset-2">
                                    <div class="form-group">
                                        <label>塩分</label>
                                        <div class='input-group'>
                                            <input type="text" class="form-control" name="salt" value="{$menu.salt}" />
                                            <span class="input-group-addon">g</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-5">
                                    <div class="form-group">
                                        <label>たんぱく質</label>
                                        <div class='input-group'>
                                            <input type="text" class="form-control" name="protein" value="{$menu.protein}" />
                                            <span class="input-group-addon">g</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-5 col-xs-offset-2">
                                    <div class="form-group">
                                        <label>脂質</label>
                                        <div class='input-group'>
                                            <input type="text" class="form-control" name="lipid" value="{$menu.lipid}" />
                                            <span class="input-group-addon">g</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label>アレルゲン</label>
                                        <input type="text" class="form-control" name="allergen" value="{$menu.allergen}" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="btn-save" id="save_btn" />
            </form>
        </div>
    </div>
{/block}
{block name=footer_left}
    {if $id}
        <button id="{$id}" class="btn btn-delete btn-menu-delete box rd24 font-pop"
                style="margin-right:15px;font-size: large;">
            <span class="fa fa-trash"></span><span class="spNone"> 削除</span>
        </button>
    {/if}
{/block}
{block name=footer_right}
    <a href="{$back_url}" class="btn btn-orange box rd24 font-pop"
       style="margin-right:15px;font-size: large;">
        <span class="fa fa-arrow-left"></span><span class="spNone"> 戻る</span>
    </a>
    {if $id}
        <button class="btn btn-orange box rd24 font-pop btn-save-menu-more"
                style="margin-right:15px;font-size: large;">
            <span class="fa fa-copy"></span><span class="spNone"> コピー</span>
        </button>
    {/if}
    <button class="btn btn-orange box rd24 font-pop btn-save-menu"
       style="font-size: large;">
        <span class="glyphicon glyphicon-saved"></span><span class="spNone"> 保存</span>
    </button>
{/block}
