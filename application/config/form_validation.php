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
    )
);