<?php
/**
 * Smarty {later_than_reference_time} function plugin
 *
 * Type:     function<br>
 * Name:     earlier_than_reference_time<br>
 * Purpose:  Codeigniter 基準時刻より早いか？（基準日含まない）<br>
 * Examples: {earlier_than_reference_time date='2016/9/9'}<br>
 * Output:   yyyy/mm/dd<br>
 * Params:
 */
function smarty_function_earlier_than_reference_time($params, &$smarty)
{
    $CI = &get_instance();
    $CI->load->helper('app_util');

    $date = null;
    if (isset($params['date'])) {
        $date = $params['date'];
    }

    return earlier_than_reference_time($date);
}