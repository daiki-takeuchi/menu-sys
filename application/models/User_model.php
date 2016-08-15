<?php

class User_model extends MY_Model
{
    protected $table = 'user';
    protected $per_page = 10;

    public function can_log_in($shain_bn, $password){

        $this->db->where("shain_bn", $shain_bn);
        $this->db->where("password", sha1($shain_bn.$password));
        $query = $this->db->get($this->table);

        return $query->num_rows() === 1;
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

    public function get_organization($company_cc) {
        $this->db->select("soshiki_cc, soshiki_nm");
        $this->db->distinct();
        $this->db->where("company_cc",strval($company_cc));
        $this->db->order_by("soshiki_cc");
        $query = $this->db->get($this->table);
        return $query->result_array();
    }

    public function get_organization_for_select($company_cc) {
        $this->db->select("company_cc || '|' || soshiki_cc soshiki_cc , soshiki_nm");
        $this->db->distinct();
        $this->db->where("company_cc",strval($company_cc));
        $this->db->order_by("soshiki_cc");
        $query = $this->db->get($this->table);
        return $query->result_array();
    }
}