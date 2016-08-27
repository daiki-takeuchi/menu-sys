<?php
/**
 * Smarty {convert_han2full} function plugin
 *
 * Type:     function<br>
 * Name:     convert_han2full<br>
 * Purpose:  Codeigniter プラグイン<br>
 * Examples: {convert_han2ful string=200}<br>
 * Output:   ２００
 * Params:
 * <pre>
 * - id      - (optional) - id attribute
 * - label
 * - value
 * - class
 * </pre>
 */
function smarty_function_convert_han2full($params,&$smarty)
{
    $han = array(
        "ｱ"=>"ア","ｲ"=>"イ","ｳ"=>"ウ","ｴ"=>"エ","ｵ"=>"オ",
        "ｶ"=>"カ","ｷ"=>"キ","ｸ"=>"ク","ｹ"=>"ケ","ｺ"=>"コ",
        "ｻ"=>"サ","ｼ"=>"シ","ｽ"=>"ス","ｾ"=>"セ","ｿ"=>"ソ",
        "ﾀ"=>"タ","ﾁ"=>"チ","ﾂ"=>"ツ","ﾃ"=>"テ","ﾄ"=>"ト",
        "ﾅ"=>"ナ","ﾆ"=>"ニ","ﾇ"=>"ヌ","ﾈ"=>"ネ","ﾉ"=>"ノ",
        "ﾊ"=>"ハ","ﾋ"=>"ヒ","ﾌ"=>"フ","ﾍ"=>"ヘ","ﾎ"=>"ホ",
        "ﾏ"=>"マ","ﾐ"=>"ミ","ﾑ"=>"ム","ﾒ"=>"メ","ﾓ"=>"モ",
        "ﾔ"=>"ヤ","ﾕ"=>"ユ","ﾖ"=>"ヨ",
        "ﾗ"=>"ラ","ﾘ"=>"リ","ﾙ"=>"ル","ﾚ"=>"レ","ﾛ"=>"ロ",
        "ﾜ"=>"ワ","ｦ"=>"ヲ","ﾝ"=>"ン",
        "0"=>"０","1"=>"１","2"=>"２","3"=>"３","4"=>"４",
        "5"=>"５","6"=>"６","7"=>"７","8"=>"８","9"=>"９",
        );
    $change = strtr($params['string'], $han);
    return $change;
}