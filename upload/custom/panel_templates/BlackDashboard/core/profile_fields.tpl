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
                        <h3 class="card-title">{$PROFILE_FIELDS}</h3>

                        <a class="btn btn-info" href="{$NEW_FIELD_LINK}">{$NEW_FIELD}</a>
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

                        {if count($FIELDS)}
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>{$FIELD_NAME}</th>
                                        <th>{$TYPE}</th>
                                        <th>{$REQUIRED}</th>
                                        <th>{$EDITABLE}</th>
                                        <th>{$PUBLIC}</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {foreach from=$FIELDS item=field}
                                        <tr>
                                            <td><a href="{$field.edit_link}">{$field.name}</a></td>
                                            <td>{$field.type}</td>
                                            <td>{if $field.required eq 1}<i class="fa fa-check-circle text-success"></i>{else}<i class="fa fa-times-circle text-danger"></i>{/if}</td>
                                            <td>{if $field.editable eq 1}<i class="fa fa-check-circle text-success"></i>{else}<i class="fa fa-times-circle text-danger"></i>{/if}</td>
                                            <td>{if $field.public eq 1}<i class="fa fa-check-circle text-success"></i>{else}<i class="fa fa-times-circle text-danger"></i>{/if}</td>
                                        </tr>
                                    {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        {else}
                            {$NO_FIELDS}
                        {/if}

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