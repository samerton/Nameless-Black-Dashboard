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
                        <h3 class="card-title">{$EDITING_WIDGET}</h3>

                        {if isset($SETTINGS)}<a href="{$SETTINGS_LINK}" class="btn btn-info">{$SETTINGS}</a>{/if}
                        <a href="{$BACK_LINK}" class="btn btn-warning">{$BACK}</a>
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
                            {foreach from=$POSSIBLE_PAGES key=module item=module_pages}
                                {if count($module_pages)}
                                    <div class="table table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                            <tr>
                                                <th>{$module|escape}</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            {foreach from=$module_pages key=page item=value}
                                                <tr>
                                                    <td>
                                                        <label for="{$page|escape}">{($page|escape)|ucfirst}</label>
                                                        <input class="js-switch" type="checkbox" name="pages[]" id="{$page|escape}" value="{$page|escape}"{if in_array($page, $ACTIVE_PAGES)} checked{/if} >
                                                    </td>
                                                </tr>
                                            {/foreach}
                                            </tbody>
                                        </table>
                                    </div>
                                {/if}
                            {/foreach}

                            <div class="form-group">
                                <label for="inputOrder">{$WIDGET_ORDER}</label>
                                <input id="inputOrder" name="order" type="number" class="form-control" value="{$ORDER}">
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
</div>
<!-- ./wrapper -->

{include file='scripts.tpl'}

</body>
</html>