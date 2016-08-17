<?php
/**
 * Migration: Create_category
 *
 * Created by: Cli for CodeIgniter <https://github.com/kenjis/codeigniter-cli>
 * Created on: 2016/08/17 10:34:19
 */
class Migration_Create_category extends CI_Migration {

    public function up()
    {
        $this->dbforge->add_field(array(
            'id' => array(
                'type' => 'bigserial'
            ),
            'kubun' => array(
                'type' => 'int',
            ),
            'category_name' => array(
                'type' => 'varchar',
                'constraint' => '50',
            ),
            'price_regular' => array(
                'type' => 'int',
                'null' => true,
            ),
            'price_non_regular' => array(
                'type' => 'int',
                'null' => true,
            ),
            'with_rice' => array(
                'type' => 'varchar',
                'constraint' => '10',
                'null' => true,
            ),
            'price_regular_with_rice' => array(
                'type' => 'int',
                'null' => true,
            ),
            'price_non_regular_with_rice' => array(
                'type' => 'int',
                'null' => true,
            ),
            'image_id' => array(
                'type' => 'int',
                'null' => true,
            ),
            'sort_number' => array(
                'type' => 'int',
            ),
            'created_at' => array(
                'type' => 'timestamp'
            ),
            'created_user' => array(
                'type' => 'varchar',
                'constraint' => '100',
            ),
            'updated_at' => array(
                'type' => 'timestamp'
            ),
            'updated_user' => array(
                'type' => 'varchar',
                'constraint' => '100',
            ),
        ));
        $this->dbforge->add_key('id', TRUE);
        $this->dbforge->create_table('category');
    }

    public function down()
    {
        $this->dbforge->drop_table('category');
    }

}
