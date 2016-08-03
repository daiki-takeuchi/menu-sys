<?php

/**
 * Created by PhpStorm.
 * User: DaikiTakeuchi
 * Date: 2016/07/16
 * Time: 11:07
 */
class MY_Controller extends CI_Controller
{

    protected $is_login;
    protected $user_id;
    protected $user_name;
    protected $employee_id;

    public function __construct()
    {
        parent::__construct();
        $this->smarty->template_dir = APPPATH . 'views';
        $this->smarty->compile_dir = APPPATH . 'views/templates_c';
        $this->load->helper('url');
        $this->load->helper('form');
        $this->load->library('form_validation');

        $userdata = $this->session->userdata();
        $data['is_login'] = $this->is_login = isset($userdata["is_logged_in"]) ? $userdata["is_logged_in"] : false;
        $data['user_id'] = $this->user_id = isset($userdata["user"]["id"]) ? $userdata["user"]["id"] : false;
        $data['user_name'] = $this->user_name = isset($userdata["user"]["name"]) ? $userdata["user"]["name"] : false;
        $data['employee_id'] = $this->employee_id = isset($userdata["user"]["employee_id"]) ? $userdata["user"]["employee_id"] : false;

        $this->smarty->assign($data);
    }

    /**
     * @param String $template
     * @return void
     */
    public function display($template)
    {
        $this->smarty->display($template);
    }
}