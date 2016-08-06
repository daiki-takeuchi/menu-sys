{extends file='templates/application.tpl'}
{block name=title}{$title}{/block}
{block name=include}
    <link rel="stylesheet" href="{base_url}assets/css/bootstrap-datepicker.min.css"/>
    <script src="{base_url}assets/js/bootstrap-datepicker.min.js"></script>
    <script src="{base_url}assets/js/bootstrap-datepicker.ja.min.js"></script>
{/block}
{block name=main_contents}
{/block}
{block name=footer_left}
    <button type="button" class="btn btn-disabled box rd24 font-pop"
            style="font-size: large;">
        <span class="fa fa-trash"></span><span class="spNone"> 削除</span>
    </button>
{/block}
{block name=footer_right}
    <button type="submit" class="btn btn-orange box rd24 font-pop spNone"
            style="font-size: large;">
        <span class="glyphicon glyphicon-saved"></span><span class="spNone"> 保存してもう１つ追加</span>
    </button>
    <a href="{base_url}menu/list" class="btn btn-orange box rd24 font-pop"
            style="font-size: large;">
        <span class="glyphicon glyphicon-saved"></span><span class="spNone"> 保存する</span>
    </a>
{/block}
