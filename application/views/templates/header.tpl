<!-- Fixed navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" id="logo" href="{base_url}" style="background: url('{base_url}assets/img/logo.png') no-repeat 10px center;background-size: 40px;"><span class="spNone">食堂メニュー予約システム</span></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <p class="navbar-text">ようこそ　{$user_name}さん</p>
                <li><a href="{base_url}logout"><span class="fa fa-sign-out"></span> ログアウト</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="fa fa-navicon"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="{base_url}"><span class="glyphicon glyphicon-cutlery"></span> メニュー予約</a></li>
                        <li role="separator" class="divider"></li>
                        {if $permission_menu}
                            <li><a href="{base_url}menu/list"><span class="fa fa-edit"></span> メニュー管理</a></li>
                            <li><a href="{base_url}menu/search"><span class="fa fa-search"></span> メニュー検索</a></li>
                            <li><a href="{base_url}news"><span class="fa fa-bell"></span> お知らせ管理</a></li>
                        {/if}
                        {if $permission_user}
                            <li><a href="{base_url}user"><span class="fa fa-user"></span> ユーザー管理</a></li>
                        {/if}
                        <li><a href="{base_url}pwchange"><span class="fa fa-key"></span> パスワード変更</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>