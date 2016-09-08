<?php

/**
 * Class Reservation_model
 *
 */
class Reservation_model extends MY_Model
{
    protected $table = 'reservation';

    public function get_reservation_count($menu_id) {

        $this->db->select_sum('quantity');
        $query = $this->find_by(['menu_id' => intval($menu_id)]);
        return is_null($query['quantity'])?0:$query['quantity'];
    }

    public function is_reserved($date, $user_id) {

        $query = $this->db->get_where('menu', ['supply_date' => $date]);
        $result = $query->result_array();

        foreach ($result as $menu) {
            $reserve = $this->find_by(['user_id' => $user_id, 'menu_id' => $menu['id']]);
            if($reserve) return true;
        }
        return false;
    }
}