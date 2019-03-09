{include file='header.tpl'}
<body>
<div class="wrapper">
    {include file='sidebar.tpl'}

    <div class="main-panel">
        {include file='navbar.tpl'}

        <div class="content">
            <div class="container-fluid">
                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title">{$UPDATE}</h3>

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

                        {if isset($NEW_UPDATE)}
                        {if $NEW_UPDATE_URGENT eq true}
                        <div class="alert alert-danger">
                            {else}
                            <div class="alert alert-primary">
                                {/if}
                                {$NEW_UPDATE}
                                <hr />
                                {$CURRENT_VERSION}<br />
                                {$NEW_VERSION}
                            </div>

                            <h4>{$INSTRUCTIONS}</h4>
                            <p>{$INSTRUCTIONS_VALUE}</p>
                            <hr />

                            <a href="{$DOWNLOAD_LINK}" class="btn btn-primary">{$DOWNLOAD}</a>
                            <button class="btn btn-info" type="button" onclick="showConfirmModal()">{$UPDATE}</button>
                            {else}
                            <div class="alert alert-success">
                                <h5><i class="icon fa fa-check"></i> {$UP_TO_DATE}</h5>
                            </div>
                            <a href="{$CHECK_AGAIN_LINK}" class="btn btn-info">{$CHECK_AGAIN}</a>
                            {/if}

                        </div>
                    </div>

                    <!-- Spacing -->
                    <div style="height:1rem;"></div>

                </div>
        </div>

        {include file='footer.tpl'}
    </div>

    <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{$WARNING}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    {$INSTALL_CONFIRM}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$CANCEL}</button>
                    <a href="{$UPGRADE_LINK}" class="btn btn-info">{$UPDATE}</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ./wrapper -->

{include file='scripts.tpl'}

<script type="text/javascript">
    function showConfirmModal(){
        $('#confirmModal').modal().show();
    }
</script>

</body>
</html>