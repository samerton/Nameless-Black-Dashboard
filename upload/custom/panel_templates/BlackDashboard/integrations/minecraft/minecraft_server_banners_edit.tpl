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
                        <h3 class="card-title">{$SERVER_NAME}</h3>

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
                            <label for="inputBanner">{$BANNER_BACKGROUND}</label>
                            <select name="banner" id="inputBanner" class="image-picker show-html">
                                {foreach from=$IMAGES item=image}
                                    <option data-img-src="{$image.src}" value="{$image.value}"{if $image.selected} selected{/if}>{$image.n}</option>
                                {/foreach}
                            </select>
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <input type="submit" class="btn btn-info" value="{$SUBMIT}">
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