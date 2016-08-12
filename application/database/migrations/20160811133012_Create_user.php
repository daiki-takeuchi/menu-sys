<?php
/**
 * Migration: Create_user
 *
 * Created by: Cli for CodeIgniter <https://github.com/kenjis/codeigniter-cli>
 * Created on: 2016/08/11 13:30:12
 */
class Migration_Create_user extends CI_Migration {

    public function up()
    {
        $this->dbforge->add_field(array(
            'id' => array(
                'type' => 'bigserial',
                'auto_increment' => TRUE
            ),
            'company_cc' => array(
                'type' => 'varchar',
                'constraint' => '20',
            ),
            'soshiki_cc' => array(
                'type' => 'varchar',
                'constraint' => '20',
            ),
            'soshiki_nm' => array(
                'type' => 'varchar',
                'constraint' => '100',
            ),
            'shain_bn' => array(
                'type' => 'varchar',
                'constraint' => '20',
            ),
            'name' => array(
                'type' => 'varchar',
                'constraint' => '100',
            ),
            'shain_keitai_cc' => array(
                'type' => 'varchar',
                'constraint' => '4',
                'null' => true,
            ),
            'gender' => array(
                'type' => 'char',
                'constraint' => '1',
                'null' => true
            ),
            'permission_menu' => array(
                'type' => 'char',
                'constraint' => '1',
                'default' => '0'
            ),
            'permission_user' => array(
                'type' => 'char',
                'constraint' => '1',
                'default' => '0'
            ),
            'password' => array(
                'type' => 'varchar',
                'constraint' => '255',
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
        $this->dbforge->create_table('user');
    }

    public function down()
    {
        $this->dbforge->drop_table('user');
    }

}
