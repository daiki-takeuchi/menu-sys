<?php

class CompanySeeder extends Seeder
{
    public function run()
    {
        $this->db->truncate('company');

        // 実行する処理
        $data = [
            'company_cc' => '1201',
            'company_nm' => 'クノール食品㈱',
            'company_short_nm' => 'KSK',
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('company', $data);

        $data = [
            'company_cc' => '1432',
            'company_nm' => 'クノールサービス㈱',
            'company_short_nm' => 'KSV',
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('company', $data);

        $data = [
            'company_cc' => '1434',
            'company_nm' => 'クノールトレーディング㈱',
            'company_short_nm' => 'KTC',
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('company', $data);

        $data = [
            'company_cc' => 'ZZZZ',
            'company_nm' => '常駐業者',
            'company_short_nm' => '常駐業者',
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('company', $data);

        $data = [
            'company_cc' => '1310',
            'company_nm' => 'ＮＲＩシステムテクノ㈱',
            'company_short_nm' => 'NST',
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('company', $data);
    }
}