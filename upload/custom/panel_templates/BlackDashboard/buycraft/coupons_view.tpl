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
                            <h5 style="display:inline">{$VIEWING_COUPON}</h5>
                            <div class="float-md-right">
                                <a href="{$BACK_LINK}" class="btn btn-primary">{$BACK}</a>
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

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <colgroup>
                                        <col span="1" style="width: 50%">
                                        <col span="1" style="width: 50%">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <td><strong>{$COUPON_CODE}</strong></td>
                                        <td>{$COUPON_CODE_VALUE}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>{$COUPON_NOTE}</strong></td>
                                        <td>{$COUPON_NOTE_VALUE}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>{$EFFECTIVE_ON}</strong></td>
                                        <td>{$EFFECTIVE_ON_VALUE}</td>
                                    </tr>
                                    {if $EFFECTIVE_ON_TYPE == 'packages'}
                                        <tr>
                                            <td><strong>{$PACKAGES}</strong></td>
                                            <td>{if count($TEMPLATE_PACKAGES)}{foreach from=$TEMPLATE_PACKAGES item=package name=packages}{$package}{if not $smarty.foreach.packages.last}, {/if}{/foreach}{/if}</td>
                                        </tr>
                                    {elseif $EFFECTIVE_ON_TYPE == 'categories'}
                                        <tr>
                                            <td><strong>{$CATEGORIES}</strong></td>
                                            <td>{if count($TEMPLATE_CATEGORIES)}{foreach from=$TEMPLATE_CATEGORIES item=category name=categories}{$category}{if not $smarty.foreach.categories.last}, {/if}{/foreach}{/if}</td>
                                        </tr>
                                    {/if}
                                    </tbody>
                                </table>
                            </div>

                            <div class="callout callout-info">
                                <h5><i class="icon fa fa-info-circle"></i> {$INFO}</h5>
                                {$UNBAN_IN_BUYCRAFT}
                            </div>

                        </div>
                    </div>

                    <!-- Spacing -->
                    <div style="height:1rem;"></div>

                </div>
        </section>
    </div>

    {include file='footer.tpl'}

</div>
<!-- ./wrapper -->

{include file='scripts.tpl'}

</body>
</html>