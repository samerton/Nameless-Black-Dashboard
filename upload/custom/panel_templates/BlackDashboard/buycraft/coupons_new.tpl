{include file='header.tpl'}
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    {include file='navbar.tpl'}
    {include file='sidebar.tpl'}

    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">{$COUPONS}</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                            <li class="breadcrumb-item active">{$BUYCRAFT}</li>
                            <li class="breadcrumb-item active">{$COUPONS}</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main content -->
        <section class="content">
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
                            <h5 style="display:inline">{$CREATING_COUPON}</h5>
                            <div class="float-md-right">
                                <button role="button" class="btn btn-warning" onclick="showCancelModal()">{$CANCEL}</button>
                            </div>
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

                            {if isset($NO_COUPONS)}
                                <p>{$NO_COUPONS}</p>
                            {else}
                                <div class="table-responsive">
                                    <table class="table table-bordered dataTables-bans">
                                        <colgroup>
                                            <col span="1" style="width: 35%;">
                                            <col span="1" style="width: 30%;">
                                            <col span="1" style="width: 20%">
                                            <col span="1" style="width: 15%">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th>{$COUPON_CODE}</th>
                                            <th>{$EXPIRY_DATE_TABLE}</th>
                                            <th>{$USES}</th>
                                            <th>{$VIEW}</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        {foreach from=$COUPON_LIST item=coupon}
                                            <tr>
                                                <td>{$coupon.code}</td>
                                                <td>{$coupon.expiry}</td>
                                                <td>{$coupon.limit}</td>
                                                <td>
                                                    <a href="{$coupon.link}" class="btn btn-primary">{$VIEW}</a>
                                                </td>
                                            </tr>
                                        {/foreach}
                                        </tbody>
                                    </table>
                                </div>
                            {/if}

                        </div>
                    </div>

                    <!-- Spacing -->
                    <div style="height:1rem;"></div>

                </div>
        </section>
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
                    <a href="{$CANCEL_LINK}" class="btn btn-primary">{$YES}</a>
                </div>
            </div>
        </div>
    </div>

    {include file='footer.tpl'}

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