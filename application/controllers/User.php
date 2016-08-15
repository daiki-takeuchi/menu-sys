<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Class User
 *
 * @property User_model $user_model
 */
class User extends MY_Controller {

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

    protected $page_title = 'ユーザー';
    private  $edit_user_id;

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');

        $this->user_model->setUserName($this->user_name);
    }

    public function index()
    {
        $offset = $this->uri->segment(3 ,0);
        // 登録されているデータを全件取得
        $data['users'] = $this->user_model->get_users($offset);

        // マスター情報を取得
        $data['company'] = array_column($this->lang->line('company'), 'company_nm', 'company_cc');
        $data['keitai'] = array_column($this->lang->line('keitai'), 'keitai_nm', 'keitai_cc');

        foreach ($data['company'] as $company_cc => $company_nm) {
            $soshiki = $this->user_model->get_organization_for_select($company_cc);
            $data['organization'][$company_nm] = array_column($soshiki, 'soshiki_nm', 'soshiki_cc');
        }

        // pagerの作成
        $data['pager'] = $this->user_model->get_pagination();

        $this->smarty->assign($data);
        $this->display('user/index.tpl');
    }

    public function pages()
    {
        $this->index();
    }

    public function user_new()
    {
        $this->edit();
    }

    public function edit($user_id = null)
    {
        parent::edit($user_id);
        $this->edit_user_id = $user_id;

        // 選択したユーザー情報を取得
        $user = $this->user_model->find($user_id);
        if (empty($user) && !empty($user_id)) {
            $this->display('user/not_found.tpl');
            return;
        }

        if($this->input->post()) {
            if ($user_id === null) $user =[];
            $user = array_merge($user, $this->input->post());
            $btn = $this->input->post('btn-save');
            unset($user['btn-save']);

            if($this->_save($user)) {
                if($btn === 'save-user') {
                    redirect(base_url() . 'user');
                } elseif ($btn === 'save-user-more') {
                    redirect(base_url() . 'user/new');
                }
            }
        }

        $data['user'] = $user;

        // マスター情報を取得
        $data['company'] = array_column($this->lang->line('company'), 'company_nm', 'company_cc');
        $data['keitai'] = array_column($this->lang->line('keitai'), 'keitai_nm', 'keitai_cc');
        $data['gender'] = array_column($this->lang->line('gender'), 'gender_nm', 'gender_cc');
        $data['organization'] = [];
        if($user_id) {
            $data['organization'] = array(array_column($this->lang->line('company'), 'company_nm', 'company_cc')[$user['company_cc']] => array_column($this->user_model->get_organization($user['company_cc']), 'soshiki_nm', 'soshiki_cc'));
        }

        $this->smarty->assign($data);

        $this->display('user/user_form.tpl');
    }

    public function delete($user_id)
    {
        $user = $this->user_model->find($user_id);
        if(isset($user['id'])) {
            $this->user_model->delete($user);
        }
        // 削除処理をしたら一覧に戻る
        redirect(base_url().'user');
    }

    public function organization() {
        // Ajax通信の場合のみ処理する
        if($this->input->is_ajax_request()) {
            $company_cc = $this->input->post('company_cc');
            $organization = $this->user_model->get_organization($company_cc);
            echo json_encode($organization);
        }
    }

    public function pw_reset() {
        // Ajax通信の場合のみ処理する
        if($this->input->is_ajax_request()) {
            $user_id = $this->input->post('user_id');
            $user = $this->user_model->find($user_id);
            if(isset($user['id'])) {
                $user['password'] = sha1($user['shain_bn'].$user['shain_bn']);
                $this->user_model->save($user);
            }
            echo json_encode('success');
        }
    }

    private function _save(&$user) {
        if ($this->form_validation->run('user/save') === false) {
            return false;
        }
        if (empty($user['id'])) {
            $user['password'] = sha1($this->input->post('shain_bn').$this->input->post('shain_bn'));
        }
        $this->user_model->save($user);
        $user = $this->user_model->find($user['id']);
        if($user['id'] == $this->user_id) {
            $data = array("user" => $user);
            $this->session->set_userdata($data);
        }
        return true;
    }

    public function _duplicate_shain_bn($shain_bn)
    {
        $user = $this->user_model->find_by_shain_bn($shain_bn);
        if(empty($user) || $user['id'] == $this->edit_user_id) {
            return true;
        } else {
            $this->form_validation->set_message("_duplicate_shain_bn", "既に同じ社員番号の方が登録されています。");
            return false;
        }
    }

}
