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
                            <h3 class="card-title">{$NAVIGATION}</h3>

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
                                <div class="alert alert-info">
                                    <h5><i class="icon fa fa-info-circle"></i> {$INFO}</h5>
                                    <p>{$NAVBAR_ORDER_INSTRUCTIONS}</p>
                                    <p>{$NAVBAR_ICON_INSTRUCTIONS}</p>
                                </div>
                                {foreach from=$NAV_ITEMS key=key item=item}
                                    <strong>{$item.title|escape}</strong>

                                    <div class="form-group">
                                        <label for="input{$item.title|escape}">{$NAVBAR_ORDER}</label>
                                        <input type="number" min="1" class="form-control"
                                               id="input{$item.title|escape}"
                                               name="inputOrder[{if isset($item.custom) && is_numeric($item.custom)}{$item.custom}{else}{$key}{/if}]"
                                               value="{$item.order|escape}">
                                    </div>
                                    <div class="form-group">
                                        <label for="input{$item.title|escape}Icon">{$NAVBAR_ICON}</label>
                                        <input type="text" class="form-control"
                                               id="input{$item.title|escape}Icon"
                                               name="inputIcon[{if isset($item.custom) && is_numeric($item.custom)}{$item.custom}{else}{$key}{/if}]"
                                               value="{$item.icon|escape}">
                                    </div>

                                    {if isset($item.items) && count($item.items)}
                                        <strong>{$item.title|escape} &raquo; {$DROPDOWN_ITEMS}</strong><br />

                                        {foreach from=$item.items key=dropdown_key item=dropdown_item}
                                            <strong>{$dropdown_item.title|escape}</strong>

                                            <div class="form-group">
                                                <label for="input{$dropdown_item.title|escape}">{$NAVBAR_ORDER}</label>
                                                <input type="number" min="1" class="form-control" id="input{$dropdown_item.title|escape}" name="inputOrder[{if isset($dropdown_item.custom) && is_numeric($dropdown_item.custom)}{$dropdown_item.custom}{else}{$dropdown_key}{/if}]" value="{$dropdown_item.order|escape}">
                                            </div>

                                            <div class="form-group">
                                                <label for="input{$dropdown_item.title|escape}Icon">{$NAVBAR_ICON}</label>
                                                <input type="text" class="form-control"
                                                       id="input{$dropdown_item.title|escape}Icon"
                                                       name="inputIcon[{if isset($dropdown_item.custom) && is_numeric($dropdown_item.custom)}{$dropdown_item.custom}{else}{$dropdown_key}{/if}]"
                                                       value="{$dropdown_item.icon|escape}">
                                            </div>

                                        {/foreach}
                                    {/if}

                                {/foreach}
                                <div class="form-group">
                                    <input type="hidden" name="token" value="{$TOKEN}">
                                    <input type="submit" value="{$SUBMIT}" class="btn btn-info">
                                </div>
                            </form>

                        </div>
                    </div>

                    <!-- Spacing -->
                    <div style="height:1rem;"></div>

                </div>
            </div>
        </div>

        {include file='footer.tpl'}
    </div>
</div>
<!-- ./wrapper -->

{include file='scripts.tpl'}

</body>
</html>