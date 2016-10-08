<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Class Menu
 *
 * @property Menu_model $menu_model
 * @property News_model $news_model
 * @property Category_model $category_model
 * @property Reservation_model $reservation_model
 */
class Menu extends MY_Controller {

    const BREAKFAST = '1';
    const LUNCH = '2';
    const DINNER = '3';

    protected $page_title = 'メニュー';
    private $kubun = self::LUNCH;

    public function __construct()
    {
        parent::__construct();

        // 検索条件の保存を削除
        $this->session->set_userdata('pager_news', null);
        $this->session->set_userdata('pager_user', null);

        $this->load->model('menu_model');
        $this->load->model('news_model');
        $this->load->model('category_model');
        $this->load->model('reservation_model');

        $this->menu_model->setUserName($this->user_name);
        $this->news_model->setUserName($this->user_name);
        $this->category_model->setUserName($this->user_name);
        $this->reservation_model->setUserName($this->user_name);
    }

    public function index($y = false, $m = false, $d = false)
    {
        $reference_time = $this->config->item('reference_time');
        $date = $this->get_date($y, $m, $d);

        // 予約ボタン押下時
        if($this->input->post()) {

            // 予約時刻が過ぎている場合はアラート表示
            if(later_than_reference_time(date('Y/m/d',$date))) {
                $this->alert('予約は当日' . date('G:i', $reference_time) . 'までです。');
                redirect(current_url());
            }

            $ids = $this->input->post('id');
            $quantity = $this->input->post('quantity');
            $whether_with_rices = $this->input->post('whether_with_rice');
            $i = 0;
            foreach ($ids as $id) {
                $reservation = $this->reservation_model->find_by(['menu_id' => $id, 'user_id' => $this->user_id]);
                if($quantity[$i] !== '0') {
                    $reservation['menu_id'] = $id;
                    $reservation['user_id'] = $this->user_id;
                    $reservation['company_cc'] = $this->company_cc;
                    $reservation['soshiki_cc'] = $this->soshiki_cc;
                    $reservation['soshiki_nm'] = $this->soshiki_nm;
                    $reservation['shain_bn'] = $this->shain_bn;
                    $reservation['user_name'] = $this->user_name;
                    $reservation['quantity'] = $quantity[$i];
                    $reservation['whether_with_rice'] = $whether_with_rices[$i];
                    $this->reservation_model->save($reservation);
                } elseif(!empty($reservation)) {
                    $this->reservation_model->delete($reservation);
                }
                $i++;
            }
            $this->alert('予約しました。');
            redirect(current_url());
        }
        $data['page'] = 'index';
        $data['kubun'] = array_column($this->lang->line('kubun'), 'kubun_nm', 'kubun_en');
        $data['selected_kubun'] = array_column($this->lang->line('kubun'), 'kubun_en', 'kubun_cc')[$this->kubun];
        $data['news_list'] = $this->news_model->get_now_news();

        $monday = $this->get_this_monday($date);

        $i = 0;
        $data['week'] = [];
        foreach ($this->lang->line('week') as $item) {
            $menus = $this->menu_model->find_by(['supply_date' => date('Y/m/d', strtotime($i . ' day', $monday)), 'open_date <=' => date('Y/m/d')]);
            if($menus) {
                $data['week'][$item] = date('Y/m/d', strtotime($i . ' day', $monday));
            }
            $i++;
        }

        $i = 0;
        $data['reservation'] = [];
        foreach ($data['week'] as $item) {
            $data['reservation'][$item] =
                $this->reservation_model->is_reserved($item, $this->kubun, $this->user_id);
            $i++;
        }

        $data['href'] = base_url() . 'menu/' . date('Y/m/d', $date);
        $data['menu_list'] = $this->get_menu(date('Y/m/d', $date));
        $data['sum_price'] = $this->get_sum_price(date('Y/m/d', $date));
        $data['selected_date'] = date('Y/m/d', $date);
        $data['next_date'] = $this->get_next_date($date);
        $data['prev_date'] = $this->get_prev_date($date);
        $data['reference_time'] = $reference_time;

        $this->smarty->assign($data);
        $this->display('menu/index.tpl');
    }

    public function breakfast($y = false, $m = false, $d = false)
    {
        $this->kubun = self::BREAKFAST;
        $this->index($y, $m, $d);
    }

    public function lunch($y = false, $m = false, $d = false)
    {
        $this->kubun = self::LUNCH;
        $this->index($y, $m, $d);
    }

    public function dinner($y = false, $m = false, $d = false)
    {
        $this->kubun = self::DINNER;
        $this->index($y, $m, $d);
    }

    public function search()
    {
        $offset = $this->uri->segment(3 ,0);
        $menu_name = $category_id = $start_year = $start_month = $end_year = $end_month = null;
        // Postデータを取得
        if($this->input->post()) {
            $this->session->set_userdata('pager_menu', $this->input->post());
        }
        $session = $this->session->get_userdata();
        if(isset($session['pager_menu'])) {
            $post = $session['pager_menu'];
            $menu_name = $post['menu_name'];
            $menu_name = isset($menu_name) && !is_null($menu_name) ? $menu_name : null;
            $category_id = isset($post['category_id'])?$post['category_id']:null;
            $start_year = isset($post['start_year'])?$post['start_year']:null;
            $start_month = isset($post['start_month'])?$post['start_month']:null;
            $end_year = isset($post['end_year'])?$post['end_year']:null;
            $end_month = isset($post['end_month'])?$post['end_month']:null;
        }
        $data['menu_list'] = $this->menu_model->get_menu($offset, $menu_name, $category_id, $start_year, $start_month, $end_year, $end_month);
        $data['menu_name'] = $menu_name;
        $data['selected'] = $category_id;

        $data['year'] = array('', date('Y')-1,date('Y'),date('Y')+1);
        $data['month'][] = '';
        for ($i=1; $i<=12; $i++){
            $data['month'][] = $i;
        }
        $data['start_year_selected'] = $start_year;
        $data['start_month_selected'] = $start_month;
        $data['end_year_selected'] = $end_year;
        $data['end_month_selected'] = $end_month;

        // マスター情報を取得
        $category = [];
        $kubuns = array_column($this->lang->line('kubun'), 'kubun_nm', 'kubun_cc');
        foreach ($kubuns as $kubun => $value) {
            $category[$value] = array_column($this->category_model->get_categorys($kubun), 'category_name', 'id');
        }
        $data['category'] = $category;
        $data['category_master'] = array_column($this->category_model->get_categorys(), 'category_name', 'id');

        // pagerの作成
        $data['pager'] = $this->menu_model->get_pagination();

        $this->smarty->assign($data);
        $this->display('menu/menu_search.tpl');
    }

    public function menu_list($y = false, $m = false, $d = false)
    {
        if($this->input->post()) {
            $ids = $this->input->post('id');
            $max_supply_nums = $this->input->post('max_supply_num');
            $actual_supply_nums = $this->input->post('actual_supply_num');
            $i = 0;
            foreach ($ids as $id) {
                if($max_supply_nums[$i] || $actual_supply_nums[$i]) {
                    $menu = $this->menu_model->find($id);
                    $menu['max_supply_num'] = $max_supply_nums[$i];
                    $menu['actual_supply_num'] = $actual_supply_nums[$i];
                    $this->menu_model->save($menu);
                }
                $i++;
            }
            $this->alert('食数を保存しました。');
            redirect(current_url());
        }
        $data['page'] = 'menu_list';
        $data['kubun'] = array_column($this->lang->line('kubun'), 'kubun_nm', 'kubun_en');
        $data['selected_kubun'] = array_column($this->lang->line('kubun'), 'kubun_en', 'kubun_cc')[$this->kubun];
        $data['news_list'] = $this->news_model->get_now_news();

        $date = $this->get_date($y, $m, $d);
        $monday = $this->get_this_monday($date);

        $i = 0;
        $data['week'] = [];
        foreach ($this->lang->line('week') as $item) {
            $menus = $this->menu_model->find_by(['supply_date' => date('Y/m/d', strtotime($i . ' day', $monday))]);
            if($menus) {
                $data['week'][$item] = date('Y/m/d', strtotime($i . ' day', $monday));
            }
            $i++;
        }

        $i = 0;
        $data['reservation'] =[];
        foreach ($data['week'] as $item) {
            $data['reservation'][$item] =
                $this->reservation_model->is_reserved($item, $this->kubun, $this->user_id);
            $i++;
        }

        $data['href'] = site_url() . 'menu/' . date('Y/m/d', $date);
        $data['menu_list'] = $this->get_menu_all(date('Y/m/d', $date));
        $data['selected_date'] = date('Y/m/d', $date);
        $data['next_date'] = $this->get_next_date($date, $is_all = true);
        $data['prev_date'] = $this->get_prev_date($date, $is_all = true);

        $this->smarty->assign($data);
        $this->display('menu/menu_list.tpl');
    }

    public function list_breakfast($y = false, $m = false, $d = false)
    {
        $this->kubun = self::BREAKFAST;
        $this->menu_list($y, $m, $d);
    }

    public function list_lunch($y = false, $m = false, $d = false)
    {
        $this->kubun = self::LUNCH;
        $this->menu_list($y, $m, $d);
    }

    public function list_dinner($y = false, $m = false, $d = false)
    {
        $this->kubun = self::DINNER;
        $this->menu_list($y, $m, $d);
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

    public function copy($menu_id)
    {
        $menu = $this->menu_model->find($menu_id);
        if (empty($menu) && !empty($menu_id)) {
            $this->display('menu/not_found.tpl');
            return;
        }

        $menu['supply_date'] = $menu['open_date'] = null;
        $this->session->set_flashdata('menu', $menu);
        redirect(base_url() . 'menu/new');
    }

    public function edit($menu_id = null)
    {
        parent::edit($menu_id);

        // 選択したメニュー情報を取得
        $menu = $this->menu_model->find($menu_id);
        if (empty($menu) && !empty($menu_id)) {
            $this->display('menu/not_found.tpl');
            return;
        }

        if($this->session->flashdata('menu')) {
            $menu = $this->session->flashdata('menu');
        }

        if($this->input->post()) {
            if ($menu_id === null) $menu =[];
            $menu = array_merge($menu, $this->input->post());
            if($this->_save($menu)) {
                $this->alert('保存しました。');
                redirect(base_url() . 'menu/edit/' . $menu['id']);
            }
        }

        $data['menu'] = $menu;
        $data['reservation_count'] = $this->reservation_model->get_reservation_count($menu['id']);

        $category = [];
        $kubuns = array_column($this->lang->line('kubun'), 'kubun_nm', 'kubun_cc');
        foreach ($kubuns as $kubun => $value) {
            $category[$value] = array_column($this->category_model->get_categorys($kubun), 'category_name', 'id');
        }
        $data['category'] = $category;

        $back_url = base_url() . 'menu/list';
        $http_referer = $this->input->server('HTTP_REFERER');
        if(strstr($http_referer, base_url()) && !strstr($http_referer, $this->uri->uri_string) && !strstr($http_referer, 'menu/new')) {
            $back_url = $http_referer;
        }
        $data['back_url'] = $back_url;

        $this->smarty->assign($data);
        $this->display('menu/menu_form.tpl');
    }

    public function delete($menu_id)
    {
        $menu = $this->menu_model->find($menu_id);
        $supply_date = $menu['supply_date'];
        if(isset($menu['id'])) {
            if ($this->reservation_model->get_reservation_count($menu['id']) > 0) {
                $this->alert('このメニューは予約が入っているため、削除できません。');
                // 削除できなければ元の画面に戻る
                redirect(base_url().'menu/edit/' . $menu['id']);
            }
            $this->menu_model->delete($menu);
        }
        $this->alert('削除しました。');
        // 削除処理をしたら一覧に戻る
        redirect(base_url().'menu/list/' . date("Y/m/d",strtotime($supply_date)));
    }

    public function excel_download()
    {
        // Ajax通信の場合のみ処理する
        if($this->input->is_ajax_request()) {
            $data['form_list'] = array('1' => '予約者リスト', '2' => '予約数（組織別）', '3' => '食数実績表', '4' => '食堂取組報告', );

            $data['year']['values'] = array(date('Y')-1,date('Y'),date('Y')+1);
            $data['year']['selected'] = date('Y');
            for ($i=1; $i<=12; $i++){
                $data['month']['values'][] = $i;
            }
            $data['month']['selected'] = date('n');
            $data['kubun'] = array_column($this->lang->line('kubun'), 'kubun_nm', 'kubun_cc');
            $data['reference_time'] = $this->config->item('reference_time');

            $this->smarty->assign($data);
            $this->display('menu/excel_download.tpl');
        }
    }

    public function tag() {
        // Ajax通信の場合のみ処理する
        if($this->input->is_ajax_request()) {
            $tags = [];
            $tag_list = array_column($this->menu_model->get_tags(),"tag");
            foreach ($tag_list as $tag) {
                $tmp = explode(',', $tag);
                foreach ($tmp as $value) {
                    $tags[] = $value;
                }
            }
            $tags = array_unique(array_merge(array('ヘルシーメニュー', '減塩','1日に必要な野菜の1/3使用', 'Healty Menu'), $tags));
            echo json_encode($tags);
       }
    }

    private function _save(&$menu) {
        if ($this->form_validation->run('menu/save') === false) {
            return false;
        }
        $this->menu_model->save($menu);
        $menu = $this->menu_model->find($menu['id']);
        return true;
    }

    private function get_date($y = false, $m = false, $d = false) {
        if(checkdate($m, $d, $y)) {
            $date = strtotime(date("Y/m/d",strtotime($y .'/' . $m .'/' . $d)));
        } elseif($y === false || $m === false || $d === false) {
            $date = strtotime(date('Y/m/d'));
        } else {
            redirect(base_url() . 'menu/list');
        }
        return $date;
    }

    private function get_this_monday($date) {
        return (strtotime('monday', $date) == strtotime('today', $date))? strtotime('monday', $date):strtotime('last monday', $date);
    }

    private function get_this_sunday($date) {
        return strtotime('sunday', $date);
    }

    private function get_menu($supply_date, $is_all = false) {

        $cat = $this->category_model->get_categorys($this->kubun);
        $ret = [];
        foreach ($cat as $item) {
            $where = array('supply_date' => $supply_date, 'category_id' => intval($item['id']));
            if(!$is_all) {
                $where['open_date <='] = date('Y/m/d');
            }
            $menus = $this->menu_model->find_by($where, true);
            foreach ($menus as &$menu) {
                $reservation = $this->reservation_model->find_by(['menu_id' => $menu['id'], 'user_id' => $this->user_id]);
                if(!$reservation) $reservation = [];
                $reservation['reservation_count'] = $this->reservation_model->get_reservation_count($menu['id']);
                $menu = $menu + $reservation;
            }
            if($menus) {
                $ret[$item['id']]['menu'] = $menus;
                $ret[$item['id']]['image_file'] = $item['image_file'];
            }
        }
        return $ret;
    }

    private function get_menu_all($supply_date) {
        return $this->get_menu($supply_date, true);
    }

    private function get_sum_price($supply_date) {

        $cat = $this->category_model->get_categorys($this->kubun);
        $ret = '0';
        if(in_array($this->shain_keitai_cc, array('01','02','03','04'))) {
            $price = 'price_regular';
        } else {
            $price = 'price_non_regular';
        }
        foreach ($cat as $item) {
            $where = array('supply_date' => $supply_date, 'category_id' => intval($item['id']), 'open_date <=' => date('Y/m/d'));
            $menus = $this->menu_model->find_by($where, true);
            foreach ($menus as $menu) {
                $reservation = $this->reservation_model->find_by(['menu_id' => $menu['id'], 'user_id' => $this->user_id]);
                if($reservation) {
                    if($reservation['whether_with_rice']) {
                        $ret += (intval($menu[$price . '_with_rice']) * intval($reservation['quantity']));
                    } else {
                        $ret += (intval($menu[$price]) * intval($reservation['quantity']));
                    }
                }
            }
        }
        return number_format($ret);
    }

    private function get_next_date($date, $is_all = false) {
        $ret = null;
        // 日曜日
        $sunday = date('Y/m/d', $this->get_this_sunday($date));
        $where = array('supply_date >' => $sunday);
        if(!$is_all) {
            $where['open_date <='] = date('Y/m/d');
        }
        $menus = $this->menu_model->order_by('supply_date','asc')->find_by($where, true);
        if($menus) {
            $ret = $menus[0]['supply_date'];
        }
        return $ret;
    }

    private function get_prev_date($date, $is_all = false) {
        $ret = null;
        // 月曜日
        $monday = date('Y/m/d', $this->get_this_monday($date));
        $where = array('supply_date <' => $monday);
        if(!$is_all) {
            $where['open_date <='] = date('Y/m/d');
        }
        $menus = $this->menu_model->order_by('supply_date','desc')->find_by($where, true);
        if($menus) {
            $ret = $menus[0]['supply_date'];
        }
        return $ret;
    }
}
