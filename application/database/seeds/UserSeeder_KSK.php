<?php

class UserSeeder_KSK extends Seeder
{
    public function run()
    {
        $this->db->truncate('user');

        $data = [
            'company_cc' => '1201',
            'soshiki_cc' => '1130100',
            'soshiki_nm' => '総務・人事部　総務Ｇ',
            'shain_bn' => '12345678',
            'name' => '山田　太郎',
            'shain_keitai_cc' => '01',
            'first_login' => '0',
            'gender' => '1',
            'permission_menu' => '1',
            'permission_user' => '1',
            'password' => sha1('12345678'.'12345678'),
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('user', $data);

        $data = [
            'company_cc' => '1201',
            'soshiki_cc' => '1130100',
            'soshiki_nm' => '総務・人事部　総務Ｇ',
            'shain_bn' => '23456789',
            'name' => '鈴木　一郎',
            'shain_keitai_cc' => '01',
            'password' => sha1('23456789'.'23456789'),
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('user', $data);

        $data = [
            'company_cc' => '1432',
            'soshiki_cc' => '0000000',
            'soshiki_nm' => 'クノールサービス株式会社',
            'shain_bn' => '34567890',
            'name' => '本田　圭介',
            'shain_keitai_cc' => '01',
            'permission_menu' => '1',
            'password' => sha1('34567890'.'34567890'),
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('user', $data);

        $data = [
            'company_cc' => '1201',
            'soshiki_cc' => '1160052',
            'soshiki_nm' => '開発技術Ｃ　開発管理部　管理Ｇ',
            'shain_bn' => '45678901',
            'name' => '吉田　隆一',
            'shain_keitai_cc' => '04',
            'password' => sha1('45678901'.'45678901'),
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('user', $data);

        $data = [
            'company_cc' => '1201',
            'soshiki_cc' => '1171210',
            'soshiki_nm' => '生産Ｃ　川崎事業所　管理部　総務課',
            'shain_bn' => '56789012',
            'name' => '佐藤　花子',
            'shain_keitai_cc' => '03',
            'password' => sha1('56789012'.'56789012'),
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('user', $data);

        $data = [
            'company_cc' => '1434',
            'soshiki_cc' => '0000000',
            'soshiki_nm' => 'クノールトレーディング株式会社',
            'shain_bn' => '67890123',
            'name' => '田中　紀子',
            'shain_keitai_cc' => '02',
            'password' => sha1('67890123'.'67890123'),
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('user', $data);

        $data = [
            'company_cc' => '1201',
            'soshiki_cc' => '1130100',
            'soshiki_nm' => '総務・人事部　総務Ｇ',
            'shain_bn' => '78901234',
            'name' => '山田　栞',
            'shain_keitai_cc' => '01',
            'password' => sha1('78901234'.'78901234'),
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('user', $data);

        $data = [
            'company_cc' => '1201',
            'soshiki_cc' => '1160121',
            'soshiki_nm' => '開発技術Ｃ　洋風ソース開発部　洋風ソース開発第１Ｇ',
            'shain_bn' => '89012345',
            'name' => '安倍　綾子',
            'shain_keitai_cc' => '01',
            'password' => sha1('89012345'.'89012345'),
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('user', $data);

        $data = [
            'company_cc' => '1201',
            'soshiki_cc' => '1170110',
            'soshiki_nm' => '生産Ｃ　生産統括部',
            'shain_bn' => '90123456',
            'name' => '加藤　健',
            'shain_keitai_cc' => '01',
            'password' => sha1('90123456'.'90123456'),
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('user', $data);

        $data = [
            'company_cc' => '1201',
            'soshiki_cc' => '1130100',
            'soshiki_nm' => '総務・人事部　総務Ｇ',
            'shain_bn' => '01234567',
            'name' => '速水　尚道',
            'shain_keitai_cc' => '01',
            'password' => sha1('01234567'.'01234567'),
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('user', $data);

    }
}