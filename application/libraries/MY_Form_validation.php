<?php

/**
 * Created by PhpStorm.
 * User: DaikiTakeuchi
 * Date: 2015/10/16
 * Time: 2:46
 */
class MY_Form_validation extends CI_Form_validation
{
    function validate_credentials()
    {
        $shain_bn = $this->CI->input->post("shain_bn");
        $password = $this->CI->input->post("password");
        $this->CI->load->model("user_model");

        if($this->CI->user_model->can_log_in($shain_bn, $password)) {
            return true;
        } else {
            $this->set_message("validate_credentials", "ユーザー名かパスワードが異なります。");
            return false;
        }
    }
}