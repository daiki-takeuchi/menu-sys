<?php

class News_model extends MY_Model
{
    protected $table = 'news';
    protected $per_page = 15;

    public function get_news($offset = false)
    {
        $this->db->order_by('start_date','desc');
        if($offset !== false){
            $this->db->limit($this->per_page, $offset);
        }
        return $this->find();
    }
}