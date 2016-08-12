{extends file='templates/application.tpl'}
{block name=title}{$title}{/block}
{block name=include_js}
    <script src="{base_url}assets/js/user.js"></script>
{/block}
{block name=main_contents}
    <form class="form-horizontal" method="post" id="form">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2" style="padding-top: 30px;">
                <div class="row">
                    <div class="col-xs-10 col-xs-offset-1">
                        <div class="row">
                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label><span class="label-required rd5">必須</span> 名前</label>
                                    <input type="text" class="form-control" name="user_name" value="{$user.name}" />
                                </div>
                            </div>
                            <div class="col-sm-6 col-sm-offset-1">
                                <div class="form-group">
                                    <label><span class="label-required rd5">必須</span> 社員番号</label>
                                    <input type="text" class="form-control" name="shain_bn" value="{$user.shain_bn}" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label><span class="label-required rd5">必須</span> 会社名</label><br />
                                    {html_options id="company" name="sel_company" options=$company data-width="100%" class="selectpicker show-menu-arrow" title="会社を選択してください" selected="{$user.company_cc}"}
                                </div>
                            </div>
                            <div class="col-sm-6 col-sm-offset-1">
                                <div class="form-group">
                                    <label><span class="label-required rd5">必須</span> 組織</label><br />
                                    {html_options id="organization" name="sel_organization" options=$organization data-width="100%"
                                    data-live-search="true" class="selectpicker show-menu-arrow" title="組織を選択してください"
                                    data-size="8" selected="{$user.soshiki_cc}"}
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label><span class="label-required rd5">必須</span> 雇用形態</label><br />
                                    {html_options name="sel_keitai" options=$keitai data-width="100%" class="selectpicker show-menu-arrow" title="雇用形態を選択してください" selected="{$user.shain_keitai_cc}"}
                                </div>
                            </div>
                            <div class="col-sm-6 col-sm-offset-1">
                                <div class="form-group">
                                    <label>性別</label><br />
                                    {html_radios name="gender" options=$gender assign="checkboxes" checked="{$user.gender}"}
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
                                        <label><input type="checkbox" name="permission_menu" {if $user.permission_menu}checked{/if}>メニュー登録</label>
                                    </div>
                                    <div class="checkbox-inline">
                                        <label><input type="checkbox" name="permission_user" {if $user.permission_user}checked{/if}>ユーザー登録</label>
                                    </div>
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
                            <p>初回登録日：{$user.created_at|date_format:'Y/m/d h:i:s'}</p>
                        </div>
                        <div class="col-sm-5">
                            <p>初回登録者：{$user.created_user}</p>
                        </div>
                        <div class="col-sm-5 col-sm-offset-1">
                            <p>最終更新日：{$user.updated_at|date_format:'Y/m/d h:i:s'}</p>
                        </div>
                        <div class="col-sm-5">
                            <p>最終更新者：{$user.updated_user}</p>
                        </div>
                    </div>
            </div>
        </div>
    </div>
{/block}
{block name=footer_left}
    {if $id}
        <a href="{base_url}user/delete/{$id}" class="btn btn-delete box rd24 font-pop"
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
    <a href="{base_url}user" class="btn btn-orange box rd24 font-pop"
       style="font-size: large;">
        <span class="glyphicon glyphicon-saved"></span><span class="spNone"> 保存する</span>
    </a>
{/block}
