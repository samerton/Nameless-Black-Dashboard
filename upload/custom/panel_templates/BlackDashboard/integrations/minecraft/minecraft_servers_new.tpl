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
                        <h3 class="card-title">{$ADDING_SERVER}</h3>

                        <button onclick="showCancelModal()" class="btn btn-warning">{$CANCEL}</button>
                        <hr />

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

                        <form action="" method="post">
                            <h6>{$SERVER_INFORMATION}</h6>
                            <div class="form-group">
                                <label for="InputName">{$SERVER_NAME}</label>
                                <input name="server_name" placeholder="{$SERVER_NAME}" id="InputName" value="{$SERVER_NAME_VALUE}" class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="InputAddress">{$SERVER_ADDRESS}</label> <span class="badge badge-info"><i class="fa fa-question-circle" data-container="body" data-toggle="popover" data-placement="top" title="{$INFO}" data-content="{$SERVER_ADDRESS_INFO}"></i></span>
                                <input name="server_address" placeholder="{$SERVER_ADDRESS}" id="InputAddress" value="{$SERVER_ADDRESS_VALUE}" class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="inputPort">{$SERVER_PORT}</label> <span class="badge badge-info"><i class="fa fa-question-circle" data-container="body" data-toggle="popover" data-placement="top" title="{$INFO}" data-content="{$SERVER_PORT_INFO}"></i></span>
                                <input name="server_port" placeholder="{$SERVER_PORT}" id="inputPort" value="25565" class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="InputParentServer">{$PARENT_SERVER}</label> <span class="badge badge-info"><i class="fa fa-question-circle" data-container="body" data-toggle="popover" data-placement="top" title="{$INFO}" data-content="{$PARENT_SERVER_INFO}"></i></span>
                                <select id="InputParentServer" class="form-control" name="parent_server">
                                    <option value="none" selected>{$NO_PARENT_SERVER}</option>
                                    {if count($AVAILABLE_PARENT_SERVERS)}
                                        {foreach from=$AVAILABLE_PARENT_SERVERS item=available_server}
                                            <option value="{$available_server->id|escape}">{$available_server->name|escape}</option>
                                        {/foreach}
                                    {/if}
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="inputBungeeInstance">{$BUNGEE_INSTANCE}</label> <span class="badge badge-info"><i class="fa fa-question-circle" data-container="body" data-toggle="popover" data-placement="top" title="{$INFO}" data-content="{$BUNGEE_INSTANCE_INFO}"></i></span>
                                <input type="hidden" name="bungee_instance" value="0">
                                <input id="inputBungeeInstance" name="bungee_instance" type="checkbox" class="js-switch" value="1"/>
                            </div>

                            <div class="form-group">
                                <label for="inputPre17">{$PRE_17}</label>
                                <input type="hidden" name="pre_17" value="0">
                                <input id="inputPre17" name="pre_17" type="checkbox" class="js-switch" value="1"/>
                            </div>

                            <h6>{$QUERY_INFORMATION}</h6>
                            <div class="form-group">
                                <label for="inputStatusQueryEnabled">{$ENABLE_STATUS_QUERY}</label> <span class="badge badge-info"><i class="fa fa-question-circle" data-container="body" data-toggle="popover" data-placement="top" data-html="true" title="{$INFO}" data-content="{$ENABLE_STATUS_QUERY_INFO}"></i></span>
                                <input type="hidden" name="status_query_enabled" value="0">
                                <input id="inputStatusQueryEnabled" name="status_query_enabled" type="checkbox" class="js-switch" value="1"/>
                            </div>
                            {if isset($SERVER_QUERY_INFORMATION)}
                                <div class="callout callout-info">
                                    <h5><i class="icon fa fa-info-circle"></i> {$INFO}</h5>
                                    {$SERVER_QUERY_INFORMATION}
                                </div>
                            {/if}
                            <div class="form-group">
                                <label for="inputQueryEnabled">{$ENABLE_PLAYER_LIST}</label> <span class="badge badge-info"><i class="fa fa-question-circle" data-container="body" data-toggle="popover" data-placement="top" data-html="true" title="{$INFO}" data-content="{$ENABLE_PLAYER_LIST_INFO}"></i></span>
                                <input type="hidden" name="query_enabled" value="0">
                                <input id="inputQueryEnabled" name="query_enabled" type="checkbox" class="js-switch" value="1"/>
                            </div>
                            <div class="form-group">
                                <label for="inputQueryPort">{$SERVER_QUERY_PORT}</label> <span class="badge badge-info"><i class="fa fa-question-circle" data-container="body" data-toggle="popover" data-placement="top" data-html="true" title="{$INFO}" data-content="{$SERVER_QUERY_PORT_INFO}"></i></span>
                                <input name="query_port" placeholder="{$SERVER_QUERY_PORT}" id="inputQueryPort" value="25565" class="form-control">
                            </div>
                            <hr />
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

    <div class="modal fade" id="cancelModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{$ARE_YOU_SURE}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    {$CONFIRM_CANCEL}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                    <a href="{$CANCEL_LINK}" class="btn btn-info">{$YES}</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ./wrapper -->

{include file='scripts.tpl'}

<script type="text/javascript">
    function showCancelModal(){
        $('#cancelModal').modal().show();
    }
</script>

</body>
</html>