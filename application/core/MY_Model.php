<?php

/**
 * Created by PhpStorm.
 * User: DaikiTakeuchi
 * Date: 2016/07/16
 * Time: 11:04
 * @property Generate_pagination      $generate_pagination
 */
class MY_Model extends CI_Model
{
    protected $table;
    protected $per_page;

    protected $user_name;

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function setUserName($user_name) {
        $this->user_name = $user_name;
    }

    public function find($id = false)
    {
        if ($id === false) {
            // SQLを実行
            $query = $this->db->get($this->table);
            log_message('info', $this->db->last_query());
            return $query->result_array();
        }

        $query = $this->db->get_where($this->table, array('id' => $id));
        log_message('info', $this->db->last_query());
        return $query->row_array();
    }

    public function find_by($where = false, $is_array = false)
    {
        $query = $this->db->get_where($this->table, $where);
        log_message('info', $this->db->last_query());
        if($query->num_rows() > 1 || $is_array === true) {
            $ret = $query->result_array();
        } else {
            $ret = $query->row_array();
        }
        return $ret;
    }

    public function order_by($orderby, $direction = '')
    {
        $this->db->order_by($orderby, $direction);
        return $this;
    }

    public function save(&$data)
    {
        if (!isset($data['id'])) {
            $data['created_at'] = $data['updated_at'] = date('Y/m/d H:i:s');
            $data['created_user'] = $data['updated_user'] = $this->user_name;
            $this->set($data);
            $this->db->insert($this->table);
            $data['id'] = $this->db->insert_id();
        } else {
            $data['updated_at'] = date('Y/m/d H:i:s');
            $data['updated_user'] = $this->user_name;
            $this->db->where('id', $data['id']);
            $this->set($data);
            $this->db->update($this->table);
        }
        log_message('info', $this->db->last_query());
    }

    public function delete(&$data)
    {
        $this->db->where('id', $data['id']);
        $this->db->delete($this->table);

        // 空にする
        $data = array();
        log_message('info', $this->db->last_query());
    }

    public function get_count_all()
    {
        return $this->db->count_all_results($this->table);
    }

    public function get_pagination()
    {
        $this->load->library('Generate_pagination');
        $path = base_url() . $this->table . "/pages";
        $total_rows = $this->get_count_all();

        $pagination = $this->generate_pagination->get_links($path, $total_rows, $this->per_page);

        return $pagination;
    }

    public function get_max_id()
    {
        $this->db->order_by('id', 'desc');
        $this->db->limit(1);
        $query = $this->db->get($this->table);
        return $query->row_array()['id'];
    }

    public function lock_table()
    {
        $sql = 'LOCK TABLE ' . $this->table . ' IN EXCLUSIVE MODE';
        $this->db->query($sql);
    }

    private function set($data) {
        foreach ($data as $key => $value) {
            $this->db->set($key, empty($value)?null:$value);
        }
    }
}