<?php

class User_model extends MY_Model
{
    protected $table = 'user';
    protected $per_page = 10;
    private $count;

    public function can_log_in($shain_bn, $password){

        $this->db->where("shain_bn", $shain_bn);
        $this->db->where("password", sha1($shain_bn.$password));
        $query = $this->db->get($this->table);

        return $query->num_rows() === 1;
    }

    public function get_users($offset = false, $name = false, $soshiki_cc = false)
    {
        $this->where($name, $soshiki_cc);
        $this->count = $this->db->count_all_results($this->table);

        $this->where($name, $soshiki_cc);
        $this->db->order_by('id');
        if($offset !== false){
            $this->db->limit($this->per_page, $offset);
        }
        return $this->find();
    }

    public function get_count_all()
    {
        return $this->count;
    }

    private function where($name = false, $soshiki_cc = false)
    {
        if($name) {
            $this->db->like('name', $name);
        }
        if($soshiki_cc) {
            $this->db->where_in("company_cc || '|' || soshiki_cc", $soshiki_cc);
        }
    }
}