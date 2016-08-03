<?php
/**
 * Smarty {site_url} function plugin
 *
 * Type:     function<br>
 * Name:     base_url<br>
 * Purpose:  Codeigniter base_urlヘルパーのラッパープラグイン<br>
 * Examples: {site_url url="member/add"}<br>
 * Output:   http://example.com/member/add/<br>
 * Params:
 * <pre>
 * - id      - (optional) - id attribute
 * - label
 * - value
 * - class
 * </pre>
 */
function smarty_function_base_url($params,&$smarty)
{
	if ( ! isset($params['url']))
	{
		$params['url'] = '';
	}
	return base_url($params['url']);
}