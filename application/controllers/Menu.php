<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Menu extends MY_Controller {

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
        $this->display('menu/index.tpl');
	}

    public function menu_list()
    {
        $this->display('menu/menu_list.tpl');
    }

    public function menu_new()
    {
        $this->edit();
    }

    public function edit($menu_id = null)
    {
        $title = 'メニュー登録';
        if($menu_id) {
            $title = 'メニュー編集';
        }

        $this->smarty->assign(compact('title'));
        $this->display('menu/menu_form.tpl');
    }

    public function excel_download()
    {
        // Ajax通信の場合のみ処理する
        if($this->input->is_ajax_request()) {
            $data['form_list'] = array('1' => '予約者リスト', '2' => '食数実績表', '3' => '食堂取組報告', );

            $data['year']['values'] = array(date('Y')-1,date('Y'),date('Y')+1);
            $data['year']['selected'] = date('Y');
            for ($i=1; $i<=12; $i++){
                $data['month']['values'][] = $i;
            }
            $data['month']['selected'] = date('n');
            $data['category'] = array('1' => '朝食メニュー', '2' => 'ランチメニュー', '3' => '夕食メニュー');

            $this->smarty->assign($data);
            $this->display('menu/excel_download.tpl');
        }
    }
}
