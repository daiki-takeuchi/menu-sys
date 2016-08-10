{extends file='templates/application.tpl'}
{block name=title}ユーザー管理{/block}
{block name=include}
{/block}
{block name=main_contents}
    <div class="container">
        <div class="bg-light-gray" style="padding: 5px 10px 10px 10px;">
            <div class="row">
                <div class="col-xs-12">
                    <div style="font-size: 15pt;">
                        <span class="fa fa-search"></span><span class="font-pop"> 絞り込み</span>
                    </div>
                    <form class="form-horizonta" method="post">
                        <div class="row">
                            <div class='form-group'>
                                <div class="col-xs-10 col-xs-offset-1 col-lg-4" style="margin-bottom: 10px;">
                                    <div class='input-group'>
                                        <span class="input-group-addon">名前</span>
                                        <input type="text" class="form-control" name="name" />
                                    </div>
                                </div>
                                <div class="col-xs-10 col-xs-offset-1 col-lg-4 col-lg-pull-1" style="margin-bottom: 10px;">
                                    <div class='input-group'>
                                        <span class="input-group-addon">組織</span>
                                        {html_options name="sel_organization" options=$organization data-width="fit" data-live-search="true" class="selectpicker show-menu-arrow" title="組織を選択してください" data-size="8"}
                                    </div>
                                </div>
                                <div class="col-xs-10 col-xs-offset-1 col-lg-1 col-lg-pull-1">
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
    </div>
{/block}
{block name=footer_right}
    <a href="{base_url}user/new" class="btn btn-orange btn-sm box rd24 font-pop"
            style="font-size: large;width:150px;">
        <span class="fa fa-plus"></span> ユーザー登録
    </a>
{/block}
