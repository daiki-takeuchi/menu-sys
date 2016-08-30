<?php

/**
 * Class Category_model
 *
 */
class Category_model extends MY_Model
{
    protected $table = 'category';

    public function get_categorys($kubun = false)
    {
        if($kubun) {
            $this->db->where('kubun', intval($kubun));
        }
        $this->db->order_by('kubun');
        $this->db->order_by('sort_number');
        return $this->find();
    }
}