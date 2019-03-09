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
                        <h3 class="card-title">{$PERMISSIONS}</h3>
                        <a class="btn btn-info" href="{$BACK_LINK}">{$BACK}</a>
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
                            {foreach from=$ALL_PERMISSIONS key=key item=item}
                                <div class="table-responsive">
                                    <table id="{$key|escape}" class="table table-striped">
                                        <colgroup>
                                            <col span="1" style="width:70%">
                                            <col span="1" style="width:30%">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th>{$key|escape}</th>
                                            <th><a href="#" onclick="selectAllPerms('{$key|escape}'); return false;">{$SELECT_ALL}</a> | <a href="#" onclick="deselectAllPerms('{$key|escape}'); return false;">{$DESELECT_ALL}</a></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        {foreach from=$item key=permission item=title}
                                            <tr>
                                                <td>{$title}</td>
                                                <td><input type="checkbox" name="permissions[{$permission|escape}]" class="js-switch" value="1"{if is_array($PERMISSIONS_VALUES) && array_key_exists($permission|escape, $PERMISSIONS_VALUES)} checked{/if} ></td>
                                            </tr>
                                        {/foreach}
                                        </tbody>
                                    </table>
                                </div>
                            {/foreach}

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

<script type="text/javascript">
    function selectAllPerms(section){
        var table= $('table#' + section);
        table.find('tbody tr td .js-switch').each(function () {
            $(this).prop('checked', true);
            onChange(this);
        });
        return false;
    }
    function deselectAllPerms(section){
        var table= $('table#' + section);
        table.find('tbody tr td .js-switch').each(function () {
            $(this).prop('checked', false);
            onChange(this);
        });
        return false;
    }
    function onChange(el) {
        if (typeof Event === 'function' || !document.fireEvent) {
            var event = document.createEvent('HTMLEvents');
            event.initEvent('change', true, true);
            el.dispatchEvent(event);
        } else {
            el.fireEvent('onchange');
        }
    }
</script>

</body>
</html>