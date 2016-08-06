<?php
defined('BASEPATH') OR exit('No direct script access allowed');

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
    public function index()
    {
        $this->display('user/index.tpl');
    }

    public function user_new()
    {
        $this->edit();
    }

    public function edit($user_id = null)
    {
        $title = 'ユーザー登録';
        if($user_id) {
            $title = 'ユーザー編集';
        }

        $this->smarty->assign(compact('title'));
        $this->display('user/user_form.tpl');
    }
}
