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

    protected $page_title = 'メニュー';

    public function index()
	{
        $data['category'] = array('1' => '朝食', '2' => 'ランチ', '3' => '夕食');
        $data['news_list'] = array(
            array('date' => '2016/7/7', 'content' => '【メンテナンスのお知らせ】7月29日(金) 午前6時00分 〜 午前8時00分の間、サーバーメンテナンスのためご利用頂けません。'),
            array('date' => '2016/7/7', 'content' => '【News2】このテキストはNewsTicker用のダミーテキスト［2］です。'),
            array('date' => '2016/7/7', 'content' => '【News3】このテキストはNewsTicker用のダミーテキスト［3］です。'),
        );

        $this->smarty->assign($data);
        $this->display('menu/index.tpl');
	}

    public function menu_list()
    {
        $data['category'] = array('1' => '朝食', '2' => 'ランチ', '3' => '夕食');
        $data['news_list'] = array(
            array('date' => '2016/7/7', 'content' => '【メンテナンスのお知らせ】7月29日(金) 午前6時00分 〜 午前8時00分の間、サーバーメンテナンスのためご利用頂けません。'),
            array('date' => '2016/7/7', 'content' => '【News2】このテキストはNewsTicker用のダミーテキスト［2］です。'),
            array('date' => '2016/7/7', 'content' => '【News3】このテキストはNewsTicker用のダミーテキスト［3］です。'),
        );

        $this->smarty->assign($data);
        $this->display('menu/menu_list.tpl');
    }

    public  function news_list() {
        // Ajax通信の場合のみ処理する
        if($this->input->is_ajax_request()) {

            $data['news_list'] = array(
                array('date' => '2016/7/7', 'content' => '【メンテナンスのお知らせ】7月29日(金) 午前6時00分 〜 午前8時00分の間、サーバーメンテナンスのためご利用頂けません。'),
                array('date' => '2016/7/7', 'content' => '【News2】このテキストはNewsTicker用のダミーテキスト［2］です。'),
                array('date' => '2016/7/7', 'content' => '【News3】このテキストはNewsTicker用のダミーテキスト［3］です。'),
            );

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

        $this->display('menu/menu_form.tpl');
    }

    public function delete($menu_id)
    {
        // 削除処理をしたら一覧に戻る
        redirect(base_url().'menu/list');
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
            $data['category'] = array('1' => '朝食', '2' => 'ランチ', '3' => '夕食');

            $this->smarty->assign($data);
            $this->display('menu/excel_download.tpl');
        }
    }
}
