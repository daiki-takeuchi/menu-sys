<?php

/**
 * Created by PhpStorm.
 * User: DaikiTakeuchi
 * Date: 2016/07/16
 * Time: 11:07
 */
class MY_Controller extends CI_Controller
{
    protected $user_id;
    protected $user_name;
    protected $shain_bn;
    protected $company_cc;
    protected $soshiki_cc;
    protected $soshiki_nm;
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
        $this->load->helper('cookie');
        $this->load->library('form_validation');
        $this->lang->load('master_lang');

        $userdata = $this->session->userdata();

        // TODO phpunitでcookieが空になってしまうため、テストの時はSesseionを利用する
        $is_logged_in = ENVIRONMENT === 'testing' ? $userdata["is_logged_in"] : $this->input->cookie("is_logged_in");

        if($this->uri->segment(1 ,0) === 'login') {
            // ログイン画面はそのまま遷移する
            return;
        } elseif(!isset($is_logged_in) || !isset($userdata["is_logged_in"])) {
            // ログインしていない場合はログイン画面に遷移する
            redirect(base_url() . 'login');
        } elseif ($userdata["user"]["first_login"] === '1' && $this->uri->segment(1 ,0) !== 'pwchange') {
            // 最初のログイン時はパスワード変更画面に遷移する
            redirect(base_url() . 'pwchange');
        }

        $data['user_id'] = $this->user_id = $userdata["user"]["id"];
        $data['user_name'] = $this->user_name = $userdata["user"]["name"];
        $data['shain_bn'] = $this->shain_bn = $userdata["user"]["shain_bn"];
        $data['shain_keitai_cc'] = $userdata["user"]["shain_keitai_cc"];
        $data['company_cc'] = $this->company_cc = $userdata["user"]["company_cc"];
        $data['soshiki_cc'] = $this->soshiki_cc = $userdata["user"]["soshiki_cc"];
        $data['soshiki_nm'] = $this->soshiki_nm = $userdata["user"]["soshiki_nm"];
        $data['gender'] = empty($userdata["user"]["gender"])? "" : $userdata["user"]["gender"];
        $data['permission_menu'] = $this->permission_menu = $userdata["user"]["permission_menu"];
        $data['permission_user'] = $this->permission_user = $userdata["user"]["permission_user"];


        $data['popup_message'] = $this->session->flashdata('popup_message');
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

    protected function alert($message) {
        $this->session->set_flashdata('popup_message', $message);
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