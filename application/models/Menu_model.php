<?php

/**
 * Class Menu_model
 *
 * @property Generate_pagination $generate_pagination
 */
class Menu_model extends MY_Model
{
    protected $table = 'menu';
    protected $per_page = 10;
    private $count;

    public function get_menu($offset = false, $menu_name = false, $category_id = false, $start_year = false, $start_month = false, $end_year = false, $end_month = false)
    {
        $this->where($menu_name, $category_id, $start_year, $start_month, $end_year, $end_month);
        $this->count = $this->db->count_all_results($this->table);

        $this->where($menu_name, $category_id, $start_year, $start_month, $end_year, $end_month);
        $this->db->order_by('supply_date', 'desc');
        $this->db->order_by('category_id');
        if($offset !== false){
            $this->db->limit($this->per_page, $offset);
        }
        return $this->find();
    }

    public function get_tags() {
        $this->db->select('tag');
        $this->db->distinct();
        $this->db->where('tag Is Not Null');
        return $this->find();
    }

    public function get_count_all()
    {
        return $this->count;
    }

    public function get_pagination()
    {
        $this->load->library('Generate_pagination');
        $path = base_url() . $this->table . "/search";
        $total_rows = $this->get_count_all();

        $pagination = $this->generate_pagination->get_links($path, $total_rows, $this->per_page);

        return $pagination;
    }

    private function where($menu_name = false, $category_id = false, $start_year = false, $start_month = false, $end_year = false, $end_month = false)
    {
        if($menu_name) {
            $this->db->like('menu_name', $menu_name);
        }
        if($category_id) {
            $this->db->where_in("category_id", $category_id);
        }
        if($start_year) {
            $this->db->where("date_part('year', supply_date) >=", $start_year);
        }
        if($start_month) {
            $this->db->where("date_part('month', supply_date) >=", $start_month);
        }
        if($end_year) {
            $this->db->where("date_part('year', supply_date) <=", $end_year);
        }
        if($end_month) {
            $this->db->where("date_part('month', supply_date) <=", $end_month);
        }
    }
}