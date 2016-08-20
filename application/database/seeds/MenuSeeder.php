<?php

class MenuSeeder extends Seeder
{
    public function run()
    {

        $monday = $this->get_this_monday(strtotime(date('Y/m/d')));
        $last_monday = strtotime('last monday', $monday);

        for ($i = 0; $i < 21; $i++) {
            $date = date('Y/m/d', strtotime($i . ' day', $last_monday));
            $where = array('supply_date' => $date);
            $this->db->delete('menu',$where);

            // 実行する処理
            $data = [
                'supply_date' => $date,
                'open_date' => date('Y/m/d', $last_monday),
                'menu_name' => '銀鮭朝食' .($i+1),
                'tag' => null,
                'category_id' => 1,
                'price_regular' => 270,
                'price_non_regular' => 370,
                'with_rice' => null,
                'price_regular_with_rice' => null,
                'price_non_regular_with_rice' => null,
                'energy' => '585',
                'salt' => '2.6',
                'protein' => '35.6',
                'lipid' => '14.7',
                'allergen' => '小麦、卵、豚肉',
                'image_id' => null,
                'created_at' => date('Y/m/d H:i:s'),
                'created_user' => 'Seeder',
                'updated_at' => date('Y/m/d H:i:s'),
                'updated_user' => 'Seeder'
            ];
            $this->db->insert('menu', $data);

            $data = [
                'supply_date' => $date,
                'open_date' => date('Y/m/d', $last_monday),
                'menu_name' => '納豆朝食' .($i+1),
                'tag' => null,
                'category_id' => 2,
                'price_regular' => 270,
                'price_non_regular' => 370,
                'with_rice' => null,
                'price_regular_with_rice' => null,
                'price_non_regular_with_rice' => null,
                'energy' => '535',
                'salt' => '2.3',
                'protein' => '27.3',
                'lipid' => '11.7',
                'allergen' => '小麦、卵、えび',
                'image_id' => null,
                'created_at' => date('Y/m/d H:i:s'),
                'created_user' => 'Seeder',
                'updated_at' => date('Y/m/d H:i:s'),
                'updated_user' => 'Seeder'
            ];
            $this->db->insert('menu', $data);

            $data = [
                'supply_date' => $date,
                'open_date' => date('Y/m/d', $last_monday),
                'menu_name' => 'ロースとんかつ定食' .($i+1),
                'tag' => null,
                'category_id' => 3,
                'price_regular' => 270,
                'price_non_regular' => 370,
                'with_rice' => null,
                'price_regular_with_rice' => null,
                'price_non_regular_with_rice' => null,
                'energy' => '764',
                'salt' => '2.7',
                'protein' => '34.3',
                'lipid' => '30.2',
                'allergen' => '小麦、卵、乳',
                'image_id' => null,
                'created_at' => date('Y/m/d H:i:s'),
                'created_user' => 'Seeder',
                'updated_at' => date('Y/m/d H:i:s'),
                'updated_user' => 'Seeder'
            ];
            $this->db->insert('menu', $data);

            $data = [
                'supply_date' => $date,
                'open_date' => date('Y/m/d', $last_monday),
                'menu_name' => 'チキン南蛮定食' .($i+1),
                'tag' => null,
                'category_id' => 4,
                'price_regular' => 270,
                'price_non_regular' => 370,
                'with_rice' => null,
                'price_regular_with_rice' => null,
                'price_non_regular_with_rice' => null,
                'energy' => '1,294',
                'salt' => '8.0',
                'protein' => '46.6',
                'lipid' => '72.2',
                'allergen' => '小麦、卵、乳',
                'image_id' => null,
                'created_at' => date('Y/m/d H:i:s'),
                'created_user' => 'Seeder',
                'updated_at' => date('Y/m/d H:i:s'),
                'updated_user' => 'Seeder'
            ];
            $this->db->insert('menu', $data);

            $data = [
                'supply_date' => $date,
                'open_date' => date('Y/m/d', $last_monday),
                'menu_name' => '和風ハンバーグ定食' .($i+1),
                'tag' => null,
                'category_id' => 5,
                'price_regular' => 270,
                'price_non_regular' => 370,
                'with_rice' => null,
                'price_regular_with_rice' => null,
                'price_non_regular_with_rice' => null,
                'energy' => '900',
                'salt' => '5.8',
                'protein' => '33.9',
                'lipid' => '40.8',
                'allergen' => '小麦、卵、乳、エビ',
                'image_id' => null,
                'created_at' => date('Y/m/d H:i:s'),
                'created_user' => 'Seeder',
                'updated_at' => date('Y/m/d H:i:s'),
                'updated_user' => 'Seeder'
            ];
            $this->db->insert('menu', $data);

            $data = [
                'supply_date' => $date,
                'open_date' => date('Y/m/d', $last_monday),
                'menu_name' => '天ぷらうどん' .($i+1),
                'tag' => null,
                'category_id' => 6,
                'price_regular' => 270,
                'price_non_regular' => 370,
                'with_rice' => null,
                'price_regular_with_rice' => null,
                'price_non_regular_with_rice' => null,
                'energy' => '1,000',
                'salt' => '20',
                'protein' => '30',
                'lipid' => '40',
                'allergen' => '小麦、卵、豚肉',
                'image_id' => null,
                'created_at' => date('Y/m/d H:i:s'),
                'created_user' => 'Seeder',
                'updated_at' => date('Y/m/d H:i:s'),
                'updated_user' => 'Seeder'
            ];
            $this->db->insert('menu', $data);

            $data = [
                'supply_date' => $date,
                'open_date' => date('Y/m/d', $last_monday),
                'menu_name' => '桜島どりの親子丼' .($i+1),
                'tag' => null,
                'category_id' => 7,
                'price_regular' => 270,
                'price_non_regular' => 370,
                'with_rice' => null,
                'price_regular_with_rice' => null,
                'price_non_regular_with_rice' => null,
                'energy' => '747',
                'salt' => '4.7',
                'protein' => '38.7',
                'lipid' => '22.4',
                'allergen' => '小麦、卵',
                'image_id' => null,
                'created_at' => date('Y/m/d H:i:s'),
                'created_user' => 'Seeder',
                'updated_at' => date('Y/m/d H:i:s'),
                'updated_user' => 'Seeder'
            ];
            $this->db->insert('menu', $data);

            $data = [
                'supply_date' => $date,
                'open_date' => date('Y/m/d', $last_monday),
                'menu_name' => '生姜醤油漬け炭火焼き牛たん定食' .($i+1),
                'tag' => null,
                'category_id' => 8,
                'price_regular' => 270,
                'price_non_regular' => 370,
                'with_rice' => null,
                'price_regular_with_rice' => null,
                'price_non_regular_with_rice' => null,
                'energy' => '819',
                'salt' => '5.3',
                'protein' => null,
                'lipid' => null,
                'allergen' => '卵、小麦、牛肉、さば、大豆',
                'image_id' => null,
                'created_at' => date('Y/m/d H:i:s'),
                'created_user' => 'Seeder',
                'updated_at' => date('Y/m/d H:i:s'),
                'updated_user' => 'Seeder'
            ];
            $this->db->insert('menu', $data);

            $data = [
                'supply_date' => $date,
                'open_date' => date('Y/m/d', $last_monday),
                'menu_name' => '醤油とんこつラーメン' .($i+1),
                'tag' => null,
                'category_id' => 9,
                'price_regular' => 270,
                'price_non_regular' => 370,
                'with_rice' => null,
                'price_regular_with_rice' => null,
                'price_non_regular_with_rice' => null,
                'energy' => '1,000',
                'salt' => '20',
                'protein' => '30',
                'lipid' => '40',
                'allergen' => '小麦、卵、豚肉',
                'image_id' => null,
                'created_at' => date('Y/m/d H:i:s'),
                'created_user' => 'Seeder',
                'updated_at' => date('Y/m/d H:i:s'),
                'updated_user' => 'Seeder'
            ];
            $this->db->insert('menu', $data);

            $data = [
                'supply_date' => $date,
                'open_date' => date('Y/m/d', $last_monday),
                'menu_name' => 'たっぷり海老とモッツァレラチーズのトマトクリーム' .($i+1),
                'tag' => null,
                'category_id' => 10,
                'price_regular' => 270,
                'price_non_regular' => 370,
                'with_rice' => null,
                'price_regular_with_rice' => null,
                'price_non_regular_with_rice' => null,
                'energy' => '1,000',
                'salt' => '20',
                'protein' => '30',
                'lipid' => '40',
                'allergen' => '小麦、卵、豚肉',
                'image_id' => null,
                'created_at' => date('Y/m/d H:i:s'),
                'created_user' => 'Seeder',
                'updated_at' => date('Y/m/d H:i:s'),
                'updated_user' => 'Seeder'
            ];
            $this->db->insert('menu', $data);

            $data = [
                'supply_date' => $date,
                'open_date' => date('Y/m/d', $last_monday),
                'menu_name' => 'ハヤシライス' .($i+1),
                'tag' => null,
                'category_id' => 11,
                'price_regular' => 270,
                'price_non_regular' => 370,
                'with_rice' => null,
                'price_regular_with_rice' => null,
                'price_non_regular_with_rice' => null,
                'energy' => '730',
                'salt' => '5.2',
                'protein' => '21.2',
                'lipid' => '22.8',
                'allergen' => '小麦、卵、乳',
                'image_id' => null,
                'created_at' => date('Y/m/d H:i:s'),
                'created_user' => 'Seeder',
                'updated_at' => date('Y/m/d H:i:s'),
                'updated_user' => 'Seeder'
            ];
            $this->db->insert('menu', $data);
        }
    }

    private function get_this_monday($date) {
        return (strtotime('monday', $date) == strtotime('today', $date))? strtotime('monday', $date):strtotime('last monday', $date);
    }
}