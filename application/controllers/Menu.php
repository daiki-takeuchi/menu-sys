<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Menu extends MY_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
        $this->display('menu/index.tpl');
	}

    public function menu_list()
    {
        $this->display('menu/menu_list.tpl');
    }

    public function download_display()
    {
        // Ajax通信の場合のみ処理する
        if($this->input->is_ajax_request()) {
            $this->display('menu/download.tpl');
        }
    }
}
