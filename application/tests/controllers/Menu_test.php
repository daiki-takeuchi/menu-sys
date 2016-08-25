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
    }

    public function setUp()
    {
        $this->resetInstance();
    }

    /**
     * @test
     */
    public function 初回ログイン時はパスワード変更画面に遷移する()
	{
        // ログイン
        $data = ['shain_bn' => '23456789', 'password' => '23456789'];
        $this->request('POST', 'login', $data);

        $this->request('GET', '/');
        $this->assertRedirect('pwchange');

        // Teardown ログアウト
        $this->request('GET', 'logout');
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
