{include file='header.tpl'}
<body class="hold-transition sidebar-mini">
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
                        <h3 class="card-title">{$NEXTYLE}</h3>

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

                        <form class='form-group' method='post'>
                            <label for='Theme'>{$NAV_THEME}</label>
                            <select id="Theme" class='form-control' name='theme'>
                                <option value='red'{if $NAV_THEME_VALUE eq 'red'} selected{/if}>{$RED}</option>
                                <option value='blue'{if $NAV_THEME_VALUE eq 'blue'} selected{/if}>{$BLUE}</option>
                                <option value='gold'{if $NAV_THEME_VALUE eq 'gold'} selected{/if}>{$GOLD}</option>
                            </select>
                            <br>
                            <label for='bg'>{$HEADER_BG}</label>
                            <input type='text' name='bg' value='{$HEADER_BG_VALUE}' class='form-control' placeholder="{$HEADER_BG}">
                            <br>
                            <label for='logo'>{$LOGO}</label>
                            <input type='text' name='logo' value='{$LOGO_VALUE}' class='form-control' placeholder='{$LOGO}'>
                            <input type='hidden' name='view' value='update'>
                            <hr>
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <button type='submit' class='btn btn-info'>{$SUBMIT}</button>
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