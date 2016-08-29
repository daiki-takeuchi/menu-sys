<?php
/**
 * Migration: Add_columns_to_menu
 *
 * Created by: Cli for CodeIgniter <https://github.com/kenjis/codeigniter-cli>
 * Created on: 2016/08/29 10:37:13
 */
class Migration_Add_columns_to_menu extends CI_Migration {

    public function up()
    {
        // Adding a Column to a Table
        $fields = array(
            'max_supply_num' => array('type' => 'int', 'null' => true),
            'actual_supply_num' => array('type' => 'int', 'null' => true),
        );
        $this->dbforge->add_column('menu', $fields);
    }

    public function down()
    {
        // Dropping a Column From a Table
        $this->dbforge->drop_column('menu', 'max_supply_num');
        $this->dbforge->drop_column('menu', 'actual_supply_num');
    }
}
