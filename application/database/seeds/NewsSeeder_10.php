<?php

class NewsSeeder_10 extends Seeder
{
    public function run()
    {
        $this->db->truncate('news');

        for ($i = 1; $i <= 10; $i++){
            // 実行する処理
            $data = [
                'start_date' => date('Y/m/d'),
                'end_date' => date('Y/m/d', strtotime("next month")),
                'content' => '内容' .$i,
                'created_at' => date('Y/m/d H:i:s'),
                'created_user' => 'Seeder',
                'updated_at' => date('Y/m/d H:i:s'),
                'updated_user' => 'Seeder'
            ];
            $this->db->insert('news', $data);
        }
    }
}