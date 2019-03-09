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
                        <h3 class="card-title">{$ERROR_LOGS}</h3>

                        <a href="{$BACK_LINK}" class="btn btn-info">{$BACK}</a>

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

                        <div class="table-responsive">
                            <table class="table table-striped">
                                <tr>
                                    <td>
                                        <a href="{$FATAL_LOG_LINK}">{$FATAL_LOG}</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="{$NOTICE_LOG_LINK}">{$NOTICE_LOG}</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="{$WARNING_LOG_LINK}">{$WARNING_LOG}</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="{$OTHER_LOG_LINK}">{$OTHER_LOG}</a>
                                    </td>
                                </tr>
                            </table>
                        </div>

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