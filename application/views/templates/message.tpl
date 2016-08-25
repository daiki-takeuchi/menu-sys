{if isset($message)}
    <script>
        $(function () {literal}{{/literal}MessageBox.show('{$message}'){literal}}{/literal});
    </script>
{/if}
