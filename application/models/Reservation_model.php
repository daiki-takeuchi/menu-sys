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
        $query = $this->find_by(array('menu_id' => intval($menu_id)));
        return is_null($query['quantity'])?0:$query['quantity'];
    }

}