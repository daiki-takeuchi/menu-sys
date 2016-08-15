<?php

class UserSeeder_ADD_NST extends Seeder
{
    public function run()
    {
        $data = [
            'company_cc' => '1310',
            'soshiki_cc' => '00058070',
            'soshiki_nm' => '事業本部ＡＰシステム第２事業部第２Ｇ',
            'shain_bn' => 'daiki_takeuchi',
            'name' => 'Ｑ竹内 大貴',
            'shain_keitai_cc' => '06',
            'permission_menu' => '1',
            'permission_user' => '1',
            'password' => sha1('daiki_takeuchi'.'daiki_takeuchi'),
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('user', $data);

        $data = [
            'company_cc' => '1310',
            'soshiki_cc' => '00064010',
            'soshiki_nm' => '事業本部ＡＰシステム第１事業部第２Ｇ',
            'shain_bn' => 'maki_yasumura',
            'name' => 'Ｑ安村 真希',
            'shain_keitai_cc' => '06',
            'permission_menu' => '1',
            'permission_user' => '1',
            'password' => sha1('maki_yasumura'.'maki_yasumura'),
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('user', $data);

        $data = [
            'company_cc' => '1310',
            'soshiki_cc' => '00058060',
            'soshiki_nm' => '事業本部ＡＰシステム第２事業部第１Ｇ',
            'shain_bn' => 'yoshiko_teshima',
            'name' => '豊島 佳子',
            'shain_keitai_cc' => '01',
            'permission_menu' => '1',
            'permission_user' => '1',
            'password' => sha1('yoshiko_teshima'.'yoshiko_teshima'),
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('user', $data);

        $data = [
            'company_cc' => '1310',
            'soshiki_cc' => '00058060',
            'soshiki_nm' => '事業本部ＡＰシステム第２事業部第１Ｇ',
            'shain_bn' => 'shinichi_satou',
            'name' => '佐藤 慎一',
            'shain_keitai_cc' => '01',
            'permission_menu' => '1',
            'permission_user' => '1',
            'password' => sha1('shinichi_satou'.'shinichi_satou'),
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('user', $data);
    }
}