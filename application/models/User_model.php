<?php

class User_model extends MY_Model
{
    protected $table = 'user';
    protected $per_page = 10;

    public function can_log_in($shain_bn, $password){

        $this->db->where("shain_bn", $shain_bn);
        $this->db->where("password", sha1($shain_bn.$password));
        $query = $this->db->get($this->table);

        if($query->num_rows() === 1){
            return true;
        }else{
            return false;
        }
    }

    public function find_by_shain_bn($shain_bn = false)
    {
        $query = $this->db->get_where($this->table, array("shain_bn" => $shain_bn));
        return $query->row_array();
    }

    public function get_users($offset = false)
    {
        $this->db->order_by('id');
        if($offset !== false){
            $this->db->limit($this->per_page, $offset);
        }
        return $this->find();
    }
}