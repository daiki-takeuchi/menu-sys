<?php
/**
 * Migration: Add_Unique_to_user
 *
 * Created by: Cli for CodeIgniter <https://github.com/kenjis/codeigniter-cli>
 * Created on: 2016/08/26 00:01:35
 */
class Migration_Add_Unique_to_user extends CI_Migration {

	public function up()
	{
        $this->db->query('ALTER TABLE "user" ADD CONSTRAINT user_shain_bn_key UNIQUE(shain_bn)');
	}

	public function down()
	{
        $this->db->query('ALTER TABLE "user" DROP CONSTRAINT user_shain_bn_key');
	}

}
