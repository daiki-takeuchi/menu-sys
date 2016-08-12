<?php
$config = array(
    'login' => array(
        array(
            'field' => 'shain_bn',
            'label' => '社員番号',
            'rules' => 'required|trim|validate_credentials'
        ),
        array(
            'field' => 'password',
            'label' => 'パスワード',
            'rules' => 'required|sha1|trim'
        )
    ),
    'user/save' => array(
        array(
            'field' => 'name',
            'label' => '名前',
            'rules' => 'required|trim'
        ),
        array(
            'field' => 'shain_bn',
            'label' => '社員番号',
            'rules' => 'required|trim'
        ),
        array(
            'field' => 'company_cc',
            'label' => '会社名',
            'rules' => 'required'
        ),
        array(
            'field' => 'soshiki_cc',
            'label' => '組織',
            'rules' => 'required'
        ),
        array(
            'field' => 'shain_keitai_cc',
            'label' => '雇用形態',
            'rules' => 'required'
        ),
    ),
);