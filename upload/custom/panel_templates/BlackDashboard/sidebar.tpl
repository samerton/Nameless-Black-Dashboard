    <div class="sidebar" data="blue">
        <div class="sidebar-wrapper">
            <ul class="nav">
                {assign var="i" value=1}
                {foreach from=$NAV_LINKS key=name item=item}
                    {if isset($item.link) && $item.link eq "divider"}
                        {* Currently do nothing *}
                    {else}
                        {if isset($item.items)}
                            {* Dropdown *}
                            <li{if isset($PARENT_PAGE) && $PARENT_PAGE eq $name} class="active"{/if}>
                                <a data-toggle="collapse" href="#dropdown{$i}" class="{if !isset($PARENT_PAGE) || $PARENT_PAGE neq $name} collapsed{/if}" aria-expanded="{if !isset($PARENT_PAGE) || $PARENT_PAGE neq $name} false{else}true{/if}">
                                    {$item.icon}
                                    <p>
                                        {$item.title}
                                        <b class="caret"></b>
                                    </p>
                                </a>
                                <div class="collapse{if isset($PARENT_PAGE) && $PARENT_PAGE eq $name} show{/if}" id="dropdown{$i}" style="">
                                    <ul class="nav">
                                        {if count($item.items)}
                                            {foreach from=$item.items key=subKey item=subItem}
                                                <li{if $PAGE eq $subKey} class="active"{/if}>
                                                    <a href="{$subItem.link}">
                                                        {$subItem.icon}
                                                        <p>{$subItem.title}</p>
                                                    </a>
                                                </li>
                                            {/foreach}
                                        {/if}
                                    </ul>
                                </div>
                            </li>
                        {else}
                            {* Normal link *}
                            <li{if $PAGE eq $name} class="active"{/if}>
                                <a href="{$item.link}" target="{$item.target}">
                                    {$item.icon}
                                    <p>{$item.title}</p>
                                </a>
                            </li>
                        {/if}
                    {/if}
                    {assign var="i" value=$i+1}
                {/foreach}
            </ul>
        </div>
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="{$LOGGED_IN_USER.avatar}" class="img-circle elevation-2" alt="{$LOGGED_IN_USER.username}">
            </div>
            <div class="info">
                <a href="{$LOGGED_IN_USER.panel_profile}" class="d-block">{$LOGGED_IN_USER.nickname}</a>
            </div>
        </div>

        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->