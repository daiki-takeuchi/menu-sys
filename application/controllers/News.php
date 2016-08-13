<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * News User
 *
 * @property News_model $news_model
 */
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

    public function __construct()
    {
        parent::__construct();
        $this->load->model('news_model');

    }

    public function index()
    {
        $offset = $this->uri->segment(3 ,0);
        // 登録されているデータを全件取得
        $data['news_list'] = $this->news_model->get_news($offset);

        $data['year']['values'] = array(date('Y')-1,date('Y'),date('Y')+1);
        $data['year']['selected'] = date('Y');
        for ($i=1; $i<=12; $i++){
            $data['month']['values'][] = $i;
        }
        $data['month']['selected'] = date('n');

        // pagerの作成
        $data['pager'] = $this->news_model->get_pagination();

        $this->smarty->assign($data);
        $this->display('news/index.tpl');
    }

    public function pages()
    {
        $this->index();
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
