<div class="form-group">
    食堂利用状況を分析する際に利用させていただきますので、性別の入力にご協力お願いします。<br /><br />
    <div class="row center">
        <div class="col-xs-12 form-horizontal">
            {html_radios name="gender" options=$gender assign="checkboxes"}
            {foreach from=$checkboxes item="chekbox"}
                <div class="radio-inline">{$chekbox}</div>
            {/foreach}
        </div>
    </div><br /><div class="alert alert-danger hidden">性別を選択してください。</div>
</div>