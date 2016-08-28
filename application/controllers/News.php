<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * News Controller
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

        // 検索条件の保存を削除
        $this->session->set_userdata('pager_menu', null);
        $this->session->set_userdata('pager_user', null);

        $this->load->model('news_model');
        $this->news_model->setUserName($this->user_name);
    }

    public function index()
    {
        $offset = $this->uri->segment(3 ,0);
        $content = $start_year = $start_month = $end_year = $end_month = $now_news = null;
        // Postデータを取得
        if($this->input->post()) {
            $this->session->set_userdata('pager_news', $this->input->post());
        }
        $session = $this->session->get_userdata();
        if(isset($session['pager_news'])) {
            $post = $session['pager_news'];
            $content = $post['content'];
            $content = isset($content) && !is_null($content) ? $content : null;
            $start_year = isset($post['start_year'])?$post['start_year']:null;
            $start_month = isset($post['start_month'])?$post['start_month']:null;
            $end_year = isset($post['end_year'])?$post['end_year']:null;
            $end_month = isset($post['end_month'])?$post['end_month']:null;
            $now_news = isset($post['now_news'])?$post['now_news']:null;
        }

        // 登録されているデータを全件取得
        $data['news_list'] = $this->news_model->get_news($offset, $content, $start_year, $start_month, $end_year, $end_month, $now_news);

        $data['content'] = $content;
        $data['start_year_selected'] = $start_year;
        $data['start_month_selected'] = $start_month;
        $data['end_year_selected'] = $end_year;
        $data['end_month_selected'] = $end_month;
        $data['now_news'] = $now_news;

        $data['year'] = array('', date('Y')-1,date('Y'),date('Y')+1);
        $data['month'][] = '';
        for ($i=1; $i<=12; $i++){
            $data['month'][] = $i;
        }
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

        // 選択したお知らせ情報を取得
        $news = $this->news_model->find($news_id);
        if (empty($news) && !empty($news_id)) {
            $this->display('news/not_found.tpl');
            return;
        }

        if($this->input->post()) {
            if ($news_id === null) $news =[];
            $news = array_merge($news, $this->input->post());
            if($this->_save($news)) {
                $this->alert('保存しました。');
                redirect(base_url() . 'news/edit/' . $news['id']);
            }
        }
        $data['news'] = $news;

        $back_url = base_url() . 'news';
        $http_referer = $this->input->server('HTTP_REFERER');
        if(strstr($http_referer, base_url()) && !strstr($http_referer, $this->uri->uri_string) && !strstr($http_referer, 'news/new')) {
            $back_url = $_SERVER['HTTP_REFERER'];
        }
        $data['back_url'] = $back_url;

        $this->smarty->assign($data);
        $this->display('news/news_form.tpl');
    }

    public function delete($news_id)
    {
        $news = $this->news_model->find($news_id);
        if(isset($news['id'])) {
            $this->news_model->delete($news);
        }
        $this->alert('削除しました。');
        // 削除処理をしたら一覧に戻る
        redirect(base_url().'news');
    }

    private function _save(&$news) {
        if ($this->form_validation->run('news/save') === false) {
            return false;
        }
        $this->news_model->save($news);
        $news = $this->news_model->find($news['id']);
        return true;
    }
}
