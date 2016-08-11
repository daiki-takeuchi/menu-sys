<?php

class UserSeeder_Add_30 extends Seeder
{
    public function run()
    {
        for ($i = 1; $i <= 30; $i++){
            // 実行する処理
            $data = [
                'company_cc' => '1201',
                'soshiki_cc' => '1130100',
                'soshiki_nm' => '総務・人事部　総務Ｇ',
                'shain_bn' => date('ymdHis').sprintf('%02d', $i),          // 0000001とかの0埋め7桁
                'name' => '名前' . $i,
                'shain_keitai_cc' => '01',
                'password' => sha1(sprintf('%07d', $i).'password'),
                'created_at' => date('Y/m/d H:i:s'),
                'created_user' => 'Seeder',
                'updated_at' => date('Y/m/d H:i:s'),
                'updated_user' => 'Seeder'
            ];
            $this->db->insert('user', $data);
        }
    }
}