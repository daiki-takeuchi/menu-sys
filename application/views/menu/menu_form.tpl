{extends file='templates/application.tpl'}
{block name=title}{$title}{/block}
{block name=include}
    <link rel="stylesheet" href="{base_url}assets/css/bootstrap-datepicker.min.css"/>
    <!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
    <link rel="stylesheet" href="{base_url}assets/css/jquery.fileupload.css">
    <script src="{base_url}assets/js/bootstrap-datepicker.min.js"></script>
    <script src="{base_url}assets/js/bootstrap-datepicker.ja.min.js"></script>

    <!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
    <script src="{base_url}assets/js/jquery.iframe-transport.js"></script>
    <!-- The basic File Upload plugin -->
    <script src="{base_url}assets/js/jquery.fileupload.js"></script>
    <script src="{base_url}assets/js/holder.min.js"></script>
    <script src="{base_url}assets/js/image-upload.js"></script>

{/block}
{block name=main_contents}
    <div class="container">
        <div class="row">
            <form class="form-horizontal" method="post" id="form">
                <div class="col-sx-12 col-md-4 center">
                <span class="fileinput-button">
                    <div class="img-thumbnail img-menu-form">
                        <img class="img-responsive" id="img-menu" data-src="holder.js/290x200?text=ここをクリックして画像を登録">
                    </div>
                    <!-- The file input field used as target for the file upload widget -->
                    <input id="fileupload" type="file" name="files[]" accept="image/png, image/jpeg, image/gif" />
                </span>
                    <!-- The global progress bar -->
                    <div id="progress" class="progress hidden">
                        <div class="progress-bar progress-bar-success"></div>
                    </div>
                    <!-- The container for the uploaded files -->
                    <div id="files" class="files"></div>
                </div>
                <div class="col-sx-12 col-md-8">
                    <div class="row" style="padding-top: 15px;">
                        <div class="col-xs-10 col-xs-offset-1">
                            <div class="row">
                                <div class="col-xs-5">
                                    <div class="form-group">
                                        <label><span class="label-required rd5">必須</span> 日付</label>
                                        <div class='input-group date'>
                                            <span class="input-group-addon">
                                                <span class="fa fa-calendar"></span>
                                            </span>
                                            <input type="text" class="form-control" style="min-width: 120px;" name="date" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-5 col-xs-offset-1">
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
                                <label> タグ</label>
                                <input type="text" class="form-control" name="tag" placeholder="”減塩”や”ヘルシーメニュー”等強調したい文字を入れてください。" />
                            </div>
                            <div class="form-group">
                                <label><span class="label-required rd5">必須</span> カテゴリ</label><br />
                                {html_options name="sel_category" options=$category data-width="175px" class="selectpicker show-menu-arrow" title=" "}
                            </div>
                            <div class="form-group">
                                <label><span class="label-required rd5">必須</span> 価格</label>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <input type="text" class="form-control" name="price-regular" placeholder="正規従業員の価格" />
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="text" class="form-control" name="price-non-regular" placeholder="正規従業員以外の価格" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>ご飯付き、小鉢付きなどで価格が違う場合は以下の項目を入力してください。</label>
                                <div class="row">
                                    <div class="col-xs-10">
                                        <input type="text" class="form-control" name="with-rice" placeholder="" />
                                    </div>
                                    <div class="col-xs-2">
                                        付き
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
