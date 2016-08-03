<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <title>{block name=title}{/block}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no"/>
    <link rel="stylesheet" href="{base_url}assets/css/jquery-ui-1.12.0.min.css"/>
    <link rel="stylesheet" href="{base_url}assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="{base_url}assets/css/bootstrap-dialog.min.css"/>
    <link rel="stylesheet" href="{base_url}assets/css/bootstrap-select.min.css"/>
    <link rel="stylesheet" href="{base_url}assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="{base_url}assets/css/application.css"/>
    <script src="{base_url}assets/js/jquery-2.1.4.min.js"></script>
    <script src="{base_url}assets/js/jquery-ui-1.12.0.min.js"></script>
    <script src="{base_url}assets/js/bootstrap.min.js"></script>
    <script src="{base_url}assets/js/bootstrap-dialog.min.js"></script>
    <script src="{base_url}assets/js/bootstrap-select.min.js"></script>
    <script src="{base_url}assets/js/application.js"></script>
    {block name=include}{/block}
    {include file='templates/shim.tpl'}
</head>
<body>
{if !isset($has_header) || $has_header}
{include file='templates/header.tpl'}
{/if}
<div class="bb-alert alert alert-info" style="display:none;">
    <span></span>
</div>
{block name=main_contents}{/block}
{if !isset($has_footer) || $has_footer}
{include file='templates/footer.tpl'}
{/if}
</body>
</html>