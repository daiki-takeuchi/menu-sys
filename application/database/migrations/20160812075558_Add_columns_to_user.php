<?php
/**
 * Migration: Add_columns_to_user
 *
 * Created by: Cli for CodeIgniter <https://github.com/kenjis/codeigniter-cli>
 * Created on: 2016/08/12 07:55:58
 */
class Migration_Add_columns_to_user extends CI_Migration {

    public function up()
    {
        // Adding a Column to a Table
        $fields = array(
            'first_login' => array('type' => 'char', 'constraint' => '1', 'default' => '1'),
        );
        $this->dbforge->add_column('user', $fields);
    }

    public function down()
    {
        // Dropping a Column From a Table
        $this->dbforge->drop_column('user', 'created_at');
    }

}
