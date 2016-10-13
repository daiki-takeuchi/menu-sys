<?php
/**
 * Migration: Create_organization
 *
 * Created by: Cli for CodeIgniter <https://github.com/kenjis/codeigniter-cli>
 * Created on: 2016/10/13 22:56:03
 */
class Migration_Create_organization extends CI_Migration {

    public function up()
    {
        $this->dbforge->add_field(array(
            'id' => array(
                'type' => 'bigserial',
                'auto_increment' => true
            ),
            'start_date' => array(
                'type' => 'date',
            ),
            'end_date' => array(
                'type' => 'date',
                'default' => '2999/12/31',
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
        $this->dbforge->create_table('organization');
    }

    public function down()
    {
        $this->dbforge->drop_table('organization');
    }

}
