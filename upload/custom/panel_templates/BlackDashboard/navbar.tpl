<nav class="navbar navbar-expand-lg navbar-absolute navbar-transparent">
    <div class="container-fluid">
        <div class="navbar-wrapper">
            <div class="navbar-toggle d-inline">
                <button type="button" class="navbar-toggler">
                    <span class="navbar-toggler-bar bar1"></span>
                    <span class="navbar-toggler-bar bar2"></span>
                    <span class="navbar-toggler-bar bar3"></span>
                </button>
            </div>
            <a class="navbar-brand" href="{$PANEL_INDEX}">{$SITE_NAME}</a>
        </div>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
        </button>
        <div class="collapse navbar-collapse" id="navigation">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="{$SITE_HOME}" target="_blank" class="nav-link"><i class="fas fa-home"></i></a>
                </li>
                <li class="dropdown nav-item">
                    <a href="javascript:void(0)" class="dropdown-toggle nav-link" data-toggle="dropdown">
                        <i class="fas fa-bell"></i>
                        <span class="badge badge-info">{$NOTICES|count}</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right dropdown-navbar">
                        {if $NOTICES|count eq 0}
                            <span class="dropdown-item dropdown-header">{$NO_NOTICES}</span>

                        {else}
                            {foreach from=$NOTICES key=url item=notice}
                                <li class="nav-link">
                                    <a href="{$url}" class="dropdown-item" style="color:#6c757d!important">
                                        {$notice}
                                    </a>
                                </li>
                            {/foreach}

                        {/if}
                    </ul>
                </li>
                <li class="dropdown nav-item">
                    <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                        <div class="photo">
                            <img src="{$LOGGED_IN_USER.avatar}" alt="{$LOGGED_IN_USER.username}">
                        </div>
                    </a>
                    <ul class="dropdown-menu dropdown-navbar">
                        <li class="nav-link">
                            <a href="{$LOGGED_IN_USER.panel_profile}" class="nav-item dropdown-item">{$LOGGED_IN_USER.nickname}</a>
                        </li>
                    </ul>
                </li>
                <li class="separator d-lg-none"></li>
            </ul>
        </div>
    </div>
</nav>