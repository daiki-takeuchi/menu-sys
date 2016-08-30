<?php
/**
 * Migration: Create_reservation
 *
 * Created by: Cli for CodeIgniter <https://github.com/kenjis/codeigniter-cli>
 * Created on: 2016/08/30 12:01:44
 */
class Migration_Create_reservation extends CI_Migration {

    public function up()
    {
        $this->dbforge->add_field(array(
            'id' => array(
                'type' => 'bigserial',
                'auto_increment' => true
            ),
            'user_id' => array(
                'type' => 'int',
            ),
            'menu_id' => array(
                'type' => 'int',
            ),
            'company_cc' => array(
                'type' => 'varchar',
                'constraint' => '20',
            ),
            'soshiki_cc' => array(
                'type' => 'varchar',
                'constraint' => '20',
            ),
            'shain_bn' => array(
                'type' => 'varchar',
                'constraint' => '20',
            ),
            'quantity' => array(
                'type' => 'int',
                'null' => true,
            ),
            'whether_with_rice' => array(
                'type' => 'char',
                'constraint' => '1',
                'default' => '0'
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
        $this->dbforge->create_table('reservation');
        $this->db->query('ALTER TABLE "reservation" ADD CONSTRAINT reservation_user_id_menu_id_key UNIQUE(user_id, menu_id)');
    }

    public function down()
    {
        $this->dbforge->drop_table('reservation');
    }

}
