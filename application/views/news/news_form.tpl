{extends file='templates/application.tpl'}
{block name=title}{$title}{/block}
{block name=include_css}
    <link rel="stylesheet" href="{base_url}assets/css/bootstrap-datepicker.min.css"/>
{/block}
{block name=include_js}
    <script src="{base_url}assets/js/bootstrap-datepicker.min.js"></script>
    <script src="{base_url}assets/js/bootstrap-datepicker.ja.min.js"></script>
{/block}
{block name=main_contents}
{/block}
{block name=footer_left}
    {if $id}
        <a href="{base_url}news/delete/{$id}" class="btn btn-delete box rd24 font-pop"
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
    <a href="{base_url}news" class="btn btn-orange box rd24 font-pop"
       style="font-size: large;">
        <span class="glyphicon glyphicon-saved"></span><span class="spNone"> 保存する</span>
    </a>
{/block}
