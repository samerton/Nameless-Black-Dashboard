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
                        <h3 class="card-title">{$MINECRAFT_SERVERS}</h3>

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

                        <a href="{$NEW_SERVER_LINK}" class="btn btn-info">{$NEW_SERVER}</a>

                        <hr />

                        {if isset($NO_SERVERS)}
                            <p>{$NO_SERVERS}</p>
                        {else}
                            <div class="table table-responsive">
                                <table class="table table-striped">
                                    {foreach from=$SERVERS item=server}
                                        <tr>
                                            <td><strong>{$server.name}</strong> ({$server.server_id})</td>
                                            <td>
                                                <div class="float-md-right">
                                                    <a href="{$server.edit_link}" class="btn btn-info">{$EDIT}</a>
                                                    <button onclick="showDeleteModal('{$server.delete_link}')" class="btn btn-danger">{$DELETE}</button>
                                                </div>
                                            </td>
                                        </tr>
                                    {/foreach}
                                </table>
                            </div>
                        {/if}

                        <hr />

                        <h6>{$QUERY_SETTINGS}</h6>
                        <form action="" method="post">
                            <div class="form-group">
                                <label for="inputDefaultServer">{$DEFAULT_SERVER}</label>
                                <select id="inputDefaultServer" class="form-control" name="default_server">
                                    <option value="none"{if $DEFAULT_SERVER_VALUE eq 0} selected{/if}>{$NO_DEFAULT_SERVER}</option>
                                    {if isset($SERVERS) && count($SERVERS)}
                                        {foreach from=$SERVERS item=server}
                                            <option value="{$server.id}"{if $server.is_default eq 1} selected{/if}>{$server.name}</option>
                                        {/foreach}
                                    {/if}
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="inputQueryInterval">{$QUERY_INTERVAL}</label>
                                <input id="inputQueryInterval" name="interval" type="number" class="form-control" value="{$QUERY_INTERVAL_VALUE}" min="5" max="60"/>
                            </div>

                            <div class="form-group">
                                <label for="inputExternalQuery">{$EXTERNAL_QUERY}</label> <span class="badge badge-info"><i class="fa fa-question-circle" data-container="body" data-toggle="popover" data-placement="top" title="{$INFO}" data-content="{$EXTERNAL_QUERY_INFO}"></i></span>
                                <input type="hidden" name="external_query" value="0">
                                <input id="inputExternalQuery" name="external_query" type="checkbox" class="js-switch" value="1"{if $EXTERNAL_QUERY_VALUE} checked{/if} />
                            </div>

                            <div class="form-group">
                                <label for="inputStatusPage">{$STATUS_PAGE}</label>
                                <input type="hidden" name="status_page" value="0">
                                <input id="inputStatusPage" name="status_page" type="checkbox" class="js-switch" value="1"{if $STATUS_PAGE_VALUE} checked{/if} />
                            </div>

                            <div class="form-group">
                                <input type="hidden" name="token" value="{$TOKEN}">
                                <input type="submit" class="btn btn-info" value="{$SUBMIT}">
                            </div>
                        </form>

                    </div>
                </div>

                <!-- Spacing -->
                <div style="height:1rem;"></div>

            </div>
        </div>

        {include file='footer.tpl'}
    </div>

    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{$ARE_YOU_SURE}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    {$CONFIRM_DELETE_SERVER}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                    <a href="#" id="deleteLink" class="btn btn-info">{$YES}</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ./wrapper -->

{include file='scripts.tpl'}

<script type="text/javascript">
    function showDeleteModal(link){
        $('#deleteLink').attr('href', link);
        $('#deleteModal').modal().show();
    }
</script>

</body>
</html>