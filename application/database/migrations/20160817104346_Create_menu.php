<?php
/**
 * Migration: Create_menu
 *
 * Created by: Cli for CodeIgniter <https://github.com/kenjis/codeigniter-cli>
 * Created on: 2016/08/17 10:43:46
 */
class Migration_Create_menu extends CI_Migration {

    public function up()
    {
        $this->dbforge->add_field(array(
            'id' => array(
                'type' => 'bigserial',
                'auto_increment' => true
            ),
            'supply_date' => array(
                'type' => 'date',
                'null' => true,
            ),
            'open_date' => array(
                'type' => 'date',
                'null' => true,
            ),
            'menu_name' => array(
                'type' => 'varchar',
                'constraint' => '50',
            ),
            'tag' => array(
                'type' => 'varchar',
                'constraint' => '50',
                'null' => true,
            ),
            'category_id' => array(
                'type' => 'int',
            ),
            'price_regular' => array(
                'type' => 'int',
            ),
            'price_non_regular' => array(
                'type' => 'int',
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
            'energy' => array(
                'type' => 'varchar',
                'constraint' => '10',
                'null' => true,
            ),
            'salt' => array(
                'type' => 'varchar',
                'constraint' => '10',
                'null' => true,
            ),
            'protein' => array(
                'type' => 'varchar',
                'constraint' => '10',
                'null' => true,
            ),
            'lipid' => array(
                'type' => 'varchar',
                'constraint' => '10',
                'null' => true,
            ),
            'allergen' => array(
                'type' => 'varchar',
                'constraint' => '30',
                'null' => true,
            ),
            'image_id' => array(
                'type' => 'int',
                'null' => true,
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
        $this->dbforge->create_table('menu');
    }

    public function down()
    {
        $this->dbforge->drop_table('menu');
    }

}
