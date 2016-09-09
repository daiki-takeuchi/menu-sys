<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 基準時刻より前か？（基準時刻は含まない）
 * @return boolean 前の場合 : true
 */
function earlier_than_reference_time($date)
{
    $CI = &get_instance();
    $CI->config->load('app_config');

    if(!$date) {
        $date = date('Y/m/d');
    }
    $reference_time = $CI->config->item('reference_time');

    return strtotime(date('H:i:s')) < strtotime($date . ' ' . $reference_time);
}

/**
 * 基準時刻より後か？（基準時刻は含む）
 * @return boolean 後の場合 : true
 */
function later_than_reference_time($date)
{
    return !earlier_than_reference_time($date);
}