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
    'pwchange' => array(
        array(
            'field' => 'old_password',
            'label' => '現在のパスワード',
            'rules' => 'required|trim|callback__chk_old_password'
        ),
        array(
            'field' => 'new_password',
            'label' => '新しいパスワード',
            'rules' => 'required|trim|matches[new_password_confirmation]'
        ),
        array(
            'field' => 'new_password_confirmation',
            'label' => '新しいパスワード（確認）',
            'rules' => 'required|trim'
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
            'rules' => 'required|trim|callback__duplicate_shain_bn'
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
    'news/save' => array(
        array(
            'field' => 'start_date',
            'label' => '掲載開始日',
            'rules' => 'required|trim'
        ),
        array(
            'field' => 'end_date',
            'label' => '掲載終了日',
            'rules' => 'required|trim'
        ),
        array(
            'field' => 'content',
            'label' => 'お知らせ',
            'rules' => 'required|trim'
        ),
    ),
    'menu/save' => array(
        array(
            'field' => 'supply_date',
            'label' => 'メニュー提供日',
            'rules' => 'required'
        ),
        array(
            'field' => 'open_date',
            'label' => 'メニュー公開日',
            'rules' => 'required'
        ),
        array(
            'field' => 'menu_name',
            'label' => 'メニュー名',
            'rules' => 'required'
        ),
        array(
            'field' => 'category_id',
            'label' => 'カテゴリ',
            'rules' => 'required|numeric'
        ),
        array(
            'field' => 'price_regular',
            'label' => '正規従業員の価格',
            'rules' => 'required|integer'
        ),
        array(
            'field' => 'price_non_regular',
            'label' => '正規従業員以外の価格',
            'rules' => 'required|integer'
        ),
    ),
);