{include file='header.tpl'}
<body>
<div class="wrapper wrapper-full-page">
    <div class="full-page login-page">
        <div class="col-lg-4 col-md-6 ml-auto mr-auto" style="padding-top:150px;">
            <div class="card card-login">
                <div class="card-header">
                    <h3 class="card-title">{$PLEASE_REAUTHENTICATE}</h3>
                </div>
                <div class="card-body">
                    {if isset($ERROR)}
                        <div class="alert alert-danger">
                            {$ERROR}
                        </div>
                    {/if}
                    <form action="" method="post">
                        {if isset($EMAIL)}
                            <div class="form-group has-feedback">
                                <input type="email" name="email" id="email" autocomplete="off" class="form-control" placeholder="{$EMAIL}">
                            </div>
                        {else}
                            <div class="form-group has-feedback">
                                <input type="text" name="username" id="username" autocomplete="off" class="form-control" placeholder="{$USERNAME}">
                            </div>
                        {/if}
                        <div class="form-group has-feedback">
                            <input type="password" name="password" id="password" class="form-control" placeholder="{$PASSWORD}">
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <input type="hidden" name="token" value="{$TOKEN}">
                                <button type="submit" class="btn btn-info btn-block btn-flat">{$SUBMIT}</button>
                            </div>
                            <div class="col-6">
                                <a href="{$SITE_HOME}" class="btn btn-danger btn-block btn-flat">{$CANCEL}</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

{include file='scripts.tpl'}

</body>
</html>
