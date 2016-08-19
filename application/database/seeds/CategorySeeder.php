<?php

class CategorySeeder extends Seeder
{
    public function run()
    {
        $this->db->truncate('category');

        // 実行する処理
        $data = [
            'id' => 1,
            'category_name' => 'A定食',
            'kubun' => 1,
            'price_regular' => 270,
            'price_non_regular' => 370,
            'with_rice' => null,
            'price_regular_with_rice' => null,
            'price_non_regular_with_rice' => null,
            'sort_number' => 1,
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('category', $data);

        $data = [
            'id' => 2,
            'category_name' => 'B定食',
            'kubun' => 1,
            'price_regular' => 270,
            'price_non_regular' => 370,
            'with_rice' => null,
            'price_regular_with_rice' => null,
            'price_non_regular_with_rice' => null,
            'sort_number' => 2,
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('category', $data);

        $data = [
            'id' => 3,
            'category_name' => 'スペシャルランチ',
            'kubun' => 2,
            'price_regular' => 380,
            'price_non_regular' => 480,
            'with_rice' => null,
            'price_regular_with_rice' => null,
            'price_non_regular_with_rice' => null,
            'sort_number' => 1,
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('category', $data);

        $data = [
            'id' => 4,
            'category_name' => 'Aランチ',
            'kubun' => 2,
            'price_regular' => 270,
            'price_non_regular' => 370,
            'with_rice' => null,
            'price_regular_with_rice' => null,
            'price_non_regular_with_rice' => null,
            'sort_number' => 2,
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('category', $data);

        $data = [
            'id' => 5,
            'category_name' => 'Bランチ',
            'kubun' => 2,
            'price_regular' => 270,
            'price_non_regular' => 370,
            'with_rice' => null,
            'price_regular_with_rice' => null,
            'price_non_regular_with_rice' => null,
            'sort_number' => 3,
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('category', $data);

        $data = [
            'id' => 6,
            'category_name' => '和麺',
            'kubun' => 2,
            'price_regular' => 200,
            'price_non_regular' => 300,
            'with_rice' => null,
            'price_regular_with_rice' => null,
            'price_non_regular_with_rice' => null,
            'sort_number' => 4,
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('category', $data);

        $data = [
            'id' => 7,
            'category_name' => '丼',
            'kubun' => 2,
            'price_regular' => 270,
            'price_non_regular' => 370,
            'with_rice' => null,
            'price_regular_with_rice' => null,
            'price_non_regular_with_rice' => null,
            'sort_number' => 7,
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('category', $data);

        $data = [
            'id' => 8,
            'category_name' => 'スペシャルディナー',
            'kubun' => 3,
            'price_regular' => 380,
            'price_non_regular' => 480,
            'with_rice' => null,
            'price_regular_with_rice' => null,
            'price_non_regular_with_rice' => null,
            'sort_number' => 1,
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('category', $data);

        $data = [
            'id' => 9,
            'category_name' => '中華麺',
            'kubun' => 2,
            'price_regular' => 200,
            'price_non_regular' => 300,
            'with_rice' => null,
            'price_regular_with_rice' => null,
            'price_non_regular_with_rice' => null,
            'sort_number' => 5,
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('category', $data);

        $data = [
            'id' => 10,
            'category_name' => 'パスタ',
            'kubun' => 2,
            'price_regular' => 200,
            'price_non_regular' => 300,
            'with_rice' => null,
            'price_regular_with_rice' => null,
            'price_non_regular_with_rice' => null,
            'sort_number' => 6,
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('category', $data);

        $data = [
            'id' => 11,
            'category_name' => 'カレー',
            'kubun' => 2,
            'price_regular' => 200,
            'price_non_regular' => 300,
            'with_rice' => null,
            'price_regular_with_rice' => null,
            'price_non_regular_with_rice' => null,
            'sort_number' => 8,
            'created_at' => date('Y/m/d H:i:s'),
            'created_user' => 'Seeder',
            'updated_at' => date('Y/m/d H:i:s'),
            'updated_user' => 'Seeder'
        ];
        $this->db->insert('category', $data);
    }
}