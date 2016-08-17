<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Class Menu
 *
 * @property News_model $news_model
 * @property Category_model $category_model
 */
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

    protected $page_title = 'メニュー';

    public function __construct()
    {
        parent::__construct();
        $this->load->model('news_model');
        $this->load->model('category_model');

        $this->news_model->setUserName($this->user_name);
    }

    public function index()
	{
        $data['kubun'] = $this->lang->line('kubun');
        $data['news_list'] = $this->news_model->get_now_news();

        $this->smarty->assign($data);
        $this->display('menu/index.tpl');
	}

    public function menu_list()
    {
        $data['kubun'] = $this->lang->line('kubun');
        $data['news_list'] = $this->news_model->get_now_news();

        $this->smarty->assign($data);
        $this->display('menu/menu_list.tpl');
    }

    public  function news_list() {
        // Ajax通信の場合のみ処理する
        if($this->input->is_ajax_request()) {

            $data['news_list'] = $this->news_model->get_now_news();

            $this->smarty->assign($data);
            $this->display('menu/news_list.tpl');
        }
    }

    public function menu_new()
    {
        $this->edit();
    }

    public function edit($menu_id = null)
    {
        parent::edit($menu_id);
        $category = [];
        foreach ($this->lang->line('kubun') as $kubun => $value) {
            $category[$value] = array_column($this->category_model->get_categorys($kubun), 'category_name', 'id');
        }
        $data['category'] = $category;

        $this->smarty->assign($data);
        $this->display('menu/menu_form.tpl');
    }

    public function delete($menu_id)
    {
        // 削除処理をしたら一覧に戻る
        redirect(base_url().'menu/list');
    }

    public function favorite_menu_list()
    {
        // Ajax通信の場合のみ処理する
        if($this->input->is_ajax_request()) {
            $data['favorite_menu_list'] = array(
                array('menu_id' => '1', 'menu_name' => 'チキンカツ定食'),
                array('menu_id' => '2', 'menu_name' => 'カレーライス'),
                array('menu_id' => '3', 'menu_name' => 'ラーメン'),
                array('menu_id' => '4', 'menu_name' => '生姜焼き定食'),
                array('menu_id' => '5', 'menu_name' => 'うどん'),
                array('menu_id' => '6', 'menu_name' => '長崎ちゃんぽん'),
                array('menu_id' => '7', 'menu_name' => 'そば'),
                array('menu_id' => '8', 'menu_name' => 'チキンカレー'),
            );

            $this->smarty->assign($data);
            $this->display('menu/favorite_menu_list.tpl');
        }
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
            $data['kubun'] = $this->lang->line('kubun');

            $this->smarty->assign($data);
            $this->display('menu/excel_download.tpl');
        }
    }

    public function tag() {
        // Ajax通信の場合のみ処理する
        if($this->input->is_ajax_request()) {
            echo json_encode(array('ヘルシーメニュー', '減塩','1日に必要な野菜の1/3使用', 'Healty Menu'));
        }
    }
}
