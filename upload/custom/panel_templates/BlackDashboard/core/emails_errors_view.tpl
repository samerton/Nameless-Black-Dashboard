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
                            <h3 class="card-title">{$EMAIL_ERRORS}</h3>

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

                            <a class="btn btn-info" href="{$BACK_LINK}">{$BACK}</a>
                            <hr />

                            <h5>{$VIEWING_ERROR}</h5>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tr>
                                        <td>{$TYPE}</td>
                                        <td>{$TYPE_VALUE}</td>
                                    </tr>
                                    <tr>
                                        <td>{$DATE}</td>
                                        <td>{$DATE_VALUE}</td>
                                    </tr>
                                    <tr>
                                        <td>{$USERNAME}</td>
                                        <td>{$USERNAME_VALUE}</td>
                                    </tr>
                                    <tr>
                                        <td>{$CONTENT}</td>
                                        <td>{$CONTENT_VALUE}</td>
                                    </tr>
                                </table>
                            </div>

                            <h5>{$ACTIONS}</h5>

                            {if $TYPE_ID eq 1}
                                <a class="btn btn-secondary" href="{$VALIDATE_USER_LINK}">{$VALIDATE_USER_TEXT}</a>
                            {elseif $TYPE_ID eq 4}
                                <button class="btn btn-secondary" type="button" onclick="showRegistrationModal()">{$SHOW_REGISTRATION_LINK}</button>
                            {/if}

                            <a class="btn btn-info" href="#" onclick="showDeleteModal()">{$DELETE_ERROR}</a>

                        </div>
                    </div>

                    <!-- Spacing -->
                    <div style="height:1rem;"></div>

                </div>
            </div>
        </div>

        {include file='footer.tpl'}
    </div>

    <!-- Show registration link modal -->
    <div class="modal fade" id="registrationModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{$REGISTRATION_LINK}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    {$REGISTRATION_LINK_VALUE}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-info" data-dismiss="modal">{$CLOSE}</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Delete error modal -->
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
                    {$CONFIRM_DELETE_ERROR}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                    <a href="{$DELETE_ERROR_LINK}" class="btn btn-info">{$YES}</a>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- ./wrapper -->

{include file='scripts.tpl'}

<script type="text/javascript">
    function showDeleteModal(){
        $('#deleteModal').modal().show();
    }
    function showRegistrationModal(){
        $('#registrationModal').modal().show();
    }
</script>

</body>
</html>