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
    protected $shain_bn;
    protected $permission_menu;
    protected $permission_user;
    protected $first_login;

    protected $page_title = '';

    public function __construct()
    {
        parent::__construct();
        $this->smarty->template_dir = APPPATH . 'views';
        $this->smarty->compile_dir = APPPATH . 'views/templates_c';
        $this->load->helper('url');
        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->lang->load('master_lang');

        $userdata = $this->session->userdata();
        if($this->uri->segment(1 ,0) === 'login') {
            // ログイン画面はそのまま遷移する
            return;
        } elseif(!isset($userdata["is_logged_in"])) {
            // ログインしていない場合はログイン画面に遷移する
            redirect(site_url() . 'login');
        } elseif ($userdata["user"]["first_login"] === '1' && $this->uri->segment(1 ,0) !== 'pwchange') {
            // 最初のログイン時はパスワード変更画面に遷移する
            redirect(site_url() . 'pwchange');
        }

        $data['is_login'] = $this->is_login = $userdata["is_logged_in"];
        $data['user_id'] = $this->user_id = $userdata["user"]["id"];
        $data['user_name'] = $this->user_name = $userdata["user"]["name"];
        $data['shain_bn'] = $this->shain_bn = $userdata["user"]["shain_bn"];
        $data['gender'] = $userdata["user"]["gender"];
        $data['permission_menu'] = $this->permission_menu = $userdata["user"]["permission_menu"];
        $data['permission_user'] = $this->permission_user = $userdata["user"]["permission_user"];

        $this->smarty->assign($data);
    }

    public function edit($id = null)
    {
        $title = $this->page_title.'登録';
        if($id) {
            $title = $this->page_title.'編集';
        }
        $this->smarty->assign(compact('title', 'id'));
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