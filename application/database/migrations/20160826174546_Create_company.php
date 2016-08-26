<?php

/**
 * Migration: Create_company
 *
 * Created by: Cli for CodeIgniter <https://github.com/kenjis/codeigniter-cli>
 * Created on: 2016/08/26 17:45:46
 */
class Migration_Create_company extends CI_Migration
{

    public function up()
    {
        $this->dbforge->add_field(array(
            'id' => array(
                'type' => 'bigserial',
                'auto_increment' => TRUE
            ),
            'company_cc' => array(
                'type' => 'varchar',
                'constraint' => '4',
            ),
            'company_nm' => array(
                'type' => 'varchar',
                'constraint' => '50',
            ),
            'company_short_nm' => array(
                'type' => 'varchar',
                'constraint' => '50',
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
        $this->dbforge->create_table('company');
        $this->db->query('ALTER TABLE "company" ADD CONSTRAINT company_company_cc_key UNIQUE(company_cc)');
    }

    public function down()
    {
        $this->dbforge->drop_table('company');
    }

}
