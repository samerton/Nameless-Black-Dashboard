{include file='header.tpl'}
<body>
<div class="wrapper">
    {include file='sidebar.tpl'}

    <div class="main-panel">
        {include file='navbar.tpl'}

        <div class="content">
            <div class="container-fluid">
                {if isset($NEW_UPDATE)}
                {if $NEW_UPDATE_URGENT eq true}
                <div class="alert alert-danger">
                {else}
                <div class="alert alert-primary alert-dismissible" id="updateAlert">
                    <button type="button" class="close" id="closeUpdate" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    {/if}
                    {$NEW_UPDATE}
                    <br />
                    <a href="{$UPDATE_LINK}" class="btn btn-primary" style="text-decoration:none">{$UPDATE}</a>
                    <hr />
                    {$CURRENT_VERSION}<br />
                    {$NEW_VERSION}
                </div>
                {/if}

                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title">{$USERS}</h3>

                        {if isset($SUCCESS)}
                            <div class="alert alert-success alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h5><i class="icon fa fa-check"></i> {$SUCCESS_TITLE}</h5>
                                {$SUCCESS}
                            </div>
                        {/if}

                        {if isset($ERRORS) && count($ERRORS)}
                            <div class="alert alert-danger alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h5><i class="icon fas fa-exclamation-triangle"></i> {$ERRORS_TITLE}</h5>
                                <ul>
                                    {foreach from=$ERRORS item=error}
                                        <li>{$error}</li>
                                    {/foreach}
                                </ul>
                            </div>
                        {/if}

                        <table class="table table-striped dataTables-users" style="width:100%">
                            <thead>
                            <tr>
                                <th>{$USER}</th>
                                <th>{$GROUPS}</th>
                                <th>{$REGISTERED}</th>
                                <th>{$ACTIONS}</th>
                            </tr>
                            </thead>
                            <tbody>
                            {foreach from=$ALL_USERS item=item}
                                <tr>
                                    <td><a href="{$item.panel_profile}" style="{$item.style}"><img src="{$item.avatar}" class="rounded" alt="{$item.username}" style="max-width:20px;max-height:20px;"> {$item.nickname}</a></td>
                                    <td>{foreach from=$item.all_groups item=group}{$group} {/foreach}</td>
                                    <td data-sort="{$item.registered_unix}">{$item.registered}</td>
                                    <td>
                                        <div class="dropdown">
                                            <button class="btn btn-info dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                {$ACTIONS}
                                            </button>
                                            <div class="dropdown-menu">
                                                {foreach from=$ACTIONS_LIST item=action}
                                                    <a class="dropdown-item" href="{($action.link|replace:'{id}':$item.id)|replace:'{username}':$item.username}">{$action.title}</a>
                                                {/foreach}
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Spacing -->
                <div style="height:1rem;"></div>

            </div>
        </div>

        {include file='footer.tpl'}
    </div>
</div>
<!-- ./wrapper -->

{include file='scripts.tpl'}

</body>
</html>