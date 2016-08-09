<?php
require('UploadHandler.php');
/**
 * Created by PhpStorm.
 * User: daiki_takeuchi
 * Date: 2016/08/09
 * Time: 14:29
 */
class MyUploadHandler extends UploadHandler
{
    protected function basename($filepath, $suffix = null) {
        $splited = preg_split('/\//', rtrim ($filepath, '/ '));
        return substr(substr(strrchr('/X'.$splited[count($splited)-1],'/'),1), 1);
    }
}