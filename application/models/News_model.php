<?php

class News_model extends MY_Model
{
    protected $table = 'news';
    protected $per_page = 10;
    private $count;

    public function get_news($offset = false, $content = false, $start_year = false, $start_month = false, $end_year = false, $end_month = false, $now_news = false)
    {
        $this->where($content, $start_year, $start_month, $end_year, $end_month, $now_news);
        $this->count = $this->db->count_all_results($this->table);

        $this->where($content, $start_year, $start_month, $end_year, $end_month, $now_news);
        $this->db->order_by('start_date','desc');
        $this->db->order_by('updated_at','desc');
        if($offset !== false){
            $this->db->limit($this->per_page, $offset);
        }
        return $this->find();
    }

    public function get_now_news()
    {
        $this->db->where(array('start_date <=' => date('Y/m/d'), 'end_date >=' => date('Y/m/d')));
        $this->db->order_by('start_date','desc');
        $this->db->order_by('updated_at','desc');
        return $this->find();
    }

    public function get_count_all()
    {
        return $this->count;
    }

    private function where($content = false, $start_year = false, $start_month = false, $end_year = false, $end_month = false, $now_news = false)
    {
        if($content) {
            $this->db->like('content', $content);
        }
        if($start_year) {
            $this->db->where("date_part('year', start_date) >=", $start_year);
        }
        if($start_month) {
            $this->db->where("date_part('month', start_date) >=", $start_month);
        }
        if($end_year) {
            $this->db->where("date_part('year', end_date) <=", $end_year);
        }
        if($end_month) {
            $this->db->where("date_part('month', end_date) <=", $end_month);
        }
        if($now_news) {
            $this->db->where(array('start_date <=' => date('Y/m/d'), 'end_date >=' => date('Y/m/d')));
        }
    }
}