<?php
/**
 * Part of ci-phpunit-test
 *
 * @author     Kenji Suzuki <https://github.com/kenjis>
 * @license    MIT License
 * @copyright  2015 Kenji Suzuki
 * @link       https://github.com/kenjis/ci-phpunit-test
 */

class Menu_test extends TestCase
{
    public static function setUpBeforeClass()
    {
        parent::setUpBeforeClass();

        $CI =& get_instance();
        $CI->load->library('Seeder');
        $CI->seeder->call('UserSeeder_KSK');
        $CI->seeder->call('UserSeeder_Add_30');
        $CI->seeder->call('UserSeeder_Add_30');
    }

    public function test_index()
	{
        // 管理者でログイン
        $data = ['shain_bn' => '12345678','password' => 'password'];
        $this->request('POST', '/login', $data);

		$output = $this->request('GET', '/');
//		$this->assertContains('<title>メニュー予約</title>', $output);
	}

	public function test_method_404()
	{
		$this->request('GET', 'menu/method_not_exist');
		$this->assertResponseCode(404);
	}

	public function test_APPPATH()
	{
		$actual = realpath(APPPATH);
		$expected = realpath(__DIR__ . '/../..');
		$this->assertEquals(
			$expected,
			$actual,
			'Your APPPATH seems to be wrong. Check your $application_folder in tests/Bootstrap.php'
		);
	}
}
