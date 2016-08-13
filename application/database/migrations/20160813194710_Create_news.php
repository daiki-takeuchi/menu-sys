<?php
/**
 * Migration: Create_news
 *
 * Created by: Cli for CodeIgniter <https://github.com/kenjis/codeigniter-cli>
 * Created on: 2016/08/13 19:47:10
 */
class Migration_Create_news extends CI_Migration {

    public function up()
    {
        $this->dbforge->add_field(array(
            'id' => array(
                'type' => 'bigserial',
                'auto_increment' => TRUE
            ),
            'start_date' => array(
                'type' => 'date',
                'null' => true,
            ),
            'end_date' => array(
                'type' => 'date',
                'null' => true,
            ),
            'content' => array(
                'type' => 'varchar',
                'constraint' => '100',
                'null' => true,
            ),
            'created_at' => array(
                'type' => 'TIMESTAMP'
            ),
            'created_user' => array(
                'type' => 'varchar',
                'constraint' => '100',
            ),
            'updated_at' => array(
                'type' => 'TIMESTAMP'
            ),
            'updated_user' => array(
                'type' => 'varchar',
                'constraint' => '100',
            ),
        ));
        $this->dbforge->add_key('id', TRUE);
        $this->dbforge->create_table('news');
    }

    public function down()
    {
        $this->dbforge->drop_table('news');
    }

}
