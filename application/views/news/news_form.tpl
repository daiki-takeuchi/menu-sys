{extends file='templates/application.tpl'}
{block name=title}{$title}{/block}
{block name=include_css}
    <link rel="stylesheet" href="{base_url}assets/css/bootstrap-datepicker.min.css"/>
{/block}
{block name=include_js}
    <script src="{base_url}assets/js/bootstrap-datepicker.min.js"></script>
    <script src="{base_url}assets/js/bootstrap-datepicker.ja.min.js"></script>
    <script src="{base_url}assets/js/news.js"></script>
    <script src="{base_url}assets/js/news.validation.js"></script>
{/block}
{block name=main_contents}
<div class="container-fluid">
    <form class="form-horizontal" method="post" id="form" data-toggle="validator">
        <div class="row">
            <div class="col-xs-10 col-xs-offset-1" style="padding-top: 30px;">
                <div class="row">
                    <div class="col-xs-10 col-xs-offset-1">
                        {if {validation_errors()}}<div class="alert alert-danger">{validation_errors()}</div>{/if}
                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-1">
                                <div class="form-group has-feedback">
                                    <label><span class="label-required rd5">必須</span> 掲載開始日</label>
                                    <div class='input-group'>
                                        <span class="input-group-addon">
                                            <span class="fa fa-calendar"></span>
                                        </span>
                                        <input type="text" class="form-control date-all" autocomplete="off" name="start_date" value="{$news.start_date|date_format:'Y/m/d'}" required />
                                    </div>
                                    <div class="help-block with-errors"></div>
                                    <span class="form-control-feedback"></span>
                                </div>
                            </div>
                            <div class="col-sm-4 col-sm-offset-1">
                                <div class="form-group has-feedback">
                                    <label><span class="label-required rd5">必須</span> 掲載終了日</label>
                                    <div class='input-group'>
                                        <span class="input-group-addon">
                                            <span class="fa fa-calendar"></span>
                                        </span>
                                        <input type="text" class="form-control date-all" autocomplete="off" name="end_date" value="{$news.end_date|date_format:'Y/m/d'}" required />
                                    </div>
                                    <div class="help-block with-errors"></div>
                                    <span class="form-control-feedback"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-10 col-sm-offset-1">
                                <div class="form-group has-feedback">
                                    <label><span class="label-required rd5">必須</span> お知らせ（100文字まで。改行は反映されません。）</label>
                                    <textarea class="form-control" rows="5" name="content" required maxlength="100">{$news.content}</textarea>
                                    <span class="form-control-feedback"></span>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div class="row">
        <div class="col-xs-10 col-xs-offset-1 col-lg-6 col-lg-offset-3" style="padding-top: 30px;">
            <div class="bg-light-gray" style="padding: 10px 10px 0 10px;font-size: 12px;">
                <div class="row">
                    <div class="col-sm-5 col-sm-offset-1">
                        <p>初回登録日：{if isset($news.created_at)}{$news.created_at|date_format:'Y/m/d H:i:s'}{/if}</p>
                    </div>
                    <div class="col-sm-5">
                        <p>初回登録者：{if isset($news.created_user)}{$news.created_user}{/if}</p>
                    </div>
                    <div class="col-sm-5 col-sm-offset-1">
                        <p>最終更新日：{if isset($news.updated_at)}{$news.updated_at|date_format:'Y/m/d H:i:s'}{/if}</p>
                    </div>
                    <div class="col-sm-5">
                        <p>最終更新者：{if isset($news.updated_user)}{$news.updated_user}{/if}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{/block}
{block name=footer_left}
    {if $id}
        <button id="{$id}" class="btn btn-delete btn-news-delete box rd24 font-pop"
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
    <button class="btn btn-orange box rd24 font-pop btn-save-news"
            style="font-size: large;">
        <span class="glyphicon glyphicon-saved"></span><span class="spNone"> 保存</span>
    </button>
{/block}
