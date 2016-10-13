<?php

/**
 * Class Organization_model
 *
 */
class Organization_model extends MY_Model
{
    protected $table = 'organization';

    public function get_organization($company_cc, $date) {
        $this->db->select("soshiki_cc, soshiki_nm");
        $this->db->where("company_cc",strval($company_cc));
        $this->db->where("start_date <=",$date);
        $this->db->where("end_date >=",$date);
        $this->db->order_by("soshiki_cc");
        return $this->find();
    }

    public function get_organization_for_select($company_cc, $start_date) {
        $this->db->select("company_cc || '|' || soshiki_cc soshiki_cc , soshiki_nm");
        $this->db->where("company_cc",strval($company_cc));
        $this->db->where("start_date <=",$start_date);
        $this->db->order_by("soshiki_cc");
        return $this->find();
    }
}