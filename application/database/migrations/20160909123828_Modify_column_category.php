<?php

/**
 * Migration: Modify_column_category
 *
 * Created by: Cli for CodeIgniter <https://github.com/kenjis/codeigniter-cli>
 * Created on: 2016/09/09 12:38:28
 */
class Migration_Modify_column_category extends CI_Migration
{

    public function up()
    {
        // Dropping a Column From a Table
        $this->dbforge->drop_column('category', 'image_id');

        // Adding a Column to a Table
        $fields = array(
            'image_file' => array('type' => 'varchar', 'constraint' => 50, 'null' => true),
        );
        $this->dbforge->add_column('category', $fields);
    }

    public function down()
    {
        // Dropping a Column From a Table
        $this->dbforge->drop_column('category', 'image_file');

        // Adding a Column to a Table
        $fields = array(
            'image_id' => array('type' => 'int', 'null' => true),
        );
        $this->dbforge->add_column('category', $fields);
    }

}
