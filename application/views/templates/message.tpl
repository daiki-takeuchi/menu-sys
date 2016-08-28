{if isset($popup_message)}
    <script>
        $(function () {literal}{{/literal}MessageBox.show('{$popup_message}'){literal}}{/literal});
    </script>
{/if}
