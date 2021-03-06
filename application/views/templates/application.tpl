<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <title>{block name=title}{/block}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no"/>
    <link rel="shortcut icon" href="{base_url}favicon.ico" />
    <link rel="apple-touch-icon" sizes="152x152" href="{base_url}apple-touch-icon.png">
    <link rel="stylesheet" href="{base_url}assets/css/jquery-ui-1.12.0.min.css"/>
    <link rel="stylesheet" href="{base_url}assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="{base_url}assets/css/bootstrap-dialog.min.css"/>
    <link rel="stylesheet" href="{base_url}assets/css/bootstrap-select.min.css"/>
    <link rel="stylesheet" href="{base_url}assets/css/font-awesome.min.css"/>
    {block name=include_css}{/block}
    <link rel="stylesheet" href="{base_url}assets/css/application.css"/>
    <script src="{base_url}assets/js/jquery-2.1.4.min.js"></script>
    <script src="{base_url}assets/js/jquery-ui-1.12.0.min.js"></script>
    <script src="{base_url}assets/js/bootstrap.min.js"></script>
    <script src="{base_url}assets/js/bootstrap-dialog.min.js"></script>
    <script src="{base_url}assets/js/bootstrap-select.min.js"></script>
    <script src="{base_url}assets/js/bootstrap-select.ja_JP.js"></script>
    <script src="{base_url}assets/js/jquery.validate.min.js"></script>
    <script src="{base_url}assets/js/jquery.validate.messages_ja.min.js"></script>
    <script src="{base_url}assets/js/jquery.validate.bootstrap3.js"></script>
    <script type="text/javascript">window.base_url = "{base_url}";</script>
    <script type="text/javascript">window.download_date = "{download_date}";</script>
    {block name=include_js}{/block}
    <script src="{base_url}assets/js/application.js"></script>
    {include file='templates/shim.tpl'}
    {include file='templates/message.tpl'}
</head>
<body>
{if !isset($has_header) || $has_header}
{include file='templates/header.tpl'}
{/if}
<div class="bb-alert alert alert-info" style="display:none;">
    <a href="#" class="close" title="close" style="padding-top:5px;">&times;</a>
    <span></span>
</div>
{block name=main_contents}{/block}
{if !isset($has_footer) || $has_footer}
{include file='templates/footer.tpl'}
{/if}
</body>
</html>