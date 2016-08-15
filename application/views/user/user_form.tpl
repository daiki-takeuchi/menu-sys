{extends file='templates/application.tpl'}
{block name=title}{$title}{/block}
{block name=include_js}
    <script src="{base_url}assets/js/user.js"></script>
{/block}
{block name=main_contents}
<div class="container-fluid">
    <form class="form-horizontal" method="post" id="form" data-toggle="validator">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2" style="padding-top: 30px;">
                <div class="row">
                    <div class="col-xs-10 col-xs-offset-1">
                        {if {validation_errors()}}<div class="alert alert-danger">{validation_errors()}</div>{/if}
                        <div class="row">
                            <div class="col-sm-5">
                                <div class="form-group has-feedback">
                                    <label><span class="label-required rd5">必須</span> 名前</label>
                                    <input type="text" class="form-control" name="name" value="{$user.name}" required />
                                    <div class="help-block with-errors"></div>
                                    <span class="form-control-feedback"></span>
                                </div>
                            </div>
                            <div class="col-sm-6 col-sm-offset-1">
                                <div class="form-group has-feedback">
                                    <label><span class="label-required rd5">必須</span> 社員番号</label>
                                    <input type="text" class="form-control" name="shain_bn" value="{$user.shain_bn}" style="ime-mode: inactive" required />
                                    <div class="help-block with-errors"></div>
                                    <span class="form-control-feedback"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                <div class="form-group has-feedback">
                                    <label><span class="label-required rd5">必須</span> 会社名</label><br />
                                    {html_options id="company" name="company_cc" options=$company data-width="100%" class="selectpicker show-menu-arrow" title="会社を選択してください" selected="{$user.company_cc}" required="required"}
                                    <div class="help-block with-errors"></div>
                                    <span class="form-control-feedback"></span>
                                </div>
                            </div>
                            <div class="col-sm-6 col-sm-offset-1">
                                <div class="form-group has-feedback">
                                    <label><span class="label-required rd5">必須</span> 組織</label><br />
                                    {html_options id="organization" name="soshiki_cc" options=$organization data-width="100%"
                                    data-live-search="true" class="selectpicker show-menu-arrow" title="組織を選択してください"
                                    data-size="8" selected="{if isset($user.soshiki_cc)}{$user.soshiki_cc}{/if}" required="required"}
                                    <input type="hidden" id="soshiki_nm" name="soshiki_nm" value="{$user.soshiki_nm}" />
                                    <div class="help-block with-errors"></div>
                                    <span class="form-control-feedback"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                <div class="form-group has-feedback">
                                    <label><span class="label-required rd5">必須</span> 雇用形態</label><br />
                                    {html_options name="shain_keitai_cc" options=$keitai data-width="100%" class="selectpicker show-menu-arrow" title="雇用形態を選択してください" selected="{$user.shain_keitai_cc}" required="required"}
                                    <div class="help-block with-errors"></div>
                                    <span class="form-control-feedback"></span>
                                </div>
                            </div>
                            <div class="col-sm-6 col-sm-offset-1">
                                <div class="form-group">
                                    <label>性別</label><br />
                                    {html_radios name="gender" options=$gender assign="checkboxes" checked="{if isset($user.gender)}{$user.gender}{/if}"}
                                    {foreach from=$checkboxes item="chekbox"}
                                        <div class="radio-inline">{$chekbox}</div>
                                    {/foreach}
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label>利用する管理者機能</label><br />
                                    <div class="checkbox-inline">
                                        <label><input type="checkbox" name="permission_menu" value="1" {if isset($user.permission_menu) && $user.permission_menu}checked{/if}>メニュー登録</label>
                                    </div>
                                    <div class="checkbox-inline">
                                        <label><input type="checkbox" name="permission_user" value="1" {if isset($user.permission_user) && $user.permission_user}checked{/if}>ユーザー登録</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" name="btn-save" id="save_btn" />
    </form>
    <div class="row">
        <div class="col-xs-10 col-xs-offset-1 col-lg-6 col-lg-offset-3" style="padding-top: 30px;">
            <div class="bg-light-gray" style="padding: 10px 10px 0 10px;font-size: 12px;">
                <div class="row">
                    <div class="col-sm-5 col-sm-offset-1">
                        <p>初回登録日：{if isset($user.created_at)}{$user.created_at|date_format:'Y/m/d H:i:s'}{/if}</p>
                    </div>
                    <div class="col-sm-5">
                        <p>初回登録者：{if isset($user.created_user)}{$user.created_user}{/if}</p>
                    </div>
                    <div class="col-sm-5 col-sm-offset-1">
                        <p>最終更新日：{if isset($user.updated_at)}{$user.updated_at|date_format:'Y/m/d H:i:s'}{/if}</p>
                    </div>
                    <div class="col-sm-5">
                        <p>最終更新者：{if isset($user.updated_user)}{$user.updated_user}{/if}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{/block}
{block name=footer_left}
    {if $id}
        <button id="{$id}" class="btn btn-delete btn-user-delete box rd24 font-pop {if $id === $user_id}disabled{/if}"
           style="font-size: large;" {if $id === $user_id}disabled{/if}>
            <span class="fa fa-trash"></span><span class="spNone"> 削除</span>
        </button>
    {/if}
{/block}
{block name=footer_right}
    <button class="btn btn-orange box rd24 font-pop spNone btn-save-user-more"
            style="margin-right:15px;font-size: large;">
        <span class="glyphicon glyphicon-saved"></span><span class="spNone"> 保存してもう１つ追加</span>
    </button>
    <button class="btn btn-orange box rd24 font-pop btn-save-user"
       style="font-size: large;">
        <span class="glyphicon glyphicon-saved"></span><span class="spNone"> 保存する</span>
    </button>
{/block}
