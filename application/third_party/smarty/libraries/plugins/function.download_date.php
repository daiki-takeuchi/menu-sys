<?php
/**
 * Smarty {download_date} function plugin
 *
 * Type:     function<br>
 * Name:     download_date<br>
 * Purpose:  Codeigniter 予約者リストのダウンロード可能最終日付<br>
 * Examples: <br>
 * Output:   yyyy/mm/dd<br>
 * Params:
 * <pre>
 * - id      - (optional) - id attribute
 * - label
 * - value
 * - class
 * </pre>
 */
function smarty_function_download_date($params,&$smarty)
{
    $CI= &get_instance();
    $CI->config->load('app_config');

    $date = date('Y/m/d');
    $reference_time = $CI->config->item('reference_time');

    //基準時刻より前か？
    if (strtotime(date('H:i:s')) <= strtotime($reference_time)) {
        $date = date('Y/m/d',strtotime('-1 day')); //１日前
    }
    return $date;
}