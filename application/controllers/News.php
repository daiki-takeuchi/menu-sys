<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class News extends MY_Controller {

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

    protected $page_title = 'お知らせ';

    public function index()
    {
        $data['year']['values'] = array(date('Y')-1,date('Y'),date('Y')+1);
        $data['year']['selected'] = date('Y');
        for ($i=1; $i<=12; $i++){
            $data['month']['values'][] = $i;
        }
        $data['month']['selected'] = date('n');

        $data['news_list'] = array(
            array('id' => 1, 'start_date' => '2016/7/7', 'end_date' => '2016/7/12', 'contents' => '【メンテナンスのお知らせ】7月29日(金) 午前6時00分 〜 午前8時00分の間、サーバーメンテナンスのためご利用頂けません。'),
            array('id' => 2, 'start_date' => '2016/7/7', 'end_date' => '2016/7/12', 'contents' => '【News2】このテキストはNewsTicker用のダミーテキスト［2］です。'),
            array('id' => 3, 'start_date' => '2016/7/7', 'end_date' => '2016/7/12', 'contents' => '【News3】このテキストはNewsTicker用のダミーテキスト［3］です。'),
        );

        // pagerの作成
        $data['pager'] = [];

        $this->smarty->assign($data);
        $this->display('news/index.tpl');
    }

    public function news_new()
    {
        $this->edit();
    }

    public function edit($news_id = null)
    {
        parent::edit($news_id);

        $this->display('news/news_form.tpl');
    }

    public function delete($news_id)
    {
        // 削除処理をしたら一覧に戻る
        redirect(base_url().'news');
    }
}
