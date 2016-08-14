<?php

class News_model extends MY_Model
{
    protected $table = 'news';
    protected $per_page = 10;

    public function get_news($offset = false)
    {
        $this->db->order_by('start_date','desc');
        $this->db->order_by('updated_at','desc');
        if($offset !== false){
            $this->db->limit($this->per_page, $offset);
        }
        return $this->find();
    }
}