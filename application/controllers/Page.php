<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Page extends MY_Controller {

    /**
     * Index Page for this controller.
     *
     * Maps to the following URL
     * 		http://example.com/index.php/welcome
     *	- or -
     * 		http://example.com/index.php/welcome/index
     *	- or -
     * Since this controller is set as the default controller in
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see https://codeigniter.com/user_guide/general/urls.html
     */
    public function pwchange()
    {
        $has_footer = false;
        $this->smarty->assign(compact("has_footer"));
        $this->display('page/pwchange.tpl');
    }

    public function login()
    {
        if($this->input->post()) {
            // ログイン処理して
            // 予約画面にリダイレクト
            redirect(base_url());
        }
        $has_header = false;
        $has_footer = false;
        $this->smarty->assign(compact("has_header" ,"has_footer"));

        $this->display('page/login.tpl');
    }

    public function logout()
    {
        // ログアウト処理をしてからlogin画面にリダイレクト
        redirect(base_url().'login');
    }
}