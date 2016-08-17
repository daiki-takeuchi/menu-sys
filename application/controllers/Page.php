<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
 * Class Page
 *
 * @property User_model $user_model
 */
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
    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
        $this->user_model->setUserName($this->user_name);
    }

    public function pwchange()
    {
        $base_url = base_url();
        $has_footer = false;
        $message = "";
        if($this->session->userdata("user")['first_login'] === '1') {
            // 最初のログイン情報をクリア
            $user = $this->user_model->find_by(array('shain_bn' => $this->shain_bn));
            $user['first_login'] = '0';
            $this->user_model->save($user);
            $this->session->set_userdata(array("user" => $user));

            $message = "初回ログイン時はパスワードを変更してください。";
        }

        if($this->input->post()) {
            if ($this->form_validation->run('pwchange') !== false) {
                $new_password = $this->input->post('new_password');
                $user = $this->user_model->find_by(array('shain_bn' => $this->shain_bn));
                if(isset($user['id'])) {
                    $user['password'] = sha1($this->shain_bn.$new_password);
                    $this->user_model->save($user);
                }
                $message = "パスワードを変更しました。引き続き、メニュー予約をする場合は、<a href='{$base_url}'><b>こちら</b></a>をクリックして下さい。";
            }
        }

        $this->smarty->assign(compact("has_footer", "message"));
        $this->display("page/pwchange.tpl");
    }

    public function login()
    {
        if($this->input->post()) {
            // ログイン処理して
            if ($this->form_validation->run('login') !== false) {
                $shain_bn = $this->input->post("shain_bn");
                $user = $this->user_model->find_by(array("shain_bn" => $shain_bn));
                $data = array(
                    "user" => $user,
                    "is_logged_in" => 1
                );
                $this->session->set_userdata($data);
                // ×ボタンを押すまで有効なクッキーを作成
                $this->input->set_cookie("is_logged_in", "1", 0);
                // 予約画面にリダイレクト
                redirect(base_url());
            }
        }
        $has_header = false;
        $has_footer = false;
        $this->smarty->assign(compact("has_header" ,"has_footer"));

        $this->display("page/login.tpl");
    }

    public function logout()
    {
        // ログアウト処理をしてからlogin画面にリダイレクト
        $this->session->sess_destroy();
        $this->input->set_cookie("is_logged_in",'0','');
        redirect(base_url()."login");
    }

    public function input_gender()
    {
        // Ajax通信の場合のみ処理する
        if($this->input->is_ajax_request()) {
            $data['gender'] = array_column($this->lang->line('gender'), 'gender_nm', 'gender_cc');

            $this->smarty->assign($data);
            $this->display("page/input_gender.tpl");
        }
    }

    public function update_gender()
    {
        // Ajax通信の場合のみ処理する
        if($this->input->is_ajax_request()) {
            $user = $this->user_model->find_by(array('shain_bn' => $this->shain_bn));
            $user['gender'] = $this->input->post('gender');
            $this->user_model->save($user);
            $this->session->set_userdata(array("user" => $user));

            echo json_encode('success');
        }
    }

    public function file_upload()
    {
        //$this->load->library('UploadHandler');  // ←これだとオプションを指定できない。
        require_once dirname(__FILE__).'/../libraries/MyUploadHandler.php';

        $option = array('mkdir_mode' => 0777, 'image_versions' => array());

        $upload_handler = new MyUploadHandler($option);
    }

    public function _chk_old_password($old_password)
    {
        if($this->user_model->can_log_in($this->shain_bn, $old_password)) {
            return true;
        } else {
            $this->form_validation->set_message("_chk_old_password", "現在のパスワードが異なります。");
            return false;
        }
    }
}
