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
        $base_url = base_url();
        $has_footer = false;
        $message_class = "text-hide";
        $message = "パスワードを変更しました。引き続き、メニュー予約をする場合は、<a href='${base_url}'><b>こちら</b></a>をクリックして下さい。";

        if($this->input->post()) {
            $message_class = "";
        }

        $this->smarty->assign(compact("has_footer", "message_class", "message"));
        $this->display("page/pwchange.tpl");
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

        $this->display("page/login.tpl");
    }

    public function logout()
    {
        // ログアウト処理をしてからlogin画面にリダイレクト
        redirect(base_url()."login");
    }

    public function input_gender()
    {
        // Ajax通信の場合のみ処理する
        if($this->input->is_ajax_request()) {
            $data['gender'] = array("1" => "男性", "2" => "女性", "3" => "その他");

            $this->smarty->assign($data);
            $this->display("page/input_gender.tpl");
        }
    }

    public function update_gender()
    {
        // Ajax通信の場合のみ処理する
        if($this->input->is_ajax_request()) {
            echo json_encode("");
        }
    }

    public function file_upload()
    {
        $this->load->library('UploadHandler');
        $upload_handler = new UploadHandler();
    }
}
