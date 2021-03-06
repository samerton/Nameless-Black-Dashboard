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
                        <h3 class="card-title">{$EDITING_REACTION}</h3>

                        <a href="#" class="btn btn-warning" onclick="showCancelModal()">{$CANCEL}</a>
                        <a href="#" class="btn btn-danger" onclick="showDeleteModal()">{$DELETE}</a>
                        <hr />

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
                            <div class="form-group">
                                <label for="InputReactionName">{$NAME}</label>
                                <input type="text" class="form-control" name="name"
                                       id="InputReactionName"
                                       placeholder="{$NAME}"
                                       value="{$NAME_VALUE}">
                            </div>

                            <div class="form-group">
                                <label for="InputReactionHTML">{$HTML}</label>
                                <input type="text" class="form-control" name="html"
                                       id="InputReactionHTML"
                                       placeholder="{$HTML}"
                                       value="{$HTML_VALUE}">
                            </div>

                            <div class="form-group">
                                <label for="InputReactionType">{$TYPE}</label>
                                <select name="type" class="form-control" id="InputReactionType">
                                    <option value="2"{if $TYPE_VALUE eq 2} selected{/if}>{$POSITIVE}</option>
                                    <option value="1"{if $TYPE_VALUE eq 1} selected{/if}>{$NEUTRAL}</option>
                                    <option value="-1"{if $TYPE_VALUE eq 0} selected{/if}>{$NEGATIVE}</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="InputEnabled">{$ENABLED}</label>
                                <input id="InputEnabled" type="checkbox" name="enabled" class="js-switch"{if $ENABLED_VALUE eq 1} checked{/if} />
                            </div>

                            <div class="form-group">
                                <input type="hidden" name="token"
                                       value="{$TOKEN}">
                                <input type="submit"
                                       value="{$SUBMIT}"
                                       class="btn btn-info">
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

    <!-- Cancel modal -->
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

    <!-- Delete modal -->
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
                    {$CONFIRM_DELETE}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                    <a href="{$DELETE_LINK}" class="btn btn-info">{$YES}</a>
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
    function showDeleteModal(){
        $('#deleteModal').modal().show();
    }
</script>

</body>
</html>